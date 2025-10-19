function mod.BossIntroHydra(eventSource, args)
	args.ProcessTextLinesIds = { eventSource.Encounter.BossId }
	args.SetupBossIds = { eventSource.Encounter.BossId }
	mod.ModsNikkelMHadesBiomesBossIntro(eventSource, args)
end

function mod.RoomEntranceBossHydra(currentRun, currentRoom)
	local hydraId = currentRoom.Encounter.BossId
	local hydra = game.ActiveEnemies[hydraId] or {}
	game.HideCombatUI("BossEntrance")

	-- Custom: Prevent the invulnerable hit presentation from playing when leaving the room and not being centered on the boat
	local originalExclusiveOnHitFunctionName = currentRun.Hero.ExclusiveOnHitFunctionName
	currentRun.Hero.ExclusiveOnHitFunctionName = mod.AsphodelLeaveRoomPresentationDummyOnHitFunction
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
	game.thread(mod.AsphodelEnterRoomPresentation, currentRun, currentRoom, hydraId, true)

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
	if hydra.SwapAnimations ~= nil then
		SetAnimation({ DestinationId = hydraId, Name = hydra.SwapAnimations["EnemyHydraRoarFire"] or "EnemyHydraRoarFire" })
	end

	game.thread(mod.HydraRoarPresentation)
	game.wait(0.8)
	if hydra.SwapAnimations ~= nil then
		SetAnimation({ DestinationId = hydraId, Name = hydra.SwapAnimations["EnemyHydraRoarReturnToIdle"] or
		"EnemyHydraRoarReturnToIdle" })
	end
	game.UnblockCombatUI("BossEntrance")
end

function mod.HydraRoarPresentation()
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

function mod.PickHydraVariant(eventSource, args)
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

	for k, enemyName in pairs(eventSource.EnemySet) do
		PreLoadBinks({ Names = EnemyData[enemyName].Binks })
	end
end

function mod.ActivateHydra(eventSource, args)
	args.LegalTypes = { eventSource.HydraVariant }
	eventSource.BossId = game.GetFirstValue(GetInactiveIdsByType({ Name = eventSource.HydraVariant }))
	game.ActivatePrePlaced(eventSource, args)
end

