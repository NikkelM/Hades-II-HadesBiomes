-- Functions required by the HeavyRanged enemy

-- Creates "Tethers", which are floating parts of the enemy (e.g. the small crystals for HeavyRanged or the neck for the Hydra heads)
function mod.CreateTethers(newEnemy, args)
	if newEnemy == nil or newEnemy.Tethers == nil or newEnemy.TetherIds ~= nil then
		return
	end

	newEnemy.TetherIds = {}
	local prevTetherId = newEnemy.ObjectId
	for k, tether in ipairs(newEnemy.Tethers) do
		local count = tether.Count or 1
		for i = 1, count do
			local offsetX = 0.0
			local offsetY = 0.0
			if tether.SpawnRadius ~= nil then
				offsetX = game.RandomFloat(-tether.SpawnRadius, tether.SpawnRadius) or 0.0
				offsetY = game.RandomFloat(-tether.SpawnRadius, tether.SpawnRadius) or 0.0
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
					-- TetherRetractSpeed = tether.RetractSpeed,
					-- TetherTrackZRatio = tether.TrackZRatio,
					OffsetX = offsetX,
					OffsetY = offsetY,
				})
			end
			table.insert(newEnemy.TetherIds, tetherId)
			if (newEnemy.EliteIcon or (newEnemy.HealthBuffer ~= nil and newEnemy.HealthBuffer > 0)) and tetherId ~= newEnemy.ObjectId then
				newEnemy.Outline.Id = tetherId
				if newEnemy.Outline.Thickness > 0 then
					AddOutline(newEnemy.Outline)
				end
			end
			prevTetherId = tetherId
		end
	end
end

function mod.HandleTetherParentDeath(victim, skipTetherCount, skipTetherAnimation)
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
					Angle = game.RandomFloat(0, 360)
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

-- Is called whenever HeavyRanged hits.
function mod.ModsNikkelMHadesBiomesHeavyRangedCrystalOnWeaponHit(victim, victimId, triggerArgs)
	-- The first hit of each burst should not do anything, as it is the lock-on "hit"
	if triggerArgs.Detonation == 0 then
		triggerArgs.DamageAmount = 0
		triggerArgs.Silent = true
	end
	-- Suppress the damage presentation on the player (blood splatter etc.)
	triggerArgs.SourceWeapon = "HeavyRangedWeapon"
end

function mod.ModsNikkelMHadesBiomesHeavyRangedSplitterFragmentOnWeaponHit(victim, victimId, triggerArgs)
	-- Don't deal damage to the miniboss itself
	if victim.ObjectId ~= game.CurrentRun.Hero.ObjectId then
		triggerArgs.DamageAmount = 0
		triggerArgs.Silent = true
	else
		mod.ModsNikkelMHadesBiomesHeavyRangedCrystalOnWeaponHit(victim, victimId, triggerArgs)
	end
end

-- Stops new fragments from spawning after the miniboss dies
function mod.ModsNikkelMHadesBiomesMiniBossHeavyRangedSplitterDeath(victim, victimId, triggerArgs)
	CancelWeaponFireRequests({ Id = victim.ObjectId })
	ExpireProjectiles({ Names = { "SpawnSplitterFragment" } })
end
