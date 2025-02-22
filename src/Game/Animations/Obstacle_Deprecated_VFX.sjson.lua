local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_Deprecated_VFX.sjson")

-- Modifications to existing obstacle animations in Hades II
-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoObstacleModifications = {
	-- For the reaction animations, they cannot be set as a ChildAnimation, must be in CreateAnimations
	["TartarusPillarBase04A-Fx"] = {
		ChildAnimation = "null",
		CreateAnimation = "TartarusPillarBase04A-Transition"
	},
	["TartarusPillarBase04B-Fx"] = {
		ChildAnimation = "null",
		CreateAnimation = "TartarusPillarBase04B-Transition"
	},
	["TartarusPillarBase04C-Fx"] = {
		ChildAnimation = "null",
		CreateAnimation = "TartarusPillarBase04C-Transition"
	},
}

local addAnimations = {}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing obstacle animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoObstacleModifications)
end)
