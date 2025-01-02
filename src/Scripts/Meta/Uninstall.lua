function mod.Uninstall()
	mod.DebugPrint("Uninstalling mod - removing files added by the mod")

	mod.DebugPrint("Removing .pkg files...")
	for src, dest in pairs(PackageFileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), dest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err)
			end
		end
	end

	mod.DebugPrint("Removing .bik files...")
	for src, dest in pairs(BikFileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), dest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err)
			end
		end
	end

	mod.DebugPrint("Removing .sjson files...")
	for src, dest in pairs(SjsonFileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), dest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err)
			end
		end
	end

	mod.DebugPrint("Removing .map_text files...")
	for _, name in ipairs(MapFileNames) do
		local mapTextDest = "Maps\\" .. name .. ".map_text"
		local destPath = rom.path.combine(rom.paths.Content(), mapTextDest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err)
			end
		end
	end

	mod.DebugPrint("Removing .thing_bin files...")
	for _, name in ipairs(MapFileNames) do
		local thingBinDest = "Maps\\bin\\" .. name .. ".thing_bin"
		local destPath = rom.path.combine(rom.paths.Content(), thingBinDest)
		if rom.path.exists(destPath) then
			mod.DebugPrint("Removing file: " .. destPath)
			local success, err = os.remove(destPath)
			if not success then
				mod.DebugPrint("Error removing file: " .. err)
			end
		end
	end

	mod.DebugPrint("Removing help text files...")
	for _, language in ipairs(HelpTextLanguages) do
		local helpTextFile = rom.path.combine(rom.paths.Content(),
			'Game\\Text\\' .. language .. '\\HelpTextHades.' .. language .. '.sjson')
		if rom.path.exists(helpTextFile) then
			mod.DebugPrint("Removing file: " .. helpTextFile)
			local success, err = os.remove(helpTextFile)
			if not success then
				mod.DebugPrint("Error removing file: " .. err)
			end
		end
	end

	config.uninstall = false

	mod.DebugPrint("Uninstallation complete, set config value to false.")
end
