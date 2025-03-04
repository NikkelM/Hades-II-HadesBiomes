local function copyFiles(fileMappings, srcBasePath, destBasePath, extension, nameHint, usePluginData)
	nameHint = nameHint or ""
	mod.DebugPrint("Copying " .. nameHint .. extension .. " files...", 3)
	for src, dest in pairs(fileMappings) do
		local srcPath, destPath
		if usePluginData then
			srcPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, srcBasePath .. src .. extension)
		else
			srcPath = rom.path.combine(mod.hadesGameFolder, srcBasePath .. src .. extension)
		end
		destPath = rom.path.combine(rom.paths.Content(), destBasePath .. dest .. extension)
		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied " .. srcPath .. " to " .. destPath, 4)
	end
end

function mod.FirstTimeSetup()
	mod.DebugPrint("Installing the mod...", 3)

	copyFiles(AudioFileMappings, "Content\\Audio\\FMOD\\Build\\Desktop\\", "Audio\\Desktop\\", ".bank", "Audio ")

	copyFiles(PackageFileMappings, "Content\\Win\\Packages\\", "Packages\\1080p\\", ".pkg", "1080p Hades ")
	copyFiles(PackageFileMappings, "Content\\Win\\Packages\\", "Packages\\1080p\\", ".pkg_manifest", "1080p Hades ")
	copyFiles(PackageFileMappings, "Content\\Win\\Packages\\720p\\", "Packages\\720p\\", ".pkg", "720p Hades ")
	copyFiles(PackageFileMappings, "Content\\Win\\Packages\\720p\\", "Packages\\720p\\", ".pkg_manifest", "720p Hades ")

	copyFiles(CustomPackageFileNames, "Content\\Packages\\", "Packages\\1080p\\", ".pkg", "1080p Mod ", true)
	copyFiles(CustomPackageFileNames, "Content\\Packages\\", "Packages\\1080p\\", ".pkg_manifest", "1080p Mod ", true)
	copyFiles(CustomPackageFileNames, "Content\\Packages\\", "Packages\\720p\\", ".pkg", "720p Mod ", true)
	copyFiles(CustomPackageFileNames, "Content\\Packages\\", "Packages\\720p\\", ".pkg_manifest", "720p Mod ", true)

	copyFiles(BikFileMappings, "Content\\Movies\\", "Movies\\1080p\\", ".bik", "1080p Animation ")
	copyFiles(BikFileMappings, "Content\\Movies\\", "Movies\\1080p\\", ".bik_atlas", "1080p Animation ")
	copyFiles(BikFileMappings, "Content\\Movies\\720p\\", "Movies\\720p\\", ".bik", "720p Animation ")
	copyFiles(BikFileMappings, "Content\\Movies\\720p\\", "Movies\\720p\\", ".bik_atlas", "720p Animation ")

	copyFiles(SjsonFileMappings, "Content\\Game\\", "Game\\", ".sjson")

	-- Special treatment, as some are copied from the plugins_data, and some from the Hades installation
	mod.DebugPrint("Copying .map_text files...", 3)
	for src, dest in pairs(MapFileMappings) do
		local srcPath, destPath
		if MapTextFileNames[src] then
			srcPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "Content\\Maps\\" .. src .. ".map_text")
		else
			srcPath = rom.path.combine(mod.hadesGameFolder, "Content\\Maps\\" .. src .. ".map_text")
		end
		destPath = rom.path.combine(rom.paths.Content(), "Maps\\" .. dest .. ".map_text")
		CopyFile(srcPath, destPath)
		mod.DebugPrint("Copied " .. srcPath .. " to " .. destPath, 4)
	end

	copyFiles(MapFileMappings, "Content\\Maps\\bin\\", "Maps\\bin\\", ".thing_bin", "Map binary ", true)

	copyFiles(VoiceoverFileNames, "Content\\Audio\\Desktop\\VO\\", "Audio\\Desktop\\VO\\", ".txt", "Voiceline ", true)
	copyFiles(VoiceoverFileNames, "Content\\Audio\\Desktop\\VO\\", "Audio\\Desktop\\VO\\", ".fsb", "Voiceline ", true)

	mod.DebugPrint("Copying help text files...", 3)
	CopyHadesHelpTexts()

	mod.DebugPrint("Copying Fx animations...", 3)
	CopyHadesFxAnimations()

	mod.DebugPrint("Copying GUI animations...", 3)
	CopyHadesGUIAnimations()

	mod.DebugPrint("Copying Portrait animations...", 3)
	CopyHadesPortraitAnimations()

	mod.DebugPrint("Copying Character animations for NPCs...", 3)
	CopyHadesCharacterAnimationsNPCs()

	local numMissingFiles = mod.CheckRequiredFiles(false)
	if numMissingFiles > 0 then
		mod.DebugPrint(
			"A total of " .. numMissingFiles ..
			" required files are missing immediately after first time setup. Please check the log for more information. Do you have Hades installed in the correct folder? Check the \"hadesGameFolder\" setting in your config file.",
			1)
		return
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

			local languageModifications = mod.HadesHelpTextModifications[language] or {}

			-- Remove all existingIds from hadesHelpTextData - we don't want to overwrite something that already exists in Hades II
			for i = #hadesHelpTextData.Texts, 1, -1 do
				local entry = hadesHelpTextData.Texts[i]
				-- Some entry IDs need to be changed, such as for duplicate enemy names
				-- Merge these tables if there are multiple types of replacements
				if mod.EnemyNameMappings[entry.Id] then
					entry.Id = mod.EnemyNameMappings[entry.Id]
				end
				if existingIds[entry.Id] then
					table.remove(hadesHelpTextData.Texts, i)
				elseif languageModifications[entry.Id] then
					mod.DebugPrint("Help text entry " .. entry.Id .. " has modifications in the mod", 2)
					for key, value in pairs(languageModifications[entry.Id]) do
						entry[key] = value
					end
				end
			end

			-- Encode the hadesHelpTextFile to a new file in the Hades II folder
			sjson.encode_file(hadesHelpTextFilePath, hadesHelpTextData)
		end
	end
