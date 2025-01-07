-- Maps function names with the same or similar behaviour between Hades and Hades II

-- Displays the biome's name as a banner at the top when entering the first room
function game.DisplayLocationText(source, args)
	if not args.Delay then
		args.Delay = 1.5
	end

	game.DisplayInfoBanner(source, args)
end

-- Called when entering the first room of the run
function game.RoomEntranceOpening(currentRun, currentRoom, args)
	game.RoomEntranceMaterialize(currentRun, currentRoom, args)
end

-- Mixes functionality from the original Hades RemoteAttack and the Hades II replacement, RemoteAI, to work with the Dart trap
function game.RemoteAttackModsNikkelMHadesBiomes(enemy)
	while IsAIActive(enemy) do
		enemy.WeaponName = SelectWeapon(enemy)
		table.insert(enemy.WeaponHistory, enemy.WeaponName)
		local aiData = GetWeaponAIData(enemy) or {}

		if aiData.IdleAnimation ~= nil then
			SetAnimation({ Name = aiData.IdleAnimation, DestinationId = enemy.ObjectId })
		end

		-- Wait for target to come within range, no timeout
		enemy.AINotifyName = "WithinDistance_" .. enemy.Name .. "_" .. enemy.ObjectId
		NotifyWithinDistanceAny({
			Ids = { enemy.ObjectId },
			DestinationNames = enemy.TargetGroups,
			Distance = aiData
					.AttackDistance,
			ScaleY = 0.5,
			MaxZ = aiData.MaxVictimZ,
			Notify = enemy.AINotifyName
		})
		waitUntil(enemy.AINotifyName)
		aiData.TargetId = NotifyResultsTable[enemy.AINotifyName]

		-- If disabled while waiting
		if not IsAIActive(enemy) then
			SetAnimation({ DestinationId = enemy.ObjectId, Name = aiData.DisabledAnimation })
			return
		end

		local linkedEnemy = game.ActiveEnemies
				[GetClosestUnitOfType({ Id = enemy.ObjectId, DestinationName = aiData.LinkedEnemy, Distance = 2000 })]

		local trapChainData = nil
		if CurrentRun.CurrentRoom.RemoteTrapChains ~= nil then
			trapChainData = CurrentRun.CurrentRoom.RemoteTrapChains[enemy.ObjectId]
		end

		-- For rooms where more than one trap is triggered by a plate
		if not aiData.SkipAngleTowardTarget then
			if trapChainData ~= nil and trapChainData.Chains ~= nil then
				for k, linkTable in ipairs(trapChainData.Chains) do
					for k, trapId in ipairs(linkTable) do
						AngleTowardTarget({ Id = trapId, DestinationId = enemy.ObjectId })
					end
				end
			else
				-- This angles the linked enemy toward the trigger plate
				AngleTowardTarget({ Id = linkedEnemy.ObjectId, DestinationId = enemy.ObjectId })
			end
		end

		-- Prepare to attack
		if aiData.PreAttackAnimation ~= nil then
			SetAnimation({ Name = aiData.PreAttackAnimation, DestinationId = enemy.ObjectId })
		end

		if aiData.PreAttackColor ~= nil then
			SetColor({ Color = enemy.PreAttackColor, Id = enemy.ObjectId, Duration = enemy.PreAttackDuration / 3 })
		end
		if aiData.PreAttackSound ~= nil then
			PlaySound({ Name = enemy.PreAttackSound, Id = enemy.ObjectId })
		end
		wait(CalcEnemyWait(enemy, aiData.PreAttackDuration), enemy.AIThreadName)

		-- Not called in Hades
		-- DoAttack(enemy, aiData)

		if trapChainData ~= nil then
			for i, chain in ipairs(trapChainData.Chains) do
				for j, chainedEnemyId in ipairs(chain) do
					notifyExistingWaiters("WithinDistance" .. chainedEnemyId)
					local chainedEnemy = game.ActiveEnemies[chainedEnemyId]
					if chainedEnemy ~= nil then
						local chainedWeaponAIData = ShallowCopyTable(chainedEnemy.DefaultAIData) or chainedEnemy
						if WeaponData[chainedEnemy.WeaponName] ~= nil and WeaponData[chainedEnemy.WeaponName].AIData ~= nil then
							OverwriteTableKeys(chainedWeaponAIData, WeaponData[chainedEnemy.WeaponName].AIData)
						end
						chainedWeaponAIData.WeaponName = chainedEnemy.WeaponName

						thread(DoAttack, chainedEnemy, chainedWeaponAIData)
					end
				end
				wait(CalcEnemyWait(enemy, trapChainData.ChainInterval), enemy.AIThreadName)
			end
		end

		if linkedEnemy ~= nil then
			local linkedWeaponAIData = ShallowCopyTable(linkedEnemy.DefaultAIData) or linkedEnemy
			if WeaponData[linkedEnemy.WeaponName] ~= nil and WeaponData[linkedEnemy.WeaponName].AIData ~= nil then
				OverwriteTableKeys(linkedWeaponAIData, WeaponData[linkedEnemy.WeaponName].AIData)
			end
			linkedWeaponAIData.WeaponName = linkedEnemy.WeaponName

			if not linkedWeaponAIData.SkipAngleTowardTargetWait then
				linkedEnemy.AINotifyName = "WaitForRotation" .. linkedEnemy.ObjectId
				NotifyOnRotationComplete({ Id = linkedEnemy.ObjectId, Cosmetic = true, Notify = linkedEnemy.AINotifyName, Timeout = 9.0 })
				waitUntil(linkedEnemy.AINotifyName)
			end

			thread(DoAttack, linkedEnemy, linkedWeaponAIData)
		end

		if not IsAIActive(enemy) then
			break
		end

		-- Post-attack recover window
		if aiData.PreAttackColor ~= nil then
			SetColor({ Color = enemy.PreAttackColor, Id = enemy.ObjectId })
			SetColor({ Color = enemy.White, Id = enemy.ObjectId, Duration = enemy.PostAttackCooldown })
		end
		if aiData.PostAttackAnimation ~= nil then
			SetAnimation({ Name = enemy.PostAttackAnimation, DestinationId = enemy.ObjectId })
		end

		if aiData.ReloadingLoopSound ~= nil then
			enemy.ReloadSoundId = PlaySound({ Name = enemy.ReloadingLoopSound, Id = enemy.ObjectId })
		end
		wait(CalcEnemyWait(enemy, aiData.PostAttackCooldown), enemy.AIThreadName)
		StopSound({ Id = aiData.ReloadSoundId, Duration = 0.2 })

		-- Wait until target leaves before resetting
		if aiData.AIResetDistance ~= nil then
			enemy.AINotifyName = "OutsideDistance" .. enemy.ObjectId
			NotifyOutsideDistance({
				Id = enemy.ObjectId,
				DestinationId = aiData.TargetId,
				Distance = aiData.AIResetDistance,
				Notify =
						enemy.AINotifyName
			})
			waitUntil(enemy.AINotifyName)

			if not IsAIActive(enemy) then
				break
			end

			if aiData.IdleAnimation ~= nil then
				SetAnimation({ Name = aiData.IdleAnimation, DestinationId = enemy.ObjectId })
			end
			if aiData.ReloadedSound ~= nil then
				PlaySound({ Name = aiData.ReloadedSound, Id = enemy.ObjectId })
			end
		end
	end
