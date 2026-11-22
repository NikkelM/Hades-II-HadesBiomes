local function getSnakeFamiliarTarget(familiar)
	local eligibleIds = {}
	for id, enemy in pairs(game.ShallowCopyTable(game.ActiveEnemies)) do
		if not enemy.IsDead and (enemy.RequiredKill or enemy.FamiliarTarget) and not IsInvulnerable({ Id = enemy.ObjectId }) then
			table.insert(eligibleIds, id)
		end
	end

	return GetClosest({
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationIds = eligibleIds,
		Distance = familiar.TargetSearchDistance,
		IgnoreHomingIneligible = true,
		IgnoreSelf = true,
	})
end

local function isSnakeFamiliarFiringLocationValid(familiar, locationId, targetId, checkSpawnPoint)
	if locationId <= 0 then
		return false
	end
	if checkSpawnPoint and not game.IsSpawnPointEligible(locationId, {}, game.CurrentRun.CurrentRoom, { CheckRewardPointsUsed = true }) then
		return false
	end
	if IsLocationBlocked({ Id = locationId, CheckUnits = false, PathfindersPreferAvoid = false }) then
		return false
	end

	local targetDistance = GetDistance({ Id = locationId, DestinationId = targetId })
	if targetDistance < familiar.TargetDistanceMin or targetDistance > familiar.TargetDistanceMax then
		return false
	end
	local heroDistance = GetDistance({ Id = locationId, DestinationId = game.CurrentRun.Hero.ObjectId })
	if heroDistance < familiar.HeroDistanceMin or heroDistance > familiar.HeroDistanceMax then
		return false
	end

	return HasLineOfSight({
		Id = locationId,
		DestinationId = targetId,
		StopsProjectiles = true,
		CheckUnits = false,
		LineOfSightBuffer = 50,
		LineOfSightEndBuffer = 50,
	})
end

local function getSnakeFamiliarMapFiringLocation(familiar, targetId)
	local candidateIds = game.CombineTablesIPairs(
		GetIds({ Name = "SpawnPoints" }),
		GetIdsByType({ Name = "FamiliarPoint" })
	)

	local bestId = nil
	local bestScore = nil
	for _, candidateId in ipairs(candidateIds) do
		if isSnakeFamiliarFiringLocationValid(familiar, candidateId, targetId, true) then
			local targetDistance = GetDistance({ Id = candidateId, DestinationId = targetId })
			local heroDistance = GetDistance({ Id = candidateId, DestinationId = game.CurrentRun.Hero.ObjectId })
			local score = math.abs(targetDistance - familiar.TargetDistancePreferred) + heroDistance * 0.001
			if bestScore == nil or score < bestScore then
				bestId = candidateId
				bestScore = score
			end
		end
	end
	return bestId
end

local function createSnakeFamiliarFallbackFiringLocation(familiar, targetId)
	local angleToHero = GetAngleBetween({ Id = targetId, DestinationId = game.CurrentRun.Hero.ObjectId })
	for _, angle in ipairs({ angleToHero, angleToHero + 180 }) do
		local offset = CalcOffset(math.rad(angle), familiar.TargetDistancePreferred)
		local candidateId = SpawnObstacle({
			Name = "InvisibleTarget",
			DestinationId = targetId,
			OffsetX = offset.X,
			OffsetY = offset.Y,
			ForceToValidLocation = true,
			Group = "Scripting",
		})
		if isSnakeFamiliarFiringLocationValid(familiar, candidateId, targetId, false) then
			familiar.RelocationTargetId = candidateId
			return candidateId
		end
		Destroy({ Id = candidateId })
	end
end

local function getSnakeFamiliarFiringLocation(familiar, targetId)
	local firingLocationId = getSnakeFamiliarMapFiringLocation(familiar, targetId) or
			createSnakeFamiliarFallbackFiringLocation(familiar, targetId)
	if firingLocationId ~= nil then
		return firingLocationId
	end

	if isSnakeFamiliarFiringLocationValid(familiar, familiar.ObjectId, targetId, false) then
		return familiar.ObjectId
	end
end

local function clearSnakeFamiliarRelocationTarget(familiar)
	if familiar.RelocationTargetId ~= nil then
		Destroy({ Id = familiar.RelocationTargetId })
		familiar.RelocationTargetId = nil
	end
end

local function isSnakeFamiliarAttackTargetValid(familiar, targetId)
	local enemy = game.ActiveEnemies[targetId]
	return game.IsAIActive(familiar) and game.FamiliarShouldUseCombatLogic() and enemy ~= nil and not enemy.IsDead and
			(enemy.RequiredKill or enemy.FamiliarTarget) and not IsInvulnerable({ Id = enemy.ObjectId })
end

