-- Adds RoomData for Tartarus from Hades to Hades II

local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus

local roomReplacements = {
	-- GENERIC
	BaseTartarus = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
	},

	-- OPENING ROOMS
	RoomOpening = {
		-- Music
		MusicActiveStems = { "Guitar", "Drums", "Bass", },
		Music = mod.NilValue,
		MusicRequirements = mod.NilValue,
		MusicStartDelay = 3.75,
	},

	-- SHOPS
	A_Shop01 = {
		-- Same requirements, but different format
		GameStateRequirements = {
			{
				FunctionName = "RequiredMinExits",
				FunctionArgs = { Count = 2 },
			},
			{
				Path = { "CurrentRun", "BiomeDepthCache" },
				Comparison = "<=",
				Value = 6,
			},
		},
		Binks = mod.NilValue,
	},
	-- TODO: Add additional bosses as they are implemented
	A_PreBoss01 = {
		LinkedRooms = { "A_Boss01" }, -- , "A_Boss02", "A_Boss03"
		Binks = mod.NilValue,
	},

	-- MINIBOSSES
	A_MiniBoss01 = {
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "RoomsEntered" },
				HasNone = { "A_MiniBoss02", "A_MiniBoss03", "A_MiniBoss04" },
			},
		},
	},
	A_MiniBoss02 = {
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "RoomsEntered" },
				HasNone = { "A_MiniBoss01", "A_MiniBoss03", "A_MiniBoss04" },
			},
			NamedRequirements = { "MinibossCountShrineUpgradeActive" },
			-- {
			-- 	PathTrue = { "GameState", "EncountersOccurredCache", "BossHarpy1" }, -- Not implemented yet
			-- },
		},
	},
	A_MiniBoss03 = {
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "RoomsEntered" },
				HasNone = { "A_MiniBoss01", "A_MiniBoss02", "A_MiniBoss04" },
			},
			-- {
			-- 	PathTrue = { "GameState", "EncountersOccurredCache", "BossHades" }, -- Not implemented yet
			-- },
		},
	},
	A_MiniBoss04 = {
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "RoomsEntered" },
				HasNone = { "A_MiniBoss01", "A_MiniBoss02", "A_MiniBoss03" },
			},
			NamedRequirements = { "MinibossCountShrineUpgradeActive" },
			-- {
			-- 	PathTrue = { "GameState", "EncountersOccurredCache", "BossHarpy1" }, -- Not implemented yet
			-- },
		},
	},
}

local roomModifications = {
	-- GENERIC
	BaseTartarus = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", "TartarusModsNikkelMHadesBiomes", },

		SaveProfileLocationText = "ModdedLocation_Hades_Tartarus",

		TimeChallengeEncounterOptions = { "TimeChallengeTartarus" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeTartarus" },
		EliteChallengeEncounterOptions = { "EliteChallengeTartarus" },

		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		ShrinePointDoorRequirements = { Skip = true },
	},

	-- OPENING ROOMS
	RoomOpening = {
		LegalEncounters = { "OpeningGenerated" },
		EntranceFunctionName = "RoomEntranceMaterialize",
		EntranceFunctionArgs = { HeroGoalAngle = 335 },
		ThreadedEvents = {
			-- This will work with roomSetDataTartarus.RoomOpening.ThreadedEvents[3].Args.SpawnTypes = { "TartarusGhost01" }, but has the problem of spawning all Ghosts on the same ID
			[3] = mod.NilValue
		},
		StartUnthreadedEvents = {
			-- Don't play the standard music event, it won't be able to get changed later
			[3] = mod.NilValue
		},
		ForcedRewards = mod.NilValue,
		IneligibleRewards = game.RewardSets.OpeningRoomBans,
		MaxAppearancesThisBiome = 1,
		BlockRunProgressUI = true,
		StartThreadedEvents =
		{
			{ FunctionName = "CheckBiomeStateStart" },
			{ FunctionName = "ShadeMercManager",    Args = { StartingCountMin = 3, StartingCountMax = 12, ObjectNames = { "ShadeMerc" }, MaxActive = 12 } },
		},
	},
	-- This is the first run's opening room, which forces Athena boons
	RoomSimple01 = mod.NilValue,

	-- SHOPS
	-- TODO: Move some of these into a base shop object for all Hades shops to inherit from to prevent duplicates
	A_Shop01 = {
		ThreadedEvents = {
			-- To get PatrolPath working, see RoomOpening
			[1] = mod.NilValue,
			[2] = mod.NilValue
		},
		StoreDataName = "WorldShop",
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},
	A_PreBoss01 = {
		SkipLastKillPresentation = true,
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},

	-- MINIBOSSES
	-- Other miniboss rooms inherit from this
	A_MiniBoss01 = {
		-- TODO: This is misaligned, done in EventPresentation Line 3921 onwards
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	},

	-- BOSSES
	A_Boss01 = {
		LoadModdedVoiceBanks = { "MegaeraField" },
		-- TODO - Hades II drops the same item always - which one to choose?
		ForcedReward = "MixerFBossDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
	},
	A_PostBoss01 = {
		ExitPreviewAnim = "HadesExitPreview",
		-- TODO: Remove placeholder
		NextRoomSet = "G",
		-- Makes the door interactable
		ObstacleData = {
			[430000] = {
				ActivateIds = { 430000, },
			},
		},
	},
}

mod.ApplyModificationsAndInheritRoomData(roomSetDataTartarus, roomModifications, roomReplacements, "Tartarus")
