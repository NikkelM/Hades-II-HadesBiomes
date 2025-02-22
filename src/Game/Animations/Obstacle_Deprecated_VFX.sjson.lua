-- Modifies existing FX animations (none of these should be used by Hades II!)

local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_Deprecated_VFX.sjson")

-- Modifications to existing obstacle animations in Hades II
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

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Apply modifications to existing obstacle animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoObstacleModifications)
end)
