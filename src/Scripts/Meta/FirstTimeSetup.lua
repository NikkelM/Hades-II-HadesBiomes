function mod.FirstTimeSetup()
	mod.DebugPrint("Installing the mod...")

	-- Get and copy the .pkg files for the different biomes
	mod.DebugPrint("Copying .pkg files...")

	for src, dest in pairs(PackageFileMappings) do
		local srcPath = rom.path.combine(mod.hadesGameFolder, src)
		local destPath = rom.path.combine(rom.paths.Content(), dest)

		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied Hades\\" .. src .. " to Hades II\\Content\\" .. dest)
	end

	-- Get and copy the .bik and .bik_atlas files
	mod.DebugPrint("Copying .bik files...")

	for src, dest in pairs(BikFileMappings) do
		local srcPath = rom.path.combine(mod.hadesGameFolder, src)
		local destPath = rom.path.combine(rom.paths.Content(), dest)

		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied Hades\\" .. src .. " to Hades II\\Content\\" .. dest)
	end

	-- Get and copy the .sjson files
	mod.DebugPrint("Copying .sjson files...")

	for src, dest in pairs(SjsonFileMappings) do
		local srcPath = rom.path.combine(mod.hadesGameFolder, src)
		local destPath = rom.path.combine(rom.paths.Content(), dest)

		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied Hades\\" .. src .. " to Hades II\\Content\\" .. dest)
	end

	-- Copy .map_text files
	mod.DebugPrint("Copying .map_text files...")

	for _, name in ipairs(MapFileNames) do
		local mapTextSrc = "Content\\Maps\\" .. name .. ".map_text"
		local mapTextDest = "Maps\\" .. name .. ".map_text"
		local srcPath = nil
		local destPath = rom.path.combine(rom.paths.Content(), mapTextDest)

		-- Check if the map_text file is defined in the MapTextFileNames table, in which case it is in the plugins_data folder, and should not be taken from the Hades installation
		if MapTextFileNames[name] then
			srcPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, mapTextSrc)
		else
			srcPath = rom.path.combine(mod.hadesGameFolder, mapTextSrc)
		end

		CopyFile(srcPath, destPath)

		if MapTextFileNames[name] then
			mod.DebugPrint("Copied plugins_data\\" .. mapTextSrc .. " to Hades II\\Content\\" .. mapTextDest)
		else
			mod.DebugPrint("Copied Hades\\" .. mapTextSrc .. " to Hades II\\Content\\" .. mapTextDest)
		end
	end

	-- Copy over re-encoded .thing_bin files from the plugins_data folder to the game folder
	mod.DebugPrint("Copying re-encoded .thing_bin files (from the mod's \"plugin_data\" folder)...")

	for _, name in ipairs(MapFileNames) do
		local thingBinSrc = _PLUGIN.guid .. "\\Content\\Maps\\bin\\" .. name .. ".thing_bin"
		local thingBinDest = "Maps\\bin\\" .. name .. ".thing_bin"
		local srcPath = rom.path.combine(rom.paths.plugins_data(), thingBinSrc)
		local destPath = rom.path.combine(rom.paths.Content(), thingBinDest)

		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied plugins_data\\" .. thingBinSrc .. " to Hades II\\Content\\" .. thingBinDest)
	end

	mod.DebugPrint("Copying help text files...")
	CopyHadesHelpTexts()

	-- This is done extra, since a LOT of duplicate animations must be removed, and the original file is too large to be hooked into directly
	mod.DebugPrint("Copying Fx animations...")
	CopyHadesFxAnimations()

	-- Check that all files exist
	if not mod.CheckRequiredFiles() then
		error(
			"Required files are missing immediately after first time setup. Please check the log for more information. Do you have Hades installed in the correct folder? Check your config file.")
	end

	-- Copy the Scripts/checksums.txt to the plugins_data folder
	mod.DebugPrint("Copying checksums.txt to be notified after a game update...")

	local checksumsSrc = rom.path.combine(rom.paths.Content(), "Scripts\\checksums.txt")
	local checksumsDest = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid .. "\\checksums.txt")
	CopyFile(checksumsSrc, checksumsDest, true)

	-- Will also update the .cfg file for the user
	config.firstTimeSetup = false

	mod.DebugPrint("Finished first time setup, set config value to false.")
end

