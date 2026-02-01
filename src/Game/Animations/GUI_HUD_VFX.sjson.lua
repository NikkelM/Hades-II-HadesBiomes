local hadesTwoHudVfxFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_HUD_VFX.sjson")

-- Make sure to add a Name key!
local addAnimationsParents = {}
local addAnimations = {
	{
		Name = "EliteAttributeSmoked",
		InheritFrom = "EliteAttributeUnknown",
		FilePath = "GUI\\Icons\\Attributes\\Smoked",
	},
}

sjson.hook(hadesTwoHudVfxFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["GUI_HUD_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimationsParents, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
