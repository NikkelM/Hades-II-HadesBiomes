-- #region E_Intro
function mod.RoomEntranceE_Intro(currentRun, currentRoom)
	game.HideCombatUI("Surface")
	game.ZeroMouseTether("RoomEntrance")
	local roomIntroSequenceDuration = currentRoom.IntroSequenceDuration or game.RoomData.BaseRoom.IntroSequenceDuration or
			0.0

	FadeOut({ Color = game.Color.Black, Duration = 0 })
	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
	AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })

	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay = 0 })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.03, Delay = 0 })

	AdjustFullscreenBloom({ Name = "Off", Duration = 5.0, Delay = 0.1 })

	-- Replacing OutdoorAmbientSoundId with AudioState.RainSoundId
	SetVolume({ Id = game.AudioState.RainSoundId, Value = 0.0, Duration = 5 })
	game.AudioState.RainSoundId = nil

	game.wait(0.03)

	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
	SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })

	if game.GameState.TextLinesRecord["PersephoneFirstMeeting"] == nil then
		game.SetupMelWalk()
	else
		roomIntroSequenceDuration = 0.95
	end

	AdjustZoom({ Fraction = game.CurrentRun.CurrentRoom.IntroZoomFraction or 0.7, Duration = 0.0 })
	FadeIn({ Duration = 4.9 })
	PanCamera({ Id = currentRoom.CameraEndPoint, Duration = roomIntroSequenceDuration, EaseIn = 0.0, EaseOut = 1.5 })
	game.FullScreenFadeInAnimation("RoomTransitionOutBlack")

	-- TODO
	game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
	-- TODO
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true)

	if currentRoom.HeroEndPoint ~= nil then
		Move({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint, Mode = "Precise" })

		local notifyName = "WithinDistance" .. currentRoom.HeroEndPoint
		NotifyWithinDistance({
			Id = currentRun.Hero.ObjectId,
			DestinationId = currentRoom.HeroEndPoint,
			Distance = 80,
			Notify = notifyName
		})
		game.waitUntil(notifyName)
		game.wait(1.0)
	end
	Stop({ Id = currentRun.Hero.ObjectId })

	if game.GameState.TextLinesRecord["PersephoneFirstMeeting"] ~= nil then
		game.RestoreMelRun(currentRun.Hero, { SkipWalkStopAnimation = false })
	end

	-- TODO: Debugging only
	game.RestoreMelRun(currentRun.Hero, { SkipWalkStopAnimation = false })

	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = currentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })

	LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0 })
	game.UnzeroMouseTether("RoomEntrance")

	game.thread(mod.DisplaySurfaceLocationText, currentRun, currentRoom)
end

function mod.DisplaySurfaceLocationText(currentRun, currentRoom)
	game.wait(0.5)

	local locationTextColor = currentRoom.LocationTextColor or { 255, 0, 0, 255 }
	if currentRoom.LocationText then
		game.thread(mod.DisplayLocationText, nil,
			{
				Text = currentRoom.LocationText,
				Delay = 0.65,
				FadeColor = locationTextColor,
				AnimationName = currentRoom.LocationAnimName,
				AnimationOutName = currentRoom.LocationAnimOutName,
			})
	end

	game.wait(1.2)
	game.thread(game.CheckLocationUnlock, nil, { Biome = "Surface" })
end

-- #region Overlook
function mod.SunriseOverlook(room, args)
	if not game.GameState.Flags.Overlook then
		game.GameState.Flags.Overlook = true

		SetSoundCueValue({ Id = game.AudioState.MusicId, Names = { "LowPass" }, Value = 1.0, Duration = 0.5 })
		SetSoundCueValue({ Id = game.AudioState.MusicId, Names = { "Keys" }, Value = 0.0, Duration = 3.0 })
		SetVolume({ Id = game.AudioState.MusicId, Value = 0.7, Duration = 1.5 })
		PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })

		-- TODO
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.SunriseOverlookVoiceLines, true)
		game.SetCameraFocusOverride()
		game.HideCombatUI("Overlook")

		game.wait(0.6, "OverlookThread")
		if game.GameState.Flags.Overlook then
			PanCamera({ Id = args.PanTargetId, Duration = args.CameraPanDuration or 8, EaseIn = 0, EaseOut = 1, Retarget = true })
			FocusCamera({ Fraction = args.ZoomFraction, Duration = args.CameraPanDuration or 8, ZoomType = "Ease" })
		end

		game.wait(args.SunriseStartDelay or 6.0, "OverlookThread")
		mod.HandleSunrise(room, args)
	end
