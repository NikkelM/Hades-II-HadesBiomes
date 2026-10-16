local animationsFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_Crossroads_VFX.sjson")

local addAnimations = {
	{
		Name = "ModsNikkelMHadesBiomesTentFamilyPortrait",
		FilePath =
		"NikkelM-HadesBiomesCrossroads\\Tilesets\\Crossroads\\Crossroads_FamilyPortrait_finished_02",
		Ambient = 0.0,
		AngleFromOwner = "Ignore",
		OffsetY = -15,
		StartFrame = 1,
		EndFrame = 1,
		NumFrames = 1,
		HoldLastFrame = true,
	},
}

sjson.hook(animationsFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Obstacle_Crossroads_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
