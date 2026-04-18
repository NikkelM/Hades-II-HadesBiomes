-- Copies a file from src to dest
local function copyFile(src, dest, skipCheck)
	skipCheck = skipCheck or false
	-- Check if the file already exists
	if not skipCheck then
		if rom.path.exists(dest) then
			mod.DebugPrint("File already exists and will not be overwritten: " .. dest, 2)
			return
		end
	end

	local inputFile = io.open(src, "rb")
	if not inputFile then
		mod.DebugPrint("Could not open source file: " .. src .. " - validate your Hades installation and try again.", 1)
		return
	end

	local outputFile = io.open(dest, "wb")
	if not outputFile then
		inputFile:close()
		mod.DebugPrint("Could not open destination file: " .. dest, 1)
		return
	end

	mod.DebugPrint("Copying file " .. src .. " to " .. dest, 4)
	-- Read in blocks to not run out of memory
	while true do
		local block = inputFile:read(1024)
		if not block then break end
		outputFile:write(block)
	end

	inputFile:close()
	outputFile:close()
end

local function copyFiles(fileMappings, srcBasePath, destBasePath, extension, nameHint, usePluginData, destUsePluginData)
	nameHint = nameHint or ""
	mod.DebugPrint("Copying " .. nameHint .. extension .. " files...", 3)
	for key, value in pairs(fileMappings) do
		local src, dest
		if type(key) == "number" then
			src = value
			dest = value
		else
			src = key
			dest = value
		end

		local srcPath, destPath
		if usePluginData then
			srcPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, srcBasePath .. src .. extension)
		else
			srcPath = rom.path.combine(mod.hadesGameFolder, srcBasePath .. src .. extension)
		end
		if destUsePluginData then
			destPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, destBasePath .. dest .. extension)
		else
			destPath = rom.path.combine(rom.paths.Content(), destBasePath .. dest .. extension)
		end
		copyFile(srcPath, destPath)
	end
end

local function removeDeprecatedAnimationProperties(animationsFile)
	for _, animation in ipairs(animationsFile.Animations) do
		animation.Type = nil
		animation.FrameDataFile = nil
		animation.SetOwnerEndAngle = nil
		animation.DangerDistance = nil
		animation.ActiveVisualFxCap = nil
		animation.CancelOverCap = nil
		animation.ShiftSpeedMin = nil
		animation.ShiftSpeedMax = nil
		animation.CancelAnimation = nil
		animation.UseFrameAngleFromOwner = nil
		animation.VisualFxUseAttachedMarkerLocation = nil
		animation.UseBoundsForSortArea = nil
		animation.UseAttachedFiredByMarkerLocation = nil
		animation.AngleNumOffset = nil
		animation.VisualFxRadialInterpolationLength = nil
		animation.UseOwnerAnimOffset = nil
		animation.IgnoreFrameCap = nil
		animation.EaeOut = nil -- Typo
	end
end

local function applyModificationsAndCopySjsonFiles(fileMappings, srcBasePath, modifications)
	mod.DebugPrint("Copying .sjson files...", 3)
	for key, value in pairs(fileMappings) do
		local src, dest
		if type(key) == "number" then
			src = value
			dest = value
		else
			src = key
			dest = value
		end

		local sjsonDataRelativePath = dest .. ".sjson"
		local srcPath = rom.path.combine(mod.hadesGameFolder, srcBasePath .. src .. ".sjson")

		if not rom.path.exists(rom.path.combine(mod.SjsonDataBasePath, sjsonDataRelativePath)) then
			local fileData = mod.DecodeSjsonFile(srcPath)
			mod.ApplyNestedSjsonModifications(fileData.Animations, modifications[src] or {})
			removeDeprecatedAnimationProperties(fileData)
			mod.DebugPrint("Copying file " .. srcPath .. " to " .. sjsonDataRelativePath, 4)
			mod.WriteSjsonData(sjsonDataRelativePath, fileData)
		else
			mod.DebugPrint("File already exists and will not be overwritten: " .. sjsonDataRelativePath, 2)
		end
	end
end

-- Subtitle CSV parsing utilities
local function trimString(inputString)
	return (inputString and inputString:match("^%s*(.-)%s*$")) or inputString
