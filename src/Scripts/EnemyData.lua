-- Contains generic functions to handle migrating enemy data from Hades to Hades II

-- Loads EnemyData from a file in Hades
-- Note: Must be loaded before EncounterData, as there are some references to it in EncounterData!
local function LoadHadesEnemyData()
	local originalUnitSetDataEnemies = game.DeepCopyTable(game.UnitSetData.Enemies)
	local originalEnemyData = game.DeepCopyTable(game.EnemyData)
	local originalStatusAnimations = game.DeepCopyTable(game.StatusAnimations)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts\\EnemyData.lua")
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		local hadesEnemyData = UnitSetData.Enemies
		game.UnitSetData.Enemies = originalUnitSetDataEnemies
		game.EnemyData = originalEnemyData
		game.StatusAnimations = originalStatusAnimations
		return hadesEnemyData
	else
		mod.DebugPrint("Error loading enemyData: " .. err, 1)
	end
end

-- Applies modifications to base enemy objects, and then adds the new encounter objects to the game
local function ApplyModificationsAndInheritEnemyData(base, modifications, replacements, enemyKeyReplacements)
	-- Rename keys if the enemy is in EnemyNameMappings
	for oldKey, newKey in pairs(mod.EnemyNameMappings) do
		if modifications[oldKey] then
			modifications[newKey] = modifications[oldKey]
			modifications[oldKey] = nil
			mod.DebugPrint("Renamed enemy modification " .. oldKey .. " to " .. newKey .. " in EnemyDataHandler", 4)
		end
		if replacements[oldKey] then
			replacements[newKey] = replacements[oldKey]
			replacements[oldKey] = nil
			mod.DebugPrint("Renamed enemy replacement " .. oldKey .. " to " .. newKey .. " in EnemyDataHandler", 4)
		end
	end

	-- Apply replacements
	for enemyName, enemyData in pairs(replacements) do
		if not base[enemyName] then
			base[enemyName] = {}
		end
		mod.ApplyModifications(base[enemyName], enemyData, true)
	end

	-- Apply modifications
	for enemyName, enemyData in pairs(modifications) do
		if not base[enemyName] then
			base[enemyName] = {}
		end
		mod.ApplyModifications(base[enemyName], enemyData)
	end

	-- Process data inheritance and add the new data to the game's global
	base = mod.AddTableKeysSkipDupes(game.EnemyData, base, nil)

	for enemyName, enemyData in pairs(base) do
		-- Replace keys that were renamed between the games
		mod.RenameKeys(enemyData, enemyKeyReplacements, enemyName)

		-- Increase health and armour for slightly increased difficulty
		if enemyData.MaxHealth then
			enemyData.MaxHealth = enemyData.MaxHealth * 1.15
		end
		if enemyData.HealthBuffer then
			enemyData.HealthBuffer = enemyData.HealthBuffer * 1.2
		end

		game.ProcessDataInheritance(enemyData, game.EnemyData)

		base[enemyName] = enemyData
	end
	-- Don't skip duplicates, since we have already added all the new data before
	-- AddTableKeysSkipDupes also removed duplicates from base, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.EnemyData, base)
end

local enemyData = LoadHadesEnemyData()
-- Breaks spawning Skelly, as it adds invalid conversations to the enemy
-- Somehow doesn't work if set to mod.NilValue in enemyReplacements
enemyData.TrainingMelee = nil

-- Some enemies exist in both Hades and Hades II, so we need to rename the Hades enemies
for oldName, newName in pairs(mod.EnemyNameMappings) do
	if enemyData[oldName] then
		enemyData[newName] = enemyData[oldName]
		enemyData[oldName] = nil
		mod.DebugPrint("Renamed enemy: " .. oldName .. " to " .. newName .. " in EnemyData.lua", 4)
	end
	-- Update the name in dependent fields
	-- Inherit properties from this name
	mod.UpdateField(enemyData, oldName, newName, { "InheritFrom" }, "EnemyData.lua")
	-- If an enemy is spawned, this enemy cannot spawn
	mod.UpdateField(enemyData, oldName, newName, { "GeneratorData", "BlockEnemyTypes" }, "EnemyData.lua")
	-- Other enemies can spawn this enemy
	mod.UpdateField(enemyData, oldName, newName, { "SpawnOptions" }, "EnemyData.lua")
