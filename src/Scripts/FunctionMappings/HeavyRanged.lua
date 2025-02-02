-- Functions required by the HeavyRanged enemy

-- Creates "Tethers", which are floating parts of the enemy (e.g. the small crystals for HeavyRanged)
function game.CreateTethers(newEnemy, args)
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
					-- The issue with the tethers is that TetherDistance and TetherElasticity are no longer existent in Hades II - issue #22
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
function game.ModsNikkelMHadesBiomesHeavyRangedCrystalOnWeaponHit(victim, victimId, triggerArgs)
	-- The first hit of each burst should not do anything, as it is the lock-on "hit"
	if triggerArgs.Detonation == 0 then
		triggerArgs.Silent = true
	end
	-- Suppress the damage presentation on the player (blood splatter etc.)
	triggerArgs.SourceWeapon = "HeavyRangedWeapon"
end

-- Stops new fragments from spawning after the miniboss dies
function game.ModsNikkelMMiniBossHeavyRangedSplitterDeath(victim, victimId, triggerArgs)
	CancelWeaponFireRequests({ Id = victim.ObjectId })
	ExpireProjectiles({ Names = { "SpawnSplitterFragment" } })
end
