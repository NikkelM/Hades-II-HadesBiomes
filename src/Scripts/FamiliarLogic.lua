function mod.SnakeFamiliarAI(familiar, args)
	args = args or {}

	game.wait(args.InitialDelay or familiar.InitialAttackDelay, familiar.AIThreadName)

	while game.IsAIActive(familiar) do
		local heroId = game.CurrentRun.Hero.ObjectId
		if heroId ~= nil and IdExists({ Id = heroId }) then
			AngleTowardTarget({ Id = familiar.ObjectId, DestinationId = heroId })
		end

		mod.SnakeFamiliarAttackPresentation(familiar)
		if not game.IsAIActive(familiar) then
			break
		end

		game.wait(
			game.RandomFloat(familiar.PostAttackBurrowDelayMin, familiar.PostAttackBurrowDelayMax),
			familiar.AIThreadName
		)
		if not game.IsAIActive(familiar) then
			break
		end

		mod.SnakeFamiliarBurrowPresentation(familiar)
		game.wait(
			game.RandomFloat(familiar.HiddenDurationMin, familiar.HiddenDurationMax),
			familiar.AIThreadName
		)
		if not game.IsAIActive(familiar) then
			break
		end

		mod.SnakeFamiliarUnburrowPresentation(familiar)
	end

	familiar.AIBehavior = nil
end

function mod.SnakeFamiliarStopAI(familiar)
	if familiar == nil or familiar.ObjectId == nil then
		return
	end

	Stop({ Id = familiar.ObjectId })
	familiar.DisableAIWhenReady = true
	familiar.AIDisabled = true
	familiar.AIBehavior = nil

	if familiar.AIThreadName ~= nil then
		game.killTaggedThreads(familiar.AIThreadName)
	end
	if familiar.AINotifyName ~= nil then
		game.killWaitUntilThreads(familiar.AINotifyName)
		CancelNotify({ Name = familiar.AINotifyName })
	end
end

function mod.SnakeFamiliarMoveToLocation(familiar, args)
	args = args or {}
	local destinationId = args.Id or game.CurrentRun.Hero.ObjectId
	if familiar == nil or familiar.ObjectId == nil or destinationId == nil then
		return
	end

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