end
-- For renamed weapon names
for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	mod.UpdateField(enemyData, oldName, newName, { "WeaponOptions" }, "EnemyData.lua")
end

-- Some enemies need to be modified so much, it's easier to redefine them
-- This is true for most traps
mod.ModifyEnemyTrapData(enemyData)

-- Replaces the key with the new value instead of modifying
local enemyReplacements = {
	BaseSpawner = {
		-- SpawnerAI doesn't exist, spawn logic is in the weapon
		AIOptions = { "AttackerAI", },
	},
	-- Copy paste the enemy in Hades II, but replace some animations and effects in modifications
	BloodlessGrenadierElite = game.DeepCopyTable(game.EnemyData.BloodlessGrenadier_Elite),
}

-- Note: Modifications to Base enemy types (which are inherited from by other new enemy types) don't seem to work - need to apply the modifications to the resulting enemy directly
local enemyModifications = {
	-- TARTARUS
	BaseGlutton = {
		LargeUnitCap = mod.NilValue,
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInWretchGluttonContainer",
	},
	PunchingBagUnit = {
		StunAnimations = { Default = "EnemyWretchGluttonOnHit" },
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInWretchGluttonContainer",
	},
	BaseThug = {
		LargeUnitCap = mod.NilValue,
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInWretchThugContainer",
	},
	HeavyMelee = {
		StunAnimations = { Default = "EnemyWretchThugOnHit" },
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInWretchThugContainer",
	},
	DisembodiedHand = {
		StunAnimations = { Default = "EnemyWringerOnHit" },
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInDisembodiedHandContainer",
	},
	BaseCaster = {
		AIAggroRange = 1250,
		LargeUnitCap = mod.NilValue,
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInWretchCasterContainer",
	},
	LightRanged = {
		StunAnimations = { Default = "EnemyWretchCasterOnHit" },
		-- TODO: Maybe take the Hades LightRanged data instead, as LightRanged is a TestEnemy in Hades II
		DefaultAIData = game.DeepCopyTable(game.EnemyData.LightRanged.DefaultAIData),
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInWretchCasterContainer",
	},
	BaseThief = {
		ActivateFx = "EnemySummonRuneSmall",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInThiefMineLayerContainer",
	},
	ThiefMineLayer = {
		StunAnimations = { Default = "EnemyWretchThiefOnHit" },
		DefaultAIData = game.DeepCopyTable(game.EnemyData.ThiefMineLayer.DefaultAIData),
		ActivateFx = "EnemySummonRuneSmall",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInThiefMineLayerContainer",
	},
	ThiefMineLayerElite = {
		DefaultAIData = game.DeepCopyTable(game.EnemyData.ThiefMineLayer_Elite.DefaultAIData),
		ActivateFx = "EnemySummonRuneSmall",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInThiefMineLayerContainer",
	},
	HeavyRanged = {
		StunAnimations = { Default = "HeavyRangedCrystal4" },
		DeathAnimation = "HeavyRangedCrystal4Shatter",
		DeathFx = "HeavyRangedCrystal4Shatter",
		Tethers = {
			[1] = { Distance = 20 },
			[2] = { Distance = 20 },
			[3] = { Distance = 20 }
		},
		SpawnEvents = {
			{
				FunctionName = "CreateTethers",
				Threaded = true,
			},
		},
		-- Setting DestroyDelay to 0, as otherwise the crystal shine sticks around after the enemy dies
		DestroyDelay = 0,
		-- This doesn't work, as there is no (correct) obstacle/animation in ObstacleData
		-- SpawnObstaclesOnDeath = { ... }
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInHeavyRangedContainer",
	},
	HeavyRangedSplitterMiniboss = {
		StunAnimations = { Default = "HeavyRangedSplitterCrystalHit", },
		DeathFx = "EnemyDeathFx",
		DeathGraphic = "HeavyRangedSplitterCrystalDeath",
		ActivateFx = "EnemySummonRuneExtraLarge",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInHeavyRangedSplitterContainer",
		SpawnEvents = {
			{
				FunctionName = "CreateTethers",
				Threaded = true,
			},
		},
	},
	-- TODO: When it gets thrown for the spawn, it disappears
	-- TODO: Instantly locks on to the player and has perfect tracking
	HeavyRangedSplitterFragment = {
		StunAnimations = { Default = "HeavyRangedSplitterFragment", },
		DeathFx = "HeavyRangedSplitterFragmentDeath",
		DeathGraphic = "HeavyRangedSplitterFragmentDeath",
		ActivateFx = "nil",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivate",
	},
	Swarmer = {
		StunAnimations = {
			Default = "EnemyWretchSwarmerAlert",
		},
		DeathAnimation = "EnemyWretchSwarmerDeathVFX",
		DeathFx = "EnemyDeathFx_Small",
		DestroyDelay = 0.9,
		WeaponOptions = { "HadesSwarmerMelee" },
		ActivateFx = "EnemySummonRuneSmall",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInWretchSwarmerContainer",
	},
	LightSpawner = {
		-- Makes sure we call the modded SpawnerAI function instead of HandleSpawnerBurst
		IsModdedHadesEnemy = true,
		StunAnimations = { Default = "SpawnerAttackAnim", },
		DeathFx = "BreakableDeathAnim",
		DeathGraphic = "SpawnerDeath",
		-- DestroyDelay = 0.9,
		WeaponOptions = { "HadesLightSpawnerSpawnerWeapon" },
		DefaultAIData = { DeepInheritance = true, },
		OnDamagedFunctionName = "AggroSpawns",
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateAnimation = "EnemyActivationFadeInLightSpawnerContainer",
	},

	-- ASPHODEL
	BloodlessGrenadierElite = {
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
	},

	-- These enemies have not been implemented yet
	Chariot = {
		LargeUnitCap = mod.NilValue,
	},
	ChariotSuicide = {
		LargeUnitCap = mod.NilValue,
	},
	BloodlessNaked = {
		LargeUnitCap = mod.NilValue,
	},
	BloodlessNakedBerserker = {
		LargeUnitCap = mod.NilValue,
	},
	BloodlessWaveFist = {
		LargeUnitCap = mod.NilValue,
	},
	BloodlessGrenadier = {
		LargeUnitCap = mod.NilValue,
	},
	BloodlessSelfDestruct = {
		LargeUnitCap = mod.NilValue,
	},
	BloodlessPitcher = {
		LargeUnitCap = mod.NilValue,
	},
	SatyrRanged = {
		LargeUnitCap = mod.NilValue,
	},
	SatyrRangedMiniboss = {
		LargeUnitCap = mod.NilValue,
	},
	RatThug = {
		LargeUnitCap = mod.NilValue,
	},

	-- ENVIRONMENT
	Breakable = {
		CannotDieFromDamage = true,
		OnDamagedFunctionName = "BreakableOnHitModsNikkelMHadesBiomes",
		DeathAnimation = "BreakableDeathAnim",
		DeathSound = "/SFX/CeramicPotSmash",
		SetupEvents = {
			{
				FunctionName = "RandomizeObject",
				Args = {
					RandomizeSets = {
						{
							Animation = { "BreakableIdle1" },
						},
						{
							Animation = { "BreakableIdle2" },
						},
						{
							Animation = { "BreakableIdle3" },
						},
					},
				},
			},
		},
	},
}

