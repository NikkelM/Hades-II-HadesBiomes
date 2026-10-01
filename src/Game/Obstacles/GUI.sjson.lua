local hadesTwoGUIObstaclesFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\GUI.sjson")

local newData = {
	ModsNikkelMHadesBiomesAssistSlotButton = {
		Name = "ModsNikkelMHadesBiomesAssistSlotButton",
		InheritFrom = "BaseInteractableButton",
		Thing = {
			Points = {
				{ X = -75, Y = 92.5 },
				{ X = 75,  Y = 92.5 },
				{ X = 75,  Y = -92.5 },
				{ X = -75, Y = -92.5 },
			},
		},
	},
}

sjson.hook(hadesTwoGUIObstaclesFile, function(data)
	mod.RunInstallStep("GUI")

	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["GUI"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Obstacles, newData, "Name")
end)
