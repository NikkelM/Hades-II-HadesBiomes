-- Tartarus
game.EncounterSets.TartarusEncountersDefault =
{
	"GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus",
	-- "GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", "SurvivalTartarus",
	-- "GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", "SurvivalTartarus", "ThanatosTartarus"
}

game.EncounterSets.TartarusEncountersNoSurvival = { "GeneratedTartarus" }

game.EncounterSets.EncounterEventsGenerated = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleTrapChains" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" }
}

game.EncounterSets.EncounterEventsDefault = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleTrapChains" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}
