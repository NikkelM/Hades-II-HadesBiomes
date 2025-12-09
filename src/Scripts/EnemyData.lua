-- Contains generic functions to handle migrating enemy data from Hades to Hades II

-- Applies modifications to base enemy objects, and then adds the new encounter objects to the game
function mod.ApplyModificationsAndInheritEnemyData(base, modifications, replacements, enemyKeyReplacements)
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
		-- Need to replace this property first, as others might change other properties to FireInterval
		if enemyData.DefaultAIData and enemyData.DefaultAIData.FireInterval then
			enemyData.DefaultAIData.DumbFireInterval = enemyData.DefaultAIData.FireInterval
			enemyData.DefaultAIData.FireInterval = nil
		end
		mod.RenameKeys(enemyData, enemyKeyReplacements, enemyName)

		enemyData.Name = enemyName

		-- All properties will be moved to the top level in the enemy data
		local sjsonToEnemyDataMappings = {
			Life = {
				DeathGraphic = "DeathAnimation",
				DeathFx = "DeathFx",
				DeathSound = "DeathSound",
				InvulnerableFx = "InvulnerableFx",
			},
			Thing = {
				ActivateFx = "ActivateFx",
				ActivateGraphic = "ActivateAnimation",
			},
		}

		-- Move properties from SJSON to the enemy data
		local sjsonEnemyData = mod.HadesSjsonEnemiesTable[enemyName]
		if sjsonEnemyData ~= nil then
			for parentKey, replacementKeys in pairs(sjsonToEnemyDataMappings) do
				-- Process each property within the parent key (Life/Thing)
				for oldName, newName in pairs(replacementKeys) do
					local dataSource = sjsonEnemyData
					local sourceName = enemyName
					local foundData = false

					-- Check if current enemy has the specific property
					if dataSource[parentKey] and dataSource[parentKey][oldName] ~= nil then
						foundData = true
					else
						-- Look for the property in parent enemy
						local parentEnemyName = sjsonEnemyData.InheritFrom
						if parentEnemyName and mod.HadesSjsonEnemiesTable[parentEnemyName] then
							dataSource = mod.HadesSjsonEnemiesTable[parentEnemyName]
							sourceName = parentEnemyName
							if dataSource[parentKey] and dataSource[parentKey][oldName] ~= nil then
								foundData = true
							else
								-- Look for the property in grandparent enemy
								local grandParentEnemyName = dataSource.InheritFrom
								if grandParentEnemyName and mod.HadesSjsonEnemiesTable[grandParentEnemyName] then
									dataSource = mod.HadesSjsonEnemiesTable[grandParentEnemyName]
									sourceName = grandParentEnemyName
									if dataSource[parentKey] and dataSource[parentKey][oldName] ~= nil then
										foundData = true
									end
								end
							end
						end
					end

					-- Process the found data
					if foundData and not enemyData[newName] then
						enemyData[newName] = dataSource[parentKey][oldName]
						mod.DebugPrint("Moved " .. parentKey .. "." .. oldName .. " from sjson " .. sourceName ..
							" into " .. newName .. " for " .. enemyName .. " with value " .. dataSource[parentKey][oldName], 4)
					elseif not foundData then
						mod.DebugPrint("Could not find " .. parentKey .. "." .. oldName
							.. " in sjson for " .. enemyName .. " or its parents", 4)
					else
						mod.DebugPrint("Property " .. newName .. " already exists in " .. enemyName
							.. ", not overwriting it", 4)
					end
				end
			end
		end

		if enemyData.FireWeaponOnActivationFinished ~= nil then
			enemyData.CreateProjectileOnActivationFinished = enemyData.FireWeaponOnActivationFinished
			enemyData.FireWeaponOnActivationFinished = nil
		end
		if enemyData.HitSparkScale ~= nil then
			enemyData.HitSparkScale = nil
		end
		-- This key was renamed, but if it was true before, it must be false now
		if enemyData.DefaultAIData and enemyData.DefaultAIData.SkipMovement then
			enemyData.DefaultAIData.MoveWithinRange = false
			enemyData.DefaultAIData.SkipMovement = nil
		end

		-- Always use the Olympus dialogue elements for the bosses
		if enemyData.Portrait then
			enemyData.BoxAnimation = "DialogueSpeechBubbleLight"
			enemyData.BoxExitAnimation = "DialogueSpeechBubbleLightOut"
			enemyData.NarrativeTextColor = game.Color.DialogueTextLight
			enemyData.NameplateSpeakerNameColor = game.Color.DialogueSpeakerNameOlympian
			enemyData.NameplateDescriptionColor = { 145, 45, 90, 255 }
		end
		if enemyData.SubtitleColor and enemyData.NarrativeFadeInColor == nil then
			enemyData.NarrativeFadeInColor = enemyData.SubtitleColor
		end

		-- Dialogues playing before boss fights or when meeting NPCs
		local bossPresentationProperties = {
			"BossPresentationSuperPriorityIntroTextLineSets",
			"BossPresentationHighPriorityIntroTextLineSets",
			"BossPresentationPriorityIntroTextLineSets",
			"BossPresentationIntroTextLineSets",
			"BossPresentationTextLineSets",
			"BossPresentationRepeatableTextLineSets",
			"BossPresentationNextStageTextLineSets",
			"BossPresentationNextStageRepeatableTextLineSets",
			"BossPresentationOutroTextLineSets",
			"BossPresentationOutroRepeatableTextLineSets",
			"InteractTextLineSets",
			"RepeatableTextLineSets",
			"GiftTextLineSets",
		}
		for _, property in ipairs(bossPresentationProperties) do
			if enemyData[property] then
				for key, textLineSet in pairs(enemyData[property]) do
					textLineSet.Name = key
					for _, entry in ipairs(textLineSet) do
						if type(entry) == "table" then
							if entry.Text then
								entry.Text = string.gsub(entry.Text, "{#PreviousFormat}", "{#Prev}")
							end
							if entry.Speaker then
								if entry.Speaker == "CharProtag" then
									entry.Speaker = "NPC_Zagreus_Past_01"
									entry.LineHistoryName = "NPC_Zagreus_Past_01"
								elseif entry.Speaker == "NPC_FurySister_01" then
									entry.Source = "Harpy"
								elseif entry.Speaker == "NPC_FurySister_02" then
									entry.Source = "Harpy2"
								elseif entry.Speaker == "NPC_FurySister_03" then
									entry.Source = "Harpy3"
								elseif entry.Speaker == "Minotaur" then
									entry.Source = "Minotaur"
								elseif entry.Speaker == "Theseus" then
									entry.Source = "Theseus"
								elseif entry.Speaker == "Hades" then
									entry.Source = "Hades"
								elseif entry.Speaker == "NPC_Bouldy_01" then
									entry.Speaker = "ModsNikkelMHadesBiomes_NPC_Bouldy_01"
									entry.Source = "NPC_Bouldy_01" -- Use the Hades II NarrativeFadeInColor
								elseif entry.Speaker == "NPC_Patroclus_Unnamed_01" then
									entry.Source = "NPC_Patroclus_01"
								elseif entry.Speaker == "NPC_Persephone_Unnamed_01" then
									entry.Source = "ModsNikkelMHadesBiomes_NPC_Persephone_01"
								end
							end
							if entry.Portrait then
								if entry.Portrait:find("^Portrait_Zag_") then
									entry.Portrait = entry.Portrait:gsub("^Portrait_Zag_", "ModsNikkelMHadesBiomes_Portrait_Zag_")
								elseif entry.Portrait == "Portrait_Bouldy_Default_01" then
									entry.Portrait = "ModsNikkelMHadesBiomes_Portrait_Bouldy"
								end
							end
							if entry.PortraitExitAnimation then
								if entry.PortraitExitAnimation:find("^Portrait_Zag_") then
									entry.PortraitExitAnimation = entry.PortraitExitAnimation:gsub("^Portrait_Zag_",
										"ModsNikkelMHadesBiomes_Portrait_Zag_")
								end
							end
							if entry.PreLineFunctionName then
								if entry.PreLineFunctionName == "StartFinalBossRoomIntroMusic" then
									entry.PreLineFunctionName = _PLUGIN.guid .. "." .. "StartFinalBossRoomIntroMusic"
								end
							end
							if entry.PostLineFunctionName then
								if entry.PostLineFunctionName == "StartFinalBossRoomMusic" then
									entry.PostLineFunctionName = _PLUGIN.guid .. "." .. "StartFinalBossRoomMusic"
								end
							end
							if entry.PreLineThreadedFunctionName then
								if entry.PreLineThreadedFunctionName == "PlayPreLineTauntAnimFromSource" then
									entry.PreLineThreadedFunctionName = _PLUGIN.guid .. "." .. "PlayPreLineTauntAnimFromSource"
								end
							end
							if entry.SetFlagTrue then
								entry.PostLineFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSetFlag"
								entry.PostLineFunctionArgs = { FlagName = entry.SetFlagTrue, Value = true }
							end
							if entry.SetFlagFalse then
								entry.PostLineFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSetFlag"
								entry.PostLineFunctionArgs = { FlagName = entry.SetFlagFalse, Value = false }
							end
							if entry.Cue then
								if entry.Cue:find("^/VO/Storyteller_") then
									entry.Cue = entry.Cue:gsub("^/VO/Storyteller_", "/VO/Megaera_0")
								elseif entry.Cue:find("^/VO/Charon_") then
									entry.Cue = entry.Cue:gsub("^/VO/Charon_", "/VO/Megaera_1")
								elseif entry.Cue:find("^/VO/Persephone_") then
									entry.Cue = entry.Cue:gsub("^/VO/Persephone_", "/VO/Megaera_2")
								elseif entry.Cue:find("^/VO/ZagreusHome_") then
									entry.Cue = entry.Cue:gsub("^/VO/ZagreusHome_", "/VO/ZagreusField_0")
								end
							end
						end
					end
				end
			end
		end

		-- AIStage functionality has been changed, so we need to call a modded handler
		if enemyData.AIStages then
			for _, aiStage in ipairs(enemyData.AIStages) do
				aiStage.ThreadedEvents = { { FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossAIStageHandler", } }
				-- Make sure to call the modded functions
				local moddedTransitionFunctions = {
					"HydraStageTransition",
					"MinotaurFinalStageTransition",
					"TheseusChariotDismount",
					"HadesPhaseTransition",
				}
				if game.Contains(moddedTransitionFunctions, aiStage.TransitionFunction) then
					aiStage.TransitionFunction = _PLUGIN.guid .. "." .. aiStage.TransitionFunction
				end
				-- Perform the mapping of the SelectPactLevelAIStage to EMStageDataOverrides
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
	end

	-- Modify all enemies completely before processing inheritance, as that can mess up not-yet-modified parent enemies
	for enemyName, enemyData in pairs(base) do
		-- Update cooldowns on voicelines, as the Hades format no longer works for Hades II for some reason
		local voicelineTables = {
			"OnHitVoiceLines",
			"KillingEnemyVoiceLines",
			"LastStandReactionVoiceLines",
			"WrathReactionVoiceLines",
			"AssistEndedVoiceLines",
			"RespawningVoiceLines",
			"RespawnedVoiceLines",
			"PlayerInjuredVoiceLines",
			"InvulnerableVoiceLines",
			"OnCharmedVoiceLines",
			"LowHealthVoiceLines",
			"CriticalHealthVoiceLines",
			"RageFullVoiceLines",
		}
		for _, tableName in ipairs(voicelineTables) do
			if enemyData[tableName] then
				if enemyData[tableName].CooldownTime then
					enemyData[tableName].Cooldowns = enemyData[tableName].Cooldowns or {}
					table.insert(enemyData[tableName].Cooldowns, {
						Name = enemyData[tableName].CooldownName or (enemyName .. "." .. tableName),
						Time = enemyData[tableName].CooldownTime,
					})
					mod.DebugPrint("Added cooldown for voiceline table " .. tableName .. " on enemy " .. enemyName, 4)
					enemyData[tableName].CooldownName = nil
					enemyData[tableName].CooldownTime = nil
				end
				for _, voicelineEntry in ipairs(enemyData[tableName]) do
					if voicelineEntry.CooldownTime then
						voicelineEntry.Cooldowns = voicelineEntry.Cooldowns or {}
						table.insert(voicelineEntry.Cooldowns, {
							Name = voicelineEntry.CooldownName or (enemyName .. "." .. tableName),
							Time = voicelineEntry.CooldownTime,
						})
						mod.DebugPrint("Added cooldown for voiceline entry in table " .. tableName .. " on enemy " .. enemyName, 4)
						voicelineEntry.CooldownName = nil
						voicelineEntry.CooldownTime = nil
					end
				end
			end
			if enemyData.AIStages and enemyData.AIStages.StageTransitionVoiceLines then
				for _, aiStage in ipairs(enemyData.AIStages) do
					if aiStage.StageTransitionVoiceLines and aiStage.StageTransitionVoiceLines.CooldownTime then
						aiStage.StageTransitionVoiceLines.Cooldowns = aiStage.StageTransitionVoiceLines.Cooldowns or {}
						table.insert(aiStage.StageTransitionVoiceLines.Cooldowns, {
							Name = aiStage.StageTransitionVoiceLines.CooldownName or
									(enemyName .. ".AIStages.StageTransitionVoiceLines"),
							Time = aiStage.StageTransitionVoiceLines.CooldownTime,
						})
						mod.DebugPrint("Added cooldown for AIStages.StageTransitionVoiceLines on enemy " .. enemyName, 4)
						aiStage.StageTransitionVoiceLines.CooldownName = nil
						aiStage.StageTransitionVoiceLines.CooldownTime = nil
					end
				end
			end
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
-- Re-implementing this as the name is reused but allegiance flipped between the games
mod.EnemyData.ModsNikkelMHadesBiomesHadesTombstone = game.DeepCopyTable(game.EnemyData.HadesTombstone)

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
		-- We always create the death animation on a new blank obstacle, so we don't have to time the DestroyDelay
		ManualDeathAnimation = true,
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		ActivateFadeIn = false,
		ActivateTint = false,
		ActivateStartAlpha = 1.0,
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
	LightRanged = {
		DefaultAIData = game.DeepCopyTable(game.EnemyData.LightRanged.DefaultAIData),
	},
	LightRangedSuperElite = {
		-- Since we need to modify another property separately
		DefaultAIData = game.DeepCopyTable(game.EnemyData.LightRanged.DefaultAIData),
	},
	-- #endregion
	-- #region TARTARUS - Megaera
	-- Setting this to an empty table in the enemy doesn't work, so resetting the keys that break the animations here
	Harpy = {
		InheritFrom = { "BaseBossEnemy", "HadesBossBaseVulnerableEnemy" },
	},
	Harpy3 = {
		MapTransitionReactionVoiceLines = {
			-- Removing the Zagreus voicelines that are still in the VO file
			[2] = mod.NilValue,
		}
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
	BloodlessNakedBerserker = game.DeepCopyTable(game.EnemyData.BloodlessBerserker),
	BloodlessNakedBerserkerElite = game.DeepCopyTable(game.EnemyData.BloodlessBerserker_Elite),
	HadesSpreadShotUnit = game.DeepCopyTable(game.EnemyData.SpreadShotUnit),
	HadesSpreadShotUnitElite = game.DeepCopyTable(game.EnemyData.SpreadShotUnit_Elite),
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
	Crawler = {
		DefaultAIData = { DeepInheritance = true, },
		WeaponOptions = { "HadesCrawlerRush" },
	},
	CrawlerMiniBoss = {
		DefaultAIData = { DeepInheritance = true, },
	},
	Hades = {
		InheritFrom = { "BaseBossEnemy", "HadesBossBaseVulnerableEnemy" },
	},
	ModsNikkelMHadesBiomesHadesTombstone = {
		InheritFrom = { "BaseTrap" },
		ActivateAnimation = "ModsNikkelMHadesBiomesHadesTombstoneSpawn",
		ActivateFx = "nil",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesOnDeathFireProjectile",
		OnDeathFunctionArgs = {
			FunctionName = _PLUGIN.guid .. "." .. "HitByGraveHandsPresentation",
			ProjectileName = "HadesGraspingHands",
		},
	},
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
	},
	PunchingBagUnitElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", "Metallic", }),
	},
	PunchingBagUnitSuperElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", "Metallic", }),
	},
	BaseThug = {
		LargeUnitCap = mod.NilValue,
	},
	HeavyMelee = {
		StunAnimations = { Default = "EnemyWretchThugOnHit" },
	},
	HeavyMeleeElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", "Metallic", }),
	},
	DisembodiedHand = {
		StunAnimations = { Default = "EnemyWringerOnHit" },
		GeneratorData = {
			BlockSolo = true,
		},
	},
	DisembodiedHandElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", "Metallic", }),
		GeneratorData = {
			BlockSolo = true,
		},
	},
	DisembodiedHandSuperElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", "Metallic", }),
		GeneratorData = {
			BlockSolo = true,
		},
	},
	BaseCaster = {
		AIAggroRange = 1250,
		LargeUnitCap = mod.NilValue,
	},
	LightRanged = {
		StunAnimations = { Default = "EnemyWretchCasterOnHit" },
	},
	LightRangedSuperElite = {
		DefaultAIData = {
			TakeCoverDuration = 3.0,
		},
	},
	BaseThief = {
		DestroyDelay = 0.0,
	},
	ThiefMineLayer = {
		StunAnimations = { Default = "EnemyWretchThiefOnHit" },
		-- The intro encounter is broken, there is nothing happening after the two enemies die
		RequiredIntroEncounter = mod.NilValue,
		DefaultAIData = {
			PostAttackDuration = 0.75,
		},
	},
	ThiefMineLayerElite = {
		DefaultAIData = {
			AttackWhileBlendingIntervalMin = 1.5,
			AttackWhileBlendingIntervalMax = 2.0,
			PostAttackDuration = 0.5,
		},
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", }),
	},
	HeavyRanged = {
		StunAnimations = { Default = "HeavyRangedCrystal4" },
		ActivateFadeIn = true,
		ActivateTint = true,
		ActivateStartAlpha = 0.0,
		Tethers = {
			[1] = { Distance = 20 },
			[2] = { Distance = 20 },
			[3] = { Distance = 20 }
		},
		SpawnEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "CreateTethers",
				Threaded = true,
			},
		},
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
	},
	Swarmer = {
		StunAnimations = { Default = "EnemyWretchSwarmerAlert", },
		WeaponOptions = { "HadesSwarmerMelee" },
		BlockAttributes = { "Orbit", "Vacuum", },
	},
	SwarmerElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", }),
	},
	SwarmerSuperElite = {
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", }),
	},
	LightSpawner = {
		StunAnimations = { Default = "SpawnerAttackAnim", },
		WeaponOptions = { "HadesLightSpawnerSpawnerWeapon", },
		DefaultAIData = { DeepInheritance = true, },
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		OnDamagedFunctionName = "AggroSpawns",
		BlockRaiseDead = true,
		BlockCharm = true,
		BlockRespawnShrineUpgrade = true,
		EliteAttributeOptions = { "Fog", "HeavyArmor", "Orbit", "Radial", },
	},
	-- #endregion
	-- #region TARTARUS - Minibosses
	HeavyRangedSplitterMiniboss = {
		MaxHealth = 950,
		HealthBuffer = 1650,
		StunAnimations = { Default = "HeavyRangedSplitterCrystalHit", },
		SpawnEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "CreateTethers",
				Threaded = true,
			},
		},
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesMiniBossHeavyRangedSplitterDeath",
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		ImmuneToPolymorph = true,
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
		OnDamagedFireProjectilesCooldown = 0.3,
		OnDamagedWeapons = mod.NilValue,
	},
	HeavyRangedSplitterMinibossSuperElite = {
		MaxHealth = 1650,
		HealthBuffer = 3200,
		StunAnimations = { Default = "HeavyRangedSplitterCrystalHit", },
		SpawnEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "CreateTethers",
				Threaded = true,
			},
		},
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesMiniBossHeavyRangedSplitterDeath",
		-- Explicitly allow raising with Night Bloom
		BlockRaiseDead = false,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		ImmuneToPolymorph = true,
		DefaultAIData = {
			-- How long it waits before moving again while firing the beams
			FireDuration = 5.75,
			-- Sort of acts as a PreAttackDuration as well
			MoveWithinRangeTimeoutMin = 1.5,
			MoveWithinRangeTimeoutMax = 2.0,
		},
		OnDamagedFireProjectiles = {
			{
				ProjectileName = "SpawnSplitterFragmentSuperElite",
				Requirements = { MaxUnitsByType = { HeavyRangedSplitterFragmentSuperElite = 12 } },
			},
		},
		OnDamagedFireProjectilesCooldown = 0.2,
		OnDamagedWeapons = mod.NilValue,
	},
	HeavyRangedSplitterFragment = {
		MaxHealth = 40,
		HealthBuffer = 50,
		StunAnimations = { Default = "HeavyRangedSplitterFragment", },
		UseActivatePresentation = false,
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		RunHistoryKilledByName = "HeavyRangedSplitterMiniboss",
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
	},
	HeavyRangedSplitterFragmentSuperElite = {
		HealthBuffer = 70,
		StunAnimations = { Default = "HeavyRangedSplitterFragment", },
		UseActivatePresentation = false,
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		RunHistoryKilledByName = "HeavyRangedSplitterMinibossSuperElite",
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
	},
	WretchAssassin = {
		MaxHealth = 400,
		HealthBuffer = 950,
		StunAnimations = { Default = "EnemyWretchAssassinOnHit" },
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		DefaultAIData = {
			PreAttackEndFunctionName = _PLUGIN.guid .. "." .. "EnemyHandleInvisibleAttack",
		},
	},
	WretchAssassinMinibossSuperElite = {
		-- Still targets the player for some reason
		BlockRaiseDead = true,
	},
	-- #endregion
	-- #region TARTARUS - Bosses
	HarpySupportUnit = {
		AIOptions = { _PLUGIN.guid .. "." .. "HarpySupportAI" },
		-- Otherwise, doesn't get cleaned up after boss kill as of the Unseen Update
		RequiredKill = true,
	},
	Harpy = {
		-- Base Health: 4400
		-- EM Health: 4800
		-- Hecate Health: 6050
		-- Hecate EM Health: 7250
		-- Polyphemus Health: 8400
		-- Polyphemus EM Health: 10200
		-- Note that this is still multiplied by the ModdedUnitMaxHealthMultiplierBonus
		MaxHealth = 8200,
		ShrineDataOverwrites = {
			MaxHealth = 8800,
		},
		SubtitleColor = game.Color.MegVoice,
		RunHistoryKilledByName = "NPC_FurySister_01",
		ImmuneToPolymorph = true,
		AdditionalEnemySetupFunctionName = _PLUGIN.guid .. "." .. "SelectHarpySupportAIs",
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "HarpyKillPresentation",
	},
	Harpy2 = {
		-- Base Health: 4600
		-- EM Health: 4900
		MaxHealth = 8400,
		ShrineDataOverwrites = {
			MaxHealth = 9000,
		},
		SubtitleColor = game.Color.AlectoVoice,
		-- Gets overwritten by the Harpy value if not set
		RunHistoryKilledByName = "Harpy2",
		AdditionalEnemySetupFunctionName = _PLUGIN.guid .. "." .. "SelectHarpySupportAIs",
		EnragedPresentation = _PLUGIN.guid .. "." .. "HarpyEnragedPresentation",
		AIStages = {
			[1] = { ThreadedFunctions = { _PLUGIN.guid .. "." .. "HandleHarpyRage", }, },
			[4] = { ThreadedFunctions = { _PLUGIN.guid .. "." .. "EnrageHarpyPermanent", }, },
		},
	},
	Harpy3 = {
		-- Base Health: 5200
		-- EM Health: 5600
		MaxHealth = 8600,
		ShrineDataOverwrites = {
			MaxHealth = 9200,
		},
		SubtitleColor = game.Color.TisiphoneVoice,
		RunHistoryKilledByName = "Harpy3",
		AdditionalEnemySetupFunctionName = _PLUGIN.guid .. "." .. "SelectHarpySupportAIs",
		BossPresentationTextLineSets = {
			Fury3Encounter10 = {
				EndVoiceLines = {
					[1] = {
						[1] = { Cue = "/VO/Megaera_0289" }
					},
				},
			},
		},
		AIStages = {
			[2] = { ThreadedFunctions = { _PLUGIN.guid .. "." .. "Harpy3MapTransition", }, },
			[3] = { ThreadedFunctions = { _PLUGIN.guid .. "." .. "Harpy3MapTransition", }, },
		},
	},
	-- #endregion
	-- #endregion

	-- #region ASPHODEL
	-- #region ASPHODEL - Regular
	LightSpawnerElite = {
		StunAnimations = { Default = "SpawnerAttackAnim", },
		WeaponOptions = { "HadesLightSpawnerEliteSpawnerWeapon", },
		DefaultAIData = { DeepInheritance = true, },
		OnDamagedFunctionName = "AggroSpawns",
	},
	-- Need to manually modify these fields, as the enemies are DeepCopyTable'd from Hades II above
	HadesBloodlessNaked = {
		-- Flag that indicates the enemy is originally from Hades II, and we are just overwriting some properties
		-- Used e.g. for the Zeus Blitz effect location
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessNakedElite" },
		},
	},
	HadesBloodlessNakedElite = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessNaked" },
		},
		BlockAttributes = { "Blink", "Orbit", },
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", }),
	},
	HadesBloodlessNakedEliteSuperElite = {
		BlockAttributes = { "Blink", "Orbit", },
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", }),
	},
	BloodlessNakedBerserker = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		RequiredIntroEncounter = "BerserkerIntro",
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "BloodlessNakedBerserkerElite" },
		},
	},
	BloodlessNakedBerserkerElite = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "BloodlessNakedBerserker" },
		},
		BlockAttributes = { "Blink", "Orbit", },
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Rifts", "Metallic", }),
	},
	HadesBloodlessWaveFist = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		RequiredIntroEncounter = "WaveFistIntro",
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessWaveFistElite" },
		},
	},
	HadesBloodlessWaveFistElite = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessWaveFist" },
		},
		BlockAttributes = { "Blink", "Orbit", },
	},
	HadesBloodlessGrenadier = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessGrenadierElite" },
		},
	},
	HadesBloodlessGrenadierElite = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessGrenadier" },
		},
		BlockAttributes = { "Blink", "Orbit", },
	},
	HadesBloodlessSelfDestruct = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		RequiredIntroEncounter = "SelfDestructIntro",
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessSelfDestructElite" },
		},
	},
	HadesBloodlessSelfDestructElite = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessSelfDestruct" },
		},
		BlockAttributes = { "Blink", "Orbit", },
	},
	HadesBloodlessPitcher = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		RequiredIntroEncounter = "PitcherIntro",
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessPitcherElite" },
		},
	},
	HadesBloodlessPitcherElite = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		ActivateFx = "EnemySummonRune",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesBloodlessPitcher" },
		},
		BlockAttributes = { "Blink", "Orbit", },
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", "Metallic", }),
	},
	HadesBloodlessPitcherSuperElite = {
		BlockAttributes = { "Blink", "Orbit", },
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", "Metallic", }),
	},
	HadesSpreadShotUnit = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
		ActivateFx = "EnemySummonRuneMedium",
		ActivateFx2 = "nil",
		ActivateFxPreSpawn = "nil",
		GeneratorData = {
			BlockEnemyTypes = { "HadesSpreadShotUnitElite" },
		},
	},
	HadesSpreadShotUnitElite = {
		ModsNikkelMHadesBiomesOriginalHadesTwoEnemy = true,
		LoadPackages = { "BiomeB", },
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
		ManualDeathAnimation = false,
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
		BlockAttributes = { "Blink", "Orbit", },
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Hex", }),
	},
	RangedBurrowerSuperElite = {
		-- Give it the elite weapon instead of the normal one
		WeaponOptions = { "RangedBurrowerBurrow", "RangedBurrowerWeaponElite" },
		BlockAttributes = { "Blink", "Orbit", },
	},
	CrusherUnit = {
		StunAnimations = { Default = "CrusherUnitOnHit" },
		-- Don't create a new blank obstacle for this enemy, as the flipping logic would be hard to get right
		ManualDeathAnimation = false,
		DestroyDelay = 1.2,
		BlockRaiseDead = true,
		BlockCharm = true,
		IgnoreSpeedShrine = true,
		OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "CrusherUnitTouchdown",
			PostTouchdownMakeVulnerable = true,
		},
		PostAggroAI = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSkyAttackerAI",
		DefaultAIData = {
			PostTouchdownMinDuration = 1.2,
		},
	},
	CrusherUnitSuperElite = {
		MaxHealth = 1100,
		HealthBuffer = 2800,
		StunAnimations = { Default = "CrusherUnitOnHit" },
		-- Don't create a new blank obstacle for this enemy, as the flipping logic would be hard to get right
		ManualDeathAnimation = false,
		DestroyDelay = 1.2,
		-- Don't allow Night Bloom, the SkyAttackerAI doesn't work with it
		BlockRaiseDead = true,
		BlockCharm = true,
		IgnoreSpeedShrine = true,
		OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "CrusherUnitTouchdown",
			PostTouchdownMakeVulnerable = true,
		},
		PostAggroAI = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSkyAttackerAI",
		DefaultAIData = {
			PostTouchdownMinDuration = 1.2,
		},
	},
	ShieldRanged = {
		MaxHealth = 480,
		StunAnimations = { Default = "HealRangedCrystal4" },
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		BlockRaiseDead = true,
		BlockCharm = true,
		Tethers = {
			[1] = { Distance = 20 },
			[2] = { Distance = 20 },
			[3] = { Distance = 20 }
		},
		SpawnEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "CreateTethers",
				Threaded = true,
			},
		},
	},
	ShieldRangedSuperElite = {
		HealthBuffer = 900,
		Tethers = {
			[1] = { Distance = 20 },
			[2] = { Distance = 20 },
			[3] = { Distance = 20 }
		},
		SpawnEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "CreateTethers",
				Threaded = true,
			},
		},
	},
	-- #endregion
	-- #region ASPHODEL - Minibosses
	ShieldRangedMiniBoss = {
		MaxHealth = 1900,
		HealthBuffer = 4700,
		StunAnimations = { Default = "HealRangedCrystal4" },
		DeathAnimation = "HealRangedDeathMiniBoss",
		DeathFx = "null",
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		BlockRaiseDead = true,
		BlockCharm = true,
		Tethers = {
			[1] = { Distance = 30 },
			[2] = { Distance = 30 },
			[3] = { Distance = 30 }
		},
		SpawnEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "CreateTethers",
				Threaded = true,
			},
		},
	},
	SpreadShotUnitMiniboss = {
		MaxHealth = 700,
		HealthBuffer = 1100,
		-- In Hades II, projectiles can't be destroyed by attacks by default
		-- So we change the difficulty introduced by the shrine to have all four enemies attack at once, as the invulnerable projectiles are actually easier to dodge than the normal attacks
		-- We also remove the ShrineWeaponOptionsOverwrite, so we don't use the invulnerable projectiles at all
		-- As the default difficulty increases, the cooldowns for the attacks are increased slightly in the WeaponData
		-- The typo is intentional
		ShrineDefualtAIDataOverwrites = {
			MaxAttackers = 4,
		},
		ShrineWeaponOptionsOverwrite = mod.NilValue,
		BlockRaiseDead = true,
	},
	HitAndRunUnit = {
		MaxHealth = 1650,
		ManualDeathAnimation = false,
		DestroyDelay = 3.0,
		BlockRaiseDead = true,
		BlockCharm = true,
		ImmuneToPolymorph = true,
		BlockRespawnShrineUpgrade = true,
	},
	HitAndRunUnitSuperElite = {
		BlockRaiseDead = false,
	},
	CrusherUnitElite = {
		MaxHealth = 800,
		HealthBuffer = 1550,
		BlockAttributes = { "Blink", "Orbit", "Fog", "Frenzy", "ManaDrain", "Molten", "Unflinching", "Vacuuming", },
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		ImmuneToPolymorph = true,
		IgnoreSpeedShrine = true,
		OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "CrusherUnitTouchdown",
			PostTouchdownMakeVulnerable = true,
			-- Also fire this projectile if the Vow of Shadows is active
			ShrineProjectileName = "CrusherUnitSlamUpgraded",
			ShrineMetaUpgradeName = "MinibossCountShrineUpgrade",
			ShrineMetaUpgradeRequiredLevel = 1,
		},
	},
	-- #endregion
	-- #region ASPHODEL - Bosses
	HydraHeadImmortal = {
		-- Base Health: 6000
		-- Eris Health: 16000
		-- Note that this is still multiplied by the ModdedUnitMaxHealthMultiplierBonus
		MaxHealth = 13500,
		AltHealthBarTextIds = {
			[1] = {
				GameStateRequirements = { RequiredPlayed = { "/VO/ZagreusField_3147" } },
				Requirements = mod.NilValue,
			},
		},
		BossDifficultyShrineRequiredCount = 2,
		OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "HydraTouchdown",
			-- Lining up with when the head actually touches the ground
			Delay = 0.23,
		},
		ImmuneToPolymorph = true,
		-- SpawnEvents = { { FunctionName = _PLUGIN.guid .. "." .. "CreateTethers", Threaded = true, }, },
		-- While Tethers are broken - enemy returns to spawnpoint after attacking
		DefaultAIData = {
			MoveToId = 480903,
			MoveWithinRange = true,
			MoveWithinRangeTimeout = 1.0,
		},
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "HydraKillPresentation",
		PactDataStage2 = {
			[2] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[3] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[4] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
		},
	},
	HydraHeadImmortalLavamaker = {
		PactDataStage2 = {
			[2] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[3] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[4] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
		},
	},
	HydraHeadImmortalSummoner = {
		PactDataStage2 = {
			[2] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[3] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[4] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
		},
	},
	HydraHeadImmortalSlammer = {
		PactDataStage2 = {
			[2] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[3] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[4] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
		},
	},
	HydraHeadImmortalWavemaker = {
		PactDataStage2 = {
			[2] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[3] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
			[4] = { TransitionFunction = _PLUGIN.guid .. "." .. "HydraFinalStageTransition", },
		},
	},
	-- Spawned heads
	BaseHydraHead = {
		-- Note that this is still multiplied by the ModdedUnitMaxHealthMultiplierBonus
		MaxHealth = 700,
		HealthBuffer = 700,
		StunAnimations = { Default = "EnemyHydraOnHit" },
		ManualDeathAnimation = false,
		OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "HydraTouchdown",
			-- Lining up with when the head actually touches the ground
			Delay = 0.23,
		},
		-- SpawnEvents = { { FunctionName = _PLUGIN.guid .. "." .. "CreateTethers", Threaded = true, }, },
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
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
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
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		ImmuneToPolymorph = true,
		OnHitShake = { Distance = 3, Speed = 300, Duration = 0.15 },
		DefaultAIData = {
			DeepInheritance = true,
			SpawnOptions = { "HadesBloodlessNaked" },
			HatchDuration = 5,
		},
		TriggerGroups = { "HeroTeam" },
		StartCharmedDataOverrides = { TriggerGroups = { "EnemyTeam" }, },
		IncomingDamageModifiers = { { NonPlayerMultiplier = 0.0, }, },
		AIOptions = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesHydraToothAI", },
	},
	HydraTooth2 = {
		MaxHealth = 150,
		WeaponOptions = mod.NilValue,
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
	BaseShade = {
		DestroyDelay = 0.0,
		ModsNikkelMHadesBiomesBlockOnDeathWeaponIfThanatosCursed = true
	},
	ShadeNaked = {
		StunAnimations = { Default = "ShadeNaked_Idle" },
		-- Push the Shade away after spawning so it has to move to the pickupTarget
		PostActivateEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesShadeNakedPostActivate",
				Args = { ForceMin = 3200, ForceMax = 3300, AngleOffsetMin = -60, AngleOffsetMax = 60, },
			},
		},
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		DeathAnimation = "ShadeNakedDeathVFX",
		DeathFx = "null",
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesShadeNakedDeath",
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		AIOptions = { _PLUGIN.guid .. "." .. "PickupAI", },
	},
	ShadeNakedElite = {
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		DeathAnimation = "ShadeNakedDeathVFX",
		DeathFx = "null",
		EliteAttributeOptions = {},
	},
	ShadeNakedSuperElite = {
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		DeathAnimation = "ShadeNakedDeathVFX",
		DeathFx = "null",
	},
	ShadeSpearUnit = {
		StunAnimations = { Default = "ShadeSpear_OnHit" },
		SpawnUnitOnDeath = "ShadeNaked",
		DefaultAIData = {
			LeapSpeed = 1800,
			LeapPrepareTime = 0.5,
			LeapRecoveryTime = 0.75,
			LeapOffsetRange = 450,
		},
		SkipActivatePresentationOnSpawns = true,
		OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "ShadeSpearTouchdown",
		},
		-- If charmed/resurrected on the player's team, don't spawn a ShadeNaked on death
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeSpearUnitElite = {
		SpawnUnitOnDeath = "ShadeNakedElite",
		EliteAttributeOptions = game.CombineTables(
			game.EnemySets.GenericEliteAttributes,
			game.EnemySets.ShadeOnlyEliteAttributes
		),
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeSpearUnitSuperElite = {
		SpawnUnitOnDeath = "ShadeNakedSuperElite",
		EliteAttributeOptions = game.CombineTables(
			game.EnemySets.GenericEliteAttributes,
			game.EnemySets.ShadeOnlyEliteAttributes
		),
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeBowUnit = {
		StunAnimations = { Default = "ShadeBow_OnHit" },
		SpawnUnitOnDeath = "ShadeNaked",
		SkipActivatePresentationOnSpawns = true,
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeBowUnitElite = {
		SpawnUnitOnDeath = "ShadeNakedElite",
		EliteAttributeOptions = game.CombineTables(
			game.CombineTables(
				game.CombineTables(
					game.EnemySets.GenericEliteAttributes,
					game.EnemySets.RangedOnlyEliteAttributes
				),
				game.EnemySets.ShadeOnlyEliteAttributes),
			{ "Hex" }
		),
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeBowUnitSuperElite = {
		SpawnUnitOnDeath = "ShadeNakedSuperElite",
		EliteAttributeOptions = game.CombineTables(
			game.CombineTables(
				game.CombineTables(
					game.EnemySets.GenericEliteAttributes,
					game.EnemySets.RangedOnlyEliteAttributes
				),
				game.EnemySets.ShadeOnlyEliteAttributes),
			{ "Hex" }
		),
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeShieldUnit = {
		StunAnimations = { Default = "ShadeShield_OnHit" },
		SpawnUnitOnDeath = "ShadeNaked",
		SkipActivatePresentationOnSpawns = true,
		ProjectileBlockPresentationFunctionName = "UnitInvulnerableHitPresentation",
		InvulnerableHitFx = "ShadeShieldBlock",
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeShieldUnitElite = {
		SpawnUnitOnDeath = "ShadeNakedElite",
		EliteAttributeOptions = game.CombineTables(
			game.EnemySets.GenericEliteAttributes,
			game.EnemySets.ShadeOnlyEliteAttributes
		),
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeShieldUnitSuperElite = {
		SpawnUnitOnDeath = "ShadeNakedSuperElite",
		EliteAttributeOptions = game.CombineTables(
			game.EnemySets.GenericEliteAttributes,
			game.EnemySets.ShadeOnlyEliteAttributes
		),
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeSwordUnit = {
		StunAnimations = { Default = "ShadeSword_OnHit" },
		SpawnUnitOnDeath = "ShadeNaked",
		SkipActivatePresentationOnSpawns = true,
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeSwordUnitElite = {
		SpawnUnitOnDeath = "ShadeNakedElite",
		EliteAttributeOptions = game.CombineTables(
			game.EnemySets.GenericEliteAttributes,
			game.EnemySets.ShadeOnlyEliteAttributes
		),
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	ShadeSwordUnitSuperElite = {
		SpawnUnitOnDeath = "ShadeNakedSuperElite",
		EliteAttributeOptions = game.CombineTables(
			game.EnemySets.GenericEliteAttributes,
			game.EnemySets.ShadeOnlyEliteAttributes
		),
		SpellSummonDataOverrides = {
			SpawnUnitOnDeath = "nil",
		},
	},
	SplitShotUnit = {
		StunAnimations = { Default = "EnemyWretchCasterOnHit_SplitShot" },
		DeathAnimation = "EnemyWretchCasterDeath_SplitShot",
	},
	Chariot = {
		LargeUnitCap = mod.NilValue,
		StunAnimations = { Default = "ChariotOnHit" },
		-- IgnoreCastSlow = true,
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
					Value = 950,
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
	ChariotSuperElite = {
		DefaultAIData = {
			RamEffectProperties = {
				{
					Property = "Speed",
					Value = 950,
				},
			},
			RamEffectResetProperties = {
				{
					Property = "Speed",
					Value = 500,
				},
			},
		},
	},
	ChariotSuicide = {
		LargeUnitCap = mod.NilValue,
		StunAnimations = { Default = "ChariotSuicideOnHit" },
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		-- IgnoreCastSlow = true,
		DefaultAIData = {
			PreAttackAngleTowardTarget = false,
			AttackDistanceBuffer = 0,
			StopMoveWithinRange = false,
			RamEffectName = mod.NilValue,
			RamEffectProperties = {
				{
					Property = "Speed",
					Value = 830,
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
			RamDistance = 120,
			OnFiredFunctionName = "SelfDestruct",
		},
		WeaponOptions = { "ChariotRamDeathWeapon" },
	},
	FlurrySpawner = {
		StunAnimations = { Default = "SoulSpawnerIdle" },
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		DestroyDelay = mod.NilValue,
	},
	FlurrySpawnerSuperElite = {
		-- For some reason EnemyPointRanged doesn't exist in D_Boss01, and setting this to nil doesn't work
		RequiredSpawnPoint = "EnemyPointMelee",
		BlockAttributes = { "Rifts", "Homing", "Tracking", "Unflinching", "Frenzy" },
		-- Explicitly allow raising with Night Bloom
		BlockRaiseDead = false,
	},
	-- #endregion
	-- #region ELYSIUM - Minibosses
	FlurrySpawnerElite = {
		MaxHealth = 2200,
		HealthBuffer = 2800,
		DeathAnimation = "SoulSpawnerDeathMiniboss",
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		-- To not block the Dash/Blink
		IgnoreCastSlow = true,
	},
	-- #endregion
	-- #region ELYSIUM - Bosses
	Minotaur = {
		-- Base Health: 14000
		-- Prometheus Health: 33000
		-- Heracles Health: 34000
		-- Note that this is still multiplied by the ModdedUnitMaxHealthMultiplierBonus
		MaxHealth = 18500,
		SubtitleColor = game.Color.MinotaurVoice,
		OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "MinotaurOverheadTouchdown",
			-- Moves the damage cone in front of the Minotaur to line up with the Axe and not the character
			SpawnDistance = 90,
			CalcOffset = true,
			CalcAngle = true,
		},
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "TheseusMinotaurKillPresentation",
		ManualDeathAnimation = false,
		PreBossAISetupFunctionName = "SetupComboPartners",
		ImmuneToPolymorph = true,
		EnragedPresentation = _PLUGIN.guid .. "." .. "TheseusEnragedPresentation",
	},
	Minotaur2 = {
		-- Base Health: 16000
		MaxHealth = 18500,
		OnTouchdownFunctionArgs = {
			ProjectileName = "MinotaurArmoredOverheadTouchdown",
			SpawnDistance = 90,
			CalcOffset = true,
			CalcAngle = true,
		},
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "TheseusMinotaurKillPresentation",
		EnragedPresentation = _PLUGIN.guid .. "." .. "TheseusEnragedPresentation",
	},
	Theseus = {
		-- Base Health: 9000
		MaxHealth = 14000,
		SubtitleColor = game.Color.TheseusVoice,
		-- Doesn't seem to be used
		OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUnitTouchdown",
		OnTouchdownFunctionArgs = {
			ProjectileName = "TheseusSpearTouchdown",
		},
		ProjectileBlockPresentationFunctionName = "UnitInvulnerableHitPresentation",
		InvulnerableHitFx = "ShadeShieldBlock",
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "TheseusMinotaurKillPresentation",
		ManualDeathAnimation = false,
		PreBossAISetupFunctionName = "SetupComboPartners",
		ImmuneToPolymorph = true,
		AdditionalEnemySetupFunctionName = _PLUGIN.guid .. "." .. "SelectTheseusGod",
		EnragedPresentation = _PLUGIN.guid .. "." .. "TheseusEnragedPresentation",
		OnDamagedFunctionName = _PLUGIN.guid .. "." .. "TheseusDamaged",
		AIStages = {
			[2] = { RandomAIFunctionNames = { _PLUGIN.guid .. "." .. "TheseusGodAI" }, },
		},
	},
	Theseus2 = {
		-- Base Health: 12000
		MaxHealth = 15000,
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "TheseusMinotaurKillPresentation",
		OnDamagedFunctionName = _PLUGIN.guid .. "." .. "Theseus2Damaged",
		AIStages = {
			[1] = { RandomAIFunctionNames = { _PLUGIN.guid .. "." .. "TheseusChariotAI" }, },
			[2] = { RandomAIFunctionNames = { _PLUGIN.guid .. "." .. "TheseusGodAI" }, },
		},
	},
	-- #endregion
	-- #endregion

	-- #region STYX
	-- #region STYX - Regular
	SatyrRanged = {
		LargeUnitCap = mod.NilValue,
		StunAnimations = { Default = "SatyrOnHit" },
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		ActivateDuration = 0.4,
		-- Their poison doesn't damage enemies
		BlockCharm = true,
		BlockRaiseDead = true,
	},
	SatyrRangedElite = {
		EliteAttributeOptions = game.CombineTables(
			game.CombineTables(
				game.EnemySets.GenericEliteAttributes,
				game.EnemySets.RangedOnlyEliteAttributes
			),
			{ "Hex", "Metallic", }
		),
	},
	RatThug = {
		LargeUnitCap = mod.NilValue,
		StunAnimations = { Default = "EnemyRatThugOnHit" },
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		OnDeathThreadedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesOnDeathFireProjectile",
		OnDeathFunctionArgs = {
			ProjectileName = "HadesPoisonPuddle",
		},
		-- Don't allow poison attack when summoned on the player's side
		SpellSummonDataOverrides = {
			WeaponOptions = {
				"RatThugMelee"
			},
		},
	},
	Crawler = {
		IgnoreSpeedShrine = true,
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		SpellSummonDataOverrides = {
			DeepInheritance = true,
			OutgoingDamageModifiers = { { NonPlayerMultiplier = 25, }, },
			MaxHealth = 150,
			HealthBarOffsetY = -200,
		},
	},
	HeavyRangedForked = {
		StunAnimations = { Default = "HeavyRangedForkedCrystal4" },
		DeathAnimation = "HeavyRangedForkedDeath",
		-- This plops a large model of the enemy on the ground which doesn't disappear
		SpawnObstaclesOnDeath = mod.NilValue,
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
	},
	HeavyRangedForkedElite = {
		DeathAnimation = "HeavyRangedForkedDeath",
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Metallic", }),
	},
	ThiefImpulseMineLayer = {
		StunAnimations = { Default = "EnemyStyxThiefOnHit" },
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		ActivateDuration = 0.5,
		DefaultAIData = {
			BlendTimeoutMin = 0.5,
			BlendTimeoutMax = 1.0,
			AttackWhileBlendingIntervalMin = 0.5,
			AttackWhileBlendingIntervalMax = 1.0,
			AttackWhileMovingIntervalMin = 0.5,
			AttackWhileMovingIntervalMax = 1.0,
		},
	},
	ThiefImpulseMineLayerElite = {
		ActivateDuration = 0.5,
		DefaultAIData = {
			AttackWhileBlendingIntervalMin = 0,
			AttackWhileBlendingIntervalMax = 0.5,
			AttackWhileMovingIntervalMin = 0,
			AttackWhileMovingIntervalMax = 0.5,
		},
		EliteAttributeOptions = game.CombineTables(game.EnemySets.GenericEliteAttributes, { "Metallic", }),
	},
	-- #endregion
	-- #region STYX - Minibosses
	SatyrRangedMiniboss = {
		Health = 1800,
		HealthBuffer = 3100,
		ActivateDuration = 0.4,
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
	},
	RatThugMiniboss = {
		Health = 1800,
		HealthBuffer = 6200,
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
	},
	HeavyRangedForkedMiniboss = {
		Health = 1200,
		HealthBuffer = 5100,
		DeathAnimation = "HeavyRangedForkedMinibossDeath",
		SpawnObstaclesOnDeath = mod.NilValue,
		ModsNikkelMHadesBiomesIgnoreDeathAngle = true,
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
	},
	ThiefImpulseMineLayerMiniboss = {
		Health = 1450,
		HealthBuffer = 3000,
		ActivateDuration = 0.7,
		DefaultAIData = {
			BlendTimeoutMin = 0.5,
			BlendTimeoutMax = 1.0,
			AttackWhileBlendingIntervalMin = 0.5,
			AttackWhileBlendingIntervalMax = 1.0,
			AttackWhileMovingIntervalMin = 0.5,
			AttackWhileMovingIntervalMax = 1.0,
		},
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
	},
	CrawlerMiniBoss = {
		MaxHealth = 14000,
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesCrawlerMiniBossKillPresentation",
		OnDeathFunctionArgs = { Message = "ModsNikkelMHadesBiomes_CrawlerDefeatedMessage", },
		BlockRaiseDead = true,
		BlockCharm = true,
		BlockRespawnShrineUpgrade = true,
		IsBoss = false,
	},
	-- #endregion
	-- #region STYX - Bosses
	Hades = {
		-- Base Health: 17000
		-- Base EM Health: 22000
		-- Chronos Health: 20000
		-- Chronos EM Health: 22000
		-- Typhon Health: 65000
		-- Note that this is still multiplied by the ModdedUnitMaxHealthMultiplierBonus
		MaxHealth = 20000,
		ShrineDataOverwrites = {
			MaxHealth = 22500,
		},
		SubtitleColor = game.Color.HadesVoice,
		DestroyDelay = 0,
		-- It's misaligned/not tracking correctly
		Phase2VFX = mod.NilValue,
		BossDifficultyShrineRequiredCount = 4,
		SelectCustomSpawnOptions = _PLUGIN.guid .. "." .. "SetupHadesSpawnOptions",
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "HadesKillPresentation",
		DefaultAIData = {
			PreAttackEndFunctionName = _PLUGIN.guid .. "." .. "EnemyHandleInvisibleAttack",
			PostInvisibilityFunction = _PLUGIN.guid .. "." .. "HadesTeleport",
			-- A little quicker to line up with the smoke better
			InvisibilityFadeOutDuration = 0.4,
			DashRequireLoS = true,
			SpawnCountDampenTraits = { HadesChronosDebuffBoon = true, },
			-- If we are on EM4, Deep Dissent's effect is converted into spawning normal Super Elite enemies, instead of fewer enemies, so don't apply the original effect
			SpawnCountDampenShrineUpgrade = "BossDifficultyShrineUpgrade",
			SpawnCountDampenMaxShrineLevel = 3,
		},
		-- Handled by the Cast projectile itself
		OutgoingDamageModifiers = mod.NilValue,
		ImmuneToPolymorph = true,
		RunHistoryKilledByName = "NPC_Hades_01",
		-- Moving EM voiceline to a custom lower priority to prevent it playing instead of a story event
		BossPresentationSuperPriorityIntroTextLineSets = {
			LordHadesExtremeMeasures01 = mod.NilValue,
		},
		BossPresentationHighPriorityIntroTextLineSets = {
			LordHadesExtremeMeasures01 = {
				PlayOnce = true,
				PreEventWait = 1.0,
				RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 4 },
				EndVoiceLines = {
					UsePlayerSource = true,
					PreLineWait = 1.25,
					-- Let's go!
					{ Cue = "/VO/ZagreusField_4330" },
				},
				{
					Cue = "/VO/HadesField_0611",
					PreLineWait = 0.35,
					Text =
					"I was reviewing the terms of the Pact of Punishment to which you are bound. Even when my servants resort to extreme measures, they were still unable to surpass you, then. So now, it is my turn."
				},
				{
					Cue = "/VO/ZagreusField_4329",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Caught you unprepared, did I? After Theseus and his Macedonian, I half-expected to see you thundering around on some golden chariot of your own, drawn by sable steeds, that sort of thing. But it's just you."
				},
				{
					Cue = "/VO/HadesField_0612",
					PostLineAnim = "HadesBattleIntro",
					Portrait = "Portrait_Hades_HelmCape_01",
					AngleTowardTargetId = 40000,
					PreLineFunctionName = "StartFinalBossRoomIntroMusic",
					PostLineFunctionName = "StartFinalBossRoomMusic",
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal3",
					PreLineWait = 0.35,
					Text =
					"It is just me, indeed. However... that should be more than necessary, here. No holding back this time, Zagreus. Are you ready?"
				},
			},
		},
	},
	HadesAmmo = {
		MaxHealth = 350,
		AIOptions = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesAttackAndDie", },
		AttackTimerOffsetY = -170,
		UseActivatePresentation = false,
		IgnoreCastSlow = true,
		BlockRaiseDead = true,
		BlockRespawnShrineUpgrade = true,
		BlockCharm = true,
		ImmuneToPolymorph = true,
		RunHistoryKilledByName = "NPC_Hades_01",
	},
	NPC_Hades_Story_02 = {
		IsBoss = false,
	},
	-- #endregion
	-- #endregion

	-- #region ENVIRONMENT
	Breakable = {
		CannotDieFromDamage = true,
		OnDamagedFunctionName = _PLUGIN.guid .. "." .. "BreakableOnHitModsNikkelMHadesBiomes",
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
		-- TODO: For all - only one of these should be active at a time, depending on the unlocks
		ValueOptions = {
			[1] = { GameStateRequirements = { PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBreakableValue1" }, RequiredCosmetics = mod.NilValue, RequiredFalseCosmetics = mod.NilValue, }, },
			[2] = { GameStateRequirements = { PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBreakableValue1" }, RequiredCosmetics = mod.NilValue, RequiredFalseCosmetics = mod.NilValue, }, },
			[3] = { GameStateRequirements = { PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBreakableValue1" }, RequiredCosmetics = mod.NilValue, RequiredFalseCosmetics = mod.NilValue, }, },
		},
	},
	BreakableAsphodel = {
		CannotDieFromDamage = true,
		OnDamagedFunctionName = _PLUGIN.guid .. "." .. "BreakableOnHitModsNikkelMHadesBiomes",
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
		OnDamagedFunctionName = _PLUGIN.guid .. "." .. "BreakableOnHitModsNikkelMHadesBiomes",
		DeathAnimation = "BreakableDeathElysium",
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
	BreakableStyx = {
		CannotDieFromDamage = true,
		OnDamagedFunctionName = _PLUGIN.guid .. "." .. "BreakableOnHitModsNikkelMHadesBiomes",
		DeathAnimation = "BreakableDeathStyx",
		DeathSound = "/SFX/CeramicPotSmash",
		SetupEvents = {
			{
				FunctionName = "RandomizeObject",
				Args = {
					RandomizeSets = {
						{ Animation = { "BreakableStyxIdle1" }, },
						{ Animation = { "BreakableStyxIdle2" }, },
						{ Animation = { "BreakableStyxIdle3" }, },
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
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		OnDeathFireWeapons = { "BlastCubeExplosionElysium" },
		FuseWarningProjectileName = "ModsNikkelMHadesBiomesBlastWarningDecalElysium"
	},
	PhalanxTrap = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		-- Swapping to the actual DisabledAnimation doesn't work correctly, so to stop the snapping animation, we just use the Idle animation
		DisabledAnimation = "PhalanxTrapIdle",
		ProjectileName = "PhalanxTrapWeapon",
		AIAttackDistance = 150,
		OutgoingDamageModifiers = { { NonPlayerMultiplier = 15.0, }, },
		AIOptions = { _PLUGIN.guid .. "." .. "AttackOnlyGroups", },
	},
	PhalanxTrapPassive = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		DefaultAIData = {
			ProjectileName = "PhalanxTrapWeaponPassive",
			-- Moved in here from the normal Enemy data
			PreAttackFx = "ShieldCharge",
			PreAttackEndShake = true,
			PreAttackFlashSound = "/Leftovers/SFX/AuraOnLoud",
			PreAttackAnimation = "PhalanxTrapPreAttack",
			FireAnimation = "PhalanxTrapFire",
			PreAttackSound = "/SFX/TrapSet",
			ReloadedSound = "/Leftovers/Menu Sounds/TalismanMetalClankDown",
			SkipMovement = true,
			SkipAngleTowardTarget = true,
			PreAttackDuration = 0.6,
			PostAttackCooldown = 2.0,
			TargetSelf = true,
			TargetOffsetForward = 100,
		},
		AIOptions = { _PLUGIN.guid .. "." .. "PassiveAttack", },
	},
	ArcherTrap = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		DefaultAIData = {
			ProjectileName = "ArcherTrapWeapon",
			-- Moved in here from the normal Enemy data
			DisabledAnimation = "ArcherTrapDeactivated",
			PreAttackDuration = 2.0,
			FireDuration = 0.3,
			PostAttackDuration = 0.5,
			PostAttackCooldown = 3.0,
			PreAttackAnimation = "ArcherTrapPreAttack",
			FireAnimation = "ArcherTrapIdle",
			PostAttackAnimation = "ArcherTrapIdle",
			ReloadingLoopSound = "/SFX/TrapSettingLoop",
			ReloadedSound = "/SFX/ArcherTrapReloaded",
			PreAttackEndShake = true,
			SkipMovement = true,
			SkipAngleTowardTarget = true,
			TargetSelf = true,
			TargetOffsetForward = 100,
			IdleAnimation = "ArcherTrapIdle",
		},
		AIOptions = { _PLUGIN.guid .. "." .. "PassiveAttack", },
	},
	GasTrapPassive = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		DefaultAIData = {
			ProjectileName = "GasTrapWeaponPassive",
			-- Moved in here from the normal Enemy data
			AIAttackDistance = 100,
			AIResetDistance = 110,
			IdleAnimation = "GasTrapActivated",
			PreAttackAnimation = "GasTrapActivated",
			DisabledAnimation = "TrapFissureDisabled",
			PreAttackDuration = 3.0,
			PostAttackCooldownMin = 15.0,
			PostAttackCooldownMax = 20.0,
			PreAttackColor = game.Color.White,
			WakeUpDelayMin = 5.0,
			WakeUpDelayMax = 15.0,
			PostAttackFlash = false,
		},
		AIOptions = { _PLUGIN.guid .. "." .. "PassiveAttack", },
	},
	PoisonTrap = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		DefaultAIData = {
			ProjectileName = "PoisonTrapWeapon",
			-- Moved in here from the normal Enemy data
			IdleAnimation = "GasTrapPoisonIdle",
			PreAttackAnimation = "GasTrapPoisonActivated",
			DisabledAnimation = "GasTrapPoisonDisabled",
			PreAttackDuration = 1.5,
			PostAttackCooldown = 15.0,
			PreAttackColor = game.Color.White,
			WakeUpDelayMin = 5.0,
			WakeUpDelayMax = 15.0,
			PostAttackFlash = false,
		},
		AIOptions = { _PLUGIN.guid .. "." .. "PassiveAttack", },
	},
	SawTrap = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		DefaultAIData = {
			ProjectileName = "SawTrapWeapon",
			-- Moved in here from the normal Enemy data
			IdleAnimation = "SawTrapIdle",
			DisabledAnimation = "SawTrapDeactivated",
			PreAttackDuration = 0.5,
			FireDuration = 0.3,
			PostAttackDuration = 0.5,
			PostAttackCooldown = 2.5,
			PreAttackAnimation = "SawTrapPreAttack",
			FireAnimation = "SawTrapFire",
			ReloadingLoopSound = "/SFX/TrapSettingLoop",
			ReloadedSound = "/SFX/ArcherTrapReloaded",
			SkipMovement = true,
			SkipAngleTowardTarget = true,
			TargetSelf = true,
			TargetOffsetForward = 100,
		},
		AIOptions = { _PLUGIN.guid .. "." .. "PassiveAttack", },
	},
	AxeTrap = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		DefaultAIData = {
			ProjectileName = "AxeTrapWeapon",
			UseResetAnimationIfActive = true,
			ResetAnimation = "AxeTrapReset",
			PreAttackFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesToggleTrapState",
			PostAttackEndFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesToggleTrapState",
		},
		WeaponName = "AxeTrapWeapon",
		ModsNikkelMHadesBiomesFlipIfRoomFlipped = true,
	},
	AxeTrapTrigger = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		DefaultAIData = {
			ProjectileName = "AxeTrapWeapon",
			-- Moved in here from the normal Enemy data
			AIAttackDistance = 100,
			AIResetDistance = 110,
			PreAttackDuration = 0.2,
			PostAttackCooldown = 2.0,
			LinkedEnemy = "DartTrapEmitter",
			IdleAnimation = "DartTrapIdle",
			PreAttackAnimation = "DartTrapPreFire",
			PreAttackSound = "/SFX/TrapSet",
			PostAttackAnimation = "DartTrapPressed",
			ReloadingLoopSound = "/SFX/TrapSettingLoop",
			ReloadedSound = "/Leftovers/Menu Sounds/TalismanMetalClankDown",
			SkipAngleTowardTarget = true,
			DisabledAnimation = "DartTrapDeactivated",
		},
		AIOptions = { _PLUGIN.guid .. "." .. "RemoteAttackModsNikkelMHadesBiomes" },
		WeaponName = "AxeTrapWeapon",
	},
	-- #endregion

	-- #region DEVOTION
	-- Compatibility: Droppable Gods
	ZeusUpgradeRoomWeapon = mod.NilValue,
	DionysusUpgradeRoomWeapon = mod.NilValue,
	DemeterUpgradeRoomWeapon = mod.NilValue,
	AresUpgradeRoomWeapon = mod.NilValue,
	ArtemisUpgradeRoomWeapon = mod.NilValue,
	AphroditeUpgradeRoomWeapon = mod.NilValue,
	AthenaUpgradeRoomWeapon = mod.NilValue,
	PoseidonUpgradeRoomWeapon = mod.NilValue,
	-- #endregion
}

-- Some keys were renamed in the DefaultAIData property
local enemyKeyReplacements = {
	RequiredIntroEncounter = "IntroEncounterName",
	-- Key is only used for the four breakables
	ValueOptions = "BreakableValueOptions",
	-- For the ShadeNaked
	AIPickupType = "AIPickupTypes",
	-- Should be the same as for AIData in in WeaponData.lua
	DefaultAIData = {
		AttackSlots = { TeleportToId = "InstantTeleportToId", },
		AIAttackDistance = "AttackDistance",
		AIBufferDistance = "RetreatBufferDistance",
		AITrackTargetDuringCharge = "TrackTargetDuringCharge",
		AILineOfSightBuffer = "LoSBuffer",
		AILineOfSighEndBuffer = "LoSEndBuffer",
		AIMoveWithinRangeTimeout = "MoveWithinRangeTimeout",
		TargetFriends = "TargetRequiredKillEnemy",
		AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
		AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
		AIRequireUnitLineOfSight = "RequireUnitLoS",
		AIRequireProjectileLineOfSight = "RequireProjectileLoS",
		AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
		AIFireTicksMin = "FireTicksMin",
		AIFireTicksMax = "FireTicksMax",
		-- Done manually, to make sure it's done before others
		-- FireInterval = "DumbFireInterval",
		AIFireTicksCooldown = "FireInterval",
		StandOffTime = "SurroundRefreshInterval",
		FireCooldown = "FireInterval",
		TeleportToSpawnPoints = "PreMoveTeleport",
		PostAttackTeleportToSpawnPoints = "PostAttackEndTeleport",
		PostAttackAIDumbFireWeapons = "PostAttackDumbFireWeapons",
		SkipAttackAfterMoveTimeout = "SkipAttackIfMoveTimeout",
	},
	AttackSlots = { TeleportToId = "InstantTeleportToId", },
	-- Same as above, but on the root level
	AIAttackDistance = "AttackDistance",
	AIBufferDistance = "RetreatBufferDistance",
	AITrackTargetDuringCharge = "TrackTargetDuringCharge",
	AILineOfSightBuffer = "LoSBuffer",
	AILineOfSighEndBuffer = "LoSEndBuffer",
	AIMoveWithinRangeTimeout = "MoveWithinRangeTimeout",
	TargetFriends = "TargetRequiredKillEnemy",
	AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
	AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
	AIRequireUnitLineOfSight = "RequireUnitLoS",
	AIRequireProjectileLineOfSight = "RequireProjectileLoS",
	AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
	AIFireTicksMin = "FireTicksMin",
	AIFireTicksMax = "FireTicksMax",
	-- Done manually, to make sure it's done before others
	-- FireInterval = "DumbFireInterval",
	AIFireTicksCooldown = "FireInterval",
	StandOffTime = "SurroundRefreshInterval",
	FireCooldown = "FireInterval",
	TeleportToSpawnPoints = "PreMoveTeleport",
	PostAttackTeleportToSpawnPoints = "PostAttackEndTeleport",
	PostAttackAIDumbFireWeapons = "PostAttackDumbFireWeapons",
	SkipAttackAfterMoveTimeout = "SkipAttackIfMoveTimeout",
}

-- Modifications to Hades II enemies
-- Only modify enemies that are not being used in Hades II in this way!
-- Needs to be done before the enemy data is added to the game
game.EnemyData.SpikeTrap.DefaultAIData.TargetGroups = { "GroundEnemies", "HeroTeam", }
game.EnemyData.SpikeTrap.AIOptions = { "GuardAI", }

mod.ApplyModificationsAndInheritEnemyData(mod.EnemyData, enemyModifications, enemyReplacements, enemyKeyReplacements)
