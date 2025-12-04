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

	-- if game.GameState.TextLinesRecord["PersephoneFirstMeeting"] == nil then
	-- 	game.SetupMelWalk()
	-- else
	-- Custom, as Zagreus needs a slower speed for his run animation to not look weird
	SetUnitProperty({ Property = "Speed", Value = 480, DestinationId = currentRun.Hero.ObjectId })
	roomIntroSequenceDuration = 0.95
	-- end
	game.ToggleCombatControl({ "Rush" }, false)

	AdjustZoom({ Fraction = game.CurrentRun.CurrentRoom.IntroZoomFraction or 0.7, Duration = 0.0 })
	FadeIn({ Duration = 4.9 })
	PanCamera({ Id = currentRoom.CameraEndPoint, Duration = roomIntroSequenceDuration, EaseIn = 0.0, EaseOut = 1.5 })
	game.FullScreenFadeInAnimation("RoomTransitionOutBlack")

	-- Need to set the speech bubble higher as the model/anchor is different
	currentRun.Hero.AnimOffsetZ = 125
	game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
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

	-- if game.GameState.TextLinesRecord["PersephoneFirstMeeting"] ~= nil then
	-- game.RestoreMelRun(currentRun.Hero, { SkipWalkStopAnimation = false })
	-- SetUnitProperty({ Property = "Speed", Value = 480, DestinationId = currentRun.Hero.ObjectId })
	-- end

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
	game.thread(mod.CheckLocationUnlock, nil, { Biome = "Surface" })
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

	-- if game.GameState.TextLinesRecord["PersephoneFirstMeeting"] == nil then
	-- 	game.SetupMelWalk()
	-- else
	-- Custom, as Zagreus needs a slower speed for his run animation to not look weird
	SetUnitProperty({ Property = "Speed", Value = 480, DestinationId = currentRun.Hero.ObjectId })
	-- end
	game.ToggleCombatControl({ "Rush" }, false)

	-- Need to set the speech bubble higher as the model/anchor is different
	currentRun.Hero.AnimOffsetZ = 125
	game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
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

	-- if game.GameState.TextLinesRecord["PersephoneFirstMeeting"] ~= nil then
	-- game.RestoreMelRun(currentRun.Hero, { SkipWalkStopAnimation = false })
	-- SetUnitProperty({ Property = "Speed", Value = 480, DestinationId = currentRun.Hero.ObjectId })
	-- end

	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = currentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })

	LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0 })
	game.UnzeroMouseTether("RoomEntrance")

	-- Ping harvest (fishing) points
	for id, obstacle in pairs(game.ShallowCopyTable(game.MapState.ActiveObstacles) or {}) do
		if obstacle.ExitsUnlockedFunctionName ~= nil then
			game.thread(
				game.CallFunctionName,
				obstacle.ExitsUnlockedFunctionName,
				obstacle,
				obstacle.ExitsUnlockedFunctionArgs
			)
		end
	end
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

	-- Since we set CurrentRun.CurrentRoom to BaseRoom in KillHero
	local cachedRoomOverrides = game.DeepCopyTable(game.CurrentRun.CurrentRoom.RoomExitHeroOverwrites)

	game.KillHero(game.CurrentRun.Hero, args)

	-- Revert the overrides, as they are not reversed automatically when respawning in the hub
	if cachedRoomOverrides ~= nil then
		game.OverwriteSelf(game.CurrentRun.Hero, cachedRoomOverrides)
	end
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
	local invisibleTargets = GetIdsByType({ Name = "InvisibleTarget" })
	local heroBoatId = GetClosest({ Id = heroId, DestinationIds = invisibleTargets })
	local persephoneId = GetClosestUnitOfType({ Id = heroId, DestinationName = "ModsNikkelMHadesBiomes_NPC_Persephone_01" })
	local charonId = GetClosestUnitOfType({ Id = heroId, DestinationName = "NPC_Charon_01" })

	game.ProcessTextLines(game.ActiveEnemies[persephoneId].InteractTextLineSets)

	mod.BoatSoundId = PlaySound({ Name = "/Leftovers/World Sounds/CaravanWaterMovingLoop", Id = heroBoatId })

	StopSound({ Id = game.AudioState.AmbienceId, Duration = 26 })
	game.AudioState.AmbienceId = nil
	game.AudioState.AmbienceName = nil

	game.wait(2)

	PlaySound({ Name = "/Leftovers/World Sounds/Caravan Interior/NauticalBellCharonCenter", Id = heroBoatId })

	game.thread(mod.HandleReturnBoatRideEndTheme)
	RemoveInputBlock({ Name = "BoatRideIntro" })
	mod.HandleReturnBoatRide(eventSource, { NextMap = "Return02" })