local function snakeFamiliarTryAttack(familiar)
	if not game.IsAIActive(familiar) or not game.FamiliarShouldUseCombatLogic() then
		return false
	end

	local targetId = getSnakeFamiliarTarget(familiar)
	if targetId <= 0 then
		return false
	end
	local firingLocationId = getSnakeFamiliarFiringLocation(familiar, targetId)
	if firingLocationId == nil then
		return false
	end

	familiar.CapturedTargetId = targetId
	mod.SnakeFamiliarMoveToLocation(familiar, {
		Id = firingLocationId,
		KeepAIAlive = true,
	})
	clearSnakeFamiliarRelocationTarget(familiar)

	if not isSnakeFamiliarAttackTargetValid(familiar, targetId) then
		if game.IsAIActive(familiar) and game.FamiliarShouldUseCombatLogic() and not familiar.Burrowed then
			mod.SnakeFamiliarBurrowPresentation(familiar)
		end
		familiar.CapturedTargetId = nil
		return false
	end

	if not isSnakeFamiliarAttackTargetValid(familiar, targetId) then
		if game.IsAIActive(familiar) and game.FamiliarShouldUseCombatLogic() and not familiar.Burrowed then
			mod.SnakeFamiliarBurrowPresentation(familiar)
		end
		familiar.CapturedTargetId = nil
		return false
	end

	mod.SnakeFamiliarAttackPresentation(familiar, { TargetId = targetId })
	familiar.CapturedTargetId = nil
	return true
end

function mod.SnakeFamiliarAI(familiar, args)
	args = args or {}

	if args.Equipping and game.CurrentHubRoom and game.CurrentHubRoom.Name == "Hub_PreRun" then
		-- Use the same equip destination as Raki and Gale
		mod.SnakeFamiliarMoveToLocation(familiar, { Id = 589725, KeepAIAlive = true })
	end

	local attackDelay = args.InitialDelay or familiar.InitialAttackDelay
	while game.IsAIActive(familiar) do
		if game.CurrentHubRoom ~= nil then
			game.wait(0.2, familiar.AIThreadName)
		elseif game.FamiliarShouldUseCombatLogic() then
			if not familiar.Burrowed then
				mod.SnakeFamiliarBurrowPresentation(familiar)
			end

			if attackDelay ~= nil then
				game.wait(attackDelay, familiar.AIThreadName)
				attackDelay = nil
			end

			if snakeFamiliarTryAttack(familiar) then
				game.wait(game.RandomFloat(familiar.PostAttackBurrowDelayMin, familiar.PostAttackBurrowDelayMax),
					familiar.AIThreadName)
				if game.IsAIActive(familiar) and game.FamiliarShouldUseCombatLogic() and not familiar.Burrowed then
					mod.SnakeFamiliarBurrowPresentation(familiar)
				end
				attackDelay = game.RandomFloat(familiar.AttackMinDuration, familiar.AttackMaxDuration)
			elseif game.IsAIActive(familiar) and game.FamiliarShouldUseCombatLogic() then
				game.wait(familiar.TargetRetryInterval, familiar.AIThreadName)
			end
		else
			attackDelay = familiar.InitialAttackDelay
			if familiar.Burrowed then
				mod.SnakeFamiliarUnburrowPresentation(familiar)
			end
			game.wait(0.2, familiar.AIThreadName)
		end
	end

	clearSnakeFamiliarRelocationTarget(familiar)
	familiar.CapturedTargetId = nil
	familiar.AIBehavior = nil
end

function mod.SnakeFamiliarStopAI(familiar)
	Stop({ Id = familiar.ObjectId })
	familiar.DisableAIWhenReady = true
	familiar.AIDisabled = true
	familiar.AIBehavior = nil

	game.killTaggedThreads(familiar.AIThreadName)
	game.killWaitUntilThreads(familiar.AINotifyName)
	CancelNotify({ Name = familiar.AINotifyName })
	clearSnakeFamiliarRelocationTarget(familiar)
	familiar.CapturedTargetId = nil
	game.wait(0.02)
end

function mod.SnakeFamiliarMoveToLocation(familiar, args)
	args = args or {}
	local destinationId = args.Id or game.CurrentRun.Hero.ObjectId

	if not args.KeepAIAlive then
		mod.SnakeFamiliarStopAI(familiar)
		game.RemoveInteractBlock(familiar, "SnakeFamiliarInRun")
	end
	if not familiar.Burrowed then
		mod.SnakeFamiliarBurrowPresentation(familiar)
	end
	Teleport({
		Id = familiar.ObjectId,
		DestinationId = destinationId,
		OffsetX = args.OffsetX,
		OffsetY = args.OffsetY,
	})
	if not args.KeepBurrowedOnFinish then
		mod.SnakeFamiliarUnburrowPresentation(familiar)
	end
end

-- Vanilla familiars have their default costume as part of their default model, SnakeFamiliar would use the "enemy" texture if we don't do this
function mod.SnakeFamiliarSetupCostume(familiar, args)
	local costumes = game.GameState.FamiliarCostumes
	costumes[familiar.Name] = costumes[familiar.Name] or familiar.DefaultCostume
	game.SetupFamiliarCostume(familiar, args)
end
