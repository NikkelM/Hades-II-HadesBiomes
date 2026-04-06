-- Creates "Tethers", which are floating parts of the enemy (e.g. the small crystals for HeavyRanged or the neck for the Hydra heads)
function mod.CreateTethers(newEnemy, args)
	if newEnemy == nil or newEnemy.Tethers == nil or newEnemy.TetherIds ~= nil or game.IsEmpty(newEnemy.Tethers) then
		return
	end

	newEnemy.TetherIds = {}
	-- Maps each TetherIds index to its Tethers config index, since Count > 1 expands into multiple IDs
	newEnemy.TetherConfigIndices = {}
	-- Lua tables attached to the engine via AttachLua for each tether
	newEnemy.TetherTables = {}
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

			-- Register with the engine so TriggeredByTable is non-nil for OnTouchdown
			local tetherTable = { ObjectId = tetherId }
			AttachLua({ Id = tetherId, Table = tetherTable })

			-- Move the first neck segment in each Hydra neck chain to always render behind the head itself
			if i == 1 and tether.FirstDrawBehind then
				game.ChangeDrawGroup(tetherId, "Standing_Back")
			end

			-- Fade in tethers, only applies for pre-spawned enemies
			SetAlpha({ Id = tetherId, Fraction = 0 })
			SetAlpha({ Id = tetherId, Fraction = 1.0, Duration = 0.3 })

			if tether.Elasticity ~= nil then
				-- Elastic: e.g. crystals floating around parent
				rom.tethers.add(tetherId, newEnemy.ObjectId, tether.Distance, 0, tether.Elasticity, 0)
			elseif tether.RetractSpeed or tether.TrackZRatio then
				-- Chain: each segment is constrained toward the next (e.g. toward base for Hydra)
				local trackZ = tether.TrackZRatio or 0
				if prevTetherId == newEnemy.ObjectId then
					trackZ = 0
				end
				rom.tethers.add(prevTetherId, tetherId, tether.Distance, tether.RetractSpeed or 0, 0, trackZ)
			else
				-- Static anchor (e.g. HydraBase)
				rom.tethers.add(prevTetherId, tetherId, tether.Distance, 0, 0, 0)
			end

			table.insert(newEnemy.TetherIds, tetherId)
			table.insert(newEnemy.TetherConfigIndices, k)
			table.insert(newEnemy.TetherTables, tetherTable)
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
		-- Use the stored config index to look up the correct tether config
		local configIndex = victim.TetherConfigIndices and victim.TetherConfigIndices[k] or k
		local tetherConfig = victim.Tethers[configIndex]

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
				-- Set up the attached table so e.g. OnTouchdown plays the shatter on landing for crystal tethers
				local tetherTable = victim.TetherTables and victim.TetherTables[k]
				if tetherTable ~= nil then
					tetherTable.OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "TetherOnTouchdownShatter"
					tetherTable.OnTouchdownFunctionArgs = {
						DeathAnimation = tetherConfig ~= nil and tetherConfig.ParentDeathAnimation or nil,
					}
				end
			else
				-- Play death animation before destroying, CreateAnimation spawns a separate object that persists after the tether is destroyed
				if tetherConfig ~= nil and tetherConfig.ParentDeathAnimation ~= nil then
					-- CreateAnimation doesn't inherit the parent's OffsetZ, so read it to position correctly
					local offsetZ = GetThingDataValue({ Id = id, Property = "OffsetZ" }) or 0
					CreateAnimation({ Name = tetherConfig.ParentDeathAnimation, DestinationId = id, OffsetZ = offsetZ })
				end
				if victim.DestroyTethersOnDeath then
					Destroy({ Id = id })
				end
				-- Always destroy tethers without upward force to clean them up immediately
				Destroy({ Id = id })
			end
			game.wait(0.04, game.RoomThreadName)
		else
			-- Skipped tethers keep their animation and stay alive (e.g. detached neck stubs during Hydra stage transition)
			-- They are cleaned up when HandleTetherParentDeath is called again on actual death
			if skipTetherAnimation ~= nil then
				SetAnimation({ DestinationId = id, Name = skipTetherAnimation })
				game.wait(0.25, game.RoomThreadName)
			end
		end
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
	-- The weapon must define RapidDamageType = true for this to work
	triggerArgs.SourceWeapon = triggerArgs.SourceProjectile or "HeavyRangedWeapon"
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
	ExpireProjectiles({ Names = { "SpawnSplitterFragment", "SpawnSplitterFragmentSuperElite" } })
end

-- Called by OnTouchdown when a launched tether crystal lands
function mod.TetherOnTouchdownShatter(touchdowner, args)
	if args ~= nil and args.DeathAnimation ~= nil then
		CreateAnimation({ Name = args.DeathAnimation, DestinationId = touchdowner.ObjectId })
	end
	Destroy({ Id = touchdowner.ObjectId })
end
