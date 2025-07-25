-- Copies a file from src to dest
local function copyFile(src, dest, skipCheck)
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
		error("Could not open source file: " .. src .. " - validate your Hades installation and try again.")
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

local function copyFiles(fileMappings, srcBasePath, destBasePath, extension, nameHint, usePluginData)
	nameHint = nameHint or ""
	mod.DebugPrint("Copying " .. nameHint .. extension .. " files...", 3)
	for key, value in pairs(fileMappings) do
		local src, dest
		if type(key) == "number" then
			src = value
			dest = value
		else
			src = key
			dest = value
		end

		local srcPath, destPath
		if usePluginData then
			srcPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, srcBasePath .. src .. extension)
		else
			srcPath = rom.path.combine(mod.hadesGameFolder, srcBasePath .. src .. extension)
		end
		destPath = rom.path.combine(rom.paths.Content(), destBasePath .. dest .. extension)
		copyFile(srcPath, destPath)
		mod.DebugPrint("Copied " .. srcPath .. " to " .. destPath, 4)
	end
end

local function applyModificationsAndCopySjsonFiles(fileMappings, srcBasePath, destBasePath, modifications)
	mod.DebugPrint("Copying .sjson files...", 3)
	for key, value in pairs(fileMappings) do
		local src, dest
		if type(key) == "number" then
			src = value
			dest = value
		else
			src = key
			dest = value
		end

		local srcPath = rom.path.combine(mod.hadesGameFolder, srcBasePath .. src .. ".sjson")
		local destPath = rom.path.combine(rom.paths.Content(), destBasePath .. dest .. ".sjson")

		if not rom.path.exists(destPath) then
			local fileData = mod.DecodeSjsonFile(srcPath)
			mod.ApplyNestedSjsonModifications(fileData.Animations, modifications[src] or {})
			sjson.encode_file(destPath, fileData)
			mod.DebugPrint("Copied " .. srcPath .. " to " .. destPath, 4)
		else
			mod.DebugPrint("File already exists and will not be overwritten: " .. destPath, 2)
		end
	end
end

-- Creates a new helpTextFile for all given languages with any IDs that do not exist in the Hades II help text files
local function copyHadesHelpTexts()
	-- Load the Aliases.sjson file to get required aliases that need to be added as new entries to each language
	local aliasesFilePath = rom.path.combine(mod.hadesGameFolder, 'Content\\Game\\Text\\Aliases.sjson')
	local aliasesDataRaw = mod.DecodeSjsonFile(aliasesFilePath)
	local aliasesData = {}
	-- There's one set for each language. All are the same, so we can just use the first
	if aliasesDataRaw and aliasesDataRaw.HelpTexts and aliasesDataRaw.HelpTexts[1] and aliasesDataRaw.HelpTexts[1].Texts then
		aliasesData = aliasesDataRaw.HelpTexts[1].Texts
	else
		mod.DebugPrint(
			"No aliases found in Aliases.sjson, skipping alias copying. This should not happen - please verify the game files!",
			2)
	end

	for _, language in ipairs(mod.HelpTextLanguages) do
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
					for key, value in pairs(languageModifications[entry.Id]) do
						entry[key] = value
					end
				end
			end

			-- Add aliases
			for _, alias in ipairs(aliasesData) do
				if not existingIds[alias.Id] then
					table.insert(hadesHelpTextData.Texts, alias)
					existingIds[alias.Id] = true
				else
				end
			end

			-- Encode the hadesHelpTextFile to a new file in the Hades II folder
			sjson.encode_file(hadesHelpTextFilePath, hadesHelpTextData)
		end
	end
end

-- Common function to copy and filter animations
local function copyAndFilterAnimations(srcPath, destPath, mappings, duplicates, modifications, additions, animationType)
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

	for _, addition in ipairs(additions) do
		if addition.InheritFrom then
			-- Add it at the end, as it needs to inherit from something else
			table.insert(filteredAnimations, addition)
		else
			-- At to the beginning of the list in case we need to inherit from the addition
			table.insert(filteredAnimations, 1, addition)
		end
	end

	animationsTable.Animations = filteredAnimations

	sjson.encode_file(destPath, animationsTable)
end

local function copyHadesFxAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\Fx.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesFxDestinationFilename)
	local modifications = mod.HadesFxAnimationModifications or {}
	local additions = mod.HadesFxAnimationAdditions or {}
	copyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.FxAnimationMappings, mod.HadesFxAnimationDuplicates,
		modifications, additions, "Fx.sjson")
end

local function copyHadesGUIAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\GUIAnimations.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesGUIAnimationsDestinationFilename)
	local modifications = mod.HadesGUIAnimationModifications or {}
	local additions = mod.HadesGUIAnimationAdditions or {}
	copyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.GUIAnimationMappings, mod.HadesGUIAnimationDuplicates,
		modifications, additions, "GUIAnimations.sjson")
