-- Tartarus
game.EncounterSets.TartarusEncountersDefault = {
	"GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus",
	-- "GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", "SurvivalTartarus",
	-- "GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", "SurvivalTartarus", "ThanatosTartarus"
}
game.EncounterSets.TartarusEncountersNoSurvival = { "GeneratedTartarus" }

-- Asphodel
game.EncounterSets.AsphodelEncountersDefault = {
	"GeneratedAsphodel", "GeneratedAsphodel", "GeneratedAsphodel",
	"GeneratedAsphodel", "GeneratedAsphodel", "GeneratedAsphodel",
	-- "GeneratedAsphodel", "GeneratedAsphodel", "GeneratedAsphodel", "ThanatosAsphodel"
}
-- TODO: Implement missing functions
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
	{ FunctionName = "CheckForEncounterEnemiesDead" },
}

-- Elysium
game.EncounterSets.ElysiumEncountersDefault = {
	"GeneratedElysium", "GeneratedElysium", "GeneratedElysium",
	"GeneratedElysium", "GeneratedElysium", "GeneratedElysium",
	-- "GeneratedElysium", "GeneratedElysium", "GeneratedElysium", "ThanatosElysium",
	-- "ThanatosElysiumIntro", "ThanatosElysiumIntro", "ThanatosElysiumIntro"
}

-- Styx
game.EncounterSets.StyxEncountersMini = {
	"GeneratedStyxMini", "GeneratedStyxMini", "GeneratedStyxMini", "GeneratedStyxMini",
}

-- Generic
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
	-- { FunctionName = "EncounterAudio" },
	{ FunctionName = "BeginThanatosEncounter" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}

-- TODO: Implement missing functions
game.EncounterSets.EncounterEventsCrawlerMiniBoss = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleTrapChains" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "CrawlerMiniBossEndPresentation" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}

-- TODO: Implement missing functions
game.EncounterSets.EncounterEventsOnslaught = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleCoverSpawns" },
	{ FunctionName = "SpawnOnslaughtObjects" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}

game.EncounterSets.EncounterEventsCharonFight = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
}
