-- #region New/Imported text lines

-- #region Helper functions for AddNarrativeDataEntries
local hadesTwoDialogueNames = nil

local function dialogueNameExistsInHadesTwo(name)
	-- Built once on first use, before any modded text lines have been inserted, so our own additions cannot cause false positives
	if hadesTwoDialogueNames == nil then
		-- These tables don't contain dialogues (in NarrativeData) and should not be checked
		local nonDialogueNarrativeFields = {
			BonusGiftHeartRequirements = true,
			SpecialGiftTrackHintRequirements = true,
			SpecialKeepsakeEventRequirements = true,
			ChoiceButtons = true,
		}

		hadesTwoDialogueNames = {}
		for _, source in pairs(game.NarrativeData) do
			if type(source) == "table" then
				for key, childTable in pairs(source) do
					if type(childTable) == "table" and not nonDialogueNarrativeFields[key] then
						for _, entry in pairs(childTable) do
							-- Entries are either a dialogue name or a group (table) of dialogue names
							if type(entry) == "table" then
								for _, groupedEntry in pairs(entry) do
									hadesTwoDialogueNames[groupedEntry] = true
								end
							else
								hadesTwoDialogueNames[entry] = true
							end
						end
					end
				end
			end
		end
	end

	return hadesTwoDialogueNames[name] == true
end

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

