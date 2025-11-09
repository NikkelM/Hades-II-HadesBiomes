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
	-- 			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
	-- 			IsNone = { "Styx" },
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
				Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
				IsNone = { "Styx" },
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
				Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
				IsNone = { "Styx" },
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
	{ Name = "/Music/MusicHadesReset_MC", },
	-- "/Music/MusicElysium1_MC"
	{ Name = "{9f9f6ebf-11f0-4c2f-8f2c-42f703be4b7d}", },
	-- "/Music/MusicElysium2_MC"
	{ Name = "{a843c030-5860-4c98-9f09-e25ea9372e28}", },
	-- "/Music/MusicElysium3_MC"
	{ Name = "{589a7217-b8c2-4cfb-b27b-45036c0f5875}", },
}
game.MusicTrackData.Styx = {
	-- "/Music/MusicStyx1_MC"
	{ Name = "{9781c324-6083-4acd-bdaa-5a7a67608005}", },
}

-- Replace cues with the modded name
local requiredGlobalVoiceLineModifications = {
	-- HadesDeathTauntVoiceLines = {
	-- 	Find = "Hades_",
	-- 	Replace = "HadesField_0"
	-- },
	HadesPostBossVoiceLines = {
		Find = "Intercom_",
		Replace = "HadesField_1",
	},
	SurvivalEncounterStartVoiceLines = {
		Find = "Intercom_",
		Replace = "HadesField_1",
	},
	SurvivalEncounterSurvivedVoiceLines = {
		Find = "Intercom_",
		Replace = "HadesField_1",
	},
	PersephoneFishCaughtVoiceLines = {
		Find = "Persephone_",
		Replace = "Megaera_2",
	},
	ModsNikkelMHadesBiomes_FishNotCaughtVoiceLines = {
		Find = "Persephone_",
		Replace = "Megaera_2",
	},
}
local function processCue(data, replacement)
	if data.Cue ~= nil then
		data.Cue = string.gsub(data.Cue, replacement.Find, replacement.Replace)
	end
	if type(data) == "table" then
		for _, innerData in ipairs(data) do
			processCue(innerData, replacement)
		end
	end
end

for voicelineGroup, replacement in pairs(requiredGlobalVoiceLineModifications) do
	for index, data in ipairs(mod.GlobalVoiceLines[voicelineGroup]) do
		processCue(data, replacement)
	end
end

-- Add required GlobalVoiceLines
-- These would overlap with Melinoe's own voicelines when dying
-- game.GlobalVoiceLines.HadesDeathTauntVoiceLines = game.GlobalVoiceLines.HadesDeathTauntVoiceLines or
-- 		mod.GlobalVoiceLines.HadesDeathTauntVoiceLines
game.GlobalVoiceLines.HadesPostBossVoiceLines = game.GlobalVoiceLines.HadesPostBossVoiceLines or
		mod.GlobalVoiceLines.HadesPostBossVoiceLines
game.GlobalVoiceLines.HadesWrathAttackVoiceLines = game.GlobalVoiceLines.HadesWrathAttackVoiceLines or
		mod.GlobalVoiceLines.HadesWrathAttackVoiceLines
game.GlobalVoiceLines.HadesBeamAttackVoiceLines = game.GlobalVoiceLines.HadesBeamAttackVoiceLines or
		mod.GlobalVoiceLines.HadesBeamAttackVoiceLines
game.GlobalVoiceLines.FatherSonArgumentVoiceLines = game.GlobalVoiceLines.FatherSonArgumentVoiceLines or
		mod.GlobalVoiceLines.FatherSonArgumentVoiceLines
game.GlobalVoiceLines.HadesSighVoiceLines = game.GlobalVoiceLines.HadesSighVoiceLines or
		mod.GlobalVoiceLines.HadesSighVoiceLines

game.GlobalVoiceLines.MultiFuryFightStartVoiceLines = game.GlobalVoiceLines.MultiFuryFightStartVoiceLines or
		mod.GlobalVoiceLines.MultiFuryFightStartVoiceLines

-- game.GlobalVoiceLines.ThanatosGreetingVoiceLines = game.GlobalVoiceLines.ThanatosGreetingVoiceLines or
-- 		mod.GlobalVoiceLines.ThanatosGreetingVoiceLines
game.GlobalVoiceLines.ThanatosDeathTauntVoiceLines = game.GlobalVoiceLines.ThanatosDeathTauntVoiceLines or
		mod.GlobalVoiceLines.ThanatosDeathTauntVoiceLines
game.GlobalVoiceLines.ThanatosSpecialExitVoiceLines = game.GlobalVoiceLines.ThanatosSpecialExitVoiceLines or
		mod.GlobalVoiceLines.ThanatosSpecialExitVoiceLines

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

game.GlobalVoiceLines.PersephoneFirstMeetingIntermissionVoiceLines = game.GlobalVoiceLines
		.PersephoneFirstMeetingIntermissionVoiceLines or mod.GlobalVoiceLines.PersephoneFirstMeetingIntermissionVoiceLines
game.GlobalVoiceLines.SurfaceBoatSightedVoiceLines = game.GlobalVoiceLines.SurfaceBoatSightedVoiceLines or
		mod.GlobalVoiceLines.SurfaceBoatSightedVoiceLines
