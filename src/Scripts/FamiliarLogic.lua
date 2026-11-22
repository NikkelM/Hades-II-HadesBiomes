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

local function isSnakeFamiliarLocationValid(locationId, targetId)
	return not IsLocationBlocked({ Id = locationId, CheckUnits = true, PathfindersPreferAvoid = true }) and
			(targetId == nil or HasLineOfSight({ Id = locationId, DestinationId = targetId, StopsProjectiles = true, CheckUnits = false, }))
end

local function getClosestValidSnakeFamiliarLocation(locationIds, targetId)
	local safeLocations = {}
	for _, locationId in ipairs(locationIds) do
		if isSnakeFamiliarLocationValid(locationId, targetId) and (targetId == nil or game.IsSpawnPointEligible(locationId, {}, game.CurrentRun.CurrentRoom, { CheckRewardPointsUsed = true })) then
			table.insert(safeLocations, locationId)
		end
	end

	return #safeLocations > 0 and GetClosest({ Id = game.CurrentRun.Hero.ObjectId, DestinationIds = safeLocations }) or 0
end

local function getSnakeFamiliarLocationNearHero(targetId)
	local destinationId = getClosestValidSnakeFamiliarLocation(GetIdsByType({ Name = "FamiliarPoint" }), targetId)
	if destinationId <= 0 then
		destinationId = getClosestValidSnakeFamiliarLocation(GetIds({ Name = "SpawnPoints" }), targetId)
	end
	if destinationId > 0 then
		return destinationId
	end
	if isSnakeFamiliarLocationValid(game.CurrentRun.Hero.ObjectId, targetId) then
		return game.CurrentRun.Hero.ObjectId
	end
end

local function getSnakeFamiliarFiringLocation(familiar, targetId)
	local closestBetweenDistance = GetDistance({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = targetId }) / 2
	local closestTargetDistance = math.huge
	local closestBetweenId, closestTargetId

	for _, pointId in ipairs(GetIdsByType({ Names = { "EnemyPoint", "EnemyPointMelee", "EnemyPointRanged", "EnemyPointSupport" } })) do
		if game.IsSpawnPointEligible(pointId, {}, game.CurrentRun.CurrentRoom, { CheckRewardPointsUsed = true }) and isSnakeFamiliarLocationValid(pointId, targetId) then
			local midpointDistance = GetDistance({ Id = pointId, DestinationIds = { game.CurrentRun.Hero.ObjectId, targetId } })
			if midpointDistance <= closestBetweenDistance then
				closestBetweenId = pointId
				closestBetweenDistance = midpointDistance
			end
			local targetDistance = GetDistance({ Id = pointId, DestinationId = targetId })
			if targetDistance < closestTargetDistance then
				closestTargetId = pointId
				closestTargetDistance = targetDistance
			end
		end
	end

	local firingLocationId = closestBetweenId or closestTargetId or getSnakeFamiliarLocationNearHero(targetId)
	if firingLocationId ~= nil then
		return firingLocationId
	end
	if isSnakeFamiliarLocationValid(familiar.ObjectId, targetId) then
		return familiar.ObjectId
	end

	return nil
end

local function teleportSnakeFamiliarNearHero(familiar)
	local destinationId = getSnakeFamiliarLocationNearHero()
	if destinationId == nil then
		return false
	end
	Teleport({ Id = familiar.ObjectId, DestinationId = destinationId })
	return true
end

function mod.SnakeFamiliarEnsureSafeUnburrowLocation(familiar)
	if game.CurrentHubRoom ~= nil or familiar.PreRecruit or not IsLocationBlocked({ Id = familiar.ObjectId, CheckUnits = true, PathfindersPreferAvoid = true }) then
		return true
	end

	if game.FamiliarShouldUseCombatLogic() then
		return false
	end

	return teleportSnakeFamiliarNearHero(familiar)
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
	local firingLocationId = targetId > 0 and getSnakeFamiliarFiringLocation(familiar, targetId)
	if firingLocationId then
		mod.SnakeFamiliarMoveToLocation(familiar, { Id = firingLocationId, KeepAIAlive = true })
		if not familiar.Burrowed and isSnakeFamiliarAttackTargetValid(familiar, targetId) then
			mod.SnakeFamiliarAttackPresentation(familiar, { TargetId = targetId })
			return true
		end
	end

	if familiar.Burrowed and game.IsAIActive(familiar) and game.FamiliarShouldUseCombatLogic() and teleportSnakeFamiliarNearHero(familiar) then
		mod.SnakeFamiliarUnburrowPresentation(familiar)
	end

	return false
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
			if attackDelay ~= nil then
				if not familiar.Burrowed then
					mod.SnakeFamiliarBurrowPresentation(familiar)
				end
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
	game.wait(0.02)
end

function mod.SnakeFamiliarMoveToLocation(familiar, args)
	args = args or {}
	local destinationId = args.Id or game.CurrentRun.Hero.ObjectId

	if not args.KeepAIAlive then
		mod.SnakeFamiliarStopAI(familiar)
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
