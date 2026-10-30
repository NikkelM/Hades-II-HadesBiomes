local hadesTwoFxObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\FX.sjson")

local obstacleAdditions = {
	ModsNikkelMHadesBiomesTartarusBatCluster = {
		Name = "ModsNikkelMHadesBiomesTartarusBatCluster",
		InheritFrom = "TartarusBatCluster",
		Thing = {
			Graphic = "ModsNikkelMHadesBiomesBatCluster",
			Invisible = false,
		},
	},
}

sjson.hook(hadesTwoFxObstacleFile, function(data)
	mod.AddTableKeysSkipDupes(data.Obstacles, obstacleAdditions, "Name")
end)
