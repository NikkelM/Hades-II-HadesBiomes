function game.PickupAI(enemy, currentRun)
	if currentRun == nil then
		currentRun = game.CurrentRun
	end

	game.wait(game.CalcEnemyWait(enemy, enemy.WakeDelay), enemy.AIThreadName)

	while game.IsAIActive(enemy) do
		if enemy.RetreatBeforePickup then
			game.Retreat(enemy, enemy, currentRun.Hero.ObjectId)
		end

		local pickupSuccess = game.DoPickup(enemy)

		if pickupSuccess then
			return
		else
			local duration = enemy.PickupAttemptCooldown or 1
			game.wait(game.CalcEnemyWait(enemy, duration), enemy.AIThreadName)
		end
	end
end

function game.ModsNikkelMHadesBiomesShadeNakedPostActivate(source, args)
	local angle = GetAngleBetween({ DestinationId = source.ObjectId, Id = game.CurrentRun.Hero.ObjectId }) +
			game.RandomFloat(args.AngleOffsetMin, args.AngleOffsetMax)
	local force = game.RandomFloat(args.ForceMin, args.ForceMax)
	ApplyForce({ Id = source.ObjectId, Speed = force, Angle = angle, SelfApplied = true })
end

function game.DoPickup(enemy, aiData, pickupTarget)
	aiData = aiData or enemy
	local pickupRange = aiData.AIPickupRange or 100
	enemy.Pickups = enemy.Pickups or 0

	if pickupTarget == nil then
		local eligibleTargets = GetIdsByType({ Names = aiData.AIPickupTypes })
		pickupTarget = GetClosest({ Id = enemy.ObjectId, DestinationIds = eligibleTargets })
	end

	enemy.PickupTarget = game.MapState.ActiveObstacles[pickupTarget] or game.ActiveEnemies[pickupTarget]

	local forceFailTime = nil
	if aiData.PickupTimeAllowance ~= nil then
		forceFailTime = game._worldTime + aiData.PickupTimeAllowance
	end

	while IsAlive({ Id = pickupTarget }) and pickupTarget ~= nil do
		-- Move to target
		Move({ Id = enemy.ObjectId, DestinationId = pickupTarget, Distance = 10, SuccessDistance = 40 })

		if aiData.MoveToTargetSound ~= nil then
			PlaySound({ Name = aiData.MoveToTargetSound, Id = enemy.ObjectId })
		end
		if aiData.MoveToTargetText ~= nil then
			game.thread(game.InCombatText, enemy.ObjectId, enemy.MoveToTargetText, 1.5)
		end

		-- Wait until within range
		enemy.AINotifyName = "WithinDistance_" .. enemy.Name .. "_" .. enemy.ObjectId

		NotifyWithinDistance({
			Id = enemy.ObjectId,
			DestinationId = pickupTarget,
			Distance = pickupRange,
			Notify = enemy.AINotifyName,
			Timeout = aiData.MoveToPickupTimeout or 5.0
		})
		game.waitUntil(enemy.AINotifyName)
		if game._eventTimeoutRecord[enemy.AINotifyName] then
			-- Remove collision for next attempt if timed out
			DebugPrint({ Text = "Pickup timeout" })
			SetUnitProperty({ DestinationId = enemy.ObjectId, Property = "CollideWithObstacles", Value = false })
			SetUnitProperty({ DestinationId = enemy.ObjectId, Property = "CollideWithUnits", Value = false })
			enemy.PickupTarget = nil
			return false
		end

		-- Begin pick up
		SetThingProperty({ DestinationId = enemy.ObjectId, Property = "ImmuneToForce", Value = true })
		local endTime = _worldTime + aiData.AIPickupTime
		if IsAlive({ Id = pickupTarget }) then
			Stop({ Id = enemy.ObjectId })
			Shake({ Id = enemy.ObjectId, Distance = 3, Speed = 500, Duration = aiData.AIPickupTime })
			Flash({
				Id = enemy.ObjectId,
				Speed = 1.0,
				MinFraction = 0,
				MaxFraction = 0.8,
				Color = Color.White,
				Duration = aiData.AIPickupTime,
				ExpireAfterCycle = true
			})
			game.thread(game.PlayVoiceLines, enemy.RespawningVoiceLines, true)
			if aiData.BeginPickupSound ~= nil then
				PlaySound({ Name = aiData.BeginPickupSound, Id = aiData.ObjectId })
			end
			if aiData.BeginPickupText ~= nil then
				game.thread(game.InCombatText, enemy.ObjectId, aiData.PickupText, aiData.AIPickupTime)
			end
			if aiData.BeginPickupAnimation ~= nil then
				SetAnimation({ Name = aiData.BeginPickupAnimation, DestinationId = enemy.ObjectId })
			end

			if enemy.PickupTarget ~= nil and enemy.PickupTarget.BeginPickupAnimation then
				SetAnimation({ Name = enemy.PickupTarget.BeginPickupAnimation, DestinationId = pickupTarget })
			end

			while game._worldTime < endTime do
				if not IsAlive({ Id = pickupTarget }) or not CanAttack({ Id = enemy.ObjectId }) then
					StopFlashing({ Id = enemy.ObjectId })
					if aiData.PickupFailedAnimation ~= nil then
						SetAnimation({ Name = aiData.PickupFailedAnimation, DestinationId = enemy.ObjectId })
					end
					if enemy.PickupTarget ~= nil and enemy.PickupTarget.PickupFailedAnimation then
						SetAnimation({ Name = enemy.PickupTarget.PickupFailedAnimation, DestinationId = enemy.PickupTarget.ObjectId })
					end
					enemy.PickupTarget = nil
					return false
				end
				game.wait(game.CalcEnemyWait(enemy, 0.1), enemy.AIThreadName)
			end

			-- Pick up
			if IsAlive({ Id = pickupTarget }) then
				if aiData.PickupSound ~= nil then
					PlaySound({ Name = aiData.PickupSound, Id = enemy.ObjectId })
				end
				if aiData.PickupText ~= nil then
					game.thread(game.InCombatText, enemy.ObjectId, aiData.PickupText, 1.75)
				end
				if aiData.PickupFx ~= nil then
					CreateAnimation({ Name = aiData.PickupFx, DestinationId = enemy.ObjectId })
				end
				if aiData.PickupAnimation ~= nil then
					SetAnimation({ Name = aiData.PickupAnimation, DestinationId = enemy.ObjectId })
				end
				Flash({ Id = enemy.ObjectId, Speed = 0.65, MinFraction = 1.0, MaxFraction = 0, Color = Color.Gold, ExpireAfterCycle = true })

				game.ProcessPickup(enemy, pickupTarget)
				Destroy({ Id = pickupTarget })
				enemy.Pickups = enemy.Pickups + 1
				enemy.PickupTarget = nil
				return true
			else
				SetThingProperty({ DestinationId = enemy.ObjectId, Property = "ImmuneToForce", Value = false })
			end
		end

		if forceFailTime ~= nil and _worldTime >= forceFailTime then
			enemy.PickupTarget = nil
			return false
		end
	end

	enemy.PickupTarget = nil
	return false
