-- #region New/Imported text lines
--- Add modded narrative text lines into NarrativeData and LootData/EnemyData with priority placement and voicebank mapping.
---@param newTextLines table<string, table> Text line sets keyed by text line id, each including `ModsNikkelMHadesBiomes_TextLineMetadata`
---@param narrativeDataKey string Key in `game.NarrativeData` and `game.LootData`/`game.EnemyData`
---@param textLineType string Field name on LootData/EnemyData to store sets (e.g. "InteractTextLineSets")
---@param textLinePriorityType string Field name on NarrativeData priority table (e.g. "InteractTextLinePriorities")
---@param voiceBankMappings table<string, table<string>> Voicebank mapping to load modded voicebanks with vanilla loads
---@param cueMappings table<string, string> Cue prefix mapping, applied to `/VO/<Find>` -> `/VO/<ReplaceWith>`
---@param portraitMappings table<string, string> Mappings of Cue prefixes to Portrait names
function mod.AddNarrativeDataEntries(newTextLines, narrativeDataKey, textLineType, textLinePriorityType,
																		 voiceBankMappings, cueMappings, portraitMappings)
	if narrativeDataKey == nil or textLineType == nil or textLinePriorityType == nil or voiceBankMappings == nil or cueMappings == nil or portraitMappings == nil then
		mod.DebugPrint("A required parameter is missing!", 1)
		return
	end

	local narrativeData = game.NarrativeData[narrativeDataKey]
	if narrativeData == nil then
		mod.DebugPrint("Narrative data key " .. narrativeDataKey .. " not found, cannot add new text lines!", 1)
		return
	end

	local textLineSetsOwner = game.LootData[narrativeDataKey] or game.EnemyData[narrativeDataKey]
	if textLineSetsOwner == nil then
		mod.DebugPrint("LootData or EnemyData table for " .. narrativeDataKey .. " not found, cannot add new text lines!", 1)
		return
	end

	-- To load the new required voicebanks whenever this loot's voicebank is loaded
	for vanillaVoiceBank, mappedVoiceBanks in pairs(voiceBankMappings) do
		mod.LootVoiceBankMappings[vanillaVoiceBank] = mod.LootVoiceBankMappings[vanillaVoiceBank] or {}
		for _, mappedVoiceBank in ipairs(mappedVoiceBanks) do
			if not game.Contains(mod.LootVoiceBankMappings[vanillaVoiceBank], mappedVoiceBank) then
				table.insert(mod.LootVoiceBankMappings[vanillaVoiceBank], mappedVoiceBank)
			end
		end
	end

	-- #region Helper functions
	local function insertAfterGroup(priorityTable, target, entry, textLineKey)
		for i, group in ipairs(priorityTable) do
			if type(group) == "table" then
				for _, lineName in ipairs(group) do
					if lineName == target then
						table.insert(priorityTable, i + 1, entry)
						mod.DebugPrint("Inserted " .. textLineKey .. " after group containing " .. target, 4)
						return true
					end
				end
			end
		end
		mod.DebugPrint(
			"InsertAfterTextLineGroupContaining target '" .. tostring(target) .. "' not found for " .. textLineKey, 1)
		return false
	end

	local function insertAfterLine(priorityTable, target, entry, textLineKey, createNewGroup)
		for i, val in ipairs(priorityTable) do
			if type(val) == "string" then
				if val == target then
					table.insert(priorityTable, i + 1, entry)
					mod.DebugPrint("Inserted " .. textLineKey .. " after line " .. target, 4)
					return true
				end
			elseif type(val) == "table" then
				for j, lineName in ipairs(val) do
					if lineName == target then
						if createNewGroup then
							mod.DebugPrint("Cannot create new group after line inside group for " .. textLineKey, 1)
							return false
						end
						table.insert(val, j + 1, textLineKey)
						mod.DebugPrint("Inserted " .. textLineKey .. " after line " .. target .. " inside its group", 4)
						return true
					end
				end
			end
		end
		mod.DebugPrint("InsertAfterNarrativeTextLine target '" .. tostring(target) .. "' not found for " .. textLineKey, 1)
		return false
	end
	-- #endregion

	local keysCreateNewGroup = {}
	local keysOthers = {}
	for key, data in pairs(newTextLines) do
		local metadata = data.ModsNikkelMHadesBiomes_TextLineMetadata
		if metadata == nil then
			mod.DebugPrint("Missing ModsNikkelMHadesBiomes_TextLineMetadata for " .. key, 1)
			return
		end

		-- We need to insert all those textlines that create new groups first, so others can be added to those groups
		if metadata.CreateNewPriorityGroup then
			table.insert(keysCreateNewGroup, key)
		else
			table.insert(keysOthers, key)
		end
	end

	local orderedKeys = {}
	for _, key in ipairs(keysCreateNewGroup) do
		table.insert(orderedKeys, key)
	end
	for _, key in ipairs(keysOthers) do
		table.insert(orderedKeys, key)
	end

	for _, key in ipairs(orderedKeys) do
		local data = newTextLines[key]
		local metadata = data.ModsNikkelMHadesBiomes_TextLineMetadata
		-- #region Required modifications to all text lines
		-- Mark as modded textline
		data.ModsNikkelMHadesBiomesIsModdedTextLine = true
		if narrativeDataKey == "TrialUpgrade" then
			-- This will prevent using the Chaos effects on boon pickup, which would double up
			data.ModsNikkelMHadesBiomesIsModdedTrialUpgradeTextLine = true
		end

		data.GameStateRequirements = data.GameStateRequirements or {}
		-- All modded text lines can only appear in modded runs
		table.insert(data.GameStateRequirements, { PathTrue = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" } })
		-- This requirement was missing in Hades' textlines
		table.insert(data.GameStateRequirements, { PathFalse = { "CurrentRun", "UseRecord", narrativeDataKey } })

		for _, line in ipairs(data) do
			line.UseRoomContextArt = true
			-- Update portraits, must be done before the Cues are modified
			for cuePrefix, portraitName in pairs(portraitMappings) do
				if line.Cue:find("^/VO/" .. cuePrefix) then
					line.Portrait = portraitName
				elseif line.Portrait then
					-- Update Zagreus portrait references
					if line.Portrait:find("^Portrait_Zag_") then
						line.Portrait = line.Portrait:gsub("^Portrait_Zag_", "ModsNikkelMHadesBiomes_Portrait_Zag_")
					end
				end
			end
			-- Translate Cues to reference the new VoiceBank(s)
			for cuePrefix, cueMapping in pairs(cueMappings) do
				if line.Cue:find("^/VO/" .. cuePrefix) then
					line.Cue = line.Cue:gsub("^/VO/" .. cuePrefix, "/VO/" .. cueMapping)
				end
			end
		end
		-- #endregion

		-- #region Insert into LootData/EnemyData & NarrativeData priority table
		local priorityTable = narrativeData[textLinePriorityType]
		if priorityTable == nil then
			mod.DebugPrint(
				"Priority table " .. textLinePriorityType .. " not found for " .. narrativeDataKey .. ", cannot insert " .. key,
				1)
			return
		end

		local textLineSetsTable = textLineSetsOwner[textLineType]
		if textLineSetsTable == nil then
			mod.DebugPrint("Sets table " .. tostring(textLineType) .. " not found for " .. narrativeDataKey, 1)
			return
		end

		data.ModsNikkelMHadesBiomes_TextLineMetadata = nil
		textLineSetsTable[key] = data

		-- Is this a new sub-table, or just the key itself
		local entry = metadata.CreateNewPriorityGroup and { key } or key

		if metadata.InsertAfterTextLineGroupContaining ~= nil then
			insertAfterGroup(priorityTable, metadata.InsertAfterTextLineGroupContaining, entry, key)
		elseif metadata.InsertAfterNarrativeTextLine ~= nil then
			insertAfterLine(priorityTable, metadata.InsertAfterNarrativeTextLine, entry, key,
				metadata.CreateNewPriorityGroup)
		else
			mod.DebugPrint("No insertion target specified for " .. key .. " in " .. narrativeDataKey, 1)
			return
		end
		-- #endregion
	end
end

-- #endregion

-- #region Misc
-- Update the requirements for the Devotion reward to require a minimum biome depth of 3, as that's where Elites become eligible
local devotionOrRequirements = {
	-- Either, we are not in a modded run, or we are in a modded run and at least at biome depth 3
	{
		{
			PathFalse = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" },
		},
	},
	{
		{
			PathTrue = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" },
		},
		{
			Path = { "CurrentRun", "BiomeEncounterDepth" },
			Comparison = ">=",
			Value = 3,
		},
	},
}

for _, reward in ipairs(game.RewardStoreData.RunProgress) do
	if reward.Name == "Devotion" then
		reward.GameStateRequirements.OrRequirements = devotionOrRequirements
		break
	end
end
-- #endregion
