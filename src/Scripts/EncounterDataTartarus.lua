-- Adds EncounterData for Tartarus from Hades to Hades II
local encounterData = mod.LoadHadesEncounterData("EncounterData.lua") or {}
local encounterDataTartarus = {
	-- Generic encounters
	-- These are used by all biomes, we define it here
	ModsNikkelMHadesBiomesGenerated = encounterData.Generated,
	BaseThanatos = encounterData.BaseThanatos,
	ThanatosTartarus = encounterData.ThanatosTartarus,
	BaseSurvival = encounterData.BaseSurvival,
	SurvivalTartarus = encounterData.SurvivalTartarus,

	Story_Sisyphus_01 = encounterData.Story_Sisyphus_01,
	GeneratedTartarus = encounterData.GeneratedTartarus,
	OpeningGenerated = encounterData.OpeningGenerated,
	DevotionTestTartarus = encounterData.DevotionTestTartarus,

	-- Minibosses
	MiniBossGrenadier = encounterData.MiniBossGrenadier,
	MiniBossHeavyRangedSplitter = encounterData.MiniBossHeavyRangedSplitter,
	MiniBossWretchAssassin = encounterData.MiniBossWretchAssassin,
	MiniBossHeavyRangedSplitter2 = encounterData.MiniBossHeavyRangedSplitter2,

	-- Bosses
	BossHarpy1 = encounterData.BossHarpy1,
	BossHarpy2 = encounterData.BossHarpy2,
	BossHarpy3 = encounterData.BossHarpy3,

	-- Challenge encounters within a room
	TimeChallengeTartarus = encounterData.TimeChallengeTartarus,
	PerfectClearChallengeTartarus = game.DeepCopyTable(encounterData.PerfectClearChallengeF),
	EliteChallengeTartarus = game.DeepCopyTable(encounterData.EliteChallengeF),

	-- Intro encounters
	-- ThiefMineLayerIntro = encounterData.ThiefMineLayerIntro, -- is broken
	HeavyRangedIntro = encounterData.HeavyRangedIntro,
	PunchingBagIntro = encounterData.PunchingBagIntro,
	LightSpawnerIntro = encounterData.LightSpawnerIntro,
	DisembodiedHandIntro = encounterData.DisembodiedHandIntro,
}

mod.UpdateField(encounterDataTartarus, "Generated", "ModsNikkelMHadesBiomesGenerated", { "InheritFrom" },
	"EncounterDataTartarus")

-- For TimeChallengeTartarus
mod.UpdateField(encounterDataTartarus, "Challenge", "TimeChallenge", { "InheritFrom" }, "EncounterDataTartarus")

-- For tables that should be replaced. The modifications append table data!
-- Can still use modifications if the modified table did not exist beforehand
local encounterReplacements = {
	ModsNikkelMHadesBiomesGenerated = {
		-- The "Generated" encounter in Hades II uses this to place enemies, Hades doesn't have this
		StartRoomUnthreadedEvents = { { FunctionName = "HandleEncounterPreSpawns", }, },
		PreSpawnSpawnOverrides = {
			WakeUpDelay = 0.3,
			AggroReactionTimeMin = 0.15,
			AggroReactionTimeMax = 0.45,
		},
		CanEncounterSkip = true,
		BlockAthenaEncounterKeepsake = false,
	},
	GeneratedTartarus = {
		-- To ensure we are not attacked while still running the entrance animation
		PreSpawnAIWakeDelay = 0.5,
		-- The original from Hades is 2.3
		ActiveEnemyCapBase = 6.9,
		-- The original from Hades is 30
		BaseDifficulty = 60,
		-- The original from Hades is 0.35
		ActiveEnemyCapDepthRamp = 0.55,
		-- The original from Hades is 11
		DepthDifficultyRamp = 14,
	},
	OpeningGenerated = {
		-- Blocks the LocationText from being shown an extra time in RoomEntranceDrop
		BlockLocationText = true,
		UnthreadedEvents = {
			{
				FunctionName = "SpawnRoomReward",
				Args = { WaitUntilPickup = true, }
			},
			{ FunctionName = "EncounterAudio" },
			{ FunctionName = "BeginOpeningEncounter" },
			{ FunctionName = "HandleEnemySpawns" },
			{ FunctionName = "CheckForAllEnemiesDead" },
			{ FunctionName = "PostCombatAudio" },
		},
		CanEncounterSkip = false,
	},

	PerfectClearChallengeTartarus = {
		InheritFrom = { "PerfectClearChallenge", "GeneratedTartarus" },
		EnemySet = EnemySets.EnemiesBiome1,
	},
	EliteChallengeTartarus = {
		InheritFrom = { "EliteChallenge", "GeneratedTartarus" },
		EnemySet = EnemySets.EnemiesBiome1_EliteChallenge,
	},
	BaseSurvival = {
		UnthreadedEvents = mod.EncounterSets.ModsNikkelMHadesBiomesEncounterEventsSurvival,
		StartRoomUnthreadedEvents = mod.NilValue,
	},
}

