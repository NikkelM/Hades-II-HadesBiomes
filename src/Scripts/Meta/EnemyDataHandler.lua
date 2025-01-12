-- Contains generic functions to handle migrating enemy data from Hades to Hades II

-- Loads EnemyData from a file in Hades
-- Note: Must be loaded before EncounterData, as there are some references to it in EncounterData!
local function LoadHadesEnemyData()
	local originalEnemyData = game.DeepCopyTable(game.EnemyData)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts\\EnemyData.lua")
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		local hadesEnemyData = UnitSetData.Enemies
		game.EnemyData = originalEnemyData
		return hadesEnemyData
	else
		mod.DebugPrint("Error loading enemyData: " .. err)
	end
end


-- Applies modifications to base enemy objects, and then adds the new encounter objects to the game
local function ApplyModificationsAndInheritEnemyData(base, modifications, replacements, AIDataKeyReplacements)
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
		if enemyData.DefaultAIData then
			for oldKey, newKey in pairs(AIDataKeyReplacements) do
				if enemyData.DefaultAIData[oldKey] then
					enemyData.DefaultAIData[newKey] = enemyData.DefaultAIData[oldKey]
					enemyData.DefaultAIData[oldKey] = nil
				end
			end
		end

		game.ProcessDataInheritance(enemyData, game.EnemyData)

		base[enemyName] = enemyData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.EnemyData, base)
end

local enemyData = LoadHadesEnemyData()

-- Some enemies exist in both Hades and Hades II, so we need to rename the Hades enemies
for oldName, newName in pairs(mod.EnemyNameMappings) do
	if enemyData[oldName] then
		enemyData[newName] = enemyData[oldName]
		enemyData[oldName] = nil
		mod.DebugPrint("Renamed enemy: " .. oldName .. " to " .. newName .. " in EnemyData.lua")
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

local enemyReplacements = {
	BaseSpawner = {
		-- SpawnerAI doesn't exist, spawn logic is in the weapon
		AIOptions = { "AttackerAI", },
	},
}

-- Note: Modifications to Base enemy types (which are inherited from by other new enemy types) don't seem to work - need to apply the modifications to the resulting enemy directly
local enemyModifications = {
	BaseGlutton = {
		LargeUnitCap = mod.NilValue,
	},
	PunchingBagUnit = {
		-- Comes from the CharacterAnimationsEnemies.sjson entry which has the OnHit_Bink as VideoTexture
		StunAnimations = { Default = "EnemyWretchGluttonOnHit" },
	},
	BaseThug = {
		LargeUnitCap = mod.NilValue,
	},
	HeavyMelee = {
		StunAnimations = { Default = "EnemyWretchThugOnHit" },
	},
	DisembodiedHand = {
		StunAnimations = { Default = "EnemyWringerOnHit" },
	},
	BaseCaster = {
		AIAggroRange = 1250,
		LargeUnitCap = mod.NilValue,
	},
	-- LightRanged renamed
	HadesLightRanged = {
		StunAnimations = { Default = "EnemyWretchCasterOnHit" },
		DefaultAIData = game.DeepCopyTable(game.EnemyData.LightRanged.DefaultAIData),
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
		-- Setting DestroyDelay to 0, as otherwise the crystal shine sticks around after the enemy dies
		DestroyDelay = 0,
		-- This doesn't work, as there is no (correct) obstacle/animation in ObstacleData
		-- SpawnObstaclesOnDeath = { ... }
	},
	-- Swarmer renamed
	HadesSwarmer = {
		StunAnimations = {
			Default = "EnemyWretchSwarmerAlert",
		},
		DeathAnimation = "EnemyWretchSwarmerDeathVFX",
		DeathFx = "EnemyDeathFx_Small",
		DestroyDelay = 0.9,
		WeaponOptions = { "HadesSwarmerMelee" }
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
}

-- Some keys were renamed in the DefaultAIData property
local DefaultAIDataKeyReplacements = {
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
	StandOffTime = "SurroundRefreshInterval",
}

ApplyModificationsAndInheritEnemyData(enemyData, enemyModifications, enemyReplacements, DefaultAIDataKeyReplacements)
