-- Copies a file from src to dest
local function copyFile(src, dest)
	if rom.path.exists(dest) then
		mod.DebugPrint("File already exists and will not be overwritten: " .. dest, 2)
		return true
	end

	mod.DebugPrint("Copying file " .. src .. " to " .. dest, 4)
	local copied, copyError = rom.path.copy_file(src, dest)
	if not copied then
		mod.DebugPrint("Could not copy " .. src .. " to " .. dest .. ": " .. tostring(copyError), 1)
		mod.EncounteredInstallationIssues = true
		return false
	end

	return true
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

		if not rom.path.exists(rom.path.combine(_PLUGIN.sjson_data_path, sjsonDataRelativePath)) then
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
local function modifyHadesLocalizedTextEntries(fileData)
	for _, entry in ipairs(fileData.Texts) do
		-- Some entry IDs need to be changed, such as for duplicate enemy names
		-- Merge these tables if there are multiple types of replacements
		if mod.EnemyNameMappings[entry.Id] then
			entry.Id = mod.EnemyNameMappings[entry.Id]
		end
		-- Voiceover lines are keyed by the speaker name their ID starts with, which we rename to avoid collisions
		if entry.Id then
			local speaker, rest = entry.Id:match("^(%w+)_(.*)$")
			if speaker and mod.VoiceoverFileNames[speaker] then
				entry.Id = mod.VoiceoverFileNames[speaker] .. "_" .. rest
			end
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

	return fileData.Texts
end

local function getHadesTextEntries(fileName, fileData)
	if fileName == "HelpText" then
		return mod.ModifyHadesHelpTextEntries(fileData)
	elseif fileName == "CodexText" then
		return mod.ModifyCodexTextEntries(fileData).Texts
	elseif fileName == "MiscText" then
		return fileData.Texts
	end

	return modifyHadesLocalizedTextEntries(fileData)
end

-- To not add whitespace after an escaped \n for these languages
local languagesWithoutWordSpacing = {
	ja = true,
	ko = true,
	["zh-CN"] = true,
	["zh-TW"] = true,
}

local function copyHadesTextFiles()
	for _, fileName in ipairs(mod.GetAllHadesTextFileNames()) do
		for _, language in ipairs(mod.HelpTextLanguages) do
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				local sjsonDataRelativePath = "Text\\" ..
						language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson"

				if rom.path.exists(rom.path.combine(_PLUGIN.sjson_data_path, sjsonDataRelativePath)) then
					mod.DebugPrint("File already exists and will not be overwritten: " .. sjsonDataRelativePath, 2)
				else
					mod.DebugPrint("Copying " .. fileName .. " entries for language: " .. language, 4)

					local hadesFile = rom.path.combine(mod.hadesGameFolder,
						"Content\\Game\\Text\\" .. language .. "\\" .. fileName .. "." .. language .. ".sjson")
					local entries = getHadesTextEntries(fileName, mod.DecodeSjsonFile(hadesFile)) or {}

					local fileData = { lang = language, Texts = {} }
					for _, entry in ipairs(entries) do
						if entry.Id ~= nil then
							if not languagesWithoutWordSpacing[language] then
								if entry.DisplayName then
									-- Newlines are read as a whitespace-delimited token, so a word directly following one would be swallowed
									entry.DisplayName = entry.DisplayName:gsub("(\n+)([^%s])", "%1 %2")
									-- Multiline strings are not unescaped when decoded, so the same fix has to be applied to their literal \n
									entry.DisplayName = entry.DisplayName:gsub("\\n([^%s\\])", "\\n %1")
								end
								if entry.Description then
									entry.Description = entry.Description:gsub("(\n+)([^%s])", "%1 %2")
									entry.Description = entry.Description:gsub("\\n([^%s\\])", "\\n %1")
								end
							end
							table.insert(fileData.Texts,
								sjson.to_object(entry,
									{ "Id", "InheritFrom", "Speaker", "DisplayName", "Description", "OverwriteLocalization" }))
						end
					end

					mod.WriteSjsonData(sjsonDataRelativePath, fileData)
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

				if rom.path.exists(rom.path.combine(_PLUGIN.sjson_data_path, sjsonDataRelativePath)) then
					mod.DebugPrint("File already exists and will not be overwritten: " .. sjsonDataRelativePath, 2)
				else
					local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder,
						"Content\\Game\\Text\\" .. language .. "\\" .. fileName .. "." .. language .. ".sjson")
					local hadesHelpTextDataRaw = mod.DecodeSjsonFile(hadesHelpTextFile)

					-- Need to do in-place to ensure the lang key is before the Texts key, otherwise the file is not loaded correctly by the game
					local filteredTexts = {}
					for _, entry in ipairs(hadesHelpTextDataRaw.Texts) do
						if entry.Id and entry.Speaker and allowedSpeakers[entry.Speaker] then
							-- Voiceover lines are keyed by the speaker name their ID starts with, which we rename to avoid collisions
							local speaker, rest = entry.Id:match("^(%w+)_(.*)$")
							if speaker and mod.VoiceoverFileNames[speaker] then
								entry.Id = mod.VoiceoverFileNames[speaker] .. "_" .. rest
							end
							-- Custom rename, moved into MegaeraHome bank
							entry.Id = entry.Id:gsub("MegaeraExtra_", "Modsnikkelmhadesbiomesmegaerahome_5")

							if entry.DisplayName then
								entry.DisplayName = entry.DisplayName:gsub("{#PreviousFormat}", "{#Prev}")
							end
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

	if rom.path.exists(rom.path.combine(_PLUGIN.sjson_data_path, sjsonDataRelativePath)) then
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
			table.insert(filteredAnimations, animation)
		end
	end

	mod.ApplyNestedSjsonModifications(filteredAnimations, modifications)

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

