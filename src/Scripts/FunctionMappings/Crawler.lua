function mod.RoomEntranceCrawlerMiniBoss(currentRun, currentRoom, args)
	if currentRoom.Encounter ~= nil and currentRoom.Encounter.Name ~= "ModsNikkelMHadesBiomesMiniBossCrawler" then
		game.RoomEntranceStandard(currentRun, currentRoom, args)
		return
	end

	local crawlerId = 552394

	game.HideCombatUI("BossEntrance")
	local roomIntroSequenceDuration = currentRoom.IntroSequenceDuration or 2.0
	game.wait(0.03)

	FadeIn({ Duration = 0.0 })
	game.FullScreenFadeInAnimation()
	PanCamera({ Id = 545309, Duration = roomIntroSequenceDuration + 1, EaseOut = 0, OffsetX = 150, OffsetY = -200 })
	if currentRoom.HeroEndPoint ~= nil then
		game.thread(game.MoveHeroToRoomPosition,
			{ DestinationId = currentRoom.HeroEndPoint, DisableCollision = true, UseDefaultSpeed = true })
	end

	-- TODO: These voicelines are duplicates
	-- game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.CrawlerMiniBossEncounterStartVoiceLines, true)
	game.wait(roomIntroSequenceDuration)
	game.wait(0.5)
	game.SecretMusicPlayer("/EmptyCue")

	if game.GameState.EncountersOccurredCache.ModsNikkelMHadesBiomesMiniBossCrawler > 1 then
		game.wait(0.5)
	else
		SetAnimation({ Name = "ZagreusInteractionThoughtful", DestinationId = game.CurrentRun.Hero.ObjectId })
		game.wait(2.5)
	end

	AngleTowardTarget({ Id = crawlerId, DestinationId = game.CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/SFX/QuickSnap", Id = crawlerId })
	game.thread(InCombatText, crawlerId, "Alerted", 0.45, { SkipShadow = true })
	CreateAnimation({ Name = "EliteUnitStatus2", DestinationId = crawlerId })
	game.wait(0.25)
	PlaySound({ Name = "/SFX/Enemy Sounds/Crawler/CrawlerMinibossRoar", Id = crawlerId })
	SetAnimation({ Name = "EnemyCrawlerHowling", DestinationId = crawlerId })
	game.wait(0.02)

	AdjustRadialBlurDistance({ Fraction = 1.5, Duration = 0.2 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0.2 })
	Shake({ Id = crawlerId, Distance = 2, Speed = 300, Duration = 3, FalloffSpeed = 3000 })
	ShakeScreen({ Speed = 500, Distance = 5, FalloffSpeed = 2000, Duration = 1.0 })
	FocusCamera({ Fraction = 1.0, ZoomType = "Overshoot", Duration = 0.17 })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.1, Fraction = 0.23, Duration = 1.0 }, })

	game.SecretMusicPlayer("/Music/MusicExploration2_MC")
	SetSoundCueValue({ Names = { "Section", }, Id = game.AudioState.SecretMusicId, Value = 2 })

	game.wait(0.5)
	game.ResumeMusic({ Delay = 0, Duration = 0 })
	game.EndMusic(game.AudioState.MusicId, game.AudioState.MusicName, 0.0)
	game.thread(game.EndTinyVerminRadialBlur)

	if game.GameState.EncountersOccurredCache.ModsNikkelMHadesBiomesMiniBossCrawler > 1 then
		LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 1.0 })
		FocusCamera({ Fraction = game.CurrentRun.CurrentRoom.ZoomFraction, ZoomType = "Ease", Duration = 1.0 })
		game.wait(1.0)
	else
		LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 2.0 })
		FocusCamera({ Fraction = game.CurrentRun.CurrentRoom.ZoomFraction, ZoomType = "Ease", Duration = 2.0 })
		game.wait(2.0)
	end

	-- Otherwise the Crawler is stuck in the howling animation
	SetAnimation({ Name = "EnemyCrawlerIdle", DestinationId = crawlerId })
	game.UnblockCombatUI("BossEntrance")
end

function mod.CrawlerMiniBossEndPresentation(eventSource)
	SetSoundCueValue({ Names = { "Section", }, Id = game.AudioState.SecretMusicId, Value = 10 })
	game.AudioState.SecretMusicId = nil
	game.AudioState.SecretMusicName = nil
end

function mod.ModsNikkelMHadesBiomesOnDeathFireProjectile(unit, args)
	CreateProjectileFromUnit({
		Name = args.ProjectileName,
		Id = unit.ObjectId,
		DestinationId = unit.ObjectId,
		FireFromTarget = true
	})
end
