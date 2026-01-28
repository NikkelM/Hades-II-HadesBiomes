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

local function copyFiles(fileMappings, srcBasePath, destBasePath, extension, nameHint, usePluginData)
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
		destPath = rom.path.combine(rom.paths.Content(), destBasePath .. dest .. extension)
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

local function applyModificationsAndCopySjsonFiles(fileMappings, srcBasePath, destBasePath, modifications)
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

		local srcPath = rom.path.combine(mod.hadesGameFolder, srcBasePath .. src .. ".sjson")
		local destPath = rom.path.combine(rom.paths.Content(), destBasePath .. dest .. ".sjson")

		if not rom.path.exists(destPath) then
			local fileData = mod.DecodeSjsonFile(srcPath)
			mod.ApplyNestedSjsonModifications(fileData.Animations, modifications[src] or {})
			removeDeprecatedAnimationProperties(fileData)
			mod.DebugPrint("Copying file " .. srcPath .. " to " .. destPath, 4)
			sjson.encode_file(destPath, fileData)
		else
			mod.DebugPrint("File already exists and will not be overwritten: " .. destPath, 2)
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

local function parseSubtitleCsvFile(filePath, fileName, translatePrefix)
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
					mod.DebugPrint(
						"Subtitle CSV missing baseId, id or displayName for integrated row in " ..
						tostring(fileName) .. ": " .. tostring(line), 4)
				else
					-- Translate prefix: replace baseId or filename prefix with translatePrefix if requested
					if translatePrefix and id ~= "" then
						local pattern = "^" .. (baseId:gsub("(%W)", "%%%1"))
						local newId, count = id:gsub(pattern, translatePrefix)
						if count > 0 then
							id = newId
						end
					end

					table.insert(entries,
						sjson.to_object({ Id = id, InheritFrom = "BaseSubtitle", DisplayName = displayName }, order))
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

			local parsedSubtitles = parseSubtitleCsvFile(filePath, fileName, translatePrefix)
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
	-- Afterwards, write the subtitle sjson files for each language into the Hades II Content folder
	for language, subtitleFiles in pairs(hadesSubtitleData) do
		for speakerName, entries in pairs(subtitleFiles) do
			local destPath = mod.GetSubtitleSjsonPath(language, speakerName)
			local subtitleData = sjson.to_object({ lang = language, Texts = entries }, order)
			mod.DebugPrint("Writing subtitle sjson file: " .. destPath .. " with " .. tostring(#entries) .. " entries", 4)
			sjson.encode_file(destPath, subtitleData)
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

				local hadesTwoHelpTextFilePath = rom.path.combine(rom.paths.Content(),
					"Game\\Text\\" .. language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson")

				if rom.path.exists(hadesTwoHelpTextFilePath) then
					mod.DebugPrint("File already exists and will not be overwritten: " .. hadesTwoHelpTextFilePath, 2)
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

					-- Encode the hadesHelpTextFile to a new file in the Hades II folder
					sjson.encode_file(hadesTwoHelpTextFilePath, hadesHelpTextData)
				end
			end
		end
	end
end

-- Similar to copyHadesHelpTexts, but only copies entries for specific NPCs and voicelines
local function copyHadesNPCTexts()
	local fileName = "_NPCData"
	for _, language in ipairs(mod.HelpTextLanguages) do
		if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
			mod.DebugPrint("Copying " .. fileName .. " files for language: " .. language, 4)
			local hadesTwoHelpTextFilePath = rom.path.combine(rom.paths.Content(),
				"Game\\Text\\" .. language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson")

			if rom.path.exists(hadesTwoHelpTextFilePath) then
				mod.DebugPrint("File already exists and will not be overwritten: " .. hadesTwoHelpTextFilePath, 2)
			else
				local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder,
					"Content\\Game\\Text\\" .. language .. "\\" .. fileName .. "." .. language .. ".sjson")
				local hadesHelpTextDataRaw = mod.DecodeSjsonFile(hadesHelpTextFile)

				-- Filter the Texts array in place, keeping only entries we care about
				-- Need to do in-place to ensure the lang key is before the Texts key, otherwise the file is not loaded correctly by the game
				local filteredTexts = {}
				for _, entry in ipairs(hadesHelpTextDataRaw.Texts) do
					if (entry.Speaker and mod.HadesNPCTextSpeakers[entry.Speaker]) or
							(entry.Id and (mod.StorytellerVoicelines[entry.Id] or mod.ZagreusFieldVoicelines[entry.Id])) then
						if entry.Id then
							entry.Id = entry.Id:gsub("Storyteller_", "Megaera_0")
							entry.Id = entry.Id:gsub("Charon_", "Megaera_1")
							entry.Id = entry.Id:gsub("Persephone_", "Megaera_2")
						end
						table.insert(filteredTexts, entry)
					end
				end

				-- Replace the Texts array with the filtered version
				hadesHelpTextDataRaw.Texts = filteredTexts

				sjson.encode_file(hadesTwoHelpTextFilePath, hadesHelpTextDataRaw)
			end
		end
	end
end

-- Common function to copy and filter animations
local function copyAndFilterAnimations(srcPath, destPath, mappings, duplicates, modifications, parentAdditions, additions,
																			 animationType)
	local animationsTable = mod.DecodeSjsonFile(srcPath)

	if rom.path.exists(destPath) then
		mod.DebugPrint("File already exists and will not be overwritten: " .. destPath, 2)
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

	sjson.encode_file(destPath, animationsTable)

	return true
end

local function copyHadesFxAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\Fx.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesFxDestinationFilename)
	local modifications = mod.HadesFxAnimationModifications or {}
	local parentAdditions = mod.HadesFxAnimationParentAdditions or {}
	local additions = mod.HadesFxAnimationAdditions or {}

	-- Will return false if an Olympus Extra animation is detected
	if not copyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.FxAnimationMappings, mod.HadesFxAnimationDuplicates, modifications, parentAdditions, additions, "Fx.sjson") then
		return false
	end

	return true
end

local function copyHadesGUIAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\GUIAnimations.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesGUIAnimationsDestinationFilename)
	local modifications = mod.HadesGUIAnimationModifications or {}
	local parentAdditions = mod.HadesGUIAnimationParentAdditions or {}
	local additions = mod.HadesGUIAnimationAdditions or {}
	copyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.GUIAnimationMappings, mod.HadesGUIAnimationDuplicates,
		modifications, parentAdditions, additions, "GUIAnimations.sjson")