local function copyHadesCharacterAnimationsEnemies()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder,
		"Content\\Game\\Animations\\CharacterAnimationsEnemies.sjson")
	copyAndFilterAnimations(sourceFilePath, mod.HadesCharacterAnimationsEnemiesSjsonDataPath, {},
		mod.HadesCharacterAnimationsEnemiesDuplicates, mod.HadesCharacterAnimationsEnemiesModifications, {},
		mod.HadesCharacterAnimationsEnemiesAdditions, "CharacterAnimationsEnemies.sjson")
end

local function copyHadesEnemyAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\EnemyAnimations.sjson")
	copyAndFilterAnimations(sourceFilePath, mod.HadesEnemyAnimationsSjsonDataPath, mod.EnemyAnimationMappings,
		mod.HadesEnemyAnimationsDuplicates, mod.HadesEnemyAnimationsModifications, {}, {}, "EnemyAnimations.sjson")
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
---Includes files the engine needs to resolve early, such as .bik_atlas manifests.
---Also serves as the Olympus Extra detection check.
---@return boolean success Whether the files were created/copied successfully.
function mod.CreatePreLoadingBarFiles()
	mod.DebugPrint("[Pre-install] Copying files required for mod installation...", 3)

	mod.DebugPrint("[Pre-install] Ensuring no Hades mods are installed...", 3)
	if mod.AreHadesModsInstalled() then
		return false
	end

	-- The Fx file is no longer a hook target, but copying it here detects an Olympus Extra installation early
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
		config.debugging.uninstall = true
		config.debugging.firstTimeSetup = true
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
	-- Also pre-register the .bik file paths to ensure the engine can resolve 720p biks correctly on the first start
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

		local bik1080 = rom.path.combine(pluginsDataBase, "Content\\Movies\\1080p\\" .. name .. ".bik")
		local bik720 = rom.path.combine(pluginsDataBase, "Content\\Movies\\720p\\" .. name .. ".bik")
		rom.data.register_plugin_file(name .. ".bik", bik1080)
		rom.data.register_plugin_file(name .. ".bik", bik720)
	end

	mod.DebugPrint("[Pre-install] Pre-install complete. Remaining installation will run during the loading bar.", 3)
	return true
end

-- #region Install steps
-- Split points of the bik batches to roughly balance by file size
-- The last batch will always run until the end of the list so we can't miss any new files
local bikBatchBoundaries1080p = { 42, 66, 103, 131, 176, 195, 228, 258 }
local bikBatchBoundaries720p = { 59, 150, 198, 257 }

