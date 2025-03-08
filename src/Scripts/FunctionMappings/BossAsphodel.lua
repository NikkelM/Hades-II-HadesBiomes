function game.BossIntroHydra(eventSource, args)
	print("BossIntroHydra")
	args.ProcessTextLinesIds = { eventSource.Encounter.BossId }
	args.SetupBossIds = { eventSource.Encounter.BossId }
	game.ModsNikkelMHadesBiomesBossIntro(eventSource, args)
end

function game.RoomEntranceBossHydra(currentRun, currentRoom)
	print("RoomEntranceBossHydra")
	local hydraId = currentRoom.Encounter.BossId
	local hydra = game.ActiveEnemies[hydraId] or {}
	game.HideCombatUI("BossEntrance")

	-- Custom: Prevent the invulnerable hit presentation from playing when leaving the room and not being centered on the boat
	local originalExclusiveOnHitFunctionName = currentRun.Hero.ExclusiveOnHitFunctionName
	currentRun.Hero.ExclusiveOnHitFunctionName = game.AsphodelLeaveRoomPresentationDummyOnHitFunction
	game.SetPlayerInvulnerable("EnterRoomPresentation")

	for k, id in pairs(GetIds({ Name = currentRoom.ExitGroupName }) or {}) do
		local offset = game.CalcOffset(math.rad(-30), -1000) or { X = 0, Y = 0 }
		Teleport({ Id = id, DestinationId = id, OffsetX = offset.X, OffsetY = offset.Y })
	end

	game.wait(0.05)
	-- Move hydra into position
	local acutalSpeed = GetUnitDataValue({ Id = hydraId, Property = "Speed" })
	SetUnitProperty({ Property = "Speed", Value = 7000, DestinationId = hydraId })
	Move({ Id = hydraId, DestinationId = currentRoom.HydraStartingPosition or 554461, Duration = 0.01, SuccessDistance = 50 })
	game.wait(0.35)
	Stop({ Id = hydraId })
	game.wait(0.05)
	AngleTowardTarget({ Id = hydraId, DestinationId = currentRoom.HeroEndPoint or 510172 })
	if hydra.SwapAnimations ~= nil then
		SetAnimation({ Name = hydra.SwapAnimations["EnemyHydraSleep_Loop"] or "EnemyHydraSleep_Loop", DestinationId = hydraId })
	end
	game.thread(game.AsphodelEnterRoomPresentation, currentRun, currentRoom, hydraId, true)

	currentRun.Hero.ExclusiveOnHitFunctionName = originalExclusiveOnHitFunctionName

	game.wait(3.0)
	SetUnitProperty({ Property = "Speed", Value = acutalSpeed, DestinationId = hydraId })
	if hydra.SwapAnimations ~= nil then
		SetAnimation({ Name = hydra.SwapAnimations["EnemyHydraSleep_Wake"] or "EnemyHydraSleep_Wake", DestinationId = hydraId })
	end
	PlaySound({ Name = "/SFX/QuickSnap" })
	PlaySound({ Name = "/SFX/Enemy Sounds/HydraHead/EmoteAlerted", Id = hydraId })
	game.thread(game.InCombatText, hydraId, "Alerted", 0.45, { SkipShadow = true })
	game.wait(3.4)
	-- TODO: Roar doesn't play correctly - either sped up, or interrupted by something else 
	if hydra.SwapAnimations ~= nil then
		SetAnimation({ DestinationId = hydraId, Name = hydra.SwapAnimations["EnemyHydraTaunt"] or "EnemyHydraTaunt" })
	end

	game.thread(game.HydraRoarPresentation)
	game.wait(0.5)
	game.UnblockCombatUI("BossEntrance")
end

function game.HydraRoarPresentation()
	print("HydraRoarPresentation")
	game.wait(0.30)
	AdjustRadialBlurDistance({ Fraction = 2.0, Duration = 0.3 })
	AdjustRadialBlurStrength({ Fraction = 1.0, Duration = 0.3 })
	--AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.3 })
	ShakeScreen({ Speed = 600, Distance = 6, FalloffSpeed = 1000, Duration = 1.5 })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.04, RightFraction = 0.17, Duration = 1.5 } })
	game.wait(1.0)
	AdjustFullscreenBloom({ Name = "Off", Duration = 0.75 })
	AdjustRadialBlurDistance({ Fraction = 0.0, Duration = 0.75 })
	AdjustRadialBlurStrength({ Fraction = 0.0, Duration = 0.75 })
end

function game.PickHydraVariant(eventSource, args)
	print("PickHydraVariant")
	local eligibleOptions = {}
	for k, variantName in pairs(args.Options) do
		if game.IsEnemyEligible(variantName, eventSource) then
			table.insert(eligibleOptions, variantName)
		end
	end
	eventSource.HydraVariant = game.GetRandomValue(eligibleOptions)

	eventSource.EnemySet = game.ShallowCopyTable(game.EnemySets.HydraHeads)
	for k, removeValue in pairs(eventSource.BlockHeadsByHydraVariant[eventSource.HydraVariant]) do
		game.RemoveAllValues(eventSource.EnemySet, removeValue)
	end
	while game.TableLength(eventSource.EnemySet) > args.MaxSideHeadTypes do
		game.RemoveRandomValue(eventSource.EnemySet)
	end

	eventSource.WipeEnemiesOnKillAllTypes = { eventSource.HydraVariant }
	eventSource.CancelSpawnsOnKillAllTypes = { eventSource.HydraVariant }
	-- CancelSpawnsOnKill = { eventSource.HydraVariant }
	-- eventSource.WipeEnemiesOnKill = eventSource.HydraVariant

	for k, enemyName in pairs(eventSource.EnemySet) do
		PreLoadBinks({ Names = EnemyData[enemyName].Binks })
	end
