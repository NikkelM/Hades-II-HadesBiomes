function game.RoomEntranceD_Hub(currentRun, currentRoom, args)
	if game.GameState.TextLinesRecord["CerberusStyxMeeting01"] == nil and false then
		local cerberusId = 547487

		LockCamera({ Id = cerberusId, Duration = 0, OffsetX = -1400, OffsetY = 750 })

		game.HideCombatUI("StyxHubIntro")

		SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
		SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithUnits", Value = false })
		game.wait(0.03)

		FadeIn({ Duration = 0.2 })
		game.FullScreenFadeInAnimation()
		-- FlashbackPresentation()

		game.thread(game.MoveHeroToRoomPosition,
			{ DestinationId = 557124, DisableCollision = true, UseDefaultSpeed = true, Timeout = 5.0 })
		PanCamera({ Id = cerberusId, Duration = 5.3, EaseIn = 0.0, EaseOut = 0, OffsetX = -410, OffsetY = 110, Retarget = true })

		game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true)

		game.wait(2.15)

		game.SecretMusicPlayer("/Music/HadesTheme")

		game.wait(2.9)
		game.UnblockCombatUI("StyxHubIntro")
	else
		local roomIntroSequenceDuration = currentRoom.IntroSequenceDuration or game.RoomData.BaseRoom.IntroSequenceDuration or
				0.0
		-- Disable immediately, could be sitting on top of impassibility
		if currentRoom.HeroEndPoint ~= nil then
			SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
			SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithUnits", Value = false })
		end
		game.wait(0.7) -- This is the wait before fade in to cover the boon fx

		FadeIn({ Duration = 0.0 })
		game.FullScreenFadeInAnimation()
		-- FlashbackPresentation()
		if currentRoom.HeroEndPoint ~= nil then
			game.thread(game.MoveHeroToRoomPosition,
				{ DestinationId = currentRoom.HeroEndPoint, DisableCollision = true, UseDefaultSpeed = true })
		end
		if currentRoom.CameraEndPoint ~= nil then
			PanCamera({ Id = currentRoom.CameraEndPoint, Duration = roomIntroSequenceDuration })
		end

		game.wait(0.03)

		game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true)
		game.wait(roomIntroSequenceDuration)
		LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0 })
	end
end

function game.UseStyxFountain(usee, args)
	local fountain = usee
	if game.CheckCooldown(fountain.CooldownNamePrefix .. fountain.ObjectId, fountain.CooldownDuration) then
		ClearEffect({ Id = game.CurrentRun.Hero.ObjectId, Name = "MedeaPoison" })
		ClearEffect({ Id = game.CurrentRun.Hero.ObjectId, Name = "StyxPoison" })
		-- BlockEffect({ Id = CurrentRun.Hero.ObjectId, Name = "StyxPoison", Duration = 0.75 })
		SetAnimation({ DestinationId = fountain.ObjectId, Name = fountain.OnCooldownAnimation })
		UseableOff({ Id = fountain.ObjectId })
		game.PoisonCureReady(fountain)
	end
end

-- For Reprieve room spawning the Satyr sack
function game.SpawnConsumables(eventSource, args)
	mod.PrintTable(args)
	for k, spawnData in pairs(args.Spawns) do
		local consumableId = SpawnObstacle({
			Name = spawnData.ConsumableName,
			DestinationId = spawnData.DestinationId,
			Group = "Standing",
		})
		local consumable = game.CreateConsumableItem(consumableId, spawnData.ConsumableName, 0) or {}
		game.MapState.RoomRequiredObjects[consumable.ObjectId] = consumable
	end
end