end

-- Common function to copy and filter animations
local function CopyAndFilterAnimations(srcPath, destPath, mappings, duplicates, modifications, animationType)
	local animationsTable = sjson.decode_file(srcPath)

	if rom.path.exists(destPath) then
		mod.DebugPrint("File already exists and will not be overwritten: " .. destPath, 2)
		return
	end

	-- Before removing duplicates, rename animations for which we need the old version
	mod.RenameSjsonEntries(animationsTable.Animations, mappings, "Name", animationType)
	for oldName, newName in pairs(mappings) do
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "InheritFrom" }, animationType)
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "ChainTo" }, animationType)
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "ChildAnimation" }, animationType)
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "CreateAnimation" }, animationType)
		mod.UpdateField(animationsTable.Animations, oldName, newName, { "CreateAnimations" }, animationType)
	end

	local filteredAnimations = {}
	for _, animation in ipairs(animationsTable.Animations) do
		if not duplicates[animation.Name] then
			if modifications[animation.Name] then
				for key, value in pairs(modifications[animation.Name]) do
					animation[key] = value
				end
			end
			table.insert(filteredAnimations, animation)
		end
	end

	animationsTable.Animations = filteredAnimations

	sjson.encode_file(destPath, animationsTable)
end

function CopyHadesFxAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\Fx.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesFxDestinationFilename)
	local modifications = mod.HadesFxAnimationModifications
	CopyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.FxAnimationMappings, mod.HadesFxAnimationDuplicates,
		modifications, "Fx.sjson")
end

function CopyHadesGUIAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\GUIAnimations.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesGUIAnimationsDestinationFilename)
	local modifications = {}
	CopyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.GUIAnimationMappings, mod.HadesGUIAnimationDuplicates,
		modifications, "GUIAnimations.sjson")
end

function CopyHadesPortraitAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\PortraitAnimations.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesPortraitAnimationsDestinationFilename)
	local modifications = mod.HadesPortraitAnimationModifications
	CopyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.PortraitAnimationMappings,
		mod.HadesPortraitAnimationDuplicates, modifications, "PortraitAnimations.sjson")
end

function CopyHadesCharacterAnimationsNPCs()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\CharacterAnimationsNPCs.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesCharacterAnimationsNPCsDestinationFilename)
	local modifications = {}
	CopyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.CharacterAnimationsNPCsMappings,
		mod.HadesCharacterAnimationsNPCsDuplicates, modifications, "CharacterAnimationsNPCs.sjson")
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
