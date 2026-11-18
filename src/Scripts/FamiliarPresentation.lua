function mod.SnakeFamiliarSpawnPresentation(familiar)
	if familiar == nil or familiar.ObjectId == nil or familiar.SpawnPresentationPlayed then
		return
	end
	familiar.SpawnPresentationPlayed = true

	SetAnimation({ Name = familiar.HiddenAnimation, DestinationId = familiar.ObjectId })
	SetAlpha({ Id = familiar.ObjectId, Fraction = 0.0 })
	familiar.Burrowed = true
	mod.SnakeFamiliarUnburrowPresentation(familiar)
end

function mod.SnakeFamiliarAttackPresentation(familiar)
	if familiar == nil or familiar.ObjectId == nil then
		return
	end

	Stop({ Id = familiar.ObjectId })
	SetAnimation({ Name = familiar.PreAttackAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.PreAttackDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.TripleFireAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.FireDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.PostAttackAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.PostAttackDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.IdleAnimation, DestinationId = familiar.ObjectId })
end

function mod.SnakeFamiliarBurrowPresentation(familiar)
	if familiar == nil or familiar.ObjectId == nil or familiar.Burrowed or familiar.Burrowing then
		return
	end
	familiar.Burrowing = true

	StopAnimation({ Name = familiar.BurrowPersistentFx, DestinationId = familiar.ObjectId })
	CreateAnimation({ Name = familiar.BurrowFx, DestinationId = familiar.ObjectId })
	PlaySound({ Name = familiar.BurrowSound, Id = familiar.ObjectId })
	SetAnimation({ Name = familiar.BurrowAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.BurrowDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.HiddenAnimation, DestinationId = familiar.ObjectId })
	SetAlpha({ Id = familiar.ObjectId, Fraction = 0.0 })
	familiar.Burrowed = true
	familiar.Burrowing = false
end

function mod.SnakeFamiliarUnburrowPresentation(familiar)
	if familiar == nil or familiar.ObjectId == nil or not familiar.Burrowed or familiar.Unburrowing then
		return
	end
	familiar.Unburrowing = true

	SetAnimation({ Name = familiar.HiddenAnimation, DestinationId = familiar.ObjectId })
	SetAnimation({ Name = familiar.UnburrowAnimation, DestinationId = familiar.ObjectId })
	SetAlpha({ Id = familiar.ObjectId, Fraction = 1.0 })
	game.wait(familiar.UnburrowDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.IdleAnimation, DestinationId = familiar.ObjectId })
	game.wait(
		game.RandomFloat(familiar.PostUnburrowDurationMin, familiar.PostUnburrowDurationMax),
		familiar.AIThreadName
	)
	familiar.Burrowed = false
	familiar.Unburrowing = false
end
