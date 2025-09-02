-- Adds RoomData for Tartarus from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseTartarus = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
		RoomSetName = "Tartarus",
		-- The animations are also defined in Hades II, and are misaligned for the spawn points on Hades maps
		BreakableOptions = { "ModsNikkelMHadesBiomesBreakableIdle1", "ModsNikkelMHadesBiomesBreakableIdle2", "ModsNikkelMHadesBiomesBreakableIdle3" },
	},

	-- OPENING ROOMS
	RoomOpening = {
		-- Music
		MusicActiveStems = { "Guitar", "Drums", "Bass", },
		Music = mod.NilValue,
		MusicRequirements = mod.NilValue,
		-- Will be set in the encounter instead
		UnthreadedEvents = mod.NilValue,
	},

	-- SHOPS
	A_Shop01 = {
		Binks = mod.NilValue,
	},
	A_PreBoss01 = {
		Binks = mod.NilValue,
	},
}

local roomModifications = {
	-- GENERIC
	BaseTartarus = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },

		Ambience = "/Leftovers/Object Ambiences/EvilLairAmbienceMatchSiteE",
		ReverbValue = 2.0,
		MusicActiveStems = { "Bass" },

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Tartarus",

		TimeChallengeEncounterOptions = { "TimeChallengeTartarus" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeTartarus" },
		EliteChallengeEncounterOptions = { "EliteChallengeTartarus" },

		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		ShrinePointDoorRequirements = { Skip = true },

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerTartarusIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerTartarusOut",
	},

	-- OPENING ROOMS
	RoomOpening = {
		InheritFrom = { "BaseTartarus", "BiomeStartRoom", },
		LegalEncounters = { "OpeningGenerated" },
		EntranceFunctionName = "RoomEntranceDrop",
		EntranceFunctionArgs = { LandingAnimation = "Melinoe_HeroLanding", Sound = "/SFX/Player Sounds/MelWhooshDropIn", IntroHoldDuration = 2.34, StartZoomFraction = 0.65, ZoomDuration = 4 },
		ThreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "DisplayLocationText", Args = { AnimationName = "ModsNikkelMHadesBiomesInfoBannerTartarusIn", AnimationOutName = "ModsNikkelMHadesBiomesInfoBannerTartarusOut" }, },
			-- This will work with roomSetDataTartarus.RoomOpening.ThreadedEvents[3].Args.SpawnTypes = { "TartarusGhost01" }, but has the problem of spawning all Ghosts on the same ID
			[3] = mod.NilValue
		},
		StartUnthreadedEvents = {
			-- Don't start the demo presentation mode
			[1] = mod.NilValue,
			-- Don't play the standard music event, it won't be able to get changed later
			[3] = mod.NilValue,
		},
		-- Requires AthenaFirstPickup voiceline, which is not implemented
		ChooseRewardRequirements = mod.NilValue,
		ForcedRewards = mod.NilValue,
		IneligibleRewards = game.RewardSets.OpeningRoomBans,
		BlockGiftBoons = true,
		MaxAppearancesThisBiome = 1,
		BlockRunProgressUI = true,
		DisableRewardMagnetisim = true,
		BlockNextBiomeEnemyShrineUpgrade = true,
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
	-- This is the first run's opening room, which forces Athena boons
	RoomSimple01 = mod.NilValue,

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
	},
	A_PreBoss01 = {
		SkipLastKillPresentation = true,
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
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
		ForcedReward = "MixerFBossDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
		BlockNextBiomeEnemyShrineUpgrade = true,
	},
	A_Boss02 = {
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro", },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryIntro" },
		},
	},
	A_Boss03 = {
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro", },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryIntro" },
		},
		PostCombatReloadEvents = {
			{ FunctionName = _PLUGIN.guid .. "." .. "Harpy3MapRestore" },
		},
		RestorePresentationFunction = mod.NilValue,
	},

	-- OTHER
	A_Story01 = {
		ThreadedEvents = {
			[1] = mod.NilValue
		},
		LoadModdedVoiceBanks = { "Sisyphus", "ZagreusField" },
	},
	A_Reprieve01 = {
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
	},
	A_PostBoss01 = {
		ExitPreviewAnim = "HadesExitPreview",
		NextRoomSet = { "Asphodel" },
		SellShopSpawnChance = 1.0,
		SellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossSellTraitShops" },
			},
		},
		-- Defines where the well spawns, making sure the sell shop spawns on the other possible ID. Available IDs are 480768 and 487438
		WellShopChallengeBaseId = 480768,
		WellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossWellShops" },
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
					HeroMoveDuration = 2.0,
					FamiliarMoveOffsetX = 365,
					FamiliarMoveOffsetY = -455,
					FamiliarMoveDuration = 2.0,
					CameraMoveOffsetY = -805,

					MoveEaseIn = 0.5,
					MoveEaseOut = 1.0,

					BiomeStart = "Tartarus",
					BiomeEnd = "Asphodel",
					-- TODO: Hydra
					ShrineBounty = "BossScylla01",
				},
			},
		},
	},
}

-- Assign separately so we don't get a circular reference
game.RoomData.ModsNikkelMHadesBiomesBaseRoom = {
	-- Update in BaseStyx if anything is being changed here
	LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "FxModsNikkelMHadesBiomes", "GUIModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits", "ModsNikkelMHadesBiomesFxModded", "ModsNikkelMHadesBiomesGUIModded", },
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Tartarus, roomModifications, roomReplacements, "Tartarus")
