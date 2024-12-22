function mod.Uninstall()
	print("Uninstalling mod - removing files added by the mod")

	print("Removing .pkg files...")
	for src, dest in pairs(PackageFileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), dest)
		if rom.path.exists(destPath) then
			print("Removing file: " .. destPath)
			local success, err = os.remove(destPath)
			if not success then
				print("Error removing file: " .. err)
			end
		end
	end

	print("Removing .map_text files...")
	for _, name in ipairs(MapFileNames) do
		local mapTextDest = "Maps\\" .. name .. ".map_text"
		local destPath = rom.path.combine(rom.paths.Content(), mapTextDest)
		if rom.path.exists(destPath) then
			print("Removing file: " .. destPath)
			local success, err = os.remove(destPath)
			if not success then
				print("Error removing file: " .. err)
			end
		end
	end

	print("Removing .thing_bin files...")
	for _, name in ipairs(MapFileNames) do
		local thingBinDest = "Maps\\bin\\" .. name .. ".thing_bin"
		local destPath = rom.path.combine(rom.paths.Content(), thingBinDest)
		if rom.path.exists(destPath) then
			print("Removing file: " .. destPath)
			local success, err = os.remove(destPath)
			if not success then
				print("Error removing file: " .. err)
			end
		end
	end

	print("Removing help text files...")
	for _, language in ipairs(HelpTextLanguages) do
		local helpTextFile = rom.path.combine(rom.paths.Content(),
			'Game\\Text\\' .. language .. '\\HelpTextHades.' .. language .. '.sjson')
		if rom.path.exists(helpTextFile) then
			print("Removing file: " .. helpTextFile)
			local success, err = os.remove(helpTextFile)
			if not success then
				print("Error removing file: " .. err)
			end
		end
	end

	config.uninstall = false

	print("Uninstallation complete, set config value to false.")
end
