function game.EnemyHandleInvisibleAttack(enemy, weaponAIData, currentRun, args)
	args = args or {}
	if enemy.IsInvisible and not weaponAIData.KeepInvisibility then
		if enemy.CurrentPhase ~= nil and enemy.CurrentPhase >= 2 and enemy.Phase2VFX ~= nil then
			CreateAnimation({ Name = enemy.Phase2VFX, DestinationId = enemy.ObjectId })
		end

		SetLifeProperty({ DestinationId = enemy.ObjectId, Property = "InvulnerableFx", Value = "Invincibubble_Hades" })
		enemy.IsInvisible = false
		CreateHealthBar(enemy)
		UpdateHealthBar(enemy, 0, { Force = true })

		-- if enemy.ActiveEffects and enemy.ActiveEffects.MarkRuptureTarget then
		-- 	UpdateRuptureEffectStacks({ TriggeredByTable = enemy, triggeredById = enemy.ObjectId })
		-- end
		if enemy.InvisibilityEndSound ~= nil then
			PlaySound({ Name = enemy.InvisibilityEndSound })
		end
		SetUnitVulnerable(enemy)
		SetAlpha({ Id = enemy.ObjectId, Fraction = 1.0, Duration = weaponAIData.InvisibilityFadeInDuration })
		SetColor({ Id = enemy.ObjectId, Color = { 255, 255, 255, 255 }, Duration = weaponAIData.InvisibilityFadeInDuration })
		if args.CreateAnimation then
			CreateAnimation({ Name = args.CreateAnimation, DestinationId = enemy.ObjectId })
		end
		if args.Animation then
			CreateAnimation({ Name = args.Animation, DestinationId = enemy.ObjectId })
		end
		SetUnitProperty({ DestinationId = enemy.ObjectId, Property = "CollideWithUnits", Value = true })
		SetUnitProperty({
			DestinationId = enemy.ObjectId,
			Property = "ImmuneToStun",
			Value = enemy
					.PreInvisibilityImmuneToStun
		})
		SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsProjectiles", Value = true })
		enemy.SkipInvulnerableOnHitPresentation = false
		wait(CalcEnemyWait(enemy, weaponAIData.InvisibilityFadeInDuration), enemy.AIThreadName)
	end
end
