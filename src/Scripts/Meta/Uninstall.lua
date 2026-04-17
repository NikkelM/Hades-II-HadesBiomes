local function removeFiles(fileMappings, rootPath, basePath, extension)
	mod.DebugPrint("Removing " .. extension .. " files...", 3)
	for src, dest in pairs(fileMappings) do
		mod.RemoveFile(rom.path.combine(rootPath, basePath .. dest .. extension))
	end
end

-- Removes all SJSON files from the SJSON data directory
local function removeSjsonDataFiles()
	if not rom.path.exists(mod.SjsonDataBasePath) then return end
	mod.DebugPrint("Removing SJSON files from SJSON data directory...", 3)

	for src, dest in pairs(mod.SjsonFileMappings) do
		mod.RemoveFile(rom.path.combine(mod.SjsonDataBasePath, dest .. ".sjson"))
	end

	for _, sjsonDataRelativePath in ipairs({
		mod.HadesFxSjsonDataPath,
		mod.HadesGUIAnimationsSjsonDataPath,
		mod.HadesPortraitAnimationsSjsonDataPath,
		mod.HadesCharacterAnimationsNPCsSjsonDataPath,
	}) do
		mod.RemoveFile(rom.path.combine(mod.SjsonDataBasePath, sjsonDataRelativePath))
	end

	local allHelpTextFileNames = game.DeepCopyTable(mod.HadesHelpTextFileNames) or {}
	for fileName, _ in pairs(mod.NPCTextFileNames) do
		table.insert(allHelpTextFileNames, fileName)
	end
	for _, fileName in ipairs(allHelpTextFileNames) do
		for _, language in ipairs(mod.HelpTextLanguages) do
			if not (mod.HadesHelpTextFileSkipMap[fileName] and mod.HadesHelpTextFileSkipMap[fileName][language]) then
				mod.RemoveFile(rom.path.combine(mod.SjsonDataBasePath,
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

	-- Files in the game installation directory
	removeFiles(mod.AudioFileMappings, contentRoot, "Audio\\Desktop\\", ".bank")

	removeFiles(mod.BikFileNames, contentRoot, "Movies\\1080p\\", ".bik")
	removeFiles(mod.BikFileNames, contentRoot, "Movies\\1080p\\", ".bik_atlas")
	removeFiles(mod.BikFileNames, contentRoot, "Movies\\720p\\", ".bik")
	removeFiles(mod.BikFileNames, contentRoot, "Movies\\720p\\", ".bik_atlas")

	removeFiles(mod.CustomBikFileNames, contentRoot, "Movies\\1080p\\", ".bik")
	removeFiles(mod.CustomBikFileNames, contentRoot, "Movies\\1080p\\", ".bik_atlas")
	removeFiles(mod.CustomBikFileNames, contentRoot, "Movies\\720p\\", ".bik")
	removeFiles(mod.CustomBikFileNames, contentRoot, "Movies\\720p\\", ".bik_atlas")

	removeFiles(mod.VoiceoverFileNames, contentRoot, "Audio\\Desktop\\VO\\", ".txt")
	removeFiles(mod.VoiceoverFileNames, contentRoot, "Audio\\Desktop\\VO\\", ".fsb")

	-- Map files: only remove Hades-1-copied .map_text from plugins_data (not mod-shipped ones)
	for src, dest in pairs(mod.MapFileMappings) do
		if not mod.MapTextFileNames[src] then
			mod.RemoveFile(rom.path.combine(pluginsDataContentRoot, "Maps\\" .. dest .. ".map_text"))
		end
	end

	-- SJSON files: remove from SJSON data (current location)
	removeSjsonDataFiles()

	-- Remove files from the game install directory in case this is upgrading from a mod version before 1.0.0
	if not mod.HiddenConfig.HasCompletedLegacySjsonCleanup then
		mod.RemoveLegacySjsonFilesFromContent()
		removeFiles(mod.MapFileMappings, contentRoot, "Maps\\", ".map_text")
		removeFiles(mod.MapFileMappings, contentRoot, "Maps\\bin\\", ".thing_bin")

		mod.HiddenConfig.HasCompletedLegacySjsonCleanup = true
		mod.SaveCachedSjsonFile("hiddenConfig.sjson", mod.HiddenConfig)
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
