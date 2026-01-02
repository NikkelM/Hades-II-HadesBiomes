-- Adds RoomData for Styx from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseStyx = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
		RoomSetName = "Styx",

		-- TODO: Update requirements
		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		-- ShrinePointDoorRequirements = { Skip = true },

		HasHarvestPoint = true,
		HasShovelPoint = true,
		HasPickaxePoint = true,
		HasExorcismPoint = true,
		HasFishingPoint = true,

		HarvestPointChances = { 0.3, },
		ShovelPointChance = 0.2,
		PickaxePointChance = 0.3,
		ExorcismPointChance = 0.2,
		FishingPointChance = 0.15,

		HarvestPointRequirements = {
			{
				SumPrevRooms = 11,
				Path = { "NumHarvestPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantStyx" },
						Comparison = "<",
						Value = 16,
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedElysium" },
				Comparison = ">=",
				Value = 3,
			},
			{
				-- At least two major rooms
				SumPrevRooms = 11,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				-- At least one major room
				SumPrevRooms = 6,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedStyx" },
						Comparison = "<",
						Value = 12,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 6,
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreElysium" },
				Comparison = ">=",
				Value = 5,
			},
			{
				SumPrevRooms = 11,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
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
						Value = 8,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 6,
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
				Path = { "GameState", "ExorcisedNames", "ElysiumGhostIdle" },
				Comparison = ">=",
				Value = 2,
			},
			{
				SumPrevRooms = 11,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
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
						SumPrevRooms = 6,
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
				SumPrevRooms = 11,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
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
						SumPrevRooms = 6,
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

		FishingPointChance = 0.3,
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
		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasExorcismPoint = false,
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

		EnterVoiceLines = {
			-- First meeting
			{
				PlayOnce = true,
				PlayOnceContext = "ModsNikkelMHadesBiomes_D_Boss01_FirstMeeting",
				PreLineWait = 2.25,
				{ Cue = "/VO/MelinoeField_3000", Text = "{#Emph}<Gasp>" },
				{ Cue = "/VO/Melinoe_4017",      Text = "Father...",    PreLineWait = 0.8, BreakIfPlayed = true, },
			},
			-- Progressing the story
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 4.35,
				PlayOnce = true,
				PlayOnceContext = "ModsNikkelMHadesBiomes_D_Boss01",
				{ Cue = "/VO/MelinoeField_0920", Text = "You're not going to step aside, are you?", RequiredTextLines = { "PersephoneMeeting06" }, RequiredFalseTextLines = { "Ending01" }, },
				{ Cue = "/VO/MelinoeField_1904", Text = "You're in my way.",                        RequiredTextLines = { "PersephoneMeeting09" }, RequiredFalseTextLines = { "Ending01" }, },
			},
			{
				BreakIfPlayed = true,
				PreLineWait = 4.35,
				RequiredEncounters = { "BossHadesPeaceful" },
				{ Cue = "/VO/MelinoeField_1906", Text = "Every time..." },
			},
			-- Afterwards
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 4.35,
				SuccessiveChanceToPlayAll = 0.65,
				RequiredFalseEncounters = { "BossHadesPeaceful" },
				-- From I_Story01
				{ Cue = "/VO/MelinoeField_1520", Text = "Father...?" },
				{ Cue = "/VO/Melinoe_4016",      Text = "Father." },
				{ Cue = "/VO/Melinoe_4017",      Text = "Father..." },
				{ Cue = "/VO/MelinoeField_1519", Text = "Father...!" },
				{ Cue = "/VO/MelinoeField_1521", Text = "{#Emph}Erm... {#Prev}greetings, Father..." },
				-- From Cerberus boss fight
				{ Cue = "/VO/MelinoeField_0920", Text = "You're not going to step aside, are you?" },
				{ Cue = "/VO/MelinoeField_0923", Text = "Heads up..." },
				{ Cue = "/VO/MelinoeField_0922", Text = "I'm sorry, but I have to get through.",    RequiredFalseTextLines = { "Ending01" }, },
				{ Cue = "/VO/MelinoeField_0924", Text = "I'm not afraid of you..." },
				-- From Eris
				{ Cue = "/VO/MelinoeField_1904", Text = "You're in my way." },
				{ Cue = "/VO/MelinoeField_1906", Text = "Every time..." },
				-- From Prometheus
				{ Cue = "/VO/MelinoeField_2517", Text = "Guess who." },
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
		-- No longer offer any meta rewards here. It didn't do so anyways, but be sure
		TargetMetaRewardsRatio = 0,
		OptionalOverrides = {
			IneligibleRewards = { "WeaponUpgrade", "Devotion", "SpellDrop", "HermesUpgrade" },
			RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
			BoonRaritiesOverride = {
				Legendary = 0.1,
				Epic = 0.25,
				Rare = 0.90,
				LegendaryChance = mod.NilValue,
				EpicChance = mod.NilValue,
				RareChance = mod.NilValue,
			},
			-- We directly change the consumables to their upgraded versions when choosing the door reward using the map
			RewardConsumableOverrides = mod.NilValue,
			RewardConsumableOverrideMap = {
				RoomMoneyDrop = "RoomMoneyBigDrop",
				MaxHealthDrop = "MaxHealthDropBig",
				MaxManaDrop = "MaxManaDropBig",
				StackUpgrade = "StackUpgradeBig",
				TalentDrop = "TalentBigDrop",
			},
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
		CombatOverMusicEvents = mod.CombatOverMusicEvents.Styx,
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
		TimerBlock = "ShopEncounter",
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
		CombatOverMusicEvents = mod.CombatOverMusicEvents.Styx,
	},

	-- BOSSES
	D_Boss01 = {
		LoadModdedVoiceBanks = { "HadesField", "ZagreusField" },
		-- "/Leftovers/Ambience/OceanWavesWaterAmbience"
		Ambience = "{c8b4b4e9-ee0e-4b72-8a5f-8b12e5179707}",
		EndMusicOnEnter = true,

		NarrativeContextArt = "ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss",
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		ForcedReward = "ModsNikkelMHadesBiomes_BossResourceStyxDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
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
		SuppressRewardSpawnSounds = false,
		-- This is Zagreus speaking, replace with Melinoe
		EnterVoiceLines = mod.NilValue,
		EnterGlobalVoiceLines = "EnteredReprieveRoomVoiceLines",

		HarvestPointChances = { 0.5, 0.3, },
		HarvestPointRequirements = {
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantStyx" },
						Comparison = "<",
						Value = 16,
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedElysium" },
				Comparison = ">=",
				Value = 3,
			},
			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedStyx" },
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
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreElysium" },
				Comparison = ">=",
				Value = 5,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreStyx" },
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
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Styx, roomModifications, roomReplacements, "Styx")
