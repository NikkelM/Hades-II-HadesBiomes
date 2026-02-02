modutil.mod.Path.Wrap("DestroyDoorRewardPresenation", function(base, door)
	if door.AdditionalAttractIds ~= nil then
		Destroy({ Ids = GetAllValues(door.RewardPreviewBackingIds) })
	end
	if door.DoorIconFront ~= nil then
		Destroy({ Id = door.DoorIconFront })
	end
	base(door)
end)

modutil.mod.Path.Wrap("ExitDoorUnlockedPresentation", function(base, exitDoor)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesExitDoors ~= nil then
		local foundExitDoor = false
		for _, moddedExitDoor in ipairs(game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesExitDoors) do
			if moddedExitDoor.ObjectId == exitDoor.ObjectId then
				foundExitDoor = true
				if exitDoor.UnlockedAnimationMetaReward ~= nil and exitDoor.Room ~= nil and exitDoor.Room.RewardStoreName == "MetaProgress" then
					SetAnimation({ Name = exitDoor.UnlockedAnimationMetaReward, DestinationId = exitDoor.ObjectId })
				elseif exitDoor.UnlockedAnimation ~= nil then
					SetAnimation({ Name = exitDoor.UnlockedAnimation, DestinationId = exitDoor.ObjectId })
				end
				if exitDoor.RewardPreviewIconIds ~= nil then
					SetColor({ Ids = exitDoor.RewardPreviewIconIds, Color = { 1.0, 1.0, 1.0, 0 }, Duration = 0 })
					SetColor({ Ids = exitDoor.RewardPreviewIconIds, Color = { 0, 0, 0, 1 }, Duration = 0.2 })
				end
				if exitDoor.UnlockedSound ~= nil then
					PlaySound({ Name = exitDoor.UnlockedSound, Id = exitDoor.ObjectId })
				end
				if exitDoor.UnlockedGlobalVoiceLines ~= nil then
					game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[exitDoor.UnlockedGlobalVoiceLines], true)
				end
				game.wait(0.1)
				game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ExitsUnlockedVoiceLines)
				break
			end
		end
		if not foundExitDoor then
			return base(exitDoor)
		end
	else
		return base(exitDoor)
	end
end)

modutil.mod.Path.Wrap("StartRoomPresentation", function(base, currentRun, currentRoom, metaPointsAwarded)
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun and currentRoom.StartRoomPresentationOnReload and currentRoom.ModsNikkelMHadesBiomesPostCombatReloadThreadedEventsDHub then
		game.RunThreadedEvents(game.RoomData[currentRoom.Name].ModsNikkelMHadesBiomesPostCombatReloadThreadedEventsDHub,
			currentRoom)
	end

	return base(currentRun, currentRoom, metaPointsAwarded)
end)

modutil.mod.Path.Wrap("RoomEntrancePortal", function(base, currentRun, currentRoom)
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun and currentRoom.RoomSetName == "Chaos" then
		-- To make sure we have the room reward preview icon loaded in case the next room is a story room
		LoadPackages({ Names = { "ModsNikkelMHadesBiomesGUIOriginal" } })
	end

	return base(currentRun, currentRoom)
end)

-- Always force using the original Hades room transition animation in modded runs
modutil.mod.Path.Wrap("FullScreenFadeInAnimation", function(base, animationName, colorGradeName)
	if game.CurrentHubRoom == nil and game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and animationName ~= "RerollTransitionOut" then
		animationName = "ModsNikkelMHadesBiomesRoomTransitionOut"
	end

	return base(animationName, colorGradeName)
end)

-- The animation on the run start Chaos gate is defined on a custom function
modutil.mod.Path.Wrap("FullScreenFadeOutAnimation", function(base, animationName, colorGradeName)
	if game.CurrentHubRoom == nil and game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and animationName ~= "RerollTransitionIn" then
		animationName = "ModsNikkelMHadesBiomesRoomTransitionIn"
	end

	return base(animationName, colorGradeName)
end)

