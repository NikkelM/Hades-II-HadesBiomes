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
	game.ToggleCombatControl({ "Rush" }, false)

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

function mod.LeaveRoomWithNoDoor(source, args, textLines, screen)
	-- For the transition to the boat during the ending
	if game.CurrentRun.CurrentRoom.Name == "E_Story01" then
		if screen ~= nil and screen.PortraitId ~= nil then
			screen.PortraitId = nil
		end
		-- Prevent Charon from greeting Melinoe on entering the boat in the ending scene
		game.EnemyData.NPC_Charon_01.PostActivateEvents[2].GameStateRequirements = { { Path = { "CurrentRun", "CurrentRoom", "RoomSetName" }, IsNone = { "Surface" }, }, }
	end

	local door = { ObjectId = args.ObjectId, Room = game.CreateRoom(game.RoomData[args.NextMap]) }
	if args.ExitSound ~= nil then
		PlaySound({ Name = args.ExitSound })
	end
	game.LeaveRoom(game.CurrentRun, door)
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
	game.ToggleCombatControl({ "Rush" }, false)

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

function mod.SetupPersephoneMusic(eventSource, args)
	args = args or {}
	local stems = { "Room", "Trombones", "Percussion", "WoodWinds" }
	if args.FullBlast then
		SetSoundCueValue({
			Names = { "Harp", "Strings", "Room", "WoodWinds", "Trombones", "Percussion" },
			Id = game.AudioState.MusicId,
			Value = 1,
			Duration = 1.25
		})
		SetVolume({ Id = game.AudioState.MusicId, Value = 1, Duration = 10 })
	elseif args.Mom then
		stems = { "Room", "Trombones", "WoodWinds" }
		SetSoundCueValue({ Names = stems, Id = game.AudioState.MusicId, Value = 0, Duration = 3 })
		SetVolume({ Id = game.AudioState.MusicId, Value = 0.95, Duration = 3 })
	elseif args.Son then
		stems = { "Room", "Trombones", "Percussion" }
		SetSoundCueValue({ Names = stems, Id = game.AudioState.MusicId, Value = 0, Duration = 3 })
		SetVolume({ Id = game.AudioState.MusicId, Value = 0.95, Duration = 3 })
	else
		SetSoundCueValue({ Names = stems, Id = game.AudioState.MusicId, Value = 0, Duration = 3 })
		SetVolume({ Id = game.AudioState.MusicId, Value = 0.95, Duration = 3 })
	end
end

function mod.SurfaceKillHero(source, args)
	game.wait(args.WaitTime or 0)
	game.KillHero(game.CurrentRun.Hero, args)
end

-- #endregion
-- #region Return/TrueEnding

function mod.SurfaceBoatScenePan(eventSource)
	-- Custom start
	Activate({ Ids = { 571470 } })
	-- Custom end
	local zagreusId = game.CurrentRun.Hero.ObjectId
	local persephoneId = 559274
	local charonId = 559285
	local boatId = 559284

	game.ActivatePrePlacedUnits(eventSource, { Ids = { 559285 }, CheckConversations = false })
	SetAnimation({ DestinationId = 559285, Name = "Charon_Idle" })

	PlaySound({ Name = "/Leftovers/World Sounds/Caravan Interior/NauticalBellCharon", Id = boatId })
	SetAlpha({ Id = game.ScreenAnchors.DialogueBackgroundId, Fraction = 0.0, Duration = 0.5 })

	PanCamera({ Id = 560953, Duration = 13.0, OffsetX = -500, OffsetY = -60 })
	FocusCamera({ Fraction = 1.0, Duration = 13.0 })

	game.wait(1.0)
	PlaySound({ Name = "/Leftovers/World Sounds/BigSplash", Id = charonId })

	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.SurfaceBoatSightedVoiceLines)

	game.wait(1.5)
	AngleTowardTarget({ Id = zagreusId, DestinationId = charonId })

	game.wait(4.5)

	SetAlpha({ Id = game.ScreenAnchors.DialogueBackgroundId, Fraction = 1.0, Duration = 0.5 })
end

