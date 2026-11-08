function mod.ModsNikkelMHadesBiomesSetupFlashbackRoom(source, args)
	-- There's always one eligible, otherwise we wouldn't have loaded the room
	local activeFlashback = {}
	for _, flashbackScene in ipairs(source.ModsNikkelMHadesBiomesFlashbackScenes) do
		if game.IsGameStateEligible(flashbackScene, flashbackScene.OnDeathLoadRequirements) then
			activeFlashback = flashbackScene
			break
		end
	end

	source.ModsNikkelMHadesBiomesActiveFlashback = activeFlashback.Name
	game.LoadVoiceBanks(activeFlashback.SpeakerNames)

	game.SessionState.InFlashback = true
	game.CurrentRun.BlockDeathAreaTransitions = true

	game.SetupRoomArt(game.CurrentRun, source)

	SetAnimation({ Name = source.SwapAnimations.MelinoeIdle, DestinationId = game.CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 480, DestinationId = game.CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "MelArmGlow", DestinationId = game.CurrentRun.Hero.ObjectId })
	game.CurrentRun.Hero.AnimOffsetZ = 125
	game.ToggleCombatControl({ "Rush" }, false, "ModsNikkelMHadesBiomesFlashback")

	game.HideCombatUI("Flashback")
	game.thread(game.PlayVoiceLines, activeFlashback.EnterVoiceLines, true)

	FadeIn({ Duration = 2.0 })
	game.SetupFlashbackMusic(source, args)

	game.thread(game.DisplayInfoBanner, nil, {
		Text = args.NightmareMessage,
		SubtitleText = args.NightmareMessageSubtitle,
		Delay = 0.5,
		Layer = "Overlay",
		AnimationName = "LocationBackingIrisSmallIn",
		AnimationOutName = "LocationBackingIrisSmallOut",
		IconBackingAnimationName = "LocationBackingIrisSubtitleStarIn",
		IconBackingAnimationOutName = "LocationBackingIrisSubtitleStarOut",
		SubtitleOffsetY = 15,
		SubtitleDelay = 0.5,
	})
end

function mod.ModsNikkelMHadesBiomesCompleteFlashbackScene()
	game.SessionMapState.ModsNikkelMHadesBiomesFlashbackComplete = true
end

function mod.ModsNikkelMHadesBiomesConcludeFlashbackRoom(source)
	AddInputBlock({ Name = "ModsNikkelMHadesBiomesConcludingFlashback" })
	UseableOff({ Id = source.ObjectId })
	game.SessionState.InFlashback = false

	StopSound({ Id = game.AudioState.SecretMusicId, Duration = 5 })
	game.AudioState.SecretMusicId = nil
	game.AudioState.SecretMusicName = nil

	AdjustRadialBlurDistance({ Fraction = 3.0, Duration = 2 })
	AdjustRadialBlurStrength({ Fraction = 2, Duration = 2 })
	PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal5FilterSweep" })
	game.wait(1.5)
	game.WaitForSpeechFinished()

	game.FullScreenFadeOutAnimation("ModsNikkelMHadesBiomesRoomTransitionIn")
	game.OverwriteSelf(game.CurrentRun.Hero, game.CurrentHubRoom.RoomExitHeroOverwrites)
	game.CurrentRun.Hero.AnimOffsetZ = game.HeroData.AnimOffsetZ

	game.ToggleCombatControl({ "Rush" }, true, "ModsNikkelMHadesBiomesFlashback")
	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })
	AdjustColorGrading({ Name = "Off", Duration = 0.3 })
	DestroyCameraWalls({})
	game.ShowCombatUI("Flashback")

	game.CurrentHubRoom = nil
	RemoveInputBlock({ Name = "ModsNikkelMHadesBiomesConcludingFlashback" })
	game.RequestSave({
		StartNextMap = game.GameData.HubMapName,
		DevSaveName = game.CreateDevSaveName(game.CurrentRun, {
			StartNextMap = game.GameData.HubMapName,
			PostDeath = true,
		}),
	})
	game.UnloadPackages({ Names = game.PortraitPackages })
	game.LoadMap({ Name = "Hub_Main", ResetBinks = false })
	game.wait(0.6)
	game.ResumeMusic()
end
