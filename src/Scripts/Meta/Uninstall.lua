local function removeFiles(fileMappings, basePath, fileType)
	mod.DebugPrint("Removing " .. fileType .. " files...", 3)
	for src, dest in pairs(fileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), basePath .. dest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath, 4)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err, 1)
			end
		end
	end
end

local function removeFile(filePath, fileType)
	if rom.path.exists(filePath) then
		mod.DebugPrint("Removing file: " .. filePath, 4)
		local success, err = os.remove(filePath)
		if not success then
			mod.DebugPrint("Error removing file: " .. err, 1)
		end
	end
end

local function removeFilesByNames(fileNames, basePath, extension)
	mod.DebugPrint("Removing " .. extension .. " files...", 3)
	for _, name in ipairs(fileNames) do
		local destPath = rom.path.combine(rom.paths.Content(), basePath .. name .. extension)
		removeFile(destPath, extension)
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
					"For at least one of your save files, the most recent run is/was a modded Hades run. The mod will not uninstall, otherwise your savegame will corrupt! Make sure you are currently in a normal Hades II run, or were in one before you returned to the crossroads! Then try uninstalling the mod again. Are you SURE this is wrong? Set \"uninstall\" in the config to \"I AM SURE - UNINSTALL\".",
					1)
				config.uninstall = "false"
				return false
			end
		end
	end
	mod.DebugPrint("Uninstalling mod - removing files added by the mod", 3)

	removeFiles(AudioFileMappings, "Audio\\Desktop\\", ".bank")
	removeFiles(PackageFileMappings, "Packages\\", ".pkg")
	removeFilesByNames(CustomPackageFileNames, "Packages\\1080p\\", ".pkg")
	removeFilesByNames(CustomPackageFileNames, "Packages\\1080p\\", ".pkg_manifest")
	removeFilesByNames(CustomPackageFileNames, "Packages\\720p\\", ".pkg")
	removeFilesByNames(CustomPackageFileNames, "Packages\\720p\\", ".pkg_manifest")
	removeFiles(BikFileMappings, "Movies\\", ".bik")
	removeFiles(SjsonFileMappings, "Game\\", ".sjson")

	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesFxDestinationFilename), ".sjson")
	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesGUIAnimationsDestinationFilename), ".sjson")
	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesPortraitAnimationsDestinationFilename), ".sjson")
	removeFile(rom.path.combine(rom.paths.Content(), mod.HadesCharacterAnimationsNPCsDestinationFilename), ".sjson")

	removeFilesByNames(MapFileNames, "Maps\\", ".map_text")
	removeFilesByNames(MapFileNames, "Maps\\bin\\", ".thing_bin")

	removeFilesByNames(VoiceoverFileNames, "Audio\\Desktop\\VO\\", ".txt")
	removeFilesByNames(VoiceoverFileNames, "Audio\\Desktop\\VO\\", ".fsb")

	mod.DebugPrint("Removing help text files...", 3)
	for _, language in ipairs(HelpTextLanguages) do
		local helpTextFile = rom.path.combine(rom.paths.Content(),
			'Game\\Text\\' .. language .. '\\HelpTextHades.' .. language .. '.sjson')
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
