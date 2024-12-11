print("First time setup of the mod")

local mod = modutil.mod.Mod.Register(_PLUGIN.guid)

local function copyFile(src, dest)
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

-- Get and copy the .pkg files for the different biomes
print("Copying .pkg files...")

local packageFileMappings = {
	["Content/Win/Packages/Tartarus.pkg"] = "Packages/1080p/TartarusModsNikkelMHadesBiomes.pkg",
	["Content/Win/Packages/Tartarus.pkg_manifest"] = "Packages/1080p/TartarusModsNikkelMHadesBiomes.pkg_manifest",
	["Content/Win/Packages/720p/Tartarus.pkg"] = "Packages/720p/TartarusModsNikkelMHadesBiomes.pkg",
	["Content/Win/Packages/720p/Tartarus.pkg_manifest"] = "Packages/720p/TartarusModsNikkelMHadesBiomes.pkg_manifest",
}

for src, dest in pairs(packageFileMappings) do
	local srcPath = rom.path.combine(mod.hadesGameFolder, src)
	local destPath = rom.path.combine(rom.paths.Content(), dest)

	copyFile(srcPath, destPath)
	print("Copied Hades/" .. src .. " to Hades II/Content/" .. dest)
end

-- Copy .map_text files
print("Copying .map_text files...")

local mapTextFileMappings = {
	["Content/Maps/RoomOpening.map_text"] = "Maps/RoomOpening.map_text",
	["Content/Maps/A_Combat01.map_text"] = "Maps/A_Combat01.map_text",
}

for src, dest in pairs(mapTextFileMappings) do
	local srcPath = rom.path.combine(mod.hadesGameFolder, src)
	local destPath = rom.path.combine(rom.paths.Content(), dest)

	copyFile(srcPath, destPath)
	print("Copied Hades/" .. src .. " to Hades II/Content/" .. dest)
end

--Copy over re-encoded .thing_bin files from the plugins_data folder to the game folder
print("Copying re-encoded .thing_bin files...")

local thingBinFileMappings = {
	[_PLUGIN.guid .. "/RoomOpening.thing_bin"] = "Maps/bin/RoomOpening.thing_bin",
	[_PLUGIN.guid .. "/A_Combat01.thing_bin"] = "Maps/bin/A_Combat01.thing_bin",
}

for src, dest in pairs(thingBinFileMappings) do
	local srcPath = rom.path.combine(rom.paths.plugins_data(), src)
	local destPath = rom.path.combine(rom.paths.Content(), dest)

	copyFile(srcPath, destPath)
	print("Copied plugins_data/" .. src .. " to Hades II/Content/" .. dest)
end

-- Set the config value to false to not do this process again next time the game is run
print("Finished first time setup")
-- TODO: Uncomment once done
-- config.firstTimeSetup = false
