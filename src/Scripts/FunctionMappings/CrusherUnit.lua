function game.ModsNikkelMHadesBiomesCrusherUnitTouchdown(unit, args)
	-- Make the enemy vulnerable again after the hack to prevent it from being caught in the Cast
	SetVulnerable({ Id = unit.ObjectId })
	CreateProjectileFromUnit({
		Name = args.ProjectileName,
		Id = unit.ObjectId,
		DestinationId = unit.ObjectId,
		FireFromTarget = true
	})
end

-- Same as in Hades II, but:
-- More upward force to move the enemy off screen completely
-- SetInvulnerable to prevent the airborne enemy from being affected by the Cast
function game.ModsNikkelMHadesBiomesSkyAttackerAI(enemy, currentRun)
	currentRun = currentRun or game.CurrentRun
	if enemy.WakeUpDelay ~= nil or (enemy.WakeUpDelayMin ~= nil and enemy.WakeUpDelayMax ~= nil) then
		local wakeUpDelay = enemy.WakeUpDelay or game.RandomFloat(enemy.WakeUpDelayMin, enemy.WakeUpDelayMax)
		game.wait(game.CalcEnemyWait(enemy, wakeUpDelay), enemy.AIThreadName)
	end

	while game.IsAIActive(enemy) do
		if not CanAttack({ Id = enemy.ObjectId }) then
			enemy.AINotifyName = "CanAttack" .. enemy.ObjectId
			NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
			game.waitUntil(enemy.AINotifyName)
		end

		enemy.WeaponName = game.SelectWeapon(enemy)
		table.insert(enemy.WeaponHistory, enemy.WeaponName)
		local aiData = game.GetWeaponAIData(enemy) or {}

		aiData.TargetId = GetTargetId(enemy, aiData)

		if aiData.TargetId ~= nil and aiData.TargetId ~= 0 then
			ClearEffect({ Id = enemy.ObjectId, Name = "HermesSlow" })
			if aiData.ResetSkyAttackSound ~= nil then
				PlaySound({ Name = aiData.ResetSkyAttackSound, Id = enemy.ObjectId })
			end
			if aiData.LaunchAnimation ~= nil then
				SetAnimation({ DestinationId = enemy.ObjectId, Name = aiData.LaunchAnimation })
			end
			if aiData.StopAnimationsOnLaunch ~= nil then
				StopAnimation({ DestinationId = enemy.ObjectId, Name = aiData.StopAnimationsOnLaunch })
			end
			if aiData.ShadowAnimationGroundName ~= nil then
				StopAnimation({ DestinationId = enemy.ObjectId, Name = aiData.ShadowAnimationGroundName })
			end
			CreateAnimation({ DestinationId = enemy.ObjectId, Name = aiData.ShadowAnimationFadeOutName })

			-- Modified from 5000 to 8000 to move it offscreen completely and in a smoother motion
			-- Don't set it too high, or the enemy will ascend too fast and it doesn't look good anymore
			ApplyUpwardForce({ Id = enemy.ObjectId, Speed = 8000 })
			-- Prevent it from being affected by the Cast
			SetInvulnerable({ Id = enemy.ObjectId })
			game.wait(0.5, enemy.AIThreadName)
			enemy.BlockingLocation = false
			enemy.InSky = true
			IgnoreGravity({ Id = enemy.ObjectId })
			SetAlpha({ Id = enemy.ObjectId, Fraction = 0.0 })
			SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsUnits", Value = false })
			SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsProjectiles", Value = false })

			-- Disapear
			local hideDuration = aiData.PostLaunchHideDuration or
					game.RandomFloat(aiData.PostLaunchHideDurationMin, aiData.PostLaunchHideDurationMax)
			game.wait(game.CalcEnemyWait(enemy, aiData.PostLaunchHideDuration, { IgnoreSpeedMultiplier = true }),
				enemy.AIThreadName)
			Teleport({ Id = enemy.ObjectId, DestinationId = aiData.TargetId })
			CreateAnimation({ DestinationId = enemy.ObjectId, Name = aiData.ShadowAnimationFadeInName })
			game.wait(game.CalcEnemyWait(enemy, aiData.PostLaunchHideFadeInDuration, { IgnoreSpeedMultiplier = true }),
				enemy.AIThreadName)

			-- Pre-Attack Movement
			if aiData.RetreatBeforeAttack then
				game.Retreat(enemy, aiData, aiData.TargetId)
				game.wait(game.CalcEnemyWait(enemy, 0.05), enemy.AIThreadName)
			end

			-- Movement
			game.MoveWithinRange(enemy, aiData.MoveToId or aiData.TargetId, aiData)

			while aiData.WaitIfBlockedDistance ~= nil and game.IsLocationBlockedWithinDistance(enemy, aiData.WaitIfBlockedDistance) do
				game.Retreat(enemy, aiData, aiData.TargetId)
				game.wait(game.CalcEnemyWait(enemy,
						game.RandomFloat(aiData.WaitIfBlockedDurationMin or 0.5, aiData.WaitIfBlockedDurationMax or 5.0)),
					enemy.AIThreadName)
				game.MoveWithinRange(enemy, aiData.MoveToId or aiData.TargetId, aiData)
			end

			if aiData.PreAttackVoiceLines ~= nil then
				game.thread(game.PlayVoiceLines, aiData.PreAttackVoiceLines, nil, enemy)
			end

			-- Attack
			local attackSuccess = false
			while not attackSuccess do
				enemy.BlockingLocation = true
				enemy.InSky = false
				ObeyGravity({ Id = enemy.ObjectId })
				SetAlpha({ Id = enemy.ObjectId, Fraction = 1.0 })
				SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsUnits", Value = true })
				SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsProjectiles", Value = true })

				-- @experiment Snap isometric
				local currentAngle = GetAngle({ Id = enemy.ObjectId })
				if currentAngle > 90 and currentAngle < 270 then
					SetGoalAngle({ Id = enemy.ObjectId, Angle = 210, CompleteAngle = true })
				else
					SetGoalAngle({ Id = enemy.ObjectId, Angle = 330, CompleteAngle = true })
				end

				Stop({ Id = enemy.ObjectId })
				Halt({ Id = enemy.ObjectId })
				attackSuccess = game.DoAttack(enemy, aiData) or false
				if not attackSuccess then
					enemy.AINotifyName = "CanAttack" .. enemy.ObjectId
					NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
					game.waitUntil(enemy.AINotifyName)
				end
			end
		else
			if enemy.NoTargetMoveTowardsPlayer then
				game.MoveWithinRange(enemy, CurrentRun.Hero.ObjectId, aiData)
			end
			game.wait(game.CalcEnemyWait(enemy, enemy.NoTargetWanderDuration or 0.5), enemy.AIThreadName)
		end
	end
end

