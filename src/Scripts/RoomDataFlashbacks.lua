local deathAreaBedroomHadesFlashbackScenes = {
	{
		Name = "AchillesAboutHadesBedroom01",
		OnDeathLoadRequirements = {
			NamedRequirementsFalse = { "Flashback01Unlocked", "Flashback02Unlocked" },
			{
				PathTrue = { "GameState", "TextLinesRecord", "AchillesAboutHadesBedroom01" },
			},
			{
				PathFalse = { "GameState", "TextLinesRecord", "Inspect_DeathAreaBedroomHades_Portrait_01" },
			},
		},
		SpeakerNames = { "Modsnikkelmhadesbiomesstoryteller", "Modsnikkelmhadesbiomeszagreushome", "ZagreusField", },
		EnterVoiceLines = {
			UsePlayerSource = true,
			PreLineWait = 1.0,
			{ Cue = "/VO/ZagreusField_4518" },
		},
	},
}

local deathAreaBedroomHadesOnDeathLoadRequirements = {}
for _, flashbackScene in ipairs(deathAreaBedroomHadesFlashbackScenes) do
	table.insert(deathAreaBedroomHadesOnDeathLoadRequirements, flashbackScene.OnDeathLoadRequirements)
end

game.HubRoomData.DeathAreaBedroomHades = {
	RichPresence = "#RichPresence_Dream",
	HeroOverwrites = game.DeepCopyTable(game.RoomData.BaseSurface.HeroOverwrites),
	RoomExitHeroOverwrites = game.DeepCopyTable(game.RoomData.BaseSurface.RoomExitHeroOverwrites),
	SwapAnimations = game.DeepCopyTable(game.RoomData.BaseSurface.SwapAnimations),

	ModsNikkelMHadesBiomesFlashbackScenes = deathAreaBedroomHadesFlashbackScenes,
	OnDeathLoadRequirements = deathAreaBedroomHadesOnDeathLoadRequirements,

	BlockCombat = true,

	StartUnthreadedEvents = {
		{
			FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSetupFlashbackRoom",
			Args = {
				NightmareMessage = "NightmareMessage",
				NightmareMessageSubtitle = "NightmareMessage_Subtitle",
				SecretMusic = "/Music/MusicHadesReset2_MC",
			},
		},
	},

	ObstacleData = {
		[488298] = {
			OnUsedGameStateRequirements = {
				{
					PathTrue = { "SessionMapState", "ModsNikkelMHadesBiomesFlashbackComplete" },
				},
			},
			OnUsedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesConcludeFlashbackRoom",
			InteractDistance = 140,
			AutoActivate = true,
		},
	},

	InspectPoints = {
		[555700] = {
			PlayOnce = true,
			UseText = "UseExamineMisc",
			SetupGameStateRequirements = {
				{
					Path = { "CurrentHubRoom", "ModsNikkelMHadesBiomesActiveFlashback" },
					IsAny = { "AchillesAboutHadesBedroom01" },
				},
			},
			InteractTextLineSets = {
				Inspect_DeathAreaBedroomHades_Portrait_01 = {
					PlayOnce = true,
					EndFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesCompleteFlashbackScene",
					EndVoiceLines = {
						UsePlayerSource = true,
						PreLineWait = 0.45,
						-- He's never stopped thinking of her. Ugh, what a fool.
						{ Cue = "/VO/Modsnikkelmhadesbiomeszagreushome_3281" },
					},
					{
						Cue = "/VO/Modsnikkelmhadesbiomesstoryteller_0350",
						Text =
						"{#DialogueItalicFormat}In his Lord Father's very private chambers, Zagreus, the lock-removing prince, discovers a most delicately painted likeness of none other than Persephone, herself. A coat of dust suggests it has remained here for some time.",
					},
				},
			},
		},
	},
}
