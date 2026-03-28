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

							-- Replace keys if requested, keeping the value
							for property, replacementProperty in pairs(mappingData.AlwaysReplaceKeysIfExist or {}) do
								if textLineSet[property] ~= nil then
									textLineSet[replacementProperty] = textLineSet[property]
									textLineSet[property] = nil
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

local function applyNPCGlobalModifications(base, npcModifications)
	for npcName, npcData in pairs(base) do
		if npcModifications[npcName] and npcModifications[npcName].RepeatableTextLineSets ~= nil then
			mod.DebugPrint(
				"Modifications to RepeatableTextLineSets for NPCs must be made under InteractTextLineSets, as the will be moved there before modifications are applied: " ..
				npcName, 1)
		end

		-- Hades II has more gift options, make every gift cost 1 Nectar
		for textlineName, textline in pairs(npcData.GiftTextLineSets or {}) do
			textline.Cost = { GiftPoints = 1, }
			textline.OnGiftTrack = true
			textline.UnfilledIcon = "EmptyHeartIcon"
			textline.FilledIcon = "FilledHeartIcon"
			-- To ensure only one gift line is shown as eligible in the Codex (prevent the Ambrosia events from showing when they shouldn't yet)
			if npcModifications[npcName] and npcModifications[npcName].GiftTextLineSets and npcModifications[npcName].GiftTextLineSets[textlineName] and npcModifications[npcName].GiftTextLineSets[textlineName].GameStateRequirements then
				textline.GameStateRequirements = npcModifications[npcName].GiftTextLineSets[textlineName]
						.GameStateRequirements
			else
				textline.GameStateRequirements = textline.GameStateRequirements or game.DeepCopyTable(textline)
			end
		end

		-- Move all interaction textlines into the InteractTextLineSets, out of the RepeatableTextLineSets
		if npcData.InteractTextLineSets and npcData.RepeatableTextLineSets then
			for key, textLineSet in pairs(npcData.RepeatableTextLineSets or {}) do
				if npcData.InteractTextLineSets[key] ~= nil then
					mod.DebugPrint(
						"The key for the RepeatableTextLineSet " ..
						key .. " already exists in the InteractTextLineSets for " .. npcName .. " and will be overwritten.", 4)
				end
				npcData.InteractTextLineSets[key] = textLineSet
			end
			npcData.RepeatableTextLineSets = nil
		end

		-- Fix up the CharacterInteractions voicelines to allow them to play after choosing a boon
		if npcData.CharacterInteractions and npcData.CharacterInteractions.Rescue and npcData.CharacterInteractions.Rescue.VoiceLines then
			npcData.CharacterInteractions.Rescue.VoiceLines.AllowTalkOverTextLines = true
			npcData.CharacterInteractions.Rescue.VoiceLines.ObjectType = npcName
			for _, group in ipairs(npcData.CharacterInteractions.Rescue.VoiceLines) do
				for _, line in ipairs(group) do
					-- Some of these are reused for Salute voicelines, and we don't want to play the same one twice
					line.RequiredFalsePlayedThisRoom = { line.Cue }
				end
			end
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
		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "SisyphusGift01" },
			},
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines = {
			{ GlobalVoiceLines = "ModsNikkelMHadesBiomes_SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.3,
				ObjectType = "NPC_Sisyphus_01",
				PreLineAnim = "SisyphusIdleGreeting",
				-- Sure thing!
				{ Cue = "/VO/Sisyphus_0038", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0038" } },
				-- You got it.
				{ Cue = "/VO/Sisyphus_0039", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0039" } },
				-- Say no more!
				{ Cue = "/VO/Sisyphus_0040", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0040" } },
				-- Easy does it!
				{ Cue = "/VO/Sisyphus_0041", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0041" } },
				-- Most excellent!
				{ Cue = "/VO/Sisyphus_0048", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0048" } },
				-- Certainly, Highness!
				{ Cue = "/VO/Sisyphus_0223", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0223" } },
				-- No worries whatsoever!
				{ Cue = "/VO/Sisyphus_0226", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0226" } },

				-- Your Highness!
				{ Cue = "/VO/Sisyphus_0058", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0058" } },
				-- Good morning or whenever!
				{ Cue = "/VO/Sisyphus_0063", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0063" } },
				-- Good to see you!
				{ Cue = "/VO/Sisyphus_0210", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0210" } },

				-- Well you take care!
				{ Cue = "/VO/Sisyphus_0122", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0122" } },
				-- Careful out there!
				{ Cue = "/VO/Sisyphus_0128", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0128" } },
				-- Take care out there!
				{ Cue = "/VO/Sisyphus_0111", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0111" } },
				-- Good luck out there!
				{ Cue = "/VO/Sisyphus_0112", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0112" } },
				-- Take care of yourself!
				{ Cue = "/VO/Sisyphus_0114", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0114" } },
				-- Safe travels!
				{ Cue = "/VO/Sisyphus_0117", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0117" } },
				-- You can do this!
				{ Cue = "/VO/Sisyphus_0119", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0119" } },
				-- Careful out there, all right?
				{ Cue = "/VO/Sisyphus_0246", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0246" } },
				-- May you get out of here this time, Highness!
				{ Cue = "/VO/Sisyphus_0247", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0247" }, RequiredTextLines = { "SisyphusGift02" }, },
				-- Keep fighting, Highness!
				{ Cue = "/VO/Sisyphus_0251", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0251" } },
			},
		},
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
			SisyphusGift01 = {
				UnfilledIcon = "EmptyHeartWithGiftIcon",
				FilledIcon = "FilledHeartWithGiftIcon",
			},
			SisyphusGift02 = {
				UnfilledIcon = "EmptyHeartWithProphecyIcon",
				FilledIcon = "FilledHeartWithProphecyIcon",
			},
			SisyphusGift07_A = {
				GameStateRequirements = {
					{
						Path = { "GameState", "TextLinesRecord", },
						HasAll = { "SisyphusGift06", "SisyphusLiberationQuestComplete" }
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
		SpecialInteractFunctionName = "SpecialInteractSalute",
		AllowSpecialInteractInPartnerConversation = true,
		SpecialInteractGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift01" },
			},
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines = {
			{ GlobalVoiceLines = "ModsNikkelMHadesBiomes_SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.3,
				ObjectType = "NPC_Eurydice_01",
				-- You got it!
				{ Cue = "/VO/Eurydice_0128", RequiredFalsePlayedThisRoom = { "/VO/Eurydice_0128" } },
				-- Sure thing!
				{ Cue = "/VO/Eurydice_0129", RequiredFalsePlayedThisRoom = { "/VO/Eurydice_0129" } },
				-- Sounds good!
				{ Cue = "/VO/Eurydice_0130", RequiredFalsePlayedThisRoom = { "/VO/Eurydice_0130" } },
				-- You got it, hon!
				{ Cue = "/VO/Eurydice_0140", RequiredFalsePlayedThisRoom = { "/VO/Eurydice_0140" } },
				-- Sure thing, hon.
				{ Cue = "/VO/Eurydice_0142", RequiredFalsePlayedThisRoom = { "/VO/Eurydice_0142" } },
				-- You bet!
				{ Cue = "/VO/Eurydice_0146", RequiredFalsePlayedThisRoom = { "/VO/Eurydice_0146" } },
				-- Excellent.
				{ Cue = "/VO/Eurydice_0226", RequiredFalsePlayedThisRoom = { "/VO/Eurydice_0226" } },
			},
		},
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
			EurydiceGift01 = {
				UnfilledIcon = "EmptyHeartWithGiftIcon",
				FilledIcon = "FilledHeartWithGiftIcon",
			},
			EurydiceGift02 = {
				UnfilledIcon = "EmptyHeartWithProphecyIcon",
				FilledIcon = "FilledHeartWithProphecyIcon",
			},
			EurydiceGift07 = {
				GameStateRequirements = {
					{
						Path = { "GameState", "TextLinesRecord", },
						HasAll = { "EurydiceGift06", "EurydiceAboutSingersReunionQuestComplete01" }
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
		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "PatroclusGift01" },
			},
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines = {
			{ GlobalVoiceLines = "ModsNikkelMHadesBiomes_SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.3,
				ObjectType = "NPC_Patroclus_01",
				-- Oh.
				{ Cue = "/VO/Patroclus_0152", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0152" } },
				-- Although...
				{ Cue = "/VO/Patroclus_0153", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0153" } },
				-- ...Ah.
				{ Cue = "/VO/Patroclus_0156", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0156" } },
				-- ...You.
				{ Cue = "/VO/Patroclus_0157", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0157" } },
				-- Well...
				{ Cue = "/VO/Patroclus_0158", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0158" } },
				-- <Chuckle>
				{ Cue = "/VO/Patroclus_0076", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0076" } },
				-- <Chuckle>
				{ Cue = "/VO/Patroclus_0342", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0342" } },
				-- Hrn?
				{ Cue = "/VO/Patroclus_0333", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0333" } },
				-- Eh...
				{ Cue = "/VO/Patroclus_0334", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0334" } },
				-- Heh...
				{ Cue = "/VO/Patroclus_0335", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0335" } },
				-- Hm.
				{ Cue = "/VO/Patroclus_0336", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0336" } },
				-- Ah yes.
				{ Cue = "/VO/Patroclus_0337", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0337" } },
				-- Ah.
				{ Cue = "/VO/Patroclus_0222", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0222" } },
				-- Oh.
				{ Cue = "/VO/Patroclus_0223", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0223" } },
				-- Stranger.
				{ Cue = "/VO/Patroclus_0231", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0231" } },
				-- Very well.
				{ Cue = "/VO/Patroclus_0287", RequiredFalsePlayedThisRoom = { "/VO/Patroclus_0287" } },
			},
		},
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
			PatroclusGift01 = {
				UnfilledIcon = "EmptyHeartWithGiftIcon",
				FilledIcon = "FilledHeartWithGiftIcon",
			},
			PatroclusGift02 = {
				UnfilledIcon = "EmptyHeartWithProphecyIcon",
				FilledIcon = "FilledHeartWithProphecyIcon",
			},
			PatroclusGift07_A = {
				GameStateRequirements = {
					{
						Path = { "GameState", "TextLinesRecord", },
						HasAll = { "PatroclusGift06", "PatroclusWithAchilles01" }
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
		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "ThanatosGift01" },
			},
			{
				-- Can't Salute when he's about to disappear
				PathFalse = { "CurrentRun", "CurrentRoom", "UseRecord", "NPC_Thanatos_01" }
			},
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines = {
			{ GlobalVoiceLines = "ModsNikkelMHadesBiomes_SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.3,
				ObjectType = "NPC_Thanatos_01",
				PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
				-- Hmph.
				{ Cue = "/VO/Thanatos_0161", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0161" } },
				-- What.
				{ Cue = "/VO/Thanatos_0183", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0183" } },
				-- What do you need exactly.
				{ Cue = "/VO/Thanatos_0147", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0147" }, RequiredFalseTextLines = { "ThanatosGift07_A" } },
				-- Hm.
				{ Cue = "/VO/Thanatos_0179", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0179" } },
				-- Yes?
				{ Cue = "/VO/Thanatos_0182", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0182" }, RequiredFalseTextLines = { "ThanatosGift06" }, },
				-- Tsch.
				{ Cue = "/VO/Thanatos_0180", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0180" }, RequiredFalseTextLines = { "ThanatosGift05" }, },
				-- What?
				{ Cue = "/VO/Thanatos_0184", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0184" }, RequiredFalseTextLines = { "ThanatosGift05" }, },
				-- What's up.
				{ Cue = "/VO/Thanatos_0152", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0152" }, RequiredTextLines = { "ThanatosGift04" }, },
				-- Heh.
				{ Cue = "/VO/Thanatos_0181", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0181" }, RequiredTextLines = { "ThanatosGift05" }, },
				-- You all right?
				{ Cue = "/VO/Thanatos_0189", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0189" }, RequiredTextLines = { "ThanatosGift06" },                                               RequiresLastRunNotCleared = true },
				-- You OK?
				{ Cue = "/VO/Thanatos_0190", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0190" }, RequiredTextLines = { "ThanatosGift06" },                                               RequiresLastRunNotCleared = true },
				-- Hey.
				{ Cue = "/VO/Thanatos_0194", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0194" }, RequiredTextLines = { "ThanatosGift06" }, },
				-- Hey.
				{ Cue = "/VO/Thanatos_0427", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0427" }, RequiredTextLines = { "ThanatosGift10" }, },
				-- Good work out there.
				{ Cue = "/VO/Thanatos_0429", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0429" }, RequiredTextLines = { "ThanatosGift06" },                                               RequiresLastRunCleared = true, },
				-- Well done that time.
				{ Cue = "/VO/Thanatos_0430", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0430" }, RequiredTextLines = { "ThanatosGift06" },                                               RequiresLastRunCleared = true, },
				-- Glad you're back.
				{ Cue = "/VO/Thanatos_0434", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0434" }, RequiredAnyTextLines = { "BecameCloserWithThanatos01", "BecameCloserWithThanatos01_B" } },
				-- Back in one piece.
				{ Cue = "/VO/Thanatos_0435", RequiredFalsePlayedThisRoom = { "/VO/Thanatos_0435" }, RequiredTextLines = { "ThanatosGift07_A" }, },
			},
		},
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		ExcludeFromDamageDealtRecord = true,
		ActivateRequirements = mod.NilValue,

		InteractTextLineSets = {
			-- #region Moved from DeathLoopData - Romance
			-- Thanatos (Bedroom) / Thanatos in Bedroom / Bedroom Scenes / Thanatos Relationship / max relationship
			-- variant below for if Megaera max relationship was already reached
			ModsNikkelMHadesBiomes_BecameCloseWithThanatos01_Trigger = {
				SuperPriority = true,
				PlayOnce = true,
				GiftableOffSource = true,
				StatusAnimation = "StatusIconWantsAffection",
				GameStateRequirements = {
					RequiredTextLines = { "ThanatosFieldAboutRelationship01", "ThanatosGift10" },
					RequiredFalseTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B", "BecameCloseWithMegaera01Meg_GoToHer" },
					RequiredFalseTextLinesLastRun = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B", "BecameCloseWithDusa01", "Ending01" },
				},

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = {
					PostTriggerAnimation = "ThanatosIdleInhouseFidget_HairFlick",
					WithinDistance = 350,
					FunctionName = _PLUGIN.guid .. "." .. "SurpriseNPCPresentation",
					Args = {
						VoiceLines = {
							Queue = "Interrupt",
							{
								PreLineWait = 0.55,
								BreakIfPlayed = true,
								SkipAnim = true,
								ObjectType = "NPC_Thanatos_01",
								-- I need to ask something of you.
								{ Cue = "/VO/Thanatos_0534" },
							},
						},
						TextLineSet = {
							BecameCloseWithThanatos01 = {
								Name = "BecameCloseWithThanatos01",
								GameStateRequirements = {},
								-- Removed for context
								-- {
								-- 	Cue = "/VO/ZagreusField_01476",
								-- 	Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
								-- 	Speaker = "CharProtag",
								-- 	PreLineAnim = "ZagreusTalkEmpathyStart",
								-- 	PreLineAnimTarget = "Hero",
								-- 	PostLineAnim = "ZagreusTalkEmpathy_Return",
								-- 	PostLineAnimTarget = "Hero",
								-- 	Text = "Thanatos...! I'd ask you to come in, but... you're already here. It's really good to see you."
								-- },
								{
									Cue = "/VO/Thanatos_0417",
									AngleTowardHero = true,
									AngleHeroTowardTargetId = 390000,
									Text =
									"Just tell me one thing, Zagreus. Did you really mean what you told me before, that... maybe we ought to... take our time?"
								},
								{
									Text = "Thanatos_ChoiceText01",
									Portrait = "Portrait_Thanatos_Default_01",
									IgnoreRawText = true,
									BoxAnimation = "NarrationBubbleRomance",
									BoxExitAnimation = "NarrationBubbleRomanceOut",
									DisableCharacterFadeColorLag = true,
									IsNarration = true,
									SkipContextArt = true,
									IgnoreContinueArrow = true,
									TextOffsetY = 0,
									PreContentSound = "/Leftovers/Menu Sounds/EmoteThoughtful",
									Choices = {
										{
											ChoiceText = "Than_BackOff",
											{
												-- Manual replacements of ZagreusHome_ with ZagreusField_0
												Cue = "/VO/ZagreusField_01520",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Serious_01",
												Speaker = "CharProtag",
												PreLineAnim = "ZagreusTalkEmpathyStart",
												PreLineAnimTarget = "Hero",
												PostLineAnim = "ZagreusTalkEmpathy_Return",
												PostLineAnimTarget = "Hero",
												PreLineWait = 0.8,
												-- Manually add to TextLinesRecord, since H2 skips adding choice results
												PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
												PostLineFunctionArgs = { TextLine = "BecameCloseWithThanatos01Than_BackOff" },
												Text =
												"...I did. Sometimes I need to slow things down. I'm thankful that we've been on better terms, lately. But, I've been coming on too strong. Forgive me. You're my dear friend. I don't want to do anything to hurt you. Or anybody else."
											},
											{
												Cue = "/VO/Thanatos_0627",
												Portrait = "Portrait_Thanatos_Pleased_01",
												PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit",
												PreLineWait = 0.5,
												PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ThanatosRoomOpeningConversationDone",
												PostLineFunctionArgs = {
													PlayBoonGiveAnimation = true,
													ExitDelay = 3.0,
												},
												Text =
												"I... oh. I see. I understand. You're my dear friend, as well. Though we have done an awful lot to jeopardize that lately, haven't we? Look, take care, Zag. Be seeing you."
											},
											{
												Cue = "/VO/ZagreusField_02531",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
												Speaker = "CharProtag",
												PreLineWait = 0.8,
												Text = "...Be seeing you, too."
											},
										},
										{
											ChoiceText = "Than_GoToHim",
											{
												Cue = "/VO/ZagreusField_01477",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Empathetic_01",
												Speaker = "CharProtag",
												SkipContextArt = true,
												PreLineThreadedFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionApproach",
												PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
												PostLineFunctionArgs = { TextLine = "BecameCloseWithThanatos01Than_GoToHim" },
												Text =
												"I just... don't mean to push you, Than. I know all this is kind of a lot. And I wanted you to know... this isn't some impulsive thing for me. I'll wait for you however long it takes."
											},
											{
												Cue = "/VO/Thanatos_0418",
												AngleTowardHero = true,
												PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
												SkipContextArt = true,
												Text =
												"{#DialogueItalicFormat}Khh! {#Prev}You have no concept of which impulses to act upon, and which to keep in check. You say you'll wait, well, let me ask you this: What are you waiting for? What are you waiting for, I'm here, already. Right...?"
											},
											{
												Cue = "/VO/ZagreusField_01478",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
												Speaker = "CharProtag",
												SkipContextArt = true,
												PortraitExitAnimation = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01_Exit",
												PreLineAnim = "MelTalkExplaining01",
												PreLineAnimTarget = "Hero",
												PostLineAnim = "MelTalkExplaining01ReturnToIdle",
												PostLineAnimTarget = "Hero",
												PostLineFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionPresentation",
												PostLineFunctionArgs = { ExtraWaitTime = 1.2, Partner = "Thanatos" },
												Text = "Than...! {#DialogueItalicFormat}Hahaha{#Prev}, oh, you're right!"
											},
											-- intermission
											{
												Cue = "/VO/ZagreusField_01479",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
												Speaker = "CharProtag",
												SkipContextArt = true,
												PreLineAnim = "ZagreusTalkEmpathyStart",
												PreLineAnimTarget = "Hero",
												PostLineAnim = "ZagreusTalkEmpathy_Return",
												PostLineAnimTarget = "Hero",
												FadeOutTime = 0.5,
												FadeOutSound = "/Leftovers/World Sounds/MapText",
												FullFadeTime = 9.5,
												FadeInTime = 2.5,
												FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
												PreLineWait = 0.4,
												InterSceneWaitTime = 0.5,
												AngleHeroTowardSource = true,
												Text =
												"Hey, Than, look... speak up, already, I don't like it when you're quiet for too long, what's on your mind?"
											},
											{
												Cue = "/VO/Thanatos_0419",
												Portrait = "Portrait_Thanatos_Pleased_01",
												SkipContextArt = true,
												Text =
												"A lot of things. And you will have to grow to like it, Zag. Or, what I mean is... don't take my silence the wrong way, all right? I'd better get going, though, I'm way behind on work, but... see you again. If that's all right."
											},
											{
												Cue = "/VO/ZagreusField_01480",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
												Speaker = "CharProtag",
												SkipContextArt = true,
												PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ThanatosRoomOpeningConversationDone",
												PostLineFunctionArgs = {
													PlayBoonGiveAnimation = true,
													ExitDelay = 3.0,
												},
												Text = "It is. It is."
											},
										},
									},
								},
							},
						},
					},
				},
			},
			ModsNikkelMHadesBiomes_BecameCloseWithThanatos01_B_Trigger = {
				SuperPriority = true,
				PlayOnce = true,
				GiftableOffSource = true,
				StatusAnimation = "StatusIconWantsAffection",
				GameStateRequirements = {
					RequiredTextLines = { "ThanatosFieldAboutRelationship01", "ThanatosGift10", "BecameCloseWithMegaera01Meg_GoToHer" },
					RequiredFalseTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B", },
					RequiredFalseTextLinesLastRun = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B", "BecameCloseWithDusa01", "Ending01", "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B" },
				},

				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = {
					PostTriggerAnimation = "ThanatosIdleInhouseFidget_HairFlick",
					WithinDistance = 350,
					FunctionName = _PLUGIN.guid .. "." .. "SurpriseNPCPresentation",
					Args = {
						VoiceLines = {
							Queue = "Interrupt",
							{
								PreLineWait = 0.55,
								BreakIfPlayed = true,
								SkipAnim = true,
								ObjectType = "NPC_Thanatos_01",
								-- I need to ask something of you.
								{ Cue = "/VO/Thanatos_0534" },
							},
						},
						TextLineSet = {
							BecameCloseWithThanatos01_B = {
								Name = "BecameCloseWithThanatos01_B",
								GameStateRequirements = {},
								-- Removed for context
								-- {
								-- 	Cue = "/VO/ZagreusField_01476",
								-- 	Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
								-- 	Speaker = "CharProtag",
								-- 	PreLineAnim = "ZagreusTalkEmpathyStart",
								-- 	PreLineAnimTarget = "Hero",
								-- 	PostLineAnim = "ZagreusTalkEmpathy_Return",
								-- 	PostLineAnimTarget = "Hero",
								-- 	Text = "Thanatos...! I'd ask you to come in, but... you're already here. It's really good to see you."
								-- },
								{
									Cue = "/VO/Thanatos_0417",
									AngleTowardHero = true,
									AngleHeroTowardTargetId = 390000,
									Text =
									"Just tell me one thing, Zagreus. Did you really mean what you told me before, that... maybe we ought to... take our time?"
								},
								{
									Text = "Thanatos_ChoiceText02",
									Portrait = "Portrait_Thanatos_Default_01",
									IgnoreRawText = true,
									BoxAnimation = "NarrationBubbleRomance",
									BoxExitAnimation = "NarrationBubbleRomanceOut",
									DisableCharacterFadeColorLag = true,
									IsNarration = true,
									SkipContextArt = true,
									IgnoreContinueArrow = true,
									TextOffsetY = 0,
									PreContentSound = "/Leftovers/Menu Sounds/EmoteThoughtful",
									Choices = {
										{
											ChoiceText = "Than_BackOff",
											{
												Cue = "/VO/ZagreusField_01520",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Serious_01",
												Speaker = "CharProtag",
												PreLineAnim = "ZagreusTalkEmpathyStart",
												PreLineAnimTarget = "Hero",
												PostLineAnim = "ZagreusTalkEmpathy_Return",
												PostLineAnimTarget = "Hero",
												PreLineWait = 0.8,
												PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
												PostLineFunctionArgs = { TextLine = "BecameCloseWithThanatos01_BThan_BackOff" },
												Text =
												"...I did. Sometimes I need to slow things down. I'm thankful that we've been on better terms, lately. But, I've been coming on too strong. Forgive me. You're my dear friend. I don't want to do anything to hurt you. Or anybody else."
											},
											{
												-- Translated from ThanatosExtra_0001 to Thanatos_00001
												Cue = "/VO/Thanatos_00001",
												Portrait = "Portrait_Thanatos_Pleased_01",
												PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit",
												PreLineWait = 0.5,
												PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ThanatosRoomOpeningConversationDone",
												PostLineFunctionArgs = {
													PlayBoonGiveAnimation = true,
													ExitDelay = 3.0,
												},
												Text = "You're certain? Well... I understand. I'd best get back to my responsibilities for now."
											},
											{
												Cue = "/VO/ZagreusField_00822",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
												Speaker = "CharProtag",
												PreLineWait = 0.8,
												Text = "...See you, Than."
											},
										},
										{
											ChoiceText = "Than_GoToHim",
											{
												Cue = "/VO/ZagreusField_01477",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Empathetic_01",
												Speaker = "CharProtag",
												SkipContextArt = true,
												PreLineThreadedFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionApproach",
												PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
												PostLineFunctionArgs = { TextLine = "BecameCloseWithThanatos01_BThan_GoToHim" },
												Text =
												"I just... don't mean to push you, Than. I know all this is kind of a lot. And I wanted you to know... this isn't some impulsive thing for me. I'll wait for you however long it takes."
											},
											{
												Cue = "/VO/Thanatos_0418",
												AngleTowardHero = true,
												PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
												SkipContextArt = true,
												Text =
												"{#DialogueItalicFormat}Khh! {#Prev}You have no concept of which impulses to act upon, and which to keep in check. You say you'll wait, well, let me ask you this: What are you waiting for? What are you waiting for, I'm here, already. Right...?"
											},
											{
												Cue = "/VO/ZagreusField_01481",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
												Speaker = "CharProtag",
												SkipContextArt = true,
												PortraitExitAnimation = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01_Exit",
												PreLineAnim = "MelTalkExplaining01",
												PreLineAnimTarget = "Hero",
												PostLineAnim = "MelTalkExplaining01ReturnToIdle",
												PostLineAnimTarget = "Hero",
												Text =
												"Than... {#DialogueItalicFormat}hahaha{#Prev}, I'm so glad! It's just... you know that Megaera has been here, too...?"
											},
											{
												Cue = "/VO/Thanatos_0420",
												Portrait = "Portrait_Thanatos_Pleased_01",
												SkipContextArt = true,
												Text =
												"{#DialogueItalicFormat}Tsch. {#Prev}I've known Megaera much longer than you. Who do you think talked me into this?"
											},
											{
												Cue = "/VO/ZagreusField_01482",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
												Speaker = "CharProtag",
												SkipContextArt = true,
												PortraitExitAnimation = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01_Exit",
												PreLineAnim = "MelTalkExplaining01",
												PreLineAnimTarget = "Hero",
												PostLineAnim = "MelTalkExplaining01ReturnToIdle",
												PostLineAnimTarget = "Hero",
												PostLineFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionPresentation",
												PostLineFunctionArgs = { ExtraWaitTime = 1.2, Partner = "Thanatos" },
												Text = "Hah! She did, did she? That's good! That's good."
											},
											-- intermission
											{
												Cue = "/VO/ZagreusField_01479",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
												Speaker = "CharProtag",
												SkipContextArt = true,
												PreLineAnim = "ZagreusTalkEmpathyStart",
												PreLineAnimTarget = "Hero",
												PostLineAnim = "ZagreusTalkEmpathy_Return",
												PostLineAnimTarget = "Hero",
												FadeOutTime = 0.5,
												FadeOutSound = "/Leftovers/World Sounds/MapText",
												FullFadeTime = 9.5,
												FadeInTime = 2.5,
												FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
												PreLineWait = 0.4,
												InterSceneWaitTime = 0.5,
												AngleHeroTowardSource = true,
												Text =
												"Hey, Than, look... speak up, already, I don't like it when you're quiet for too long, what's on your mind?"
											},
											{
												Cue = "/VO/Thanatos_0419",
												Portrait = "Portrait_Thanatos_Pleased_01",
												SkipContextArt = true,
												Text =
												"A lot of things. And you will have to grow to like it, Zag. Or, what I mean is... don't take my silence the wrong way, all right? I'd better get going, though, I'm way behind on work, but... see you again. If that's all right."
											},
											{
												Cue = "/VO/ZagreusField_01480",
												Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
												Speaker = "CharProtag",
												SkipContextArt = true,
												PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ThanatosRoomOpeningConversationDone",
												PostLineFunctionArgs = {
													PlayBoonGiveAnimation = true,
													ExitDelay = 3.0,
												},
												Text = "It is. It is."
											},
										},
									},
								},
							},
						},
					},
				},
			},
			-- #endregion

			ThanatosBackstory01_B = {
				EndVoiceLines = {
					RequiredMinElapsedTime = mod.NilValue,
				},
			},
			ThanatosBackstory02 = {
				[2] = {
					PostLineThreadedFunctionName = mod.NilValue,
					PostLineFunctionName = _PLUGIN.guid .. "." .. "TimePassesPresentation",
					PostLineFunctionArgs = { IsLoungeRevelryPresentation = true, PreTextWait = 0.75, Sound2 = "/EmptyCue" },
				},
				[3] = {
					InterSceneWaitTime = mod.NilValue,
					TeleportToId = mod.NilValue,
					AngleTowardTargetId = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
				},
				[6] = {
					TeleportToId = mod.NilValue,
					AngleTowardTargetId = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
				},
			},
			ThanatosPostEnding02 = {
				AreIdsAlive = mod.NilValue,
			},
			ThanatosHomeIntermissionChat01 = {
				AreIdsAlive = mod.NilValue,
				[1] = {
					SkipContextArt = true,
					PostLineFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionPresentation",
					PostLineThreadedFunctionName = mod.NilValue,
				},
				[2] = {
					SkipContextArt = true,
					LoadMap = mod.NilValue,
					SpawnOnId = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
				},
			},
			ThanatosHomeIntermissionChat02 = {
				AreIdsAlive = mod.NilValue,
				[1] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionPresentation",
					PostLineThreadedFunctionName = mod.NilValue,
				},
				[2] = {
					SkipContextArt = true,
					LoadMap = mod.NilValue,
					SpawnOnId = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
				},
			},
			ThanatosHomeIntermissionChat03 = {
				AreIdsAlive = mod.NilValue,
				[1] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionPresentation",
					PostLineThreadedFunctionName = mod.NilValue,
				},
				[2] = {
					SkipContextArt = true,
					LoadMap = mod.NilValue,
					SpawnOnId = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
				},
			},
			ThanatosHomeIntermissionChat04 = {
				AreIdsAlive = mod.NilValue,
				[1] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionPresentation",
					PostLineThreadedFunctionName = mod.NilValue,
				},
				[2] = {
					SkipContextArt = true,
					LoadMap = mod.NilValue,
					SpawnOnId = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
				},
			},
			ThanatosHomeIntermissionChat05 = {
				AreIdsAlive = mod.NilValue,
				[1] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionPresentation",
					PostLineThreadedFunctionName = mod.NilValue,
				},
				[2] = {
					SkipContextArt = true,
					LoadMap = mod.NilValue,
					SpawnOnId = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
				},
			},
			ThanatosHomeIntermissionChat06 = {
				AreIdsAlive = mod.NilValue,
				[1] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "BedroomIntermissionPresentation",
					PostLineThreadedFunctionName = mod.NilValue,
				},
				[2] = {
					SkipContextArt = true,
					LoadMap = mod.NilValue,
					SpawnOnId = mod.NilValue,
					TeleportHeroToId = mod.NilValue,
					AngleHeroTowardTargetId = mod.NilValue,
				},
			},
		},
		GiftTextLineSets = {
			ThanatosGift01 = {
				UnfilledIcon = "EmptyHeartWithGiftIcon",
				FilledIcon = "FilledHeartWithGiftIcon",
			},
			ThanatosGift04 = {
				[2] = {
					-- Manually add the alternate to the TextLineRecord to not break the NarrativeData/locked hint ordering in the Codex
					PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
					PostLineFunctionArgs = { TextLine = "ThanatosGift04_B", AddToGiftTextLinesOrderRecord = true },
				},
			},
			ThanatosGift04_B = {
				-- Only one of the alternates should be on the GiftTrack
				-- Which one doesn't matter, as both are added to the TextLinesRecord at the same time
				OnGiftTrack = false,
				[2] = {
					PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
					PostLineFunctionArgs = { TextLine = "ThanatosGift04", AddToGiftTextLinesOrderRecord = true },
				},
			},
			ThanatosGift07_A = {
				GameStateRequirements = {
					{
						Path = { "GameState", "TextLinesRecord", },
						HasAll = { "ThanatosGift06", "ThanatosFieldBuildingTrust01" }
					},
				},
				LockedHintId = "ModsNikkelMHadesBiomes_Codex_ThanatosUnlockHint01",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			ThanatosGift08 = {
				StartBecomingCloserTrack = true,
				HintId = "Codex_GrowingCloser01",
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
		SpecialInteractFunctionName = mod.NilValue,
		SpecialInteractGameStateRequirements = {
			Skip = true,
		},
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
		InteractTextLineSets = {
			ThanatosFieldBuildingTrust01 = {
				-- This is never initialized in H2, and only checked for this one textline, making sure you've beat Thanatos last time as well - it's not that important for consistency
				ObjectiveCompletedLastOffer = mod.NilValue,
			},
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
		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "OrpheusGift01" },
			},
			{
				-- Can't Salute when he's about to disappear
				PathFalse = { "CurrentRun", "TextLinesRecord", "OrpheusAboutSingersReunionQuest01" },
			},
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines = {
			{ GlobalVoiceLines = "ModsNikkelMHadesBiomes_SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.3,
				ObjectType = "NPC_Orpheus_01",
				PreLineAnim = "OrpheusFidget",
				-- Hello...!
				{ Cue = "/VO/Orpheus_0060", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0060" }, },
				-- Hello...
				{ Cue = "/VO/Orpheus_0061", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0061" }, },
				-- Hmm.
				{ Cue = "/VO/Orpheus_0062", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0062" }, },
				-- Ah.
				{ Cue = "/VO/Orpheus_0063", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0063" }, },
				-- Oh, um, hello.
				{ Cue = "/VO/Orpheus_0064", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0064" }, },
				-- Hello there.
				{ Cue = "/VO/Orpheus_0065", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0065" }, },
				-- Hello my friend.
				{ Cue = "/VO/Orpheus_0093", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0093" }, RequiredTextLines = { "OrpheusGift02" }, },
				-- Hello friend.
				{ Cue = "/VO/Orpheus_0094", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0094" }, RequiredTextLines = { "OrpheusGift06" }, },
				-- Greetings.
				{ Cue = "/VO/Orpheus_0095", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0095" }, RequiredTextLines = { "OrpheusGift02" }, },
			},
		},
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
			OrpheusGift01 = {
				UnfilledIcon = "EmptyHeartWithGiftIcon",
				FilledIcon = "FilledHeartWithGiftIcon",
			},
			OrpheusGift02 = {
				UnfilledIcon = "EmptyHeartWithProphecyIcon",
				FilledIcon = "FilledHeartWithProphecyIcon",
			},
			OrpheusGift04 = {
				[2] = {
					-- Manually add the alternate to the TextLineRecord to not break the NarrativeData/locked hint ordering in the Codex
					PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
					PostLineFunctionArgs = { TextLine = "OrpheusGift04_B", AddToGiftTextLinesOrderRecord = true },
				},
			},
			OrpheusGift04_B = {
				-- Only one of the alternates should be on the GiftTrack
				-- Which one doesn't matter, as both are added to the TextLinesRecord at the same time
				OnGiftTrack = false,
				[2] = {
					PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "AddTextLineToTextLineRecord",
					PostLineFunctionArgs = { TextLine = "OrpheusGift04", AddToGiftTextLinesOrderRecord = true },
				},
			},
			OrpheusGift05 = {
				[2] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "TimePassesPresentation",
					PostLineFunctionArgs = { IsLoungeRevelryPresentation = true, PreTextWait = 0.75, Sound2 = "/EmptyCue" },
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
						Path = { "GameState", "TextLinesRecord", },
						HasAll = { "OrpheusGift06", "OrpheusAboutSingersReunionQuest01" }
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
		AllowSpecialInteractInPartnerConversation = true,
		InteractVoiceLines = {
			{ GlobalVoiceLines = "ModsNikkelMHadesBiomes_SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.3,
				ObjectType = "NPC_Orpheus_Story_01",
				-- Hello...!
				{ Cue = "/VO/Orpheus_0060", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0060" }, },
				-- Hello...
				{ Cue = "/VO/Orpheus_0061", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0061" }, },
				-- Hmm.
				{ Cue = "/VO/Orpheus_0062", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0062" }, },
				-- Ah.
				{ Cue = "/VO/Orpheus_0063", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0063" }, },
				-- Oh, um, hello.
				{ Cue = "/VO/Orpheus_0064", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0064" }, },
				-- Hello there.
				{ Cue = "/VO/Orpheus_0065", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0065" }, },
				-- Hello my friend.
				{ Cue = "/VO/Orpheus_0093", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0093" }, RequiredTextLines = { "OrpheusGift02" }, },
				-- Hello friend.
				{ Cue = "/VO/Orpheus_0094", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0094" }, RequiredTextLines = { "OrpheusGift06" }, },
				-- Greetings.
				{ Cue = "/VO/Orpheus_0095", RequiredFalsePlayedThisRoom = { "/VO/Orpheus_0095" }, RequiredTextLines = { "OrpheusGift02" }, },
			},
		},
		InteractTextLineSets = {
			OrpheusWithEurydice01 = {
				RequiredFalseTextLinesLastRun = mod.NilValue,
				RequiredFalseTextLinesThisRun = { "OrpheusAboutSingersReunionQuest01" },
			},
		},
	},
	NPC_FurySister_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		SubtitleColor = game.Color.MegVoice,
		AnimOffsetZ = 240,
		ActivateRequirements = {
			RequiredAnyKillsThisRun = mod.NilValue,
			-- TODO: Make sure to uncomment before releasing
			{
				Path = { "CurrentRun", "EnemyKills" },
				HasAny = { "Harpy", "Harpy2" }
			},
			-- Can't appear the first time you reach Styx (this is incremented before the check, which is the reason for the >1 check)
			{
				Path = { "GameState", "RoomsEntered", "D_Hub" },
				Comparison = ">",
				Value = 1,
			},
		},
		SpecialInteractFunctionName = "SpecialInteractSalute",
		SpecialInteractGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "MegaeraGift01" },
			},
			-- TODO: Any voicelines she disappears after?
		},
		SpecialInteractCooldown = 60,
		InteractVoiceLines = {
			{ GlobalVoiceLines = "ModsNikkelMHadesBiomes_SaluteVoiceLines" },
			{
				RandomRemaining = true,
				PreLineWait = 0.3,
				ObjectType = "NPC_FurySister_01",
				PreLineAnim = "FuryIdleInHouseFidgetGreeting",
				-- Something you need from me?
				{ Cue = "/VO/MegaeraHome_0242", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0242", }, RequiredTextLines = { "MegaeraGift10" }, },
				-- What can I do for you?
				{ Cue = "/VO/MegaeraHome_0244", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0244", }, RequiredTextLines = { "MegaeraGift10" }, },
				-- Tsch...
				{ Cue = "/VO/MegaeraHome_0053", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0053", }, },
				-- Go away.
				{ Cue = "/VO/MegaeraHome_0056", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0056", }, RequiredFalseTextLines = { "MegaeraGift05" },                                                             RequiredMinCompletedRuns = 4 },
				-- Hmph.
				{ Cue = "/VO/MegaeraHome_0057", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0057", }, },
				-- Hmm.
				{ Cue = "/VO/MegaeraHome_0066", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0066", }, RequiredTextLines = { "MegaeraGift03" }, },
				-- Yes?
				{ Cue = "/VO/MegaeraHome_0067", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0067", }, RequiredMinCompletedRuns = 4 },
				-- May I help you?
				{ Cue = "/VO/MegaeraHome_0068", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0068", }, RequiredMinCompletedRuns = 4 },
				-- Eh.
				{ Cue = "/VO/MegaeraHome_0069", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0069", }, RequiredFalseTextLines = { "MegaeraGift05" } },
				-- Khh.
				{ Cue = "/VO/MegaeraHome_0070", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0070", }, RequiredFalseTextLines = { "MegaeraGift06" } },
				-- What.
				{ Cue = "/VO/MegaeraHome_0071", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0071", }, RequiredMinCompletedRuns = 4 },
				-- Oh.
				{ Cue = "/VO/MegaeraHome_0072", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0072", }, RequiredFalseTextLines = { "MegaeraGift07" } },
				-- Hmm.
				{ Cue = "/VO/MegaeraHome_0061", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0061", }, RequiredTextLines = { "MegaeraGift05" } },
				-- Yes...?
				{ Cue = "/VO/MegaeraHome_0073", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0073", }, RequiredTextLines = { "MegaeraGift06" } },
				-- Hey you.
				{ Cue = "/VO/MegaeraHome_0190", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0190", }, RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" } },
				-- Hmm.
				{ Cue = "/VO/MegaeraHome_0193", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0193", }, RequiredTextLines = { "MegaeraGift09" } },
				-- Oh, hey.
				{ Cue = "/VO/MegaeraHome_0194", RequiredFalsePlayedThisRoom = { "/VO/MegaeraHome_0194", }, RequiredTextLines = { "MegaeraGift10" } },
			},
		},
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		RepulseOnMeleeInvulnerableHit = 150,
		InteractTextLineSets = {
			MegaeraMeeting01_Alt = {
				TeleportToId = mod.NilValue,
			},
			MegaeraMeeting01_Alt_B = {
				TeleportToId = mod.NilValue,
			},
			MegaeraMeeting03_Alt = {
				TeleportToId = mod.NilValue,
			},
			MegaeraMeeting04_Alt = {
				TeleportToId = mod.NilValue,
			},
			MegaeraPactProgress01_B = {
				TeleportToId = mod.NilValue,
			},
			MegaeraRunProgress01_Alt = {
				TeleportToId = mod.NilValue,
			},
			MegaeraRunCleared01_Alt = {
				TeleportToId = mod.NilValue,
			},
			MegaeraAboutPersephoneMeeting01_Alt = {
				TeleportToId = mod.NilValue,
			},
			-- Has a "Continued" variant that usually is eligible after this one plays, but the prioritization doesn't pick it up, so we just disable it
			MegaeraMeeting02 = {
				UseableOffSource = true,
			},
			-- Has a "Continued" variant that usually is eligible after this one plays, but the prioritization doesn't pick it up, so we just disable it
			MegaeraMeeting04 = {
				UseableOffSource = true,
			},

			-- RepeatableTextLineSets
			MegChat02_Alt = {
				TeleportToId = mod.NilValue,
			},
			MegChat03_Alt = {
				TeleportToId = mod.NilValue,
			},
		},
		-- TODO: Intermission scenes (same for InteractTextLineSets)
		GiftTextLineSets = {
			MegaeraGift01 = {
				UnfilledIcon = "EmptyHeartWithGiftIcon",
				FilledIcon = "FilledHeartWithGiftIcon",
			},
			MegaeraGift07 = {
				GameStateRequirements = {
					{
						Path = { "GameState", "TextLinesRecord", },
						-- TODO: Bedroom scenes as for Thanatos, Meg has three (plus variants)
						HasAny = { "MegaeraBedroom02", "MegaeraBedroom02B" }
					},
				},
				LockedHintId = "ModsNikkelMHadesBiomes_Codex_MegaeraUnlockHint01",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			MegaeraGift08 = {
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			MegaeraGift09 = {
				StartBecomingCloserTrack = true,
				HintId = "Codex_GrowingCloser01",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
			},
			MegaeraGift10 = {
				CompletedHintId = "ModsNikkelMHadesBiomes_Codex_BondForgedMegaera",
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue },
				[4] = {
					PostLineFunctionName = _PLUGIN.guid .. "." .. "TimePassesPresentation",
					PostLineThreadedFunctionName = mod.NilValue,
					PostLineFunctionArgs = { IsLoungeRevelryPresentation = true, PreTextWait = 0.75 },
				},
				[5] = {
					FadeOutTime = mod.NilValue,
					FullFadeTime = mod.NilValue,
					FadeInTime = mod.NilValue,
					PreLineWait = mod.NilValue,
					FadeInSound = mod.NilValue,
					InterSceneWaitTime = mod.NilValue,
				},
				[9] = { PostLineFunctionArgs = { Icon = mod.SharedKeepsakePortMegaeraKeepsakeBondIcon }, },
			},
		},
		MissingDistanceTrigger = mod.NilValue,
		-- TODO: Copied from ???
		OnHitVoiceLines = {
		},
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
			-- Thanatos should leave after the conversation in RoomOpening, and spawn the reward (this will override any existing ThanatosExit function call)
			InteractTextLineSets = {
				PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ThanatosRoomOpeningConversationDone",
				PostLineFunctionArgs = {
					PlayBoonGiveAnimation = true,
					ExitDelay = 3.0,
				},
			},
			RepeatableTextLineSets = {
				PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ThanatosRoomOpeningConversationDone",
				PostLineFunctionArgs = {
					-- The boon is already there for repeatable textlines
					PlayBoonGiveAnimation = false,
					ExitDelay = 1.5,
				},
			},
			-- Thanatos should leave if he has no more dialogue after being gifted
			GiftTextLineSets = {
				PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesCheckThanatosPostGiftExit",
				PostLineThreadedFunctionArgs = { Delay = 2, },
			},
		},
		AlwaysReplaceIfExist = {
			RequiredRoom = {
				Find = "DeathArea",
				Replace = "RoomOpening",
			},
			StatusAnimation = {
				Find = "StatusIconWantsToSmooch",
				Replace = "StatusIconWantsAffection",
			},
		},
		-- Replace requirements referencing the CurrentRun to reference PrevRun instead
		AlwaysReplaceKeysIfExist = {
			RequiresRunCleared = "RequiresLastRunCleared",
			RequiresRunNotCleared = "RequiresLastRunNotCleared",
			RequiredTextLinesThisRun = "RequiredTextLinesLastRun",
			RequiredFalseTextLinesThisRun = "RequiredFalseTextLinesLastRun",
			RequiredEncounterThisRun = "RequiredEncounterLastRun",
			RequiredKillsThisRun = "RequiredKillsLastRun",
			RequiredFalseDeathEncounters = "RequiredFalseDeathEncountersThanatos",
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
	NPC_FurySister_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets", "GiftTextLineSets" },
		AlwaysReplaceIfExist = {
			StatusAnimation = {
				Find = "StatusIconWantsToSmooch",
				Replace = "StatusIconWantsAffection",
			},
		},
		-- Replace requirements referencing the CurrentRun to reference PrevRun instead
		AlwaysReplaceKeysIfExist = {
			RequiresRunCleared = "RequiresLastRunCleared",
			RequiresRunNotCleared = "RequiresLastRunNotCleared",
			RequiredTextLinesThisRun = "RequiredTextLinesLastRun",              -- TODO: Validate if it should be this run
			RequiredFalseTextLinesThisRun = "RequiredFalseTextLinesLastRun",    -- TOOD: Validate if it should be this run
			RequiredEncounterThisRun = "RequiredEncounterLastRun",              -- TODO: Validate if it should be this run
			RequiredKillsThisRun = "RequiredKillsLastRun",                      -- TODO: Validate
			RequiredFalseDeathEncounters = "RequiredFalseDeathEncountersThanatos", -- TODO: Validate
			RequiredRoomThisRun = "RequiredRoomLastRun",
			RequiredFalseSeenRoomThisRun = "RequiredFalseSeenRoomLastRun",
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
applyNPCGlobalModifications(mod.NPCData, npcModifications)

mod.ApplyModificationsAndInheritEnemyData(mod.NPCData, npcModifications, {}, {})