end

function mod.HandleReturnBoatRideOutro(eventSource, args)
	local heroId = game.CurrentRun.Hero.ObjectId
	local invisibleTargets = GetIdsByType({ Name = "InvisibleTarget" })
	local heroBoatId = GetClosest({ Id = heroId, DestinationIds = invisibleTargets })
	local persephoneId = GetClosestUnitOfType({ Id = heroId, DestinationName = "ModsNikkelMHadesBiomes_NPC_Persephone_01" })

	PlaySound({ Name = "/Leftovers/World Sounds/Caravan Interior/NauticalBellCharonCenter", Id = heroBoatId })

	game.wait(1)

	game.PlayRandomRemainingTextLines(game.ActiveEnemies[persephoneId],
		game.ActiveEnemies[persephoneId].InteractTextLineSets)

	game.UnblockCombatUI("Surface")
end

function mod.HandleReturnBoatRideEndTheme(eventSource, args)
	game.wait(2.5)
	StopSound({ Id = mod.BoatSoundId, Duration = 12 })
	mod.BoatSoundId = nil
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.StartingBoatRideVoiceLines)
	game.wait(7)
	-- Unmute both vocal tracks
	SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.MusicId, Value = 1 })
	SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.MusicId, Value = 1 })
	-- "/Music/EndTheme"
	game.thread(game.MusicPlayer, "{16339170-22cd-4823-97a8-0a7d91c5292c}")
end

function mod.ReturnRoomEntrance(currentRun, currentRoom)
	-- Workaround to prevent both exitDoor.Id and unit.TakingExitDoorId from being nil, triggering the Nemesis race voicelines
	for id, unit in pairs(game.ShallowCopyTable(game.ActiveEnemies) or {}) do
		unit.TakingExitDoorId = 1
	end

	game.wait(0.03)
	FadeIn({ Duration = 0.0 })
	mod.FullScreenFadeInAnimationBoatRide()
	game.HideCombatUI("BoatRide")
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
	game.wait(2.0)

	game.ShowCombatUI("BoatRide")
	RemoveInputBlock({ Name = "BoatRide" })
	game.SetPlayerVulnerable("BoatRide")
end

function mod.HandleReturnBoatRideAnimationSetup(eventSource, args)
	local heroId = game.CurrentRun.Hero.ObjectId
	local invisibleTargets = GetIdsByType({ Name = "InvisibleTarget" })
	local heroBoatId = GetClosest({ Id = heroId, DestinationIds = invisibleTargets })
	local persephoneId = GetClosestUnitOfType({ Id = heroId, DestinationName = "ModsNikkelMHadesBiomes_NPC_Persephone_01" })
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
	game.thread(mod.StartCredits)

	game.HideCombatUI("BoatRide")
	AddInputBlock({ Name = "BoatRide" })
	game.SetPlayerInvulnerable("BoatRide")

	local currentRoom = eventSource
	local invisibleTargets = GetIdsByType({ Name = "InvisibleTarget" })

	local heroId = game.CurrentRun.Hero.ObjectId
	local heroBoatId = GetClosest({ Id = heroId, DestinationIds = invisibleTargets })
	local persephoneId = GetClosestUnitOfType({ Id = heroId, DestinationName = "ModsNikkelMHadesBiomes_NPC_Persephone_01" })
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
	NotifyWithinDistance({ Id = boatId, DestinationId = boatMoveTargetId, Distance = 210, Notify = notifyName })
	game.waitUntil(notifyName)

	if args.NextMap ~= nil then
		mod.LeaveRoomWithNoDoor(eventSource, args)
	else
		SetAnimation({ DestinationId = charonId, Name = "CharonEndingBoatRow_StopRowing" })
	end
