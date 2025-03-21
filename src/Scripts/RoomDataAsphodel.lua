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
		BreakableOptions = { "BreakableAsphodelIdle", "BreakableAsphodelIdle2", "BreakableAsphodelIdle3" },
	},

	-- SHOPS
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
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },

		Ambience = "/Leftovers/Object Ambiences/LavaAmbience_MatchSiteB",
		ReverbValue = 1.0,
		-- Always play Bass
		MusicActiveStems = { "Bass" },

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
		IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
		-- Deciding which room to create, depending on EM level
		ShrineMetaUpgradeName = mod.NilValue,
		LinkedRoomByPactLevel = mod.NilValue,
		LinkedRooms = { "X_Boss01", "X_Boss02" },
	},

	-- BOSSES
	-- GameStateRequirements to choose the correct arena depending on the EM level
	X_Boss01 = {
		-- TODO: Are these needed - only entrance voicelines?
		-- LoadModdedVoiceBanks = { "ZagreusField" },
		GameStateRequirements = {
			{
				Path = { "GameState", "ShrineUpgrades", "BossDifficultyShrineUpgrade" },
				Comparison = "<",
				Value = 2,
			},
		},
		ForcedReward = "MixerGBossDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
	},
	X_Boss02 = {
		GameStateRequirements = {
			{
				Path = { "GameState", "ShrineUpgrades", "BossDifficultyShrineUpgrade" },
				Comparison = ">=",
				Value = 2,
			},
		},
	},

	-- OTHER
	X_Reprieve01 = {
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
	},
	X_PostBoss01 = {
		ExitPreviewAnim = "HadesExitPreview",
		-- TODO: Remove placeholder
		NextRoomSet = { "G" },
		SellShopSpawnChance = 1.0,
		SellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossSellTraitShops" },
			},
		},
		-- Defines where the well spawns, making sure the sell shop spawns on the other possible ID
		WellShopChallengeBaseId = 487438,
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
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Asphodel, roomModifications, roomReplacements, "Asphodel")
