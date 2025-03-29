-- Played when starting a Hades run (NOT when entering the Chaos gate at the crossroads, but when entering the first room)
game.GlobalVoiceLines.StartNewHadesRunVoiceLines = {
	Queue = "Never",
	PreLineWait = 0.35,
	RandomRemaining = true,
	GameStateRequirements = { {}, },

	-- Custom
	{ Cue = "/VO/MelinoeField_0205", Text = "Every bad dream has an escape...", PlayFirst = true },

	-- From the underworld route
	{
		Cue = "/VO/Melinoe_3391",
		Text = "Hence I go...",
		GameStateRequirements = {
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
		GameStateRequirements = {
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

local tartarusRoomStartMusicEvents = {
	GameStateRequirements = {
		{
			PathTrue = { "CurrentRun", "BiomesReached", "Tartarus" },
		},
		{
			PathFalse = { "CurrentRun", "Hero", "IsDead" }
		},
		{
			PathFalse = { "AudioState", "MusicId" },
		},
		{
			PathFalse = { "AudioState", "SecretMusicId" },
		},
	},
	PlayBiomeMusic = true,
	MusicSection = 0,
	UseRoomMusicSection = true,
}
table.insert(game.RoomStartMusicEvents, tartarusRoomStartMusicEvents)

game.MusicTrackData.Tartarus = {
	{ Name = "/Music/MusicHadesReset_MC", },
	{ Name = "/Music/MusicHadesReset2_MC", },
	{ Name = "/Music/MusicHadesReset3_MC", },
	-- { Name = "/Music/MusicTartarus4_MC", }, -- The audio event for this track does not exist - #56
}
game.MusicTrackData.Asphodel = {
	-- { Name = "/Music/MusicAsphodel1_MC", }, -- The audio event for this track does not exist - #82
	{ Name = "/Music/MusicAsphodel2_MC", },
	-- { Name = "/Music/MusicAsphodel3_MC", }, -- The audio event for this track does not exist - #82
}
game.MusicTrackData.Elysium = {
	{ Name = "/Music/MusicElysium1_MC", },
	{ Name = "/Music/MusicElysium2_MC", },
	{ Name = "/Music/MusicElysium3_MC", },
}
game.MusicTrackData.Styx = {
	{ Name = "/Music/MusicStyx1_MC", },
}
