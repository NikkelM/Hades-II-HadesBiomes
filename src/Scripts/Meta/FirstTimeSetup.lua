local function copyFiles(fileMappings, srcBasePath, destBasePath, fileType)
	mod.DebugPrint("Copying " .. fileType .. " files...", 3)
	for src, dest in pairs(fileMappings) do
		local srcPath = rom.path.combine(mod.hadesGameFolder, srcBasePath .. src)
		local destPath = rom.path.combine(rom.paths.Content(), destBasePath .. dest)
		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied " .. srcBasePath .. src .. " to " .. destBasePath .. dest, 4)
	end
end

local function copyFilesByNames(fileNames, srcBasePath, destBasePath, extension, usePluginData)
	mod.DebugPrint("Copying " .. extension .. " files...", 3)
	for _, name in ipairs(fileNames) do
		local srcPath, destPath
		if usePluginData then
			srcPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, srcBasePath .. name .. extension)
		else
			srcPath = rom.path.combine(mod.hadesGameFolder, srcBasePath .. name .. extension)
		end
		destPath = rom.path.combine(rom.paths.Content(), destBasePath .. name .. extension)
		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied " .. srcPath .. " to " .. destPath, 4)
	end
end

function mod.FirstTimeSetup()
	mod.DebugPrint("Installing the mod...", 3)

	copyFiles(AudioFileMappings, "Content\\Audio\\FMOD\\Build\\Desktop\\", "Audio\\Desktop\\", ".bank")
	copyFiles(PackageFileMappings, "Content\\Win\\Packages\\", "Packages\\", ".pkg")
	copyFiles(BikFileMappings, "Content\\Movies\\", "Movies\\", ".bik")
	copyFiles(SjsonFileMappings, "Content\\Game\\", "Game\\", ".sjson")

	-- Special treatment, as some are copied from the plugins_data, and some from the Hades installation
	mod.DebugPrint("Copying map_text files...", 3)
	for _, name in ipairs(MapFileNames) do
		local srcPath, destPath
		if MapTextFileNames[name] then
			srcPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "Content\\Maps\\" .. name .. ".map_text")
		else
			srcPath = rom.path.combine(mod.hadesGameFolder, "Content\\Maps\\" .. name .. ".map_text")
		end
		destPath = rom.path.combine(rom.paths.Content(), "Maps\\" .. name .. ".map_text")
		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied " .. srcPath .. " to " .. destPath, 4)
	end

	copyFilesByNames(MapFileNames, "Content\\Maps\\bin\\", "Maps\\bin\\", ".thing_bin", true)

	mod.DebugPrint("Copying voicelines...", 3)
	copyFilesByNames(VoiceoverFileNames, "Content\\Audio\\Desktop\\VO\\", "Audio\\Desktop\\VO\\", ".txt", true)
	copyFilesByNames(VoiceoverFileNames, "Content\\Audio\\Desktop\\VO\\", "Audio\\Desktop\\VO\\", ".fsb", true)

	mod.DebugPrint("Copying help text files...", 3)
	CopyHadesHelpTexts()

	mod.DebugPrint("Copying Fx animations...", 3)
	CopyHadesFxAnimations()

	mod.DebugPrint("Copying GUI animations...", 3)
	CopyHadesGUIAnimations()

	if not mod.CheckRequiredFiles() then
		error(
			"Required files are missing immediately after first time setup. Please check the log for more information. Do you have Hades installed in the correct folder? Check your config file.")
	end

	mod.DebugPrint("Caching the games' \"checksums.txt\" to be notified after a game update...", 3)
	local checksumsSrc = rom.path.combine(rom.paths.Content(), "Scripts\\checksums.txt")
	local checksumsDest = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid .. "\\checksums.txt")
	CopyFile(checksumsSrc, checksumsDest, true)

	config.firstTimeSetup = false
	mod.DebugPrint("Finished mod installation and first time setup.", 3)
end

