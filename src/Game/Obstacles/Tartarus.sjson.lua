-- Adds obstacles for the Tartarus biome from Hades to Hades II

local hadesTartarusObstacleFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Obstacles\\Tartarus.sjson")
local hadesTartarusObstacleTable = sjson.decode_file(hadesTartarusObstacleFile)

local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Tartarus.sjson")

-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesTartarusObstacleTable.Obstacles, oldName, newName, { "Thing", "Graphic" }, "Tartarus.sjson")
end

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	mod.AddTableKeysSkipDupes(data.Obstacles, hadesTartarusObstacleTable.Obstacles, "Name")
end)
