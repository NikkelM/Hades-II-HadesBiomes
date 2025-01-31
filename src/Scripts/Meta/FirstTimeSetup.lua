local function copyFiles(fileMappings, srcBasePath, destBasePath, fileType)
	mod.DebugPrint("Copying " .. fileType .. " files...", 3)
	for src, dest in pairs(fileMappings) do
		local srcPath = rom.path.combine(mod.hadesGameFolder, srcBasePath .. src)
		local destPath = rom.path.combine(rom.paths.Content(), destBasePath .. dest)
		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied " .. srcBasePath .. src .. " to " .. destBasePath .. dest, 4)
	end
end

local function copyFilesByNames(fileNames, srcBasePath, destBasePath, extension, fileType, usePluginData)
	mod.DebugPrint("Copying " .. fileType .. " files...", 3)
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

	copyFilesByNames(MapFileNames, "Content\\Maps\\", "Maps\\", ".map_text", ".map_text", false)
	copyFilesByNames(MapFileNames, "Content\\Maps\\bin\\", "Maps\\bin\\", ".thing_bin", ".thing_bin", true)

	mod.DebugPrint("Copying help text files...", 3)
	CopyHadesHelpTexts()

	mod.DebugPrint("Copying Fx animations...", 3)
	CopyHadesFxAnimations()

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

local function checkFilesExist(fileMappings, basePath)
	for src, dest in pairs(fileMappings) do
		local destPath = rom.path.combine(rom.paths.Content(), basePath .. dest)
		if not io.open(destPath, "r") then
			mod.DebugPrint("Missing file: " .. destPath, 1)
			return false
		end
	end
	return true
end

local function checkFilesExistByNames(fileNames, basePath, extension)
	for _, name in ipairs(fileNames) do
		local destPath = rom.path.combine(rom.paths.Content(), basePath .. name .. extension)
		if not io.open(destPath, "r") then
			mod.DebugPrint("Missing file: " .. destPath, 1)
			return false
		end
	end
	return true
end

function mod.CheckRequiredFiles()
	if not checkFilesExist(AudioFileMappings, "Audio\\Desktop\\") then return false end
	if not checkFilesExist(PackageFileMappings, "Packages\\") then return false end
	if not checkFilesExist(BikFileMappings, "Movies\\") then return false end
	if not checkFilesExist(SjsonFileMappings, "Game\\") then return false end
	if not checkFilesExistByNames(MapFileNames, "Maps\\", ".map_text") then return false end
	if not checkFilesExistByNames(MapFileNames, "Maps\\bin\\", ".thing_bin") then return false end

	for _, language in ipairs(HelpTextLanguages) do
		local helpTextFile = rom.path.combine(rom.paths.Content(),
			'Game\\Text\\' .. language .. '\\HelpTextHades.' .. language .. '.sjson')
		if not io.open(helpTextFile, "r") then
			mod.DebugPrint("Missing file: " .. helpTextFile, 1)
			return false
		end
	end

	return true
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

	-- Z_ so the file is loaded last, and any animations these effects inherit from are already loaded
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
