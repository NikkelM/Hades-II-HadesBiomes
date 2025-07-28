function game.BossIntroElysium(eventSource, args)
	local shrineLevel = game.GetNumShrineUpgrades(eventSource.ShrineMetaUpgradeName)
	game.ModsNikkelMHadesBiomesBossIntro(eventSource, args[shrineLevel])
end

function game.MinotaurFinalStageTransition(boss, currentRun, aiStage)
	if boss.CannotDieFromDamage then
		currentRun.CurrentRoom.Encounter.CancelSpawns = true
		boss.SkipOnDeathSpawnEncounter = true
		game.DestroyRequiredKills({ BlockLoot = true, SkipIds = { boss.ObjectId } })
		game.MinotaurEarlyExitPresentation(boss, currentRun)
		game.Kill(boss, { SkipOnDeathFunction = true, Silent = true, SkipDestroyDelay = true, })
	else
		game.BossStageTransition(boss, currentRun, aiStage)
	end
end

function game.MinotaurEarlyExitPresentation(boss, currentRun)
	game.HideCombatUI("MinotaurEarlyExit")
	boss.CanStoreAmmo = false
	boss.EarlyExit = true
	game.thread(game.LastKillPresentation, boss)
	PlaySound({ Name = "/SFX/FightBell" })
	-- Not needed as there are no supers in Hades II
	-- ZeroSuperMeter()

	game.AddTimerBlock(game.CurrentRun, "MinotaurEarlyExitPresentation")
	AddInputBlock({ Name = "MinotaurEarlyExit" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })
	ExpireProjectiles({})
	game.SetUnitVulnerable(boss)

	game.thread(game.PlayVoiceLines, boss.EarlyExitVoiceLines, nil, boss)

	SetAnimation({ DestinationId = boss.ObjectId, Name = GetThingDataValue({ Id = boss.ObjectId, Property = "Graphic" }) })
	LockCamera({ Id = boss.ObjectId, Duration = 1.25 })
	Move({ Id = boss.ObjectId, DestinationId = 522283, SuccessDistance = 50 })
	local notifyName = "WithinDistance" .. boss.ObjectId
	NotifyWithinDistance({ Id = boss.ObjectId, DestinationId = 522283, Distance = 50, Notify = notifyName, Timeout = 9.0, })
	game.waitUntil(notifyName, boss.AIThreadName)

	game.thread(game.PlayVoiceLines, boss.PostMatchTauntVoiceLines, true, boss)

	Stop({ Id = boss.ObjectId })
	AngleTowardTarget({ Id = boss.ObjectId, DestinationId = currentRun.Hero.ObjectId })

	game.ProcessTextLines(boss, boss.BossPresentationOutroTextLineSets)
	game.ProcessTextLines(boss, boss.BossPresentationOutroRepeatableTextLineSets)

	game.EndMusic(game.AudioState.MusicId, game.AudioState.MusicName)
	game.RemoveEnemyUI(boss)

	if game.GameState.TextLinesRecord.MinotaurFirstExit then
		game.wait(0.5, game.RoomThreadName)
	else
		game.wait(2.0, game.RoomThreadName)
	end

	if not game.PlayRandomRemainingTextLines(boss, boss.BossPresentationOutroTextLineSets) then
		game.PlayRandomRemainingTextLines(boss, boss.BossPresentationOutroRepeatableTextLineSets)
	end

	game.wait(1.5, game.RoomThreadName)

	thread(PlayVoiceLines, HeroVoiceLines.MinotaurDefeatedVoiceLines)

	LockCamera({ Ids = { 521115, 522283 }, Duration = 1.25 })
	local exitDoor = game.MapState.ActiveObstacles[521115]
	Move({ Id = boss.ObjectId, DestinationId = 522284, SuccessDistance = 50 })
	game.wait(0.4, game.RoomThreadName)
	SetAnimation({ DestinationId = exitDoor.ObjectId, Name = exitDoor.ExitDoorOpenAnimation })

	SetUnitProperty({ DestinationId = boss.ObjectId, Property = "CollideWithUnits", Value = false })
	SetUnitProperty({ DestinationId = boss.ObjectId, Property = "CollideWithObstacles", Value = false })
	game.wait(2.5, game.RoomThreadName)

	SetAnimation({ DestinationId = exitDoor.ObjectId, Name = exitDoor.ExitDoorCloseAnimation })
	game.wait(1.5, game.RoomThreadName)

	LockCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 1.25 })
	Teleport({ Id = boss.ObjectId, DestinationId = 522243 })

	RemoveInputBlock({ Name = "MinotaurEarlyExit" })
	game.RemoveTimerBlock(game.CurrentRun, "MinotaurEarlyExitPresentation")
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	game.ShowCombatUI("MinotaurEarlyExit")
end
