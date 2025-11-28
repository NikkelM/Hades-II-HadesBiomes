function mod.RoomEntranceD_Hub(currentRun, currentRoom, args)
	if game.GameState.TextLinesRecord["CerberusStyxMeeting01"] == nil then
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

		-- "Music/HadesTheme"
		game.SecretMusicPlayer("{1ddbe605-eee3-470a-8569-fd4ea4dc317d}")

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

function mod.ResumeStyxMusic()
	game.wait(1.1)
	ResumeSound({ Id = game.AudioState.MusicId, Duration = 0.2 })
	SetVolume({ Id = game.AudioState.MusicId, Value = 1.0 })
end

function mod.UseStyxFountain(usee, args)
	local fountain = usee
	if game.CheckCooldown(fountain.CooldownNamePrefix .. fountain.ObjectId, fountain.CooldownDuration) then
		ClearEffect({ Id = game.CurrentRun.Hero.ObjectId, Name = "MedeaPoison" })
		ClearEffect({ Id = game.CurrentRun.Hero.ObjectId, Name = "StyxPoison" })
		SetAnimation({ DestinationId = fountain.ObjectId, Name = fountain.OnCooldownAnimation })
		UseableOff({ Id = fountain.ObjectId })
		game.PoisonCureReady(fountain)
	end
end

-- Saves the name of the last attacker that inflicted Styx poison, for the run history
function mod.ModsNikkelMHadesBiomesStyxPoisonWeaponHit(victim, victimId, triggerArgs)
	if triggerArgs.AttackerName then
		game.CurrentRun.ModsNikkelMHadesBiomesStyxPoisonLastInflictedBy = triggerArgs.AttackerName
	end
end

function mod.StyxPoisonApply(triggerArgs)
	local unit = triggerArgs.Victim
	if unit == game.CurrentRun.Hero then
		if not game.CurrentRun.Hero.IsDead then
			mod.StartStyxPoisonPresentation(unit)
			-- If we are not in Styx, we don't have heal fountains, so clear after an initial burst of damage
			if game.CurrentRun.CurrentRoom.RoomSetName ~= "Styx" then
				unit.ModsNikkelMHadesBiomesLastPoisonApplyTime = game._worldTime
				-- Create a thread that waits and then clears the poison, if it hasn't been reapplied in the meantime
				game.thread(function()
					local waitTime = 1.6
					game.wait(waitTime)
					if unit.ModsNikkelMHadesBiomesLastPoisonApplyTime == nil or (unit.ModsNikkelMHadesBiomesLastPoisonApplyTime + waitTime <= game._worldTime) then
						ClearEffect({ Id = unit.ObjectId, Name = "StyxPoison" })
						ClearEffect({ Id = unit.ObjectId, Name = "MedeaPoison" })
					end
				end)
			end
		end
	end
end

function mod.StyxPoisonClear(triggerArgs)
	mod.EndStyxPoisonPresentation()
end

function mod.StartStyxPoisonPresentation(unit)
	-- This is from Hades II, but we change the name of the PoisonFountain
	if game.ScreenAnchors.PoisonVignetteId == nil then
		game.ScreenAnchors.PoisonVignetteId = game.CreateScreenObstacle({
			Name = "BlankObstacle",
			Group = "Combat_Menu_Additive",
			Animation = "PoisonVignette",
			X = game.ScreenCenterX,
			Y = game.ScreenCenterY,
			ScaleX = game.ScreenScaleX,
			ScaleY = game.ScreenScaleY
		})
	end
	unit.CurrentlyPoisoned = true
	unit.TimesPoisoned = unit.TimesPoisoned or 0
	unit.TimesPoisoned = unit.TimesPoisoned + 1
	if game.CheckCooldown("PoisonAppliedTextCooldown", 1.5) then
		game.thread(game.InCombatText, unit.ObjectId, "DebuffPoisoned", 1.2)
	end
	PlaySound({ Name = "/SFX/Player Sounds/DionysusShieldDash", Id = game.CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/Leftovers/Menu Sounds/TitanToggleLong", Id = game.CurrentRun.Hero.ObjectId })
	game.PlayVoiceLines(game.HeroVoiceLines.PoisonAppliedVoiceLines, true)
	if unit.TimesPoisoned == 1 then
		game.wait(0.3)
		local fountains = GetIdsByType({ Name = "PoisonCureFountainStyx" }) or {}
		for k, fountainId in pairs(fountains) do
			game.thread(game.DirectionHintPresentation, { ObjectId = fountainId }, { Cooldown = 0 })
			game.thread(game.InCombatText, fountainId, "UsePoisonCure", 1.75)
		end
	end
end

function mod.EndStyxPoisonPresentation()
	game.EndPoisonPresentation()
end

-- For Reprieve room spawning the Satyr sack
function mod.SpawnConsumables(eventSource, args)
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

function mod.ModsNikkelMHadesBiomesReturnToStyxHubPresentation(currentRun, currentRoom, args)
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
		local originalWeaponRange = GetWeaponDataValue({
			Id = currentRun.Hero.ObjectId,
			WeaponName = "WeaponBlink",
			Property = "WeaponRange"
		})
		-- Increase the range to allow blinking onto the bridge to the rooms
		SetWeaponProperty({
			WeaponName = "WeaponBlink",
			DestinationId = currentRun.Hero.ObjectId,
			Property = "WeaponRange",
			Value = 512,
			ValueChangeType = "Absolute"
		})
		FireWeaponFromUnit({ Weapon = "WeaponBlink", Id = currentRun.Hero.ObjectId })
		-- Small delay before resetting, otherwise the blink above already uses the reset range
		game.thread(function()
			game.wait(0.1)
			SetWeaponProperty({
				WeaponName = "WeaponBlink",
				DestinationId = currentRun.Hero.ObjectId,
				Property = "WeaponRange",
				Value = originalWeaponRange,
				ValueChangeType = "Absolute"
			})
		end)
	else
		SetAnimation({ DestinationId = currentRun.Hero.ObjectId, Name = "Melinoe_Combat_Return_ReEnter" })
	end

	LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0 })
	RemoveInputBlock({ Name = "ModsNikkelMHadesBiomesReturnToStyxHubPresentation" })

	-- For the familiar spawn presentation - this gives the good-looking one, instead of the sudden spawn
	game.RunEventsGeneric(game.RoomEventData.GlobalRoomInputUnblockedEvents, currentRoom)
end
