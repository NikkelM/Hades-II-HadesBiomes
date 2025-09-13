local hadesTwoPortraitsFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Portraits_VFX.sjson")

local hadesTwoPortraitModifications = {
	Portrait_Hades_HelmCape_01 = {
		OffsetY = -91,
	},
}

sjson.hook(hadesTwoPortraitsFile, function(data)
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoPortraitModifications)
end)
