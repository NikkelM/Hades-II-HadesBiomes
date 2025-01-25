-- Adds RoomData for Tartarus from Hades to Hades II

local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus

local roomReplacements = {
	BaseTartarus = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
	},
}

local roomModifications = {
	-- Generic
	BaseTartarus = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes" },

		-- TODO: Localization?
		SaveProfileLocationText = "TARTARUS (Nightmare)", -- roomSetDataTartarus.BaseTartarus.LocationText,

		TimeChallengeEncounterOptions = { "TimeChallengeTartarus" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeTartarus" },
		EliteChallengeEncounterOptions = { "EliteChallengeTartarus" },

		-- Erebus challenge encounter are not currently working
		ShrinePointDoorRequirements = { Skip = true },
	},

	-- Opening rooms
	RoomOpening = {
		LegalEncounters = { "OpeningGenerated" },
		EntranceFunctionName = "RoomEntranceMaterialize",
		EntranceFunctionArgs = { HeroGoalAngle = 335 },
		UnthreadedEvents = {},
		ThreadedEvents = {
			[1] = roomSetDataTartarus.RoomOpening.ThreadedEvents[1],
			[2] = roomSetDataTartarus.RoomOpening.ThreadedEvents[2],
			-- This will work with roomSetDataTartarus.RoomOpening.ThreadedEvents[3].Args.SpawnTypes = { "TartarusGhost01" }, but has the problem of spawning all Ghosts on the same ID
			[3] = mod.NilValue
		},
		ForcedRewards = mod.NilValue,
		IneligibleRewards = game.RewardSets.OpeningRoomBans,
		MaxAppearancesThisBiome = 1,
		BlockRunProgressUI = true,
		StartThreadedEvents =
		{
			{ FunctionName = "CheckBiomeStateStart" },
			{ FunctionName = "ShadeMercManager", Args = { StartingCountMin = 3, StartingCountMax = 12, ObjectNames = { "ShadeMerc" }, MaxActive = 12 } },
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
