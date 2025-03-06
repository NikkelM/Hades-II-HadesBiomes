-- Contains generic functions to handle migrating enemy data from Hades to Hades II

-- Loads EnemyData from a file in Hades
-- Note: Must be loaded before EncounterData, as there are some references to it in EncounterData!
mod.CachedHadesEnemyData = nil
local function LoadHadesEnemyData()
	if mod.CachedHadesEnemyData then
		return mod.CachedHadesEnemyData
	end

	local originalUnitSetDataEnemies = game.DeepCopyTable(game.UnitSetData.Enemies)
	local originalEnemyData = game.DeepCopyTable(game.EnemyData)
	local originalStatusAnimations = game.DeepCopyTable(game.StatusAnimations)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts\\EnemyData.lua")
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		local hadesEnemyData = UnitSetData.Enemies
		mod.CachedHadesEnemyData = hadesEnemyData
		game.UnitSetData.Enemies = originalUnitSetDataEnemies
		game.EnemyData = originalEnemyData
		game.StatusAnimations = originalStatusAnimations
		return mod.CachedHadesEnemyData
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

	-- Apply replacements/additions
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

		-- For Harpy Extreme Measures
		if enemyData.AdditionalEnemySetupFunctionName then
			enemyData.SpawnEvents = { { FunctionName = enemyData.AdditionalEnemySetupFunctionName, } }
			enemyData.AdditionalEnemySetupFunctionName = nil
		end

		game.ProcessDataInheritance(enemyData, game.EnemyData)

		-- Increase health and armour for slightly increased difficulty
		if enemyData.MaxHealth then
			enemyData.MaxHealth = enemyData.MaxHealth * 1.35
		end
		if enemyData.HealthBuffer then
			enemyData.HealthBuffer = enemyData.HealthBuffer * 1.2
		end

		base[enemyName] = enemyData
	end
	-- Don't skip duplicates, since we have already added all the new data before
	-- AddTableKeysSkipDupes also removed duplicates from base, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.EnemyData, base)
end

local hadesEnemyData = LoadHadesEnemyData()
-- Modified BaseVulnerableEnemy for all Hades enemies
hadesEnemyData.BaseVulnerableEnemy = game.DeepCopyTable(game.EnemyData.BaseVulnerableEnemy)
-- Modified BaseVulnerableEnemy just for Hades bosses, which need some modifications
hadesEnemyData.HadesBossBaseVulnerableEnemy = game.DeepCopyTable(game.EnemyData.BaseVulnerableEnemy)

-- Remove data from Hades that we don't want to use (e.g. enemies in Asphodel that are already implemented in Hades II)
for _, name in ipairs(mod.EnemyNameRemovals) do
	hadesEnemyData[name] = nil
end

-- Some enemies exist in both Hades and Hades II, so we need to rename the Hades enemies
for oldName, newName in pairs(mod.EnemyNameMappings) do
	if hadesEnemyData[oldName] then
		hadesEnemyData[newName] = hadesEnemyData[oldName]
		hadesEnemyData[oldName] = nil
		mod.DebugPrint("Renamed enemy: " .. oldName .. " to " .. newName .. " in EnemyData.lua", 4)
	end
	-- Update the name in dependent fields
	-- Inherit properties from this name
	mod.UpdateField(hadesEnemyData, oldName, newName, { "InheritFrom" }, "EnemyData.lua")
	-- If an enemy is spawned, this enemy cannot spawn
	mod.UpdateField(hadesEnemyData, oldName, newName, { "GeneratorData", "BlockEnemyTypes" }, "EnemyData.lua")
	-- Other enemies can spawn this enemy
	mod.UpdateField(hadesEnemyData, oldName, newName, { "SpawnOptions" }, "EnemyData.lua")
end
-- For renamed weapon names
for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	mod.UpdateField(hadesEnemyData, oldName, newName, { "WeaponOptions" }, "EnemyData.lua")
end