end

local function normalizeColumns(fields, expectedColumns)
	if expectedColumns then
		while #fields > expectedColumns and (fields[#fields] == "" or fields[#fields] == nil) do
			fields[#fields] = nil
		end
		if #fields > expectedColumns then
			fields[expectedColumns] = table.concat(fields, ",", expectedColumns)
			for i = #fields, expectedColumns + 1, -1 do
				fields[i] = nil
			end
		end
	end
	return fields
end

local function parseCsvLine(rawLine, expectedColumnCount)
	-- Fast path: no quotes present; simple comma splitting
	if not rawLine:find('"', 1, true) then
		-- Known column count: split first expectedColumnCount-1 by comma, remainder is last column
		if expectedColumnCount then
			local columns = {}
			local cursor = 1
			for columnIndex = 1, expectedColumnCount - 1 do
				local commaIndex = rawLine:find(",", cursor, true)
				if not commaIndex then
					columns[columnIndex] = trimString(rawLine:sub(cursor))
					return columns
				end
				columns[columnIndex] = trimString(rawLine:sub(cursor, commaIndex - 1))
				cursor = commaIndex + 1
			end
			local tail = rawLine:sub(cursor)
			-- Strip trailing empty columns (commas and optional whitespace)
			while tail:find(",%s*$") do
				local before = tail:match("^(.-),%s*$")
				if before then tail = before else break end
			end
			columns[expectedColumnCount] = tail
			return columns
		end

		-- Unknown column count: naive split
		local columns = {}
		for column in (rawLine .. ","):gmatch("([^,]*),") do
			table.insert(columns, trimString(column))
		end
		return columns
	end

	-- Fallback: quoted CSV parser (supports escaped quotes "" inside quoted fields)
	local columns = {}
	local current = ""
	local inQuotes = false
	local i = 1
	while i <= #rawLine do
		local ch = rawLine:sub(i, i)
		if ch == '"' then
			local nextCh = rawLine:sub(i + 1, i + 1)
			if inQuotes and nextCh == '"' then
				current = current .. '"'
				i = i + 1
			else
				inQuotes = not inQuotes
			end
		elseif ch == ',' and not inQuotes then
			table.insert(columns, trimString(current))
			current = ""
		else
			current = current .. ch
		end
		i = i + 1
	end
	table.insert(columns, trimString(current))
	return normalizeColumns(columns, expectedColumnCount)
end

local function parseSubtitleCsvFile(filePath, fileName, translatePrefix, whiteListedCueTable)
	local file = io.open(filePath, "r")
	if not file then
		mod.DebugPrint("Could not open subtitle CSV: " .. filePath, 1)
		return {}
	end

	local order = {
		"Id",
		"InheritFrom",
		"DisplayName",
	}
	local entries = {}
	local expectedColumns = 8

	-- Skip header row
	local header = file:read("*l")

	for rawLine in file:lines() do
		-- Normalize line endings and strip UTF-8 BOM if present
		local line = rawLine:gsub("\r$", ""):gsub("^\239\187\191", "")
		if line ~= "" then
			-- Columns: 1 = Status, 2 = BaseId, 3 = IdNum, 4 = Id, 8 = DisplayName
			local cols = parseCsvLine(line, expectedColumns)
			local status = trimString(cols[1]) or ""
			-- We only want to include substitles that are used in the game, which are marked by "Integrated" in the status column
			if status ~= "" and status:lower() == "integrated" then
				local baseId = trimString(cols[2]) or ""
				local idNum = tonumber(cols[3] or "")
				local id = trimString(cols[4]) or ""
				local displayName = trimString(cols[8]) or ""

				if baseId == "" or id == "" or displayName == "" then
					-- mod.DebugPrint(
					-- 	"Subtitle CSV missing baseId, id or displayName for integrated row in " ..
					-- 	tostring(fileName) .. ": " .. tostring(line), 4)
				else
					-- Translate prefix: replace baseId or filename prefix with translatePrefix if requested
					if translatePrefix and id ~= "" then
						local pattern = "^" .. (baseId:gsub("(%W)", "%%%1"))
						local newId, count = id:gsub(pattern, translatePrefix)
						if count > 0 then
							id = newId
						end
					end

					-- If a cue filter is provided, only include entries whose renamed ID is in the filter
					if not whiteListedCueTable or whiteListedCueTable[id] then
						table.insert(entries,
							sjson.to_object({ Id = id, InheritFrom = "BaseSubtitle", DisplayName = displayName }, order))
					end
				end
			end
		end
	end

	file:close()
	return entries
end

local function loadSubtitleCsvFilesAndWriteToSjson()
	local hadesSubtitleData = {}
	-- SourceFolderName is a subtitle folder in H1
	-- TargetFolderNames is a list of languages that the source subtitles should be used for in H2
	-- As not all H2 languages have a localization in H1, these will use the english subtitles instead
	for sourceFolderName, targetFolderNames in pairs(mod.SubtitleCsvFolderNames or {}) do
		for _, targetFolderName in ipairs(targetFolderNames) do
			hadesSubtitleData[targetFolderName] = hadesSubtitleData[targetFolderName] or {}
		end
		for fileName, translatePrefix in pairs(mod.SubtitleCsvFileNameMappings or {}) do
			local filePath = rom.path.combine(mod.hadesGameFolder,
				"Content\\Subtitles\\" .. sourceFolderName .. "\\" .. fileName .. ".csv")

			-- Filter ZagreusField and ZagreusHome subtitles to only non-dialogue cues to reduce file size and prevent the game crashing when launching vanilla
			local whiteListedCueTable = nil
			if fileName == "ZagreusField" or fileName == "ZagreusHome" then
				whiteListedCueTable = mod.ZagreusSubtitleCues
			end

			local parsedSubtitles = parseSubtitleCsvFile(filePath, fileName, translatePrefix, whiteListedCueTable)
			mod.DebugPrint("Parsed " .. tostring(#parsedSubtitles) .. " subtitle rows from " .. fileName, 4)

			for _, targetFolderName in ipairs(targetFolderNames) do
				hadesSubtitleData[targetFolderName][fileName] = parsedSubtitles
			end
		end
	end

	local order = {
		"lang",
		"Texts",
	}
	-- Afterwards, write the subtitle sjson files into the SJSON data directory
	for language, subtitleFiles in pairs(hadesSubtitleData) do
		for speakerName, entries in pairs(subtitleFiles) do
			local destPath = mod.GetSubtitleSjsonPath(language, speakerName)
			local subtitleData = sjson.to_object({ lang = language, Texts = entries }, order)
			mod.DebugPrint("Writing subtitle sjson file: " .. destPath .. " with " .. tostring(#entries) .. " entries", 4)
			sjson.encode_file(destPath, subtitleData)

			-- Register with H2M
			rom.data.register_sjson_file(destPath)
		end
	end
end

-- Creates a new helpTextFile for all given languages with any IDs that do not exist in the Hades II help text files
local function copyHadesHelpTexts()
	for _, fileName in ipairs(mod.HadesHelpTextFileNames) do
		-- A HelpText language/file is any of the copied files, not just HelpText.xx.sjson
		for _, language in ipairs(mod.HelpTextLanguages) do
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				mod.DebugPrint("Copying " .. fileName .. " files for language: " .. language, 4)

				local sjsonDataRelativePath = "Text\\" ..
						language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson"

				if rom.path.exists(rom.path.combine(mod.SjsonDataBasePath, sjsonDataRelativePath)) then
					mod.DebugPrint("File already exists and will not be overwritten: " .. sjsonDataRelativePath, 2)
				else
					local helpTextFile = rom.path.combine(rom.paths.Content(),
						"Game\\Text\\" .. language .. "\\" .. fileName .. "." .. language .. ".sjson")
					-- Check if this file exists first
					local helpTextData = {}
					if rom.path.exists(helpTextFile) then
						helpTextData = mod.DecodeSjsonFile(helpTextFile)
					else
						helpTextData.Texts = {}
					end

					local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder,
						"Content\\Game\\Text\\" .. language .. "\\" .. fileName .. "." .. language .. ".sjson")
					local hadesHelpTextData = mod.DecodeSjsonFile(hadesHelpTextFile)

					local existingIds = {}
					for _, entry in ipairs(helpTextData.Texts) do
						existingIds[entry.Id] = true
					end

					-- Remove all existingIds from hadesHelpTextData - we don't want to overwrite something that already exists in Hades II
					for i = #hadesHelpTextData.Texts, 1, -1 do
						local entry = hadesHelpTextData.Texts[i]
						-- Some entry IDs need to be changed, such as for duplicate enemy names
						-- Merge these tables if there are multiple types of replacements
						if mod.EnemyNameMappings[entry.Id] then
							entry.Id = mod.EnemyNameMappings[entry.Id]
						end
						if existingIds[entry.Id] then
							table.remove(hadesHelpTextData.Texts, i)
						end
						if entry.Id then
							entry.Id = entry.Id:gsub("Storyteller_", "Megaera_0")
							entry.Id = entry.Id:gsub("Charon_", "Megaera_1")
							entry.Id = entry.Id:gsub("Persephone_", "Megaera_2")
							entry.Id = entry.Id:gsub("ZagreusHome_", "ZagreusField_0")
							-- LootData
							entry.Id = entry.Id:gsub("Hermes_", "Dusa_0")
							entry.Id = entry.Id:gsub("Chaos_", "Dusa_1")
						end
						if entry.DisplayName then
							entry.DisplayName = string.gsub(entry.DisplayName, "{#PreviousFormat}", "{#Prev}")
						end
						if entry.Description then
							entry.Description = string.gsub(entry.Description, "{#PreviousFormat}", "{#Prev}")
							entry.Description = string.gsub(entry.Description, " \\Column 380", "")
							entry.Description = string.gsub(entry.Description, "{!Icons.Currency_Small}", "{!Icons.Currency}")
						end
					end

					mod.WriteSjsonData(sjsonDataRelativePath, hadesHelpTextData)
				end
			end
		end
	end
end

local function copyHadesNPCTexts()
	for _, language in ipairs(mod.HelpTextLanguages) do
		for fileName, allowedSpeakers in pairs(mod.NPCTextFileNames) do
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				mod.DebugPrint("Copying " .. fileName .. " files for language: " .. language, 4)

				local sjsonDataRelativePath = "Text\\" ..
						language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson"

				if rom.path.exists(rom.path.combine(mod.SjsonDataBasePath, sjsonDataRelativePath)) then
					mod.DebugPrint("File already exists and will not be overwritten: " .. sjsonDataRelativePath, 2)
				else
					local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder,
						"Content\\Game\\Text\\" .. language .. "\\" .. fileName .. "." .. language .. ".sjson")
					local hadesHelpTextDataRaw = mod.DecodeSjsonFile(hadesHelpTextFile)

					-- Need to do in-place to ensure the lang key is before the Texts key, otherwise the file is not loaded correctly by the game
					local filteredTexts = {}
					for _, entry in ipairs(hadesHelpTextDataRaw.Texts) do
						if entry.Id and entry.Speaker and allowedSpeakers[entry.Speaker] then
							entry.Id = entry.Id:gsub("Storyteller_", "Megaera_0")
							entry.Id = entry.Id:gsub("Charon_", "Megaera_1")
							entry.Id = entry.Id:gsub("Persephone_", "Megaera_2")
							entry.Id = entry.Id:gsub("MegaeraHome_", "Megaera_3")
							entry.Id = entry.Id:gsub("MegaeraExtra_", "Megaera_5")
							-- entry.Id = entry.Id:gsub("Nyx_", "Megaera_4")
							entry.Id = entry.Id:gsub("Hades_", "HadesField_0")
							entry.Id = entry.Id:gsub("Skelly_", "Sisyphus_0")
							-- entry.Id = entry.Id:gsub("Hypnos_", "Sisyphus_1")
							entry.Id = entry.Id:gsub("ZagreusHome_", "ZagreusField_0")
							table.insert(filteredTexts, entry)
						end
					end

					-- Replace the Texts array with the filtered version
					hadesHelpTextDataRaw.Texts = filteredTexts

					mod.WriteSjsonData(sjsonDataRelativePath, hadesHelpTextDataRaw)
				end
			end
		end
	end
end

-- Common function to copy and filter animations
local function copyAndFilterAnimations(srcPath, sjsonDataRelativePath, mappings, duplicates, modifications,
																			 parentAdditions, additions,
																			 animationType)
	local animationsTable = mod.DecodeSjsonFile(srcPath)

	if rom.path.exists(rom.path.combine(mod.SjsonDataBasePath, sjsonDataRelativePath)) then
		mod.DebugPrint("File already exists and will not be overwritten: " .. sjsonDataRelativePath, 2)
		-- Still marking as successful to not throw the bad edits error
		return true
	end

	-- Before removing duplicates, rename animations for which we need the old version
	mod.RenameSjsonEntries(animationsTable.Animations, mappings, "Name", animationType)
	for oldName, newName in pairs(mappings) do
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "InheritFrom" }, animationType)
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "ChainTo" }, animationType)
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "ChildAnimation" }, animationType)
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "CreateAnimation" }, animationType)
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "CreateAnimations" }, animationType)
	end

	local filteredAnimations = {}
	removeDeprecatedAnimationProperties(animationsTable)
	for _, animation in ipairs(animationsTable.Animations) do
		-- Check for an Olympus Extra installation
		if animation.Name == "TheseusSpearSwipeApollo" then
			return false
		end

		if not duplicates[animation.Name] then
			if modifications[animation.Name] then
				for key, value in pairs(modifications[animation.Name]) do
					animation[key] = value
				end
			end
			table.insert(filteredAnimations, animation)
		end
	end

	for _, addition in ipairs(additions) do
		if addition.InheritFrom then
			-- Add it at the end, as it needs to inherit from something else
			table.insert(filteredAnimations, addition)
		else
			-- At to the beginning of the list in case we need to inherit from the addition
			table.insert(filteredAnimations, 1, addition)
		end
	end

	-- Parents always need to be added at the start, some other Hades animations might inherit from this new one (through modifications)
	for _, addition in ipairs(parentAdditions) do
		table.insert(filteredAnimations, 1, addition)
	end

	animationsTable.Animations = filteredAnimations

	mod.WriteSjsonData(sjsonDataRelativePath, animationsTable)

	return true
