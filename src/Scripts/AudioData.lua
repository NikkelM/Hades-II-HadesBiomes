-- Custom events
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

-- Loads AuioData from a file in Hades
mod.CachedHadesAudioData = nil
function mod.LoadHadesAudioData(fileName)
	if mod.CachedHadesAudioData then
		return game.DeepCopyTable(mod.CachedHadesAudioData)
	end
	local originalAmbienceTracks = game.DeepCopyTable(game.AmbienceTracks) or {}
	local originalMusicPlayerTrackOrderData = game.DeepCopyTable(game.MusicPlayerTrackOrderData) or {}
	local originalMusicPlayerTrackData = game.DeepCopyTable(game.MusicPlayerTrackData) or {}
	local originalMusicTrackData = game.DeepCopyTable(game.MusicTrackData) or {}
	local originalRoomStartMusicEvents = game.DeepCopyTable(game.RoomStartMusicEvents) or {}
	local originalCombatOverMusicEvents = game.DeepCopyTable(game.CombatOverMusicEvents) or {}
	local originalGlobalVoiceLines = game.DeepCopyTable(game.GlobalVoiceLines) or {}
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		mod.CachedHadesAudioData = game.DeepCopyTable(GlobalVoiceLines)
		game.GlobalVoiceLines = originalGlobalVoiceLines
		game.CombatOverMusicEvents = originalCombatOverMusicEvents
		game.RoomStartMusicEvents = originalRoomStartMusicEvents
		game.MusicTrackData = originalMusicTrackData
		game.MusicPlayerTrackData = originalMusicPlayerTrackData
		game.MusicPlayerTrackOrderData = originalMusicPlayerTrackOrderData
		game.AmbienceTracks = originalAmbienceTracks
		return game.DeepCopyTable(mod.CachedHadesAudioData)
	else
		mod.DebugPrint("Error loading audioData: " .. err, 1)
	end
end

local audioDataRaw = mod.LoadHadesAudioData("AudioData.lua") or {}
-- Add required GlobalVoiceLines
game.GlobalVoiceLines.HadesDeathTauntVoiceLines = audioDataRaw.HadesDeathTauntVoiceLines
game.GlobalVoiceLines.HadesPostBossVoiceLines = audioDataRaw.HadesPostBossVoiceLines
game.GlobalVoiceLines.HadesWrathAttackVoiceLines = audioDataRaw.HadesWrathAttackVoiceLines
game.GlobalVoiceLines.HadesBeamAttackVoiceLines = audioDataRaw.HadesBeamAttackVoiceLines
game.GlobalVoiceLines.FatherSonArgumentVoiceLines = audioDataRaw.FatherSonArgumentVoiceLines

game.GlobalVoiceLines.MultiFuryFightStartVoiceLines = audioDataRaw.MultiFuryFightStartVoiceLines

game.GlobalVoiceLines.ThanatosDeathTauntVoiceLines = audioDataRaw.ThanatosDeathTauntVoiceLines

game.GlobalVoiceLines.PatroclusGreetingLines = audioDataRaw.PatroclusGreetingLines
game.GlobalVoiceLines.PatroclusMutteringLines = audioDataRaw.PatroclusMutteringLines

game.GlobalVoiceLines.TheseusWrathActivationVoiceLines = audioDataRaw.TheseusWrathActivationVoiceLines
game.GlobalVoiceLines.TheseusChariotRuinedVoiceLines = audioDataRaw.TheseusChariotRuinedVoiceLines

game.GlobalVoiceLines.CharonSurprisedVoiceLines = audioDataRaw.CharonSurprisedVoiceLines