modutil.mod.Path.Context.Wrap("DeathPresentation", function(currentRun, killer, deathArgs)
	-- Can't move this to Static as we need the reference to killer
	modutil.mod.Path.Wrap("PlayVoiceLines", function(base, voiceLines, neverQueue, source, args)
		if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
			if voiceLines == killer.CauseOfDeathVoiceLines or voiceLines == currentRun.CurrentRoom.Encounter.CauseOfDeathVoiceLines or voiceLines == currentRun.CurrentRoom.CauseOfDeathVoiceLines then
				-- Play these voicelines instead of GlobalVoiceLines.DeathReturnVoiceLines later
				currentRun.ModsNikkelMHadesBiomesDeferredCauseOfDeathVoiceLines = voiceLines
				return
			elseif voiceLines == game.GlobalVoiceLines.DeathReturnVoiceLines then
				-- If we should play the voicelines we deferred earlier
				if currentRun.ModsNikkelMHadesBiomesDeferredCauseOfDeathVoiceLines ~= nil then
					voiceLines = currentRun.ModsNikkelMHadesBiomesDeferredCauseOfDeathVoiceLines
					currentRun.ModsNikkelMHadesBiomesDeferredCauseOfDeathVoiceLines = nil
				elseif currentRun.Cleared and game.GameState.TextLinesRecord.Ending01 then
					voiceLines = game.HeroVoiceLines.ModsNikkelMHadesBiomes_DeathReturnVoiceLines
				end
			end
		end

		return base(voiceLines, neverQueue, source, args)
	end)
end)