end

local function copyHadesFxAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\Fx.sjson")
	local modifications = mod.HadesFxAnimationModifications or {}
	local parentAdditions = mod.HadesFxAnimationParentAdditions or {}
	local additions = mod.HadesFxAnimationAdditions or {}

	-- Will return false if an Olympus Extra animation is detected
	if not copyAndFilterAnimations(sourceFilePath, mod.HadesFxSjsonDataPath, mod.FxAnimationMappings, mod.HadesFxAnimationDuplicates, modifications, parentAdditions, additions, "Fx.sjson") then
		return false
	end

	return true
end

local function copyHadesGUIAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\GUIAnimations.sjson")
	local modifications = mod.HadesGUIAnimationModifications or {}
	local parentAdditions = mod.HadesGUIAnimationParentAdditions or {}
	local additions = mod.HadesGUIAnimationAdditions or {}
	copyAndFilterAnimations(sourceFilePath, mod.HadesGUIAnimationsSjsonDataPath, mod.GUIAnimationMappings,
		mod.HadesGUIAnimationDuplicates,
		modifications, parentAdditions, additions, "GUIAnimations.sjson")
end

local function copyHadesPortraitAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\PortraitAnimations.sjson")
	local modifications = mod.HadesPortraitAnimationModifications or {}
	local parentAdditions = mod.HadesPortraitAnimationAdditionsParents or {}
	local additions = mod.HadesPortraitAnimationAdditions or {}
	copyAndFilterAnimations(sourceFilePath, mod.HadesPortraitAnimationsSjsonDataPath, mod.PortraitAnimationMappings,
		mod.HadesPortraitAnimationDuplicates, modifications, parentAdditions, additions, "PortraitAnimations.sjson")
