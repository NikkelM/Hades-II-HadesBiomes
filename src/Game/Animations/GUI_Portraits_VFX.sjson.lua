local hadesTwoPortraitsFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Portraits_VFX.sjson")

local hadesTwoPortraitModifications = {
	Portrait_Hades_HelmCape_01 = {
		OffsetY = -90,
	},
	Portrait_Hades_HelmCape_01_Exit = {
		OffsetY = -90,
	},
}

sjson.hook(hadesTwoPortraitsFile, function(data)
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoPortraitModifications)
end)
