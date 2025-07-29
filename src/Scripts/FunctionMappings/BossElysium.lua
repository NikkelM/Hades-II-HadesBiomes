function game.BossIntroElysium(eventSource, args)
	local shrineLevel = game.GetNumShrineUpgrades(eventSource.ShrineMetaUpgradeName)
	game.ModsNikkelMHadesBiomesBossIntro(eventSource, args[shrineLevel])
end

function game.TheseusMinotaurKillPresentation(unit, args)
	game.SetPlayerInvulnerable("TheseusMinotaurKillPresentation")

	local bothBossesDead = false
	if game.CurrentRun.CurrentRoom.Encounter.CheckComboPartnerForKillPresentation then
		local partnerId = GetClosestUnitOfType({ Id = unit.ObjectId, DestinationName = unit.ComboPartnerName })
		if partnerId == 0 or game.RequiredKillEnemies[partnerId] == nil or game.RequiredKillEnemies[partnerId].IsDead or game.RequiredKillEnemies[partnerId].Health <= 0 then
			bothBossesDead = true
		end
	end

	if unit.Name == "Theseus" then
		ExpireProjectiles({ Name = "TheseusSpearThrow" })
		game.wait(0.02, game.RoomThreadName)
		Destroy({ Ids = GetIdsByType({ Name = "TheseusSpearReturnPoint" }) })
	end

	if bothBossesDead then
		game.AddTimerBlock(CurrentRun, "TheseusMinotaurKillPresentation")
		PlaySound({ Name = "/SFX/StabSplatterEndSequence" })
		game.DestroyRequiredKills({ BlockLoot = true })
		unit.DestroyDelay = 0.5
		game.HarpyKillPresentation(unit, args)
		game.RemoveTimerBlock(CurrentRun, "TheseusMinotaurKillPresentation")
	else
		game.LastKillPresentation(unit)
	end

	game.SetPlayerVulnerable("TheseusMinotaurKillPresentation")

	game.thread(game.CrowdReactionPresentation,
		{
			AnimationNames = { "StatusIconSmile", "StatusIconOhBoy", "StatusIconEmbarrassed", "StatusIconGrief" },
			Sound = "/SFX/TheseusCrowdChant",
			ReactionChance = 0.15,
			Delay = 1.8,
			Requirements = { RequiredRoom = "C_Boss01" },
			SkipCooldown = true,
		})
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

function game.MinotaurArmorBreak(boss, currentRun, aiStage)
	SetHSV({ Id = boss.ObjectId, HSV = { 0, 0, 0 }, ValueChangeType = "Absolute" })
	game.BossStageTransition(boss, currentRun, aiStage)
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

function game.TheseusEnragedPresentation(enemy, currentRun)
	local screenId = ScreenAnchors.BossRageFill

	ShakeScreen({ Speed = 600, Distance = 6, FalloffSpeed = 2000, Duration = 1.0 })
	Flash({ Id = screenId, Speed = 2.0, MinFraction = 0, MaxFraction = 0.8, Color = game.Color.Purple })

	if enemy.RageFullVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, enemy.RageFullVoiceLines, nil, enemy)
	end
	if enemy.RageFullSound ~= nil then
		PlaySound({ Name = enemy.RageFullSound })
	end
end

function game.MinotaurEnragedPresentation(enemy, currentRun)
	game.TheseusEnragedPresentation(enemy, currentRun)
end

function game.ShadeBlockPresentation(unitId, unitData)
	if unitData and unitData.IsDead then
		return
	end

	Flash({ Id = unitId, Speed = 0.85, MinFraction = 0.7, MaxFraction = 0.0, Color = game.Color.White, Duration = 0.15, ExpireAfterCycle = true })
	CreateAnimation({ Name = "ShadeShieldBlock", DestinationId = unitId })
	PlaySound({ Name = "/SFX/Enemy Sounds/Exalted/EnemyShieldBlock", Id = unitId })

	if game.CheckCooldown("BlockHint" .. unitId, 0.2) then
		game.thread(game.InCombatText, unitId, "BlockHit", 0.4, { SkipShadow = true })
	end
	game.wait(0.15)
end

function game.TheseusDamaged(victim, attacker)
	PlaySound({ Name = "/SFX/Enemy Sounds/Theseus/EmoteHurt", Id = victim.ObjectId })
end

function game.Theseus2Damaged(victim, attacker)
end
