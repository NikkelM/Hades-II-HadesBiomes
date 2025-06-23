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
	{ Name = "/Music/MusicHadesReset_MC", }, -- Is this somehow the Elysium music??
	-- { Name = "/Music/MusicElysium1_MC", }, -- Audio events don't exist? Or file not loaded correctly?
	-- { Name = "/Music/MusicElysium2_MC", },
	-- { Name = "/Music/MusicElysium3_MC", },
}
game.MusicTrackData.Styx = {
	{ Name = "/Music/MusicStyx1_MC", },
}