end

-- Wrap around SetupUnit to call CreateTethers()
modutil.mod.Path.Wrap("SetupUnit", function(base, unit, currentRun, args)
	base(unit, currentRun, args)
	game.CreateTethers(unit)
end)

-- Creates "Tethers", which are floating parts of the enemy (e.g. the small crystals for HeavyRanged)
function game.CreateTethers(newEnemy)
	if newEnemy == nil or newEnemy.Tethers == nil or newEnemy.TetherIds ~= nil then
		return
	end

	newEnemy.TetherIds = {}
	local prevTetherId = newEnemy.ObjectId
	for k, tether in ipairs(newEnemy.Tethers) do
		local count = tether.Count or 1
		for i = 1, count do
			local offsetX = nil
			local offsetY = nil
			if tether.SpawnRadius ~= nil then
				offsetX = game.RandomFloat(-tether.SpawnRadius, tether.SpawnRadius)
				offsetY = game.RandomFloat(-tether.SpawnRadius, tether.SpawnRadius)
			end
			local tetherId = SpawnObstacle({
				Name = tether.Name,
				DestinationId = newEnemy.ObjectId,
				Group = tether.GroupName or "Standing",
				OffsetX = offsetX,
				OffsetY = offsetY
			})
			SetAlpha({ Id = tetherId, Fraction = 0 })
			SetAlpha({ Id = tetherId, Fraction = 1.0, Duration = 0.3 })
			if tether.Elasticity ~= nil then
				Attach({
					Id = tetherId,
					DestinationId = newEnemy.ObjectId,
					-- TODO: The issue with the tethers is that TetherDistance and TetherElasticity are no longer existent in Hades II - issue #22
					-- TetherDistance = tether.Distance,
					-- TetherElasticity = tether.Elasticity,
					-- As a workaround, just do some static offsets
					OffsetX = offsetX,
					OffsetY = offsetY,
				})
			else
				Attach({
					Id = prevTetherId,
					DestinationId = tetherId,
					TetherDistance = tether.Distance,
					TetherRetractSpeed = tether.RetractSpeed,
					TetherTrackZRatio = tether.TrackZRatio
				})
			end
			table.insert(newEnemy.TetherIds, tetherId)
			if newEnemy.EliteIcon or (newEnemy.HealthBuffer ~= nil and newEnemy.HealthBuffer > 0) then
				newEnemy.Outline.Id = tetherId
				if newEnemy.Outline.Thickness > 0 then
					AddOutline(newEnemy.Outline)
				end
			end
			prevTetherId = tetherId
		end
	end
