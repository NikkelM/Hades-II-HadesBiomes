-- Adds RoomData for Asphodel from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseAsphodel = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
		RoomSetName = "Asphodel",

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
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicModded", "ModsNikkelMHadesBiomesMusicAsphodelModded", },

		NarrativeContextArt = "ModsNikkelMHadesBiomes_DialogueBackground_Asphodel",

		Ambience = "/Leftovers/Object Ambiences/LavaAmbience_MatchSiteB",
		ReverbValue = 1.0,
		-- Always play Bass
		MusicActiveStems = { "Bass" },

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",

		TimeChallengeEncounterOptions = { "TimeChallengeAsphodel" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeAsphodel" },
		EliteChallengeEncounterOptions = { "EliteChallengeAsphodel" },

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerAsphodelIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerAsphodelOut",

		EntranceFunctionName = _PLUGIN.guid .. "." .. "AsphodelEnterRoomPresentation",
	},

	-- OPENING ROOMS
	X_Intro = {
		InheritFrom = { "BaseAsphodel", "BiomeStartRoom", },
		Starting = true,
		BlockRunProgressUI = true,
		StartUnthreadedEvents = {
			{ FunctionName = "EndBiomeRecords", },
			{ FunctionName = "EndAllBiomeStates" },
		},
		ThreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "DisplayLocationText", Args = { AnimationName = "ModsNikkelMHadesBiomesInfoBannerAsphodelIn", AnimationOutName = "ModsNikkelMHadesBiomesInfoBannerAsphodelOut" }, },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "CheckLocationUnlock", Args = { Biome = "Asphodel" } },
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

	-- MINIBOSSES
	X_MiniBoss01 = {
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	},
	X_MiniBoss02 = {
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	},
	X_Wrapping01 = {
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
		PostCombatReloadEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "WrappingPostCombatReloadPresentation", },
		},
		NextRoomResumeMusic = true,
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
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "BossIntroHydra", },
		},
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceBossHydra",
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		ForcedReward = "MixerGBossDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
		BlockNextBiomeEnemyShrineUpgrade = true,
		-- To not have the preview be created while the boat is still moving
		UnlockExitsWait = 1.5,
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
	X_Story01 = {
		LoadModdedVoiceBanks = { "Eurydice", "ZagreusField" },
		RewardPreviewOverride = "ModsNikkelMHadesBiomes_StoryPreview",
		-- We play our own music in this room, don't play any by default
		IgnoreMusic = true,
	},
	X_Reprieve01 = {
		EntranceFunctionName = _PLUGIN.guid .. "." .. "AsphodelEnterRoomPresentation",
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
	},
	X_PostBoss01 = {
		-- For Intercom
		LoadModdedVoiceBanks = { "HadesField" },
		-- "/Leftovers/Ambience/CreepyHauntedWindLoop"
		Ambience = "{32411cfc-6220-4c71-a3b7-d39d6ec62214}",
		ExitPreviewAnim = "ModsNikkelMHadesBiomes_ExitPreview",
		SellShopSpawnChance = 1.0,
		SellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeRestoreSellTraitShop" },
			},
		},
		-- Defines where the well spawns, making sure the sell shop spawns on the other possible ID - available IDs are 480768 and 532755
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
					ShrineBounty = "BossTheseusAndMinotaur",
				},
			},
		},
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Asphodel, roomModifications, roomReplacements, "Asphodel")
