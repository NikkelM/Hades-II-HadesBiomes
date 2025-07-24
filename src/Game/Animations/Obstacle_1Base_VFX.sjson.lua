local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_1Base_VFX.sjson")

-- Modifications to existing obstacle animations in Hades II
-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoObstacleModifications = {}

-- Make sure to add a Name key!
local addAnimations = {
	ModsNikkelMHadesBiomesRubbleFallImpactDecal = {
		Name = "ModsNikkelMHadesBiomesRubbleFallImpactDecal",
		FilePath = "Dev\blank_invisible",
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		GroupName = "FX_Terrain_Liquid",
		Random = {
			{ Name = "ModsNikkelMHadesBiomesRubbleFallImpactDecalA" },
			{ Name = "ModsNikkelMHadesBiomesRubbleFallImpactDecalB" },
			{ Name = "ModsNikkelMHadesBiomesRubbleFallImpactDecalC" },
		},
	},
	ModsNikkelMHadesBiomesRubbleFallImpactDecalA = {
		Name = "ModsNikkelMHadesBiomesRubbleFallImpactDecalA",
		InheritFrom = "RubbleFallImpactDecalA",
		-- To move it behind the HydraTouchdown Fx
		GroupName = "FX_Terrain_Liquid",
	},
	ModsNikkelMHadesBiomesRubbleFallImpactDecalB = {
		Name = "ModsNikkelMHadesBiomesRubbleFallImpactDecalB",
		InheritFrom = "RubbleFallImpactDecalB",
		GroupName = "FX_Terrain_Liquid",
	},
	ModsNikkelMHadesBiomesRubbleFallImpactDecalC = {
		Name = "ModsNikkelMHadesBiomesRubbleFallImpactDecalC",
		InheritFrom = "RubbleFallImpactDecalC",
		GroupName = "FX_Terrain_Liquid",
	},
}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing obstacle animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoObstacleModifications)
end)