end

local function copyHadesPortraitAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\PortraitAnimations.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesPortraitAnimationsDestinationFilename)
	local modifications = mod.HadesPortraitAnimationModifications or {}
	local parentAdditions = mod.HadesPortraitAnimationAdditionsParents or {}
	local additions = mod.HadesPortraitAnimationAdditions or {}
	copyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.PortraitAnimationMappings,
		mod.HadesPortraitAnimationDuplicates, modifications, parentAdditions, additions, "PortraitAnimations.sjson")
end

local function copyHadesCharacterAnimationsNPCs()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\CharacterAnimationsNPCs.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesCharacterAnimationsNPCsDestinationFilename)
	local modifications = mod.HadesCharacterAnimationsNPCsModifications or {}
	local parentAdditions = mod.HadesCharacterAnimationsNPCsParentAdditions or {}
	local additions = mod.HadesCharacterAnimationsNPCsAdditions or {}
	copyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.CharacterAnimationsNPCsMappings,
		mod.HadesCharacterAnimationsNPCsDuplicates, modifications, parentAdditions, additions,
		"CharacterAnimationsNPCs.sjson")
end

function mod.FirstTimeSetup()
	mod.DebugPrint("Installing the mod...", 3)

	mod.DebugPrint("Ensuring no Hades mods are installed...", 3)
	if mod.AreHadesModsInstalled() then
		return false
	end

	mod.DebugPrint("Caching the games' \"checksums.txt\" to be notified after a game update...", 3)
	local checksumsSrc = rom.path.combine(rom.paths.Content(), "Scripts\\checksums.txt")
	local checksumsDest = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid .. "\\checksums.txt")
	copyFile(checksumsSrc, checksumsDest, true)

	-- Doing an extra check to make sure Olympus Extra is not installed
	mod.DebugPrint("Copying Fx animations...", 3)
	if not copyHadesFxAnimations() then
		mod.DebugPrint(
			"Bad Hades Sjson edits detected! It is very likely you have Olympus Extra or another mod for Hades installed. You must uninstall all mods for Hades before installing Zagreus' Journey. Aborting mod installation to prevent conflicts.",
			1)

		mod.HiddenConfig.IsValidInstallation = false
		mod.HiddenConfig.InstallationFailReason = "HadesModsInstalled"
		mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

		-- Ensure we get a new clean install next time
		config.uninstall = true
		config.firstTimeSetup = true
		return false
	end

	copyFiles(mod.AudioFileMappings, "Content\\Audio\\FMOD\\Build\\Desktop\\", "Audio\\Desktop\\", ".bank", "Audio ")

	copyFiles(mod.BikFileNames, "Content\\Movies\\", "Movies\\1080p\\", ".bik", "1080p Hades Animation ")
	copyFiles(mod.BikFileNames, "Content\\Movies\\", "Movies\\1080p\\", ".bik_atlas", "1080p Hades Animation ")
	copyFiles(mod.BikFileNames, "Content\\Movies\\720p\\", "Movies\\720p\\", ".bik", "720p Hades Animation ")
	copyFiles(mod.BikFileNames, "Content\\Movies\\720p\\", "Movies\\720p\\", ".bik_atlas", "720p Hades Animation ")

	copyFiles(mod.CustomBikFileNames, "Content\\Movies\\1080p\\", "Movies\\1080p\\", ".bik", "1080p custom Animation ",
		true)
	copyFiles(mod.CustomBikFileNames, "Content\\Movies\\1080p\\", "Movies\\1080p\\", ".bik_atlas",
		"1080p custom Animation ", true)

	copyFiles(mod.CustomBikFileNames, "Content\\Movies\\720p\\", "Movies\\720p\\", ".bik", "720p custom Animation ", true)
	copyFiles(mod.CustomBikFileNames, "Content\\Movies\\720p\\", "Movies\\720p\\", ".bik_atlas", "720p custom Animation ",
		true)

	-- Special treatment, as some are copied from the plugins_data, and some from the Hades installation
	mod.DebugPrint("Copying .map_text files...", 3)
	for src, dest in pairs(mod.MapFileMappings) do
		local srcPath, destPath
		if mod.MapTextFileNames[src] then
			srcPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "Content\\Maps\\" .. src .. ".map_text")
		else
			srcPath = rom.path.combine(mod.hadesGameFolder, "Content\\Maps\\" .. src .. ".map_text")
		end
		destPath = rom.path.combine(rom.paths.Content(), "Maps\\" .. dest .. ".map_text")
		copyFile(srcPath, destPath)
	end

	copyFiles(mod.MapFileMappings, "Content\\Maps\\bin\\", "Maps\\bin\\", ".thing_bin", "Map binary ", true)

	copyFiles(mod.VoiceoverFileNames, "Content\\Audio\\Desktop\\VO\\", "Audio\\Desktop\\VO\\", ".txt", "Voiceline ", true)
	copyFiles(mod.VoiceoverFileNames, "Content\\Audio\\Desktop\\VO\\", "Audio\\Desktop\\VO\\", ".fsb", "Voiceline ", true)

	mod.DebugPrint("Parsing subtitle CSV files...", 3)
	loadSubtitleCsvFilesAndWriteToSjson()

	applyModificationsAndCopySjsonFiles(mod.SjsonFileMappings, "Content\\Game\\", "Game\\", mod.SjsonFileModifications)

	mod.DebugPrint("Copying text files...", 3)
	copyHadesHelpTexts()
	copyHadesNPCTexts()

	mod.DebugPrint("Copying GUI animations...", 3)
	copyHadesGUIAnimations()

	mod.DebugPrint("Copying Portrait animations...", 3)
	copyHadesPortraitAnimations()

	mod.DebugPrint("Copying Character animations...", 3)
	copyHadesCharacterAnimationsNPCs()

	local numMissingFiles = mod.CheckRequiredFiles(false)
	if numMissingFiles > 0 then
		mod.DebugPrint(
			numMissingFiles ..
			" required files are missing immediately after first time setup. Do you have Hades installed in the correct folder? Check the \"hadesGameFolder\" setting in your config file.",
			1)

		mod.HiddenConfig.IsValidInstallation = false
		mod.HiddenConfig.InstallationFailReason = "MissingFiles"
		mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

		-- Ensure we get a new clean install next time
		config.uninstall = true
		config.firstTimeSetup = true
		return false
	end

	-- If this is a reinstall, to show the successful install screen again
	mod.HiddenConfig.HasShownSuccessfulInstallScreen = false
	mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)

	config.firstTimeSetup = false
	mod.DebugPrint("Finished mod installation and first time setup.", 3)

	return true
end
