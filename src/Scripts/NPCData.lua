local function applyNPCChoiceMappings(npcData, mappings)
	for npcName, mappingData in pairs(mappings) do
		if npcData[npcName] then
			local groups = mappingData.TextLineGroups or {}
			-- Iterate over the textline groups specified in the mapping, and replace the legacy choice logic with the Hades II logic
			for _, groupName in ipairs(groups) do
				local group = npcData[npcName][groupName]
				if group then
					for textlineSetName, textLineSet in pairs(group) do
						if game.Contains(mappingData.ExcludeNamedTextLines or {}, textlineSetName) then
							mod.DebugPrint(
								"Skipping generalized modification of textline " ..
								textlineSetName .. " because it is in the ExcludeNamedTextLines list.", 4)
						else
							-- Add the PostLineFunctionName/PostLineThreadedFunctionName to the args for ModsNikkelMHadesBiomesNPCPostChoicePresentation
							-- Do this before replacing the choice mappings as they are always in the last textline table and would be removed
							-- The value of the mappingData entry is the index in which textline the function is located
							local postLineThreadedFunctionName = nil
							local postLineFunctionArgs = nil
							if mappingData.MovePostLineThreadedFunctionNameToNPCPostChoicePresentationForTextLineSets then
								if mappingData.MovePostLineThreadedFunctionNameToNPCPostChoicePresentationForTextLineSets[textlineSetName] ~= nil and textLineSet[mappingData.MovePostLineThreadedFunctionNameToNPCPostChoicePresentationForTextLineSets[textlineSetName]].PostLineThreadedFunctionName ~= nil then
									postLineThreadedFunctionName = textLineSet
											[mappingData.MovePostLineThreadedFunctionNameToNPCPostChoicePresentationForTextLineSets[textlineSetName]]
											.PostLineThreadedFunctionName
									postLineFunctionArgs = textLineSet
											[mappingData.MovePostLineThreadedFunctionNameToNPCPostChoicePresentationForTextLineSets[textlineSetName]]
											.PostLineFunctionArgs
									textLineSet[mappingData.MovePostLineThreadedFunctionNameToNPCPostChoicePresentationForTextLineSets[textlineSetName]].PostLineThreadedFunctionName = nil
									textLineSet[mappingData.MovePostLineThreadedFunctionNameToNPCPostChoicePresentationForTextLineSets[textlineSetName]].PostLineFunctionArgs = nil
								end
							end

							-- Replace the choice mappings
							local last = textLineSet[#textLineSet]
							if last and game.Contains(mappingData.TextToMatch, last.Text) then
								textLineSet.ModsNikkelMHadesBiomesPreviousOfferText = last.Text
								textLineSet.PrePortraitExitFunctionName = mappingData.PrePortraitExitFunctionName
								textLineSet.PrePortraitExitFunctionArgs = mappingData.PrePortraitExitFunctionArgs
								if not mappingData.IgnoreSettingFlavorTextIds then
									textLineSet.PrePortraitExitFunctionArgs.ModsNikkelMHadesBiomesFlavorTextIds = { last.Text }
								end
								table.remove(textLineSet, #textLineSet)
							end

							-- Do other replacements to each of the textlines in the group
							for property, replacementMapping in pairs(mappingData.AlwaysReplaceIfExist or {}) do
								if textLineSet[property] and textLineSet[property] == replacementMapping.Find then
									textLineSet[property] = replacementMapping.Replace
								end
							end

							-- Do inner replacements if they are requested
							for property, replacementMapping in pairs(mappingData.InnerAlwaysReplaceIfExist or {}) do
								for _, lineData in ipairs(textLineSet) do
									if lineData[property] and lineData[property] == replacementMapping.Find then
										lineData[property] = replacementMapping.Replace
									end
								end
							end

							-- Add new key/value pairs to the last textline in a given group if requested
							for subTable, newKVPair in pairs(mappingData.AlwaysAddKVPairsToLastIPair or {}) do
								if subTable == groupName then
									local lastIndex = #textLineSet
									for key, value in pairs(newKVPair) do
										textLineSet[lastIndex][key] = value
									end
								end
							end

							-- Add new key/value pairs to a subtable if requested
							for subTable, newKVPair in pairs(mappingData.InnerAlwaysAddKVPairs or {}) do
								if textLineSet[subTable] then
									for _, lineData in ipairs(textLineSet[subTable]) do
										for key, value in pairs(newKVPair) do
											lineData[key] = value
										end
									end
								end
							end

							-- Add new key/value pairs to each table within the group if requested
							for subTable, newKVPair in pairs(mappingData.AlwaysAddKVPairs or {}) do
								if subTable == groupName then
									for key, value in pairs(newKVPair) do
										textLineSet[key] = value
									end
								end
							end

							-- Move EndVoiceLines and EndCues to the PrePortraitExitFunctionArgs for the benefit choice presentation if requested
							if mappingData.MoveEndVoiceLinesAndCuesToBenefitChoiceArgs then
								if textLineSet.EndVoiceLines ~= nil then
									-- Need to allow these to be played over the dialogue textlines
									for _, lineData in ipairs(textLineSet.EndVoiceLines) do
										lineData.AllowTalkOverTextLines = true
									end
									textLineSet.PrePortraitExitFunctionArgs = game.DeepCopyTable(textLineSet.PrePortraitExitFunctionArgs) or
											{}
									textLineSet.PrePortraitExitFunctionArgs.ModsNikkelMHadesBiomes_TextLineSetEndVoiceLines = textLineSet
											.EndVoiceLines
									textLineSet.EndVoiceLines = nil
								end
								if textLineSet.EndCue ~= nil then
									textLineSet.PrePortraitExitFunctionArgs = game.DeepCopyTable(textLineSet.PrePortraitExitFunctionArgs) or
											{}
									textLineSet.PrePortraitExitFunctionArgs.ModsNikkelMHadesBiomes_TextLineSetEndCue = textLineSet.EndCue
									textLineSet.EndCue = nil
								end
							end

							if mappingData.SetForcedRewardsForTextLineSets then
								for name, forcedRewards in pairs(mappingData.SetForcedRewardsForTextLineSets) do
									if name == textlineSetName then
										textLineSet.PrePortraitExitFunctionArgs = game.DeepCopyTable(textLineSet.PrePortraitExitFunctionArgs) or
												{}
										textLineSet.PrePortraitExitFunctionArgs.ModsNikkelMHadesBiomes_ForcedRewards = forcedRewards
									end
								end
							end

							-- Actually move the PostLineThreadedFunctionName to the NPC for handling in the post choice presentation
							if postLineThreadedFunctionName ~= nil then
								textLineSet.PrePortraitExitFunctionArgs = game.DeepCopyTable(textLineSet.PrePortraitExitFunctionArgs) or
										{}
								textLineSet.PrePortraitExitFunctionArgs.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionName =
										postLineThreadedFunctionName
								textLineSet.PrePortraitExitFunctionArgs.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionArgs =
										postLineFunctionArgs or {}
							end
						end
					end
				end
			end
		end
	end
end

local function applyNPCGlobalModifications(base)
	for npcName, npcData in pairs(base) do
		-- Hades II has more gift options, make every gift cost 1 Nectar
		for textlineName, textline in pairs(npcData.GiftTextLineSets or {}) do
			textline.Cost = { GiftPoints = 1, }
			textline.OnGiftTrack = true
			textline.UnfilledIcon = "EmptyHeartIcon"
			textline.FilledIcon = "FilledHeartIcon"
			-- To ensure only one gift line is shown as eligible in the Codex (prevent the Ambrosia events from showing when they shouldn't yet)
			textline.GameStateRequirements = game.DeepCopyTable(textline)
		end

		-- Move all interaction textlines into the InteractTextLineSets, out of the RepeatableTextLineSets
		if npcData.InteractTextLineSets and npcData.RepeatableTextLineSets then
			for key, textLineSet in pairs(npcData.RepeatableTextLineSets or {}) do
				npcData.InteractTextLineSets[key] = textLineSet
			end
			npcData.RepeatableTextLineSets = nil
		end

		-- Fix up the CharacterInteractions voicelines to allow them to play after choosing a boon
		if npcData.CharacterInteractions and npcData.CharacterInteractions.Rescue and npcData.CharacterInteractions.Rescue.VoiceLines then
			npcData.CharacterInteractions.Rescue.VoiceLines.AllowTalkOverTextLines = true
			npcData.CharacterInteractions.Rescue.VoiceLines.ObjectType = npcName
		end
	end
end

local npcModifications = {
	NPC_Sisyphus_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		SubtitleColor = game.Color.SisyphusVoice,
		ActivateRequirements = mod.NilValue,
		RequiredRoomInteraction = true,
		BlockedLootInteractionText = "NPCUseTextTalkLocked",
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		UpgradeScreenOpenSound = "/Leftovers/Menu Sounds/InfoPanelInURSA",
		UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",
		MenuTitle = "NPC_SisyphusAndBouldy_01",
		FlavorTextIds = {
			"Sisyphus_OfferText01",
		},
		-- "Gifts of Sisyphus",
		BoonInfoTitleText = "Codex_BoonInfo_Narcissus",
		Traits = {
			"ModsNikkelMHadesBiomesSisyphusHealing",
			"ModsNikkelMHadesBiomesSisyphusCentaurSoul",
			"ModsNikkelMHadesBiomesSisyphusMaxMana",
			"ModsNikkelMHadesBiomesSisyphusMoney",
			"ModsNikkelMHadesBiomesSisyphusMetapoints",
			"ModsNikkelMHadesBiomesSisyphusPomSlices",
			"ModsNikkelMHadesBiomesSisyphusTalentDrop",
		},
		InteractTextLineSets = {
			SisyphusAboutBouldy01 = {
				[4] = { PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "SetUpBouldyConversation", }
			},
			SisyphusAboutBouldy02 = { RequiredTextLines = { "ModsNikkelMHadesBiomes_BouldyFirstMeeting", }, },
			SisyphusLiberationQuest_Beginning_01 = { RequiredTextLines = { "SisyphusBackstory03", "SisyphusMeeting06", "SisyphusGift06", "ModsNikkelMHadesBiomes_BouldyFirstMeeting" }, },
			SisyphusLiberationQuestComplete = { RequiredCosmetics = { "ModsNikkelMHadesBiomes_SisyphusQuestItem", }, },
			-- The new name from SharedKeepsakePort
			SisyphusAboutKeepsake01 = { RequiredTrait = mod.SharedKeepsakePortSisyphusKeepsakeTrait, },
			SisyphusAboutKeepsake02 = { RequiredTrait = mod.SharedKeepsakePortSisyphusKeepsakeTrait, },
		},
		GiftTextLineSets = {
			SisyphusGift07_A = {
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "SisyphusLiberationQuestComplete" },
					},
				},
				LockedHintId = "ModsNikkelMHadesBiomes_Codex_SisyphusUnlockHint01",
				RequiredAnyTextLines = mod.NilValue,
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			-- If you haven't had Ambrosia with others - would be very rare, so we just exclude it
			SisyphusGift08_A = mod.NilValue,
			SisyphusGift08_B = {
				RequiredAnyTextLines = mod.NilValue,
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			SisyphusGift09_A = {
				CompletedHintId = "ModsNikkelMHadesBiomes_Codex_BondForgedSisyphus",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
				[5] = { PostLineFunctionArgs = { Icon = mod.SharedKeepsakePortSisyphusKeepsakeBondIcon }, },
			},
		},
	},
	ModsNikkelMHadesBiomes_NPC_Bouldy_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		ActivateRequirements = mod.NilValue,
		AlwaysShowInvulnerabubbleOnInvulnerableHit = false,
		IgnoreInvincibubbleOnHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		Portrait = "ModsNikkelMHadesBiomes_Portrait_Bouldy",
		InteractTextLineSets = {
			BouldyMiscMeeting01 = { RequiredTextLines = { "ModsNikkelMHadesBiomes_BouldyFirstMeeting", }, },
			BouldyMiscMeeting02 = { RequiredTextLines = { "ModsNikkelMHadesBiomes_BouldyFirstMeeting", }, },
			BouldyMiscMeeting03 = { RequiredTextLines = { "ModsNikkelMHadesBiomes_BouldyFirstMeeting", }, },
		},
	},
	NPC_Eurydice_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		SubtitleColor = game.Color.EurydiceVoice,
		ActivateRequirements = mod.NilValue,
		TextLinesPauseAmbientMusicVocals = mod.NilValue,
		ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines = true,
		ModsNikkelMHadesBiomesPlayVocals = true,
		RequiredRoomInteraction = true,
		BlockedLootInteractionText = "NPCUseTextTalkLocked",
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 150,
		UpgradeScreenOpenSound = "/SFX/Menu Sounds/PortraitEmoteCheerfulSFX",
		UpgradeSelectedSound = "/Leftovers/Menu Sounds/TalismanPaperEquipLEGENDARY",
		MenuTitle = "NPC_Eurydice_01",
		FlavorTextIds = {
			"Eurydice_OfferText01",
		},
		-- "Blessings of Eurydice",
		BoonInfoTitleText = "Codex_BoonInfo_Echo",
		Traits = {
			"ModsNikkelMHadesBiomesBuffSlottedBoonRarity",
			"ModsNikkelMHadesBiomesBuffMegaPom",
			"ModsNikkelMHadesBiomesBuffFutureBoonRarity",
		},
		InteractTextLineSets = {
			-- The new name from SharedKeepsakePort
			EurydiceAboutAcorn01 = { RequiredKeepsake = mod.SharedKeepsakePortEurydiceKeepsakeTrait, },
			EurydiceAboutAcorn02 = { RequiredKeepsake = mod.SharedKeepsakePortEurydiceKeepsakeTrait, },
			EurydiceProgressWithOrpheus_SongReaction01 = {
				TeleportToId = mod.NilValue,
				TeleportOffsetX = mod.NilValue,
				TeleportOffsetY = mod.NilValue,
				AngleTowardTargetId = mod.NilValue,
			},
		},
		GiftTextLineSets = {
			EurydiceGift07 = {
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "EurydiceAboutSingersReunionQuestComplete01" },
					},
				},
				LockedHintId = "ModsNikkelMHadesBiomes_Codex_EurydiceUnlockHint01",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			EurydiceGift08 = {
				CompletedHintId = "ModsNikkelMHadesBiomes_Codex_BondForgedEurydice",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
				[3] = { PostLineFunctionArgs = { Icon = mod.SharedKeepsakePortEurydiceKeepsakeBondIcon }, },
			},
		},
	},
	NPC_Patroclus_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		SubtitleColor = game.Color.PatroclusVoice,
		ActivateRequirements = mod.NilValue,
		RequiredRoomInteraction = true,
		BlockedLootInteractionText = "NPCUseTextTalkLocked",
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 200,
		UpgradeScreenOpenSound = "/Leftovers/Menu Sounds/InfoPanelInURSA",
		UpgradeSelectedSound = "/SFX/ArtemisBoonChoice",
		MenuTitle = "NPC_Patroclus_01",
		FlavorTextIds = {
			"Patroclus_OfferText03",
		},
		-- "Gifts of Patroclus",
		BoonInfoTitleText = "Codex_BoonInfo_Narcissus",
		Traits = {
			"ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
			"ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
			"ModsNikkelMHadesBiomesBuffExtraChance",
			"ModsNikkelMHadesBiomesGainMaxHealthMinMana",
			"ModsNikkelMHadesBiomesGainMinHealthMaxMana",
		},
		InteractTextLineSets = {
			-- The new name from SharedKeepsakePort
			PatroclusAboutKeepsake01 = { RequiredKeepsake = mod.SharedKeepsakePortPatroclusKeepsakeTrait, },
			PatroclusAboutKeepsake02 = { RequiredKeepsake = mod.SharedKeepsakePortPatroclusKeepsakeTrait, },
		},
		GiftTextLineSets = {
			PatroclusGift07_A = {
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "PatroclusWithAchilles01" },
					},
				},
				LockedHintId = "ModsNikkelMHadesBiomes_Codex_PatroclusUnlockHint01",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			PatroclusGift08_A = {
				CompletedHintId = "ModsNikkelMHadesBiomes_Codex_BondForgedPatroclus",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
				[6] = { PostLineFunctionArgs = { Icon = mod.SharedKeepsakePortPatroclusKeepsakeBondIcon }, },
			},
		},
	},
	ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		LineHistoryName = "Speaker_Homer",
		SubtitleColor = game.Color.NarratorVoice,
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		Portrait = "ModsNikkelMHadesBiomes_Portrait_Cerberus",
		BossPresentationIntroTextLineSets = {
			CerberusStyxMeeting01 = {
				[1] = { PortraitExitAnimation = "ModsNikkelMHadesBiomes_Portrait_Cerberus_Exit", },
				[4] = { PreLineFunctionName = _PLUGIN.guid .. "." .. "ResumeStyxMusic" },
			},
		},
	},
	ModsNikkelMHadesBiomes_NPC_Persephone_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		SubtitleColor = game.Color.PersephoneVoice,
		InteractTextLineSets = {
			PersephoneFirstMeeting = {
				[7] = {
					PostLineThreadedFunctionName = mod.NilValue,
					PostLineFunctionName = _PLUGIN.guid .. "." .. "TimePassesPresentation",
					-- Animation looks weird on Melinoe
					PostLineAnim = mod.NilValue,
				},
			},
			PersephoneMeeting03 = {
				[7] = {
					PreLineThreadedFunctionArgs = { Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Unwell_01", },
				},
			},
			PersephoneMeeting07 = {
				EndVoiceLines = {
					[2] = {
						ObjectType = "ModsNikkelMHadesBiomes_NPC_Persephone_01",
						UsePlayerSource = false,
						SpeakerName = "ModsNikkelMHadesBiomes_NPC_Persephone_01",
						LineHistoryName = "ModsNikkelMHadesBiomes_NPC_Persephone_01",
					},
				},
			},
			PersephoneMeeting08 = {
				[10] = { SetFlagTrue = mod.NilValue, },
			},
			PersephoneReturnsHome01 = {
				[8] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "SurfaceBoatScenePan",
				},
				[9] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "LeaveRoomWithNoDoor",
				},
				[15] = {
					PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRideIntro",
				},
			},
		},
	},
	NPC_Thanatos_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		ExcludeFromDamageDealtRecord = true,
		ActivateRequirements = mod.NilValue,

		InteractTextLineSets = {
			ThanatosBackstory01_B = {
				EndVoiceLines = {
					RequiredMinElapsedTime = mod.NilValue,
				},
			},
		},
		GiftTextLineSets = {
			ThanatosGift04 = {
				[2] = {
					-- Manually add the alternate to the TextLineRecord to not break the NarrativeData/locked hint ordering in the Codex
					PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
					PostLineFunctionArgs = { TextLine = "ThanatosGift04_B" },
				},
			},
			ThanatosGift04_B = {
				[2] = {
					PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
					PostLineFunctionArgs = { TextLine = "ThanatosGift04" },
				},
			},
			ThanatosGift07_A = {
				GameStateRequirements = {
					{
						-- TODO: This needs a voiceline from the house version of Thanatos
						PathTrue = { "GameState", "TextLinesRecord", "ThanatosFieldBuildingTrust01" },
					},
				},
				LockedHintId = "ModsNikkelMHadesBiomes_Codex_ThanatosUnlockHint01",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			ThanatosGift08 = {
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			ThanatosGift09 = {
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			ThanatosGift10 = {
				CompletedHintId = "ModsNikkelMHadesBiomes_Codex_BondForgedThanatos",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
		},
	},
	NPC_Thanatos_Field_01 = {
		AIOptions = { "AttackerAI" },
		PostCombatAI = _PLUGIN.guid .. "." .. "ThanatosPostCombat",
		KillChallengeArgs = {
			Force = 200,
			SuccessConsumables = {
				RandomSelection = true,
				{ Name = "MaxHealthDrop", },
				{ Name = "MaxHealthDrop", },
				{ Name = "MaxHealthDrop", },
				{ Name = "MaxManaDrop", },
				{
					Name = "StackUpgrade",
					IgnoreLootPoints = true,
					GameStateRequirements = {
						NamedRequirements = { "StackUpgradeLegal", },
					},
				},
				{ Name = "RoomMoneyDrop", },
				{
					Name = "TalentDrop",
					GameStateRequirements = {
						NamedRequirements = { "TalentLegal", },
					},
				},
			},
			FailConsumables = {
				RandomSelection = true,
				{ Name = "RoomRewardConsolationPrize", },
			},
			ConsumablePreDropFunctionName = _PLUGIN.guid .. "." .. "ThanatosDropPresentation",
			ConsumablePreDropFunctionDelay = 0.7,
		},
		BossPresentationIntroTextLineSets = {
			-- The new name from SharedKeepsakePort
			ThanatosFieldAboutKeepsake01 = { RequiredTrait = mod.SharedKeepsakePortThanatosKeepsakeTrait, },
		},
	},
	NPC_Orpheus_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		SubtitleColor = game.Color.OrpheusVoice,
		AnimOffsetZ = 275,
		ActivateRequirements = mod.NilValue,
		TextLinesPauseAmbientMusicVocals = mod.NilValue,
		ModsNikkelMHadesBiomesPauseMusicVocals2OnTextLines = true,
		ModsNikkelMHadesBiomesPlayVocals2 = true,
		TextLinesPauseSingingFx = true,
		-- Only start/stop the singing animation if Orpheus is singing again
		ModsNikkelMHadesBiomes_OrpheusStartTextLinesAnimation = "OrpheusPlaying_PlayingLoop_End",
		ModsNikkelMHadesBiomes_OrpheusEndTextLinesAnimation = "OrpheusPlaying_Start",
		OrpheusSingsAgainRequirements = {
			NamedRequirements = { "ModsNikkelMHadesBiomesOrpheusSingsAgain", },
		},
		RequiredRoomInteraction = true,
		BlockedLootInteractionText = "NPCUseTextTalkLocked",
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 150,
		UpgradeScreenOpenSound = "/SFX/Menu Sounds/PortraitEmoteCheerfulSFX",
		UpgradeSelectedSound = "/Leftovers/Menu Sounds/TalismanPaperEquipLEGENDARY",
		MenuTitle = "NPC_Orpheus_01",
		FlavorTextIds = {
			"Orpheus_OfferText01",
		},
		-- "Songs of Orpheus",
		BoonInfoTitleText = "ModsNikkelMHadesBiomes_Codex_BoonInfo_Orpheus",
		Traits = {
			"ModsNikkelMHadesBiomesOrpheusChaosThemeBoon",
			"ModsNikkelMHadesBiomesOrpheusBossFightMusicBoon",
			"ModsNikkelMHadesBiomesOrpheusCharonShopThemeBoon",
			-- Priority Traits
			"ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon",
			"ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon",
		},
		InteractTextLineSets = {
			OrpheusFirstMeeting = {
				SuperPriority = true,
				Priority = mod.NilValue,
			},
			OrpheusFirstMeeting_Alt = {
				SuperPriority = true,
				Priority = mod.NilValue,
			},
			OrpheusMiscMeeting03 = {
				[2] = mod.NilValue,
			},
			OrpheusSingsAgain01 = {
				-- Force playing this music
				RequiredAmbientTrackNameMatch = mod.NilValue,
			},
			OrpheusSingsAgain01_B = {
				RequiredAmbientTrackNameMatch = mod.NilValue,
			},
			OrpheusSingsAgain01_C = {
				RequiredAmbientTrackNameMatch = mod.NilValue,
			},
			OrpheusSingsAgain01_D = {
				RequiredAmbientTrackNameMatch = mod.NilValue,
			},
			OrpheusSingsAgain02 = {
				RequiredAmbientTrackNameMatch = mod.NilValue,
			},
			OrpheusSingsAgain03 = {
				RequiredAmbientTrackNameMatch = mod.NilValue,
			},
			OrpheusSingsAgain03_B = {
				RequiredAmbientTrackNameMatch = mod.NilValue,
			},
			OrpheusMusicProgress01 = {
				RequiredCosmetics = { "ModsNikkelMHadesBiomes_HouseLyre01", },
				RequiredMinItemInteractions = { ModsNikkelMHadesBiomes_HouseLyre01 = 10, HouseLyre01 = mod.NilValue, },
				[2] = {
					PostLineThreadedFunctionName = mod.NilValue,
					PostLineFunctionName = _PLUGIN.guid .. "." .. "MusicPracticePresentation",
				},
			},
			OrpheusMusicProgress02 = {
				RequiredCosmetics = { "ModsNikkelMHadesBiomes_HouseLyre01", },
				RequiredMinItemInteractions = { ModsNikkelMHadesBiomes_HouseLyre01 = 40, HouseLyre01 = mod.NilValue, },
			},
			OrpheusMusicProgress03 = {
				RequiredCosmetics = { "ModsNikkelMHadesBiomes_HouseLyre01", },
				RequiredMinItemInteractions = { ModsNikkelMHadesBiomes_HouseLyre01 = 80, HouseLyre01 = mod.NilValue, },
			},
			OrpheusMusicProgress04 = {
				RequiredCosmetics = { "ModsNikkelMHadesBiomes_HouseLyre01", },
				RequiredMinItemInteractions = { ModsNikkelMHadesBiomes_HouseLyre01 = 150, HouseLyre01 = mod.NilValue, },
			},
			OrpheusAboutSingersReunionQuest01 = {
				SuperPriority = true,
				Priority = mod.NilValue,
				RequiresNullAmbientMusicId = mod.NilValue,
				RequiredCosmetics = { "ModsNikkelMHadesBiomes_OrpheusEurydiceQuestItem", },
				[4] = {
					PostLineFunctionArgs = { WaitTime = 2, },
					-- Called manually in OrpheusExit, as the PostLineFunctionArgs would be overwritten
					SetFlagTrue = mod.NilValue
				},
			},
			OrpheusWithHades03 = {
				RequiredFalseCosmetics = { "ModsNikkelMHadesBiomes_OrpheusEurydiceQuestItem", },
			},
			OrpheusNonSingingChat08 = {
				RequiredFalseCosmetics = { "ModsNikkelMHadesBiomes_OrpheusEurydiceQuestItem", },
			},
		},
		CharacterInteractions = {
			Rescue = {
				VoiceLines = {
					{
						PreLineWait = 0.4,
						AllowTalkOverTextLines = true,
						BreakIfPlayed = true,
						ObjectType = "NPC_Orpheus_01",
						{
							GameStateRequirements = {
								{
									PathTrue = { "CurrentRun", "CurrentRoom", "TextLinesRecord", "OrpheusMiscMeeting03", },
								},
							},
							Cue = "/VO/Orpheus_0069",
							Text =
							"Oh, fancy that one do you? Alas, I've not the heart to sing it anymore. I'm glad you like it, though."
						},
					},
					{
						BreakIfPlayed = true,
						RandomRemaining = true,
						PreLineWait = 0.4,
						AllowTalkOverTextLines = true,
						ObjectType = "NPC_Orpheus_01",
						GameStateRequirements = {
							NamedRequirementsFalse = { "ModsNikkelMHadesBiomesOrpheusSingsAgainRoomStart", },
						},
						-- I thought you might say that.
						{ Cue = "/VO/Orpheus_0046" },
						-- Fancy that one, do you?
						{ Cue = "/VO/Orpheus_0171" },
						-- Oh, that one.
						{ Cue = "/VO/Orpheus_0172" },
						-- Oh, indeed.
						{ Cue = "/VO/Orpheus_0175" },
						-- This makes me think of her.
						{ Cue = "/VO/Orpheus_0176" },
					},
					{
						BreakIfPlayed = true,
						RandomRemaining = true,
						PreLineWait = 0.4,
						AllowTalkOverTextLines = true,
						ObjectType = "NPC_Orpheus_01",
						GameStateRequirements = {
							NamedRequirements = { "ModsNikkelMHadesBiomesOrpheusSingsAgainRoomStart", },
						},
						-- By the Fates...
						{ Cue = "/VO/Orpheus_0159" },
						-- The gift of song...
						{ Cue = "/VO/Orpheus_0160" },
						-- Has inspiration struck?
						{ Cue = "/VO/Orpheus_0163" },
						-- By my muse...
						{ Cue = "/VO/Orpheus_0164" },
						-- Another song...
						{ Cue = "/VO/Orpheus_0165" },
						-- A song...
						{ Cue = "/VO/Orpheus_0166" },
						-- How splendid.
						{ Cue = "/VO/Orpheus_0169" },
						-- A fine selection.
						{ Cue = "/VO/Orpheus_0170" },
						-- OK I like that one.
						{ Cue = "/VO/Orpheus_0041" },
						-- Why certainly, of course.
						{ Cue = "/VO/Orpheus_0042" },
						-- Why, very well.
						{ Cue = "/VO/Orpheus_0043" },
						-- Good, let's begin, my friend!
						{ Cue = "/VO/Orpheus_0044" },
						-- All right I like that one!
						{ Cue = "/VO/Orpheus_0045" },
						-- I thought you might say that.
						{ Cue = "/VO/Orpheus_0046" },
						-- Once more, then, I suppose?
						{ Cue = "/VO/Orpheus_0047" },
						-- You like that one, do you?
						{ Cue = "/VO/Orpheus_0048" },
						-- I'm happy to oblige you.
						{ Cue = "/VO/Orpheus_0049" },
						-- Why, I don't see why not!
						{ Cue = "/VO/Orpheus_0050" },
						-- Fancy that one, do you?
						{ Cue = "/VO/Orpheus_0171" },
						-- Oh, that one.
						{ Cue = "/VO/Orpheus_0172" },
						-- That one, then.
						{ Cue = "/VO/Orpheus_0173" },
						-- Ah, yes.
						{ Cue = "/VO/Orpheus_0174" },
						-- Oh, indeed.
						{ Cue = "/VO/Orpheus_0175" },
						-- This makes me think of her.
						{ Cue = "/VO/Orpheus_0176" },
						-- If you insist, my friend.
						{ Cue = "/VO/Orpheus_0177" },
					},
				},
			},
		},
		GiftTextLineSets = {
			OrpheusGift04 = {
				[2] = {
					-- Manually add the alternate to the TextLineRecord to not break the NarrativeData/locked hint ordering in the Codex
					PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
					PostLineFunctionArgs = { TextLine = "OrpheusGift04_B" },
				},
			},
			OrpheusGift04_B = {
				[2] = {
					PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
					PostLineFunctionArgs = { TextLine = "OrpheusGift04" },
				},
			},
			OrpheusGift05 = {
				[2] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "TimePassesPresentation",
					PostLineFunctionArgs = { PreTextWait = 0.75 },
				},
				[3] = {
					FadeOutTime = mod.NilValue,
					FullFadeTime = mod.NilValue,
					TeleportToId = mod.NilValue,
					AngleTowardTargetId = mod.NilValue,
					TeleportOffsetY = mod.NilValue,
					TeleportOffsetX = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
					FadeInTime = mod.NilValue,
					AttachedDim = mod.NilValue,
					FadeInSound = mod.NilValue,
				},
				[4] = {
					PostLineThreadedFunctionName = mod.NilValue,
					PostLineFunctionArgs = mod.NilValue,
				},
				[5] = {
					FadeOutTime = mod.NilValue,
					FullFadeTime = mod.NilValue,
					InterSceneWaitTime = mod.NilValue,
					TeleportToId = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					TeleportHeroOffsetX = mod.NilValue,
					TeleportHeroOffsetY = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
					FadeInTime = mod.NilValue,
					PreLineWait = mod.NilValue,
					FadeInSound = mod.NilValue,
				},
			},
			OrpheusGift07 = {
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "TextLinesRecord", "OrpheusAboutSingersReunionQuest01" },
					},
				},
				LockedHintId = "ModsNikkelMHadesBiomes_Codex_OrpheusUnlockHint01",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			OrpheusGift08 = {
				CompletedHintId = "ModsNikkelMHadesBiomes_Codex_BondForgedOrpheus",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
				[4] = { PostLineFunctionArgs = { Icon = mod.SharedKeepsakePortOrpheusKeepsakeBondIcon }, },
			},
		},
		MissingDistanceTrigger = mod.NilValue,
		-- Copied from Story variant, since in H1 you couldn't attack him since he was located in the House
		OnHitVoiceLines = {
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.45,
			SuccessiveChanceToPlay = 0.25,
			PlayFromTarget = true,
			Cooldowns = {
				{ Name = "OrpheusAnyQuipSpeech", Time = 12 },
			},
			-- My friend?
			{ Cue = "/VO/Orpheus_0235" },
			-- That makes it difficult to sing, my friend.
			{ Cue = "/VO/Orpheus_0236", GameStateRequirements = { NamedRequirements = { "ModsNikkelMHadesBiomesOrpheusSingsAgain", }, }, },
			-- Have I wronged you somehow?
			{ Cue = "/VO/Orpheus_0238" },
			-- I resolved never to fight, my friend.
			{ Cue = "/VO/Orpheus_0239" },
			-- I fight only through song, my friend.
			{ Cue = "/VO/Orpheus_0240", GameStateRequirements = { NamedRequirements = { "ModsNikkelMHadesBiomesOrpheusSingsAgain", }, }, },
			-- I am attempting here to sing, my friend?
			{ Cue = "/VO/Orpheus_0242", GameStateRequirements = { NamedRequirements = { "ModsNikkelMHadesBiomesOrpheusSingsAgain", }, }, },
		},
	},
	NPC_Orpheus_Story_01 = {
		AnimOffsetZ = 230,
		ActivateRequirements = {
			RequiredFalseTextLinesLastRun = mod.NilValue,
			RequiredFalseTextLinesThisRun = { "OrpheusAboutSingersReunionQuest01" },
		},
		TextLinesPauseAmbientMusicVocals = mod.NilValue,
		TextLinesPauseAmbientMusicVocals2 = mod.NilValue,
		ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines = true,
		ModsNikkelMHadesBiomesPauseMusicVocals2OnTextLines = true,
		ModsNikkelMHadesBiomesPlayVocals = true,
		ModsNikkelMHadesBiomesPlayVocals2 = true,
		MenuTitle = "ModsNikkelMHadesBiomes_Eurydice_Orpheus",
		FlavorTextIds = {
			"Eurydice_OfferText03",
		},
		InteractTextLineSets = {
			OrpheusWithEurydice01 = {
				RequiredFalseTextLinesLastRun = mod.NilValue,
				RequiredFalseTextLinesThisRun = { "OrpheusAboutSingersReunionQuest01" },
			},
		}
	},
}