modutil.mod.Path.Wrap("DeathPresentation", function(base, currentRun, killer, args)
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- Destroy any IDs that we marked as such. E.g. Alecto rage meter or Asphodel door reward front animation
		local destroyIdsOnDeath = currentRun.CurrentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath or {}
		if not game.IsEmpty(destroyIdsOnDeath) then
			Destroy({ Ids = destroyIdsOnDeath })
		end

		if currentRun.CurrentRoom.Name == "Return06" then
			-- For the ending scene
			return mod.BoatToDeathAreaTransition(nil, args)
		elseif currentRun.CurrentRoom.Name == "E_Story01" then
			-- Only replace animation if we are on the Surface after talking to Persephone
			AddInputBlock({ Name = "DeathPresentation" })
			ClearCameraClamp({ LerpTime = 0.4 })
			game.ZeroMouseTether("DeathPresentation")
			game.LockCameraMotion("DeathPresentation")
			SetConfigOption({ Name = "UseOcclusion", Value = false })

			if game.IsScreenOpen("Codex") then
				game.CloseCodexScreen()
			end

			StopAmbientSound({ All = true })
			StopSound({ Id = game.AudioState.SecretMusicId, Duration = 0.25 })
			StopSound({ Id = game.AudioState.AmbientMusicId, Duration = 0.25 })
			game.AudioState.SecretMusicId = nil
			game.AudioState.SecretMusicName = nil
			game.AudioState.AmbientMusicId = nil
			if game.AudioState.RainSoundId ~= nil then
				StopSound({ Id = game.AudioState.RainSoundId, Duration = 0.2 })
				game.AudioState.RainSoundId = nil
			end
			if game.AudioState.ChronosTimeSlowSoundId ~= nil then
				StopSound({ Id = game.AudioState.ChronosTimeSlowSoundId, Duration = 0.2 })
				game.AudioState.ChronosTimeSlowSoundId = nil
			end
			if game.AudioState.EliteEncounterMusicId ~= nil then
				StopSound({ Id = game.AudioState.EliteEncounterMusicId, Duration = 0.2 })
				game.AudioState.EliteEncounterMusicId = nil
			end
			if game.AudioState.SkipEncounterMusicId ~= nil then
				game.SkipEncounterEndPresentation()
			end

			SetAudioEffectState({ Name = "SpellCharge", Value = 0 })
			SetAudioEffectState({ Name = "GlobalEcho", Value = 0 })

			Stop({ Id = currentRun.Hero.ObjectId })
			Halt({ Id = currentRun.Hero.ObjectId })

			RemoveFromGroup({ Id = killer.ObjectId, Names = { "Standing", "GroundEnemies", "FlyingEnemies" } })
			AddToGroup({ Id = killer.ObjectId, Name = "Combat_UI", DrawGroup = true })

			if currentRun.Hero.AttachedAnimationName ~= nil then
				StopAnimation({ Name = currentRun.Hero.AttachedAnimationName, DestinationId = currentRun.Hero.ObjectId })
			end

			currentRun.Hero.Mute = false
			game.UnmuteSpeakerPermanent(currentRun.Hero)
			currentRun.Hero.SpeechParams.Chipmunk = nil
			SetAudioEffectState({ Name = "Chipmunk", Value = 0 })
			game.SetPlayerInvulnerable("PlayerDeath")

			-- black out world
			StopAnimation({ DestinationId = game.CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessVignetteHold" })
			StopAnimation({ DestinationId = game.CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessGroundFog" })
			AdjustFrame({ Color = game.Color.TransparentRed, Duration = 0.0, Fraction = 0 })

			game.ScreenAnchors.DeathBacking = CreateScreenObstacle({
				Name = "rectangle01",
				Group = "Combat_UI_World_Backing",
				X = game.ScreenCenterX,
				Y = game.ScreenCenterY,
				Scale = 10.0,
				ScaleX = game.ScreenScaleX,
				ScaleY = game.ScreenScaleY
			})
			SetColor({ Id = game.ScreenAnchors.DeathBacking, Color = Color.Black })
			SetAlpha({ Id = game.ScreenAnchors.DeathBacking, Fraction = 1.0, Duration = 0 })

			game.ScreenAnchors.DeathBackground = CreateScreenObstacle({
				Name = "rectangle01",
				Group = "Combat_UI_World_Backing",
				X = game.ScreenCenterX,
				Y = game.ScreenCenterY,
				Scale = 10.0,
				ScaleX = game.ScreenScaleX,
				ScaleY = game.ScreenScaleY
			})
			SetColor({ Id = game.ScreenAnchors.DeathBackground, Color = Color.Black })
			SetAlpha({ Id = game.ScreenAnchors.DeathBackground, Fraction = 1.0, Duration = 0 })

			local deathAngleFace = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = currentRun.Hero.ObjectId, OffsetX = -200, OffsetY = 100 })
			game.wait(0.02)
			AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = deathAngleFace })
			game.wait(0.08)

			PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal2" })

			SetThingProperty({
				Property = "Graphic",
				Value = "ZagreusInjured_SickStanding_ToDeath",
				DestinationId = currentRun.Hero.ObjectId
			})

			CreateGroup({ Name = "Dark_FX", BlendMode = "Normal" })
			InsertGroupBehind({ Name = "Dark_FX", DestinationName = "Standing_Back" })

			RemoveFromGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing" })
			AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Combat_Menu", DrawGroup = true })
			game.thread(game.DoRumble, currentRun.Hero.HeroFinalHitRumbleParameters)

			game.wait(0.02)
			SetThingProperty({ Property = "Grip", Value = 99999, DestinationId = game.CurrentRun.Hero.ObjectId })

			game.thread(game.DisplayInfoBanner, nil,
				{
					Text = "ModsNikkelMHadesBiomes_OutroDeathMessageAlt",
					Delay = 1.15,
					TextColor = Color.Red,
					FontScale = 0.85,
					TextOffsetY = -20,
					AnimationName = "LocationTextBGDeath",
					AnimationOutName = "LocationTextBGDeathOut",
					ThreadName = "Outro",
					Duration = 4.25,
				})

			game.wait(0.85)
			local ambientSoundId = PlaySound({ Name = "/Leftovers/Object Ambiences/WaterRushingBloodFall" })

			game.wait(11.8)
			StopSound({ Id = ambientSoundId, Duration = 4 })
			game.WaitForSpeechFinished()

			game.UnlockCameraMotion("DeathPresentation")
			RemoveInputBlock({ Name = "DeathPresentation" })
			game.ToggleCombatControl(game.CombatControlsDefaults, true, "DeathPresentation")
			SetConfigOption({ Name = "UseOcclusion", Value = true })
		else
			return base(currentRun, killer, args)
		end
	else
		return base(currentRun, killer, args)
	end
end)

function mod.RoomEntranceDropRoomOpening(currentRun, currentRoom, args)
	game.RoomEntranceDrop(currentRun, currentRoom, args)
	game.thread(game.RoomOpeningUIDelay)
end

