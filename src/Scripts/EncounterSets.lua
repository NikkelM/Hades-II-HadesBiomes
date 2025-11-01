-- #region TARTARUS
game.EncounterSets.TartarusEncountersDefault = {
	"GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus",
	"GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", "SurvivalTartarus",
	"GeneratedTartarus", "GeneratedTartarus", "GeneratedTartarus", "SurvivalTartarus",
	"ThanatosTartarus"
}
game.EncounterSets.TartarusEncountersNoSurvival = { "GeneratedTartarus" }
-- #endregion

-- #region ASPHODEL
game.EncounterSets.AsphodelEncountersDefault = {
	"GeneratedAsphodel", "GeneratedAsphodel", "GeneratedAsphodel",
	"GeneratedAsphodel", "GeneratedAsphodel", "GeneratedAsphodel",
	"GeneratedAsphodel", "GeneratedAsphodel", "GeneratedAsphodel",
	"ThanatosAsphodel"
}
game.EncounterSets.EncounterEventsWrapping = {
	{ FunctionName = _PLUGIN.guid .. "." .. "WrappingEncounterStartPresentation" },
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = _PLUGIN.guid .. "." .. "BeginWrappingEncounter" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "DisableRoomTraps" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = _PLUGIN.guid .. "." .. "WrappingEncounterEndPresentation" },
	{ FunctionName = "SpawnRoomReward" },
}
game.EncounterSets.EncounterEventsHydraPhase = {
	{ FunctionName = "HandleEnemySpawns" },
	-- Added to set the spawn point the heads return to before attacking. Needed while Tethers do not work
	{ FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesRememberHydraSpawnpoint" },
	{ FunctionName = "CheckForEncounterEnemiesDead" },
}
-- #endregion

-- #region ELYSIUM
game.EncounterSets.ElysiumEncountersDefault = {
	"GeneratedElysium", "GeneratedElysium", "GeneratedElysium",
	"GeneratedElysium", "GeneratedElysium", "GeneratedElysium",
	"GeneratedElysium", "GeneratedElysium", "GeneratedElysium", "ThanatosElysium",
	"ThanatosElysiumIntro", "ThanatosElysiumIntro", "ThanatosElysiumIntro"
}
-- #endregion

-- #region STYX
game.EncounterSets.StyxEncountersMini = {
	"GeneratedStyxMini", "GeneratedStyxMini", "GeneratedStyxMini", "GeneratedStyxMini",
}
-- #endregion

-- #region GENERIC
game.EncounterSets.EncounterEventsDefault = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleTrapChains" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}
game.EncounterSets.EncounterEventsThanatos = {
	{ FunctionName = _PLUGIN.guid .. "." .. "ThanatosPreSpawnPresentation" },
	{ FunctionName = _PLUGIN.guid .. "." .. "HandleThanatosSpawn" },
	{ FunctionName = _PLUGIN.guid .. "." .. "ThanatosEncounterStartPresentation" },
	{ FunctionName = _PLUGIN.guid .. "." .. "BeginThanatosEncounter" },
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
	{ FunctionName = _PLUGIN.guid .. "." .. "CrawlerMiniBossEndPresentation" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}
game.EncounterSets.EncounterEventsCharonFight = {
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "HandleEnemySpawns" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
}

mod.EncounterSets = mod.EncounterSets or {}
mod.EncounterSets.ModsNikkelMHadesBiomesEncounterEventsSurvival = {
	{ FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSurvivalEncounterStartPresentation" },
	{ FunctionName = "EncounterAudio" },
	{ FunctionName = "BeginSurvivalEncounter" },
	{ FunctionName = "HandleTimedSpawns" },
	{ FunctionName = "DisableRoomTraps" },
	{ FunctionName = "CheckForAllEnemiesDead" },
	{ FunctionName = "PostCombatAudio" },
	{ FunctionName = "SpawnRoomReward" },
}
-- #endregion
