local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_Deprecated_VFX.sjson")

-- Modifications to existing obstacle animations in Hades II
-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoObstacleModifications = {
	-- TARTARUS
	-- For the reaction animations, they cannot be set as a ChildAnimation, must be in CreateAnimations
	["TartarusPillarBase04A-Fx"] = {
		ChildAnimation = "null",
		CreateAnimation = "TartarusPillarBase04A-Transition",
	},
	["TartarusPillarBase04B-Fx"] = {
		ChildAnimation = "null",
		CreateAnimation = "TartarusPillarBase04B-Transition",
	},
	["TartarusPillarBase04C-Fx"] = {
		ChildAnimation = "null",
		CreateAnimation = "TartarusPillarBase04C-Transition",
	},
	-- ASPHODEL
	AsphodelBoatSunkUnlocked = {
		ChildAnimation = "AsphodelRoomRewardAvailable-Back",
	},
	HealthFountainEmptyAsphodel = {
		ChildAnimation = "ModsNikkelMHadesBiomes-HealthFountainEmptyAsphodelWater",
	},
	-- ELYSIUM
	-- For the reaction animations, they cannot be set as a ChildAnimation, must be in CreateAnimations
	ElysiumPillarB = {
		ChildAnimation = "null",
		CreateAnimation = "Elysium_Pillar04TransitionA",
	},
	ElysiumPillarC = {
		ChildAnimation = "null",
		CreateAnimation = "Elysium_Pillar04TransitionB",
	},
}

local addAnimations = {
	{
		Name = "ModsNikkelMHadesBiomes-RoomRewardAvailable-Front",
		FilePath = "ModsNikkelMHadesBiomes-RoomRewardAvailable-Front\\ModsNikkelMHadesBiomes-RoomRewardAvailable-Front",
		Scale = 1.1,
		Type = "Book",
		AngleFromOwner = "Ignore",
		ColorFromOwner = "Ignore",
		EndFrame = 40,
		Loop = true,
		NumFrames = 40,
		PlaySpeed = 30.0,
		StartFrame = 1,
		ScaleFromOwner = "Ignore",
		Ambient = 0.0,
		OnlyWhenVisible = true,
	},
	-- There is no existing equivalent animation
	{
		Name = "ModsNikkelMHadesBiomes-HealthFountainEmptyAsphodelWater",
		InheritFrom = "HealthFountainFullAsphodelWater",
		VisualFx = nil,
		Alpha = 0.6,
	},
}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing obstacle animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoObstacleModifications)
end)