-- Ensure that required files exist, i.e. the first time setup has been successfully run
function mod.CheckRequiredFiles()
	-- Ensure pkg files exist
	for src, dest in pairs(PackageFileMappings) do
		local destPath = rom.paths.Content() .. "\\" .. dest
		if not io.open(destPath, "r") then
			mod.DebugPrint("Missing file: " .. destPath)
			return false
		end
	end

	-- Ensure map_text files exist
	for _, name in ipairs(MapFileNames) do
		local mapTextDest = "Maps\\" .. name .. ".map_text"
		local destPath = rom.paths.Content() .. "\\" .. mapTextDest
		if not io.open(destPath, "r") then
			mod.DebugPrint("Missing file: " .. destPath)
			return false
		end
	end

	-- Ensure thing_bin files exist
	for _, name in ipairs(MapFileNames) do
		local thingBinDest = "Maps\\bin\\" .. name .. ".thing_bin"
		local destPath = rom.paths.Content() .. "\\" .. thingBinDest
		if not io.open(destPath, "r") then
			mod.DebugPrint("Missing file: " .. destPath)
			return false
		end
	end

	-- Ensure help text files exist
	for _, language in ipairs(HelpTextLanguages) do
		local helpTextFile = rom.path.combine(rom.paths.Content(),
			'Game\\Text\\' .. language .. '\\HelpTextHades.' .. language .. '.sjson')
		if not io.open(helpTextFile, "r") then
			mod.DebugPrint("Missing file: " .. helpTextFile)
			return false
		end
	end

	return true
end

-- Creates a new helpTextFile for all given languages with any IDs that do not exist in the Hades II help text files
function CopyHadesHelpTexts()
	for _, language in ipairs(HelpTextLanguages) do
		mod.DebugPrint("Copying help text for language: " .. language)

		local helpTextFile = rom.path.combine(rom.paths.Content(),
			'Game\\Text\\' .. language .. '\\HelpText.' .. language .. '.sjson')
		local helpTextData = sjson.decode_file(helpTextFile)

		local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder,
			'Content\\Game\\Text\\' .. language .. '\\HelpText.' .. language .. '.sjson')
		local hadesHelpTextData = sjson.decode_file(hadesHelpTextFile)

		local existingIds = {}
		for _, entry in ipairs(helpTextData.Texts) do
			existingIds[entry.Id] = true
		end

		-- Some entry IDs need to be changed, such as for duplicate enemy names
		-- Merge these tables if there are multiple types of replacements
		local IdRemappings = EnemyNameMappings

		-- Remove all existingIds from hadesHelpTextData - we don't want to overwrite something that already exists in Hades II
		for i = #hadesHelpTextData.Texts, 1, -1 do
			local entry = hadesHelpTextData.Texts[i]
			if IdRemappings[entry.Id] then
				entry.Id = IdRemappings[entry.Id]
			end
			if existingIds[entry.Id] then
				table.remove(hadesHelpTextData.Texts, i)
			end
		end

		-- Encode the hadesHelpTextFile to a new file in the Hades II folder
		local hadesHelpTextFileHades = rom.path.combine(rom.paths.Content(),
			'Game\\Text\\' .. language .. '\\HelpTextHades.' .. language .. '.sjson')
		sjson.encode_file(hadesHelpTextFileHades, hadesHelpTextData)
	end
end

-- Gets the Fx animations from Hades, removes duplicate animations and then writes the new file to the Hades II directory
function CopyHadesFxAnimations()
	local hadesFxFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\Fx.sjson")
	local hadesFxTable = sjson.decode_file(hadesFxFile)

	-- Z_ so the file is loaded last, and any animations these effects inherit from are already loaded
	local destinationFile = rom.path.combine(rom.paths.Content(), HadesFxDestinationFilename)

	-- Before removing duplicates, rename animations for which we need the old version
	mod.RenameSjsonEntries(hadesFxTable.Animations, FxAnimationMappings, "Fx.sjson")
	-- Rename attached animations/Fx graphics
	for oldName, newName in pairs(FxAnimationMappings) do
		mod.UpdateField(hadesFxTable.Animations, oldName, newName, { "ChainTo" }, "Fx.sjson")
	end

	local filteredAnimations = {}
	for _, animation in ipairs(hadesFxTable.Animations) do
		if not HadesFxAnimationDuplicates[animation.Name] then
			table.insert(filteredAnimations, animation)
		end
	end

	hadesFxTable.Animations = filteredAnimations

	sjson.encode_file(destinationFile, hadesFxTable)
end

-- Copies a file from src to dest
function CopyFile(src, dest, skipCheck)
	skipCheck = skipCheck or false
	-- Check if the file already exists
	if not skipCheck then
		if rom.path.exists(dest) then
			mod.DebugPrint("Warning: File already exists and will not be overwritten: " .. dest)
			return
		end
	end

	local inputFile = io.open(src, "rb")
	if not inputFile then
		error("Could not open source file: " .. src)
	end

	local outputFile = io.open(dest, "wb")
	if not outputFile then
		inputFile:close()
		error("Could not open destination file: " .. dest)
	end

	-- Read in blocks to not run out of memory
	while true do
		local block = inputFile:read(1024)
		if not block then break end
		outputFile:write(block)
	end

	inputFile:close()
	outputFile:close()
end
