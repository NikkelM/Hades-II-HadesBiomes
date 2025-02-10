-- Adds EncounterData for Tartarus from Hades to Hades II

local encounterData = mod.LoadHadesEncounterData("EncounterData.lua")
local encounterDataTartarus = {
	-- Generic encounters
	ModsNikkelMHadesBiomesGenerated = encounterData.Generated,
	GeneratedTartarus = game.DeepCopyTable(game.EncounterData.GeneratedF),
	OpeningGenerated = encounterData.OpeningGenerated,

	-- Minibosses
	MiniBossGrenadier = encounterData.MiniBossGrenadier,
	MiniBossHeavyRangedSplitter = encounterData.MiniBossHeavyRangedSplitter,
	MiniBossWretchAssassin = encounterData.MiniBossWretchAssassin,
	MiniBossHeavyRangedSplitter2 = encounterData.MiniBossHeavyRangedSplitter2,

	-- Bosses
	BossHarpy1 = encounterData.BossHarpy1,

	-- Challenge encounters within a room
	TimeChallengeTartarus = encounterData.TimeChallengeTartarus,
	PerfectClearChallengeTartarus = game.DeepCopyTable(encounterData.PerfectClearChallengeF),
	EliteChallengeTartarus = game.DeepCopyTable(encounterData.EliteChallengeF),
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
		StartRoomUnthreadedEvents = {
			{
				FunctionName = "HandleEncounterPreSpawns"
			}
		},
		PreSpawnSpawnOverrides =
		{
			WakeUpDelay = 0.3,
			AggroReactionTimeMin = 0.15,
			AggroReactionTimeMax = 0.45,
		},
	},
	GeneratedTartarus = {
		EnemySet = EnemySets.EnemiesBiome1,
		-- The original from Hades is 30, Hades II GeneratedF is 55
		BaseDifficulty = 40,
	},

	PerfectClearChallengeTartarus = {
		InheritFrom = { "PerfectClearChallenge", "GeneratedTartarus" },
		EnemySet = EnemySets.EnemiesBiome1,
	},
	EliteChallengeTartarus = {
		InheritFrom = { "EliteChallenge", "GeneratedTartarus" },
		EnemySet = EnemySets.EnemiesBiome1_EliteChallenge,
	},
}

local encounterModifications = {
	-- GENERIC
	ModsNikkelMHadesBiomesGenerated = {
		BlockTypesAcrossWaves = true,
		UnthreadedEvents = EncounterSets.EncounterEventsDefault,
		CountsForRoomEncounterDepth = true,
	},
	OpeningGenerated = {
		-- The modifier should get the difficulty down to 0 for the first room, orient from BaseDifficulty in GeneratedTartarus
		DifficultyModifier = -30,
		-- First room of the run needs to wait for the boon pickup before spawning enemies
		PreSpawnEnemies = false,
		NoFirstWaveStartDelay = true,
		SpawnOverrides = { UseActivatePresentation = false, },
		-- Requires AthenaFirstPickup voiceline, which is not implemented
		RequiredTextLines = mod.NilValue,
	},

	-- MINIBOSSES
	MiniBossGrenadier = {
		LoadPackages = { "Asphodel" },
	},
	MiniBossHeavyRangedSplitter = {
		WipeEnemiesOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CancelSpawnsOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
	},
	MiniBossHeavyRangedSplitter2 = {
		WipeEnemiesOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CancelSpawnsOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
	},
	MiniBossWretchAssassin = {
		WipeEnemiesOnKillAllTypes = { "WretchAssassinMiniboss" },
		CancelSpawnsOnKillAllTypes = { "WretchAssassinMiniboss" },
	},

	-- BOSSES
	BossHarpy1 = {
		WipeEnemiesOnKillAllTypes = { "Harpy" },
		CancelSpawnsOnKillAllTypes = { "Harpy" },
		-- TODO: Modify to drop other resources if there is an incantation for this in Hades II
		PostUnthreadedEvents = mod.NilValue,
	},
}

-- Assign separately so we don't get a circular reference
game.EncounterData.ModsNikkelMHadesBiomesBaseEncounter = {
	-- We need to always load the RoomManagerModsNikkelMHadesBiomes package to get animations for non-binked enemies
	LoadPackages = { "RoomManagerModsNikkelMHadesBiomes", "FxModsNikkelMHadesBiomes", "GUIModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits" },
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataTartarus, encounterModifications, encounterReplacements)