end

local function copyHadesCharacterAnimationsNPCs()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\CharacterAnimationsNPCs.sjson")
	local modifications = mod.HadesCharacterAnimationsNPCsModifications or {}
	local parentAdditions = mod.HadesCharacterAnimationsNPCsParentAdditions or {}
	local additions = mod.HadesCharacterAnimationsNPCsAdditions or {}
	copyAndFilterAnimations(sourceFilePath, mod.HadesCharacterAnimationsNPCsSjsonDataPath,
		mod.CharacterAnimationsNPCsMappings,
		mod.HadesCharacterAnimationsNPCsDuplicates, modifications, parentAdditions, additions,
		"CharacterAnimationsNPCs.sjson")
end

---Creates/Copies files that are needed before the loading bar.
---Includes mod hook targets and files loaded by the game (e.g. .bik_atlas).
---Also serves as the Olympus Extra detection check.
---@return boolean success Whether the files were created/copied successfully.
function mod.CreateRequiredHookTargetFiles()
	mod.DebugPrint("[Pre-install] Copying files required for mod installation...", 3)

	mod.DebugPrint("[Pre-install] Ensuring no Hades mods are installed...", 3)
	if mod.AreHadesModsInstalled() then
		return false
	end

	-- Migration: remove any legacy SJSON files from the game installation directory left by older mod versions before 1.0.0
	-- This must happen before the install to avoid the engine loading both the old and new files simultaneously
	if not mod.HiddenConfig.HasCompletedLegacyInstallationCleanup then
		mod.DebugPrint("[Pre-install] Removing legacy SJSON files from game installation directory (if any exist)...", 3)
		mod.RemoveLegacySjsonFilesFromContent()
		mod.HiddenConfig.HasCompletedLegacyInstallationCleanup = true
		mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
	end

	mod.DebugPrint("[Pre-install] Caching the games' \"checksums.txt\" to be notified after a game update...", 3)
	local checksumsSrc = rom.path.combine(rom.paths.Content(), "Scripts\\checksums.txt")
	local checksumsDest = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid .. "\\checksums.txt")
	copyFile(checksumsSrc, checksumsDest, true)

	mod.DebugPrint("[Pre-install] Copying Fx animations...", 3)
	if not copyHadesFxAnimations() then
		mod.DebugPrint(
			"Bad Hades Sjson edits detected! It is very likely you have Olympus Extra or another mod for Hades installed. You must uninstall all mods for Hades before installing Zagreus' Journey. Aborting mod installation to prevent conflicts.",
			1)

		mod.HiddenConfig.IsValidInstallation = false
		mod.HiddenConfig.InstallationFailReason = "HadesModsInstalled"
		mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
		---@diagnostic disable-next-line: undefined-global
		public.IsValidInstallation = false

		-- Ensure we get a new clean install next time
		config.uninstall = true
		config.firstTimeSetup = true
		mod.InstallationPending = false
		return false
	end

	-- Copy .bik_atlas files from Hades 1 to plugins_data before the loading bar, as the engine resolves .bik_atlas manifests before the hook callbacks fire
	mod.DebugPrint("[Pre-install] Copying .bik_atlas files...", 3)
	copyFiles(mod.BikFileNames, "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik_atlas", "1080p Hades Animation ",
		false, true)
	copyFiles(mod.BikFileNames, "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", ".bik_atlas", "720p Hades Animation ",
		false, true)

	-- Register the copied .bik_atlas files with H2M so they're injected into engine enumeration
	local pluginsDataBase = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid)
	for _, name in pairs(mod.BikFileNames) do
		local atlas1080 = rom.path.combine(pluginsDataBase, "Content\\Movies\\1080p\\" .. name .. ".bik_atlas")
		local atlas720 = rom.path.combine(pluginsDataBase, "Content\\Movies\\720p\\" .. name .. ".bik_atlas")
		if rom.path.exists(atlas1080) then
			rom.data.register_plugin_file(name .. ".bik_atlas", atlas1080)
		end
		if rom.path.exists(atlas720) then
			rom.data.register_plugin_file(name .. ".bik_atlas", atlas720)
		end
	end

	mod.DebugPrint("[Pre-install] Pre-install complete. Remaining installation will run during the loading bar.", 3)
	return true