function mod.HydraStageTransition(boss, currentRun, aiStage)
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
	-- Custom addition, to be able to keep playing the animation for longer
	if aiStage.TransitionEndAnimation then
		game.wait(0.8)
		SetAnimation({
			DestinationId = bossId,
			Name = boss.SwapAnimations[aiStage.TransitionEndAnimation] or
					aiStage.TransitionEndAnimation
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

function mod.HydraFinalStageTransition(boss, currentRun, aiStage)
	mod.HandleTetherParentDeath(boss, boss.DetachedNeckCount, boss.DetachedNeckAnimation)
	SetUnitProperty({ Property = "Speed", Value = boss.DetachedMoveSpeed, DestinationId = boss.ObjectId })
	mod.HydraStageTransition(boss, currentRun, aiStage)
end

function mod.HydraKillPresentation(unit, args)
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

	mod.HarpyKillPresentation(unit, args)

	-- This moves the exit barge into view
	local currentRoom = game.CurrentRun.CurrentRoom
	for k, id in pairs(GetIds({ Name = currentRoom.ExitGroupName }) or {}) do
		local offset = game.CalcOffset(math.rad(-30), 1000) or { X = 0, Y = 0 }
		Move({ Id = id, DestinationId = id, OffsetX = offset.X, OffsetY = offset.Y, Duration = 2.5, EaseOut = 0.8 })
	end

	game.RemoveTimerBlock(CurrentRun, "HydraKillPresentation")
	game.SetPlayerVulnerable("HydraKillPresentation")
end

function mod.HandleBossSpawns(enemy, weaponAIData, currentRun, args)
	local enemyId = enemy.ObjectId
	local spawnGroupName = weaponAIData.SpawnGroupName or ("Spawner" .. enemyId)
	local spawnRadius = weaponAIData.SpawnRadius or 100
	local spawnOptions = weaponAIData.SpawnOptions or enemy.SpawnOptions
	spawnOptions = game.ShallowCopyTable(spawnOptions)
	local spawnCount = weaponAIData.SpawnCount
	enemy.BossSpawnsUses = enemy.BossSpawnsUses or 0

	if weaponAIData.SpawnClones then
		spawnOptions = {}
		table.insert(spawnOptions, enemy.Name)
	end

	if game.GetActiveEnemyCount() >= currentRun.CurrentRoom.Encounter.ActiveEnemyCap then
		return
	end

	if weaponAIData.MaxActiveSpawns ~= nil and game.TableLength(GetIds({ Name = spawnGroupName })) >= weaponAIData.MaxActiveSpawns then
		return
	end

	local spawns = {}
	if spawnCount == nil and weaponAIData.DifficultyRating ~= nil then
		local difficultyRating = weaponAIData.DifficultyRating
		if weaponAIData.DifficultyRatingIncreasePerUse ~= nil then
			difficultyRating = difficultyRating + (weaponAIData.DifficultyRatingIncreasePerUse * enemy.BossSpawnsUses)
		end
		local totalDifficultyRating = 0
		while totalDifficultyRating < difficultyRating do
			local spawnName = game.GetRandomValue(spawnOptions)
			local enemyData = game.EnemyData[spawnName]
			local enemyDifficultyRating = enemyData.GeneratorData.DifficultyRating or 1

			if totalDifficultyRating + enemyDifficultyRating > difficultyRating then
				game.RemoveValue(spawnOptions, spawnName)
				if game.IsEmpty(spawnOptions) then
					break
				end
			else
				totalDifficultyRating = totalDifficultyRating + enemyDifficultyRating
				table.insert(spawns, spawnName)
			end
		end
		spawnCount = #spawns
	end

	for i = 1, spawnCount do
		local spawnName = spawns[i] or game.GetRandomValue(spawnOptions)

		local enemyData = game.EnemyData[spawnName]
		local newEnemy = game.DeepCopyTable(enemyData) or {}
		newEnemy.SkipChallengeKillCounts = true
		newEnemy.PreferredSpawnPoint = nil

		local spawnPointId = 0
		if weaponAIData.SpawnOnSelf then
			spawnPointId = enemy.ObjectId
		else
			spawnPointId = game.SelectSpawnPoint(currentRun.CurrentRoom, newEnemy,
				{ SpawnNearId = enemy.ObjectId, SpawnRadius = weaponAIData.SpawnRadius }) or 0
		end
		if spawnPointId == nil or spawnPointId == 0 then
			--DebugPrint({ Text="No eligible spawn points to continue spawning "..enemy.Name.."'s enemies!" })
			return
		end
		newEnemy.ObjectId = SpawnUnit({
			Name = spawnName,
			Group = "Standing",
			DestinationId = spawnPointId,
			ForceToValidLocation = true,
			DoActivatePresentation = weaponAIData.DoSpawnsActivatePresentation
		})
		newEnemy.OccupyingSpawnPointId = spawnPointId
		newEnemy.AggroReactionTimeMin = weaponAIData.SpawnAggroReactionTimeMin or newEnemy.AggroReactionTimeMin
		game.SessionMapState.SpawnPointsUsed[spawnPointId] = newEnemy.ObjectId

		if weaponAIData.SpawnClones then
			newEnemy.IsClone = true
			SetAlpha({ Id = newEnemy.ObjectId, Fraction = weaponAIData.CloneAlphaFraction or 0.4 })
		end

		if weaponAIData.SpawnAggroed then
			newEnemy.StartAggroed = true
		end

		if weaponAIData.SpawnDefaultAIDataOverrides ~= nil then
			if weaponAIData.SpawnSkipOverridesForTypes == nil or not game.Contains(weaponAIData.SpawnSkipOverridesForTypes, newEnemy.Name) then
				game.OverwriteTableKeys(newEnemy.DefaultAIData, weaponAIData.SpawnDefaultAIDataOverrides)
			end
		end

		if weaponAIData.SpawnDataOverrides ~= nil then
			if weaponAIData.SpawnSkipOverridesForTypes == nil or not game.Contains(weaponAIData.SpawnSkipOverridesForTypes, newEnemy.Name) then
				game.OverwriteTableKeys(newEnemy, weaponAIData.SpawnDataOverrides)
			end
		end

		game.SetupUnit(newEnemy, game.CurrentRun, args)
		AddToGroup({ Id = newEnemy.ObjectId, Name = spawnGroupName })
		--newEnemy.SkipActiveCount = true

		if weaponAIData.SpawnClones then
			newEnemy.MaxHealth = 1
			newEnemy.Health = 1
			newEnemy.HealthBuffer = 1
		end

		game.wait(game.CalcEnemyWait(enemy, weaponAIData.SpawnInterval), RoomThreadName)
		if enemy.IsDead then
			return
		end

		if game.GetActiveEnemyCount() >= currentRun.CurrentRoom.Encounter.ActiveEnemyCap then
			return
		end
	end

	local spawnGroupIds = GetIds({ Name = spawnGroupName })
	if weaponAIData.HealInterval and weaponAIData.HealPerTick then
		while IsAlive({ Ids = spawnGroupIds }) do
			game.Heal(enemy, { HealAmount = weaponAIData.HealPerTick, SourceName = "BossSpawnHeal", Silent = true })
			game.UpdateHealthBar(enemy)
			game.wait(game.CalcEnemyWait(enemy, weaponAIData.HealInterval), RoomThreadName)
		end
	end

	enemy.BossSpawnsUses = enemy.BossSpawnsUses + 1
end

-- Adapted from TyphonHeadEggAI
function mod.ModsNikkelMHadesBiomesHydraToothAI(enemy)
	local duration = enemy.DefaultAIData.HatchDuration or 8
	for i = 1, duration do
		game.thread(game.InCombatText, enemy.ObjectId, duration + 1 - i, 0.5,
			{ OffsetY = 20, SkipShadow = true, FontSize = 40, FlashAnimation = "TyphonEggTimerFlash", })
		-- CreateAnimation({ Name = "TyphonHeadEggPulse", DestinationId = enemy.ObjectId })
		game.AIWait(1.0, enemy, enemy.AIThreadName)
	end

	if enemy.DefaultAIData.SpawnFx ~= nil then
		CreateAnimation({ DestinationId = enemy.ObjectId, Name = enemy.DefaultAIData.SpawnFx })
	end
	local enemyData = game.EnemyData[game.GetRandomValue(enemy.DefaultAIData.SpawnOptions)]
	local newEnemy = game.DeepCopyTable(enemyData) or {}
	newEnemy.StartAggroed = true
	if newEnemy.IsUnitGroup then
		game.SpawnUnitGroup(newEnemy, nil, nil, enemy.ObjectId)
	else
		newEnemy.ObjectId = SpawnUnit({ Name = newEnemy.Name, Group = "Standing", DestinationId = enemy.ObjectId })
		game.thread(game.SetupUnit, newEnemy, game.CurrentRun, { SkipPresentation = true })
	end

	game.Kill(enemy)
end