-- After talking to Cerberus, the exit door unlocks
function game.UnlockDoor(source, args)
	if args.RelockAllDoors then
		game.RelockAllDoors(source, args)
	end
	local door = game.MapState.ActiveObstacles[args.DoorId]
	local roomForDoorData = nil
	if door.ForceRoomName ~= nil then
		roomForDoorData = RoomData[door.ForceRoomName]
	else
		roomForDoorData = game.ChooseNextRoomData(CurrentRun)
	end
	local roomForDoor = game.CreateRoom(roomForDoorData)
	game.AssignRoomToExitDoor(door, roomForDoor)
	game.CreateDoorRewardPreview(door)
	game.thread(game.ExitDoorUnlockedPresentation, door)
	door.ReadyToUse = true
end

function game.RelockAllDoors(source, args)
	for id, door in pairs(game.MapState.OfferedExitDoors) do
		if id ~= args.DoorId then
			game.DestroyDoorRewardPresenation(door)
			SetAnimation({ DestinationId = id, Name = GetThingDataValue({ Id = id, Property = "Graphic" }) })
			door.UseText = door.LockedUseText
			door.ReadyToUse = false
		end
	end
	game.MapState.OfferedExitDoors = {}
end

function game.ExitNPCPresentation(source, args)
	AddInputBlock({ Name = "NPCExit" })
	game.wait(args.InitialWaitTime or 0)
	FadeOut({ Color = Color.Black, Duration = args.FadeOutTime or 0.5 })
	PlaySound({ Name = args.InitialExitSound or "/EmptyCue", Delay = 0.7 })
	game.wait((args.FadeOutTime or 0.5) + 0.3)
	if args.DeleteId ~= nil then
		Destroy({ Id = args.DeleteId })
	end

	PlaySound({ Name = args.FootstepSound or "/Leftovers/SFX/FootstepsConcreteMedium" })
	PlaySound({ Name = args.FootstepSound or "/Leftovers/SFX/FootstepsConcreteMedium", Delay = 0.3 })
	PlaySound({ Name = args.MoveSound or "/SFX/Enemy Sounds/Megaera/MegaeraWingFlap", Delay = 0.4 })
	PlaySound({ Name = args.FootstepSound or "/Leftovers/SFX/FootstepsConcreteMedium", Delay = 0.6 })
	PlaySound({ Name = args.FootstepSound or "/Leftovers/SFX/FootstepsConcreteMedium", Delay = 0.9 })
	PlaySound({ Name = args.MoveSound or "/SFX/Enemy Sounds/Megaera/MegaeraWingFlap", Delay = 1.0 })
	if args.UseAdditionalFootstepSounds then
		PlaySound({ Name = args.FootstepSound or "/Leftovers/SFX/FootstepsConcreteMedium", Delay = 1.2 })
		PlaySound({ Name = args.FootstepSound or "/Leftovers/SFX/FootstepsConcreteMedium", Delay = 1.5 })
	end

	if args.UseThanatosExitSound then
		-- TODO: Thanatos voicelines
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.ThanatosSpecialExitVoiceLines or {}, true)
		PlaySound({ Name = "/Leftovers/SFX/BeaconTeleportSFX2", Delay = 2.2 })
	end

	LockCamera({ Id = CurrentRun.Hero.ObjectId })
	Teleport({ Id = args.ObjectId or source.ObjectId, DestinationId = args.TeleportToId })
	if args.AltObjectId ~= nil then
		Teleport({ Id = args.AltObjectId, DestinationId = args.TeleportToId })
	end

	game.wait(args.FullFadeTime or 1.5)
	game.thread(game.PlayVoiceLines, HeroVoiceLines[args.HeroVoiceLines])
	FadeIn({ Duration = args.FadeInTime or 1.0 })
	RemoveInputBlock({ Name = "NPCExit" })
	PlaySound({ Name = args.EndSound or "/EmptyCue", Delay = 0.3 })

	if args.EndUnlockText ~= nil then
		game.thread(game.DisplayInfoBanner, nil,
			{
				TitleText = args.EndUnlockText .. "_Title",
				SubtitleText = args.EndUnlockText .. "_Subtitle",
				AnimationName = args.AnimationName or "LocationTextBGGeneric",
				AnimationOutName = args.AnimationOutName or "LocationTextBGGenericOut",
				FontScale = args.FontScale or 1.0,
				TextOffsetY = -45,
				SubtitleOffsetY = -30,
				SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = game.CurrentRun.CurrentRoom.EndUnlockText } },
				Delay = 0.6,
			})
	elseif args.EndUnlockTextTable ~= nil then
		local text = game.GetRandomValue(args.EndUnlockTextTable)
		game.thread(game.DisplayInfoBanner, nil,
			{
				TitleText = text .. "_Title",
				SubtitleText = text .. "_Subtitle",
				AnimationName = args.AnimationName or "LocationTextBGGeneric",
				AnimationOutName = args.AnimationOutName or "LocationTextBGGenericOut",
				FontScale = args.FontScale or 1.0,
				TextOffsetY = -45,
				SubtitleOffsetY = -30,
				SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = game.CurrentRun.CurrentRoom.EndUnlockText } },
				Delay = 0.6,
			})
	end
