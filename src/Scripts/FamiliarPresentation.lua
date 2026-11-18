local function waitForSnakeFamiliarAnimation(familiar, animationName)
	familiar.AnimationNotifyIndex = (familiar.AnimationNotifyIndex or 0) + 1
	local notifyName = "SnakeFamiliarAnimation_" .. familiar.ObjectId .. "_" .. familiar.AnimationNotifyIndex
	NotifyOnAnimationTimeRemaining({
		Id = familiar.ObjectId,
		Animation = animationName,
		Remaining = 0.01,
		Notify = notifyName,
		Timeout = 9.0,
	})
	game.waitUntil(notifyName)
end

function mod.SnakeFamiliarSpawnPresentation(familiar)
	if familiar == nil or familiar.ObjectId == nil or familiar.SpawnPresentationPlayed then
		return
	end
	familiar.SpawnPresentationPlayed = true

	SetAnimation({ Name = familiar.SpawnAnimation, DestinationId = familiar.ObjectId })
	CreateAnimation({ Name = familiar.SpawnFx, DestinationId = familiar.ObjectId })
	SetAlpha({ Id = familiar.ObjectId, Fraction = 1.0 })
	waitForSnakeFamiliarAnimation(familiar, familiar.SpawnAnimation)
	SetAnimation({ Name = familiar.IdleAnimation, DestinationId = familiar.ObjectId })
	familiar.Burrowed = false
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
	if familiar == nil or familiar.ObjectId == nil or familiar.Burrowed then
		return
	end

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
	if familiar == nil or familiar.ObjectId == nil or not familiar.Burrowed then
		return
	end

	SetAlpha({ Id = familiar.ObjectId, Fraction = 1.0 })
	SetAnimation({ Name = familiar.UnburrowAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.UnburrowDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.IdleAnimation, DestinationId = familiar.ObjectId })
	game.wait(
		game.RandomFloat(familiar.PostUnburrowDurationMin, familiar.PostUnburrowDurationMax),
		familiar.AIThreadName
	)
	familiar.Burrowed = false
end