-- Some enemies need to be modified so much, it's easier to redefine them
-- This is true for most traps
mod.ModifyEnemyTrapData(hadesEnemyData)

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
	-- Setting this to an empty table in the enemy doesn't work, so resetting the keys that break the animations here
	Harpy = {
		InheritFrom = { "BaseBossEnemy", "HadesBossBaseVulnerableEnemy" },
	},

	-- ASPHODEL
	-- Copy pasting the enemy from Hades II, but replacing some animations and effects in modifications
	-- The name here should be the name of the enemy we use in Hades, to make sure we don't accidentally change data for the Hades II enemy
	HadesBloodlessNaked = game.DeepCopyTable(game.EnemyData.BloodlessNaked),
	HadesBloodlessNakedElite = game.DeepCopyTable(game.EnemyData.BloodlessNaked_Elite),
	HadesBloodlessGrenadier = game.DeepCopyTable(game.EnemyData.BloodlessGrenadier),
	HadesBloodlessGrenadierElite = game.DeepCopyTable(game.EnemyData.BloodlessGrenadier_Elite),
	HadesBloodlessSelfDestruct = game.DeepCopyTable(game.EnemyData.BloodlessSelfDestruct),
	HadesBloodlessSelfDestructElite = game.DeepCopyTable(game.EnemyData.BloodlessSelfDestruct_Elite),
	HadesBloodlessPitcher = game.DeepCopyTable(game.EnemyData.BloodlessPitcher),
	HadesBloodlessPitcherElite = game.DeepCopyTable(game.EnemyData.BloodlessPitcher_Elite),
	HadesBloodlessWaveFist = game.DeepCopyTable(game.EnemyData.BloodlessWaveFist),
	HadesBloodlessWaveFistElite = game.DeepCopyTable(game.EnemyData.BloodlessWaveFist_Elite),
	HadesSpreadShotUnit = game.DeepCopyTable(game.EnemyData.SpreadShotUnit),
	HadesSpreadShotUnitElite = game.DeepCopyTable(game.EnemyData.SpreadShotUnit_Elite),
	BloodlessNakedBerserker = game.DeepCopyTable(game.EnemyData.BloodlessBerserker),
	BloodlessNakedBerserkerElite = game.DeepCopyTable(game.EnemyData.BloodlessBerserker_Elite),
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
		-- The intro encounter is broken, there is nothing happening after the two enemies die
		RequiredIntroEncounter = mod.NilValue,
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
		-- From 1325
		HealthBuffer = 2000,
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
		WeaponOptions = { "HadesLightSpawnerSpawnerWeapon", },
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
	LightSpawnerElite = {
		IsModdedHadesEnemy = true,
		StunAnimations = { Default = "SpawnerAttackAnim", },
		DeathFx = "BreakableDeathAnim",
		DeathGraphic = "SpawnerDeath",
		WeaponOptions = { "HadesLightSpawnerEliteSpawnerWeapon", },
		DefaultAIData = { DeepInheritance = true, },
		OnDamagedFunctionName = "AggroSpawns",
		ActivateAnimation = "EnemyActivationFadeInLightSpawnerContainer",
		BlockRaiseDead = true,
	},
	-- Need to manually modify these fields, as the enemies are DeepCopyTable'd from Hades II above
	HadesBloodlessNaked = {
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessNakedElite" },
		},
	},
	HadesBloodlessNakedElite = {
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessNaked" },
		},
	},
	BloodlessNakedBerserker = {
		RequiredIntroEncounter = "BerserkerIntro",
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "BloodlessNakedBerserkerElite" },
		},
	},
	BloodlessNakedBerserkerElite = {
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "BloodlessNakedBerserker" },
		},
	},
	HadesBloodlessWaveFist = {
		RequiredIntroEncounter = "WaveFistIntro",
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessWaveFistElite" },
		},
	},
	HadesBloodlessWaveFistElite = {
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessWaveFist" },
		},
	},
	HadesBloodlessGrenadier = {
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessGrenadierElite" },
		},
	},
	HadesBloodlessGrenadierElite = {
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessGrenadier" },
		},
	},
	HadesBloodlessSelfDestruct = {
		RequiredIntroEncounter = "SelfDestructIntro",
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessSelfDestructElite" },
		},
	},
	HadesBloodlessSelfDestructElite = {
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessSelfDestruct" },
		},
	},
	HadesBloodlessPitcher = {
		RequiredIntroEncounter = "PitcherIntro",
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessPitcherElite" },
		},
	},
	HadesBloodlessPitcherElite = {
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessPitcher" },
		},
	},
	HadesSpreadShotUnit = {
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesSpreadShotUnitElite" },
		},
	},
	HadesSpreadShotUnitElite = {
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesSpreadShotUnit" },
		},
	},
	-- Normal/new Hades enemies for Asphodel
	FreezeShotUnit = {
		StunAnimations = { Default = "EnemyMedusaOnHit" },
		ActivateFx = "EnemySummonRuneMedium",
		ActivateAnimation = "EnemyActivationFadeInMedusaHeadContainer",
		DeathAnimation = "EnemyMedusaHeadDeath",
		DestroyDelay = 3.0,
	},
	RangedBurrower = {
		StunAnimations = { Default = "EnemyBoneDraconOnHit" },
		UseActivatePresentation = false,
	},
	CrusherUnit = {
		StunAnimations = { Default = "CrusherUnitOnHit" },
		ActivateAnimation = "EnemyActivationFadeInCrusherUnitContainer",
		DeathFx = "EnemyDeathFxBone",
		DeathAnimation = "CrusherUnitDeathVFX",
		DestroyDelay = 1.2,
		PostAggroAI = "ModsNikkelMHadesBiomesSkyAttackerAI",
		OnTouchdownFunctionArgs = {
			ProjectileName = "CrusherUnitTouchdown",
		},
		OnTouchdownFunctionName = "ModsNikkelMHadesBiomesCrusherUnitTouchdown",
		-- Breaks the animation, as they are only slowed down and not actually frozen
		CanBeFrozen = false,
	},
	ShieldRanged = {
		StunAnimations = { Default = "HealRangedCrystal4" },
		ActivateAnimation = "EnemyActivationFadeInHeavyRangedContainer",
		DeathAnimation = "HealRangedDeath",
		DeathFx = "HealRangedDeath",
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
	},
	ShieldRangedMiniBoss = {
		StunAnimations = { Default = "HealRangedCrystal4" },
		ActivateFx = "EnemySummonRuneExtraLarge",
		ActivateAnimation = "EnemyActivationFadeInHeavyRangedContainer",
		DeathAnimation = "HealRangedDeathMiniBoss",
		DeathFx = "HealRangedDeathMiniBoss",
	},
	SpreadShotUnitMiniboss = {
		-- In Hades II, projectiles can't be destroyed by attacks by default
		-- So we change the difficulty introduced by the shrine to have all four enemies attack at once, as the invulnerable projectiles are actually easier to dodge than the normal attacks
		-- As the default difficulty increases, the cooldowns for the attacks are increased slightly in the WeaponData
		-- The typo is intentional
		ShrineDefualtAIDataOverwrites = {
			MaxAttackers = 4,
		},
		ShrineWeaponOptionsOverwrite = mod.NilValue,
	},

	-- These enemies have not been implemented yet
	-- Chariot = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },
	-- ChariotSuicide = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },
	-- BloodlessNakedBerserker = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },
	-- BloodlessWaveFist = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },
	-- SatyrRanged = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },
	-- SatyrRangedMiniboss = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },
	-- RatThug = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },

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
							Animation = { "ModsNikkelMHadesBiomesBreakableIdle1" },
						},
						{
							Animation = { "ModsNikkelMHadesBiomesBreakableIdle2" },
						},
						{
							Animation = { "ModsNikkelMHadesBiomesBreakableIdle3" },
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
	BreakableAsphodel = {
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
							Animation = { "BreakableAsphodelIdle" },
						},
						{
							Animation = { "BreakableAsphodelIdle2" },
						},
						{
							Animation = { "BreakableAsphodelIdle3" },
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
	RequiredIntroEncounter = "IntroEncounterName",
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
	-- Key is only used for the four breakables
	ValueOptions = "BreakableValueOptions",
}

ApplyModificationsAndInheritEnemyData(hadesEnemyData, enemyModifications, enemyReplacements, enemyKeyReplacements)

-- Modifications to Hades II enemies
-- Only modify enemies that are not being used in Hades II in this way!
-- Removing DestructibleGeo as TargetGroup, so the rubble from destructible pillars doesn't trigger the trap
game.EnemyData.SpikeTrap.DefaultAIData.TargetGroups = { "GroundEnemies", "HeroTeam", }
