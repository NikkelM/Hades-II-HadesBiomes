-- Adds EncounterData for Asphodel from Hades to Hades II
local encounterData = mod.LoadHadesEncounterData("EncounterData.lua") or {}
local encounterDataAsphodel = {
	-- Generic encounters
	GeneratedAsphodel = encounterData.GeneratedAsphodel,
	DevotionTestAsphodel = encounterData.DevotionTestAsphodel,
	Story_Eurydice_01 = encounterData.Story_Eurydice_01,
	ThanatosAsphodel = encounterData.ThanatosAsphodel,

	-- Minibosses
	WrappingAsphodel = encounterData.WrappingAsphodel,
	WrappingAsphodel2 = encounterData.WrappingAsphodel2,
	MiniBossHitAndRun = encounterData.MiniBossHitAndRun,
	MiniBossSpreadShot = encounterData.MiniBossSpreadShot,

	-- Bosses
	BossHydra = encounterData.BossHydra,
	BaseHydraEncounter = encounterData.BaseHydraEncounter,
	HydraHeads1 = encounterData.HydraHeads1,
	HydraHeads2 = encounterData.HydraHeads2,
	HydraHeads3 = encounterData.HydraHeads3,
	HydraHeads4 = encounterData.HydraHeads4,
	HydraHeads5 = encounterData.HydraHeads5,
	HydraHeads6 = encounterData.HydraHeads6,
	HydraHeads7 = encounterData.HydraHeads7,

	-- Challenge encounters within a room
	TimeChallengeAsphodel = encounterData.TimeChallengeAsphodel,
	PerfectClearChallengeAsphodel = game.DeepCopyTable(encounterData.PerfectClearChallengeF),
	EliteChallengeAsphodel = game.DeepCopyTable(encounterData.EliteChallengeF),

	-- Intro encounters
	SpreadShotIntro = encounterData.SpreadShotIntro,
	ShieldRangedIntro = encounterData.ShieldRangedIntro,
	CrusherIntro = encounterData.CrusherIntro,
	FreezeShotIntro = encounterData.FreezeShotIntro,
	RangedBurrowerIntro = encounterData.RangedBurrowerIntro,
	BerserkerIntro = encounterData.BerserkerIntro,
	WaveFistIntro = encounterData.WaveFistIntro,
	PitcherIntro = encounterData.PitcherIntro,
	SelfDestructIntro = encounterData.SelfDestructIntro,
}

mod.UpdateField(encounterDataAsphodel, "Generated", "ModsNikkelMHadesBiomesGenerated", { "InheritFrom" },
	"EncounterDataAsphodel")

-- For TimeChallengeAsphodel
mod.UpdateField(encounterDataAsphodel, "Challenge", "TimeChallenge", { "InheritFrom" }, "EncounterDataAsphodel")

-- For tables that should be replaced. The modifications append table data!
-- Can still use modifications if the modified table did not exist beforehand
local encounterReplacements = {
	GeneratedAsphodel = {
		-- To ensure we are not attacked while still running the entrance animation
		PreSpawnAIWakeDelay = 1,
		-- The original from Hades is 5.0
		ActiveEnemyCapBase = 6.5,
		-- The original from Hades is 170
		BaseDifficulty = 220,
		-- The original from Hades is 1.0
		ActiveEnemyCapDepthRamp = 1.3,
		-- The original from Hades is 0.35
		TypeCountDepthRamp = 0.5,
		-- The original from Hades is 25
		DepthDifficultyRamp = 32,
		-- Load the base Hades II Asphodel package, since we reuse some enemies
		LoadPackages = { "BiomeB" },
		-- Original is missing HandleEncounterPreSpawns
		StartRoomUnthreadedEvents = {
			{ FunctionName = "HandleEncounterPreSpawns" },
			{ FunctionName = "DisableRoomTraps" },
		},
	},

	PerfectClearChallengeAsphodel = {
		InheritFrom = { "PerfectClearChallenge", "GeneratedAsphodel" },
		EnemySet = EnemySets.EnemiesBiome2,
	},
	EliteChallengeAsphodel = {
		InheritFrom = { "EliteChallenge", "GeneratedAsphodel" },
		EnemySet = EnemySets.EnemiesBiome2_EliteChallenge,
	},
}

local encounterModifications = {
	-- GENERIC
	DevotionTestAsphodel = {
		CanEncounterSkip = false,
	},

	-- MINIBOSSES
	MiniBossHitAndRun = {
		InheritFrom = { "MinibossEncounter", "GeneratedAsphodel" },
		MinWaves = 1,
		MaxWaves = 1,
		CanEncounterSkip = false,
	},
	MiniBossSpreadShot = {
		InheritFrom = { "MinibossEncounter", "GeneratedAsphodel" },
		MinWaves = 1,
		MaxWaves = 1,
		CanEncounterSkip = false,
		BlockEliteAttributes = true,
	},
	WrappingAsphodel = {
		BlockAthenaEncounterKeepsake = true,
		CanEncounterSkip = false,
	},
	WrappingAsphodel2 = {
		BlockAthenaEncounterKeepsake = true,
		CanEncounterSkip = false,
	},

	-- BOSSES
	BossHydra = {
		LoadPackages = { "BiomeB" },
		StartRoomUnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "PickHydraVariant" },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "ActivateHydra" },
		},
		WipeEnemiesOnKillAllTypes = { "HydraHeadImmortal", "HydraHeadImmortalLavamaker", "HydraHeadImmortalSummoner", "HydraHeadImmortalSlammer", "HydraHeadImmortalWavemaker", },
		CancelSpawnsOnKillAllTypes = { "HydraHeadImmortal", "HydraHeadImmortalLavamaker", "HydraHeadImmortalSummoner", "HydraHeadImmortalSlammer", "HydraHeadImmortalWavemaker", },
		CancelSpawnsOnKill = mod.NilValue,
		WipeEnemiesOnKill = mod.NilValue,
		PostUnthreadedEvents = mod.NilValue,
	},
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataAsphodel, encounterModifications, encounterReplacements)