end

-- Wrap around KillPresentation to call HandleTetherParentDeath() before the victim is destroyed in Kill()
modutil.mod.Path.Wrap("KillPresentation", function(base, victim, killer, args)
	game.thread(game.HandleTetherParentDeath, victim)
	base(victim, killer, args)
end)

function game.HandleTetherParentDeath(victim, skipTetherCount, skipTetherAnimation)
	if victim.TetherIds == nil then
		return
	end

	for k, id in ipairs(victim.TetherIds) do
		if skipTetherCount == nil or k > skipTetherCount then
			if victim.OnDeathTetherUpwardForce ~= nil then
				SetThingProperty({ Property = "OffsetZ", Value = 0, DestinationId = id })
				SetThingProperty({ Property = "StopsProjectiles", Value = true, DestinationId = id })
				SetThingProperty({ Property = "StopsUnits", Value = true, DestinationId = id })
				ApplyUpwardForce({ Id = id, Speed = victim.OnDeathTetherUpwardForce })
				ApplyForce({
					Id = id,
					Speed = game.RandomFloat(victim.OnDeathTetherRandomForceMin, victim.OnDeathTetherRandomForceMax),
					Angle =
							game.RandomFloat(0, 360)
				})
			end
			if victim.DestroyTethersOnDeath then
				Destroy({ Id = id })
			end
			if victim.Tethers[k] ~= nil and victim.Tethers[k].ParentDeathAnimation ~= nil then
				SetAnimation({ DestinationId = id, Name = victim.Tethers[k].ParentDeathAnimation })
			end
			game.wait(0.04, RoomThreadName)
		else
			if skipTetherAnimation ~= nil then
				SetAnimation({ DestinationId = id, Name = skipTetherAnimation })
				game.wait(0.25, RoomThreadName)
			end
		end
		-- This is added manually - we need to always destroy the tether, as otherwise OnTouchdown is called without a triggeredByTable argument
		Destroy({ Id = id })
	end
end

-- Is called whenever HeavyRanged hits the player.
-- The first hit of each burst should not deal any damage, as it is the lock-on hit
function game.ModsNikkelMHadesBiomesHeavyRangedCrystalOnHit(victim, victimId, triggerArgs)
	if triggerArgs.Detonation == 0 then
		triggerArgs.DamageAmount = 0
	end
end
