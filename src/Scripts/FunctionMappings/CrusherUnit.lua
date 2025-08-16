-- Used for all modded units with touchdown behavior
function game.ModsNikkelMHadesBiomesUnitTouchdown(unit, args)
	args = args or {}
	if args.Delay then
		game.wait(args.Delay, unit.AIThreadName)
	end

	local offset = { X = 0, Y = 0 }
	if args.CalcOffset then
		offset = game.CalcOffset(math.rad(GetAngle({ Id = unit.ObjectId }) or 0), args.SpawnDistance or 0) or
				{ X = 0, Y = 0 }
	end
	local angle = 0
	if args.CalcAngle then
		angle = GetAngle({ Id = unit.ObjectId }) or 0
	end

	if args.PostTouchdownMakeVulnerable then
		-- For CrusherUnit: Make it vulnerable again after the Cast hack in the modded SkyAttackerAI
		game.SetUnitVulnerable(unit, "ModsNikkelMHadesBiomesUnitTouchdownFlag")
	end

	CreateProjectileFromUnit({
		Name = args.ProjectileName,
		Id = unit.ObjectId,
		DestinationId = unit.ObjectId,
		FireFromTarget = args.FireFromTarget or true,
		OffsetX = offset.X,
		OffsetY = offset.Y,
		Angle = angle,
	})

	-- For the CrusherUnitElite, if the Vow of Shadows is active
	if args.ShrineProjectileName and game.GetNumShrineUpgrades(args.ShrineMetaUpgradeName) >= args.ShrineMetaUpgradeRequiredLevel then
		CreateProjectileFromUnit({
			Name = args.ShrineProjectileName,
			Id = unit.ObjectId,
			DestinationId = unit.ObjectId,
			FireFromTarget = args.FireFromTarget or true,
			OffsetX = offset.X,
			OffsetY = offset.Y,
			Angle = angle,
		})
	end
end

-- Same as in Hades, but:
-- More upward force to move the enemy off screen completely
-- SetInvulnerable to prevent the airborne enemy from being affected by the Cast
-- For some reason, even though the function no longer exists in Hades II, we still need to use another name
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
			-- Immediately trigger the DamageEchoEffect, as the upward force doesn't take the effect with it and it looks weird
			ClearEffect({ Id = enemy.ObjectId, Name = "DamageEchoEffect" })

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

			-- Modified from 5000 to 10000 to move it offscreen completely and in a smoother motion
			ApplyUpwardForce({ Id = enemy.ObjectId, Speed = 10000 })

			-- Custom: Prevent it from being affected by the Cast
			game.SetUnitInvulnerable(enemy, "ModsNikkelMHadesBiomesUnitTouchdownFlag", { Silent = true })

			game.wait(0.5, enemy.AIThreadName)
			enemy.BlockingLocation = false
			enemy.InSky = true
			IgnoreGravity({ Id = enemy.ObjectId })
			SetAlpha({ Id = enemy.ObjectId, Fraction = 0.0 })
			SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsUnits", Value = false })
			SetThingProperty({ DestinationId = enemy.ObjectId, Property = "StopsProjectiles", Value = false })

			-- Disappear
			local hideDuration = aiData.PostLaunchHideDuration or
					game.RandomFloat(aiData.PostLaunchHideDurationMin, aiData.PostLaunchHideDurationMax)
			game.wait(game.CalcEnemyWait(enemy, hideDuration, { IgnoreSpeedMultiplier = true }),
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

			-- Post-Attack wait
			if enemy.IsAggroed and aiData.PostTouchdownMinDuration ~= nil then
				-- Hacky: Attacking the enemy would break the wait, so we use a notify instead which never resolves
				-- The timeout is the actual wait time
				-- This can be seen as a minimum PostAttackDuration
				enemy.AINotifyName = "ModsNikkelMHadesBiomesNeverResolveNotifyName" .. enemy.ObjectId
				NotifyOutsideDistance({ Id = enemy.ObjectId, DestinationId = currentRun.Hero.ObjectId, Distance = 99999, Notify = enemy.AINotifyName, Timeout = game.CalcEnemyWait(enemy, aiData.PostTouchdownMinDuration) })
				game.waitUntil(enemy.AINotifyName)
			end
		else
			if enemy.NoTargetMoveTowardsPlayer then
				game.MoveWithinRange(enemy, game.CurrentRun.Hero.ObjectId, aiData)
			end
			game.wait(game.CalcEnemyWait(enemy, enemy.NoTargetWanderDuration or 0.5), enemy.AIThreadName)
		end
	end
end

function game.IsLocationBlockedWithinDistance(source, distance)
	for enemyId, enemy in pairs(game.ShallowCopyTable(game.ActiveEnemies)) do
		if enemy.BlockingLocation and enemy.ObjectId ~= source.ObjectId then
			if GetDistance({ Id = enemy.ObjectId, DestinationId = source.ObjectId }) < distance then
				return true
			end
		end
	end
	return false
end