end

function game.ModsNikkelMHadesBiomesReturnToStyxHubPresentation(currentRun, currentRoom, args)
	print("Modded entrance function")
	AddInputBlock({ Name = "ModsNikkelMHadesBiomesReturnToStyxHubPresentation" })
	local roomData = game.RoomData[currentRoom.Name] or currentRoom
	local roomIntroSequenceDuration = roomData.IntroSequenceDuration or game.RoomData.BaseRoom.IntroSequenceDuration or 0.0

	SetAnimation({ Name = "MelinoeDeathReEnterHeadUp", DestinationId = currentRun.Hero.ObjectId })
	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 0.0, Duration = 0 })
	SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 1.0, Duration = 1.0 })

	if currentRoom.HeroEndPoint ~= nil then
		AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
		Teleport({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
		PanCamera({ Id = currentRoom.HeroEndPoint, Duration = 0 })
	end
	game.wait(0.03)

	FadeIn({ Duration = 0.0 })
	game.FullScreenFadeInAnimation()

	if roomData.DoorEntranceAnimation ~= nil then
		game.thread(game.DoorEntranceAnimation, roomData.DoorEntranceAnimation)
	end
	if currentRoom.CameraEndPoint ~= nil then
		PanCamera({ Id = currentRoom.CameraEndPoint, Duration = roomData.IntroPanDuration or roomIntroSequenceDuration })
	end

	if currentRoom.LocationText and not currentRoom.Encounter.BlockLocationText then
		game.thread(game.DisplayInfoBanner, nil,
			{
				Text = currentRoom.LocationText,
				Delay = 0.65,
				FadeColor = currentRoom.LocationTextColor or { 255, 0, 0, 255 },
				Duration = 2.0,
				AnimationName = currentRoom.LocationAnimName,
				AnimationOutName = currentRoom.LocationAnimOutName,
				IconBackingAnimationName = currentRoom.LocationTextAnimName,
				IconBackingAnimationOutName = currentRoom.LocationTextAnimOutName,
			})
	end
	game.wait(roomIntroSequenceDuration)

	-- Allow cancelling the animation the same way you can after returning from a run
	game.ToggleCombatControl({ "Rush" }, true, "DeathLoopStart")
	local notifyName = "MelAwake"
	NotifyOnControlPressed({ Names = { "Rush" }, Notify = notifyName, Timeout = 2.5 })
	game.waitUntil(notifyName)
	local didSkip = not _eventTimeoutRecord[notifyName]
	if didSkip then
		FireWeaponFromUnit({ Weapon = "WeaponBlink", Id = currentRun.Hero.ObjectId })
	end

	SetAnimation({ DestinationId = currentRun.Hero.ObjectId, Name = "Melinoe_Combat_Return_ReEnter" })

	LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0 })
	RemoveInputBlock({ Name = "ModsNikkelMHadesBiomesReturnToStyxHubPresentation" })

	-- For the familiar spawn presentation - this gives the good-looking one, instead of the sudden spawn
	game.RunEventsGeneric(game.RoomEventData.GlobalRoomInputUnblockedEvents, currentRoom)
end
