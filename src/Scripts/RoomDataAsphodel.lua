-- Adds RoomData for Asphodel from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseAsphodel = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
		RoomSetName = "Asphodel",
		-- The animations are also defined in Hades II, and are misaligned for the spawn points on Hades maps
		-- TODO: Make BreakableAsphodelIdle
		BreakableOptions = { "ModsNikkelMHadesBiomesBreakableIdle1", "ModsNikkelMHadesBiomesBreakableIdle2", "ModsNikkelMHadesBiomesBreakableIdle3" },
	},

	-- OPENING ROOMS
	-- RoomOpening = {
	-- 	-- Music
	-- 	MusicActiveStems = { "Guitar", "Drums", "Bass", },
	-- 	Music = mod.NilValue,
	-- 	MusicRequirements = mod.NilValue,
	-- 	MusicStartDelay = 3.75,
	-- },

	-- -- SHOPS
	X_Shop01 = {
		Binks = mod.NilValue,
	},
	X_PreBoss01 = {
		Binks = mod.NilValue,
	},
}

local roomModifications = {
	-- GENERIC
	BaseAsphodel = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		-- TODO: Tartarus for debug
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", "AsphodelModsNikkelMHadesBiomes", "TartarusModsNikkelMHadesBiomes" },

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",

		TimeChallengeEncounterOptions = { "TimeChallengeAsphodel" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeAsphodel" },
		EliteChallengeEncounterOptions = { "EliteChallengeAsphodel" },
	},

	-- OPENING ROOMS
	X_Intro = {
		InheritFrom = { "BaseAsphodel", "BiomeStartRoom", },
		Starting = true,
		BlockRunProgressUI = true,
		StartUnthreadedEvents = {
			-- TODO: Test/Check
			{ FunctionName = "EndBiomeRecords", },
			{ FunctionName = "EndAllBiomeStates" },
		},
	},

	-- SHOPS
	X_Shop01 = {
		StoreDataName = "WorldShop",
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},
	X_PreBoss01 = {
		SkipLastKillPresentation = true,
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		-- IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},

	-- -- MINIBOSSES
	-- -- Other miniboss rooms inherit from this
	-- A_MiniBoss01 = {
	-- 	RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	-- },

	-- -- BOSSES
	-- A_Boss01 = {
	-- 	LoadModdedVoiceBanks = { "Megaera*", "Alecto*", "Tisiphone*", "ZagreusField" },
	-- 	-- Replaces MegaeraHome with Megaera voicelines
	-- 	UnthreadedEvents = {
	-- 		[1] = {
	-- 			FunctionName = "ModsNikkelMHadesBiomesBossIntro",
	-- 			Args = {
	-- 				VoiceLines = {
	-- 					[1] = { Cue = "/VO/Megaera_0061" },
	-- 					[2] = { Cue = "/VO/Megaera_0053", RequiredPlayed = { "/VO/Megaera_0061" }, },
	-- 					[4] = { Cue = "/VO/Megaera_0057", },
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- 	ForcedReward = "MixerFBossDrop",
	-- 	FirstClearRewardStore = mod.NilValue,
	-- 	ForcedRewardStore = mod.NilValue,
	-- 	EligibleRewards = mod.NilValue,
	-- 	RewardConsumableOverrides = mod.NilValue,
	-- },
	-- A_Boss02 = {
	-- 	UnthreadedEvents = {
	-- 		[1] = {
	-- 			FunctionName = "ModsNikkelMHadesBiomesBossIntro",
	-- 		},
	-- 	},
	-- },
	-- A_Boss03 = {
	-- 	UnthreadedEvents = {
	-- 		[1] = {
	-- 			FunctionName = "ModsNikkelMHadesBiomesBossIntro",
	-- 		},
	-- 	},
	-- },

	-- -- OTHER
	-- A_Reprieve01 = {
	-- 	GameStateRequirements = {
	-- 		RequiredCosmetics = mod.NilValue,
	-- 	},
	-- },
	-- A_PostBoss01 = {
	-- 	ExitPreviewAnim = "HadesExitPreview",
	-- 	-- TODO: Remove placeholder
	-- 	NextRoomSet = { "G" },
	-- 	SellShopSpawnChance = 1.0,
	-- 	SellShopRequirements = {
	-- 		{
	-- 			PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossSellTraitShops" },
	-- 		},
	-- 	},
	-- 	-- Defines where the well spawns, making sure the sell shop spawns on the other possible ID
	-- 	WellShopChallengeBaseId = 487438,
	-- 	WellShopRequirements = {
	-- 		{
	-- 			PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossWellShops" },
	-- 		},
	-- 	},
	-- 	ObstacleData = {
	-- 		[486504] = {
	-- 			SetupGameStateRequirements = {
	-- 				{
	-- 					PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossGiftRack" },
	-- 				},
	-- 				RequiredCosmetics = mod.NilValue,
	-- 			},
	-- 		},
	-- 		-- Makes the exit door interactable
	-- 		[430000] = {
	-- 			ActivateIds = { 430000, },
	-- 		},
	-- 	},
	-- },
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Asphodel, roomModifications, roomReplacements, "Asphodel")
