-- Contains generic functions to handle migrating enemy data from Hades to Hades II

-- Applies modifications to base enemy objects, and then adds the new encounter objects to the game
local function applyModificationsAndInheritEnemyData(base, modifications, replacements, enemyKeyReplacements)
	for oldName, newName in pairs(mod.EnemyNameMappings) do
		mod.UpdatePropertyName(modifications, oldName, newName, {}, "EnemyDataHandler modifications")
		mod.UpdatePropertyName(replacements, oldName, newName, {}, "EnemyDataHandler replacements")
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

		-- Always use the Olympus dialogue elements for the bosses
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
					for _, entry in ipairs(textLineSet) do
						if type(entry) == "table" and entry.Text then
							entry.Text = string.gsub(entry.Text, "{#PreviousFormat}", "{#Prev}")
						end
					end
				end
			end
		end

		-- AIStage functionality has been changed, so we need to call a modded handler
		if enemyData.AIStages then
			for _, aiStage in ipairs(enemyData.AIStages) do
				aiStage.ThreadedEvents = { { FunctionName = "NikkelMHadesBiomesBossAIStageHandler", } }
				-- For the Hydra, perform the mapping of the SelectPactLevelAIStage to EMStageDataOverrides
				if aiStage.SelectPactLevelAIStage then
					-- These are applied if the shrineLevel is not high enough/default behaviour for this AIStage
					local defaultAIStageOverrides = enemyData[aiStage.SelectPactLevelAIStage].Default or {}
					game.OverwriteTableKeys(aiStage, defaultAIStageOverrides)
					-- These are applied if the shrineLevel is high enough, as defined by enemy.BossDifficultyShrineRequiredCount
					-- Checking level 4 as all enemies with this property implement 4, but not necessarily the lower levels
					local emStageDataOverrides = enemyData[aiStage.SelectPactLevelAIStage][4] or {}
					-- Only add the property if it would not be empty
					if game.TableLength(emStageDataOverrides) > 0 then
						aiStage.EMStageDataOverrides = emStageDataOverrides
					end
					aiStage.SelectPactLevelAIStage = nil
				end
			end
		end

		-- For Harpy Extreme Measures
		if enemyData.AdditionalEnemySetupFunctionName then
			enemyData.SpawnEvents = { { FunctionName = enemyData.AdditionalEnemySetupFunctionName, } }
			enemyData.AdditionalEnemySetupFunctionName = nil
		end

		game.ProcessDataInheritance(enemyData, game.EnemyData)

		base[enemyName] = enemyData
	end
	-- Don't skip duplicates, since we have already added all the new data before
	-- AddTableKeysSkipDupes also removed duplicates from base, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.EnemyData, base)
end

-- Modified BaseVulnerableEnemy for all Hades enemies
mod.EnemyData.BaseVulnerableEnemy = game.DeepCopyTable(game.EnemyData.BaseVulnerableEnemy)
-- Modified BaseVulnerableEnemy just for Hades bosses, which need some modifications
mod.EnemyData.HadesBossBaseVulnerableEnemy = game.DeepCopyTable(game.EnemyData.BaseVulnerableEnemy)

-- Remove data from Hades that we don't want to use (e.g. enemies in Asphodel that are already implemented in Hades II)
for _, name in ipairs(mod.EnemyNameRemovals) do
	mod.EnemyData[name] = nil
end

-- Some enemies exist in both Hades and Hades II, so we need to rename the Hades enemies
for oldName, newName in pairs(mod.EnemyNameMappings) do
	mod.UpdatePropertyName(mod.EnemyData, oldName, newName, {}, "EnemyData.lua")
	-- Update the names in dependent fields
	-- Inherit properties from this name
	mod.UpdateField(mod.EnemyData, oldName, newName, { "InheritFrom" }, "EnemyData.lua")
	-- If an enemy is spawned, this enemy cannot spawn
	mod.UpdateField(mod.EnemyData, oldName, newName, { "GeneratorData", "BlockEnemyTypes" }, "EnemyData.lua")
	-- Other enemies can spawn this enemy
	mod.UpdateField(mod.EnemyData, oldName, newName, { "SpawnOptions" }, "EnemyData.lua")
	-- Used for the Codex
	mod.UpdateField(mod.EnemyData, oldName, newName, { "GenusName" }, "EnemyData.lua")