function mod.AsphodelEnterRoomPresentation(currentRun, currentRoom, endLookAtId, skipCameraLockOnEnd)
	local roomIntroSequenceDuration = currentRoom.IntroSequenceDuration or game.RoomData.BaseRoom.IntroSequenceDuration or
			0.8

	AddInputBlock({ Name = "EnterRoomPresentation" })
	game.SetPlayerInvulnerable("EnterRoomPresentation")
	FadeIn({ Duration = 0.0 })
	game.FullScreenFadeInAnimation()

	if currentRoom.HeroStartPoint ~= nil then
		Teleport({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroStartPoint })
	end

	local heroStartPointId = currentRoom.HeroStartPoint or
			GetClosest({ Id = currentRun.Hero.ObjectId, DestinationIds = GetIdsByType({ Name = "HeroStart" }) })
	local boatId = GetClosest({ Id = heroStartPointId, DestinationIds = GetIdsByType({ Name = "AsphodelBoat01" }) })
	local boatMovePoint = GetClosest({ Id = boatId, DestinationIds = GetIdsByType({ Name = "BoatMovePoint" }) })
	local boatMovePointExit = SpawnObstacle({ Name = "BlankObstacle", DestinationId = boatId, Group = "Scripting" })
	LockCamera({ Id = boatId, Duration = 1.0 })

	for k, unusedBoatId in pairs(GetIdsByType({ Name = "AsphodelBoat01" }) or {}) do
		if boatId ~= unusedBoatId then
			Destroy({ Id = unusedBoatId })
		end
	end

	local offset = game.CalcOffset(math.rad(GetAngleBetween({ Id = boatId, DestinationId = heroStartPointId }) or 0),
		GetDistance({ Id = boatId, DestinationId = heroStartPointId })) or { X = 0, Y = 0 }
	Attach({ Id = currentRun.Hero.ObjectId, DestinationId = boatId, OffsetX = offset.X, OffsetY = offset.Y })
	AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = boatMovePoint })
	AdjustZLocation({ Id = boatId, Distance = 10, Duration = 0.0 })
	Move({ Id = boatId, DestinationId = boatMovePoint, Duration = 1.0, EaseOut = 1.0 })
	game.wait(0.9)

	AdjustZLocation({ Id = boatId, Distance = -10, Duration = 0.5 })
	SetAnimation({ DestinationId = boatId, Name = "AsphodelBoatSink" })

	game.wait(0.35)

	StopSound({ Id = game.AsphodelBoatSoundId, Duration = 0.2 })
	game.AsphodelBoatSoundId = nil
	local rumbleParams = { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.3 }, }
	game.thread(game.DoRumble, rumbleParams)

	game.wait(0.15)
	AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
	game.wait(0.03)

	if currentRoom.CameraEndPoint ~= nil then
		PanCamera({ Id = currentRoom.CameraEndPoint, Duration = roomIntroSequenceDuration, EaseIn = 0.0, EaseOut = 0.0 })
	end
	if currentRoom.HeroEndPoint ~= nil then
		CreateGroup({ Name = "Standing_Front" })
		InsertGroupInFront({ Name = "Standing_Front", DestinationName = "Standing" })
		AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing_Front", DrawGroup = true })
		game.thread(game.MoveHeroToRoomPosition,
			{
				DestinationId = currentRoom.HeroEndPoint,
				DisableCollision = true,
				UseDefaultSpeed = true,
				AngleTowardsIdOnEnd = endLookAtId
			})
	end
	game.wait(0.03)

	RemoveFromGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing_Front" })
	AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing", DrawGroup = true })
	Unattach({ Id = currentRun.Hero.ObjectId, DestinationId = boatId })
	game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true)
	game.wait(roomIntroSequenceDuration - 0.03)

	if not skipCameraLockOnEnd then
		LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 0.5 })
	end

	RemoveInputBlock({ Name = "EnterRoomPresentation" })
	game.SetPlayerVulnerable("EnterRoomPresentation")
	game.ShowCombatUI("LeaveRoomPresentation")
end

