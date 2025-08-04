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

local npcModifications = {
	NPC_Sisyphus_01 = {
		RequiredRoomInteraction = true,
		BlockedLootInteractionText = "NPCUseTextTalkLocked",
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
	},
	NPC_Eurydice_01 = {
		TextLinesPauseAmbientMusicVocals = mod.NilValue,
		ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines = true,
		RequiredRoomInteraction = true,
		BlockedLootInteractionText = "NPCUseTextTalkLocked",
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
	},
	NPC_Patroclus_01 = {
		RequiredRoomInteraction = true,
		BlockedLootInteractionText = "NPCUseTextTalkLocked",
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
		PrePortraitExitFunctionName = "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.SisyphusBenefitChoices,
	},
	NPC_Eurydice_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = { "Eurydice_OfferText01", "Eurydice_OfferText02", },
		PrePortraitExitFunctionName = "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.EurydiceBenefitChoices,
		AlwaysReplaceIfExist = {
			OnQueuedFunctionName = "ModsNikkelMHadesBiomesEurydiceMusic",
		},
	},
	NPC_Patroclus_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = { "Patroclus_OfferText02", "Patroclus_OfferText03", "Patroclus_OfferText04", "Patroclus_OfferText05" },
		PrePortraitExitFunctionName = "ModsNikkelMHadesBiomesBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.PatroclusBenefitChoices,
	}
}

applyNPCChoiceMappings(mod.NPCData, npcChoiceMappings)

mod.ApplyModificationsAndInheritEnemyData(mod.NPCData, npcModifications, {}, {})
