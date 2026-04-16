game.TraitData.ChaosHiddenRoomRewardCurse.GameStateRequirements = {
	OrRequirements = {
		-- Vanilla
		{
			{
				PathTrue = { "CurrentRun", "BiomesReached", "F" },
			},
			{
				PathFalse = { "CurrentRun", "BiomesReached", "I" },
			},
		},
		-- Zagreus' Journey
		{
			{
				PathTrue = { "CurrentRun", "BiomesReached", "Tartarus" },
			},
		},
	},
}
