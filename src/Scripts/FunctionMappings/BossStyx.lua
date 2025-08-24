function game.ExitToHadesPresentation(currentRun, exitDoor)
	local exitDoorId = exitDoor.ObjectId
	AddInputBlock({ Name = "ExitToHadesPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })
	game.EndMusic()
	game.HideCombatUI("ExitToHadesPresentation")
	AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = exitDoorId })
	SetAnimation({ Name = "ZagreusInteractEquip", DestinationId = currentRun.Hero.ObjectId })
	ClearCameraClamp({ LerpTIme = 0.4 })
	game.wait(0.3)
	PlaySound({ Name = "/SFX/Menu Sounds/WeaponUnlockBoom", Id = exitDoorId })
	ShakeScreen({ Speed = 500, Distance = 4, FalloffSpeed = 1000, Duration = 0.3, Delay = 0.45 })

	if exitDoor ~= nil then
		if exitDoor.AdditionalIcons ~= nil and not game.IsEmpty(exitDoor.AdditionalIcons) then
			Destroy({ Ids = exitDoor.AdditionalIcons })
			exitDoor.AdditionalIcons = nil
		end
		game.DestroyDoorRewardPresenation(exitDoor)
		if exitDoor.ExitDoorOpenAnimation ~= nil then
			SetAnimation({ DestinationId = exitDoorId, Name = exitDoor.ExitDoorOpenAnimation })
			game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.4 }, })
			game.wait(0.5)
		end
	end

	OutdoorAmbientSoundId = PlaySound({ Name = "/Leftovers/Ambience/WhippingWindLoop" })
	SetVolume({ Id = OutdoorAmbientSoundId, Value = 0.1 })
	SetVolume({ Id = OutdoorAmbientSoundId, Value = 1.0, Duration = 8 })

	game.LeaveRoomAudio(currentRun, exitDoor)

	local cameraId = SpawnObstacle({
		Name = "InvisibleTarget",
		DestinationId = exitDoorId,
		OffsetY = -700,
		OffsetX = 600,
		Group = "Standing"
	})

	LockCamera({ Id = cameraId, EaseIn = 0.04, EaseOut = 0.275, Duration = 10 })
	game.wait(1.75)
	FadeOut({ Color = game.Color.White, Duration = 2 })
	game.wait(1.1)

	SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusWalk", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 130, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
	local heroExitIds = GetIdsByType({ Name = "HeroExit" })
	local heroExitPointId = GetClosest({ Id = currentRun.Hero.ObjectId, DestinationIds = heroExitIds, Distance = 600 })
	game.thread(game.MoveHeroToRoomPosition, { DestinationId = heroExitPointId })
	game.wait(4.0)

	-- Makes a sound and can be seen, so not doing it, since we do the bright fade
	-- game.FullScreenFadeOutAnimation()
	-- ShowInterMapComponents()
	-- AllowShout = false
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	RemoveInputBlock({ Name = "ExitToHadesPresentation" })
	game.UnblockCombatUI("ExitToHadesPresentation")
end

function game.RoomEntranceHades(currentRun, currentRoom)
	local hadesId = 510857
	if currentRoom.Encounter.Name == "BossHadesPeaceful" then
		hadesId = 552710
	end

	game.HideCombatUI("BossEntrance")
	game.ZeroMouseTether("BossEntrance")
	local roomIntroSequenceDuration = currentRoom.IntroSequenceDuration or game.RoomData.BaseRoom.IntroSequenceDuration or
			0.0

	FadeOut({ Color = game.Color.White, Duration = 0 })
	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
	AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay = 0 })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.03, Delay = 0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 5.0, Delay = 0.1 })

	SetVolume({ Id = OutdoorAmbientSoundId, Value = 0.0, Duration = 5 })
	OutdoorAmbientSoundId = nil
	game.wait(0.03)

	AdjustZoom({ Fraction = currentRun.CurrentRoom.IntroZoomFraction or 0.7, Duration = 0.0 })
	FadeIn({ Duration = 5.5 })
	LockCamera({ Id = hadesId, Duration = roomIntroSequenceDuration })
	-- Makes a sound and can be seen, so not doing it, since we do the bright fade
	-- game.FullScreenFadeInAnimation()
	AdjustColorGrading({ Name = "Rain", Duration = 0 })
	AdjustColorGrading({ Name = "Off", Duration = 4 })
	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
	local initialSpeed = GetUnitDataValue({ Id = currentRun.Hero.ObjectId, Property = "Speed" })
	SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
	SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusWalk", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 130, DestinationId = currentRun.Hero.ObjectId })

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
		-- Slight extra wait to account for the withinDistance not being very precise 
		game.wait(0.3)
	end
	Stop({ Id = currentRun.Hero.ObjectId })

	SetUnitProperty({ Property = "StartGraphic", Value = "ZagreusStart", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusRun", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "ZagreusStop", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = initialSpeed, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = currentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })
	game.wait(0.3)
	game.UnzeroMouseTether("BossEntrance")
	game.UnblockCombatUI("BossEntrance")
end

function game.BossIntroHades(eventSource, args)
	if eventSource.Encounter.Name == "BossHadesPeaceful" then
		args.ProcessTextLinesIds = { 552710 }
		args.UnlockDelay = 0.0
		args.SetupBossIds = nil
		args.ResetRoomZoom = nil
		eventSource.SpawnRewardDelay = 1.32
	end

	if game.GameState.TextLinesRecord["HadesAllowsLegendaryKeepsakes01"] ~= nil then
		eventSource.BlockHadesAssistTraits = false
	else
		eventSource.BlockHadesAssistTraits = true
	end

	game.ModsNikkelMHadesBiomesBossIntro(eventSource, args)

	if eventSource.Encounter.Name == "BossHadesPeaceful" then
		game.CurrentRun.ActiveBiomeTimer = false
	end
end

function game.CheckRunEndPresentation(currentRun, door)
	AddInputBlock({ Name = "CheckRunEndPresentation" })
	-- TODO: Check?
	if game.GameState.TextLinesRecord["Ending01"] ~= nil then
		currentRun.CurrentRoom.SkipLoadNextMap = true
		game.EndEarlyAccessPresentation()
	else
		local heroExitPointId = GetClosest({ Id = door.ObjectId, DestinationIds = GetIdsByType({ Name = "HeroExit" }), Distance = 600 })
		game.thread(game.MoveHeroToRoomPosition,
			{ DestinationId = heroExitPointId, DisableCollision = true, UseDefaultSpeed = true })
		game.FullScreenFadeOutAnimation()
		if game.GameState.TextLinesRecord["LordHadesBeforePersephoneReturn01"] ~= nil then
			-- TODO
			game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.BossHadesPeacefulExitVoiceLines)
		end
		game.wait(3.5)
	end
	RemoveInputBlock({ Name = "CheckRunEndPresentation" })
end