function mod.HandleReturnBoatRideIntro(eventSource, args)
	AddInputBlock({ Name = "BoatRideIntro" })

	local heroId = game.CurrentRun.Hero.ObjectId
	local heroBoatId = GetClosest({ Id = heroId, DestinationIds = invisibleTargets })
	local persephoneId = GetClosestUnitOfType({ Id = heroId, DestinationName = "NPC_Persephone_01" })
	local charonId = GetClosestUnitOfType({ Id = heroId, DestinationName = "NPC_Charon_01" })

	game.ProcessTextLines(game.ActiveEnemies[persephoneId].InteractTextLineSets)

	mod.BoatSoundId = PlaySound({ Name = "/Leftovers/World Sounds/CaravanWaterMovingLoop", Id = heroBoatId })

	StopSound({ Id = game.AudioState.AmbienceId, Duration = 26 })
	game.AudioState.AmbienceId = nil
	game.AudioState.AmbienceName = nil

	game.wait(2)

	-- this plays from the event PersephoneReturnsHome01
	-- PlayRandomRemainingTextLines( ActiveEnemies[persephoneId], ActiveEnemies[persephoneId].InteractTextLineSets )

	PlaySound({ Name = "/Leftovers/World Sounds/Caravan Interior/NauticalBellCharonCenter", Id = heroBoatId })

	game.thread(mod.HandleReturnBoatRideEndTheme)
	RemoveInputBlock({ Name = "BoatRideIntro" })
	mod.HandleReturnBoatRide(eventSource, { NextMap = "Return02" })
end

function mod.HandleReturnBoatRideOutro(eventSource, args)
	local heroId = game.CurrentRun.Hero.ObjectId
	local heroBoatId = GetClosest({ Id = heroId, DestinationIds = invisibleTargets })
	local persephoneId = GetClosestUnitOfType({ Id = heroId, DestinationName = "NPC_Persephone_01" })

	-- TODO
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.EndBoatRideVoiceLines, true)

	PlaySound({ Name = "/Leftovers/World Sounds/Caravan Interior/NauticalBellCharonCenter", Id = heroBoatId })

	game.wait(1)

	game.PlayRandomRemainingTextLines(game.ActiveEnemies[persephoneId],
		game.ActiveEnemies[persephoneId].InteractTextLineSets)

	game.UnblockCombatUI("Surface")
end

function mod.HandleReturnBoatRideEndTheme(eventSource, args)
	print("HandleReturnBoatRideEndTheme")
	game.wait(2.5)
	StopSound({ Id = mod.BoatSoundId, Duration = 12 })
	mod.BoatSoundId = nil
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.StartingBoatRideVoiceLines)
	game.wait(7)
	game.thread(game.MusicPlayer, "/Music/EndTheme")
end

function mod.ReturnRoomEntrance(currentRun, currentRoom)
	game.wait(0.03)
	FadeIn({ Duration = 0.0 })
	mod.FullScreenFadeInAnimationBoatRide()
	-- mod.FlashbackPresentation()
	game.HideCombatUI("BoatRide")
end

function mod.FlashbackPresentation()
	-- if game.GameState.Flags.InFlashback then
	-- game.HideCombatUI("BoatRide")
	-- AdjustColorGrading({ Name = "Sepia", Duration = 0.0 })
	-- end
end

function mod.ReturnRoomExit(currentRun, exitDoor)
	AddInputBlock({ Name = "RoomExit" })
	mod.FullScreenFadeOutAnimationBoatRide()
	RemoveInputBlock({ Name = "RoomExit" })
end

function mod.FullScreenFadeInAnimationBoatRide()
	if game.ScreenAnchors.Transition ~= nil then
		Destroy({ Id = game.ScreenAnchors.Transition })
	end
	AdjustColorGrading({ Name = "Dusk", Duration = 0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 1 })
	AdjustColorGrading({ Name = "Off", Duration = 1 })
	game.ScreenAnchors.Transition = CreateScreenObstacle({
		Name = "BlankObstacle",
		X = game.ScreenCenterX,
		Y = game.ScreenCenterY,
		Group = "Overlay"
	})
	SetAnimation({ DestinationId = game.ScreenAnchors.Transition, Name = "RoomTransitionOutBoatRide" })
end

function mod.SurfaceToBoatRideExit(currentRun, exitDoor)
	mod.FullScreenFadeOutAnimationBoatRide()
end

function mod.FullScreenFadeOutAnimationBoatRide(color)
	if game.ScreenAnchors.Transition ~= nil then
		Destroy({ Id = game.ScreenAnchors.Transition })
	end
	AdjustColorGrading({ Name = "Dusk", Duration = 1 })
	game.ScreenAnchors.Transition = CreateScreenObstacle({
		Name = "BlankObstacle",
		X = game.ScreenCenterX,
		Y = game.ScreenCenterY,
		Group = "Overlay"
	})
	SetAnimation({ DestinationId = game.ScreenAnchors.Transition, Name = "RoomTransitionInBoatRide" })
	PlaySound({ Name = "/Leftovers/Menu Sounds/InfoPanelOutURSA" })
	game.wait(2.0)

	game.ShowCombatUI("BoatRide")
	RemoveInputBlock({ Name = "BoatRide" })
	game.SetPlayerVulnerable("BoatRide")
