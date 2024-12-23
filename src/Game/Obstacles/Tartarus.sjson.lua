-- Adds obstacles for the Tartarus biome from Hades to Hades II

local hadesTartarusObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Tartarus.sjson")
local hadesTartarusObstacleTable = sjson.decode_file(hadesTartarusObstacleFile)

local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Tartarus.sjson")

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	mod.AddTableKeysSkipDupes(data.Obstacles, hadesTartarusObstacleTable.Obstacles, "Name")
end)