end

-- #region Install steps
---Splits an array into `numSlices` roughly equal-sized sub-arrays.
local function splitIntoSlices(array, numSlices)
	local total = #array
	local baseSize = math.floor(total / numSlices)
	-- Remainder gets added to slices one at a time until used up
	local remainder = total % numSlices
	local slices = {}
	local index = 1
	for sliceNum = 1, numSlices do
		local sliceSize = baseSize + (sliceNum <= remainder and 1 or 0)
		local slice = {}
		for i = index, index + sliceSize - 1 do
			table.insert(slice, array[i])
		end
		slices[sliceNum] = slice
		index = index + sliceSize
	end
	return slices
end

-- Split BikFileNames into batches for distribution across hooks.
local bikBatches1080p = splitIntoSlices(mod.BikFileNames, 8)
local bikBatches720p = splitIntoSlices(mod.BikFileNames, 5)

---Helper to copy .map_text files from Hades to plugins_data, skipping those with custom modifications
local function copyMapTextFiles()
	mod.DebugPrint("[Install] Copying .map_text files...", 3)
	for src, dest in pairs(mod.MapFileMappings) do
		-- Some .map_text files have custom changes and are shipped with the mod
		if not mod.MapTextFileNames[src] then
			local srcPath = rom.path.combine(mod.hadesGameFolder, "Content\\Maps\\" .. src .. ".map_text")
			local destPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "Content\\Maps\\" .. dest .. ".map_text")
			copyFile(srcPath, destPath)
			rom.data.register_plugin_file(dest .. ".map_text", destPath)
		end
	end
