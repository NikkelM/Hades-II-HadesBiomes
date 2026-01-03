-- Adds RoomData for Elysium from Hades to Hades II
local roomReplacements = {
	-- GENERIC
	BaseElysium = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Zagreus' Journey
		AnomalyDoorChance = 0.0,
		RoomSetName = "Elysium",

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
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantElysium" },
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedAsphodel" },
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
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedElysium" },
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreAsphodel" },
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
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreElysium" },
						Comparison = "<",
						Value = 10,
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
				Path = { "GameState", "ExorcisedNames", "AsphodelGhostIdle" },
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
								Path = { "GameState", "ExorcisedNames", "ElysiumGhostIdle" },
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
						NotHasAll = { "Fish_Elysium_Common_01", "Fish_Elysium_Rare_01", "Fish_Elysium_Legendary_01" },
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
	Y_Shop01 = {
		Binks = mod.NilValue,
	},
	Y_PreBoss01 = {
		Binks = mod.NilValue,
	},

	Y_PostBoss01 = {
		EnterVoiceLines = {
			Cooldowns = {
				{ Name = "MelinoeAnyQuipSpeech" },
			},
			{
				PreLineWait = 2,
				RandomRemaining = true,
				BreakIfPlayed = true,
				SuccessiveChanceToPlay = 0.4,
				{ Cue = "/VO/MelinoeField_0990", Text = "No more crowds..." },
				{ Cue = "/VO/MelinoeField_1718", Text = "That's all for tonight's show." },
				{ Cue = "/VO/MelinoeField_1720", Text = "And that's our show for tonight!" },
			},
		},
	},
}

local roomModifications = {
	-- GENERIC
	BaseElysium = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicModded", "ModsNikkelMHadesBiomesMusicElysiumModded", },

		NarrativeContextArt = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium",

		-- "/Ambience/ElysiumAmbientLoop"
		Ambience = "{0ad1ff34-6b23-42a9-a46c-8da523a8fc6b}",
		ReverbValue = 1.5,
		-- Always play Bass
		-- MusicActiveStems = { "Bass" },

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",

		TimeChallengeEncounterOptions = { "TimeChallengeElysium" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeElysium" },
		EliteChallengeEncounterOptions = { "EliteChallengeElysium" },

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerElysiumIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerElysiumOut",

		-- From 0.33
		TargetMetaRewardsRatio = 0.25,
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
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "CheckLocationUnlock", Args = { Biome = "Elysium" } },
		},

		HarvestPointChances = { 0.02, },
		ShovelPointChance = 0.02,
		PickaxePointChance = 0.02,
		ExorcismPointChance = 0.02,
		FishingPointChance = 0.02,
	},

	-- SHOPS
	Y_Shop01 = {
		StoreDataName = "WorldShop",
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,

		HarvestPointChances = { 0.5 },
		ShovelPointChance = 0.4,
		PickaxePointChance = 0.4,
		ExorcismPointChance = 0.4,
		FishingPointChance = 0.4,
	},
	Y_PreBoss01 = {
		SkipLastKillPresentation = true,
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,

		-- Disable all music if it's a free reward room (no Charon/Shop)
		IgnoreStemMixer = true,
		MusicMutedStems = { "Drums", "Bass", "Guitar", },

		HarvestPointChances = { 0.3 },
		ShovelPointChance = 0.3,
		PickaxePointChance = 0.3,
		ExorcismPointChance = 0.3,
		FishingPointChance = 0.3,
	},

	-- MINIBOSSES
	Y_MiniBoss01 = {
		LoadModdedVoiceBanks = { "Minotaur", "ZagreusField" },
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
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

		-- It would get placed somewhere in the middle of the arena, and has collision so could interfere with gameplay
		HasPickaxePoint = false,
		-- There are not urns in this room, so would be placed on a spawn point which looks weird
		HasExorcismPoint = false,
	},
	Y_MiniBoss02 = {
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	},

	-- BOSSES
	Y_Boss01 = {
		LoadModdedVoiceBanks = { "Minotaur", "Theseus", "ZagreusField" },
		NarrativeContextArt = "ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions",
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		ForcedReward = "ModsNikkelMHadesBiomes_BossResourceElysiumDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
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

		-- It would get placed somewhere in the middle of the arena, and has collision so could interfere with gameplay
		HasPickaxePoint = false,
		-- There are not urns in this room, so would be placed on a spawn point which looks weird
		HasExorcismPoint = false,

		-- Diehard Fan shade
		ObstacleData = {
			[543023] = {
				InteractDistance = 380,
				SpecialInteractFunctionName = _PLUGIN.guid .. "." .. "ElysiumSpecialInteractDieHardFanShade",
				UseTextSpecial = "SpecialInteractShade",
				SpecialInteractGameStateRequirements = {
					{
						Path = { "CurrentRun", "EnemyKills" },
						HasAny = { "Theseus", "Theseus2" }
					},
				},
			},
		},
	},

	-- OTHER
	Y_Story01 = {
		LoadModdedVoiceBanks = { "Patroclus", "ZagreusField" },
		RewardPreviewOverride = "ModsNikkelMHadesBiomes_StoryPreview",

		HarvestPointChances = { 0.5 },
		ShovelPointChance = 0.4,
		PickaxePointChance = 0.4,
		ExorcismPointChance = 0.4,
		FishingPointChance = 0.4,

		HarvestPointRequirements = {
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantElysium" },
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedAsphodel" },
				Comparison = ">=",
				Value = 3,
			},
			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedElysium" },
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreAsphodel" },
				Comparison = ">=",
				Value = 6,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreElysium" },
						Comparison = "<",
						Value = 10,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
	},
	Y_Reprieve01 = {
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
		SuppressRewardSpawnSounds = false,
	},
	Y_PostBoss01 = {
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
					ShrineBounty = "BossHades",
				},
			},
		},
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Elysium, roomModifications, roomReplacements, "Elysium")
