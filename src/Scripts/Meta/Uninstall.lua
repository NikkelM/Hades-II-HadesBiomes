function mod.Uninstall()
	-- Check if any savegame has a modded run as the most recent one - block uninstallation if so, as it would corrupt the save file
	local cachedRuns = mod.LoadCachedRunsFile()
	if config.uninstall == "I AM SURE - UNINSTALL" then
		mod.DebugPrint("Uninstalling mod - forced uninstallation! Savegames may corrupt. Re-install the mod to try and restore them.", 2)
	else
		for saveFileIndex, isActive in pairs(cachedRuns.ActiveModdedRuns) do
			if isActive then
				mod.DebugPrint(
				"For at least one of your save files, the most recent run is/was a modded Hades run. The mod will not uninstall, otherwise your savegame will corrupt! Make sure you are currently in a normal Hades II run, or were in one before you returned to the crossroads! Then try uninstalling the mod again. Are you SURE this is wrong? Set \"uninstall\" in the config to \"I AM SURE - UNINSTALL\".",
					1)
				config.uninstall = "false"
				return false
			end
		end
		mod.DebugPrint("Uninstalling mod - removing files added by the mod", 3)
	end

	-- TODO: Refactor
	mod.DebugPrint("Removing .bank files...", 3)
	for src, dest in pairs(AudioFileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), "Audio\\Desktop\\" .. dest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath, 4)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err, 1)
			end
		end
	end

	mod.DebugPrint("Removing .pkg files...", 3)
	for src, dest in pairs(PackageFileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), "Packages\\" .. dest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath, 4)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err, 1)
			end
		end
	end

	mod.DebugPrint("Removing .bik files...", 3)
	for src, dest in pairs(BikFileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), "Movies\\" .. dest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath, 4)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err, 1)
			end
		end
	end

	mod.DebugPrint("Removing .sjson files...", 3)
	for src, dest in pairs(SjsonFileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), "Game\\" .. dest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath, 4)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err, 1)
			end
		end
	end
	-- FX file
	local fxSjsonFilePath = rom.path.combine(rom.paths.Content(), mod.HadesFxDestinationFilename)
	if rom.path.exists(fxSjsonFilePath) then
		mod.DebugPrint("Removing file: " .. fxSjsonFilePath, 4)
		local success, err = os.remove(fxSjsonFilePath)
		if not success then
			mod.DebugPrint("Error removing file: " .. err, 1)
		end
	end

	mod.DebugPrint("Removing .map_text files...", 3)
	for _, name in ipairs(MapFileNames) do
		local mapTextDest = "Maps\\" .. name .. ".map_text"
		local destPath = rom.path.combine(rom.paths.Content(), mapTextDest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath, 4)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err, 1)
			end
		end
	end

	mod.DebugPrint("Removing .thing_bin files...", 3)
	for _, name in ipairs(MapFileNames) do
		local thingBinDest = "Maps\\bin\\" .. name .. ".thing_bin"
		local destPath = rom.path.combine(rom.paths.Content(), thingBinDest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath, 4)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err, 1)
			end
		end
	end

	mod.DebugPrint("Removing help text files...", 3)
	for _, language in ipairs(HelpTextLanguages) do
		local helpTextFile = rom.path.combine(rom.paths.Content(),
			'Game\\Text\\' .. language .. '\\HelpTextHades.' .. language .. '.sjson')
		if rom.path.exists(helpTextFile) then
			mod.DebugPrint("Removing file: " .. helpTextFile, 4)
			local success, err = os.remove(helpTextFile)
			if not success then
				mod.DebugPrint("Error removing file: " .. err, 1)
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

	config.uninstall = "false"

	mod.DebugPrint("Uninstallation complete.", 3)

	return true
end
