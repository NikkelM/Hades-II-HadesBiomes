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

function mod.Uninstall()
	-- Check if any savegame has a modded run as the most recent one - block uninstallation if so, as it would corrupt the save file
	local cachedRuns = mod.LoadCachedRunsFile()
	if config.uninstall == "I AM SURE - UNINSTALL" then
		mod.DebugPrint(
			"Uninstalling mod - forced uninstallation! Savegames may corrupt. Re-install the mod to try and restore them.", 2)
		-- Empty the list of cached runs - as the user thinks it is wrong
		local defaultCachedRuns = { ActiveModdedRuns = {} }
		sjson.encode_file(mod.CachedRunsFilePath, defaultCachedRuns)
	elseif not config.firstTimeSetup then
		for saveFileIndex, isActive in pairs(cachedRuns.ActiveModdedRuns) do
			if isActive then
				mod.DebugPrint(
					"For at least one of your save files, the most recent saved run is/was a modded Hades run (this may be incorrect if you replaced or deleted a save file with an active modded run at some point). The mod will *NOT* be uninstalled, otherwise your savegame will corrupt!\nMake sure you are currently in a normal Hades II run (and complete it normally without giving up), or were in one before you returned to the crossroads (by winning or dying, not giving up) to prevent savegame corruption! Then try uninstalling the mod again.\nAre you SURE this is wrong? Set \"uninstall\" in the config to \"I AM SURE - UNINSTALL\".",
					1)
				config.uninstall = "false"
				return false
			end
		end
	end
	mod.DebugPrint("Uninstalling mod - removing files added by the mod", 3)

	removeFiles(mod.AudioFileMappings, "Audio\\Desktop\\", ".bank")

	removeFiles(mod.PackageFileMappings, "Packages\\1080p\\", ".pkg")
	removeFiles(mod.PackageFileMappings, "Packages\\1080p\\", ".pkg_manifest")
	removeFiles(mod.PackageFileMappings, "Packages\\720p\\", ".pkg")
	removeFiles(mod.PackageFileMappings, "Packages\\720p\\", ".pkg_manifest")

	removeFiles(mod.BikFileMappings, "Movies\\1080p\\", ".bik")
	removeFiles(mod.BikFileMappings, "Movies\\1080p\\", ".bik_atlas")
	removeFiles(mod.BikFileMappings, "Movies\\720p\\", ".bik")
	removeFiles(mod.BikFileMappings, "Movies\\720p\\", ".bik_atlas")

	removeFiles(mod.SjsonFileMappings, "Game\\", ".sjson")

	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesFxDestinationFilename), "")
	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesGUIAnimationsDestinationFilename), "")
	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesPortraitAnimationsDestinationFilename), "")
	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesCharacterAnimationsNPCsDestinationFilename), "")

	removeFiles(mod.MapFileMappings, "Maps\\", ".map_text")
	removeFiles(mod.MapFileMappings, "Maps\\bin\\", ".thing_bin")

	removeFiles(mod.VoiceoverFileNames, "Audio\\Desktop\\VO\\", ".txt")
	removeFiles(mod.VoiceoverFileNames, "Audio\\Desktop\\VO\\", ".fsb")

	mod.DebugPrint("Removing help text files...", 3)
	for _, language in ipairs(mod.HelpTextLanguages) do
		local helpTextFile = rom.path.combine(rom.paths.Content(),
			"Game\\Text\\" .. language .. "\\HelpTextHades." .. language)
		removeFile(helpTextFile, ".sjson")
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

	config.uninstall = "false"
	mod.DebugPrint("Uninstallation complete.", 3)

	return true
end
