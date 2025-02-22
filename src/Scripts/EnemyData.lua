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

		-- Do replacements that can be done the same way for multiple enemies
		if enemyData.Portrait then
			enemyData.BoxAnimation = "DialogueSpeechBubbleLight"
			enemyData.BoxExitAnimation = "DialogueSpeechBubbleLightOut"
			enemyData.NarrativeTextColor = game.Color.DialogueTextLight
			enemyData.NameplateSpeakerNameColor = game.Color.DialogueSpeakerNameOlympian
			enemyData.NameplateDescriptionColor = { 145, 45, 90, 255 }
		end

		-- Dialogues playing before boss fights
		local bossPresentationProperties = {
			"BossPresentationSuperPriorityIntroTextLineSets",
			"BossPresentationPriorityIntroTextLineSets",
			"BossPresentationIntroTextLineSets",
			"BossPresentationTextLineSets",
			"BossPresentationRepeatableTextLineSets"
		}
		for _, property in ipairs(bossPresentationProperties) do
			if enemyData[property] then
				for key, textLineSet in pairs(enemyData[property]) do
					textLineSet.Name = key
				end
			end
		end

		-- AIStage functionality has been changed, so we need to call a modded handler
		if enemyData.AIStages then
			for _, aiStage in ipairs(enemyData.AIStages) do
				aiStage.ThreadedEvents = { { FunctionName = "NikkelMHadesBiomesBossAIStageHandler", } }
			end
		end

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
-- Modified BaseVulnerableEnemy for all Hades enemies
enemyData.BaseVulnerableEnemy = game.DeepCopyTable(game.EnemyData.BaseVulnerableEnemy)
-- Modified BaseVulnerableEnemy just for Hades bosses, which need some modifications
enemyData.HadesBossBaseVulnerableEnemy = game.DeepCopyTable(game.EnemyData.BaseVulnerableEnemy)

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
-- This is done AFTER data inheritance is processed
local enemyReplacements = {
	BaseVulnerableEnemy = {
		DestroyDelay = mod.NilValue,
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
	},
	HadesBossBaseVulnerableEnemy = {
		DestroyDelay = mod.NilValue,
		DefaultAIData = {
			DeepInheritance = true,
			MoveWithinRange = false,
			StopMoveWithinRange = false,
			DontRetreatIfCharmed = false,
			PreAttackAngleTowardTarget = true,
			PreAttackStop = false,
			PreAttackEndStop = false,
			PostAttackStop = false,
		},
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
	},

	-- TARTARUS
	BaseSpawner = {
		-- SpawnerAI doesn't exist, spawn logic is in the weapon
		AIOptions = { "AttackerAI", },
	},
	-- Copy paste the enemy in Hades II, but replace some animations and effects in modifications
	BloodlessGrenadierElite = game.DeepCopyTable(game.EnemyData.BloodlessGrenadier_Elite),
	-- Setting this to an empty table in the enemy doesn't work, so resetting the keys that break the animations here
	Harpy = {
		InheritFrom = { "BaseBossEnemy", "HadesBossBaseVulnerableEnemy" },
	},
}

