local function removeFiles(fileMappings, basePath, extension)
	mod.DebugPrint("Removing " .. extension .. " files...", 3)
	for src, dest in pairs(fileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), basePath .. dest .. extension)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath, 4)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err, 1)
			end
		end
	end
end

local function removeFile(filePath, extension)
	local destPath = filePath .. extension
	if rom.path.exists(destPath) then
		mod.DebugPrint("Removing file: " .. destPath, 4)
		local success, err = os.remove(destPath)
		if not success then
			mod.DebugPrint("Error removing file: " .. err, 1)
		end
	end
end

local function removeSubtitleSjsonFiles()
	mod.DebugPrint("Removing subtitle sjson files...", 3)
	local languages = {}
	for key, value in pairs(mod.SubtitleCsvFolderNames or {}) do
		for _, language in ipairs(value) do
			languages[language] = true
		end
	end

	for language, _ in pairs(languages) do
		for speakerName, _ in pairs(mod.SubtitleCsvFileNameMappings or {}) do
			local destPath = mod.GetSubtitleSjsonPath(language, speakerName)
			removeFile(destPath, "")
		end
	end
end

function mod.Uninstall()
	mod.DebugPrint("Uninstalling mod - removing files added by the mod", 3)

	removeFiles(mod.AudioFileMappings, "Audio\\Desktop\\", ".bank")

	removeFiles(mod.BikFileNames, "Movies\\1080p\\", ".bik")
	removeFiles(mod.BikFileNames, "Movies\\1080p\\", ".bik_atlas")
	removeFiles(mod.BikFileNames, "Movies\\720p\\", ".bik")
	removeFiles(mod.BikFileNames, "Movies\\720p\\", ".bik_atlas")

	removeFiles(mod.CustomBikFileNames, "Movies\\1080p\\", ".bik")
	removeFiles(mod.CustomBikFileNames, "Movies\\1080p\\", ".bik_atlas")
	removeFiles(mod.CustomBikFileNames, "Movies\\720p\\", ".bik")
	removeFiles(mod.CustomBikFileNames, "Movies\\720p\\", ".bik_atlas")

	removeFiles(mod.SjsonFileMappings, "Game\\", ".sjson")

	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesFxDestinationFilename), "")
	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesGUIAnimationsDestinationFilename), "")
	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesPortraitAnimationsDestinationFilename), "")
	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesCharacterAnimationsNPCsDestinationFilename), "")

	removeFiles(mod.MapFileMappings, "Maps\\", ".map_text")
	removeFiles(mod.MapFileMappings, "Maps\\bin\\", ".thing_bin")

	removeFiles(mod.VoiceoverFileNames, "Audio\\Desktop\\VO\\", ".txt")
	removeFiles(mod.VoiceoverFileNames, "Audio\\Desktop\\VO\\", ".fsb")

	removeSubtitleSjsonFiles()

	mod.DebugPrint("Removing help text files...", 3)
	-- _NPCData files are installed differently, so not part of this table by default
	local allHelpTextFileNames = game.DeepCopyTable(mod.HadesHelpTextFileNames) or {}
	table.insert(allHelpTextFileNames, "_NPCData")
	for _, fileName in ipairs(allHelpTextFileNames) do
		for _, language in ipairs(mod.HelpTextLanguages) do
			-- Skip files that are in the skip map for the current language, as they don't exist
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				local helpTextFile = rom.path.combine(rom.paths.Content(),
					"Game\\Text\\" .. language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language)
				removeFile(helpTextFile, ".sjson")
			end
		end
	end

	-- Set the content of checksumsDest to an empty string to prompt an installation on the next start if the mod is enabled again
	local checksumsDest = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid .. "\\checksums.txt")
	local checksumsFile = io.open(checksumsDest, "w")
	if not checksumsFile then
		mod.DebugPrint("Error opening file: " .. checksumsDest, 1)
		return
	end
	checksumsFile:write("")
	checksumsFile:close()

	config.uninstall = false
	mod.DebugPrint("Uninstallation complete.", 3)

	return true
end
