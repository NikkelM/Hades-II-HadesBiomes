local hadesTwoAmbienceGeneratorsFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\AmbienceGenerators.sjson")

local hadesTwoObstacleModifications = {
	FogRiverAmbienceGenerator = {
		Thing = {
			-- "/Ambience/ElysiumFogRiverAmbientLoop"
			AmbientSound = "{59158116-1a88-4962-9bf1-2973396be137}",
		},
	},
}

sjson.hook(hadesTwoAmbienceGeneratorsFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["AmbienceGenerators"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.ApplyNestedSjsonModifications(data.Obstacles, hadesTwoObstacleModifications)
end)
