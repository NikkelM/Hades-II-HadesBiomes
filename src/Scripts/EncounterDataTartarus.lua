-- Adds EncounterData for Tartarus from Hades to Hades II

local encounterData = mod.LoadHadesEncounterData("EncounterData.lua")
local encounterDataTartarus = {
	ModsNikkelMHadesBiomesGenerated = encounterData.Generated,
	GeneratedTartarus = encounterData.GeneratedTartarus,
	OpeningGenerated = encounterData.OpeningGenerated,
}

mod.UpdateInheritFrom(encounterDataTartarus, "Generated", "ModsNikkelMHadesBiomesGenerated")

-- The "Generated" encounter in Hades II uses this to place enemies, Hades doesn't have this
encounterDataTartarus.ModsNikkelMHadesBiomesGenerated.StartRoomUnthreadedEvents =
{
	{
		FunctionName = "HandleEncounterPreSpawns"
	}
}
-- We need to always load the RoomManagerModsNikkelMHadesBiomes package to get animations for non-binked enemies
encounterDataTartarus.ModsNikkelMHadesBiomesGenerated.LoadPackages = { "RoomManagerModsNikkelMHadesBiomes" }
-- First room of the run needs to wait for the boon pickup before spawning enemies
encounterDataTartarus.OpeningGenerated.PreSpawnEnemies = false
-- Also adapt to the Hades II way of handling the first room
encounterDataTartarus.OpeningGenerated.UnthreadedEvents =
{
	{
		FunctionName = "SpawnRoomReward",
		Args =
		{
			WaitUntilPickup = true,
		}
	},
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "BeginOpeningEncounter" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
}

local encounterModifications = {}

mod.ApplyModificationsAndInheritEncounterData(encounterDataTartarus, encounterModifications)