end

function mod.StartCredits()
	game.ScreenAnchors.Credits = {}
	local scrollDistance = 1080 + 3000
	local scrollSpeed = scrollDistance / 75
	local scroll = false

	local roomCredits = mod.CreditsData[game.CurrentRun.CurrentRoom.Name] or {}
	local creditLineBuffer = 0

	for index, creditsData in ipairs(roomCredits) do
		if creditsData.CreditLineBuffer then
			creditLineBuffer = creditLineBuffer + creditsData.CreditLineBuffer
		end

		if creditsData.ScrollOn then
			scroll = true
			if creditsData.ScrollSpeedOverride then
				scrollSpeed = creditsData.ScrollSpeedOverride
			end
			if creditsData.ScrollDistanceOverride then
				scrollDistance = creditsData.ScrollDistanceOverride
			end
			for k, creditId in pairs(game.ScreenAnchors.Credits) do
				Move({ Id = creditId, Angle = 90, Distance = scrollDistance, Duration = scrollSpeed })
			end
		end
		if creditsData.ScrollOff then
			scroll = false
		end

		game.wait(creditsData.PreWait)

		if creditsData.CreateScreenObstacle ~= nil then
			creditsData.Id = CreateScreenObstacle({
				Name = creditsData.CreateScreenObstacle,
				Group = "Combat_UI",
				X = creditsData.X,
				Y = creditsData.Y
			})
			if not creditsData.SkipScreenAnchors then
				table.insert(game.ScreenAnchors.Credits, creditsData.Id)
			end
		end

		if creditsData.Text ~= nil then
			local offsetY = 0
			local offsetX = 0
			if creditsData.Y then
				offsetY = creditsData.Y
			elseif creditLineBuffer > 0 then
				offsetY = creditLineBuffer
			else
				offsetY = game.ScreenHeight
			end
			if creditsData.X then
				offsetX = creditsData.X
			else
				offsetX = game.ScreenCenterX - 530
			end
			creditsData.Id = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", X = offsetX, Y = offsetY })
			table.insert(game.ScreenAnchors.Credits, creditsData.Id)
			local textBoxData = game.MergeTables(creditsData, creditsData.Format)
			CreateTextBox(textBoxData)

			if scroll then
				Move({ Id = creditsData.Id, Angle = 90, Distance = game.ScreenHeight + scrollDistance, Duration = scrollSpeed })
			end
		end

		game.wait(creditsData.PostWait)

		if creditsData.ClearScreen then
			for k, textBoxId in pairs(game.ScreenAnchors.Credits) do
				DestroyTextBox({ Id = textBoxId })
				game.ScreenAnchors.Credits[k] = nil
			end
			creditLineBuffer = 0
		end
	end
end

