-- Adds EncounterData for Tartarus from Hades to Hades II

local encounterData = mod.LoadHadesEncounterData("EncounterData.lua")
local encounterDataTartarus = {
	ModsNikkelMHadesBiomesGenerated = encounterData.Generated,
	GeneratedTartarus = game.DeepCopyTable(game.EncounterData.GeneratedF),
	OpeningGenerated = encounterData.OpeningGenerated,

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
		-- Restoring the original from Hades, down from 55 in Hades II GeneratedF
		BaseDifficulty = 30,
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
	ModsNikkelMHadesBiomesGenerated = {
		-- We need to always load the RoomManagerModsNikkelMHadesBiomes package to get animations for non-binked enemies
		LoadPackages = { "RoomManagerModsNikkelMHadesBiomes" },
		BlockTypesAcrossWaves = true,
		UnthreadedEvents = EncounterSets.EncounterEventsDefault,
		CountsForRoomEncounterDepth = true,
	},
	OpeningGenerated = {
		-- First room of the run needs to wait for the boon pickup before spawning enemies
		PreSpawnEnemies = false,
		NoFirstWaveStartDelay = true,
	},
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataTartarus, encounterModifications, encounterReplacements)