-- Before adding them to the game, we need to apply some additional modifications to NPCs
local npcChoiceMappings = {
	NPC_Sisyphus_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = { "Sisyphus_OfferText01", },
		PrePortraitExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.SisyphusBenefitChoices,
		MovePostLineThreadedFunctionNameToNPCPostChoicePresentationForTextLineSets = {
			SisyphusLiberationQuestComplete = 7,
		},
	},
	ModsNikkelMHadesBiomes_NPC_Bouldy_01 = {
		AlwaysAddKVPairs = {
			InteractTextLineSets = {
				EndGlobalVoiceLines = "MiscEndVoiceLines_Bouldy",
			},
			RepeatableTextLineSets = {
				EndGlobalVoiceLines = "MiscEndVoiceLines_Bouldy",
			},
			GiftTextLineSets = {
				EndGlobalVoiceLines = "MiscEndVoiceLines_Bouldy",
			},
		},
	},
	NPC_Eurydice_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = { "Eurydice_OfferText01", "Eurydice_OfferText02", },
		PrePortraitExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.EurydiceBenefitChoices,
		AlwaysReplaceIfExist = {
			OnQueuedFunctionName = {
				Find = "MusicianMusic",
				Replace = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesEurydiceMusic",
			},
		},
	},
	NPC_Patroclus_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = { "Patroclus_OfferText02", "Patroclus_OfferText03", "Patroclus_OfferText04", "Patroclus_OfferText05" },
		PrePortraitExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.PatroclusBenefitChoices,
	},
	ModsNikkelMHadesBiomes_NPC_Persephone_01 = {
		TextLineGroups = { "InteractTextLineSets" },
		InnerAlwaysReplaceIfExist = {
			PreLineThreadedFunctionName = {
				Find = "SetupPersephoneMusic",
				Replace = _PLUGIN.guid .. "." .. "SetupPersephoneMusic",
			},
			PostLineThreadedFunctionName = {
				Find = "SurfaceKillHero",
				Replace = _PLUGIN.guid .. "." .. "SurfaceKillHero",
			},
		},
		InnerAlwaysAddKVPairs = {
			EndVoiceLines = {
				PreLineFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesToggleNarrativeFadeInColorForZagreus",
				PreLineFunctionArgs = { ToggleOn = true, },
				PostLineFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesToggleNarrativeFadeInColorForZagreus",
				PostLineFunctionArgs = { ToggleOn = false, },
				UsePlayerSource = true,
				SpeakerName = "NPC_Zagreus_Past_01",
				LineHistoryName = "NPC_Zagreus_Past_01",
			},
		},
	},
	NPC_Thanatos_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets", "GiftTextLineSets" },
		AlwaysAddKVPairsToLastIPair = {
			-- Thanatos should leave after the conversation in RoomOpening, and spawn the reward
			InteractTextLineSets = {
				PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ThanatosRoomOpeningConversationDone",
				PostLineFunctionArgs = mod.NilValue,
			},
			RepeatableTextLineSets = {
				PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ThanatosRoomOpeningConversationDone",
			},
			-- Thanatos should leave if he has no more dialogue after being gifted
			GiftTextLineSets = {
				PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesCheckThanatosPostGiftExit",
				PostLineThreadedFunctionArgs = { Delay = 2, },
			},
		},
	},
	NPC_Thanatos_Field_01 = {
		TextLineGroups = { "InteractTextLineSets" },
		InnerAlwaysReplaceIfExist = {
			PostLineThreadedFunctionName = {
				Find = "ThanatosExit",
				Replace = _PLUGIN.guid .. "." .. "ThanatosExit",
			},
		},
	},
	NPC_Orpheus_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		AlwaysReplaceIfExist = {
			OnQueuedFunctionName = {
				Find = "MusicianMusic",
				Replace = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesEurydiceMusic",
			},
		},
		AlwaysAddKVPairs = {
			InteractTextLineSets = {
				PrePortraitExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBenefitChoice",
				PrePortraitExitFunctionArgs = mod.PresetEventArgs.OrpheusBenefitChoices,
			},
			RepeatableTextLineSets = {
				PrePortraitExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBenefitChoice",
				PrePortraitExitFunctionArgs = mod.PresetEventArgs.OrpheusBenefitChoices,
			},
		},
		MoveEndVoiceLinesAndCuesToBenefitChoiceArgs = true,
		MovePostLineThreadedFunctionNameToNPCPostChoicePresentationForTextLineSets = {
			OrpheusFirstMeeting = 3,
			OrpheusFirstMeeting_Alt = 3,
			OrpheusAboutSingersReunionQuest01 = 4,
		},
		SetForcedRewardsForTextLineSets = {
			OrpheusSingsAgain01 = {
				{
					Type = "Trait",
					ItemName = "ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon",
					Rarity = "Common",
					PrioritySlotEntranceAnimation = "BoonEntranceLegendary",
					PriorityRequirements = {
						{
							PathFalse = { "GameState", "TraitsTaken", "ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boxon" },
						},
					},
				},
			},
			OrpheusSingsAgain01_B = {
				{
					Type = "Trait",
					ItemName = "ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon",
					Rarity = "Common",
					PrioritySlotEntranceAnimation = "BoonEntranceLegendary",
					PriorityRequirements = {
						{
							PathFalse = { "GameState", "TraitsTaken", "ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boxon" },
						},
					},
				},
			},
			OrpheusSingsAgain01_C = {
				{
					Type = "Trait",
					ItemName = "ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon",
					Rarity = "Common",
					PrioritySlotEntranceAnimation = "BoonEntranceLegendary",
					PriorityRequirements = {
						{
							PathFalse = { "GameState", "TraitsTaken", "ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boxon" },
						},
					},
				},
			},
			OrpheusSingsAgain01_D = {
				{
					Type = "Trait",
					ItemName = "ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon",
					Rarity = "Common",
					PrioritySlotEntranceAnimation = "BoonEntranceLegendary",
					PriorityRequirements = {
						{
							PathFalse = { "GameState", "TraitsTaken", "ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boxon" },
						},
					},
				},
			},
			OrpheusSingsAgain02 = {
				{
					Type = "Trait",
					ItemName = "ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon",
					Rarity = "Common",
					PrioritySlotEntranceAnimation = "BoonEntranceLegendary",
					PriorityRequirements = {
						{
							PathFalse = { "GameState", "TraitsTaken", "ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon" },
						},
					},
				},
			},
			OrpheusSingsAgain03 = {
				{
					Type = "Trait",
					ItemName = "ModsNikkelMHadesBiomesOrpheusEurydiceSong1Boon",
					Rarity = "Common",
					PrioritySlotEntranceAnimation = "BoonEntranceLegendary",
					PriorityRequirements = {
						{
							PathFalse = { "GameState", "TraitsTaken", "ModsNikkelMHadesBiomesOrpheusEurydiceSong1Boon" },
						},
					},
				},
			},
			OrpheusSingsAgain03_B = {
				{
					Type = "Trait",
					ItemName = "ModsNikkelMHadesBiomesOrpheusEurydiceSong1Boon",
					Rarity = "Common",
					PrioritySlotEntranceAnimation = "BoonEntranceLegendary",
					PriorityRequirements = {
						{
							PathFalse = { "GameState", "TraitsTaken", "ModsNikkelMHadesBiomesOrpheusEurydiceSong1Boon" },
						},
					},
				},
			},
		},
	},
	NPC_Orpheus_Story_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = { "Eurydice_OfferText03", },
		PrePortraitExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.EurydiceBenefitChoices,
		AlwaysReplaceIfExist = {
			OnQueuedFunctionName = {
				Find = "MusicianMusic",
				Replace = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesEurydiceMusic",
			},
		},
	},
}

-- Custom, more complicated changes before anything else
-- Replace duplicated Bouldy conversations
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.InteractTextLineSets.ModsNikkelMHadesBiomes_BouldyFirstMeeting = game
		.DeepCopyTable(mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.InteractTextLineSets.BouldyFirstMeeting) or {}
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.InteractTextLineSets.ModsNikkelMHadesBiomes_BouldyFirstMeeting.EndGlobalVoiceLines =
"MiscEndVoiceLines_Bouldy"
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.InteractTextLineSets.BouldyFirstMeeting = nil
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.RepeatableTextLineSets.ModsNikkelMHadesBiomes_BouldyChat01 = game
		.DeepCopyTable(mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.RepeatableTextLineSets.BouldyChat01) or {}
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.RepeatableTextLineSets.ModsNikkelMHadesBiomes_BouldyChat01.RequiredTextLines = {
	"ModsNikkelMHadesBiomes_BouldyFirstMeeting", }
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.RepeatableTextLineSets.BouldyChat01 = nil

applyNPCChoiceMappings(mod.NPCData, npcChoiceMappings)
applyNPCGlobalModifications(mod.NPCData)

mod.ApplyModificationsAndInheritEnemyData(mod.NPCData, npcModifications, {}, {})
