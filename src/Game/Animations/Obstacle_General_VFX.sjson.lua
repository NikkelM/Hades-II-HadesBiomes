local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_General_VFX.sjson")

-- Modifications to existing obstacle animations in Hades II
-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoObstacleModifications = {}

local addAnimations = {
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
}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing obstacle animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoObstacleModifications)
end)
