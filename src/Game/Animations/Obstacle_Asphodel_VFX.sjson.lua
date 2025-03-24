local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_Asphodel_VFX.sjson")

-- Modifications to existing obstacle animations in Hades II
-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoObstacleModifications = {
	["AsphodelPillar06A"] = {
		ChildAnimation = "null",
		CreateAnimation = "Asphodel_Pillar06TransitionA"
	},
	["AsphodelPillar06B"] = {
		ChildAnimation = "null",
		CreateAnimation = "Asphodel_Pillar06TransitionB"
	},
	["AsphodelPillar06C"] = {
		ChildAnimation = "null",
		CreateAnimation = "Asphodel_Pillar06TransitionC"
	},
}

local addAnimations = {}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing obstacle animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoObstacleModifications)
end)