function mod.AsphodelLeaveRoomPresentation(currentRun, exitDoor)
	local exitDoorId = exitDoor.ObjectId
	AddInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })
	game.SetPlayerInvulnerable("LeaveRoomPresentation")
	game.HideCombatUI("LeaveRoomPresentation")

	-- Custom: Prevent the invulnerable hit presentation from playing when leaving the room and not being centered on the boat
	local originalExclusiveOnHitFunctionName = currentRun.Hero.ExclusiveOnHitFunctionName
	currentRun.Hero.ExclusiveOnHitFunctionName = mod.AsphodelLeaveRoomPresentationDummyOnHitFunction

	local door = game.MapState.OfferedExitDoors[exitDoorId]
	local boatId = exitDoorId

	if door ~= nil then
		if door.AdditionalIcons ~= nil and not game.IsEmpty(door.AdditionalIcons) then
			Destroy({ Ids = GetAllValues(door.AdditionalIcons) })
			door.AdditionalIcons = nil
		end
		game.DestroyDoorRewardPresenation(door)
		if door.ExitDoorOpenAnimation ~= nil then
			SetAnimation({ DestinationId = exitDoorId, Name = door.ExitDoorOpenAnimation })
			game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.4 }, })
			game.wait(0.5)
		end
	end

	if currentRun.CurrentRoom.ExitVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, currentRun.CurrentRoom.ExitVoiceLines, true)
	else
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.ExitedAsphodelRoomVoiceLines, true)
	end

	local heroExitPointId = GetClosest({ Id = exitDoorId, DestinationIds = GetIdsByType({ Name = "HeroExit" }), Distance = 600 })

	local boatMovePoint = GetClosest({ Id = boatId, DestinationIds = GetIdsByType({ Name = "BoatMovePoint" }), Distance = 500 })
	if heroExitPointId > 0 then
		local angleToExit = game.GetAngleBetween({ Id = exitDoorId, DestinationId = boatMovePoint })
		if angleToExit < 90 or angleToExit > 270 then
			currentRun.CurrentRoom.ExitDirection = "Right"
		else
			currentRun.CurrentRoom.ExitDirection = "Left"
		end

		PanCamera({ Id = heroExitPointId, Duration = 10.0 })
		SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })

		CreateGroup({ Name = "Standing_Front" })
		InsertGroupInFront({ Name = "Standing_Front", DestinationName = "Standing" })
		AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing_Front", DrawGroup = true })

		game.thread(game.MoveHeroToRoomPosition,
			{ DestinationId = heroExitPointId, DisableCollision = false, UseDefaultSpeed = true })
	end
	SetAnimation({ DestinationId = boatId, Name = "AsphodelBoatRise" })

	game.wait(1.0)

	AdjustZLocation({ Id = boatId, Distance = 10, Duration = 0.5 })

	--AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = boatMovePoint })
	Move({ Id = boatId, DestinationId = boatMovePoint, Duration = 2.0, EaseIn = 0.4 })
	Shake({ Id = boatMovePoint, Distance = 4, Speed = 100, Duration = 3 })
	PlaySound({ Name = "/SFX/AsphodelIslandTransitionStart", Id = currentRun.Hero.ObjectId })
	game.AsphodelBoatSoundId = PlaySound({ Name = "/SFX/AsphodelIslandTransitionLoop" })

	RemoveFromGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing_Front" })
	AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing", DrawGroup = true })
	local offset = game.CalcOffset(
		math.rad(GetAngleBetween({ Id = boatId, DestinationId = currentRun.Hero.ObjectId }) or 0),
		GetDistance({ Id = boatId, DestinationId = currentRun.Hero.ObjectId })) or { X = 0, Y = 0 }
	Attach({ Id = currentRun.Hero.ObjectId, DestinationId = boatId, OffsetX = offset.X, OffsetY = offset.Y })
	SetThingProperty({ Property = "SortMode", Value = "FromParent", DestinationId = currentRun.Hero.ObjectId })

	game.LeaveRoomAudio(currentRun, exitDoor)

	game.wait(0.2)

	if door ~= nil and door.ExitDoorCloseAnimation ~= nil then
		SetAnimation({ DestinationId = exitDoorId, Name = door.ExitDoorCloseAnimation })
		game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.2 }, })
	end

	game.wait(1.0)

	game.FullScreenFadeOutAnimation()

	currentRun.Hero.ExclusiveOnHitFunctionName = originalExclusiveOnHitFunctionName

	-- If the next room is X_PostBoss01, stop the boat sound early, as that room won't stop it itself
	if door ~= nil and door.Room.Name == "X_PostBoss01" then
		StopSound({ Id = game.AsphodelBoatSoundId, Duration = 0.2 })
		game.AsphodelBoatSoundId = nil
	end

	RemoveInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	SetPlayerVulnerable("LeaveRoomPresentation")