function mod.BoatToDeathAreaTransition(eventSource, args)
	local heroId = game.CurrentRun.Hero.ObjectId
	local persephoneId = GetClosestUnitOfType({ Id = heroId, DestinationName = "ModsNikkelMHadesBiomes_NPC_Persephone_01" })
	local houseDoorId = GetClosest({ Id = heroId, DestinationIds = GetIdsByType({ Name = "HouseDoor02" }) })

	-- Hacky: Add Ending01 to the TextLinesRecord, as we skip it, but a lot of other things check for it
	game.GameState.TextLinesRecord["Ending01"] = true
	game.CurrentRun.TextLinesRecord["Ending01"] = true
	-- Block Dora from spawning this run to prevent her interrupting the portrait scene
	game.CurrentRun.BlockDoraSpawn = true

	AddInputBlock({ Name = "ExitToDeathAreaPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	game.wait(0.8)

	PlaySound({ Name = "/SFX/Menu Sounds/WeaponUnlockBoom", Id = houseDoorId })

	ShakeScreen({ Speed = 500, Distance = 4, FalloffSpeed = 1000, Duration = 0.3, Delay = 0.45 })

	LockCamera({ Id = houseDoorId, EaseIn = 0.04, EaseOut = 0.275, Duration = 13 })
	game.wait(0.5)
	SetAnimation({ DestinationId = houseDoorId, Name = "HouseDoor02Open" })

	game.wait(1.75)

	mod.FullScreenFadeOutAnimationBoatRide()

	game.wait(3.0)

	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	RemoveInputBlock({ Name = "ExitToDeathAreaPresentation" })
end

-- Back in the DeathArea
function mod.HubPostModdedCreditsStartPresentation(currentRun, args)
	args = args or {}

	AddInputBlock({ Name = "DeathWalkBlock" })
	game.ZeroMouseTether("DeathPresentation")
	TeleportCursor({ OffsetX = game.ScreenCenterX, OffsetY = game.ScreenCenterY })

	-- unit
	local initialSpeed = GetUnitDataValue({ Id = game.CurrentRun.Hero.ObjectId, Property = "Speed" })
	SetUnitProperty({ Property = "Speed", Value = 0, DestinationId = game.CurrentRun.Hero.ObjectId })
	SetGoalAngle({ Id = game.CurrentRun.Hero.ObjectId, Angle = 90 })
	SetUnitProperty({ Property = "CollideWithObstacles", Value = false, DestinationId = game.CurrentRun.Hero.ObjectId })
	SetAlpha({ Id = game.CurrentRun.Hero.ObjectId, Fraction = 1.0, Duration = 0 })
	Teleport({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = 780542 })

	game.StartRoomAmbience(game.CurrentRun, game.CurrentHubRoom)
	game.TentEnterPresentation()
	local dimmerIds = GetIds({ Name = "TentIntroDimmer_01" })
	SetAlpha({ Ids = dimmerIds, Fraction = 1.0 })

	local fadeLightIds = ({ 566965, 566818, 566896 })
	SetAlpha({ Ids = fadeLightIds, Fraction = 0 })

	local cameraStartId = 780542
	LockCamera({ Id = cameraStartId, Duration = 0.01 })
	game.wait(0.01)
	PanCamera({ Id = cameraStartId, Duration = 0.0, OffsetY = 0, EaseIn = 0, Retarget = true })
	AdjustZoom({ Fraction = game.CurrentHubRoom.ZoomFraction or 1.23 })
	local cameraClamps = game.CurrentHubRoom.CameraClamps or game.GetDefaultClampIds()

	SetSoundCueValue({ Names = { "Drums" }, Id = game.AudioState.MusicId, Value = 0 })

	game.wait(0.3)

	SetUnitProperty({ Property = "Speed", Value = initialSpeed, DestinationId = game.CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = game.CurrentRun.Hero.ObjectId })

	SetCameraClamp({ Ids = cameraClamps, SoftClamp = game.CurrentHubRoom.SoftClamp })

	SetAlpha({ Ids = dimmerIds, Fraction = 0, Duration = 1.0 })

	if game.CurrentHubRoom.CameraWalls then
		CreateCameraWalls({})
	end

	local portrait = game.MapState.ActiveObstacles[589483]
	FadeIn({ Duration = 0.5 })
	mod.ViewModdedPortraitPresentation(portrait, args.PortraitArgs)
	game.thread(game.PlayVoiceLines, args.EndVoiceLines)

	TeleportCursor({ OffsetX = game.ScreenCenterX, OffsetY = game.ScreenCenterY })
	UnzeroMouseTether("DeathPresentation")
	RemoveInputBlock({ Name = "DeathWalkBlock" })
end

function mod.ViewModdedPortraitPresentation(eventSource, args)
	LoadVoiceBanks({ "Megaera" })
	if not game.PlayingTextLines then
		UseableOff({ Id = eventSource.ObjectId })
	end

	AddInputBlock({ Name = "ShowingInterstitial" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	game.HideCombatUI("ShowingInterstitial")
	if args.PauseMusic then
		game.PauseMusic()
		game.PauseMusicianMusic()
	end

	if args.SecretMusic then
		game.SecretMusicPlayer(args.SecretMusic)
		SetSoundCueValue({ Names = { "Section", }, Id = game.AudioState.SecretMusicId, Value = args.SecretMusicSection })
		SetSoundCueValue({
			Names = args.SecretMusicActiveStems,
			Id = game.AudioState.SecretMusicId,
			Value = 1,
			Duration = args.SecretMusicActiveStemsDuration or 1
		})
		SetSoundCueValue({
			Names = args.SecretMusicMutedStems,
			Id = game.AudioState.SecretMusicId,
			Value = 0,
			Duration = args.SecretMusicMutedStemsDuration or 1
		})
	end

	if args.PortraitGlobalVoiceLines then
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[args.PortraitGlobalVoiceLines])
	end

	game.wait(args.StartDelay or 0)

	if args.FadeInTime then
		FadeIn({ Duration = args.FadeInTime })
	end

	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteThoughtful" })

	game.thread(game.UpdateFamilyPortraitVisibility, eventSource)

	game.ScreenAnchors.PortraitDisplayAnchor = CreateScreenObstacle({
		Name = "BlankObstacle",
		Group = "Overlay",
		X = game.ScreenCenterX,
		Y = game.ScreenCenterY
	})
	local blackScreenId = CreateScreenObstacle({ Name = "rectangle01", X = game.ScreenCenterX, Y = game.ScreenCenterY })
	SetScale({ Id = blackScreenId, Fraction = 10 })
	SetColor({ Id = blackScreenId, Color = game.Color.Black })
	SetAlpha({ Id = blackScreenId, Fraction = 1.0, Duration = 0 })

	local portraitId = CreateScreenObstacle({
		Name = "rectangle01",
		X = game.ScreenCenterX,
		Y = game.ScreenCenterY,
		Group = "Overlay"
	})
	SetScale({ Id = portraitId, Fraction = 1.8 })
	SetAlpha({ Id = portraitId, Fraction = 0.0, Duration = 0 })
	SetAlpha({ Id = portraitId, Fraction = 1.0, Duration = 1.0 })
	SetAnimation({ Name = args.PortraitAnimationName, DestinationId = portraitId })

	Attach({ Id = blackScreenId, DestinationId = game.ScreenAnchors.PortraitDisplayAnchor })
	Attach({ Id = portraitId, DestinationId = game.ScreenAnchors.PortraitDisplayAnchor })

	-- Camera Pan
	AdjustFullscreenBloom({ Name = "NewType06", Duration = 0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 1, Delay = 0 })
	Teleport({ Id = game.ScreenAnchors.PortraitDisplayAnchor, DestinationId = game.ScreenAnchors.PortraitDisplayAnchor, OffsetX = 0, OffsetY = 0 })
	SetScale({ Id = portraitId, Fraction = 1, Duration = args.PanDuration or 9.8, EaseOut = 1.0, EaseIn = 0.0 })

	game.wait(args.FadeOutWait or 12.0)

	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })

	game.wait(0.375)

	SetAlpha({ Id = blackScreenId, Fraction = 0.0, Duration = 0.375 })
	SetAlpha({ Id = portraitId, Fraction = 0.0, Duration = 0.375 })

	game.wait(0.625)
	Destroy({ Id = portraitId })
	Destroy({ Id = blackScreenId })
	Destroy({ Id = game.ScreenAnchors.PortraitDisplayAnchor })

	if args.SecretMusic then
		StopSound({ Id = game.AudioState.SecretMusicId, Duration = 2 })
		game.ResumeMusic()
		game.AudioState.SecretMusicId = nil
		game.AudioState.SecretMusicName = nil
	end

	if args.PauseMusic then
		game.ResumeMusic()
		game.ResumeMusicianMusic()
	end

	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })

	RemoveInputBlock({ Name = "ShowingInterstitial" })
	game.UnblockCombatUI("ShowingInterstitial")
end

-- #endregion
