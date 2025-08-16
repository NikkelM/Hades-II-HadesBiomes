local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Obstacle_Deprecated_VFX.sjson")

-- Modifications to existing obstacle animations in Hades II
-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoObstacleModifications = {
	-- #region TARTARUS
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
	-- #endregion

	-- #region ASPHODEL
	AsphodelBoatSunkUnlocked = {
		ChildAnimation = "AsphodelRoomRewardAvailable-Back",
	},
	HealthFountainEmptyAsphodel = {
		ChildAnimation = "ModsNikkelMHadesBiomes-HealthFountainEmptyAsphodelWater",
	},
	-- #endregion

	-- #region ELYSIUM
	-- For the reaction animations, they cannot be set as a ChildAnimation, must be in CreateAnimations
	ElysiumPillarB = {
		ChildAnimation = "null",
		CreateAnimation = "Elysium_Pillar04TransitionA",
	},
	ElysiumPillarC = {
		ChildAnimation = "null",
		CreateAnimation = "Elysium_Pillar04TransitionB",
	},
	-- #endregion

	-- #region STYX
	["StyxPillarB"] = {
		ChildAnimation = "null",
		CreateAnimation = "Styx_Pillar03TransitionA",
	},
	["StyxPillarC"] = {
		ChildAnimation = "null",
		CreateAnimation = "Styx_Pillar03TransitionB",
	},
	["StyxPillarD"] = {
		ChildAnimation = "null",
		CreateAnimation = "Styx_Pillar03TransitionC",
	},
	-- #endregion
}

local addAnimationsParents = {
	-- For Styx
	{
		Name = "PoisonCureFountainFull",
		ChildAnimation = "PoisonCureFountainFullAnim",
		FilePath = "Tilesets\\Styx\\Styx_PoisonCure_01",
		Type = "Constant",
		Sound = "/SFX/PoisonCureFountainBubbleLoop",
		StopSoundOnFinishFade = 0.3,
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		OffsetY = -400.0,
		Scale = 0.4,
		SoundAllowedAfterFrame = -1,
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
	-- For Styx
	{
		Name = "PoisonCureFountainStyxFullStart",
		InheritFrom = "PoisonCureFountainFull",
		ChainTo = "PoisonCureFountainFull",
		Sound = "/EmptyCue",
		Duration = 0.1,
	},
	{
		Name = "PoisonCureFountainSparkles",
		FilePath = "Particles\\particle_snow_03",
		Type = "Constant",
		Angle = 90.0,
		AngleFromOwner = "Ignore",
		AddColor = true,
		EndFrame = 1,
		NumFrames = 1,
		RandomDurationMax = 2.0,
		RandomDurationMin = 1.0,
		StartFrame = 1,
		OffsetZ = 55.0,
		RandomOffsetX = 30.0,
		RandomOffsetY = 2.0,
		LocationFromOwner = "Ignore",
		SortMode = "FromParent",
		VelocityMax = 60.0,
		VelocityMin = 10.0,
		EndScale = 0.0,
		Scale = 0.1,
		ScaleFromOwner = "Ignore",
		ScaleMax = 1.0,
		ScaleMin = 0.5,
		RandomAccelerationMax = -5.0,
		RandomAccelerationMin = -20.0,
		Color = { Red = 0.50, Green = 0.4, Blue = 0.0 },
	},
	{
		Name = "PoisonCureFountainFullAnim",
		ChildAnimation = "PoisonCureFountainGlow",
		FilePath = "Fx\\StyxPoisonCureWater\\StyxPoisonCureWater",
		Type = "Book",
		VisualFx = "PoisonCureFountainSparkles",
		EndFrame = 30,
		Loop = true,
		NumFrames = 30,
		PlaySpeed = 30.0,
		StartFrame = 1,
		OffsetY = -145.0,
		Scale = 1.66,
		Ambient = 0.0,
		VisualFxIntervalMax = 0.12,
		VisualFxIntervalMin = 0.1,
	},
	{
		Name = "PoisonCureFountainGlow",
		FilePath = "Particles\\particle_glow",
		GroupName = "FX_Standing_Add",
		Type = "Constant",
		VisualFx = "PoisonCureFountainGlowSmoke",
		AngleFromOwner = "Ignore",
		ColorFromOwner = "Ignore",
		EndAlpha = 0.25,
		PingPongColor = true,
		StartAlpha = 0.15,
		Duration = 2.0,
		EaseOut = 1.0,
		EndFrame = 1,
		Loop = true,
		NumFrames = 1,
		StartFrame = 1,
		OffsetZ = 100.0,
		DieWithOwner = true,
		SortMode = "FromParent",
		ScaleFromOwner = "Ignore",
		ScaleX = 0.75,
		ScaleY = 1.25,
		Ambient = 0.0,
		VisualFxIntervalMax = 0.6,
		VisualFxIntervalMin = 0.5,
		Color = { Red = 1.0, Green = 0.90, Blue = 0.50 },
	},
	{
		Name = "PoisonCureFountainGlowSmoke",
		FilePath = "Fx\\DeathFxDark\\DeathFxDark",
		GroupName = "FX_Standing_Add",
		Type = "Book",
		AddColor = true,
		AlphaMax = 0.2,
		AlphaMin = 0.1,
		EndAlpha = 1.0,
		PingPongColor = true,
		EaseOut = 1.0,
		EndFrame = 56,
		NumFrames = 56,
		RandomPlaySpeedMax = 30.0,
		RandomPlaySpeedMin = 24.0,
		StartFrame = 1,
		RandomFlipHorizontal = true,
		OffsetZ = -30.0,
		OriginX = 182.0,
		OriginY = 328.0,
		RandomOffsetX = 30.0,
		DieWithOwner = true,
		LocationZFromOwner = "Ignore",
		SortMode = "FromParent",
		EndScaleY = 1.5,
		Scale = 2.0,
		ScaleMax = 1.0,
		ScaleMin = 0.6,
		Ambient = 0.0,
		Color = { Red = 1.0, Green = 0.90, Blue = 0.4 },
	},
	{
		Name = "PoisonCureFountainEmpty",
		InheritFrom = "PoisonCureFountainFull",
		ChildAnimation = "null",
		FilePath = "Tilesets\\Styx\\Styx_PoisonCure_01b",
		Sound = "/EmptyCue",
		Saturation = -0.2,
		Color = { Red = 0.6, Green = 0.70, Blue = 0.8 },
	},
}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addAnimationsParents, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing obstacle animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoObstacleModifications)
end)