end

function game.ActivateHydra(eventSource, args)
	print("ActivateHydra")
	args.LegalTypes = { eventSource.HydraVariant }

	mod.PrintTable(GetInactiveIdsByType({ Name = eventSource.HydraVariant }))
	eventSource.BossId = game.GetFirstValue(GetInactiveIdsByType({ Name = eventSource.HydraVariant }))
	game.ActivatePrePlaced(eventSource, args)
end

function game.HydraHeadSpawn(enemy)
	local encounter = game.CurrentRun.CurrentRoom.Encounter
	table.insert(encounter.HydraHeads, enemy.ObjectId)
	SetUnitInvulnerable(game.ActiveEnemies
		[GetClosestUnitOfType({ Id = enemy.ObjectId, DestinationName = "HydraHeadImmortal" })])
end

function game.HydraHeadDeath(enemy)
	local encounter = game.CurrentRun.CurrentRoom.Encounter
	game.RemoveValue(encounter.HydraHeads, enemy.ObjectId)
	if game.IsEmpty(encounter.HydraHeads) then
		SetUnitVulnerable(game.ActiveEnemies
			[GetClosestUnitOfType({ Id = enemy.ObjectId, DestinationName = "HydraHeadImmortal" })])
	end
end

function game.HydraStageTransition(boss, currentRun, aiStage)
	local bossId = boss.ObjectId

	Move({ Id = boss.ObjectId, DestinationId = boss.ResetPositionId, SuccessDistance = 100, Mode = "Default" })
	game.wait(0.6, boss.AIThreadName)
	Stop({ Id = boss.ObjectId })
	AngleTowardTarget({ Id = boss.ObjectId, DestinationId = currentRun.Hero.ObjectId })

	if aiStage.TransitionAnimation then
		SetAnimation({
			DestinationId = bossId,
			Name = boss.SwapAnimations[aiStage.TransitionAnimation] or
					aiStage.TransitionAnimation
		})
	end
	if aiStage.TransitionSound then
		PlaySound({ Name = aiStage.TransitionSound })
	end
	if aiStage.CombatText ~= nil then
		game.thread(game.InCombatText, bossId, aiStage.CombatText, 1.0)
	end

	if aiStage.StageTransitionVoiceLines ~= nil and not boss.IsDead then
		game.thread(game.PlayVoiceLines, aiStage.StageTransitionVoiceLines, nil, boss)
	end
	if aiStage.StageTransitionGlobalVoiceLines ~= nil and not boss.IsDead then
		game.thread(game.PlayVoiceLines, GlobalVoiceLines[aiStage.StageTransitionGlobalVoiceLines], nil, boss)
	end

	game.wait(aiStage.StartDelay or 4.0, boss.AIThreadName)
	game.SetAI(game.AttackerAI, boss, currentRun)
end

function game.HydraFinalStageTransition(boss, currentRun, aiStage)
	game.HandleTetherParentDeath(boss, boss.DetachedNeckCount, boss.DetachedNeckAnimation)
	SetUnitProperty({ Property = "Speed", Value = boss.DetachedMoveSpeed, DestinationId = boss.ObjectId })
	game.HydraStageTransition(boss, currentRun, aiStage)
end

function game.HydraKillPresentation(unit, args)
	game.AddTimerBlock(CurrentRun, "HydraKillPresentation")
	game.SetPlayerInvulnerable("HydraKillPresentation")
	PlaySound({ Name = "/SFX/StabSplatterEndSequence" })
	PlaySound({ Name = "/SFX/Enemy Sounds/HydraHead/EmoteFinalDying1", Id = unit.ObjectId })
	ExpireProjectiles({ Names = { "HydraSummon", "HydraSummon2" } })

	if args.KillEnemyNames ~= nil then
		for enemyData, enemy in pairs(game.ActiveEnemies) do
			if game.Contains(args.KillEnemyNames, enemy.Name) then
				game.Kill(enemy)
			end
		end
	end

	game.HarpyKillPresentation(unit, args)

	local currentRoom = game.CurrentRun.CurrentRoom
	for k, id in pairs(GetIds({ Name = currentRoom.ExitGroupName }) or {}) do
		local offset = game.CalcOffset(math.rad(-30), 1000) or { X = 0, Y = 0 }
		Move({ Id = id, DestinationId = id, OffsetX = offset.X, OffsetY = offset.Y, Duration = 2.5, EaseOut = 0.8 })
	end

	game.RemoveTimerBlock(CurrentRun, "HydraKillPresentation")
	game.SetPlayerVulnerable("HydraKillPresentation")
end
