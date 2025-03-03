-- Adds EncounterData for Tartarus from Hades to Hades II

local encounterData = mod.LoadHadesEncounterData("EncounterData.lua")
local encounterDataAsphodel = {
	-- Generic encounters
	-- ModsNikkelMHadesBiomesGenerated = encounterData.Generated,
	GeneratedAsphodel = game.DeepCopyTable(game.EncounterData.GeneratedF),
	-- OpeningGenerated = encounterData.OpeningGenerated,
	DevotionTestAsphodel = encounterData.DevotionTestAsphodel,

	-- Minibosses
	WrappingAsphodel = encounterData.WrappingAsphodel,
	WrappingAsphodel2 = encounterData.WrappingAsphodel2,

	-- Bosses

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
		EnemySet = game.EnemySets.EnemiesBiome2,
		-- The original from Hades is 170, Hades II GeneratedF is 140
		BaseDifficulty = 180,
		-- Load the base Hades II Asphodel package, since we can reuse some enemies
		LoadPackages = { "Asphodel" },
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

	-- BOSSES
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataAsphodel, encounterModifications, encounterReplacements)