game.GlobalVoiceLines.StartingBoatRideVoiceLines = game.GlobalVoiceLines.StartingBoatRideVoiceLines or
		mod.GlobalVoiceLines.StartingBoatRideVoiceLines
game.GlobalVoiceLines.SunriseOverlookVoiceLines = game.GlobalVoiceLines.SunriseOverlookVoiceLines or
		mod.GlobalVoiceLines.SunriseOverlookVoiceLines

game.GlobalVoiceLines.SurvivalEncounterStartVoiceLines = game.GlobalVoiceLines.SurvivalEncounterStartVoiceLines or
		mod.GlobalVoiceLines.SurvivalEncounterStartVoiceLines
game.GlobalVoiceLines.SurvivalEncounterSurvivedVoiceLines = game.GlobalVoiceLines.SurvivalEncounterSurvivedVoiceLines or
		mod.GlobalVoiceLines.SurvivalEncounterSurvivedVoiceLines
game.GlobalVoiceLines.SurvivalAboutToStartVoiceLines = game.GlobalVoiceLines.SurvivalAboutToStartVoiceLines or
		mod.GlobalVoiceLines.SurvivalAboutToStartVoiceLines
game.GlobalVoiceLines.SurvivalStartVoiceLines = game.GlobalVoiceLines.SurvivalStartVoiceLines or
		mod.GlobalVoiceLines.SurvivalStartVoiceLines
game.GlobalVoiceLines.SurvivalExpiringVoiceLines = game.GlobalVoiceLines.SurvivalExpiringVoiceLines or
		mod.GlobalVoiceLines.SurvivalExpiringVoiceLines
game.GlobalVoiceLines.SurvivalResolvedVoiceLines = game.GlobalVoiceLines.SurvivalResolvedVoiceLines or
		mod.GlobalVoiceLines.SurvivalResolvedVoiceLines

game.GlobalVoiceLines.PatroclusFishCaughtVoiceLines = game.GlobalVoiceLines.PatroclusFishCaughtVoiceLines or
		mod.GlobalVoiceLines.PatroclusFishCaughtVoiceLines
game.GlobalVoiceLines.PersephoneFishCaughtVoiceLines = game.GlobalVoiceLines.PersephoneFishCaughtVoiceLines or
		mod.GlobalVoiceLines.PersephoneFishCaughtVoiceLines
game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishCaughtVoiceLines = game.GlobalVoiceLines
		.ModsNikkelMHadesBiomes_FishCaughtVoiceLines or
		mod.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishCaughtVoiceLines
game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishIdentifiedVoiceLines = game.GlobalVoiceLines
		.ModsNikkelMHadesBiomes_FishIdentifiedVoiceLines or
		mod.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishIdentifiedVoiceLines
game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishingInitiatedVoiceLines = game.GlobalVoiceLines
		.ModsNikkelMHadesBiomes_FishingInitiatedVoiceLines or
		mod.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishingInitiatedVoiceLines
game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtVoiceLines = game.GlobalVoiceLines
		.ModsNikkelMHadesBiomes_FishNotCaughtVoiceLines or
		mod.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtVoiceLines
game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtTooLateVoiceLines = game.GlobalVoiceLines
		.ModsNikkelMHadesBiomes_FishNotCaughtTooLateVoiceLines or
		mod.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtTooLateVoiceLines
game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtWayTooLateVoiceLines = game.GlobalVoiceLines
		.ModsNikkelMHadesBiomes_FishNotCaughtWayTooLateVoiceLines or
		mod.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtWayTooLateVoiceLines
-- Insert reactions into Hades II tables
table.insert(game.HeroVoiceLines.FishNotCaughtTooLateVoiceLines, 1,
	mod.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtTooLateVoiceLines_PatroclusReaction)
table.insert(game.HeroVoiceLines.FishNotCaughtVoiceLines, 1,
	mod.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtTooLateVoiceLines_PatroclusReaction)

-- Add required HeroVoiceLines
game.HeroVoiceLines.HitByGraveHandsVoiceLines = game.HeroVoiceLines.HitByGraveHandsVoiceLines or
		mod.HeroVoiceLines.HitByGraveHandsVoiceLines
game.HeroVoiceLines.HitByHadesAmmoVoiceLines = game.HeroVoiceLines.HitByHadesAmmoVoiceLines or
		mod.HeroVoiceLines.HitByHadesAmmoVoiceLines

game.HeroVoiceLines.ThanatosSpawningVoiceLines = game.HeroVoiceLines.ThanatosSpawningVoiceLines or
		mod.HeroVoiceLines.ThanatosSpawningVoiceLines

game.HeroVoiceLines.ModsNikkelMHadesBiomes_ElysiumShadeVoiceLines = mod.HeroVoiceLines
		.ModsNikkelMHadesBiomes_ElysiumShadeVoiceLines
game.HeroVoiceLines.ModsNikkelMHadesBiomes_MelinoeDBossExitVoiceLines = mod.HeroVoiceLines
		.ModsNikkelMHadesBiomes_MelinoeDBossExitVoiceLines
