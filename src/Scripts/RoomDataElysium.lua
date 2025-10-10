-- Adds RoomData for Elysium from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseElysium = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
		RoomSetName = "Elysium",

		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		ShrinePointDoorRequirements = { Skip = true },
	},

	-- SHOPS
	Y_Shop01 = {
		Binks = mod.NilValue,
	},
	Y_PreBoss01 = {
		Binks = mod.NilValue,
	},
}

local roomModifications = {
	-- GENERIC
	BaseElysium = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },

		NarrativeContextArt = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium",

		Ambience = "/Leftovers/ElysiumAmbientLoop",
		ReverbValue = 1.5,
		-- Always play Bass
		-- MusicActiveStems = { "Bass" },

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",

		TimeChallengeEncounterOptions = { "TimeChallengeElysium" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeElysium" },
		EliteChallengeEncounterOptions = { "EliteChallengeElysium" },

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerElysiumIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerElysiumOut",
	},

	-- OPENING ROOMS
	Y_Intro = {
		InheritFrom = { "BaseElysium", "BiomeStartRoom", },
		Starting = true,
		BlockRunProgressUI = true,
		StartUnthreadedEvents = {
			{ FunctionName = "EndBiomeRecords", },
			{ FunctionName = "EndAllBiomeStates" },
		},
		EntranceDirection = "LeftRight",
		StrictLeftRight = true,
		FlipHorizontalChance = 0.0,
		ThreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "DisplayLocationText", Args = { AnimationName = "ModsNikkelMHadesBiomesInfoBannerElysiumIn", AnimationOutName = "ModsNikkelMHadesBiomesInfoBannerElysiumOut" }, },
		},
	},

	-- SHOPS
	Y_Shop01 = {
		StoreDataName = "WorldShop",
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},
	Y_PreBoss01 = {
		SkipLastKillPresentation = true,
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},

	-- MINIBOSSES
	Y_MiniBoss01 = {
		LoadModdedVoiceBanks = { "Minotaur", "ZagreusField" },
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "BossIntroElysium", },
		},
	},

	-- BOSSES
	Y_Boss01 = {
		LoadModdedVoiceBanks = { "Minotaur", "Theseus", "ZagreusField" },
		ForcedReward = "MixerHBossDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
		BlockNextBiomeEnemyShrineUpgrade = true,
		UnthreadedEvents = {
			[1] = {
				FunctionName = _PLUGIN.guid .. "." .. "BossIntroElysium",
				Args = {
					[0] = { DelayedStart = true, },
					[1] = { DelayedStart = true, },
					[2] = { DelayedStart = true, },
					[3] = { DelayedStart = true, },
					[4] = { DelayedStart = true, },
				},
			},
		},
	},

	-- OTHER
	Y_Story01 = {
		LoadModdedVoiceBanks = { "Patroclus", "ZagreusField" },
		ExitFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesPatroclusExitFunctionName",
		ExitFunctionArgs = {
			Speed = 300,
		},
	},
	Y_Reprieve01 = {
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
	},
	Y_PostBoss01 = {
		ExitPreviewAnim = "HadesExitPreview",
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
				Template = "ExitDoor",
				InteractDistance = 500,
				ActivateIds = { 430000, },
			},
		},
		LeavePostPresentationEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBiomeMapPresentation",
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
					CameraMoveOffsetY = -450,

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
