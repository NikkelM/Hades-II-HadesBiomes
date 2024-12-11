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

local fileNames = {
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
	-- These two rooms have no RoomData table attached, so we don't need to copy them over as well
	-- "A_Combat22",
	-- "A_Combat23",
	"A_Combat24",
	"A_Combat25",
	--
}

-- Copy .map_text files
print("Copying .map_text files...")

for _, name in ipairs(fileNames) do
	local mapTextSrc = "Content/Maps/" .. name .. ".map_text"
	local mapTextDest = "Maps/" .. name .. ".map_text"
	local srcPath = rom.path.combine(mod.hadesGameFolder, mapTextSrc)
	local destPath = rom.path.combine(rom.paths.Content(), mapTextDest)

	copyFile(srcPath, destPath)
	print("Copied Hades/" .. mapTextSrc .. " to Hades II/Content/" .. mapTextDest)
end

-- Copy over re-encoded .thing_bin files from the plugins_data folder to the game folder
print("Copying re-encoded .thing_bin files...")

for _, name in ipairs(fileNames) do
	local thingBinSrc = _PLUGIN.guid .. "/" .. name .. ".thing_bin"
	local thingBinDest = "Maps/bin/" .. name .. ".thing_bin"
	local srcPath = rom.path.combine(rom.paths.plugins_data(), thingBinSrc)
	local destPath = rom.path.combine(rom.paths.Content(), thingBinDest)

	copyFile(srcPath, destPath)
	print("Copied plugins_data/" .. thingBinSrc .. " to Hades II/Content/" .. thingBinDest)
end

-- Set the config value to false to not do this process again next time the game is run
print("Finished first time setup")
-- TODO: Uncomment once done
config.firstTimeSetup = false
