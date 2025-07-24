-- Adds RoomData for Elysium from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseElysium = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
		RoomSetName = "Elysium",
		-- The animations are also defined in Hades II, and are misaligned for the spawn points on Hades maps
		BreakableOptions = { "BreakableElysiumIdle1", "BreakableElysiumIdle2", "BreakableElysiumIdle3" },

		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		ShrinePointDoorRequirements = { Skip = true },
	},

	-- SHOPS
	C_Shop01 = {
		Binks = mod.NilValue,
	},
	C_PreBoss01 = {
		Binks = mod.NilValue,
	},
}

local roomModifications = {
	-- GENERIC
	BaseElysium = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },

		-- TODO: Styx: { Name = "/Leftovers/Object Ambiences/CreepyIslandAmbience", ReverbValue = 2.0 },
		Ambience = "/Leftovers/ElysiumAmbientLoop",
		ReverbValue = 1.5,
		-- Always play Bass
		-- MusicActiveStems = { "Bass" },

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",

		TimeChallengeEncounterOptions = { "TimeChallengeElysium" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeElysium" },
		EliteChallengeEncounterOptions = { "EliteChallengeElysium" },
	},

	-- OPENING ROOMS
	C_Intro = {
		-- TODO: Comment next two out for Minotaur as first room testing
		InheritFrom = { "BaseElysium", "BiomeStartRoom", },
		Starting = true,
		BlockRunProgressUI = true,
		StartUnthreadedEvents = {
			{ FunctionName = "EndBiomeRecords", },
			{ FunctionName = "EndAllBiomeStates" },
		},
		EntranceDirection = "Right",
	},

	-- SHOPS
	C_Shop01 = {
		StoreDataName = "WorldShop",
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},
	C_PreBoss01 = {
		SkipLastKillPresentation = true,
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},

	-- MINIBOSSES
	C_MiniBoss01 = {
		LoadModdedVoiceBanks = { "Minotaur", "ZagreusField" },
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	},

	-- BOSSES
	C_Boss01 = {
		ForcedReward = "MixerHBossDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
		BlockNextBiomeEnemyShrineUpgrade = true,
	},

	-- OTHER
	C_Reprieve01 = {
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
	},
	C_PostBoss01 = {
		ExitPreviewAnim = "HadesExitPreview",
		NextRoomSet = { "Styx" },
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
					HeroStartOffsetX = 120,
					HeroStartOffsetY = -1370,
					FamiliarStartOffsetX = 220,
					FamiliarStartOffsetY = -1335,

					HeroMoveOffsetX = -80,
					HeroMoveOffsetY = -480,
					HeroMoveDuration = 2.0,
					FamiliarMoveOffsetX = -80,
					FamiliarMoveOffsetY = -430,
					FamiliarMoveDuration = 2.0,
					CameraMoveOffsetY = -390,

					MoveEaseIn = 0.5,
					MoveEaseOut = 1.0,

					-- AdditionalEndTimeWait = 1.0,
					BiomeStart = "Elysium",
					BiomeEnd = "Styx",
					-- TODO: Hades
					ShrineBounty = "BossScylla01",
				},
			},
		},
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Elysium, roomModifications, roomReplacements, "Elysium")