end

---Copies .bik files from Hades 1 to plugins_data and registers them with H2M
local function copyBikFiles(fileMappings, srcBasePath, destBasePath, nameHint)
	copyFiles(fileMappings, srcBasePath, destBasePath, ".bik", nameHint, false, true)
	local pluginsDataBase = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid)
	for _, dest in pairs(fileMappings) do
		local destPath = rom.path.combine(pluginsDataBase, destBasePath .. dest .. ".bik")
		rom.data.register_plugin_file(dest .. ".bik", destPath)
	end
end

local installSteps = {
	Enemies = { "Audio .bank files", function()
		copyFiles(mod.AudioFileMappings, "Content\\Audio\\FMOD\\Build\\Desktop\\", "Audio\\Desktop\\", ".bank", "Audio ")
	end },

	Enemy_BiomeN_Projectiles = { ".map_text files", function()
		copyMapTextFiles()
	end },

	Enemy_Traps_Projectiles = { "Game data .sjson files", function()
		applyModificationsAndCopySjsonFiles(mod.SjsonFileMappings, "Content\\Game\\", mod.SjsonFileModifications)
	end },

	Projectiles = { "1080p .bik batch 1", function()
		copyBikFiles(bikBatches1080p[1], "Content\\Movies\\", "Content\\Movies\\1080p\\", "1080p Hades Animation ")
	end },

	Asphodel = { "1080p .bik batch 2", function()
		copyBikFiles(bikBatches1080p[2], "Content\\Movies\\", "Content\\Movies\\1080p\\", "1080p Hades Animation ")
	end },

	Chaos = { "1080p .bik batch 3", function()
		copyBikFiles(bikBatches1080p[3], "Content\\Movies\\", "Content\\Movies\\1080p\\", "1080p Hades Animation ")
	end },

	Elysium = { "1080p .bik batch 4", function()
		copyBikFiles(bikBatches1080p[4], "Content\\Movies\\", "Content\\Movies\\1080p\\", "1080p Hades Animation ")
	end },

	Graybox = { "1080p .bik batch 5", function()
		copyBikFiles(bikBatches1080p[5], "Content\\Movies\\", "Content\\Movies\\1080p\\", "1080p Hades Animation ")
	end },

	Styx = { "1080p .bik batch 6", function()
		copyBikFiles(bikBatches1080p[6], "Content\\Movies\\", "Content\\Movies\\1080p\\", "1080p Hades Animation ")
	end },

	Surface = { "1080p .bik batch 7", function()
		copyBikFiles(bikBatches1080p[7], "Content\\Movies\\", "Content\\Movies\\1080p\\", "1080p Hades Animation ")
	end },

	Tartarus = { "1080p .bik batch 8", function()
		copyBikFiles(bikBatches1080p[8], "Content\\Movies\\", "Content\\Movies\\1080p\\", "1080p Hades Animation ")
	end },

	Temple = { "Helptext .sjson files", function()
		mod.DebugPrint("[Install] Copying help text files...", 3)
		copyHadesHelpTexts()
	end },

	Travel = { "NPC helptext, GUI + Portrait animation .sjson files", function()
		mod.DebugPrint("[Install] Copying NPC text files...", 3)
		copyHadesNPCTexts()
		mod.DebugPrint("[Install] Copying GUI animations...", 3)
		copyHadesGUIAnimations()
		mod.DebugPrint("[Install] Copying Portrait animations...", 3)
		copyHadesPortraitAnimations()
	end },

	MapGroups = { "Character animation .sjson files", function()
		mod.DebugPrint("[Install] Copying Character animations...", 3)
		copyHadesCharacterAnimationsNPCs()
	end },

	Hero_Melinoe_Animation_Personality = { "Parse subtitle CSV files", function()
		mod.DebugPrint("[Install] Parsing subtitle CSV files...", 3)
		loadSubtitleCsvFilesAndWriteToSjson()
	end },

	GUI_HUD_VFX = { "720p .bik batch 1", function()
		copyBikFiles(bikBatches720p[1], "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", "720p Hades Animation ")
	end },

	GUI_Portraits_VFX = { "720p .bik batch 2", function()
		copyBikFiles(bikBatches720p[2], "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", "720p Hades Animation ")
	end },

	Items_General_VFX = { "720p .bik batch 3", function()
		copyBikFiles(bikBatches720p[3], "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", "720p Hades Animation ")
	end },

	Items_Harvest_VFX = { "720p .bik batch 4", function()
		copyBikFiles(bikBatches720p[4], "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", "720p Hades Animation ")
	end },

	Melinoe_Zeus_VFX = { "720p .bik batch 5", function()
		copyBikFiles(bikBatches720p[5], "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", "720p Hades Animation ")
	end },
}

