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
							-- Replace the choice mappings
							local last = textLineSet[#textLineSet]
							if last and game.Contains(mappingData.TextToMatch, last.Text) then
								textLineSet.ModsNikkelMHadesBiomesPreviousOfferText = last.Text
								textLineSet.PrePortraitExitFunctionName = mappingData.PrePortraitExitFunctionName
								textLineSet.PrePortraitExitFunctionArgs = mappingData.PrePortraitExitFunctionArgs
								table.remove(textLineSet, #textLineSet)
							end

							-- Do other replacements to each of the textlines in the group
							for property, replacement in pairs(mappingData.AlwaysReplaceIfExist or {}) do
								if textLineSet[property] then
									textLineSet[property] = replacement
								end
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
		end

		-- Move all interaction textlines into the InteractTextLineSets, out of the RepeatableTextLineSets
		if npcData.InteractTextLineSets and npcData.RepeatableTextLineSets then
			for key, textLineSet in pairs(npcData.RepeatableTextLineSets or {}) do
				npcData.InteractTextLineSets[key] = textLineSet
			end
			npcData.RepeatableTextLineSets = nil
		end
	end
end

local npcModifications = {
	NPC_Sisyphus_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
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
			"ModsNikkelMHadesBiomesSisyphusMoney",
			"ModsNikkelMHadesBiomesSisyphusMetapoints",
		},
		InteractTextLineSets = {
			SisyphusAboutBouldy02 = { RequiredTextLines = { "ModsNikkelMHadesBiomes_BouldyFirstMeeting", }, },
			SisyphusLiberationQuest_Beginning_01 = { RequiredTextLines = { "SisyphusBackstory03", "SisyphusMeeting06", "SisyphusGift06", "ModsNikkelMHadesBiomes_BouldyFirstMeeting" }, },
		},
		-- From Hades GiftData.lua
		GiftTextLineSets = {
			SisyphusGift07_A = {
				RequiredAnyTextLines = mod.NilValue,
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue }
			},
			-- If you haven't had Ambrosia with others - would be very rare, so we just exclude it
			SisyphusGift08_A = mod.NilValue,
			SisyphusGift08_B = {
				RequiredAnyTextLines = mod.NilValue,
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue }
			},
			SisyphusGift09_A = {
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue }
			},
			-- Need to rename ZagreusHome to ZagreusField voicelines
			SisyphusGift01 = {
				[1] = { Cue = "/VO/ZagreusField_00120", }
			},
			SisyphusGift05 = {
				[2] = { Cue = "/VO/ZagreusField_00523", }
			},
			SisyphusGift06 = {
				[2] = { Cue = "/VO/ZagreusField_00524", }
			},
		},
	},
	ModsNikkelMHadesBiomes_NPC_Bouldy_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		ActivateRequirements = mod.NilValue,
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
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
		ActivateRequirements = mod.NilValue,
		TextLinesPauseAmbientMusicVocals = mod.NilValue,
		ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines = true,
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
		-- From Hades GiftData.lua
		GiftTextLineSets = {
			EurydiceGift07 = {
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue }
			},
			EurydiceGift08 = {
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue }
			},
		},
	},
	NPC_Patroclus_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
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
		-- From Hades GiftData.lua
		GiftTextLineSets = {
			PatroclusGift07_A = {
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue }
			},
			PatroclusGift08_A = {
				UnfilledIcon = "EmptyHeartWithAmbrosiaIcon",
				FilledIcon = "FilledHeartWithAmbrosiaIcon",
				Cost = { SuperGiftPoints = 1, GiftPoints = mod.NilValue }
			},
		},
	},
	ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01 = {
		ModsNikkelMHadesBiomesIsModdedEnemy = true,
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		Portrait = "ModsNikkelMHadesBiomes_Portrait_Cerberus",
		BossPresentationIntroTextLineSets = {
			CerberusStyxMeeting01 = {
				[1] = { PortraitExitAnimation = "ModsNikkelMHadesBiomes_Portrait_Cerberus_Exit", },
			},
		},
	},
}

-- Before adding them to the game, we need to apply some additional modifications to NPCs
local npcChoiceMappings = {
	NPC_Sisyphus_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = { "Sisyphus_OfferText01", },
		ExcludeNamedTextLines = {
			"SisyphusLiberationQuestComplete",
		},
		PrePortraitExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.SisyphusBenefitChoices,
	},
	NPC_Eurydice_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = { "Eurydice_OfferText01", "Eurydice_OfferText02", },
		PrePortraitExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.EurydiceBenefitChoices,
		AlwaysReplaceIfExist = {
			OnQueuedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesEurydiceMusic",
		},
	},
	NPC_Patroclus_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = { "Patroclus_OfferText02", "Patroclus_OfferText03", "Patroclus_OfferText04", "Patroclus_OfferText05" },
		PrePortraitExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.PatroclusBenefitChoices,
	},
}

-- Custom, more complicated changes before anything else
-- Replace duplicated Bouldy conversations
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.InteractTextLineSets.ModsNikkelMHadesBiomes_BouldyFirstMeeting = game
		.DeepCopyTable(mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.InteractTextLineSets.BouldyFirstMeeting)
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.InteractTextLineSets.BouldyFirstMeeting = nil
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.RepeatableTextLineSets.ModsNikkelMHadesBiomes_BouldyChat01 = game
		.DeepCopyTable(mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.RepeatableTextLineSets.BouldyChat01)
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.RepeatableTextLineSets.ModsNikkelMHadesBiomes_BouldyChat01.RequiredTextLines = {
	"ModsNikkelMHadesBiomes_BouldyFirstMeeting", }
mod.NPCData.ModsNikkelMHadesBiomes_NPC_Bouldy_01.RepeatableTextLineSets.BouldyChat01 = nil

applyNPCChoiceMappings(mod.NPCData, npcChoiceMappings)
applyNPCGlobalModifications(mod.NPCData)

mod.ApplyModificationsAndInheritEnemyData(mod.NPCData, npcModifications, {}, {})
