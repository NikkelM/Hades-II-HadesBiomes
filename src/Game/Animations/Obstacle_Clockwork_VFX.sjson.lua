local animationsFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Obstacle_Clockwork_VFX.sjson")

local addAnimations = {
	{
		Name = "ModsNikkelMHadesBiomesCWEntranceHadesSymbolIn",
		InheritFrom = "CWEntranceHadesSymbolIn",
		FilePath = "NikkelM-HadesBiomesFxModded\\Fx\\CWEntranceHadesSymbolIn\\CWEntranceHadesSymbolIn",
		ChainTo = "ModsNikkelMHadesBiomesCWEntranceHadesSymbolLoop",
	},
	{
		Name = "ModsNikkelMHadesBiomesCWEntranceHadesSymbolLoop",
		InheritFrom = "CWEntranceHadesSymbolLoop",
		FilePath = "NikkelM-HadesBiomesFxModded\\Fx\\CWEntranceHadesSymbolLoop\\CWEntranceHadesSymbolLoop",
		ChainTo = "ModsNikkelMHadesBiomesCWEntranceHadesSymbolOut",
	},
	{
		Name = "ModsNikkelMHadesBiomesCWEntranceHadesSymbolOut",
		InheritFrom = "CWEntranceHadesSymbolOut",
		FilePath = "NikkelM-HadesBiomesFxModded\\Fx\\CWEntranceHadesSymbolOut\\CWEntranceHadesSymbolOut",
	},
}

sjson.hook(animationsFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Obstacle_Clockwork_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
