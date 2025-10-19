function mod.EnemyHandleInvisibleAttack(enemy, weaponAIData, args)
	args = args or {}
	if enemy.IsInvisible and not weaponAIData.KeepInvisibility then
		if enemy.CurrentPhase ~= nil and enemy.CurrentPhase >= 2 and enemy.Phase2VFX ~= nil then
			CreateAnimation({ Name = enemy.Phase2VFX, DestinationId = enemy.ObjectId })
		end

		enemy.IsInvisible = false
		game.CreateHealthBar(enemy)
		game.UpdateHealthBar(enemy, 0, { Force = true })

		if enemy.InvisibilityEndSound ~= nil then
			PlaySound({ Name = enemy.InvisibilityEndSound })
		end
		game.SetUnitVulnerable(enemy, "EnemyInvisibility")
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
			Value = enemy.PreInvisibilityImmuneToStun
		})
		SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsProjectiles", Value = true })
		enemy.SkipInvulnerableOnHitPresentation = false
		game.wait(game.CalcEnemyWait(enemy, weaponAIData.InvisibilityFadeInDuration), enemy.AIThreadName)
	end
end

function mod.HadesEnemyInvisibility(enemy, weaponAIData, currentRun, args)
	mod.EnemyInvisibility(enemy, weaponAIData, args)
end

function mod.EnemyInvisibility(enemy, weaponAIData, args)
	args = args or {}

	weaponAIData.InvisibilityInterval = weaponAIData.InvisibilityInterval or 0
	enemy.LastInvisibilityTime = enemy.LastInvisibilityTime or 0

	if game._worldTime - enemy.LastInvisibilityTime >= weaponAIData.InvisibilityInterval then
		ClearEffect({ Id = enemy.ObjectId, All = true })
		enemy.SkipInvulnerableOnHitPresentation = true

		local alpha = args.Alpha or 0.0
		local color = args.Color or { 0, 0, 0, 0 }

		SetAlpha({ Id = enemy.ObjectId, Fraction = alpha, Duration = weaponAIData.InvisibilityFadeOutDuration })
		SetColor({ Id = enemy.ObjectId, Color = color, Duration = weaponAIData.InvisibilityFadeOutDuration })

		if args.CreateAnimation then
			CreateAnimation({ Name = args.CreateAnimation, DestinationId = enemy.ObjectId, Scale = 1.0 })
		end
		if args.Animation then
			SetAnimation({ Name = args.Animation, DestinationId = enemy.ObjectId })
		end
		SetUnitProperty({ DestinationId = enemy.ObjectId, Property = "CollideWithUnits", Value = false })
		SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsProjectiles", Value = false })
		enemy.PreInvisibilityImmuneToStun = GetUnitDataValue({ Id = enemy.ObjectId, Property = "ImmuneToStun" })
		SetUnitProperty({ DestinationId = enemy.ObjectId, Property = "ImmuneToStun", Value = true })
		game.SetUnitInvulnerable(enemy, "EnemyInvisibility", { Silent = true })
		game.wait(weaponAIData.InvisibilityFadeOutDuration, enemy.AIThreadName)
		if enemy.Phase2VFX ~= nil then
			StopAnimation({ Name = enemy.Phase2VFX, DestinationId = enemy.ObjectId })
		end
		enemy.IsInvisible = true
		enemy.LastInvisibilityTime = game._worldTime
		if not enemy.UseBossHealthBar then
			game.RemoveEnemyHealthBar(enemy)
		end

		if weaponAIData.PostInvisibilityFunction ~= nil then
			game.CallFunctionName(weaponAIData.PostInvisibilityFunction, enemy, weaponAIData, args)
		end
		AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = game.CurrentRun.Hero.ObjectId })
	end
end
