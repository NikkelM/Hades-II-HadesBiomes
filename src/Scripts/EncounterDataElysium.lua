-- Adds EncounterData for Elysium from Hades to Hades II
local encounterData = mod.LoadHadesEncounterData("EncounterData.lua") or {}
local encounterDataElysium = {
	-- Generic encounters
	GeneratedElysium = encounterData.GeneratedElysium,
	DevotionTestElysium = encounterData.DevotionTestElysium,

	-- Minibosses
	MiniBossMinotaur = encounterData.MiniBossMinotaur,
	MiniBossNakedSpawners = encounterData.MiniBossNakedSpawners,
	-- Not implemented in Hades
	-- MiniBossShadeMagic = encounterData.MiniBossShadeMagic,

	-- Bosses

	-- Challenge encounters within a room
	TimeChallengeElysium = encounterData.TimeChallengeElysium,
	PerfectClearChallengeElysium = game.DeepCopyTable(encounterData.PerfectClearChallengeF),
	EliteChallengeElysium = game.DeepCopyTable(encounterData.EliteChallengeF),

	-- Intro encounters
	ShadeSpearUnitIntro = encounterData.ShadeSpearUnitIntro,
	ShadeSwordUnitIntro = encounterData.ShadeSwordUnitIntro,
	ShadeShieldUnitIntro = encounterData.ShadeShieldUnitIntro,
	ShadeBowUnitIntro = encounterData.ShadeBowUnitIntro,
	FlurrySpawnerUnitIntro = encounterData.FlurrySpawnerUnitIntro,
	IllusionistIntro = encounterData.IllusionistIntro,
	ChariotIntro = encounterData.ChariotIntro,
	ChariotSuicideIntro = encounterData.ChariotSuicideIntro,
}

mod.UpdateField(encounterDataElysium, "Generated", "ModsNikkelMHadesBiomesGenerated", { "InheritFrom" },
	"EncounterDataElysium")

-- For TimeChallengeElysium
mod.UpdateField(encounterDataElysium, "Challenge", "TimeChallenge", { "InheritFrom" }, "EncounterDataElysium")

-- For tables that should be replaced. The modifications append table data!
-- Can still use modifications if the modified table did not exist beforehand
local encounterReplacements = {
	GeneratedElysium = {
		-- The original from Hades is 2.3 - inherited from Generated
		ActiveEnemyCapBase = 3.9,
		-- The original from Hades is 220
		BaseDifficulty = 300,
		-- The original from Hades is 0.4
		ActiveEnemyCapDepthRamp = 0.7,
		-- The original from Hades is 0.35
		TypeCountDepthRamp = 0.55,
		-- The original from Hades is 70
		DepthDifficultyRamp = 80,
		-- Original is missing HandleEncounterPreSpawns
		StartRoomUnthreadedEvents = {
			{ FunctionName = "HandleEncounterPreSpawns" },
			{ FunctionName = "DisableRoomTraps" },
		},
	},

	PerfectClearChallengeElysium = {
		InheritFrom = { "PerfectClearChallenge", "GeneratedElysium" },
		EnemySet = EnemySets.EnemiesBiome3,
	},
	EliteChallengeElysium = {
		InheritFrom = { "EliteChallenge", "GeneratedElysium" },
		EnemySet = EnemySets.EnemiesBiome3_EliteChallenge,
	},
}

local encounterModifications = {
	-- GENERIC
	DevotionTestElysium = {
		CanEncounterSkip = false,
	},

	-- MINIBOSSES
	MiniBossNakedSpawners = {
		-- Move the max enemies from 6 to 8 and add additional FlurrySpawners when the Vow of Shadows is active
		EnemyCountShrineModifierName = "MinibossCountShrineUpgrade",
		EnemyCountShineModifierAmount = 2,
		ManualWaveTemplates = {
			[1] = {
				Spawns = {
					[3] = {
						Name = "FlurrySpawner",
						TotalCount = 3,
						RequiredMiniBossShrine = true,
					},
				},
			},
		},
	},
	MiniBossMinotaur = {
		-- Without this, the Minotaur will not spawn if a save is loaded
		-- TODO: Doesn't always work
		-- For more consistency, either on the room itself or here invalidate the checkpoint
		-- Or on room enter, run the preplaced function
		PreSpawnEnemies = false,
	},

	-- BOSSES
	-- DelayedStart = true,
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataElysium, encounterModifications, encounterReplacements)
