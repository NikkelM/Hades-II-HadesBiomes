game.ObjectiveSetData.ThanatosChallenge = game.ObjectiveSetData.ThanatosChallenge or {
	AllowRepeat = true,
	ManualActivationOnly = true,
	OverrideExistingObjective = true,
	Objectives = {
		{ "ThanatosKills", "PlayerKills" },
	},
}

game.ObjectiveSetData.SurvivalChallenge = game.ObjectiveSetData.SurvivalChallenge or {
	AllowRepeat = true,
	ManualActivationOnly = true,
	Objectives = {
		{ "SurvivalChallenge" }
	},
}
