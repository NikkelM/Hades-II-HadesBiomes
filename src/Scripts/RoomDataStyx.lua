-- Adds RoomData for Styx from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseStyx = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
		RoomSetName = "Styx",

		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		ShrinePointDoorRequirements = { Skip = true },

		-- HasHarvestPoint = true,
		-- HasShovelPoint = true,
		HasPickaxePoint = true,
		HasExorcismPoint = true,
		HasFishingPoint = true,

		HarvestPointChances = { 0.30, },
		-- ShovelPointChance = 0.24,
		PickaxePointChance = 0.36,
		ExorcismPointChance = 0.24,
		FishingPointChance = 0.18,

		PickaxePointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreElysium" },
				Comparison = ">=",
				Value = 6,
			},
			{
				SumPrevRooms = 5,
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
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreStyx" },
						Comparison = "<",
						Value = 24,
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
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
			{
				Path = { "GameState", "ExorcisedNames", "ElysiumGhostIdle" },
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
								Value = 6,
							},
						},
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 1,
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
						NotHasAll = { "Fish_Styx_Common_01", "Fish_Styx_Rare_01", "Fish_Styx_Legendary_01" },
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

	D_Hub = {
		Binks = { "Cerberus_HubIdle_Bink", },

		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasExorcismPoint = false,

		FishingPointChance = 0.30,
		FishingPointRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				SumPrevRooms = 1,
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
						NotHasAll = { "Fish_Styx_Common_01", "Fish_Styx_Rare_01", "Fish_Styx_Legendary_01" },
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

	D_MiniBoss03 = {
		LegalEncounters = { "ModsNikkelMHadesBiomesMiniBossCrawler", "MiniBossHeavyRangedForked" },
	},

	D_Boss01 = {
		FishingPointRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				SumPrevRooms = 1,
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
						NotHasAll = { "Fish_Surface_Common_01", "Fish_Surface_Rare_01", "Fish_Surface_Legendary_01" },
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
}

local roomModifications = {
	-- GENERIC
	BaseStyx = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicModded", "ModsNikkelMHadesBiomesMusicStyxModded", },
		-- "/Leftovers/Object Ambiences/CreepyIslandAmbience"
		Ambience = "{ff413738-f0b8-400b-bbd6-c660e227583c}",
		ReverbValue = 2.0,

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Styx",

		TimeChallengeEncounterOptions = { "TimeChallengeStyx" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeStyx" },
		EliteChallengeEncounterOptions = { "EliteChallengeStyx" },

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerStyxIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerStyxOut",
		-- Devotion rewards are not available in Styx
		IneligibleRewards = { "Devotion" },
		OptionalOverrides = {
			IneligibleRewards = { "WeaponUpgrade", "Devotion" },
			RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
		},
	},
	BaseStyxMini = {
		-- Don't turn off any stems during Styx mini rooms
		CombatOverMusicEvents = {},

		-- No harvesting in mini rooms
		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasExorcismPoint = false,
	},
	BaseStyxWingEnd = {
		NextRoomEntranceFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesReturnToStyxHubPresentation",
		IneligibleRewards = { "Devotion" },
		-- Turn on the Bass stem, and play the outro music from the Drums section after the end combat rooms
		CombatOverMusicEvents = {
			{
				GameStateRequirements = {},
				MusicSection = 2,
				MusicMutedStems = { "Guitar" },
				MusicActiveStems = { "Bass", "Drums" },
			},
		},
	},

	-- OPENING ROOMS
	D_Intro = {
		InheritFrom = { "BaseStyx", "BiomeStartRoom", },
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
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "DisplayLocationText", Args = { AnimationName = "ModsNikkelMHadesBiomesInfoBannerStyxIn", AnimationOutName = "ModsNikkelMHadesBiomesInfoBannerStyxOut" }, },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "CheckLocationUnlock", Args = { Biome = "Styx" } },
		},
	},
	D_Hub = {
		-- Megaera for Storyteller for Cerberus
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		-- "/Leftovers/Ambience/MatchSiteIPoolAmbience"
		Ambience = "{e65b32ad-3a7e-4f88-9149-3260e929f04c}",
		UnthreadedEvents = {
			[1] = {
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro",
			},
		},
		RushMaxRangeOverride = 520,
		-- Shorter as we add more wait time after the animation starts
		IntroSequenceDuration = 0.3,
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceD_Hub",
		DistanceTriggers = {
			[1] = {
				TriggerObjectType = "ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
			},
			[2] = {
				TriggerObjectType = "ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
			},
		},
		StoreDataName = "Q_WorldShop",
		PostCombatReloadThreadedEvents = { { FunctionName = "CheckConversations" } },
		-- We need to call this before the PostCombatReloadThreadedEvents as by then the room is already visible and the items would pop in
		ModsNikkelMHadesBiomesPostCombatReloadThreadedEventsDHub = game.EncounterSets.ShopRoomEvents,
		SaveWhitelist = {
			ObjectStates = true,
			DoorsChosen = true,
			FirstPurchase = true,
		},
		-- To make sure the shop is set up correctly when re-entering the room
		ModsNikkelMHadesBiomesOnReloadStripEncounter = true,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
		HoundFamiliarIgnoreUnitsForPathfinding = true,
		StartRoomPresentationOnReload = true,
		EncounterCompleteWait = 0.02,
		UnlockExitsWait = 0.02,
	},

	-- MINIBOSSES
	D_MiniBoss03 = {
		-- Need to always call this, as overwriting it in the overrides is too late. The function will skip itself if it's not the correct encounter
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceCrawlerMiniBoss",
		-- Moved here from overrides, as those are applied after the local roomData variable is set which is used to determine the UnthreadedEvents to run
		UnthreadedEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro",
				Args = {
					ProcessTextLinesIds = { 552394 },
					SetupBossIds = { 552394 },
				},
			},
			{
				FunctionName = "CheckAssistHint",
				Args = {
					Delay = 10.0,
				}
			},
		},
		EncounterSpecificDataOverwrites = {
			MiniBossCrawler = mod.NilValue,
			ModsNikkelMHadesBiomesMiniBossCrawler = {
				SkipLastKillSound = true,
			},
		},
	},
	BaseStyxMiniBoss = {
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
		-- Turn on the Bass stem, and play the outro music from the Drums section after the end combat rooms
		CombatOverMusicEvents = {
			{
				GameStateRequirements = {},
				MusicSection = 2,
				MusicMutedStems = { "Guitar" },
				MusicActiveStems = { "Bass", "Drums" },
			},
		},
	},

	-- BOSSES
	D_Boss01 = {
		LoadModdedVoiceBanks = { "HadesField", "ZagreusField" },
		-- "/Leftovers/Ambience/OceanWavesWaterAmbience"
		Ambience = "{c8b4b4e9-ee0e-4b72-8a5f-8b12e5179707}",
		EndMusicOnEnter = true,

		NarrativeContextArt = "ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss",
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		ForcedReward = "MixerIBossDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
		BlockNextBiomeEnemyShrineUpgrade = true,
		UnthreadedEvents = {
			[1] = {
				FunctionName = _PLUGIN.guid .. "." .. "BossIntroHades",
				Args = { DelayedStart = true, },
			},
		},
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceHades",
		ExitFunctionName = _PLUGIN.guid .. "." .. "CheckRunEndPresentation",
		-- To prevent e.g. Centaur Arcana from triggering on the Surface
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
		ObstacleData = {
			-- Makes the exit door interactable
			-- FinalBossExitDoor
			[552590] = {
				Template = "FinalBossExitDoor",
				ActivateIds = { 552590, },
			},
		},
	},

	-- OTHER
	D_Reprieve01 = {
		-- "/Leftovers/Ambience/StillWaterAmbience2"
		Ambience = "{988cda14-71e5-41c8-9496-49f765a603d5}",
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
		StartUnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "SpawnConsumables", },
		},
		DisableRewardMagnetisim = true,
		-- This is Zagreus speaking, replace with Melinoe
		EnterVoiceLines = mod.NilValue,
		EnterGlobalVoiceLines = "EnteredReprieveRoomVoiceLines",

		HarvestPointChances = { 0.7, 0.3, },
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Styx, roomModifications, roomReplacements, "Styx")
