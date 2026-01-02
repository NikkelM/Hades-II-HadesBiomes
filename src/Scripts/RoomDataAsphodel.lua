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
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantAsphodel" },
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
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedTartarus" },
				Comparison = ">=",
				Value = 3,
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
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedAsphodel" },
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreTartarus" },
				Comparison = ">=",
				Value = 6,
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
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreAsphodel" },
						Comparison = "<",
						Value = 15,
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
				Path = { "GameState", "ExorcisedNames", "3dGhostIdle" },
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
								Path = { "GameState", "ExorcisedNames", "AsphodelGhostIdle" },
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
						NotHasAll = { "Fish_Asphodel_Common_01", "Fish_Asphodel_Rare_01", "Fish_Asphodel_Legendary_01" },
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

		CombatOverMusicEvents = mod.CombatOverMusicEvents.Generic,
	},

	-- SHOPS
	X_Shop01 = {
		Binks = mod.NilValue,
	},
	X_PreBoss01 = {
		Binks = mod.NilValue,
	},

	X_Boss01 = {
		EnterGlobalVoiceLines = "ModsNikkelMHadesBiomesEnteredHydraChamberVoiceLines",
	},
	X_Boss02 = {
		EnterGlobalVoiceLines = "ModsNikkelMHadesBiomesEnteredHydraChamberVoiceLines",
	},
	X_PostBoss01 = {
		EnterVoiceLines = {
			Cooldowns = {
				{ Name = "MelinoeAnyQuipSpeech" },
			},
			{
				PreLineWait = 2,
				RandomRemaining = true,
				BreakIfPlayed = true,
				SuccessiveChanceToPlay = 0.5,

				{ Cue = "/VO/MelinoeField_2624", Text = "A magnificent beast, but a threat..." },
				{ Cue = "/VO/MelinoeField_1102", Text = "Think I can finally go...", },
				{ Cue = "/VO/MelinoeField_3011", Text = "Foul creature..." },
				{ Cue = "/VO/MelinoeField_1104", Text = "I can get out now..." },
				{ Cue = "/VO/Melinoe_1000",      Text = "Done." },
				{ Cue = "/VO/MelinoeField_1338", Text = "One step closer..." },
				{ Cue = "/VO/MelinoeField_1339", Text = "Little by little..." },
			},
		},
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

		-- From 0.4
		TargetMetaRewardsRatio = 0.3,
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

		HarvestPointChances = { 0.02, },
		ShovelPointChance = 0.02,
		PickaxePointChance = 0.02,
		ExorcismPointChance = 0.02,
		FishingPointChance = 0.02,
	},

	-- SHOPS
	X_Shop01 = {
		StoreDataName = "WorldShop",
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,

		ShovelPointChance = 0.35,
		PickaxePointChance = 0.35,
		ExorcismPointChance = 0.25,
		FishingPointChance = 0.25,
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

		-- Disable all music if it's a free reward room (no Charon/Shop)
		IgnoreStemMixer = true,
		MusicMutedStems = { "Drums", "Bass", "Guitar", },

		ShovelPointChance = 0.35,
		PickaxePointChance = 0.35,
		ExorcismPointChance = 0.25,
		FishingPointChance = 0.25,
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
		ForcedReward = "ModsNikkelMHadesBiomes_BossResourceAsphodelDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
		-- To not have the preview be created while the boat is still moving
		UnlockExitsWait = 0.75,

		HasPickaxePoint = false,
	},
	X_Boss02 = {
		GameStateRequirements = {
			{
				Path = { "GameState", "ShrineUpgrades", "BossDifficultyShrineUpgrade" },
				Comparison = ">=",
				Value = 2,
			},
		},

		HasPickaxePoint = false,
	},

	-- OTHER
	X_Story01 = {
		LoadModdedVoiceBanks = { "Eurydice", "ZagreusField" },
		RewardPreviewOverride = "ModsNikkelMHadesBiomes_StoryPreview",
		-- We play our own music in this room, don't play any by default
		IgnoreMusic = true,

		GameStateRequirements = {
			RequiredSeenRooms = mod.NilValue,
			RequiredSeenEncounter = "BossHydra",
		},

		HarvestPointChances = { 0.4, 0.1, },
		ShovelPointChance = 0.35,
		PickaxePointChance = 0.35,
		ExorcismPointChance = 0.35,
		FishingPointChance = 0.15,

		HarvestPointRequirements = {
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantAsphodel" },
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedTartarus" },
				Comparison = ">=",
				Value = 3,
			},
			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedAsphodel" },
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
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreTartarus" },
				Comparison = ">=",
				Value = 6,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreAsphodel" },
						Comparison = "<",
						Value = 15,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
	},
	X_Reprieve01 = {
		EntranceFunctionName = _PLUGIN.guid .. "." .. "AsphodelEnterRoomPresentation",
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
	X_PostBoss01 = {
		-- For Intercom
		LoadModdedVoiceBanks = { "HadesField" },
		-- "/Leftovers/Ambience/CreepyHauntedWindLoop"
		Ambience = "{32411cfc-6220-4c71-a3b7-d39d6ec62214}",
		ExitPreviewAnim = "ModsNikkelMHadesBiomes_ExitPreview",
		ThreadedEvents = {
			[1] = { FunctionName = "HadesSpeakingPresentation", Args = { VoiceLines = game.GlobalVoiceLines.HadesPostBossVoiceLines, StartDelay = 2.5 } },
		},
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