end

local function copyHadesPortraitAnimations()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\PortraitAnimations.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesPortraitAnimationsDestinationFilename)
	local modifications = mod.HadesPortraitAnimationModifications or {}
	local additions = mod.HadesPortraitAnimationAdditions or {}
	copyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.PortraitAnimationMappings,
		mod.HadesPortraitAnimationDuplicates, modifications, additions, "PortraitAnimations.sjson")
end

local function copyHadesCharacterAnimationsNPCs()
	local sourceFilePath = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Animations\\CharacterAnimationsNPCs.sjson")
	local destinationFilePath = rom.path.combine(rom.paths.Content(), mod.HadesCharacterAnimationsNPCsDestinationFilename)
	local modifications = mod.HadesCharacterAnimationsNPCsModifications or {}
	local additions = mod.HadesCharacterAnimationsNPCsAdditions or {}
	copyAndFilterAnimations(sourceFilePath, destinationFilePath, mod.CharacterAnimationsNPCsMappings,
		mod.HadesCharacterAnimationsNPCsDuplicates, modifications, additions, "CharacterAnimationsNPCs.sjson")
end

function mod.FirstTimeSetup()
	mod.DebugPrint("Installing the mod...", 3)

	copyFiles(mod.AudioFileMappings, "Content\\Audio\\FMOD\\Build\\Desktop\\", "Audio\\Desktop\\", ".bank", "Audio ")

	copyFiles(mod.PackageFileMappings, "Content\\Win\\Packages\\", "Packages\\1080p\\", ".pkg", "1080p Hades ")
	copyFiles(mod.PackageFileMappings, "Content\\Win\\Packages\\", "Packages\\1080p\\", ".pkg_manifest", "1080p Hades ")
	copyFiles(mod.PackageFileMappings, "Content\\Win\\Packages\\720p\\", "Packages\\720p\\", ".pkg", "720p Hades ")
	copyFiles(mod.PackageFileMappings, "Content\\Win\\Packages\\720p\\", "Packages\\720p\\", ".pkg_manifest", "720p Hades ")

	copyFiles(mod.BikFileMappings, "Content\\Movies\\", "Movies\\1080p\\", ".bik", "1080p Animation ")
	copyFiles(mod.BikFileMappings, "Content\\Movies\\", "Movies\\1080p\\", ".bik_atlas", "1080p Animation ")
	copyFiles(mod.BikFileMappings, "Content\\Movies\\720p\\", "Movies\\720p\\", ".bik", "720p Animation ")
	copyFiles(mod.BikFileMappings, "Content\\Movies\\720p\\", "Movies\\720p\\", ".bik_atlas", "720p Animation ")

	applyModificationsAndCopySjsonFiles(mod.SjsonFileMappings, "Content\\Game\\", "Game\\", mod.SjsonFileModifications)

	-- Special treatment, as some are copied from the plugins_data, and some from the Hades installation
	mod.DebugPrint("Copying .map_text files...", 3)
	for src, dest in pairs(mod.MapFileMappings) do
		local srcPath, destPath
		if mod.MapTextFileNames[src] then
			srcPath = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid, "Content\\Maps\\" .. src .. ".map_text")
		else
			srcPath = rom.path.combine(mod.hadesGameFolder, "Content\\Maps\\" .. src .. ".map_text")
		end
		destPath = rom.path.combine(rom.paths.Content(), "Maps\\" .. dest .. ".map_text")
		copyFile(srcPath, destPath)
		mod.DebugPrint("Copied " .. srcPath .. " to " .. destPath, 4)
	end

	copyFiles(mod.MapFileMappings, "Content\\Maps\\bin\\", "Maps\\bin\\", ".thing_bin", "Map binary ", true)

	copyFiles(mod.VoiceoverFileNames, "Content\\Audio\\Desktop\\VO\\", "Audio\\Desktop\\VO\\", ".txt", "Voiceline ", true)
	copyFiles(mod.VoiceoverFileNames, "Content\\Audio\\Desktop\\VO\\", "Audio\\Desktop\\VO\\", ".fsb", "Voiceline ", true)

	mod.DebugPrint("Copying help text files...", 3)
	copyHadesHelpTexts()

	mod.DebugPrint("Copying Fx animations...", 3)
	copyHadesFxAnimations()

	mod.DebugPrint("Copying GUI animations...", 3)
	copyHadesGUIAnimations()

	mod.DebugPrint("Copying Portrait animations...", 3)
	copyHadesPortraitAnimations()

	mod.DebugPrint("Copying Character animations...", 3)
	copyHadesCharacterAnimationsNPCs()

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
	copyFile(checksumsSrc, checksumsDest, true)

	config.firstTimeSetup = false
	mod.DebugPrint("Finished mod installation and first time setup.", 3)
end
