-- Custom events
-- Played when starting a Hades run (when entering the Chaos gate at the crossroads)
mod.StartNewHadesRunVoiceLines = {
	Queue = "Never",
	PreLineWait = 0.35,
	RandomRemaining = true,
	GameStateRequirements = { {}, },

	-- Custom
	{ Cue = "/VO/MelinoeField_0205", Text = "Every bad dream has an escape...", PlayFirst = true },

	-- From the underworld route
	{ Cue = "/VO/Melinoe_3391",      Text = "Hence I go...", },
	{ Cue = "/VO/Melinoe_0108",      Text = "I go.", },
	{ Cue = "/VO/Melinoe_0110",      Text = "Commencing.", },
	{ Cue = "/VO/Melinoe_0111",      Text = "Once more.", },
	{ Cue = "/VO/Melinoe_2482",      Text = "Once more, then." },
	{ Cue = "/VO/Melinoe_0375",      Text = "Farewell, Commander.", },
	{ Cue = "/VO/Melinoe_3058_B",    Text = "Here we go." },

	-- From the overworld route
	{ Cue = "/VO/Melinoe_1665",      Text = "With the grace of the Moon." },
	{ Cue = "/VO/Melinoe_2487",      Text = "New night, new path.", },
}

game.GlobalVoiceLines.EmptyStartNewHadesRunVoiceLines = {}

-- Events from Hades
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

-- Once fixed, get from the loaded data
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

-- Add required GlobalVoiceLines
game.GlobalVoiceLines.HadesDeathTauntVoiceLines = mod.GlobalVoiceLines.HadesDeathTauntVoiceLines
game.GlobalVoiceLines.HadesPostBossVoiceLines = mod.GlobalVoiceLines.HadesPostBossVoiceLines
game.GlobalVoiceLines.HadesWrathAttackVoiceLines = mod.GlobalVoiceLines.HadesWrathAttackVoiceLines
game.GlobalVoiceLines.HadesBeamAttackVoiceLines = mod.GlobalVoiceLines.HadesBeamAttackVoiceLines
game.GlobalVoiceLines.FatherSonArgumentVoiceLines = mod.GlobalVoiceLines.FatherSonArgumentVoiceLines

game.GlobalVoiceLines.MultiFuryFightStartVoiceLines = mod.GlobalVoiceLines.MultiFuryFightStartVoiceLines

game.GlobalVoiceLines.ThanatosDeathTauntVoiceLines = mod.GlobalVoiceLines.ThanatosDeathTauntVoiceLines

game.GlobalVoiceLines.PatroclusGreetingLines = mod.GlobalVoiceLines.PatroclusGreetingLines
game.GlobalVoiceLines.PatroclusMutteringLines = mod.GlobalVoiceLines.PatroclusMutteringLines
game.GlobalVoiceLines.BlessedByBouldyVoiceLines = mod.GlobalVoiceLines.BlessedByBouldyVoiceLines

game.GlobalVoiceLines.TheseusWrathActivationVoiceLines = mod.GlobalVoiceLines.TheseusWrathActivationVoiceLines
game.GlobalVoiceLines.TheseusChariotRuinedVoiceLines = mod.GlobalVoiceLines.TheseusChariotRuinedVoiceLines

game.GlobalVoiceLines.CharonSurprisedVoiceLines = mod.GlobalVoiceLines.CharonSurprisedVoiceLines
game.GlobalVoiceLines.ThanatosSpecialExitVoiceLines = mod.GlobalVoiceLines.ThanatosSpecialExitVoiceLines
