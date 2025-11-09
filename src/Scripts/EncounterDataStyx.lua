-- Adds EncounterData for Styx from Hades to Hades II
local encounterData = mod.LoadHadesEncounterData("EncounterData.lua") or {}
local encounterDataStyx = {
	-- Generic encounters
	GeneratedStyx = encounterData.GeneratedStyx,
	GeneratedStyxMini = encounterData.GeneratedStyxMini,
	GeneratedStyxMiniSingle = encounterData.GeneratedStyxMiniSingle,

	-- Minibosses
	BaseStyxMiniboss = encounterData.BaseStyxMiniboss,
	MiniBossRatThug = encounterData.MiniBossRatThug,
	MiniBossMineLayer = encounterData.MiniBossMineLayer,
	MiniBossSatyr = encounterData.MiniBossSatyr,
	MiniBossHeavyRangedForked = encounterData.MiniBossHeavyRangedForked,
	ModsNikkelMHadesBiomesMiniBossCrawler = encounterData.MiniBossCrawler,

	-- Bosses
	BossHades = encounterData.BossHades,
	BossHadesPeaceful = encounterData.BossHadesPeaceful,

	-- Challenge encounters within a room
	TimeChallengeStyx = encounterData.TimeChallengeStyx,
	PerfectClearChallengeStyx = game.DeepCopyTable(encounterData.PerfectClearChallengeF),
	EliteChallengeStyx = game.DeepCopyTable(encounterData.EliteChallengeF),
}

mod.UpdateField(encounterDataStyx, "Generated", "ModsNikkelMHadesBiomesGenerated", { "InheritFrom" },
	"EncounterDataStyx")

-- For TimeChallengeStyx
mod.UpdateField(encounterDataStyx, "Challenge", "TimeChallenge", { "InheritFrom" }, "EncounterDataStyx")

-- For tables that should be replaced. The modifications append table data!
-- Can still use modifications if the modified table did not exist beforehand
local encounterReplacements = {
	GeneratedStyx = {
		-- The original from Hades is 5
		ActiveEnemyCapBase = 8,
		-- The original from Hades is 8
		ActiveEnemyCapMax = 11,
		-- The original from Hades is 900
		BaseDifficulty = 1200,
		StartRoomUnthreadedEvents = {
			{ FunctionName = "HandleEncounterPreSpawns" },
		},
		-- The normal events, plus disabling room traps in the end
		UnthreadedEvents = {
			{ FunctionName = "EncounterAudio" },
			{ FunctionName = "HandleEnemySpawns" },
			{ FunctionName = "CheckForAllEnemiesDead" },
			{ FunctionName = "DisableRoomTraps" },
			{ FunctionName = "PostCombatAudio" },
			{ FunctionName = "SpawnRoomReward" },
		},
	},
	GeneratedStyxMini = {
		-- The original from Hades is 130
		BaseDifficultyMin = 170,
		-- The original from Hades is 230
		BaseDifficultyMax = 270,
		-- The original from Hades is 3
		ActiveEnemyCapBase = 4,
		-- The original from Hades is 3
		ActiveEnemyCapMin = 4,
		-- The original from Hades is 3
		ActiveEnemyCapMax = 4,
		CanEncounterSkip = false,
		BlockAthenaEncounterKeepsake = true,
	},
	GeneratedStyxMiniSingle = {
		CanEncounterSkip = false,
		BlockAthenaEncounterKeepsake = true,
		-- The original from Hades is 10
		BaseDifficultyMax = 30,
	},
	BaseStyxMiniboss = {
		-- The original from Hades is 3
		ActiveEnemyCapBase = 5,
		-- The original from Hades is 8
		ActiveEnemyCapMax = 12,
		CanEncounterSkip = false,
		BlockAthenaEncounterKeepsake = true,
	},

	PerfectClearChallengeStyx = {
		InheritFrom = { "PerfectClearChallenge", "GeneratedStyx" },
		EnemySet = game.EnemySets.EnemiesBiome4,
	},
	EliteChallengeStyx = {
		InheritFrom = { "EliteChallenge", "GeneratedStyx" },
		EnemySet = game.EnemySets.EnemiesBiome4_EliteChallenge,
	},
}

local encounterModifications = {
	-- MINIBOSSES
	ModsNikkelMHadesBiomesMiniBossCrawler = {
		StartRoomUnthreadedEvents = {
			[1] = { Args = { LegalTypes = { "HadesCrawlerMiniBoss" }, }, },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "AngleIds", },
		},
		WipeEnemiesOnKillAllTypes = { "HadesCrawlerMiniBoss" },
		CancelSpawnsOnKillAllTypes = { "HadesCrawlerMiniBoss" },
		CanEncounterSkip = false,
	},
	MiniBossHeavyRangedForked = {
		CanEncounterSkip = false,
	},
	MiniBossSatyr = {
		CanEncounterSkip = false,
	},
	MiniBossMineLayer = {
		CanEncounterSkip = false,
	},
	MiniBossRatThug = {
		CanEncounterSkip = false,
	},

	-- BOSSES
	BossHades = {
		DelayedStart = true,
		PostUnthreadedEvents = mod.NilValue,
		-- As we might spawn enemies from BiomeB from Hades II, and we need the Hades symbol for the exit animation from BiomeI
		LoadPackages = { "BiomeB", "BiomeI" },
	},
	BossHadesPeaceful = {
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicSurfaceModded", },
		DelayedStart = true,
		PostUnthreadedEvents = mod.NilValue,
	},
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataStyx, encounterModifications, encounterReplacements)
