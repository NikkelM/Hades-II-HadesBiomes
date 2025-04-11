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

		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		ShrinePointDoorRequirements = { Skip = true },
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
		-- TODO: Need to add for the other start rooms as well (except Tartarus)
		StartUnthreadedEvents = {
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
		BlockNextBiomeEnemyShrineUpgrade = true,
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
		NextRoomSet = { "Elysium" },
		SellShopSpawnChance = 1.0,
		SellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossSellTraitShops" },
			},
		},
		-- Defines where the well spawns, making sure the sell shop spawns on the other possible ID - available IDs are 480768 and 532755
		WellShopChallengeBaseId = 532755,
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
				FunctionName = "ModsNikkelMHadesBiomesBiomeMapPresentation",
				Args = {
					HeroStartOffsetX = 230,
					HeroStartOffsetY = -320,
					FamiliarStartOffsetX = 120,
					FamiliarStartOffsetY = -285,

					HeroMoveOffsetX = -350,
					HeroMoveOffsetY = -630,
					HeroMoveDuration = 2.0,
					FamiliarMoveOffsetX = -350,
					FamiliarMoveOffsetY = -630,
					FamiliarMoveDuration = 2.0,
					CameraMoveOffsetY = -950,

					MoveEaseIn = 0.5,
					MoveEaseOut = 1.0,

					AdditionalEndTimeWait = 1.0,
					BiomeStart = "Asphodel",
					BiomeEnd = "Elysium",
					-- TODO: Theseus
					ShrineBounty = "BossScylla01",
				},
			},
		},
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Asphodel, roomModifications, roomReplacements, "Asphodel")
