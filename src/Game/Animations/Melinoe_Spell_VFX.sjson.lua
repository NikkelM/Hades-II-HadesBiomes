local hadesTwoMelinoeSpellVFXFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Melinoe_Spell_VFX.sjson")

local hadesTwoMelinoeSpellVFXModifications = {
	SorceryDebuffMoonLoop = {
		LocationZFromOwner = "Ignore"
	},
	SorceryDebuffMoonLoopIn = {
		LocationZFromOwner = "Ignore"
	},
	SorceryDebuffMoonLoopOut = {
		LocationZFromOwner = "Ignore"
	},
}

sjson.hook(hadesTwoMelinoeSpellVFXFile, function(data)
	mod.RunInstallStep("Melinoe_Spell_VFX")

	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Melinoe_Spell_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoMelinoeSpellVFXModifications)
end)
