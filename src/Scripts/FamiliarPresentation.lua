function mod.SnakeFamiliarSpawnPresentation(familiar, args)
	args = args or {}

	if game.CurrentHubRoom ~= nil or familiar.PreRecruit then
		SetAnimation({ Name = familiar.IdleAnimation, DestinationId = familiar.ObjectId })
		SetAlpha({ Id = familiar.ObjectId, Fraction = 1.0 })
		CreateAnimation({ Name = familiar.BurrowPersistentFx, DestinationId = familiar.ObjectId })
		familiar.Burrowed = false
		return
	end

	SetAnimation({ Name = familiar.HiddenAnimation, DestinationId = familiar.ObjectId })
	SetAlpha({ Id = familiar.ObjectId, Fraction = 0.0 })
	familiar.Burrowed = true
	familiar.OnUsedFunctionName = nil
	AddInteractBlock(familiar, "SnakeFamiliarInRun")
	if args.PostCombat or not game.FamiliarShouldUseCombatLogic() then
		mod.SnakeFamiliarUnburrowPresentation(familiar)
	end
end

function mod.SnakeFamiliarAttackPresentation(familiar, args)
	Stop({ Id = familiar.ObjectId })
	AngleTowardTarget({ Id = familiar.ObjectId, DestinationId = args.TargetId })
	SetAnimation({ Name = familiar.PreAttackAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.PreAttackDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.TripleFireAnimation, DestinationId = familiar.ObjectId })
	for dartIndex = 1, familiar.DartCount do
		AngleTowardTarget({ Id = familiar.ObjectId, DestinationId = args.TargetId })
		CreateProjectileFromUnit({
			Name = familiar.Using.Projectile,
			Id = familiar.ObjectId,
			DestinationId = args.TargetId,
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

function mod.SnakeFamiliarBurrowEffects(familiar, preventDecalChain)
	StopAnimation({
		Name = familiar.BurrowPersistentFx,
		DestinationId = familiar.ObjectId,
		PreventChain = preventDecalChain,
	})
	CreateAnimation({ Name = familiar.BurrowFx, DestinationId = familiar.ObjectId })
	PlaySound({ Name = familiar.BurrowSound, Id = familiar.ObjectId })
end

function mod.SnakeFamiliarBurrowPresentation(familiar)
	mod.SnakeFamiliarBurrowEffects(familiar)
	SetAnimation({ Name = familiar.BurrowAnimation, DestinationId = familiar.ObjectId })
	game.wait(familiar.BurrowDuration, familiar.AIThreadName)
	SetAnimation({ Name = familiar.HiddenAnimation, DestinationId = familiar.ObjectId })
	SetAlpha({ Id = familiar.ObjectId, Fraction = 0.0 })
	familiar.Burrowed = true
end

function mod.SnakeFamiliarUnburrowPresentation(familiar)
	if not mod.SnakeFamiliarEnsureSafeUnburrowLocation(familiar) then
		return
	end

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

function mod.SnakeFamiliarSpecialInteractLockedInRun(familiar)
	local blockName = "SnakeFamiliarApproach"
	AddInputBlock({ Name = blockName })
	game.AddInteractBlock(familiar, blockName)
	game.HideUseButton(familiar.ObjectId, familiar)

	local heroId = game.CurrentRun.Hero.ObjectId
	Stop({ Id = heroId })
	Halt({ Id = heroId })
	CancelWeaponFireRequests({ Id = heroId })
	local offset = game.CalcOffset(math.rad(GetAngle({ Id = familiar.ObjectId })), 110)
	local petPointId = SpawnObstacle({
		Name = "InvisibleTarget",
		DestinationId = familiar.ObjectId,
		OffsetX = offset.X,
		OffsetY = offset.Y * 0.5,
	})
	if GetDistance({ Id = heroId, DestinationId = petPointId }) > 10 then
		game.MoveHeroToRoomPosition({
			DestinationId = petPointId,
			DisableCollision = true,
			SuccessDistance = 32,
			NotifyDistance = 10,
			ContinueToGoal = true,
		})
		game.wait(0.3)
	end
	Destroy({ Id = petPointId })
	AngleTowardTarget({ Id = heroId, DestinationId = familiar.ObjectId })
	local unequipAnimation = game.GetEquippedWeaponValue("UnequipAnimation") or "MelinoeIdleWeaponless"
	SetAnimation({ Name = unequipAnimation, DestinationId = heroId })
	game.wait(0.45)

	local leanStartTime = 0.9
	local burrowStartTime = 3.35
	SetAnimation({ Name = "ModsNikkelMHadesBiomes_MelinoePetOphis", DestinationId = heroId })
	game.thread(game.PlayVoiceLines, familiar.InteractVoiceLines)

	game.wait(leanStartTime)
	SetAnimation({ Name = familiar.PetAnimation, DestinationId = familiar.ObjectId })
	game.wait(burrowStartTime - leanStartTime)

	game.thread(mod.SnakeFamiliarFledPresentation, familiar)
	game.wait(1.25)
	RemoveInputBlock({ Name = blockName })
end

function mod.SnakeFamiliarFledPresentation(familiar)
	UseableOff({ Id = familiar.ObjectId })

	mod.SnakeFamiliarBurrowPresentation(familiar)

	Destroy({ Id = familiar.ObjectId })
	game.ActiveEnemies[familiar.ObjectId] = nil

	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.ModsNikkelMHadesBiomes_SnakeFamiliarFledVoiceLines)
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
	if not familiar.Burrowed then
		SetAnimation({ Name = familiar.VictoryAnimation, DestinationId = familiar.ObjectId })
		game.wait(familiar.VictoryRecoveryDuration, familiar.AIThreadName)
	end
	game.ReenableFamiliar(familiar)
end

function mod.SnakeFamiliarRoomExitPresentation(familiar, args)
	mod.SnakeFamiliarStopAI(familiar)
	if not familiar.Burrowed then
		mod.SnakeFamiliarBurrowPresentation(familiar)
	end
end