-- Note: Modifications to Base enemy types (which are inherited from by other new enemy types) don't seem to work - need to apply the modifications to the resulting enemy directly
local enemyModifications = {
	-- TARTARUS
	BaseGlutton = {
		LargeUnitCap = mod.NilValue,
	},
	PunchingBagUnit = {
		StunAnimations = { Default = "EnemyWretchGluttonOnHit" },
		ActivateAnimation = "EnemyActivationFadeInWretchGluttonContainer",
	},
	BaseThug = {
		LargeUnitCap = mod.NilValue,
		ActivateAnimation = "EnemyActivationFadeInWretchThugContainer",
	},
	HeavyMelee = {
		StunAnimations = { Default = "EnemyWretchThugOnHit" },
		ActivateAnimation = "EnemyActivationFadeInWretchThugContainer",
	},
	DisembodiedHand = {
		StunAnimations = { Default = "EnemyWringerOnHit" },
		ActivateAnimation = "EnemyActivationFadeInDisembodiedHandContainer",
	},
	BaseCaster = {
		AIAggroRange = 1250,
		LargeUnitCap = mod.NilValue,
		ActivateFx = "EnemySummonRuneMedium",
		ActivateAnimation = "EnemyActivationFadeInWretchCasterContainer",
	},
	LightRanged = {
		StunAnimations = { Default = "EnemyWretchCasterOnHit" },
		DefaultAIData = game.DeepCopyTable(game.EnemyData.LightRanged.DefaultAIData),
		ActivateFx = "EnemySummonRuneMedium",
		ActivateAnimation = "EnemyActivationFadeInWretchCasterContainer",
	},
	BaseThief = {
		ActivateFx = "EnemySummonRuneSmall",
		ActivateAnimation = "EnemyActivationFadeInThiefMineLayerContainer",
	},
	ThiefMineLayer = {
		StunAnimations = { Default = "EnemyWretchThiefOnHit" },
		DefaultAIData = {
			AttackWhileBlendingIntervalMin = 2.0,
			AttackWhileBlendingIntervalMax = 2.5,
			PostAttackDuration = 0.75,
		},
		ActivateFx = "EnemySummonRuneSmall",
		ActivateAnimation = "EnemyActivationFadeInThiefMineLayerContainer",
	},
	ThiefMineLayerElite = {
		DefaultAIData = {
			AttackWhileBlendingIntervalMin = 1.5,
			AttackWhileBlendingIntervalMax = 2.0,
			PostAttackDuration = 0.5,
		},
		ActivateFx = "EnemySummonRuneSmall",
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
		-- This doesn't work, as there is no (correct) obstacle/animation in ObstacleData
		-- SpawnObstaclesOnDeath = { ... }
		ActivateFx = "EnemySummonRuneMedium",
		ActivateAnimation = "EnemyActivationFadeInHeavyRangedContainer",
	},
	HeavyRangedSplitterMiniboss = {
		StunAnimations = { Default = "HeavyRangedSplitterCrystalHit", },
		DeathFx = "EnemyDeathFx",
		DeathGraphic = "HeavyRangedSplitterCrystalDeath",
		ActivateFx = "EnemySummonRuneExtraLarge",
		ActivateAnimation = "EnemyActivationFadeInHeavyRangedSplitterContainer",
		SpawnEvents = {
			{
				FunctionName = "CreateTethers",
				Threaded = true,
			},
		},
		OnDeathFunctionName = "ModsNikkelMHadesBiomesMiniBossHeavyRangedSplitterDeath",
		BlockRaiseDead = true,
	},
	HeavyRangedSplitterFragment = {
		StunAnimations = { Default = "HeavyRangedSplitterFragment", },
		DeathFx = "HeavyRangedSplitterFragmentDeath",
		DeathGraphic = "HeavyRangedSplitterFragmentDeath",
		UseActivatePresentation = false,
		BlockRaiseDead = true,
	},
	Swarmer = {
		StunAnimations = { Default = "EnemyWretchSwarmerAlert", },
		DeathAnimation = "EnemyWretchSwarmerDeathVFX",
		DeathFx = "EnemyDeathFx_Small",
		DestroyDelay = 0.9,
		WeaponOptions = { "HadesSwarmerMelee" },
		ActivateFx = "EnemySummonRuneSmall",
		ActivateAnimation = "EnemyActivationFadeInWretchSwarmerContainer",
	},
	LightSpawner = {
		-- Makes sure we call the modded SpawnerAI function instead of HandleSpawnerBurst
		IsModdedHadesEnemy = true,
		StunAnimations = { Default = "SpawnerAttackAnim", },
		DeathFx = "BreakableDeathAnim",
		DeathGraphic = "SpawnerDeath",
		WeaponOptions = { "HadesLightSpawnerSpawnerWeapon" },
		DefaultAIData = { DeepInheritance = true, },
		OnDamagedFunctionName = "AggroSpawns",
		ActivateAnimation = "EnemyActivationFadeInLightSpawnerContainer",
		BlockRaiseDead = true,
	},
	WretchAssassin = {
		StunAnimations = { Default = "EnemyWretchAssassinOnHit" },
		ActivateAnimation = "EnemyActivate",
		BlockRaiseDead = true
	},
	HarpySupportUnit = {
		AIOptions = { "HarpySupportAI" },
	},
	Harpy3 = {
		BossPresentationTextLineSets = {
			Fury3Encounter10 = {
				EndVoiceLines = {
					[1] = {
						[1] = { Cue = "/VO/Megaera_0289" }
					},
				},
			},
		},
		-- TODO: Maybe replace with fitting Melinoe voicelines?
		MapTransitionReactionVoiceLines = mod.NilValue,
	},

	-- ASPHODEL
	-- Need to manually modify, as the enemy is DeepCopyTable'd above
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
		ValueOptions = {
			[1] = { GameStateRequirements = { PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBreakableValue1" }, RequiredCosmetics = mod.NilValue, RequiredFalseCosmetics = mod.NilValue, }, },
			[2] = { GameStateRequirements = { PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBreakableValue1" }, RequiredCosmetics = mod.NilValue, RequiredFalseCosmetics = mod.NilValue, }, },
			[3] = { GameStateRequirements = { PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBreakableValue1" }, RequiredCosmetics = mod.NilValue, RequiredFalseCosmetics = mod.NilValue, }, },
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
		AIAttackDistance = "AttackDistance",
		AIBufferDistance = "RetreatBufferDistance",
		AITrackTargetDuringCharge = "TrackTargetDuringCharge",
		AILineOfSightBuffer = "LoSBuffer",
		AIMoveWithinRangeTimeout = "MoveWithinRangeTimeout",
		TargetFriends = "TargetRequiredKillEnemy",
		AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
		AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
		AIRequireUnitLineOfSight = "RequireUnitLoS",
		AIRequireProjectileLineOfSight = "RequireProjectileLoS",
		AILineOfSighEndBuffer = "LoSEndBuffer",
		AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
		AIFireTicksMin = "FireTicksMin",
		AIFireTicksMax = "FireTicksMax",
		AIFireTicksCooldown = "FireInterval",
		StandOffTime = "SurroundRefreshInterval",
	},
}

ApplyModificationsAndInheritEnemyData(enemyData, enemyModifications, enemyReplacements, enemyKeyReplacements)

-- Modifications to Hades II enemies
-- Only modify enemies that are not being used in Hades II in this way!
-- Removing DestructibleGeo as TargetGroup, so the rubble from destructible pillars doesn't trigger the trap
game.EnemyData.SpikeTrap.DefaultAIData.TargetGroups = { "GroundEnemies", "HeroTeam", }