---Runs the install step assigned to the given hookId.
---Called at the top of each sjson.hook callback. No-op if not installing.
---@param hookId string The identifier matching an entry in the installSteps table
function mod.RunInstallStep(hookId)
	if not mod.InstallationPending then return end
	if not installSteps[hookId] then
		mod.DebugPrint("[Install] No install step found for hookId: " .. hookId, 1)
		return
	end

	mod.DebugPrint("[Install] Running hookId \"" .. hookId .. "\" install step: " .. installSteps[hookId][1], 3)
	installSteps[hookId][2]()
end

-- #endregion Install steps

function mod.FinalizeInstallation()
	if not mod.InstallationPending then return end
	mod.DebugPrint("[Install] Finalizing installation...", 3)

	mod.DebugPrint("[Install] Ensuring all required files exist...", 3)
	local numMissingFiles = mod.CheckRequiredFiles(false)
	if numMissingFiles > 0 then
		mod.DebugPrint(
			numMissingFiles ..
			" required files are missing after installation. Do you have Hades installed in the correct folder? Check the \"hadesGameFolder\" setting in your config file.",
			1)

		mod.HiddenConfig.IsValidInstallation = false
		mod.HiddenConfig.InstallationFailReason = "MissingFiles"
		mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
		---@diagnostic disable-next-line: undefined-global
		public.IsValidInstallation = false

		-- Ensure we get a new clean install next time
		config.uninstall = true
		config.firstTimeSetup = true
		mod.InstallationPending = false
		return
	end

	mod.HiddenConfig.IsValidInstallation = true
	-- If this is a reinstall, to show the successful install screen again
	mod.HiddenConfig.HasShownSuccessfulInstallScreen = false
	mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
	---@diagnostic disable-next-line: undefined-global
	public.IsValidInstallation = true

	config.firstTimeSetup = false
	mod.InstallationPending = false
	mod.DebugPrint("Finished mod installation and first time setup.", 3)
end
