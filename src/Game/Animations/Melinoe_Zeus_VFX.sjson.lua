local hadesTwoMelinoeZeusVFXFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Melinoe_Zeus_VFX.sjson")

local hadesTwoMelinoeZeusVFXModifications = {
	ZeusEchoDebuff = {
		ColorFromOwner = "Ignore"
	},
	ZeusEchoDebuffOut = {
		ColorFromOwner = "Ignore"
	},
	ZeusEchoDebuffSwell = {
		ColorFromOwner = "Ignore"
	},
}

sjson.hook(hadesTwoMelinoeZeusVFXFile, function(data)
	mod.RunInstallStep("Melinoe_Zeus_VFX")

	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Melinoe_Zeus_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoMelinoeZeusVFXModifications)
end)
