-- Adds RoomData for Tartarus from Hades to Hades II
local roomReplacements = {
	-- GENERIC
	BaseTartarus = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Zagreus' Journey
		AnomalyDoorChance = 0.0,
		RoomSetName = "Tartarus",
		-- The animations are also defined in Hades II, and are misaligned for the spawn points on Hades maps
		BreakableOptions = { "ModsNikkelMHadesBiomesBreakableIdle1", "ModsNikkelMHadesBiomesBreakableIdle2", "ModsNikkelMHadesBiomesBreakableIdle3" },

		WellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation" },
			},
			RequiredMinBiomeDepth = 4,
			RequiredMinCompletedRuns = 1,
			RequiredMinRoomsSinceWellShop = 3,
		},
		SellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation" },
			},
			RequiredMinBiomeDepth = 4,
			RequiredMinCompletedRuns = 1,
			RequiredUpgradeableGodTraits = 3,
			RequiredMinRoomsSinceSellTraitShop = 6,
		},
		ShrinePointDoorRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockShrinePointGatesIncantation" },
			},
			{
				PathTrue = { "GameState", "ScreensViewed", "Shrine" },
			},
			{
				PathFalse = { "CurrentRun", "ActiveBounty" },
			},
			RequiredMinRoomsSinceShrinePointDoor = 8,
		},

		HasHarvestPoint = true,
		HasShovelPoint = true,
		HasPickaxePoint = true,
		HasExorcismPoint = true,
		HasFishingPoint = true,

		HarvestPointRequirements = {
			{
				SumPrevRooms = 3,
				Path = { "NumHarvestPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantTartarus" },
						Comparison = "<",
						Value = 8,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
		ShovelPointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				SumPrevRooms = 4,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedTartarus" },
						Comparison = "<",
						Value = 12,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 2,
						Path = { "NumPickaxePoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
		PickaxePointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				SumPrevRooms = 4,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreTartarus" },
						Comparison = "<",
						Value = 20,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 2,
						Path = { "NumShovelPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
		ExorcismPointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
			{
				Path = { "CurrentRun", "BiomeDepthCache" },
				Comparison = ">=",
				Value = 2,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					OrRequirements = {
						{
							{
								Path = { "GameState", "LifetimeResourcesGained", "MemPointsCommon" },
								Comparison = "<=",
								Value = 1500,
							},
						},
						{
							{
								Path = { "GameState", "ExorcisedNames", "3dGhostIdle" },
								Comparison = "<",
								Value = 2,
							},
						},
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 2,
						Path = { "NumFishingPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
		FishingPointRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				SumPrevRooms = 5,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", },
						NotHasAll = { "Fish_Tartarus_Common_01", "Fish_Tartarus_Rare_01", "Fish_Tartarus_Legendary_01" },
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 2,
						Path = { "NumExorcismPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
	},

	-- OPENING ROOMS
	RoomOpening = {
		-- Music
		MusicActiveStems = { "Guitar", "Drums", "Bass", },
		Music = mod.NilValue,
		MusicRequirements = mod.NilValue,
		-- Will be set in the encounter instead
		UnthreadedEvents = mod.NilValue,

		EnterVoiceLines = {
			-- First run
			{
				BreakIfPlayed = true,
				RequiredCompletedRuns = 0,
				PreLineWait = 0.9,
				{ Cue = "/VO/MelinoeField_1418", Text = "For my brother!" }
			},
			-- Afterwards
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 0.7,
				RequiredMinCompletedRuns = 1,
				Cooldowns = {
					{ Name = "MelRunStartSpeech", Time = 12 },
				},
				{ Cue = "/VO/MelinoeField_4814", Text = "In the name of Hades." },
				{ Cue = "/VO/Melinoe_0115",      Text = "For my family." },
				{
					Cue = "/VO/MelinoeField_4348",
					Text = "Just like before.",
					GameStateRequirements = {
						{
							PathTrue = { "PrevRun", "Cleared" }
						},
					},
				},
				{ Cue = "/VO/MelinoeField_4349", Text = "Ensuring victory.", },
				{ Cue = "/VO/Melinoe_1666",      Text = "Strength; knowledge; patience." },
				{ Cue = "/VO/Melinoe_0381",      Text = "This is my path.", },
				{ Cue = "/VO/Melinoe_0120",      Text = "No pressure." },
				{ Cue = "/VO/Melinoe_0382",      Text = "No holding back." },
				{
					Cue = "/VO/Melinoe_0383",
					Text = "I will not fail.",
					GameStateRequirements = {
						{
							PathFalse = { "PrevRun", "Cleared" }
						},
					},
				},
				{ Cue = "/VO/Melinoe_0118",      Text = "All right." },
				{ Cue = "/VO/MelinoeField_0784", Text = "Let's see how this goes..." },
				-- From BountyStart
				{ Cue = "/VO/Melinoe_5505",      Text = "...So strange..." },
			},
		},

		HarvestPointChances = { 0.1, },
		ShovelPointChance = 0.1,
		PickaxePointChance = 0.1,
		ExorcismPointChance = 0.1,
		FishingPointChance = 0.1,
		HarvestPointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				SumPrevRooms = 3,
				Path = { "NumHarvestPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantTartarus" },
						Comparison = "<",
						Value = 8,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.6,
				},
			},
		},
		-- Same as BaseTartarus, but RoomOpening would redefine it with a Hades I unlock condition
		FishingPointRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				SumPrevRooms = 5,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},

			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", },
						NotHasAll = { "Fish_Tartarus_Common_01", "Fish_Tartarus_Rare_01", "Fish_Tartarus_Legendary_01" },
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 2,
						Path = { "NumExorcismPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
	},

	RoomSimple01 = {
		ForceIfEncounterNotCompleted = mod.NilValue,
		LegalEncounters = { "GeneratedTartarus", },
		ForcedRewardStore = mod.NilValue,
		ForcedRewards = mod.NilValue,
		ForceCommonLootFirstRun = mod.NilValue,
		ForceLootTableFirstRun = mod.NilValue,
	},

	-- SHOPS
	A_Shop01 = {
		Binks = mod.NilValue,
	},
	A_PreBoss01 = {
		Binks = mod.NilValue,
	},

	A_PostBoss01 = {
		EnterVoiceLines = {
			Cooldowns = {
				{ Name = "MelinoeAnyQuipSpeech" },
			},
			{
				PreLineWait = 2,
				RandomRemaining = true,
				BreakIfPlayed = true,
				SuccessiveChanceToPlay = 0.5,
				{ Cue = "/VO/Melinoe_0381",      Text = "This is my path.",              PlayFirst = true },
				{ Cue = "/VO/MelinoeField_1105", Text = "I think I'm finished here." },
				{ Cue = "/VO/Melinoe_0339",      Text = "I've come this far..." },
				{ Cue = "/VO/Melinoe_0383",      Text = "I will not fail." },
				{ Cue = "/VO/Melinoe_1666",      Text = "Strength; knowledge; patience." },
				{ Cue = "/VO/Melinoe_0137",      Text = "Onward." },
				{ Cue = "/VO/Melinoe_2993",      Text = "All right." },
				{ Cue = "/VO/MelinoeField_0560", Text = "All quiet." },
			},
		},
	},
}

local roomModifications = {
	-- GENERIC
	BaseTartarus = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicModded", "ModsNikkelMHadesBiomesMusicTartarusModded", },

		NarrativeContextArt = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus",

		Ambience = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE",
		ReverbValue = 2.0,
		MusicActiveStems = { "Bass" },

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Tartarus",

		TimeChallengeEncounterOptions = { "TimeChallengeTartarus" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeTartarus" },
		EliteChallengeEncounterOptions = { "EliteChallengeTartarus" },

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerTartarusIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerTartarusOut",

		CombatOverMusicEvents = mod.CombatOverMusicEvents.Generic,

		-- From 0.45
		TargetMetaRewardsRatio = 0.35,
	},

	-- OPENING ROOMS
	RoomOpening = {
		InheritFrom = { "BaseTartarus", "BiomeStartRoom", },
		LegalEncounters = { "OpeningGenerated" },
		EntranceFunctionName = "RoomEntranceDrop",
		EntranceFunctionArgs = { LandingAnimation = "Melinoe_HeroLanding", Sound = "/SFX/Player Sounds/MelWhooshDropIn", IntroHoldDuration = 2.34, StartZoomFraction = 0.65, ZoomDuration = 4 },
		ThreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "DisplayLocationText", Args = { AnimationName = "ModsNikkelMHadesBiomesInfoBannerTartarusIn", AnimationOutName = "ModsNikkelMHadesBiomesInfoBannerTartarusOut" }, },
			-- The Codex can't be opened in this room until the combat is completed, so we don't want to show the unlock notification early. It will be unlocked after the combat automatically
			[2] = mod.NilValue, -- { FunctionName = _PLUGIN.guid .. "." .. "CheckLocationUnlock", Args = { Biome = "Tartarus" } },
			-- This will work with roomSetDataTartarus.RoomOpening.ThreadedEvents[3].Args.SpawnTypes = { "TartarusGhost01" }, but has the problem of spawning all Ghosts on the same ID
			[3] = mod.NilValue
		},
		StartUnthreadedEvents = {
			-- Don't start the demo presentation mode
			[1] = mod.NilValue,
			-- Don't play the standard music event, it won't be able to get changed later
			[3] = mod.NilValue,
		},
		-- "/Leftovers/Ambience/MatchSiteIPoolAmbience"
		Ambience = "{e65b32ad-3a7e-4f88-9149-3260e929f04c}",
		PlayBiomeMusic = true,
		MusicSection = 0,
		MusicStartDelay = 1.75,
		-- Requires AthenaFirstPickup voiceline, which is not implemented
		ChooseRewardRequirements = mod.NilValue,
		ForcedRewards = mod.NilValue,
		IneligibleRewards = game.RewardSets.OpeningRoomBans,
		BlockGiftBoons = true,
		MaxAppearancesThisBiome = 1,
		BlockRunProgressUI = true,
		DisableRewardMagnetisim = true,
		StartThreadedEvents = {
			{ FunctionName = "CheckBiomeStateStart" },
			{ FunctionName = "ShadeMercManager",    Args = { StartingCountMin = 3, StartingCountMax = 12, ObjectNames = { "ShadeMerc" }, MaxActive = 12 } },
		},
		InspectPoints = {
			[410183] = {
				RequiredAnyTextLines = mod.NilValue,
			},
		},
	},

	-- GENERIC ROOMS
	A_Combat10 = {
		-- "/Leftovers/Ambience/MatchSiteIPoolAmbience"
		Ambience = "{e65b32ad-3a7e-4f88-9149-3260e929f04c}",
	},

	-- SHOPS
	A_Shop01 = {
		ThreadedEvents = {
			-- To get PatrolPath working, see RoomOpening
			[1] = mod.NilValue,
			[2] = mod.NilValue
		},
		StoreDataName = "WorldShop",
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,

		InspectPoints = {
			[515864] = {
				InteractTextLineSets = {
					CharonFirstInspect = mod.NilValue,
					ModsNikkelMHadesBiomes_CharonSecondInspect = {
						-- Too bad I can't just take the ferry to the surface.
						EndCue = "/VO/ZagreusField_1473",
						EndWait = 0.3,
						{
							Cue = "/VO/Storyteller_0221",
							Text =
							"{#DialogueItalicFormat}The River Styx flows infamously through the Underworld, offering the boatman Charon expeditious travel from the realm of mortals to the lowest depths, where many of their shades reside forever."
						},
					},
				},
			},
		},

		ShovelPointChance = 0.35,
		PickaxePointChance = 0.35,
		ExorcismPointChance = 0.25,
		FishingPointChance = 0.25,
	},
	A_PreBoss01 = {
		SkipLastKillPresentation = true,
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,

		-- Disable all music if it's a free reward room (no Charon/Shop)
		IgnoreStemMixer = true,
		MusicMutedStems = { "Drums", "Bass", "Guitar", },

		ShovelPointChance = 0.35,
		PickaxePointChance = 0.35,
		ExorcismPointChance = 0.25,
		FishingPointChance = 0.25,
	},

	-- MINIBOSSES
	-- Other miniboss rooms inherit from this
	A_MiniBoss01 = {
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
		ThreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "MiniBossRoomPresentation" },
		},
	},

	-- BOSSES
	A_Boss01 = {
		LoadModdedVoiceBanks = { "Megaera*", "Alecto*", "Tisiphone*", "ZagreusField" },
		-- "/Leftovers/Ambience/CreepyHauntedWindLoop"
		Ambience = "{32411cfc-6220-4c71-a3b7-d39d6ec62214}",
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		-- Replaces MegaeraHome with Megaera voicelines
		UnthreadedEvents = {
			[1] = {
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro",
				Args = {
					VoiceLines = {
						[1] = { Cue = "/VO/Megaera_0061" },
						[2] = { Cue = "/VO/Megaera_0053", RequiredPlayed = { "/VO/Megaera_0061" }, },
						[4] = { Cue = "/VO/Megaera_0057", },
					},
					DelayedStart = true,
				},
			},
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryIntro" },
		},
		ForcedReward = "ModsNikkelMHadesBiomes_BossResourceTartarusDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
		BackupCauseOfDeath = "Harpy",

		HasFishingPoint = false,
		HasPickaxePoint = false,
		ShovelPointChance = 0.3,
	},
	A_Boss02 = {
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		GameStateRequirements = {
			RequiredKills = { Harpy = 4 },
		},
		UnthreadedEvents = {
			[1] = {
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro",
				Args = {
					DelayedStart = true,
				},
			},
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryIntro" },
		},

		HasFishingPoint = false,
		HasPickaxePoint = false,
		ShovelPointChance = 0.3,
	},
	A_Boss03 = {
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		GameStateRequirements = {
			RequiredKills = { Harpy = 4 },
		},
		UnthreadedEvents = {
			[1] = {
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro",
				Args = {
					DelayedStart = true,
				},
			},
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryIntro" },
		},
		PostCombatReloadEvents = {
			{ FunctionName = _PLUGIN.guid .. "." .. "Harpy3MapRestore" },
		},
		RestorePresentationFunction = mod.NilValue,

		-- Tisiphone adds walls during her fight, so gatherables would become inaccessible
		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasExorcismPoint = false,
		HasFishingPoint = false,
	},

	-- OTHER
	A_Story01 = {
		ThreadedEvents = {
			[1] = mod.NilValue
		},
		LoadModdedVoiceBanks = { "Sisyphus", "ZagreusField" },
		RewardPreviewOverride = "ModsNikkelMHadesBiomes_StoryPreview",

		HasFishingPoint = false,
		HarvestPointChances = { 0.4, 0.1, },
		ShovelPointChance = 0.35,
		PickaxePointChance = 0.35,
		ExorcismPointChance = 0.35,

		HarvestPointRequirements = {
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantTartarus" },
						Comparison = "<",
						Value = 13,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
		ShovelPointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedTartarus" },
						Comparison = "<",
						Value = 6,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
		PickaxePointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},

			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreTartarus" },
						Comparison = "<",
						Value = 20,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
	},
	A_Reprieve01 = {
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
		SuppressRewardSpawnSounds = false,

		HarvestPointChances = { 0.5, 0.3, },
		ShovelPointChance = 0.2,
		PickaxePointChance = 0.3,
		ExorcismPointChance = 0.2,
		FishingPointChance = 0.15,
	},
	A_PostBoss01 = {
		-- For Intercom
		LoadModdedVoiceBanks = { "HadesField" },
		-- "/Leftovers/Ambience/CreepyHauntedWindLoop"
		Ambience = "{32411cfc-6220-4c71-a3b7-d39d6ec62214}",
		ExitPreviewAnim = "ModsNikkelMHadesBiomes_ExitPreview",
		ThreadedEvents = {
			[1] = { FunctionName = "HadesSpeakingPresentation", Args = { VoiceLines = game.GlobalVoiceLines.HadesPostBossVoiceLines, StartDelay = 2.5 } },
		},
		NextRoomSet = { "Asphodel" },
		-- In vanilla the game adds a SetupGameStateRequirement to the obstacle, but we don't do that in modded rooms
		-- So to prevent the well from spawning even without the incantation, we set ForceWellShop to false and just use the WellShopSpawnChance
		ForceWellShop = false,
		-- Defines where the well spawns, making sure the sell shop spawns on the other possible ID. Available IDs are 480768 and 487438
		WellShopChallengeBaseId = 487438,
		WellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockPostBossWellShopsIncantation" },
			},
		},
		SellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockPostBossSellShopsIncantation" },
			},
		},
		ObstacleData = {
			[486504] = {
				SetupGameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossGiftRack" },
					},
					RequiredCosmetics = mod.NilValue,
				},
			},
			-- Makes the exit door interactable
			[430000] = {
				ActivateIds = { 430000, },
			},
		},
		LeavePostPresentationEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBiomeMapPresentation",
				Args = {
					HeroStartOffsetX = -100,
					HeroStartOffsetY = 500,
					FamiliarStartOffsetX = -200,
					FamiliarStartOffsetY = 550,

					HeroMoveOffsetX = 365,
					HeroMoveOffsetY = -455,
					HeroMoveDuration = 1.8,
					FamiliarMoveOffsetX = 365,
					FamiliarMoveOffsetY = -455,
					FamiliarMoveDuration = 1.8,
					CameraMoveOffsetY = -805,

					MoveEaseIn = 0.5,
					MoveEaseOut = 1.0,

					BiomeStart = "Tartarus",
					BiomeEnd = "Asphodel",
					ShrineBounty = "BossHydra",
				},
			},
		},
	},
}

-- Assign separately so we don't get a circular reference
game.RoomData.ModsNikkelMHadesBiomesBaseRoom = {
	-- IMPORTANT: When updating the below items, also change in BaseSurface, and the Return rooms
	AlwaysLoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "NikkelM-HadesBiomesFxModded", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
	-- IMPORTANT: When updating the above items, also change in BaseSurface, and the Return rooms
	ShrinePointRoomOptions = { "RoomChallenge01", "RoomChallenge02", "RoomChallenge03", "RoomChallenge04" },
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Tartarus, roomModifications, roomReplacements, "Tartarus")