---Add modded narrative text lines into NarrativeData and LootData/EnemyData with priority placement and voicebank mapping.
---@param newTextLines table<integer, table> Text line sets keyed by text line id, each including `ModsNikkelMHadesBiomes_TextLineMetadata`
---@param narrativeDataKey string Key in `game.NarrativeData` and `game.LootData`/`game.EnemyData`
---@param textLineType string Field name on LootData/EnemyData to store sets (e.g. "InteractTextLineSets")
---@param args table|nil Optional parameters:
---`TextLinePriorityType`: Field name on the NarrativeData priority table (e.g. "InteractTextLinePriorities")
---`VoiceBankMappings`: Voicebank mapping to load modded voicebanks with vanilla loads
---`CueMappings`: Cue prefix mapping, applied to `/VO/<Find>` -> `/VO/<ReplaceWith>`
---`PortraitMappings`: Mappings of Cue prefixes to Portrait names
---`DummyCues`: A random cue from this table is played when the loot is picked up, in place of an actual voiced dialogue
---`DummyVoiceBank`: Loaded for `DummyCues`, and required whenever that is set
---`IgnoreDuplicates`: Skips the duplicates check. Only use for tables where you knowingly add duplicates
---`StripProperties`: A list of property keys within each TextLineSet that should be set to nil
---`SkipModdedRunRequirement`: Prevents adding the `CurrentRun.ModsNikkelMHadesBiomesIsModdedRun` requirement to the given textLines
---`SkipUseRecordRequirement`: Prevents adding the `UseRecord` gate, which Crossroads NPCs must do because interacting records a use before the just-in-time eligibility recheck
function mod.AddNarrativeDataEntries(newTextLines, narrativeDataKey, textLineType, args)
	args = args or {}
	local textLinePriorityType = args.TextLinePriorityType
	local voiceBankMappings = args.VoiceBankMappings or {}
	local cueMappings = args.CueMappings or {}
	local portraitMappings = args.PortraitMappings or {}
	local dummyCues = args.DummyCues
	local dummyVoiceBank = args.DummyVoiceBank
	local ignoreDuplicates = args.IgnoreDuplicates
	local stripProperties = args.StripProperties

	if narrativeDataKey == nil or textLineType == nil then
		mod.DebugPrint("A required parameter is missing!", 1)
		return
	end
	if dummyCues ~= nil and dummyVoiceBank == nil then
		mod.DebugPrint(
			"args.DummyCues is set but args.DummyVoiceBank is nil, both must be set to use a dummy cue! For " ..
			narrativeDataKey ", " .. textLineType, 1)
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

	local priorityTable = nil
	if textLinePriorityType ~= nil then
		priorityTable = narrativeData[textLinePriorityType]
		if priorityTable == nil then
			mod.DebugPrint("Priority table " .. textLinePriorityType .. " not found for " .. narrativeDataKey, 1)
			return
		end
	end

	local textLineSetsTable = textLineSetsOwner[textLineType]
	if textLineSetsTable == nil then
		mod.DebugPrint("Sets table " .. tostring(textLineType) .. " not found for " .. narrativeDataKey, 1)
		return
	end

	-- Update the vanilla dialogues to NOT play in modded runs, since these don't have priority tables
	local devotionTextLines = { "RejectionTextLines", "MakeUpTextLines" }
	if game.Contains(devotionTextLines, textLineType) then
		for _, textLineData in pairs(game.LootData[narrativeDataKey][textLineType]) do
			textLineData.GameStateRequirements = textLineData.GameStateRequirements or {}
			table.insert(textLineData.GameStateRequirements,
				{ PathFalse = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" } })
		end
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

	for index, data in ipairs(newTextLines) do
		local originalName = data.Name
		if originalName == nil then
			mod.DebugPrint("A text line set is missing the Name field! (At index " .. index .. ")", 1)
			return
		end

		-- Deduplicate names that exist in both games
		local key = mod.MapDuplicateTextLineName(originalName) or ""
		data.Name = key

		-- Safety net for duplicates that are not yet tracked in public.DuplicateTextLineSetNames
		if mod.HiddenConfig.DeveloperMode and not ignoreDuplicates and not public.DuplicateTextLineSetNames[originalName] and dialogueNameExistsInHadesTwo(originalName) then
			mod.DebugPrint(
				"Text line set '" ..
				originalName .. "' already exists in Hades II but is not in public.DuplicateTextLineSetNames.",
				1)
		end

		local metadata = data.ModsNikkelMHadesBiomes_TextLineMetadata or {}
		-- #region Required modifications to all text lines
		-- Mark as modded textline
		data.ModsNikkelMHadesBiomesIsModdedTextLine = true
		-- Don't play the Chaos effect on Chaos' own boons, Devotion MakeUp voicelines, and NPCs in the world (not by boon)
		if narrativeDataKey == "TrialUpgrade" or textLineType == "MakeUpTextLines" or narrativeDataKey:find("^NPC_") then
			-- This will prevent using the Chaos effects on boon pickup, which would double up
			data.ModsNikkelMHadesBiomesIsModdedTrialUpgradeTextLine = true
		end

		data.GameStateRequirements = data.GameStateRequirements or {}
		-- All modded text lines can only appear in modded runs, unless they are meant to play in the Crossroads after any kind of run
		if not args.SkipModdedRunRequirement then
			table.insert(data.GameStateRequirements, { PathTrue = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" } })
		end
		-- This requirement was missing in Hades' god boon pickup textlines
		-- NPCs must skip it, as RecordUse fires on interact before the just-in-time eligibility recheck, which would disqualify the line being played
		if not args.SkipUseRecordRequirement then
			table.insert(data.GameStateRequirements, { PathFalse = { "CurrentRun", "UseRecord", narrativeDataKey } })
		end

		-- Strip keys
		for _, stripProperty in ipairs(stripProperties or {}) do
			data[stripProperty] = nil
		end

		local insertedDummyCue = not dummyCues
		for _, line in ipairs(data) do
			if not insertedDummyCue and not line.UserPlayerSource then
				if line.PreLineThreadedFunctionName ~= nil then
					mod.DebugPrint("Text line " .. key .. " already has PreLineThreadedFunctionName set, skipping dummy Cue", 4)
				else
					-- Sound that is played after pickup for textlines without actual voiced dialogue
					line.PreLineThreadedFunctionName = _PLUGIN.guid .. "." .. "PlayDummyLootPickupCue"
					line.PreLineThreadedFunctionArgs = {
						DummyCues = dummyCues,
						DummyVoiceBank = dummyVoiceBank,
					}
				end
				insertedDummyCue = true
			end

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

			-- Fix Prev/PreviousFormat
			if line.Text then
				line.Text = string.gsub(line.Text, "{#PreviousFormat}", "{#Prev}")
			end

			-- Insert PresetEventArgs
			if textLineType == "RejectionTextLines" then
				line.PreLineFunctionArgs = game.PresetEventArgs.RejectionBoonInteract
			end
		end
		-- #endregion

		-- #region Insert into LootData/EnemyData & NarrativeData priority table
		data.ModsNikkelMHadesBiomes_TextLineMetadata = nil
		textLineSetsTable[key] = data

		if priorityTable ~= nil then
			-- Is this a new sub-table, or just the key itself
			local entry = metadata.CreateNewPriorityGroup and { key } or key
			if metadata.InsertAfterTextLineGroupContaining ~= nil then
				insertAfterGroup(priorityTable, mod.MapDuplicateTextLineName(metadata.InsertAfterTextLineGroupContaining), entry,
					key)
			elseif metadata.InsertAfterNarrativeTextLine ~= nil then
				insertAfterLine(priorityTable, mod.MapDuplicateTextLineName(metadata.InsertAfterNarrativeTextLine), entry, key,
					metadata.CreateNewPriorityGroup)
			elseif metadata.InsertAtFirstPriority ~= nil then
				-- Insert at the very top of the priorityTable
				table.insert(priorityTable, 1, entry)
			else
				mod.DebugPrint("No insertion target specified for " .. key .. " in " .. narrativeDataKey, 1)
				return
			end
		end
		-- #endregion
	end
end

function mod.PlayDummyLootPickupCue(source, args)
	if args == nil or args.DummyCues == nil then
		return
	end

	if args.DummyVoiceBank ~= nil then
		LoadVoiceBank({ Names = { args.DummyVoiceBank }, IgnoreAssert = true })
	end

	PlaySound({ Name = game.GetRandomValue(args.DummyCues), Id = source.ObjectId })
end

-- #region Hermes-delivered voicelines

---Adds Hermes-delivered dialogues to the vanilla HermesUpgrade textlines.
---Hermes speaks a random intro line, then starts the dialogue originally spoken by another character.
---Should be used for characters that can't appear in modded runs (e.g. Dionysus, Athena).
---@param deliveries table<integer, table> TextLineSets to add to Hermes' InteractTextLineSets
---@param voiceBankMappings table<string, table<string>> Voicebank mapping to load modded voicebanks with vanilla loads
---@param cueMappings table<string, string> Cue prefix mapping, applied to `/VO/<Find>` -> `/VO/<ReplaceWith>`
---@param portraitMappings table<string, string>  Mappings of Cue prefixes to Portrait names
---@param preDeliverySoundCue string|nil If set, this cue is played as the delivered character's portrait transitions in
---@param additionalSpeakerProperties table<string, table> Mappings of Cue prefixes (without the trailing _) to additional properties to set on the line
function mod.AddHermesDeliveredDialogues(deliveries, voiceBankMappings, cueMappings, portraitMappings,
																				 preDeliverySoundCue, additionalSpeakerProperties)
	local hermesDeliveryIntroLines = {
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90013",
			Text = "Message for you, Coz!",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90016",
			Text = "Special delivery and all that, boss!",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90073",
			Text = "Message from Olympus for you, boss!",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90074",
			Text = "Message for you, boss.",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90075",
			Text = "Got you a message, Coz.",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90101",
			Text = "Express-delivered message for you, Coz.",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90154",
			Text = "Message for you, boss.",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90155",
			Text = "Another message for you!",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90158",
			Text = "Another message here!",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90164",
			Text = "Another message from Olympus, boss.",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90176",
			Text = "Message for you, Coz.",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90177",
			Text = "Another message for you, Coz.",
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomeshermes_90183",
			Text = "Message for you, boss.",
		},
	}
	local hermesDeliveryIntroLinesRemoveFrom = game.DeepCopyTable(hermesDeliveryIntroLines)

	-- Append the Hermes intro line's own voicebank, cue and portrait mappings to those passed in
	voiceBankMappings.Hermes = voiceBankMappings.Hermes or {}
	table.insert(voiceBankMappings.Hermes, "Modsnikkelmhadesbiomeshermes")
	cueMappings.Hermes_ = "Modsnikkelmhadesbiomeshermes_"
	portraitMappings.Hermes_ = "ModsNikkelMHadesBiomes_Portrait_Hermes_Default_01"

	for _, delivery in ipairs(deliveries) do
		delivery.ModsNikkelMHadesBiomes_TextLineMetadata = delivery.ModsNikkelMHadesBiomes_TextLineMetadata or {}

		for _, deliveredLine in ipairs(delivery) do
			-- An explicit NarrativeContextArt in the additionalSpeakerProperties will take precedence over this, so we can always set it
			deliveredLine.UseRoomContextArt = true

			-- For some characters/speakers, we want to set additional properties on their lines
			-- character is the speaker name without the trailing underscore
			local character = string.match(deliveredLine.Cue, "^/VO/(%a+)_")
			if additionalSpeakerProperties[character] ~= nil then
				for key, value in pairs(additionalSpeakerProperties[character]) do
					deliveredLine[key] = value
				end
			end
		end

		if delivery.PreEventFunctionName == nil then
			delivery.PreEventFunctionName = "BoonInteractPresentation"
			delivery.PreEventFunctionArgs = { PickupWait = 1.0, }
		end

		if not delivery.ModsNikkelMHadesBiomes_TextLineMetadata.HermesDeliveredDialoguesSkipIntroLine then
			-- Transition from the Hermes intro to the delivered speaker, matching the duo-boon pickup effects
			local firstDeliveredLine = delivery[1]
			firstDeliveredLine.PreLineFunctionName = "BoonInteractPresentation"
			firstDeliveredLine.PreLineWait = 0.8

			-- Add a random intro line, we don't care about these changing per-dialogue between game restarts
			if #hermesDeliveryIntroLinesRemoveFrom <= 0 then
				hermesDeliveryIntroLinesRemoveFrom = game.DeepCopyTable(hermesDeliveryIntroLines)
			end
			local introLine = game.DeepCopyTable(game.RemoveRandomValue(hermesDeliveryIntroLinesRemoveFrom)) or {}

			introLine.Portrait = "ModsNikkelMHadesBiomes_Portrait_Hermes_Default_01"
			introLine.StartSound = "/Leftovers/World Sounds/MapZoomInShort"
			introLine.PostLineRemoveContextArt = true
			introLine.ExitPortraitImmediately = true

			if preDeliverySoundCue then
				introLine.PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "PlayDummyLootPickupCue"
				introLine.PostLineThreadedFunctionArgs = {
					DummyCues = { preDeliverySoundCue },
				}
			end

			table.insert(delivery, 1, introLine)
		end

		-- Suppresses Hermes' rushed dialogue cues when skipping the last dialogue (through a GameStateRequirement modification on his TextLineEndEvents)
		delivery.EndEvents = { { FunctionName = _PLUGIN.guid .. "." .. "SetHermesDeliveryArgs", }, }
	end

	mod.AddNarrativeDataEntries(deliveries, "HermesUpgrade", "InteractTextLineSets",
		{
			TextLinePriorityType = "InteractTextLinePriorities",
			VoiceBankMappings = voiceBankMappings,
			CueMappings = cueMappings,
			PortraitMappings = portraitMappings,
		})
end

function mod.SetHermesDeliveryArgs(source, eventArgs, args)
	args = args or {}
	args.ModsNikkelMHadesBiomesIsHermesDeliveredDialogue = true
end

-- #endregion

-- #endregion

-- #region Misc
-- Update the requirements for the Devotion reward to require a minimum biome depth of 3, as that's where Elites become eligible
local devotionOrRequirements = {
	-- Either we are not in a modded run, or we are in a modded run and at least at biome depth 3
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