end

function mod.HandleSunrise(room, args)
	if room.SunriseActivated then
		return
	end
	room.SunriseActivated = true
	for k, changeData in pairs(args.ObstacleChanges) do
		game.thread(mod.SunriseChange, args, changeData)
	end
end

function mod.SunriseChange(args, changeData)
	if changeData.Delay ~= nil then
		game.wait(changeData.Delay)
	end
	if changeData.ChangeColor ~= nil then
		SetColor({
			Ids = changeData.ObstacleIds,
			Color = changeData.ChangeColor,
			Duration = changeData.Duration or args.Duration,
			SetBase = true,
			EaseIn = 0,
			EaseOut = 1
		})
	end
	if changeData.ChangeHSV ~= nil then
		changeData.ChangeHSV[1] = changeData.ChangeHSV[1] / 360
		changeData.ChangeHSV[2] = changeData.ChangeHSV[2] / 100
		changeData.ChangeHSV[3] = changeData.ChangeHSV[3] / 100
		SetHSV({
			Ids = changeData.ObstacleIds,
			HSV = changeData.ChangeHSV,
			ValueChangeType = "Absolute",
			Duration = changeData.Duration or args.Duration,
			EaseIn = 0,
			EaseOut = 1
		})
	end
	if changeData.ChangeAlpha ~= nil then
		SetAlpha({
			Ids = changeData.ObstacleIds,
			Fraction = changeData.ChangeAlpha,
			Duration = changeData.Duration or args.Duration,
			EaseIn = args.EaseIn or 0,
			EaseOut = args.EaseOut or 1
		})
	end
	if changeData.Movement ~= nil then
		Move({
			Ids = changeData.ObstacleIds,
			Angle = changeData.Movement.Angle,
			Distance = changeData.Movement.Distance,
			Duration = changeData.Movement.Duration or args.Duration,
			EaseIn = 0,
			EaseOut = 1
		})
	end
end

function mod.RoomStartAlphaChanges(source, args)
	if GetConfigOptionValue({ Name = "EditingMode" }) then
		return
	end
	SetAlpha({ Ids = args.Ids, Fraction = args.Fraction })
end

function mod.SunriseOverlookBackToRoom(room, args)
	if game.GameState.Flags.Overlook then
		game.GameState.Flags.Overlook = false
		game.UnblockCombatUI("Overlook")
		PanCamera({ Id = game.CurrentRun.Hero.ObjectId, Duration = 1.5, FromCurrentLocation = true })
		FocusCamera({ Fraction = room.ZoomFraction, Duration = 1.5, ZoomType = "Ease" })

		SetSoundCueValue({ Id = game.AudioState.MusicId, Names = { "LowPass" }, Value = 0.0, Duration = 0.5 })
		SetSoundCueValue({ Id = game.AudioState.MusicId, Names = { "Keys" }, Value = 1.0, Duration = 1.5 })
		SetVolume({ Id = game.AudioState.MusicId, Value = 1, Duration = 1.5 })
		PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
		-- TODO
		game.thread(game.PlayVoiceLines, game.HeroVoiceLines.OverlookLeaveVoiceLines)
		game.ClearCameraFocusOverride()

		game.killTaggedThreads("OverlookThread")
	end
end

-- #endregion
-- #endregion

