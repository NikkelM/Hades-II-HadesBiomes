local newObjectiveData = {
	ModsNikkelMHadesBiomesOpenInventory = { Description = "Objective_OpenInventory", },
}
mod.AddTableKeysSkipDupes(game.ObjectiveData, newObjectiveData)

local newObjectiveSetData = {
	ThanatosChallenge = {
		AllowRepeat = true,
		ManualActivationOnly = true,
		OverrideExistingObjective = true,
		Objectives = {
			{ "ThanatosKills", "PlayerKills" },
		},
	},
	SurvivalChallenge = {
		AllowRepeat = true,
		ManualActivationOnly = true,
		Objectives = {
			{ "SurvivalChallenge" }
		},
	},
	-- Shown the first time a modded resource is picked up
	ModsNikkelMHadesBiomesOpenInventory = {
		ManualActivationOnly = true,
		Objectives = {
			{ "OpenInventory" },
		},
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" }
			},
			{
				-- To not show it when pacifying a shade
				Path = { "GameState", "LifetimeResourcesGained" },
				HasAny = mod.AllNewResourceNames,
			}
		}
	}
}
mod.AddTableKeysSkipDupes(game.ObjectiveSetData, newObjectiveSetData)
