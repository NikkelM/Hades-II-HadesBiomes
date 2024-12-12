local packageFileMappings = {
	["Content/Win/Packages/Tartarus.pkg"] = "Packages/1080p/TartarusModsNikkelMHadesBiomes.pkg",
	["Content/Win/Packages/Tartarus.pkg_manifest"] = "Packages/1080p/TartarusModsNikkelMHadesBiomes.pkg_manifest",
	["Content/Win/Packages/720p/Tartarus.pkg"] = "Packages/720p/TartarusModsNikkelMHadesBiomes.pkg",
	["Content/Win/Packages/720p/Tartarus.pkg_manifest"] = "Packages/720p/TartarusModsNikkelMHadesBiomes.pkg_manifest",
}

-- map_text and thing_bin file names
local mapFileNames = {
	-- Tartarus
	"RoomOpening",
	"A_PreBoss01",
	"A_Boss01",
	"A_Boss02",
	"A_Boss03",
	"A_PostBoss01",
	"A_MiniBoss01",
	"A_MiniBoss02",
	"A_MiniBoss03",
	"A_MiniBoss04",
	"A_Shop01",
	"A_Story01",
	"A_Reprieve01",
	"A_Combat01",
	"A_Combat02",
	"A_Combat03",
	"A_Combat04",
	"A_Combat05",
	"A_Combat06",
	"A_Combat07",
	"A_Combat08A",
	"A_Combat08B",
	"A_Combat09",
	"A_Combat10",
	"A_Combat11",
	"A_Combat12",
	"A_Combat13",
	"A_Combat14",
	"A_Combat15",
	"A_Combat16",
	"A_Combat17",
	"A_Combat18",
	"A_Combat19",
	"A_Combat20",
	"A_Combat21",
	-- These two rooms have no RoomData table attached, so we don't need to copy them over
	-- "A_Combat22",
	-- "A_Combat23",
	"A_Combat24",
	"A_Combat25",
	--
}

-- Languages supported by Hades
-- Languages other than english are currently not working, as decoding the file from Hades results in a nil value
local languages = {
	-- "de",
	"en",
	-- "es",
	-- "fr",
	-- "it",
	-- "ja",
	-- "ko",
	-- "pl",
	-- "pt-BR",
	-- "ru",
	-- "zh-CN"
}

function mod.FirstTimeSetup()
	print("Running first time setup of the mod...")

	-- Get and copy the .pkg files for the different biomes
	print("Copying .pkg files...")

	for src, dest in pairs(packageFileMappings) do
		local srcPath = rom.path.combine(mod.hadesGameFolder, src)
		local destPath = rom.path.combine(rom.paths.Content(), dest)

		CopyFile(srcPath, destPath)
		print("Copied Hades/" .. src .. " to Hades II/Content/" .. dest)
	end

	-- Copy .map_text files
	print("Copying .map_text files...")

	for _, name in ipairs(mapFileNames) do
		local mapTextSrc = "Content/Maps/" .. name .. ".map_text"
		local mapTextDest = "Maps/" .. name .. ".map_text"
		local srcPath = rom.path.combine(mod.hadesGameFolder, mapTextSrc)
		local destPath = rom.path.combine(rom.paths.Content(), mapTextDest)

		CopyFile(srcPath, destPath)
		print("Copied Hades/" .. mapTextSrc .. " to Hades II/Content/" .. mapTextDest)
	end

	-- Copy over re-encoded .thing_bin files from the plugins_data folder to the game folder
	print("Copying re-encoded .thing_bin files...")

	for _, name in ipairs(mapFileNames) do
		local thingBinSrc = _PLUGIN.guid .. "/" .. name .. ".thing_bin"
		local thingBinDest = "Maps/bin/" .. name .. ".thing_bin"
		local srcPath = rom.path.combine(rom.paths.plugins_data(), thingBinSrc)
		local destPath = rom.path.combine(rom.paths.Content(), thingBinDest)

		CopyFile(srcPath, destPath)
		print("Copied plugins_data/" .. thingBinSrc .. " to Hades II/Content/" .. thingBinDest)
	end

	print("Copying help text files...")
	CopyHadesHelpTexts()

	-- Check that all files exist
	if not mod.CheckRequiredFiles() then
		error(
			"Required files are missing immediately after first time setup. Please check the log for more information. Do you have Hades installed in the correct folder? Check your config file.")
	end

	-- Will also update the .cfg file for the user
	config.firstTimeSetup = false

	print("Finished first time setup, set config value to false.")
end

-- Ensure that required files exist, i.e. the first time setup has been successfully run
function mod.CheckRequiredFiles()
	-- Ensure pkg files exist
	for src, dest in pairs(packageFileMappings) do
		local destPath = rom.paths.Content() .. "/" .. dest
		if not io.open(destPath, "r") then
			print("Missing file: " .. destPath)
			return false
		end
	end

	-- Ensure map_text files exist
	for _, name in ipairs(mapFileNames) do
		local mapTextDest = "Maps/" .. name .. ".map_text"
		local destPath = rom.paths.Content() .. "/" .. mapTextDest
		if not io.open(destPath, "r") then
			print("Missing file: " .. destPath)
			return false
		end
	end

	-- Ensure thing_bin files exist
	for _, name in ipairs(mapFileNames) do
		local thingBinDest = "Maps/bin/" .. name .. ".thing_bin"
		local destPath = rom.paths.Content() .. "/" .. thingBinDest
		if not io.open(destPath, "r") then
			print("Missing file: " .. destPath)
			return false
		end
	end

	-- Ensure help text files exist
	for _, language in ipairs(languages) do
		local helpTextFile = rom.path.combine(rom.paths.Content(),
			'Game/Text/' .. language .. '/HelpTextHades.' .. language .. '.sjson')
		if not io.open(helpTextFile, "r") then
			print("Missing file: " .. helpTextFile)
			return false
		end
	end

	return true
end

function CopyHadesHelpTexts()
	for _, language in ipairs(languages) do
		print("Copying help text for language: " .. language)

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

		-- Remove all existingIds from hadesHelpTextData - we don't want to overwrite something that already exists in Hades II
		for i = #hadesHelpTextData.Texts, 1, -1 do
			local entry = hadesHelpTextData.Texts[i]
			if existingIds[entry.Id] then
				table.remove(hadesHelpTextData.Texts, i)
			end
		end

		-- Encode the hadesHelpTextFile to a new file in the Hades II folder
		local hadesHelpTextFileHades = rom.path.combine(rom.paths.Content(),
			'Game/Text/' .. language .. '/HelpTextHades.' .. language .. '.sjson')
		sjson.encode_file(hadesHelpTextFileHades, hadesHelpTextData)
	end
end

function CopyFile(src, dest)
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