-- #region E_Story01
function mod.RoomEntranceSurface(currentRun, currentRoom)
	game.HideCombatUI("Surface")
	game.ZeroMouseTether("RoomEntrance")
	AdjustZoom({ Fraction = game.CurrentRun.CurrentRoom.IntroZoomFraction or 0.7, Duration = 0.0 })
	FadeIn({ Duration = 5.5 })
	PanCamera({ Id = currentRoom.CameraEndPoint, Duration = currentRoom.IntroSequenceDuration or 4, EaseIn = 0.0, EaseOut = 1.5 })
	game.FullScreenFadeInAnimation("RoomTransitionOutBlack")

	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
	SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })

	if game.GameState.TextLinesRecord["PersephoneFirstMeeting"] == nil then
		game.SetupMelWalk()
	end

	game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
	-- TODO
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true)

	if currentRoom.HeroEndPoint ~= nil then
		Move({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint, Mode = "Precise" })

		local notifyName = "WithinDistance" .. currentRoom.HeroEndPoint
		NotifyWithinDistance({
			Id = currentRun.Hero.ObjectId,
			DestinationId = currentRoom.HeroEndPoint,
			Distance = 110,
			Notify = notifyName
		})
		game.waitUntil(notifyName)
		game.wait(1.0)
	end
	Stop({ Id = currentRun.Hero.ObjectId })

	if game.GameState.TextLinesRecord["PersephoneFirstMeeting"] ~= nil then
		game.RestoreMelRun(currentRun.Hero, { SkipWalkStopAnimation = false })
	end

	-- TODO: Debugging only
	game.RestoreMelRun(currentRun.Hero, { SkipWalkStopAnimation = false })

	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = currentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })

	LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0 })
	game.UnzeroMouseTether("RoomEntrance")
end

function mod.CottageBloom()
	game.wait(0.30)
	AdjustColorGrading({ Name = "CottageTrellis", Duration = 2, Delay = 0.0, })
	AdjustFullscreenBloom({ Name = "CottageBloom", Duration = 2.0 })
	game.wait(2.5)
	AdjustColorGrading({ Name = "Off", Duration = 3, Delay = 0.0, })
	AdjustFullscreenBloom({ Name = "Off", Duration = 3.0 })
end

function mod.TimePassesPresentation(source, args)
	FadeOut({ Color = game.Color.Black, Duration = 0.5 })
	if args.GlobalVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[args.GlobalVoiceLines])
	end

	if args.PersephoneMusicFullBlast ~= nil then
		SetSoundCueValue({
			Names = { "Harp", "Strings", "Room", "Trombones", "WoodWinds", "Percussion" },
			Id = game.AudioState.MusicId,
			Value = 1,
			Duration = 1.2
		})
		SetVolume({ Id = game.AudioState.MusicId, Value = 1.0, Duration = 1.2 })
	end

	game.wait(args.PreTextWait or 1)

	if args.HeroAnim ~= nil then
		SetAnimation({ Name = args.HeroAnim, DestinationId = game.CurrentRun.Hero.ObjectId })
	end

	game.thread(game.DisplayInfoBanner, nil, {
		TitleText = args.Text or "LoungeIntermissionMessage",
		TitleTextOffsetX = 81,
		LangTitleTextOffsetX = {
			{ Code = "el", Value = 0 },
			{ Code = "ja", Value = 0 },
			{ Code = "ko", Value = 0 },
			{ Code = "ru", Value = 0 },
			{ Code = "uk", Value = 0 },
		},
		TextRevealSound = "/Leftovers/Menu Sounds/EmoteExcitement",
		Color = game.Color.Gold,
		TextColor = game.Color.White,
		TextOffsetY = 20,
		TitleFont = "SpectralSCLightTitling",
		SubtitleFont = "SpectralSCLightTitling",
		Layer = "ScreenOverlay",
		AnimationName = game.CurrentRun.CurrentRoom.LocationAnimName or "LocationBackingIrisSmallIn",
		AnimationOutName = game.CurrentRun.CurrentRoom.LocationAnimOutName or "LocationBackingIrisSmallOut",
		AdditionalAnimation = "GodHoodRays",
	})

	game.wait(args.PostTextWait or 5)
	game.wait(1.0)

	FadeIn({ Color = game.Color.Black, Duration = 0.5 })
end

-- #endregion
