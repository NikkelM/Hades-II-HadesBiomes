-- Adds EncounterData for ShrineChallenges and Charon's fight from Hades to Hades II
local encounterData = mod.LoadHadesEncounterData("EncounterData.lua") or {}
local encounterDataChallengeCharon = {
	-- ShrineChallenge
	BasePerfectClear = encounterData.BasePerfectClear,
	ShrineChallengeTartarus = encounterData.ShrineChallengeTartarus,
	ShrineChallengeAsphodel = encounterData.ShrineChallengeAsphodel,
	ShrineChallengeElysium = encounterData.ShrineChallengeElysium,

	-- Charon
	BossCharon = encounterData.BossCharon,
}

mod.UpdateField(encounterDataChallengeCharon, "Generated", "ModsNikkelMHadesBiomesGenerated", { "InheritFrom" },
	"EncounterData")

-- For TimeChallengeAsphodel
mod.UpdateField(encounterDataChallengeCharon, "Challenge", "TimeChallenge", { "InheritFrom" }, "EncounterData")

-- For tables that should be replaced. The modifications append table data!
-- Can still use modifications if the modified table did not exist beforehand
local encounterReplacements = {
	BasePerfectClear = {
		UnthreadedEvents = mod.EncounterSets.ModsNikkelMHadesBiomesEncounterEventsPerfectClear,
	},
}

local encounterModifications = {
	-- #region ShrineChallenge
	BasePerfectClear = {
		LoadModdedVoiceBanks = { "HadesField" },
		CanEncounterSkip = false,
		BlockAthenaEncounterKeepsake = true,
		BlockNextBiomeEnemyShrineUpgrade = true,
		SpawnAggroed = true,
		NextRoomResumeMusic = true,
		-- For the taunt if the encounter was failed
		ModsNikkelMHadesBiomesPostEncounterPlayHadesTaunt = true,
	},
	ShrineChallengeTartarus = {
		-- The original from Hades is 60
		BaseDifficulty = 75,
		-- BiomeB since the EnemySet contains Bloodless enemies as well
		LoadPackages = { "TartarusModsNikkelMHadesBiomes", "BiomeB" },
	},
	ShrineChallengeAsphodel = {
		-- The original from Hades is 200
		BaseDifficulty = 210,
		LoadPackages = { "AsphodelModsNikkelMHadesBiomes", "BiomeB" },
	},
	ShrineChallengeElysium = {
		-- The original from Hades is 280
		BaseDifficulty = 300,
		LoadPackages = { "ElysiumModsNikkelMHadesBiomes", "BiomeB" },
	},
	-- #endregion

	-- #region Charon
	BossCharon = {
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		SkipBossTraits = true,
		BlockAthenaEncounterKeepsake = true,
		CanEncounterSkip = false,
		BlockRespawnShrineUpgrade = true,
		BlockNextBiomeEnemyShrineUpgrade = true,
	},
	-- #endregion
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataChallengeCharon, encounterModifications, encounterReplacements)
