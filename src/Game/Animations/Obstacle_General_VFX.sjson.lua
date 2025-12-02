local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_General_VFX.sjson")

-- Modifications to existing obstacle animations in Hades II
-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoObstacleModifications = {}

-- Make sure to add a Name key!
local addAnimations = {
	ModsNikkelMHadesBiomes_SecretDoor_Revealed = {
		Name = "ModsNikkelMHadesBiomes_SecretDoor_Revealed",
		InheritFrom = "SecretDoor_Revealed",
		Sound = "/EmptyCue",
	},
	-- The offsets added to these in Hades II do not match the spawn points in Hades
	ModsNikkelMHadesBiomesBreakableIdle1 = {
		Name = "ModsNikkelMHadesBiomesBreakableIdle1",
		InheritFrom = "BreakableIdle1",
		OffsetY = -50.0
	},
	ModsNikkelMHadesBiomesBreakableIdle2 = {
		Name = "ModsNikkelMHadesBiomesBreakableIdle2",
		InheritFrom = "BreakableIdle2",
		OffsetY = -50.0
	},
	ModsNikkelMHadesBiomesBreakableIdle3 = {
		Name = "ModsNikkelMHadesBiomesBreakableIdle3",
		InheritFrom = "BreakableIdle3",
		OffsetY = -33.0,
	},
	-- For HadesCerberusAssistBombard
	ModsNikkelMHadesBiomesBlastWarningDecal = {
		Name = "ModsNikkelMHadesBiomesBlastWarningDecal",
		InheritFrom = "BlastWarningDecal",
		DieWithOwner = true,
	},
}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Obstacle_General_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoObstacleModifications)
end)
