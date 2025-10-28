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
	{
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
	},
	-- This one doesn't make sense, as it playes the "Boss" section randomly at depth 2?
	-- {
	-- 	GameStateRequirements = {
	-- 		{
	-- 			PathTrue = { "CurrentRun", "BiomesReached", "Tartarus" },
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
	-- Switch to the more intense section from depth 3 onwards
	{
		GameStateRequirements = {
			{
				PathTrue = { "CurrentRun", "BiomesReached", "Tartarus" },
			},
			{
				PathFalse = { "CurrentRun", "Hero", "IsDead" }
			},
			{
				Path = { "CurrentRun", "RunDepthCache" },
				Comparison = "==",
				Value = 3,
			},
		},
		MusicSection = 3,
	},
	{
		GameStateRequirements =
		{
			{
				PathTrue = { "CurrentRun", "BiomesReached", "Tartarus" },
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
				PathFalse = { "CurrentRun", "CurrentRoom", "RoomSetName", "Styx" },
			},
			{
				FunctionName = "RequiredMusicSectionRoomDuration",
				FunctionArgs = { Value = 2 },
			},
		},
		-- Changed from 1, since that doesn't always work?
		MusicSection = 3,
	},
}
game.RoomStartMusicEvents = game.MergeTables(game.RoomStartMusicEvents, tartarusRoomStartMusicEvents)

-- Once fixed, get from the loaded data
game.MusicTrackData.Tartarus = {
	{ Name = "/Music/MusicHadesReset_MC", },
	{ Name = "/Music/MusicHadesReset2_MC", },
	{ Name = "/Music/MusicHadesReset3_MC", },
	-- "/Music/MusicTartarus4_MC" The audio event for this track does not exist
	{ Name = "{90ac2d7a-7b3a-4a41-a3de-5df2828bcfca}", },
}
game.MusicTrackData.Asphodel = {
	-- "/Music/MusicAsphodel1_MC"
	{ Name = "{e798505f-3f49-4c12-9f8d-779ee6edec25}", },
	{ Name = "/Music/MusicAsphodel2_MC", },
	-- "/Music/MusicAsphodel3_MC"
	{ Name = "{9095ed41-3258-4161-ae60-23f686dfa394}", },
}
game.MusicTrackData.Elysium = {
	{ Name = "/Music/MusicHadesReset_MC", }, -- Is this somehow the Elysium music??
	-- { Name = "/Music/MusicElysium1_MC", }, -- Audio events don't exist? Or file not loaded correctly?
	-- { Name = "/Music/MusicElysium2_MC", },
	-- { Name = "/Music/MusicElysium3_MC", },
}
game.MusicTrackData.Styx = {
	-- "/Music/MusicStyx1_MC"
	{ Name = "{9781c324-6083-4acd-bdaa-5a7a67608005}", },
}

-- Add required GlobalVoiceLines
game.GlobalVoiceLines.HadesDeathTauntVoiceLines = game.GlobalVoiceLines.HadesDeathTauntVoiceLines or
		mod.GlobalVoiceLines.HadesDeathTauntVoiceLines
game.GlobalVoiceLines.HadesPostBossVoiceLines = game.GlobalVoiceLines.HadesPostBossVoiceLines or
		mod.GlobalVoiceLines.HadesPostBossVoiceLines
game.GlobalVoiceLines.HadesWrathAttackVoiceLines = game.GlobalVoiceLines.HadesWrathAttackVoiceLines or
		mod.GlobalVoiceLines.HadesWrathAttackVoiceLines
game.GlobalVoiceLines.HadesBeamAttackVoiceLines = game.GlobalVoiceLines.HadesBeamAttackVoiceLines or
		mod.GlobalVoiceLines.HadesBeamAttackVoiceLines
game.GlobalVoiceLines.FatherSonArgumentVoiceLines = game.GlobalVoiceLines.FatherSonArgumentVoiceLines or
		mod.GlobalVoiceLines.FatherSonArgumentVoiceLines

game.GlobalVoiceLines.MultiFuryFightStartVoiceLines = game.GlobalVoiceLines.MultiFuryFightStartVoiceLines or
		mod.GlobalVoiceLines.MultiFuryFightStartVoiceLines

game.GlobalVoiceLines.ThanatosDeathTauntVoiceLines = game.GlobalVoiceLines.ThanatosDeathTauntVoiceLines or
		mod.GlobalVoiceLines.ThanatosDeathTauntVoiceLines

game.GlobalVoiceLines.PatroclusGreetingLines = game.GlobalVoiceLines.PatroclusGreetingLines or
		mod.GlobalVoiceLines.PatroclusGreetingLines
game.GlobalVoiceLines.PatroclusMutteringLines = game.GlobalVoiceLines.PatroclusMutteringLines or
		mod.GlobalVoiceLines.PatroclusMutteringLines
game.GlobalVoiceLines.BlessedByBouldyVoiceLines = game.GlobalVoiceLines.BlessedByBouldyVoiceLines or
		mod.GlobalVoiceLines.BlessedByBouldyVoiceLines

game.GlobalVoiceLines.TheseusWrathActivationVoiceLines = game.GlobalVoiceLines.TheseusWrathActivationVoiceLines or
		mod.GlobalVoiceLines.TheseusWrathActivationVoiceLines
game.GlobalVoiceLines.TheseusChariotRuinedVoiceLines = game.GlobalVoiceLines.TheseusChariotRuinedVoiceLines or
		mod.GlobalVoiceLines.TheseusChariotRuinedVoiceLines

game.GlobalVoiceLines.CharonSurprisedVoiceLines = game.GlobalVoiceLines.CharonSurprisedVoiceLines or
		mod.GlobalVoiceLines.CharonSurprisedVoiceLines
game.GlobalVoiceLines.ThanatosSpecialExitVoiceLines = game.GlobalVoiceLines.ThanatosSpecialExitVoiceLines or
		mod.GlobalVoiceLines.ThanatosSpecialExitVoiceLines

game.GlobalVoiceLines.PersephoneFirstMeetingIntermissionVoiceLines = game.GlobalVoiceLines
		.PersephoneFirstMeetingIntermissionVoiceLines or mod.GlobalVoiceLines.PersephoneFirstMeetingIntermissionVoiceLines
game.GlobalVoiceLines.SurfaceBoatSightedVoiceLines = game.GlobalVoiceLines.SurfaceBoatSightedVoiceLines or
		mod.GlobalVoiceLines.SurfaceBoatSightedVoiceLines
game.GlobalVoiceLines.StartingBoatRideVoiceLines = game.GlobalVoiceLines.StartingBoatRideVoiceLines or
		mod.GlobalVoiceLines.StartingBoatRideVoiceLines
game.GlobalVoiceLines.SunriseOverlookVoiceLines = game.GlobalVoiceLines.SunriseOverlookVoiceLines or
		mod.GlobalVoiceLines.SunriseOverlookVoiceLines

-- Add required HeroVoiceLines
game.HeroVoiceLines.HitByGraveHandsVoiceLines = game.HeroVoiceLines.HitByGraveHandsVoiceLines or
		mod.HeroVoiceLines.HitByGraveHandsVoiceLines
game.HeroVoiceLines.HitByHadesAmmoVoiceLines = game.HeroVoiceLines.HitByHadesAmmoVoiceLines or
		mod.HeroVoiceLines.HitByHadesAmmoVoiceLines
