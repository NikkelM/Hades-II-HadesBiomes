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

local additionalRoomStartMusicEvents = {
	-- {
	-- 	GameStateRequirements =
	-- 	{
	-- 		{
	-- 			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
	-- 			IsAny = { "Tartarus", "Asphodel", "Elysium", "Styx" },
	-- 		},
	-- 		{
	-- 			PathFalse = { "CurrentRun", "Hero", "IsDead" }
	-- 		},
	-- 		{
	-- 			Path = { "CurrentRun", "RunDepthCache" },
	-- 			Comparison = "==",
	-- 			Value = 2,
	-- 		},
	-- 	},
	-- 	MusicSection = 2,
	-- },
	-- {
	-- 	GameStateRequirements =
	-- 	{
	-- 		{
	-- 			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
	-- 			IsAny = { "Tartarus", "Asphodel", "Elysium", "Styx" },
	-- 		},
	-- 		{
	-- 			PathFalse = { "CurrentRun", "Hero", "IsDead" }
	-- 		},
	-- 		{
	-- 			Path = { "CurrentRun", "RunDepthCache" },
	-- 			Comparison = "==",
	-- 			Value = 3,
	-- 		},
	-- 	},
	-- 	MusicSection = 3,
	-- },
	{
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
				IsAny = { "Tartarus", "Asphodel", "Elysium", },
			},
			{
				PathFalse = { "CurrentRun", "Hero", "IsDead" }
			},
			{
				Path = { "AudioState", "MusicSection", },
				Comparison = "==",
				Value = 0,
			},
			{
				Path = { "CurrentRun", "RunDepthCache" },
				Comparison = ">",
				Value = 3,
			},
			{
				FunctionName = "RequiredMusicSectionRoomDuration",
				FunctionArgs = { Value = 2 },
			},
		},
		MusicSection = 1,
	},
	{
		GameStateRequirements =
		{
			{
				Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
				IsAny = { "Tartarus", "Asphodel", "Elysium", "Styx" },
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
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsNone = { "X_Wrapping01", "X_Intro", "C_Intro", "D_Intro", "A_Reprieve01", "X_Reprieve01", "C_Reprieve01", "D_Reprieve01", "B_Story01", },
			},
		},
		PlayBiomeMusic = true,
		MusicSection = 0,
		UseRoomMusicSection = true,
	},
}

for _, event in ipairs(additionalRoomStartMusicEvents) do
	table.insert(game.RoomStartMusicEvents, event)
end
-- game.RoomStartMusicEvents = additionalRoomStartMusicEvents

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
