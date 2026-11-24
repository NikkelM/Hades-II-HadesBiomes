local hadesTwoEnemyEphyraVFXFile =
	rom.path.combine(rom.paths.Content(), "Game\\Animations\\Enemy_Ephyra_VFX.sjson")

local addAnimations = {
	{
		Name = "ModsNikkelMHadesBiomesSnakeVenomFx",
		InheritFrom = "PoisonStatusFx",
		GrannyAttachedMarkerLocation = "head_fxMarker_00_M_JNT",
		OffsetZ = 100,
		ChainTo = "ModsNikkelMHadesBiomesSnakeVenomFxDissipate",
		Sound = "null",
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeVenomFxDissipate",
		InheritFrom = "PoisonStatusFxDissipate",
		GrannyAttachedMarkerLocation = "head_fxMarker_00_M_JNT",
		OffsetZ = 100,
		Sound = "null",
	},
}

sjson.hook(hadesTwoEnemyEphyraVFXFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_Ephyra_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
