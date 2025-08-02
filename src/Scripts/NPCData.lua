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
							local last = textLineSet[#textLineSet]
							if last and last.Text == mappingData.TextToMatch then
								table.remove(textLineSet, #textLineSet)
								textLineSet.PrePortraitExitFunctionName = mappingData.PrePortraitExitFunctionName
								textLineSet.PrePortraitExitFunctionArgs = mappingData.PrePortraitExitFunctionArgs
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
	},
}

-- Before adding them to the game, we need to apply some additional modifications to NPCs
local npcChoiceMappings = {
	NPC_Sisyphus_01 = {
		TextLineGroups = { "InteractTextLineSets", "RepeatableTextLineSets" },
		TextToMatch = "Sisyphus_OfferText01",
		ExcludeNamedTextLines = {
			"SisyphusLiberationQuestComplete",
		},
		PrePortraitExitFunctionName = "SisyphusBenefitChoice",
		PrePortraitExitFunctionArgs = mod.PresetEventArgs.SisyphusBenefitChoices,
	}
}

applyNPCChoiceMappings(mod.NPCData, npcChoiceMappings)

mod.ApplyModificationsAndInheritEnemyData(mod.NPCData, npcModifications, {}, {})
