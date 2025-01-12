-- Functions required by the LightSpawner enemy

-- Call the modded spawning logic instead of the default one if the enemy was modded in/needs it
modutil.mod.Path.Wrap("HandleSpawnerBurst", function(base, enemy, aiData)
	if enemy.IsModdedHadesEnemy then
		game.HadesSpawnerAI(enemy, aiData)
	else
		base(enemy, aiData)
	end
end)

function game.HadesSpawnerAI(enemy, aiData)
	enemy.SpawnerThreadName = "SpawnerThreadName" .. enemy.ObjectId
	local spawnGroupName = "Spawner" .. enemy.ObjectId
	local spawnDelay = aiData.SpawnDelay or 0

	local originalColor = enemy.Color

	local spawnCount = aiData.SpawnsPerBurst
	if aiData.SpawnsPerBurstMin ~= nil and aiData.SpawnsPerBurstMax ~= nil then
		spawnCount = game.RandomInt(aiData.SpawnsPerBurstMin, aiData.SpawnsPerBurstMax)
	end

	if aiData.SpawnCountDampenTraits ~= nil then
		for traitName in pairs(aiData.SpawnCountDampenTraits) do
			if game.HeroHasTrait(traitName) then
				local traitData = game.GetHeroTrait(traitName)
				if traitData and traitData.DebuffValue then
					spawnCount = spawnCount * traitData.DebuffValue
				end
			end
		end
	end

	-- wait(aiData.SpawnBurstDelay, enemy.SpawnerThreadName)

	local spawnOnIds = game.ShallowCopyTable(aiData.SpawnOnIds)
	local spawnOnIdsOrdered = game.ShallowCopyTable(aiData.SpawnOnIdsOrdered)

	for i = 1, spawnCount do
		if NumAlive({ Name = spawnGroupName }) < aiData.MaxActiveSpawns and game.IsAIActive(enemy) then
			if not aiData.SkipLocationBlockedCheck and IsLocationBlocked({ Id = enemy.ObjectId }) then
				return
			end

			if aiData.SpawnSound ~= nil then
				PlaySound({ Name = aiData.SpawnSound, Id = enemy.ObjectId })
			end
			if aiData.SpawnColor ~= nil then
				SetColor({ Color = aiData.SpawnColor, Id = enemy.ObjectId })
			end

			if enemy.CreateSpawnAnimation then
				SetAnimation({ DestinationId = enemy.ObjectId, Name = enemy.CreateSpawnAnimation })
			end

			game.wait(game.CalcEnemyWait(enemy, spawnDelay), enemy.SpawnerThreadName)

			-- Spawn enemy
			local spawnName = game.GetRandomValue(aiData.SpawnerOptions)

			local enemyData = EnemyData[spawnName]
			local newEnemy = game.DeepCopyTable(enemyData) or {}
			game.ClearLootDrops(newEnemy)
			newEnemy.SkipChallengeKillCounts = true

			if aiData.SpawnOverrides ~= nil then
				game.OverwriteTableKeys(newEnemy, aiData.SpawnOverrides)
			end

			if aiData.SpawnDefaultAIDataOverrides ~= nil then
				game.OverwriteTableKeys(newEnemy.DefaultAIData, aiData.SpawnDefaultAIDataOverrides)
			end

			local offset = { X = 0, Y = 0 }
			local spawnPointId = aiData.SpawnOnId or game.RemoveFirstValue(spawnOnIdsOrdered) or
					game.RemoveRandomValue(spawnOnIds) or
					game.GetRandomValue(GetIds({ Name = aiData.SpawnOnGroupName }))

			local spawnNearId = enemy.ObjectId
			if aiData.SpawnNearPlayer then
				spawnNearId = CurrentRun.Hero.ObjectId
			end

			if spawnPointId == nil then
				if aiData.SpawnOnSpawnPoints then
					local newSpawnPoint = game.SelectSpawnPoint(CurrentRun.CurrentRoom, newEnemy,
						{
							SpawnNearId = spawnNearId,
							SpawnRadius = aiData.SpawnRadius,
							SpawnRadiusMin = aiData.SpawnRadiusMin,
							RequiredSpawnPoint =
									aiData.RequiredSpawnPointType
						})
					spawnPointId = newSpawnPoint
				elseif aiData.SpawnTowardSpawnPoints then
					spawnPointId = spawnNearId
					local closestSpawnPoint = GetClosest({ Id = spawnNearId, DestinationName = "SpawnPoints" })
					local angle = GetAngleBetween({ Id = spawnNearId, DestinationId = closestSpawnPoint }) or 0
					offset = game.CalcOffset(math.rad(angle),
						math.min(110, GetDistance({ Id = spawnNearId, DestinationId = closestSpawnPoint }))) or offset
				elseif aiData.SpawnRadius ~= nil then
					offset.X = game.RandomInt(-aiData.SpawnRadius, aiData.SpawnRadius) or 0
					offset.Y = game.RandomInt(-aiData.SpawnRadius, aiData.SpawnRadius) or 0
				end
			end

			if spawnPointId == nil then
				spawnPointId = enemy.ObjectId
			end
			newEnemy.ObjectId = SpawnUnit({
				Name = spawnName,
				Group = "Standing",
				DestinationId = spawnPointId,
				OffsetX = offset.X,
				OffsetY = offset.Y
			})
			newEnemy.OccupyingSpawnPointId = spawnPointId
			if enemy.Encounter ~= nil then
				enemy.Encounter.ActiveSpawns[newEnemy.ObjectId] = true
				newEnemy.Encounter = enemy.Encounter
			end
			SessionMapState.SpawnPointsUsed[spawnPointId] = newEnemy.ObjectId
			game.thread(game.UnoccupySpawnPointOnDistance, newEnemy, spawnPointId, 400)
			local charmDuration = GetCharmDuration({ Id = enemy.ObjectId })

			if aiData.SpawnedAggroTetherDistance ~= nil then
				newEnemy.AggroTetherId = enemy.ObjectId
				newEnemy.AggroTetherDistance = aiData.SpawnedAggroTetherDistance
			end
			if aiData.SpawnAggroed then
				newEnemy.StartAggroed = true
			end
			if aiData.SpawnsSkipActivatePresentation then
				newEnemy.UseActivatePresentation = false
			end
			if aiData.SpawnFx then
				CreateAnimation({ DestinationId = newEnemy.ObjectId, Name = aiData.SpawnFx })
			end
			game.thread(game.SetupUnit, newEnemy, CurrentRun)
			AddToGroup({ Id = newEnemy.ObjectId, Name = spawnGroupName })
			newEnemy.SkipActiveCount = true
			if charmDuration > 0 then
				ApplyEffect({
					Id = CurrentRun.Hero.ObjectId,
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
			game.wait(game.CalcEnemyWait(enemy, aiData.SpawnRate), enemy.SpawnerThreadName)
		end
	end

	if enemy.PostCreateSpawnAnimation then
		SetAnimation({ DestinationId = enemy.ObjectId, Name = enemy.PostCreateSpawnAnimation })
	end
	if aiData.SpawnColor ~= nil then
		SetColor({ Color = originalColor, Id = enemy.ObjectId, Duration = aiData.PostAttackCooldown })
	end
end
