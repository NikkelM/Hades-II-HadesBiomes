modutil.mod.Path.Wrap("DestroyDoorRewardPresenation", function(base, door)
	if door.AdditionalAttractIds ~= nil then
		Destroy({ Ids = GetAllValues(door.RewardPreviewBackingIds) })
	end
	if door.DoorIconFront ~= nil then
		Destroy({ Id = door.DoorIconFront })
	end
	base(door)
end)

modutil.mod.Path.Wrap("StartRoomPresentation", function(base, currentRun, currentRoom)
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun and currentRoom.StartRoomPresentationOnReload and currentRoom.ModsNikkelMHadesBiomesPostCombatReloadThreadedEventsDHub then
		game.RunThreadedEvents(game.RoomData[currentRoom.Name].ModsNikkelMHadesBiomesPostCombatReloadThreadedEventsDHub,
			currentRoom)
	end

	base(currentRun, currentRoom)
end)

-- TODO: We currently don't have the custom bink file available that is required for this to work
-- modutil.mod.Path.Wrap("FullScreenFadeInAnimation", function(base, animationName, colorGradeName)
-- 	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentHubRoom == nil then
-- 		animationName = "ModsNikkelMHadesBiomesRoomTransitionOut"
-- 	end
-- 	base(animationName, colorGradeName)
-- end)

-- modutil.mod.Path.Wrap("FullScreenFadeOutAnimation", function(base, animationName, colorGradeName)
-- 	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentHubRoom == nil then
-- 		animationName = "ModsNikkelMHadesBiomesRoomTransitionIn"
-- 	end
-- 	base(animationName, colorGradeName)
-- end)

-- Currently disabled, as the music gets hidden too much by the Mel voicelines
-- modutil.mod.Path.Wrap("DeathPresentation", function(base, currentRun, killer, args)
-- 	if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
-- 		rom.audio.load_bank(rom.path.combine(_PLUGIN.plugins_data_mod_folder_path,
-- 			"Content\\Audio\\Desktop\\ModsNikkelMHadesBiomesMusic.bank"))
-- 		-- Overwrite the DeathStinger for this room - we always want to play the custom event if it is a modded run
-- 		currentRun.CurrentRoom.Encounter.DeathStinger = "{84435f74-4111-43c5-8246-8b3e2736794d}"
-- 		-- Destroy any IDs that we marked as such. E.g. Alecto rage meter or Asphodel door reward front animation
-- 		local destroyIdsOnDeath = currentRun.CurrentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath or {}
-- 		if not game.IsEmpty(destroyIdsOnDeath) then
-- 			Destroy({ Ids = destroyIdsOnDeath })
-- 		end
-- 	end
-- 	base(currentRun, killer, args)
-- end)

function game.AsphodelEnterRoomPresentation(currentRun, currentRoom, endLookAtId, skipCameraLockOnEnd)
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
	-- Shake({ Id = raftMovePoint, Distance = 2, Speed = 100, Duration = 0.3 })
	game.wait(0.9)

	AdjustZLocation({ Id = boatId, Distance = -10, Duration = 0.5 })
	SetAnimation({ DestinationId = boatId, Name = "AsphodelBoatSink" })

	game.wait(0.35)

	StopSound({ Id = game.AsphodelBoatSoundId, Duration = 0.2 })
	game.AsphodelBoatSoundId = nil
	-- PlaySound({ Name = "/Leftovers/World Sounds/CaravanWaterBuck2", Id = raftMovePoint })
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

function game.AsphodelLeaveRoomPresentation(currentRun, exitDoor)
	local exitDoorId = exitDoor.ObjectId
	AddInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })
	game.SetPlayerInvulnerable("LeaveRoomPresentation")
	game.HideCombatUI("LeaveRoomPresentation")

	-- Custom: Prevent the invulnerable hit presentation from playing when leaving the room and not being centered on the boat
	local originalExclusiveOnHitFunctionName = currentRun.Hero.ExclusiveOnHitFunctionName
	currentRun.Hero.ExclusiveOnHitFunctionName = game.AsphodelLeaveRoomPresentationDummyOnHitFunction

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
	AllowShout = false

	currentRun.Hero.ExclusiveOnHitFunctionName = originalExclusiveOnHitFunctionName

	RemoveInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	SetPlayerVulnerable("LeaveRoomPresentation")
end

-- Doesn't do anything, used to not play the invulnerable hit presentation when leaving the room and not being centered on the boat
function game.AsphodelLeaveRoomPresentationDummyOnHitFunction(victim, triggerArgs, args)
end

function game.AngleIdsTowardPlayer(eventSource, args)
	AngleTowardTarget({ Ids = args.Ids, DestinationId = game.CurrentRun.Hero.ObjectId })
end

function game.AngleIds(eventSource, args)
	AngleTowardTarget({ Ids = args.Ids, DestinationId = args.DestinationId })
end

-- For D_Intro, to allow the cog wheels to place themselves correctly before the fade in
function game.ModsNikkelMHadesBiomesDelayedRoomEntranceStandard(currentRun, currentRoom)
	game.wait(2.0)
	game.RoomEntranceStandard(currentRun, currentRoom)
end