end

function game.ProcessPickup(enemy, pickupTarget)
	if game.MapState.ActiveObstacles[pickupTarget] == nil then
		return
	end

	-- If the enemy is the ShadeNaked, we don't want a summon animation for the picked up enemy
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy.GenusName == "ShadeNaked" then
		game.CurrentRun.ModsNikkelMHadesBiomesSkipNextActivatePresentation = true
	end

	local pickupType = game.MapState.ActiveObstacles[pickupTarget].Name
	local pickupData = game.ObstacleData[pickupType] or game.ConsumableData[pickupType]

	if pickupData == nil then
		DebugPrint({ Text = pickupType .. " had no obstacle data" })
		return
	end

	if pickupData.SwapToUnitOnPickup ~= nil then
		local oldEnemy = enemy
		local newEnemyName = pickupData.SwapToUnitOnPickup
		if enemy.IsSuperElite and EnemyData[newEnemyName .. "SuperElite"] ~= nil then
			newEnemyName = newEnemyName .. "SuperElite"
		elseif enemy.IsElite and EnemyData[newEnemyName .. "Elite"] ~= nil then
			newEnemyName = newEnemyName .. "Elite"
		end
		local newEnemy = game.DeepCopyTable(EnemyData[newEnemyName]) or {}
		newEnemy.ObjectId = SpawnUnit({ Name = newEnemyName, InheritGroupNames = true, DestinationId = oldEnemy.ObjectId })
		game.thread(game.SetupUnit, newEnemy, game.CurrentRun)
		local charmDuration = GetCharmDuration({ Id = oldEnemy.ObjectId })
		if charmDuration > 0 then
			ApplyEffect({
				Id = game.CurrentRun.Hero.ObjectId,
				DestinationId = newEnemy.ObjectId,
				EffectName = "Charm",
				DataProperties =
				{
					Type = "CHARM",
					Duration = charmDuration,
					Active = true,
					TimeModifierFraction = 0,
				}
			})
		end
		game.thread(game.PlayVoiceLines, oldEnemy.RespawnedVoiceLines, true)
		game.RemoveOnDeathWeapons(oldEnemy)
		game.Kill(oldEnemy)
	end

	if pickupData.IsEnemyWeapon and game.SessionMapState.WeaponSpawnPointsUsed ~= nil then
		game.SessionMapState.WeaponSpawnPointsUsed[pickupTarget] = nil
	end

	if pickupData.AddWeaponOptionOnPickup ~= nil then
		table.insert(enemy.WeaponOptions, pickupData.AddWeaponOptionOnPickup)
	end
	if pickupData.AddEquipmentOnPickup ~= nil then
		table.insert(enemy.Equipment, pickupData.AddEquipmentOnPickup)
	end

	if pickupData.AttachAnimation ~= nil then
		CreateAnimation({ Name = pickupData.AttachAnimation, DestinationId = enemy.ObjectId })
	end
end

function game.RemoveOnDeathWeapons(unit)
	unit.OnDeathWeapons = nil
end
