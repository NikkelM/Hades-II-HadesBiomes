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

		-- TODO: Do we have these voice lines?
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