end

-- Doesn't do anything, used to not play the invulnerable hit presentation when leaving the room and not being centered on the boat
function mod.AsphodelLeaveRoomPresentationDummyOnHitFunction(victim, triggerArgs, args)
end

function mod.AngleIdsTowardPlayer(eventSource, args)
	AngleTowardTarget({ Ids = args.Ids, DestinationId = game.CurrentRun.Hero.ObjectId })
end

function mod.AngleIds(eventSource, args)
	AngleTowardTarget({ Ids = args.Ids, DestinationId = args.DestinationId })
end

function mod.ModsNikkelMHadesBiomesShrineGateExitPresentation(currentRun, exitDoor, args)
	AddInputBlock({ Name = "LeaveRoomPresentation" })
	game.ToggleCombatControl({ "AdvancedTooltip" }, false, "LeaveRoom")
	game.HideCombatUI("ContractExitPresentation")

	Stop({ Id = currentRun.Hero.ObjectId })
	game.wait(0.01)

	PlaySound({ Name = "/SFX/Menu Sounds/GeneralWhooshMENULoudLow" })
	AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = exitDoor.ObjectId })

	local unequipAnimation = game.GetEquippedWeaponValue("UnequipAnimation") or "MelinoeIdleWeaponless"
	SetAnimation({ Name = unequipAnimation, DestinationId = currentRun.Hero.ObjectId })
	PanCamera({ Id = exitDoor.ObjectId, Duration = 1.1, OffsetY = -50, EaseOut = 0 })
	game.wait(0.5)
	ModifySubtitles({ SuppressLyrics = true })

	game.wait(0.35)

	SetAnimation({ Name = "MelTalkBrooding01", DestinationId = currentRun.Hero.ObjectId, SpeedMultiplier = 0.5 })

	currentRun.Hero.ExitAngle = GetAngle({ Id = currentRun.Hero.ObjectId })

	game.PlayVoiceLines(game.HeroVoiceLines.ModsNikkelMHadesBiomes_ShrineGateEnterVoiceLines)

	SetAnimation({ Name = "MelinoeInteractWeaponless", DestinationId = currentRun.Hero.ObjectId })
	game.wait(0.2)
	CreateAnimation({ Name = "ContractTeleportFx", DestinationId = exitDoor.ObjectId, Scale = 0.7 })

	-- Timed to destroy the preview when Mel does the interaction animation
	if exitDoor ~= nil then
		if exitDoor.AdditionalIcons ~= nil and not game.IsEmpty(exitDoor.AdditionalIcons) then
			Destroy({ Ids = game.GetAllValues(exitDoor.AdditionalIcons) })
			exitDoor.AdditionalIcons = nil
		end
		game.DestroyDoorRewardPresenation(exitDoor)
		if exitDoor.ExitDoorOpenAnimation ~= nil then
			SetAnimation({ DestinationId = exitDoor.ObjectId, Name = exitDoor.ExitDoorOpenAnimation })
		end
	end

	SetAlpha({ Id = exitDoor.ObjectId, Fraction = 0.0, Duration = 0.1 })
	PlaySound({ Name = "/SFX/Enemy Sounds/Chronos/ChronosTeleport", Id = currentRun.Hero.ObjectId })
	game.wait(0.1)
	CreateAnimation({ Name = "HadesContractFx", DestinationId = currentRun.Hero.ObjectId, })
	PlaySound({ Name = "/SFX/ShipsDoorTeleport", Id = currentRun.Hero.ObjectId })

	game.wait(1.0)

	CreateAnimation({ Name = "ContractTeleportFx", DestinationId = currentRun.Hero.ObjectId, })
	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 0, Duration = 0.1 })

	game.wait(0.01)

	ModifySubtitles({ SuppressLyrics = false })
	game.FullScreenFadeOutAnimation("RoomTransitionIn_Down")
	game.WaitForSpeechFinished()

	RemoveInputBlock({ Name = "LeaveRoomPresentation" })
	game.ToggleCombatControl({ "AdvancedTooltip" }, true, "LeaveRoom")
end
