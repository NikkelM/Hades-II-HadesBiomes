local hadesTwoItemsGeneralVfxFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Items_General_VFX.sjson")

-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoItemsGeneralVfxModifications = {}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {
	ModsNikkelMHadesBiomes_BossResourceTartarusDrop = {
		Name = "ModsNikkelMHadesBiomes_BossResourceTartarusDrop",
		FilePath = "Particles\\particle_glow",
		ChildAnimation = "ModsNikkelMHadesBiomes_LockKeyDrop",
		Duration = 3,
		StartOffsetZ = -5,
		EndOffsetZ = 5,
		PingPongShiftOverDuration = true,
		Material = "Unlit",
		Red = 0.2,
		Green = 0,
		Blue = 0.5,
		Loop = true,
		Alpha = 0.4,
		EaseIn = 0,
		EaseOut = 1,
	},
	ModsNikkelMHadesBiomes_GemPointObjectFx = {
		Name = "ModsNikkelMHadesBiomes_GemPointObjectFx",
		FilePath = "Fx\\Gems\\Gems",
		VisualFx = "GemSparkles",
		EndFrame = 30,
		Loop = true,
		NumFrames = 30,
		PlaySpeed = 30.0,
		StartFrame = 1,
		Scale = 1.0,
		Ambient = 0.0,
		VisualFxIntervalMax = 0.3,
		VisualFxIntervalMin = 0.2,
		Slides = {
			{ Frame = 13, Sound = "/SFX/GemFlash" },
		},
	},
}
local addAnimations = {
	ModsNikkelMHadesBiomes_LockKeyDrop = {
		Name = "ModsNikkelMHadesBiomes_LockKeyDrop",
		FilePath = "NikkelM-HadesBiomesFxModded\\Resources\\Boss\\Key\\Key",
		NumFrames = 30,
		EndFrame = 30,
		CreateAnimation = "PickupFlare",
		Loop = true,
		PlaySpeed = 30.0,
		StartFrame = 1,
		Scale = 1,
		VisualFx = "LockKeySparkleOutward",
		VisualFxIntervalMax = 0.3,
		VisualFxIntervalMin = 0.2,
		Material = "Unlit",
		PingPongShiftOverDuration = true,
		EaseIn = 0,
		EaseOut = 1,
		LocationZFromOwner = "Ignore",
		OffsetFromParentZ = true,
		AngleFromOwner = "Maintain",
		Slides = {
			{ RandomDurationFramesMin = 2, RandomDurationFramesMax = 30 },
			{ DurationFrames = 2,          Sound = "/Leftovers/World Sounds/Caravan Interior/SmallGlassTap" },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ RandomDurationFramesMin = 2, RandomDurationFramesMax = 6 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
			{ RandomDurationFramesMin = 2, RandomDurationFramesMax = 6 },
			{ DurationFrames = 2 },
			{ DurationFrames = 2 },
		},
	},
	ModsNikkelMHadesBiomes_BossResourceAsphodelDrop = {
		Name = "ModsNikkelMHadesBiomes_BossResourceAsphodelDrop",
		InheritFrom = "ModsNikkelMHadesBiomes_GemPointObjectFx",
		FilePath = "NikkelM-HadesBiomesFxModded\\Resources\\Boss\\SuperGems\\SuperGems",
		PlaySpeed = 20,
		Scale = 1.0,
		CreateAnimations = {
			{ Name = "PickupFlareA" },
		},
	},
	ModsNikkelMHadesBiomes_BossResourceElysiumDrop = {
		Name = "ModsNikkelMHadesBiomes_BossResourceElysiumDrop",
		InheritFrom = "PowerUp01",
	},
	ModsNikkelMHadesBiomes_BossResourceStyxDrop = {
		Name = "ModsNikkelMHadesBiomes_BossResourceStyxDrop",
		CreateAnimation = "PickupFlare",
		FilePath = "NikkelM-HadesBiomesFxModded\\Resources\\Boss\\BloodPickup\\BloodPickup",
		Material = "Unlit",
		Loop = true,
		NumFrames = 40,
		PlaySpeed = 30,
		Scale = 0.9,
		AngleFromOwner = "Ignore",
		StartOffsetZ = 0,
		EndOffsetZ = 10,
		OffsetX = 10,
		PingPongShiftOverDuration = true,
		EaseIn = 0,
		EaseOut = 1,
		VisualFx = "LockKeySparkleOutward",
		VisualFxIntervalMin = 0.1,
		VisualFxIntervalMax = 0.2,
	},
}

sjson.hook(hadesTwoItemsGeneralVfxFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Items_General_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addParentAnimations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoItemsGeneralVfxModifications)
end)
