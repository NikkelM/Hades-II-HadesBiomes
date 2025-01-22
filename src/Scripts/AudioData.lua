-- Played when starting a Hades run (NOT when entering the Chaos gate at the crossroads, but when entering the first room)
game.GlobalVoiceLines.StartNewHadesRunVoiceLines = {
	Queue = "Never",
	PreLineWait = 0.35,
	RandomRemaining = true,
	GameStateRequirements =
	{
		{
		},
	},

	-- Custom
	{ Cue = "/VO/MelinoeField_0205", Text = "Every bad dream has an escape...", PlayFirst = true },

	-- From the underworld route
	{
		Cue = "/VO/Melinoe_3391",
		Text = "Hence I go...",
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "HecateHideAndSeek01" },
			},
		},
	},
	{ Cue = "/VO/Melinoe_0108",      Text = "I go.", },
	{ Cue = "/VO/Melinoe_0110",      Text = "Commencing.", },
	{ Cue = "/VO/Melinoe_0111",      Text = "Once more.", },
	{ Cue = "/VO/Melinoe_2482",      Text = "Once more, then." },
	{ Cue = "/VO/Melinoe_0375",      Text = "Farewell, Commander.", },
	{ Cue = "/VO/Melinoe_3058_B",    Text = "Here we go." },

	-- From the overworld route
	{ Cue = "/VO/Melinoe_1665",      Text = "With the grace of the Moon." },
	{
		Cue = "/VO/Melinoe_2487",
		Text = "New night, new path.",
		PlayFirst = true,
		GameStateRequirements =
		{
			{
				PathTrue = { "GameState", "SpeechRecord", "/VO/Melinoe_2485" },
			},
			{
				PathTrue = { "PrevRun", "BiomesReached", "F" },
			},
		}
	},
}

game.GlobalVoiceLines.EmptyStartNewHadesRunVoiceLines = {}