local renamedEnemyModifications = {}
for oldName, newName in pairs(mod.EnemyNameMappings) do
	if enemyModifications[oldName] then
		renamedEnemyModifications[newName] = enemyModifications[oldName]
		enemyModifications[oldName] = nil
		mod.DebugPrint("Renamed enemy modification: " .. oldName .. " to " .. newName .. " in EnemyDataHandler", 4)
	end
end
for key, value in pairs(renamedEnemyModifications) do
	enemyModifications[key] = value
end

-- Some keys were renamed in the DefaultAIData property
local enemyKeyReplacements = {
	DefaultAIData = {
		AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
		AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
		AILineOfSightBuffer = "LoSBuffer",
		AIRequireUnitLineOfSight = "RequireUnitLoS",
		AIRequireProjectileLineOfSight = "RequireProjectileLoS",
		AILineOfSighEndBuffer = "LoSEndBuffer",
		AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
		AITrackTargetDuringCharge = "TrackTargetDuringCharge",
		AIAttackDistance = "AttackDistance",
		AIFireTicksMin = "FireTicksMin",
		AIFireTicksMax = "FireTicksMax",
		AIFireTicksCooldown = "FireInterval",
		AIBufferDistance = "RetreatBufferDistance",
		StandOffTime = "SurroundRefreshInterval",
	},
}

ApplyModificationsAndInheritEnemyData(enemyData, enemyModifications, enemyReplacements, enemyKeyReplacements)
