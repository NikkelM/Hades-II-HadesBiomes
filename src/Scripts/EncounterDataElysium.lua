-- Adds EncounterData for Elysium from Hades to Hades II
local encounterData = mod.LoadHadesEncounterData("EncounterData.lua") or {}
local encounterDataElysium = {
	-- Generic encounters
	GeneratedElysium = encounterData.GeneratedElysium,
	DevotionTestElysium = encounterData.DevotionTestElysium,

	-- Minibosses

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
		-- TODO: Set values
		-- The original from Hades is
		ActiveEnemyCapBase = 8.5,
		-- The original from Hades is
		BaseDifficulty = 200,
		-- The original from Hades is
		ActiveEnemyCapDepthRamp = 1.3,
		-- The original from Hades is
		TypeCountDepthRamp = 0.55,
		-- The original from Hades is
		DepthDifficultyRamp = 30,
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

	-- BOSSES

}

mod.ApplyModificationsAndInheritEncounterData(encounterDataElysium, encounterModifications, encounterReplacements)