local encounterModifications = {
	-- GENERIC
	ModsNikkelMHadesBiomesGenerated = {
		BlockTypesAcrossWaves = true,
		UnthreadedEvents = game.EncounterSets.EncounterEventsDefault,
		CountsForRoomEncounterDepth = true,
	},
	OpeningGenerated = {
		-- The modifier should get the difficulty down to 0 for the first room, orient from BaseDifficulty in GeneratedTartarus
		DifficultyModifier = -60,
		-- First room of the run needs to wait for the boon pickup before spawning enemies
		PreSpawnEnemies = false,
		NoFirstWaveStartDelay = true,
		SpawnOverrides = { UseActivatePresentation = false, },
		CanEncounterSkip = false,
		-- Requires AthenaFirstPickup voiceline, which is not implemented
		RequiredTextLines = mod.NilValue,
		WaveTemplate = {
			Spawns = {},
			OverrideValues = game.BaseWaveOverrideValues,
			StartDelay = 0.0
		},
		-- Sometimes these can move around when spawning, so we blacklist them
		Blacklist = { LightSpawner = true, },
		BlockAthenaEncounterKeepsake = true,
	},
	DevotionTestTartarus = {
		CanEncounterSkip = false,
	},
	Story_Sisyphus_01 = {
		StartRoomUnthreadedEvents = {
			[1] = { FunctionName = "ActivatePrePlaced", Args = { FractionMin = 1.0, FractionMax = 1.0, LegalTypes = { "NPC_Sisyphus_01", "ModsNikkelMHadesBiomes_NPC_Bouldy_01" }, } },
		},
	},
	BaseThanatos = {
		LoadModdedVoiceBanks = { "Thanatos", "ThanatosField", "ZagreusField" },
		RequiredKillFunctionName = _PLUGIN.guid .. "." .. "TrackThanatosChallengeProgress",
		BlockAthenaEncounterKeepsake = true,
		SkipExitReadyCheckpoint = true,
	},
	BaseSurvival = {
		LoadModdedVoiceBanks = { "HadesField" },
		BlockAthenaEncounterKeepsake = true,
		CanEncounterSkip = false,
		PreSpawnEnemies = false,
	},

	-- MINIBOSSES
	MiniBossGrenadier = {
		LoadPackages = { "BiomeB" },
		CanEncounterSkip = false,
	},
	MiniBossHeavyRangedSplitter = {
		WipeEnemiesOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CancelSpawnsOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CanEncounterSkip = false,
	},
	MiniBossHeavyRangedSplitter2 = {
		WipeEnemiesOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CancelSpawnsOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CanEncounterSkip = false,
	},
	MiniBossWretchAssassin = {
		WipeEnemiesOnKillAllTypes = { "WretchAssassinMiniboss" },
		CancelSpawnsOnKillAllTypes = { "WretchAssassinMiniboss" },
		CanEncounterSkip = false,
	},

	-- BOSSES
	BossHarpy1 = {
		WipeEnemiesOnKillAllTypes = { "Harpy" },
		CancelSpawnsOnKillAllTypes = { "Harpy" },
		PostUnthreadedEvents = mod.NilValue,
		StartRoomUnthreadedEvents = {
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryActivations" },
		},
	},
	BossHarpy2 = {
		WipeEnemiesOnKillAllTypes = { "Harpy2" },
		CancelSpawnsOnKillAllTypes = { "Harpy2" },
		StartRoomUnthreadedEvents = {
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryActivations" },
		},
	},
	BossHarpy3 = {
		WipeEnemiesOnKillAllTypes = { "Harpy3" },
		CancelSpawnsOnKillAllTypes = { "Harpy3" },
		StartRoomUnthreadedEvents = {
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryActivations" },
		},
	},
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataTartarus, encounterModifications, encounterReplacements)