end

function mod.HandleReturnBoatRideAnimationSetup(eventSource, args)
	local heroId = game.CurrentRun.Hero.ObjectId
	local heroBoatId = GetClosest({ Id = heroId, DestinationIds = invisibleTargets })
	local persephoneId = GetClosestUnitOfType({ Id = heroId, DestinationName = "NPC_Persephone_01" })
	local charonId = GetClosestUnitOfType({ Id = heroId, DestinationName = "NPC_Charon_01" })

	SetAnimation({
		DestinationId = heroId,
		Name = game.CurrentRun.CurrentRoom.BoatAnimData.Zagreus or "ZagreusEndingBoat_IdleLoop"
	})
	SetAnimation({
		DestinationId = persephoneId,
		Name = game.CurrentRun.CurrentRoom.BoatAnimData.Persephone or "PersephoneEndingBoat_IdleLoop"
	})
	game.CurrentRun.CurrentRoom.BoatRideAnimationsSet = true

	SetAnimation({ DestinationId = charonId, Name = "CharonEndingBoatRowIdle" })
end

function mod.HandleReturnBoatRide(eventSource, args)
	-- TODO
	-- game.thread(StartCredits)

	game.HideCombatUI("BoatRide")
	AddInputBlock({ Name = "BoatRide" })
	game.SetPlayerInvulnerable("BoatRide")

	local currentRoom = eventSource
	local invisibleTargets = GetIdsByType({ Name = "InvisibleTarget" })

	local heroId = game.CurrentRun.Hero.ObjectId
	local heroBoatId = GetClosest({ Id = heroId, DestinationIds = invisibleTargets })
	local persephoneId = GetClosestUnitOfType({ Id = heroId, DestinationName = "NPC_Persephone_01" })
	local persephoneBoatId = GetClosest({ Id = persephoneId, DestinationIds = invisibleTargets })
	local charonId = GetClosestUnitOfType({ Id = heroId, DestinationName = "NPC_Charon_01" })
	local charonBoatId = GetClosest({ Id = charonId, DestinationIds = invisibleTargets })
	local boatId = GetClosest({ Id = heroId, DestinationIds = GetIdsByType({ Name = "ReturnShip01" }) })
	local boatFrontId = GetClosest({ Id = heroId, DestinationIds = GetIdsByType({ Name = "ReturnShip01Front" }) })
	local boatMoveTargetId = GetClosest({ Id = boatId, DestinationIds = GetIdsByType({ Name = "BoatMovePoint" }) })

	StopAmbientSound({ Id = charonId })

	local cameraCreditPoint = SpawnObstacle({ Name = "InvisibleTarget" })
	Attach({ Id = cameraCreditPoint, DestinationId = heroBoatId, OffsetY = 60, OffsetX = -450 })
	if game.CurrentRun.CurrentRoom.Name == "Return01" then
		PanCamera({ Id = cameraCreditPoint, Duration = 20.5, EaseIn = 0 })
	else
		LockCamera({ Id = cameraCreditPoint, Duration = 0.0 })
	end

	Attach({ Id = heroId, DestinationId = heroBoatId })
	Attach({ Id = charonId, DestinationId = charonBoatId })
	Attach({ Id = persephoneId, DestinationId = persephoneBoatId })
	Attach({ Id = boatFrontId, DestinationId = boatId })

	if not game.CurrentRun.CurrentRoom.BoatRideAnimationsSet then
		SetAnimation({
			DestinationId = heroId,
			Name = game.CurrentRun.CurrentRoom.BoatAnimData.Zagreus or "ZagreusEndingBoat_IdleLoop"
		})
		SetAnimation({
			DestinationId = persephoneId,
			Name = CurrentRun.CurrentRoom.BoatAnimData.Persephone or "PersephoneEndingBoat_IdleLoop"
		})
		game.CurrentRun.CurrentRoom.BoatRideAnimationsSet = true
	end
	SetAnimation({ DestinationId = charonId, Name = "CharonEndingBoatRow_StartRowing" })

	Move({ Id = boatId, DestinationId = boatMoveTargetId, Speed = 125, SuccessDistance = 30 })

	local notifyName = "WithinDistance" .. boatMoveTargetId
	NotifyWithinDistance({ Id = boatId, DestinationId = boatMoveTargetId, Distance = 200, Notify = notifyName })
	game.waitUntil(notifyName)

	if args.NextMap ~= nil then
		mod.LeaveRoomWithNoDoor(eventSource, args)
	else
		SetAnimation({ DestinationId = charonId, Name = "CharonEndingBoatRow_StopRowing" })
	end
end

-- #endregion