end
-- For renamed weapon names
for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	mod.UpdateField(mod.EnemyData, oldName, newName, { "WeaponOptions" }, "EnemyData.lua")
end

-- Some enemies need to be modified so much, it's easier to redefine them
-- This is true for most traps
mod.ModifyEnemyTrapData(mod.EnemyData)

-- Required modifications to the Hydra boss AIStages, so we can DeepCopyTable them onto the different Hydra heads, so the SelectPactLevelAIStage modifications can be done later on
local hydraHeadAIStages = game.DeepCopyTable(mod.EnemyData.HydraHeadImmortal.AIStages) or {}
for _, stage in ipairs(hydraHeadAIStages) do
	-- Replace the animation with the one we can keep playing for longer than the default one
	if stage.TransitionAnimation ~= nil then
		stage.TransitionAnimation = "EnemyHydraRoarFire"
		stage.TransitionEndAnimation = "EnemyHydraRoarReturnToIdle"
	end
	if stage.StartDelay ~= nil then
		stage.StartDelay = 1.0
	end
end
hydraHeadAIStages[2].SelectRandomAIStage = mod.NilValue
hydraHeadAIStages[2].RandomSpawnEncounter = { "HydraHeads1", "HydraHeads3", "HydraHeads3" }
hydraHeadAIStages[4].SelectRandomAIStage = mod.NilValue
hydraHeadAIStages[4].RandomSpawnEncounter = { "HydraHeads5", "HydraHeads6" }

-- Replaces the key with the new value instead of modifying
-- This is done AFTER data inheritance is processed
local enemyReplacements = {
	-- #region GENERAL
	BaseVulnerableEnemy = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		DestroyDelay = mod.NilValue,
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		-- The projectile scaling this is supposed to do doesn't work for H1 enemies it seems
		BlockAttributes = { "Massive" },
	},
	HadesBossBaseVulnerableEnemy = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
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
	-- #endregion

	-- #region TARTARUS
	-- #region TARTARUS - Regular
	BaseSpawner = {
		-- SpawnerAI doesn't exist, spawn logic is in the weapon
		AIOptions = { "AttackerAI", },
	},
	-- #endregion
	-- #region TARTARUS - Megaera
	-- Setting this to an empty table in the enemy doesn't work, so resetting the keys that break the animations here
	Harpy = {
		InheritFrom = { "BaseBossEnemy", "HadesBossBaseVulnerableEnemy" },
	},
	-- #endregion
	-- #endregion

	-- #region ASPHODEL
	-- #region ASPHODEL - Regular
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
	-- #endregion
	-- #region ASPHODEL - Hydra
	HydraHeadImmortal = {
		InheritFrom = { "BaseBossEnemy", "HadesBossBaseVulnerableEnemy" },
		AIStages = game.DeepCopyTable(hydraHeadAIStages),
	},
	-- These are all the same, but the SelectPactLevelAIStages are different and will be set accordingly in the modification handler
	HydraHeadImmortalLavamaker = {
		AIStages = game.DeepCopyTable(hydraHeadAIStages),
	},
	HydraHeadImmortalSummoner = {
		AIStages = game.DeepCopyTable(hydraHeadAIStages),
	},
	HydraHeadImmortalSlammer = {
		AIStages = game.DeepCopyTable(hydraHeadAIStages),
	},
	HydraHeadImmortalWavemaker = {
		AIStages = game.DeepCopyTable(hydraHeadAIStages),
	},
	-- #endregion
	-- #endregion

	-- #region ELYSIUM
	-- #region ELYSIUM - Minotaur
	Minotaur = {
		InheritFrom = { "BaseBossEnemy", "HadesBossBaseVulnerableEnemy" },
	},
	-- #endregion
	-- #region ELYSIUM - Theseus
	Theseus = {
		InheritFrom = { "BaseBossEnemy", "HadesBossBaseVulnerableEnemy" },
	},
	-- #endregion
	-- #endregion

	-- #region STYX
	-- #region STYX - Hades
	Hades = {
		InheritFrom = { "BaseBossEnemy", "HadesBossBaseVulnerableEnemy" },
	},
	-- #endregion
	-- #endregion
}