-- Returns the .bik file names belonging to one batch.
local function getBikBatch(boundaries, batchNum)
	local startIndex = batchNum == 1 and 1 or boundaries[batchNum - 1] + 1
	-- Clamped so the batches stay valid if .bik files are added to or removed from the table
	local endIndex = math.min(boundaries[batchNum] or #mod.BikFileNames, #mod.BikFileNames)

	local batch = {}
	for i = startIndex, endIndex do
		table.insert(batch, mod.BikFileNames[i])
	end

	return batch
end

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

-- Steps that write .sjson files must run before the engine enumerates the directory they write into
local installSteps = {
	Enemies = { "Audio .bank files", function()
		copyFiles(mod.AudioFileMappings, "Content\\Audio\\FMOD\\Build\\Desktop\\", "Content\\Audio\\Desktop\\", ".bank",
			"Audio ", false, true)
	end },

	NPCs = { "Game data .sjson files", function()
		applyModificationsAndCopySjsonFiles(mod.SjsonFileMappings, "Content\\Game\\", mod.SjsonFileModifications)
	end },

	EnemyWeapons = { ".map_text files", function()
		copyMapTextFiles()
	end },

	EnemyProjectiles = { "Enemy character animation .sjson files", function()
		mod.DebugPrint("[Install] Copying Enemy character animations...", 3)
		copyHadesCharacterAnimationsEnemies()
	end },

	Asphodel = { "Enemy animation .sjson files", function()
		mod.DebugPrint("[Install] Copying Enemy animations...", 3)
		copyHadesEnemyAnimations()
	end },

	Elysium = { "NPC text, GUI + Portrait animation .sjson files", function()
		mod.DebugPrint("[Install] Copying NPC text files...", 3)
		copyHadesNPCTexts()
		mod.DebugPrint("[Install] Copying GUI animations...", 3)
		copyHadesGUIAnimations()
		mod.DebugPrint("[Install] Copying Portrait animations...", 3)
		copyHadesPortraitAnimations()
	end },

	Gameplay = { "Character animation .sjson files", function()
		mod.DebugPrint("[Install] Copying Character animations...", 3)
		copyHadesCharacterAnimationsNPCs()
	end },

	Graybox = { "HelpText .sjson files", function()
		mod.DebugPrint("[Install] Copying HelpText files...", 3)
		copyHadesTextFiles()
	end },

	House = { "Parse subtitle CSV files", function()
		mod.DebugPrint("[Install] Parsing subtitle CSV files...", 3)
		loadSubtitleCsvFilesAndWriteToSjson()
	end },

	Styx = { "1080p .bik batch 1", function()
		copyFiles(getBikBatch(bikBatchBoundaries1080p, 1), "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik", "1080p Hades Animation ",
			false, true)
	end },

	Surface = { "1080p .bik batch 2", function()
		copyFiles(getBikBatch(bikBatchBoundaries1080p, 2), "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik", "1080p Hades Animation ",
			false, true)
	end },

	Tartarus = { "1080p .bik batch 3", function()
		copyFiles(getBikBatch(bikBatchBoundaries1080p, 3), "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik", "1080p Hades Animation ",
			false, true)
	end },

	Temple = { "1080p .bik batch 4", function()
		copyFiles(getBikBatch(bikBatchBoundaries1080p, 4), "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik", "1080p Hades Animation ",
			false, true)
	end },

	Travel = { "1080p .bik batch 5", function()
		copyFiles(getBikBatch(bikBatchBoundaries1080p, 5), "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik", "1080p Hades Animation ",
			false, true)
	end },

	MapGroups = { "1080p .bik batch 6", function()
		copyFiles(getBikBatch(bikBatchBoundaries1080p, 6), "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik", "1080p Hades Animation ",
			false, true)
	end },

	Hero_Melinoe_Animation_Personality = { "1080p .bik batch 7", function()
		copyFiles(getBikBatch(bikBatchBoundaries1080p, 7), "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik", "1080p Hades Animation ",
			false, true)
	end },

	Enemy_1Base_VFX = { "1080p .bik batch 8", function()
		copyFiles(getBikBatch(bikBatchBoundaries1080p, 8), "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik", "1080p Hades Animation ",
			false, true)
	end },

	GUI_Portraits_VFX = { "1080p .bik batch 9", function()
		copyFiles(getBikBatch(bikBatchBoundaries1080p, 9), "Content\\Movies\\", "Content\\Movies\\1080p\\", ".bik", "1080p Hades Animation ",
			false, true)
	end },

	GUI_Screens_VFX = { "720p .bik batch 1", function()
		copyFiles(getBikBatch(bikBatchBoundaries720p, 1), "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", ".bik", "720p Hades Animation ",
			false, true)
	end },

	Melinoe_Spell_VFX = { "720p .bik batch 2", function()
		copyFiles(getBikBatch(bikBatchBoundaries720p, 2), "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", ".bik", "720p Hades Animation ",
			false, true)
	end },

	Melinoe_Zeus_VFX = { "720p .bik batch 3", function()
		copyFiles(getBikBatch(bikBatchBoundaries720p, 3), "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", ".bik", "720p Hades Animation ",
			false, true)
	end },

	Obstacle_Asphodel_VFX = { "720p .bik batch 4", function()
		copyFiles(getBikBatch(bikBatchBoundaries720p, 4), "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", ".bik", "720p Hades Animation ",
			false, true)
	end },

	Obstacle_Deprecated_VFX = { "720p .bik batch 5", function()
		copyFiles(getBikBatch(bikBatchBoundaries720p, 5), "Content\\Movies\\720p\\", "Content\\Movies\\720p\\", ".bik", "720p Hades Animation ",
			false, true)
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
	if numMissingFiles > 0 or mod.EncounteredInstallationIssues then
		mod.DebugPrint(
			numMissingFiles ..
			" required files are missing after installation and the installation failed, see the errors above. Make sure the mod's plugins_data folder is not read-only, and that Hades is installed in the folder configured in \"hadesGameFolder\".",
			1)

		mod.HiddenConfig.IsValidInstallation = false
		mod.HiddenConfig.InstallationFailReason = "MissingFiles"
		mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
		---@diagnostic disable-next-line: undefined-global
		public.IsValidInstallation = false

		-- Ensure we get a new clean install next time
		config.debugging.uninstall = true
		config.debugging.firstTimeSetup = true
		mod.InstallationPending = false
		return
	end

	mod.HiddenConfig.IsValidInstallation = true
	mod.HiddenConfig.InstallationFailReason = ""
	mod.HiddenConfig.InstalledModVersion = _PLUGIN.version
	-- If this is a reinstall, to show the successful install screen again
	mod.HiddenConfig.HasShownSuccessfulInstallScreen = false
	mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
	---@diagnostic disable-next-line: undefined-global
	public.IsValidInstallation = true

	config.debugging.firstTimeSetup = false
	mod.InstallationPending = false
	mod.DebugPrint("Finished mod installation and first time setup.", 3)
end
