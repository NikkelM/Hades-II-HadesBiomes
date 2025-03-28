-- TARTARUS
game.EncounterSets.TartarusEncountersDefault = {
	"GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus",
	"GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", --"SurvivalTartarus",
	"GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", --"SurvivalTartarus", "ThanatosTartarus"
}
game.EncounterSets.TartarusEncountersNoSurvival = { "GeneratedTartarus" }

-- ASPHODEL
game.EncounterSets.AsphodelEncountersDefault = {
	"GeneratedAsphodel", "GeneratedAsphodel", "GeneratedAsphodel",
	"GeneratedAsphodel", "GeneratedAsphodel", "GeneratedAsphodel",
	"GeneratedAsphodel", "GeneratedAsphodel", "GeneratedAsphodel", --"ThanatosAsphodel"
}
game.EncounterSets.EncounterEventsWrapping = {
	{ FunctionName = "WrappingEncounterStartPresentation" },
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "BeginWrappingEncounter" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "DisableRoomTraps" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "WrappingEncounterEndPresentation" },
	{ FunctionName = "SpawnRoomReward" },
}
game.EncounterSets.EncounterEventsHydraPhase = {
	{ FunctionName = "HandleEnemySpawns" },
	-- Added to set the spawn point the heads return to before attacking. Needed while Tethers do not work
	{ FunctionName = "ModsNikkelMHadesBiomesRememberHydraSpawnpoint" },
	{ FunctionName = "CheckForEncounterEnemiesDead" },
}

-- ELYSIUM
game.EncounterSets.ElysiumEncountersDefault = {
	"GeneratedElysium", "GeneratedElysium", "GeneratedElysium",
	"GeneratedElysium", "GeneratedElysium", "GeneratedElysium",
	"GeneratedElysium", "GeneratedElysium", "GeneratedElysium", --"ThanatosElysium",
	-- "ThanatosElysiumIntro", "ThanatosElysiumIntro", "ThanatosElysiumIntro"
}

-- STYX
game.EncounterSets.StyxEncountersMini = {
	"GeneratedStyxMini", "GeneratedStyxMini", "GeneratedStyxMini", "GeneratedStyxMini",
}

-- GENERIC
game.EncounterSets.EncounterEventsDefault = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleTrapChains" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}
-- TODO: Implement missing functions
game.EncounterSets.EncounterEventsThanatos = {
	{ FunctionName = "ThanatosPreSpawnPresentation" },
	{ FunctionName = "HandleThanatosSpawn" },
	{ FunctionName = "ThanatosEncounterStartPresentation" },
	{ FunctionName = "BeginThanatosEncounter" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}
game.EncounterSets.EncounterEventsCrawlerMiniBoss = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleTrapChains" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "CrawlerMiniBossEndPresentation" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}
game.EncounterSets.EncounterEventsCharonFight = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
}