-- Creates a new helpTextFile for all given languages with any IDs that do not exist in the Hades II help text files
function CopyHadesHelpTexts()
	for _, language in ipairs(HelpTextLanguages) do
		mod.DebugPrint("Copying help text for language: " .. language, 4)

		local hadesHelpTextFilePath = rom.path.combine(rom.paths.Content(),
			'Game\\Text\\' .. language .. '\\HelpTextHades.' .. language .. '.sjson')

		if rom.path.exists(hadesHelpTextFilePath) then
			mod.DebugPrint("File already exists and will not be overwritten: " .. hadesHelpTextFilePath, 2)
		else
			local helpTextFile = rom.path.combine(rom.paths.Content(),
				'Game\\Text\\' .. language .. '\\HelpText.' .. language .. '.sjson')
			local helpTextData = mod.DecodeSjsonFile(helpTextFile)

			local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder,
				'Content\\Game\\Text\\' .. language .. '\\HelpText.' .. language .. '.sjson')
			local hadesHelpTextData = mod.DecodeSjsonFile(hadesHelpTextFile)

			local existingIds = {}
			for _, entry in ipairs(helpTextData.Texts) do
				existingIds[entry.Id] = true
			end

			-- Some entry IDs need to be changed, such as for duplicate enemy names
			-- Merge these tables if there are multiple types of replacements
			local IdRemappings = mod.EnemyNameMappings

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
			sjson.encode_file(hadesHelpTextFilePath, hadesHelpTextData)
		end
	end
end

-- Gets the Fx animations from Hades, removes duplicate animations and then writes the new file to the Hades II directory
function CopyHadesFxAnimations()
	local hadesFxFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\Fx.sjson")
	local hadesFxTable = sjson.decode_file(hadesFxFile)

	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesFxDestinationFilename)
	if rom.path.exists(destinationFilePath) then
		mod.DebugPrint("File already exists and will not be overwritten: " .. destinationFilePath, 2)
		return
	end

	-- Before removing duplicates, rename animations for which we need the old version
	mod.RenameSjsonEntries(hadesFxTable.Animations, mod.FxAnimationMappings, "Name", "Fx.sjson")
	-- Rename attached animations/Fx graphics
	for oldName, newName in pairs(mod.FxAnimationMappings) do
		mod.UpdateField(hadesFxTable.Animations, oldName, newName, { "InheritFrom" }, "Fx.sjson")
		mod.UpdateField(hadesFxTable.Animations, oldName, newName, { "ChainTo" }, "Fx.sjson")
	end

	local filteredAnimations = {}
	for _, animation in ipairs(hadesFxTable.Animations) do
		if not mod.HadesFxAnimationDuplicates[animation.Name] then
			table.insert(filteredAnimations, animation)
		end
	end

	hadesFxTable.Animations = filteredAnimations

	sjson.encode_file(destinationFilePath, hadesFxTable)
end

-- Gets the GUI animations from Hades, removes duplicate animations and then writes the new file to the Hades II directory
function CopyHadesGUIAnimations()
	local hadesGUIAnimationsFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\GUIAnimations.sjson")
	local hadesGUIAnimationsTable = sjson.decode_file(hadesGUIAnimationsFile)

	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesGUIAnimationsDestinationFilename)
	if rom.path.exists(destinationFilePath) then
		mod.DebugPrint("File already exists and will not be overwritten: " .. destinationFilePath, 2)
		return
	end

	-- Before removing duplicates, rename animations for which we need the old version
	mod.RenameSjsonEntries(hadesGUIAnimationsTable.Animations, mod.GUIAnimationMappings, "Name", "GUIAnimations.sjson")
	for oldName, newName in pairs(mod.FxAnimationMappings) do
		mod.UpdateField(hadesGUIAnimationsTable.Animations, oldName, newName, { "InheritFrom" }, "GUIAnimations.sjson")
		mod.UpdateField(hadesGUIAnimationsTable.Animations, oldName, newName, { "ChainTo" }, "GUIAnimations.sjson")
	end

	local filteredAnimations = {}
	for _, animation in ipairs(hadesGUIAnimationsTable.Animations) do
		if not mod.HadesGUIAnimationDuplicates[animation.Name] then
			table.insert(filteredAnimations, animation)
		end
	end

	hadesGUIAnimationsTable.Animations = filteredAnimations

	sjson.encode_file(destinationFilePath, hadesGUIAnimationsTable)
end

-- Copies a file from src to dest
function CopyFile(src, dest, skipCheck)
	skipCheck = skipCheck or false
	-- Check if the file already exists
	if not skipCheck then
		if rom.path.exists(dest) then
			mod.DebugPrint("File already exists and will not be overwritten: " .. dest, 2)
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