-- Note: Modifications to Base enemy types (which are inherited from by other new enemy types) don't seem to work - need to apply the modifications to the resulting enemy directly
local enemyModifications = {
	-- #region TARTARUS
	-- #region TARTARUS - Regular
	BaseGlutton = {
		LargeUnitCap = mod.NilValue,
	},
	PunchingBagUnit = {
		StunAnimations = { Default = "EnemyWretchGluttonOnHit" },
		ActivateAnimation = "EnemyActivationFadeInWretchGluttonContainer",
	},
	PunchingBagUnitElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", "Metallic", }),
	},
	BaseThug = {
		LargeUnitCap = mod.NilValue,
		ActivateAnimation = "EnemyActivationFadeInWretchThugContainer",
	},
	HeavyMelee = {
		StunAnimations = { Default = "EnemyWretchThugOnHit" },
		ActivateAnimation = "EnemyActivationFadeInWretchThugContainer",
	},
	HeavyMeleeElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", "Metallic", }),
	},
	DisembodiedHand = {
		StunAnimations = { Default = "EnemyWringerOnHit" },
		ActivateAnimation = "EnemyActivationFadeInDisembodiedHandContainer",
	},
	DisembodiedHandElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", "Metallic", }),
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
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", }),
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
	Swarmer = {
		StunAnimations = { Default = "EnemyWretchSwarmerAlert", },
		DeathAnimation = "EnemyWretchSwarmerDeathVFX",
		DeathFx = "EnemyDeathFx_Small",
		DestroyDelay = 0.9,
		WeaponOptions = { "HadesSwarmerMelee" },
		ActivateFx = "EnemySummonRuneSmall",
		ActivateAnimation = "EnemyActivationFadeInWretchSwarmerContainer",
		BlockAttributes = { "Orbit", "Vacuum", "Massive", },
	},
	SwarmerElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", }),
	},
	LightSpawner = {
		StunAnimations = { Default = "SpawnerAttackAnim", },
		DeathFx = "BreakableDeathAnim",
		DeathGraphic = "SpawnerDeath",
		WeaponOptions = { "HadesLightSpawnerSpawnerWeapon", },
		DefaultAIData = { DeepInheritance = true, },
		OnDamagedFunctionName = "AggroSpawns",
		ActivateAnimation = "EnemyActivationFadeInLightSpawnerContainer",
		BlockRaiseDead = true,
		EliteAttributeOptions = { "Fog", "HeavyArmor", "Orbit", "Radial", },
	},
	-- #endregion
	-- #region TARTARUS - Minibosses
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
		HealthBuffer = 2200,
		-- From 850
		MaxHealth = 500,
		DefaultAIData = {
			-- How long it waits before moving again while firing the beams
			FireDuration = 5.75,
			-- Sort of acts as a PreAttackDuration as well
			MoveWithinRangeTimeoutMin = 1.5,
			MoveWithinRangeTimeoutMax = 2.0,
		},
		OnDamagedFireProjectiles = {
			{
				ProjectileName = "SpawnSplitterFragment",
				Requirements = { MaxUnitsByType = { HeavyRangedSplitterFragment = 12 } },
			},
		},
		OnDamagedWeapons = mod.NilValue,
	},
	HeavyRangedSplitterMinibossSuperElite = {
		OnDamagedFireProjectiles = {
			{
				ProjectileName = "SpawnSplitterFragmentSuperElite",
				Requirements = { MaxUnitsByType = { HeavyRangedSplitterFragmentSuperElite = 12 } },
			},
		},
		OnDamagedWeapons = mod.NilValue,
	},
	HeavyRangedSplitterFragment = {
		StunAnimations = { Default = "HeavyRangedSplitterFragment", },
		DeathFx = "HeavyRangedSplitterFragmentDeath",
		DeathGraphic = "HeavyRangedSplitterFragmentDeath",
		UseActivatePresentation = false,
		BlockRaiseDead = true,
		RunHistoryKilledByName = "HeavyRangedSplitterMiniboss",
	},
	WretchAssassin = {
		StunAnimations = { Default = "EnemyWretchAssassinOnHit" },
		ActivateAnimation = "EnemyActivate",
		BlockRaiseDead = true
	},
	-- #endregion
	-- #region TARTARUS - Bosses
	HarpySupportUnit = {
		AIOptions = { "HarpySupportAI" },
		-- Otherwise, doesn't get cleaned up after boss kill as of the Unseen Update
		RequiredKill = true,
	},
	Harpy = {
		InvulnerableFx = "Invincibubble",
		RunHistoryKilledByName = "NPC_FurySister_01",
	},
	Harpy2 = {
		-- Gets overwritten by the Harpy value if not set
		RunHistoryKilledByName = "Harpy2",
	},
	Harpy3 = {
		RunHistoryKilledByName = "Harpy3",
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
	-- #endregion
	-- #endregion

	-- #region ASPHODEL
	-- #region ASPHODEL - Regular
	LightSpawnerElite = {
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
		BlockAttributes = { "Blink", "Orbit", "Massive", },
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", }),
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
		BlockAttributes = { "Blink", "Orbit", "Massive", },
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", "Metallic", }),
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
		BlockAttributes = { "Blink", "Orbit", "Massive", },
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
		BlockAttributes = { "Blink", "Orbit", "Massive", },
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
		BlockAttributes = { "Blink", "Orbit", "Massive", },
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
		BlockAttributes = { "Blink", "Orbit", "Massive", },
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", "Metallic", }),
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
	FreezeShotUnitElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", }),
	},
	RangedBurrower = {
		StunAnimations = { Default = "EnemyBoneDraconOnHit" },
		UseActivatePresentation = false,
	},
	RangedBurrowerElite = {
		BlockAttributes = { "Blink", "Orbit", "Massive", },
	},
	CrusherUnit = {
		StunAnimations = { Default = "CrusherUnitOnHit" },
		ActivateAnimation = "EnemyActivationFadeInCrusherUnitContainer",
		DeathFx = "EnemyDeathFxBone",
		DeathAnimation = "CrusherUnitDeathVFX",
		DestroyDelay = 1.2,
		OnTouchdownFunctionName = "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "CrusherUnitTouchdown",
		},
		PostAggroAI = "ModsNikkelMHadesBiomesSkyAttackerAI",
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
	-- #endregion
	-- #region ASPHODEL - Minibosses
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
		-- We also remove the ShrineWeaponOptionsOverwrite, so we don't use the invulnerable projectiles at all
		-- As the default difficulty increases, the cooldowns for the attacks are increased slightly in the WeaponData
		-- The typo is intentional
		ShrineDefualtAIDataOverwrites = {
			MaxAttackers = 4,
		},
		ShrineWeaponOptionsOverwrite = mod.NilValue,
	},
	HitAndRunUnit = {
		BlockRaiseDead = true,
	},
	CrusherUnitElite = {
		BlockAttributes = { "Blink", "Orbit", "Fog", "Frenzy", "ManaDrain", "Molten", "Unflinching", "Vacuuming", },
		BlockRaiseDead = true,
		OnTouchdownFunctionName = "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "CrusherUnitTouchdown",
			-- Also fire this projectile if the Vow of Shadows is active
			ShrineProjectileName = "CrusherUnitSlamUpgraded",
			ShrineMetaUpgradeName = "MinibossCountShrineUpgrade",
			ShrineMetaUpgradeRequiredLevel = 1,
		},
	},
	-- #endregion
	-- #region ASPHODEL - Bosses
	HydraHeadImmortal = {
		AltHealthBarTextIds = {
			[1] = {
				GameStateRequirements = { RequiredPlayed = { "/VO/ZagreusField_3147" } },
				Requirements = mod.NilValue,
			},
		},
		InvulnerableFx = "HydraBubble",
		BossDifficultyShrineRequiredCount = 2,
		OnTouchdownFunctionName = "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "HydraTouchdown",
			-- Lining up with when the head actually touches the ground
			Delay = 0.23,
		},
		-- SpawnEvents = { { FunctionName = "CreateTethers", Threaded = true, }, },
		-- While Tethers are broken - enemy returns to spawnpoint after attacking
		DefaultAIData = {
			MoveToId = 480903,
			MoveWithinRange = true,
			MoveWithinRangeTimeout = 1.0,
		},
	},
	-- Spawned heads
	BaseHydraHead = {
		StunAnimations = { Default = "EnemyHydraOnHit" },
		ActivateFx = "nil",
		ActivateAnimation = "HydraHeadLavaBubbles",
		OnTouchdownFunctionName = "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "HydraTouchdown",
			-- Lining up with when the head actually touches the ground
			Delay = 0.23,
		},
		-- SpawnEvents = { { FunctionName = "CreateTethers", Threaded = true, }, },
		-- While Tethers are broken - enemy returns to nearest spawnpoint after attacking
		DefaultAIData = {
			-- Is overwritten by the actual spawnpoint in ModsNikkelMHadesBiomesRememberHydraSpawnpoint
			MoveToClosestId = { 506375, 506376, 506377, 506378, 506380, 506381, },
			MoveWithinRange = true,
			MoveWithinRangeTimeout = 1.0,
		},
		-- Stops the armour outline from being added, which doesn't look correctly (whole enemy is coloured instead of just the outline)
		HasOutline = true,
		BlockCharm = true,
		ImmuneToPolymorph = true,
		BlockRaiseDead = true,
	},
	HydraTooth = {
		StunAnimations = { Default = "HydraToothLanded" },
		ActivateFx = "nil",
		ActivateAnimation = "nil",

		WeaponOptions = mod.NilValue,
		-- Adapted from TyphonHeadEgg
		Groups = { "EnemyTeam", "GroundEnemies" },
		UseActivatePresentation = false,
		HealthBarType = "Small",
		BlockRaiseDead = true,
		OnHitShake = { Distance = 3, Speed = 300, Duration = 0.15 },
		DefaultAIData = {
			DeepInheritance = true,
			SpawnOptions = { "HadesBloodlessNaked" },
			HatchDuration = 5,
		},
		TriggerGroups = { "HeroTeam" },
		StartCharmedDataOverrides = { TriggerGroups = { "EnemyTeam" }, },
		IncomingDamageModifiers = { { NonPlayerMultiplier = 0.0, }, },
		AIOptions = { "ModsNikkelMHadesBiomesHydraToothAI", },
	},
	HydraTooth2 = {
		DefaultAIData = {
			DeepInheritance = true,
			SpawnOptions = { "BloodlessNakedBerserkerElite" },
			HatchDuration = 5,
		},
	},
	-- #endregion
	-- #endregion

	-- #region ELYSIUM
	-- #region ELYSIUM - Regular
	ShadeNaked = {
		StunAnimations = { Default = "ShadeNaked_Idle" },
		-- Push the Shade away after spawning so it has to move to the pickupTarget
		PostActivateEvents = {
			{
				FunctionName = "ModsNikkelMHadesBiomesShadeNakedPostActivate",
				Args = { ForceMin = 3200, ForceMax = 3300, AngleOffsetMin = -60, AngleOffsetMax = 60, },
			},
		},
		OnDeathFunctionName = "ModsNikkelMHadesBiomesShadeNakedDeath",
		-- To prevent the first damage occurrence, which is duplicated from the killing blow
		ModsNikkelMHadesBiomesIgnoreFirstRapidDamage = true,
		BlockRaiseDead = true,
	},
	ShadeSpearUnit = {
		-- TODO: StopAnimationsOnDeath? for the glow animations
		StunAnimations = { Default = "ShadeSpear_OnHit" },
		ActivateAnimation = "EnemyActivationFadeInShadeSpearContainer",
		SpawnUnitOnDeath = "ShadeNaked",
		SkipActivatePresentationOnSpawns = true,
		OnTouchdownFunctionName = "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "ShadeSpearTouchdown",
		},
	},
	ShadeSpearUnitElite = {
		SpawnUnitOnDeath = "ShadeNakedElite",
	},
	ShadeSpearUnitSuperElite = {
		SpawnUnitOnDeath = "ShadeNakedSuperElite",
	},
	ShadeBowUnit = {
		StunAnimations = { Default = "ShadeBow_OnHit" },
		ActivateAnimation = "EnemyActivationFadeInShadeBowContainer",
		SpawnUnitOnDeath = "ShadeNaked",
		SkipActivatePresentationOnSpawns = true,
	},
	ShadeBowUnitElite = {
		SpawnUnitOnDeath = "ShadeNakedElite",
	},
	ShadeBowUnitSuperElite = {
		SpawnUnitOnDeath = "ShadeNakedSuperElite",
	},
	ShadeShieldUnit = {
		StunAnimations = { Default = "ShadeShield_OnHit" },
		ActivateAnimation = "EnemyActivationFadeInShadeShieldContainer",
		SpawnUnitOnDeath = "ShadeNaked",
		SkipActivatePresentationOnSpawns = true,
		ProjectileBlockPresentationFunctionName = "UnitInvulnerableHitPresentation",
		InvulnerableHitFx = "ShadeShieldBlock",
	},
	ShadeShieldUnitElite = {
		SpawnUnitOnDeath = "ShadeNakedElite",
	},
	ShadeShieldUnitSuperElite = {
		SpawnUnitOnDeath = "ShadeNakedSuperElite",
	},
	ShadeSwordUnit = {
		StunAnimations = { Default = "ShadeSword_OnHit" },
		ActivateAnimation = "EnemyActivationFadeInShadeSwordContainer",
		SpawnUnitOnDeath = "ShadeNaked",
		SkipActivatePresentationOnSpawns = true,
	},
	ShadeSwordUnitElite = {
		SpawnUnitOnDeath = "ShadeNakedElite",
	},
	ShadeSwordUnitSuperElite = {
		SpawnUnitOnDeath = "ShadeNakedSuperElite",
	},
	Chariot = {
		LargeUnitCap = mod.NilValue,
		StunAnimations = { Default = "ChariotOnHit" },
		ActivateAnimation = "EnemyActivationFadeInChariotContainer",
		DefaultAIData = {
			PreAttackAngleTowardTarget = false,
			AttackDistanceBuffer = 0,
			StopMoveWithinRange = false,
			RamEffectName = mod.NilValue,
			RamEffectProperties = {
				{
					Property = "Speed",
					Value = 950,
				},
			},
			RamEffectResetProperties = {
				{
					Property = "Speed",
					Value = 300,
				},
			},
			-- SetupDistance is when it can start ramming instead of moving
			SetupDistance = 500,
			SetupTimeout = 7.0,
			-- Longer time ramming before timing out and stopping
			RamTimeout = 3.0,
			RamDistance = 120,
		},
	},
	ChariotElite = {
		DefaultAIData = {
			RamEffectProperties = {
				{
					Property = "Speed",
					Value = 1100,
				},
			},
			RamEffectResetProperties = {
				{
					Property = "Speed",
					Value = 400,
				},
			},
		},
	},
	ChariotSuicide = {
		LargeUnitCap = mod.NilValue,
		StunAnimations = { Default = "ChariotSuicideOnHit" },
		ActivateAnimation = "EnemyActivationFadeInChariotSuicideContainer",
		ActivateFx = "EnemySummonRuneMedium",
		BlockRaiseDead = true,
		DefaultAIData = {
			PreAttackAngleTowardTarget = false,
			AttackDistanceBuffer = 0,
			StopMoveWithinRange = false,
			RamEffectName = mod.NilValue,
			RamEffectProperties = {
				{
					Property = "Speed",
					Value = 900,
				},
			},
			RamEffectResetProperties = {
				{
					Property = "Speed",
					Value = 200,
				},
			},
			SetupDistance = 900,
			SetupTimeout = 7.0,
			RamDistance = 80,
			OnFiredFunctionName = "SelfDestruct",
		},
		WeaponOptions = { "ChariotRamSelfDestruct" },
	},
	-- #endregion
	-- #region ELYSIUM - Minibosses
	FlurrySpawnerElite = {
		-- The dash weapon does not work in Hades II, alternative difficulty was added through more enemies
		ShrineWeaponOptionsOverwrite = mod.NilValue,
	},
	-- #endregion
	-- #region ELYSIUM - Bosses
	Minotaur = {
		OnTouchdownFunctionName = "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "MinotaurOverheadTouchdown",
			-- Moves the damage cone in front of the Minotaur to line up with the Axe and not the character
			SpawnDistance = 90,
			CalcOffset = true,
			CalcAngle = true,
		},
		DefaultAIData = {
			RamEffectProperties = {
				{
					Property = "Speed",
					Value = 700,
				},
			},
			RamEffectResetProperties = {
				{
					Property = "Speed",
					Value = 475,
				},
			},
		},
	},
	Theseus = {
		ProjectileBlockPresentationFunctionName = "UnitInvulnerableHitPresentation",
		InvulnerableHitFx = "ShadeShieldBlock",
	},
	-- #endregion
	-- #endregion

	-- #region STYX
	-- #region STYX - Regular
	-- SatyrRanged = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },
	-- SatyrRangedMiniboss = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },
	-- RatThug = {
	-- 	LargeUnitCap = mod.NilValue,
	-- },
	-- #endregion
	-- #region STYX - Minibosses
	-- #endregion
	-- #region STYX - Bosses
	-- Hades = {
	--   BossDifficultyShrineRequiredCount = 4,
	-- },
	-- #endregion
	-- #endregion

	-- #region ENVIRONMENT
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
						{ Animation = { "ModsNikkelMHadesBiomesBreakableIdle1" }, },
						{ Animation = { "ModsNikkelMHadesBiomesBreakableIdle2" }, },
						{ Animation = { "ModsNikkelMHadesBiomesBreakableIdle3" }, },
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
						{ Animation = { "BreakableAsphodelIdle" }, },
						{ Animation = { "BreakableAsphodelIdle2" }, },
						{ Animation = { "BreakableAsphodelIdle3" }, },
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
	BreakableElysium = {
		CannotDieFromDamage = true,
		OnDamagedFunctionName = "BreakableOnHitModsNikkelMHadesBiomes",
		DeathAnimation = "BreakableDeathAnim",
		DeathSound = "/SFX/CeramicPotSmash",
		SetupEvents = {
			{
				FunctionName = "RandomizeObject",
				Args = {
					RandomizeSets = {
						{ Animation = { "BreakableElysiumIdle1" }, },
						{ Animation = { "BreakableElysiumIdle2" }, },
						{ Animation = { "BreakableElysiumIdle3" }, },
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
	BlastCubeFusedRegenerating = {
		OnDeathFireWeapons = { "BlastCubeExplosionElysium" },
		FuseWarningProjectileName = "ModsNikkelMHadesBiomesBlastWarningDecalElysium"
	},
	-- #endregion
}

-- Some keys were renamed in the DefaultAIData property
local enemyKeyReplacements = {
	RequiredIntroEncounter = "IntroEncounterName",
	-- Key is only used for the four breakables
	ValueOptions = "BreakableValueOptions",
	-- For the ShadeNaked
	AIPickupType = "AIPickupTypes",
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

-- Modifications to Hades II enemies
-- Only modify enemies that are not being used in Hades II in this way!
-- Needs to be done before the enemy data is added to the game
game.EnemyData.SpikeTrap.DefaultAIData.TargetGroups = { "GroundEnemies", "HeroTeam", }
game.EnemyData.Elite.EliteAttributeData.ModsNikkelMHadesBiomesStasisDeath = {
	GameStateRequirements = {
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = { "Tartarus", "Asphodel", "Elysium", "Styx", },
		},
	},
	AddDeathWeapons = { "EliteStasisDeath" },
}

applyModificationsAndInheritEnemyData(mod.EnemyData, enemyModifications, enemyReplacements, enemyKeyReplacements)
