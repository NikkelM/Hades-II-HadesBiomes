-- Adds EncounterData for Tartarus from Hades to Hades II

local encounterData = mod.LoadHadesEncounterData("EncounterData.lua")
local encounterDataAsphodel = {
	-- Generic encounters
	-- ModsNikkelMHadesBiomesGenerated = encounterData.Generated,
	GeneratedAsphodel = game.DeepCopyTable(game.EncounterData.GeneratedF),
	-- OpeningGenerated = encounterData.OpeningGenerated,
	DevotionTestAsphodel = encounterData.DevotionTestAsphodel,

	-- Minibosses

	-- Bosses

	-- Challenge encounters within a room
	TimeChallengeAsphodel = encounterData.TimeChallengeAsphodel,
	PerfectClearChallengeAsphodel = game.DeepCopyTable(encounterData.PerfectClearChallengeF),
	EliteChallengeAsphodel = game.DeepCopyTable(encounterData.EliteChallengeF),
}

mod.UpdateField(encounterDataAsphodel, "Generated", "ModsNikkelMHadesBiomesGenerated", { "InheritFrom" },
	"EncounterDataAsphodel")

-- For TimeChallengeAsphodel
mod.UpdateField(encounterDataAsphodel, "Challenge", "TimeChallenge", { "InheritFrom" }, "EncounterDataAsphodel")

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
	},
	GeneratedAsphodel = {
		EnemySet = EnemySets.EnemiesBiome2,
		-- The original from Hades is 170, Hades II GeneratedF is 140
		BaseDifficulty = 180,
	},

	PerfectClearChallengeAsphodel = {
		InheritFrom = { "PerfectClearChallenge", "GeneratedAsphodel" },
		-- TODO
		EnemySet = EnemySets.EnemiesBiome2,
	},
	EliteChallengeAsphodel = {
		InheritFrom = { "EliteChallenge", "GeneratedAsphodel" },
		-- TODO
		EnemySet = EnemySets.EnemiesBiome2_EliteChallenge,
	},
}

local encounterModifications = {
	-- GENERIC
	DevotionTestAsphodel = {
		CanEncounterSkip = false,
	},

	-- MINIBOSSES
	-- MiniBossGrenadier = {
	-- 	LoadPackages = { "Asphodel" },
	-- },
	-- MiniBossHeavyRangedSplitter = {
	-- 	WipeEnemiesOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
	-- 	CancelSpawnsOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
	-- },
	-- MiniBossHeavyRangedSplitter2 = {
	-- 	WipeEnemiesOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
	-- 	CancelSpawnsOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
	-- },
	-- MiniBossWretchAssassin = {
	-- 	WipeEnemiesOnKillAllTypes = { "WretchAssassinMiniboss" },
	-- 	CancelSpawnsOnKillAllTypes = { "WretchAssassinMiniboss" },
	-- },

	-- BOSSES
	-- BossHarpy1 = {
	-- 	WipeEnemiesOnKillAllTypes = { "Harpy" },
	-- 	CancelSpawnsOnKillAllTypes = { "Harpy" },
	-- 	PostUnthreadedEvents = mod.NilValue,
	-- },
	-- BossHarpy2 = {
	-- 	WipeEnemiesOnKillAllTypes = { "Harpy2" },
	-- 	CancelSpawnsOnKillAllTypes = { "Harpy2" },
	-- },
	-- BossHarpy3 = {
	-- 	WipeEnemiesOnKillAllTypes = { "Harpy3" },
	-- 	CancelSpawnsOnKillAllTypes = { "Harpy3" },
	-- },
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataAsphodel, encounterModifications, encounterReplacements)
