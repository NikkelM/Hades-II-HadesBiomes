function mod.SnakeFamiliarSpawnPresentation(familiar, args)
	args = args or {}

	if game.CurrentHubRoom ~= nil then
		SetAnimation({ Name = familiar.IdleAnimation, DestinationId = familiar.ObjectId })
		SetAlpha({ Id = familiar.ObjectId, Fraction = 1.0 })
		CreateAnimation({ Name = familiar.BurrowPersistentFx, DestinationId = familiar.ObjectId })
		familiar.Burrowed = false
		return
	end

	SetAnimation({ Name = familiar.HiddenAnimation, DestinationId = familiar.ObjectId })
	SetAlpha({ Id = familiar.ObjectId, Fraction = 0.0 })
	familiar.Burrowed = true
	if not familiar.PreRecruit then
		familiar.OnUsedFunctionName = nil
		AddInteractBlock(familiar, "SnakeFamiliarInRun")
	end
	if args.PostCombat or familiar.PreRecruit or not game.FamiliarShouldUseCombatLogic() then
		mod.SnakeFamiliarUnburrowPresentation(familiar)
	end
end

function mod.SnakeFamiliarAttackPresentation(familiar, args)
	args = args or {}
	local targetId = args.TargetId or familiar.CapturedTargetId

	Stop({ Id = familiar.ObjectId })
	AngleTowardTarget({ Id = familiar.ObjectId, DestinationId = targetId })
	SetAnimation({ Name = familiar.PreAttackAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.PreAttackDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.TripleFireAnimation, DestinationId = familiar.ObjectId })
	for dartIndex = 1, familiar.DartCount do
		AngleTowardTarget({ Id = familiar.ObjectId, DestinationId = targetId })
		CreateProjectileFromUnit({
			Name = familiar.Using.Projectile,
			Id = familiar.ObjectId,
			DestinationId = targetId,
		})
		if dartIndex < familiar.DartCount then
			game.wait(familiar.ProjectileInterval, familiar.AIThreadName)
		end
	end
	game.wait(
		math.max(0, familiar.FireDuration - (familiar.DartCount - 1) * familiar.ProjectileInterval),
		familiar.AIThreadName
	)
	mod.SnakeFamiliarPostAttackPresentation(familiar)
end

function mod.SnakeFamiliarPostAttackPresentation(familiar)
	SetAnimation({ Name = familiar.PostAttackAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.PostAttackDuration, familiar.AIThreadName)
end

function mod.SnakeFamiliarBurrowPresentation(familiar)
	StopAnimation({ Name = familiar.BurrowPersistentFx, DestinationId = familiar.ObjectId })
	CreateAnimation({ Name = familiar.BurrowFx, DestinationId = familiar.ObjectId })
	PlaySound({ Name = familiar.BurrowSound, Id = familiar.ObjectId })
	SetAnimation({ Name = familiar.BurrowAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.BurrowDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.HiddenAnimation, DestinationId = familiar.ObjectId })
	SetAlpha({ Id = familiar.ObjectId, Fraction = 0.0 })
	familiar.Burrowed = true
end

function mod.SnakeFamiliarUnburrowPresentation(familiar)
	SetAnimation({ Name = familiar.UnburrowAnimation, DestinationId = familiar.ObjectId })
	SetAlpha({ Id = familiar.ObjectId, Fraction = 1.0 })
	game.wait(familiar.UnburrowDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.IdleAnimation, DestinationId = familiar.ObjectId })
	game.wait(
		game.RandomFloat(familiar.PostUnburrowDurationMin, familiar.PostUnburrowDurationMax),
		familiar.AIThreadName
	)
	familiar.Burrowed = false
end

function mod.SnakeFamiliarVictoryPresentation(familiar, args)
	if familiar.BlockVictoryPresentation then
		return
	end

	mod.SnakeFamiliarStopAI(familiar)
	game.wait(1.0, familiar.AIThreadName)
	if familiar.Burrowed then
		mod.SnakeFamiliarUnburrowPresentation(familiar)
	end
	SetAnimation({ Name = familiar.VictoryAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.VictoryRecoveryDuration, familiar.AIThreadName)
	game.ReenableFamiliar(familiar)
end

function mod.SnakeFamiliarRoomExitPresentation(familiar, args)
	mod.SnakeFamiliarStopAI(familiar)
	if not familiar.Burrowed then
		mod.SnakeFamiliarBurrowPresentation(familiar)
	end
end
