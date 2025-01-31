-- Adds RoomData for Tartarus from Hades to Hades II

local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus

local roomReplacements = {
	BaseTartarus = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
	},
	RoomOpening = {
		-- Music
		MusicActiveStems = { "Guitar", "Drums", "Bass", },
		Music = mod.NilValue,
		MusicRequirements = mod.NilValue,
	},
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
	}
}

local roomModifications = {
	-- Generic
	BaseTartarus = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes" },

		SaveProfileLocationText = "ModdedLocation_Hades_Tartarus",

		TimeChallengeEncounterOptions = { "TimeChallengeTartarus" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeTartarus" },
		EliteChallengeEncounterOptions = { "EliteChallengeTartarus" },

		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		ShrinePointDoorRequirements = { Skip = true },
	},

	-- Opening rooms
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

	-- Shops
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

	-- Minibosses
	A_MiniBoss01 = {
		-- TODO: This is misaligned, done in EventPresentation Line 3921 onwards
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	}
}

mod.ApplyModificationsAndInheritRoomData(roomSetDataTartarus, roomModifications, roomReplacements, "Tartarus")
