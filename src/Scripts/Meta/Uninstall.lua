local function removeFiles(fileMappings, rootPath, basePath, extension)
	mod.DebugPrint("Removing " .. extension .. " files...", 3)
	for src, dest in pairs(fileMappings) do
		mod.RemoveFile(rom.path.combine(rootPath, basePath .. dest .. extension))
	end
end

-- Removes all SJSON files from the SJSON data directory
local function removeSjsonDataFiles()
	if not rom.path.exists(_PLUGIN.sjson_data_path) then return end
	mod.DebugPrint("Removing .sjson files...", 3)

	for src, dest in pairs(mod.SjsonFileMappings) do
		mod.RemoveFile(rom.path.combine(_PLUGIN.sjson_data_path, dest .. ".sjson"))
	end

	for _, sjsonDataRelativePath in ipairs({
		mod.HadesFxSjsonDataPath,
		mod.HadesGUIAnimationsSjsonDataPath,
		mod.HadesPortraitAnimationsSjsonDataPath,
		mod.HadesCharacterAnimationsNPCsSjsonDataPath,
	}) do
		mod.RemoveFile(rom.path.combine(_PLUGIN.sjson_data_path, sjsonDataRelativePath))
	end

	local allHelpTextFileNames = game.DeepCopyTable(mod.HadesHelpTextFileNames) or {}
	for fileName, _ in pairs(mod.NPCTextFileNames) do
		table.insert(allHelpTextFileNames, fileName)
	end
	for _, fileName in ipairs(allHelpTextFileNames) do
		for _, language in ipairs(mod.HelpTextLanguages) do
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				mod.RemoveFile(rom.path.combine(_PLUGIN.sjson_data_path,
					"Text\\" .. language .. "\\Z_" .. fileName .. "ModsNikkelMHadesBiomes." .. language .. ".sjson"))
			end
		end
	end

	local languages = {}
	for key, value in pairs(mod.SubtitleCsvFolderNames or {}) do
		for _, language in ipairs(value) do
			languages[language] = true
		end
	end
	for language, _ in pairs(languages) do
		for speakerName, _ in pairs(mod.SubtitleCsvFileNameMappings or {}) do
			mod.RemoveFile(mod.GetSubtitleSjsonPath(language, speakerName))
		end
	end
end

function mod.Uninstall()
	mod.DebugPrint("Uninstalling mod - removing files added by the mod", 3)
	local contentRoot = rom.paths.Content()
	local pluginsDataContentRoot = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "Content")

	-- Audio banks: remove Hades-1-copied files from plugins_data (custom ones are shipped with the mod)
	removeFiles(mod.AudioFileMappings, pluginsDataContentRoot, "Audio\\Desktop\\", ".bank")

	-- Bik files: remove Hades-1-copied files from plugins_data (custom ones are shipped with the mod)
	removeFiles(mod.BikFileNames, pluginsDataContentRoot, "Movies\\1080p\\", ".bik")
	removeFiles(mod.BikFileNames, pluginsDataContentRoot, "Movies\\1080p\\", ".bik_atlas")
	removeFiles(mod.BikFileNames, pluginsDataContentRoot, "Movies\\720p\\", ".bik")
	removeFiles(mod.BikFileNames, pluginsDataContentRoot, "Movies\\720p\\", ".bik_atlas")

	-- Map files: only remove Hades-1-copied .map_text from plugins_data (not mod-shipped ones)
	for src, dest in pairs(mod.MapFileMappings) do
		if not mod.MapTextFileNames[src] then
			mod.RemoveFile(rom.path.combine(pluginsDataContentRoot, "Maps\\" .. dest .. ".map_text"))
		end
	end

	-- SJSON files: remove from SJSON data (current location)
	removeSjsonDataFiles()

	-- Remove files from the game install directory for users upgrading from versions before 1.0.0
	local previousVersion = mod.HiddenConfig.InstalledModVersion or ""
	if previousVersion == "" or previousVersion < "1.0.0" then
		mod.DebugPrint("Cleaning up legacy files from game install directory (upgrading from " .. previousVersion .. ")...", 3)
		mod.RemoveLegacySjsonFilesFromContent()
		removeFiles(mod.MapFileMappings, contentRoot, "Maps\\", ".map_text")
		removeFiles(mod.MapFileMappings, contentRoot, "Maps\\bin\\", ".thing_bin")
		removeFiles(mod.VoiceoverFileNames, contentRoot, "Audio\\Desktop\\VO\\", ".txt")
		removeFiles(mod.VoiceoverFileNames, contentRoot, "Audio\\Desktop\\VO\\", ".fsb")
		removeFiles(mod.AudioFileMappings, contentRoot, "Audio\\Desktop\\", ".bank")
		removeFiles(mod.BikFileNames, contentRoot, "Movies\\1080p\\", ".bik")
		removeFiles(mod.BikFileNames, contentRoot, "Movies\\1080p\\", ".bik_atlas")
		removeFiles(mod.BikFileNames, contentRoot, "Movies\\720p\\", ".bik")
		removeFiles(mod.BikFileNames, contentRoot, "Movies\\720p\\", ".bik_atlas")
		removeFiles(mod.CustomBikFileNames, contentRoot, "Movies\\1080p\\", ".bik")
		removeFiles(mod.CustomBikFileNames, contentRoot, "Movies\\1080p\\", ".bik_atlas")
		removeFiles(mod.CustomBikFileNames, contentRoot, "Movies\\720p\\", ".bik")
		removeFiles(mod.CustomBikFileNames, contentRoot, "Movies\\720p\\", ".bik_atlas")
		mod.RemoveFile(rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "checksums.txt"))
	end

	config.uninstall = false
	mod.DebugPrint("Uninstallation complete.", 3)

	return true
end
