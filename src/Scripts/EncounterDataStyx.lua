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
	MiniBossCrawler = encounterData.MiniBossCrawler,

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
		ActiveEnemyCapBase = 7,
		-- The original from Hades is 8
		ActiveEnemyCapMax = 10,
		-- The original from Hades is 900
		BaseDifficulty = 1150,
		-- The original from Hades is 0
		-- ActiveEnemyCapDepthRamp = 0,
		-- The original from Hades is 0
		-- TypeCountDepthRamp = 0,
		-- The original from Hades is 0
		-- DepthDifficultyRamp = 0,
		-- Original is missing HandleEncounterPreSpawns
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
	-- TODO: GeneratedStyxMini difficulty
	GeneratedStyxMini = {
		-- Only allow skipping the encounters at the end of a path
		CanEncounterSkip = false,
		BlockAthenaEncounterKeepsake = true,
	},
	-- TODO: GeneratedStyxMiniSingle difficulty
	GeneratedStyxMiniSingle = {
		CanEncounterSkip = false,
		BlockAthenaEncounterKeepsake = true,
	},

	-- TODO: BaseStyxMiniboss difficulty

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

	-- BOSSES
	BossHades = {
		DelayedStart = true,
		PostUnthreadedEvents = mod.NilValue,
	},
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataStyx, encounterModifications, encounterReplacements)
