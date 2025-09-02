function mod.WrappingEncounterStartPresentation(eventSource)
	if GetConfigOptionValue({ Name = "EditingMode" }) then
		return
	end

	-- Using a modified version/original Hades version, as it has a game.wait() call that feels more natural when starting the level
	game.thread(mod.ModsNikkelMHadesBiomesHandleWrapping, eventSource)
	game.wait(2.0, game.RoomThreadName)
	Activate({ Ids = { 548133, 548134 } })

	ShakeScreen({ Speed = 100, Distance = 2, FalloffSpeed = 2000, Duration = 3.0 })
	PlaySound({ Name = "/SFX/DeathBoatMoveStart" })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.17, Duration = 1.0 }, })

	game.wait(3.0, game.RoomThreadName)
	game.SecretMusicPlayer("/Music/MusicExploration2_MC")
	SetSoundCueValue({ Names = { "Section", }, Id = game.AudioState.SecretMusicId, Value = 2 })

	game.wait(3.0, game.RoomThreadName)
end

-- Already exists
function mod.ModsNikkelMHadesBiomesHandleWrapping(encounter)
	local wrappingData = encounter.WrappingData
	wrappingData.StartingIds = GetIds({ Name = wrappingData.StartingGroupName })
	wrappingData.EndingIds = GetIds({ Name = wrappingData.EndingGroupName })

	local offset = game.CalcOffset(math.rad(-155), -2000) or { X = 0, Y = 0 }
	Teleport({
		Ids = wrappingData.EndingIds,
		DestinationIds = wrappingData.EndingIds,
		OffsetX = offset.X,
		OffsetY = offset.Y,
		ShiftThingsByOffset = true
	})

	game.wait(3.0, RoomThreadName)

	Move({ Ids = wrappingData.StartingIds, Angle = -155, Speed = 300, EaseIn = 0.5 })
	game.thread(game.DestroyOnDelay, wrappingData.StartingIds, 5.0)

	for k, obstacleWrapData in pairs(wrappingData.ObstacleWrapData) do
		if obstacleWrapData.Destroy then
			Destroy({ Ids = obstacleWrapData.Ids })
		else
			if (obstacleWrapData.FirstWrapDelay or 0) == 0 then
				Move({ Ids = obstacleWrapData.Ids, Angle = -155, Speed = 500, EaseIn = 0.5 })
			end
			for k, id in pairs(obstacleWrapData.Ids) do
				offset = game.CalcOffset(math.rad(-155), obstacleWrapData.ResetOffsetDistance) or { X = 0, Y = 0 }
				local resetTargetId = SpawnObstacle({
					Name = "InvisibleTarget",
					DestinationId = id,
					OffsetX = offset.X,
					OffsetY = offset.Y
				})
				obstacleWrapData.WrapCount = 0
				game.thread(game.WrapObstacle, id, obstacleWrapData, { ResetTargetId = resetTargetId, Angle = -155 })
			end
		end
	end

	local spawnData = wrappingData.SpawnData
	if spawnData ~= nil then
		if spawnData.PreSpawnObstacles then
			for i = 1, 5 do
				local nextObstacleName = game.GetRandomValue(spawnData.ObstacleNames)
				local nextSpawnDestination = game.GetRandomValue(spawnData.SpawnPoints) or {}
				if not nextSpawnDestination.SkipPreSpawn then
					offset = game.CalcOffset(math.rad(-155), i * 1750) or { X = 0, Y = 0 }
					local newObstacleId = SpawnObstacle({
						Name = nextObstacleName,
						DestinationId = nextSpawnDestination.Id,
						Group = nextSpawnDestination.GroupName,
						OffsetX = offset.X,
						OffsetY = offset.Y
					})
					SetThingProperty({ Property = "StopsLight", Value = false, DestinationId = newObstacleId })
					SetThingProperty({ Property = "StopsUnits", Value = false, DestinationId = newObstacleId })
					if nextSpawnDestination.ObstacleHSVOverrides ~= nil and nextSpawnDestination.ObstacleHSVOverrides[nextObstacleName] ~= nil then
						SetHSV({
							Id = newObstacleId,
							HSV = nextSpawnDestination.ObstacleHSVOverrides[nextObstacleName],
							ValueChangeType = "Absolute"
						})
					end
					if nextSpawnDestination.ObstacleColorOverrides ~= nil and nextSpawnDestination.ObstacleColorOverrides[nextObstacleName] ~= nil then
						SetColor({
							Id = newObstacleId,
							Color = nextSpawnDestination.ObstacleColorOverrides[nextObstacleName],
							ValueChangeType = "Absolute"
						})
					end

					Move({ Id = newObstacleId, Angle = -155, Speed = spawnData.MoveSpeed or 500 })
					game.thread(game.DestroyOnDelay, { newObstacleId }, spawnData.MoveTime or 10)
				end
			end
		end

		while true do
			local nextObstacleName = game.GetRandomValue(spawnData.ObstacleNames)
			local nextSpawnDestination = game.GetRandomValue(spawnData.SpawnPoints) or {}
			local groupName = nextSpawnDestination.GroupName
			if nextSpawnDestination.ObstacleGroupOverrides ~= nil then
				groupName = nextSpawnDestination.ObstacleGroupOverrides[nextObstacleName] or groupName
			end
			local newObstacleId = SpawnObstacle({
				Name = nextObstacleName,
				DestinationId = nextSpawnDestination.Id,
				Group = groupName
			})
			SetThingProperty({ Property = "StopsLight", Value = false, DestinationId = newObstacleId })
			SetThingProperty({ Property = "StopsUnits", Value = false, DestinationId = newObstacleId })
			if nextSpawnDestination.ObstacleHSVOverrides ~= nil and nextSpawnDestination.ObstacleHSVOverrides[nextObstacleName] ~= nil then
				SetHSV({
					Id = newObstacleId,
					HSV = nextSpawnDestination.ObstacleHSVOverrides[nextObstacleName],
					ValueChangeType = "Absolute"
				})
			end
			if nextSpawnDestination.ObstacleColorOverrides ~= nil and nextSpawnDestination.ObstacleColorOverrides[nextObstacleName] ~= nil then
				SetColor({
					Id = newObstacleId,
					Color = nextSpawnDestination.ObstacleColorOverrides[nextObstacleName],
					ValueChangeType = "Absolute"
				})
			end
			Move({ Id = newObstacleId, Angle = -155, Speed = spawnData.MoveSpeed or 500 })
			game.thread(game.DestroyOnDelay, { newObstacleId }, spawnData.MoveTime or 10)

			local nextSpawnInterval = game.RandomFloat(spawnData.SpawnIntervalMin, spawnData.SpawnIntervalMax)
			game.wait(nextSpawnInterval, RoomThreadName)
		end
	end
end

function mod.BeginWrappingEncounter()
	game.StartEncounterEffects()
end

function mod.WrappingEncounterEndPresentation(eventSource)
	ShakeScreen({ Speed = 100, Distance = 2, FalloffSpeed = 2000, Duration = 4.0 })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.17, Duration = 1.0 }, })
	PlaySound({ Name = "/Leftovers/SFX/AnnouncementThunder" })
	PlaySound({ Name = "/SFX/PillarDestroyed" })

	SetSoundCueValue({ Names = { "Section", }, Id = game.AudioState.SecretMusicId, Value = 10 })
	game.AudioState.SecretMusicId = nil
	game.AudioState.SecretMusicName = nil

	local wrappingData = eventSource.WrappingData
	for k, obstacleWrapData in pairs(wrappingData.ObstacleWrapData) do
		Move({ Ids = obstacleWrapData.Ids, Angle = -155, Speed = 300, Distance = 900 })
	end

	for k, id in pairs(wrappingData.EndingIds) do
		local offset = game.CalcOffset(math.rad(-155), 2000) or { X = 0, Y = 0 }
		Move({ Id = id, DestinationId = id, OffsetX = offset.X, OffsetY = offset.Y, Duration = 3.0, EaseOut = 0.999 })
	end

	game.wait(2.8, game.RoomThreadName)
	PlaySound({ Name = "/SFX/PillarDestroyed" })
	ShakeScreen({ Speed = 100, Distance = 2, FalloffSpeed = 2000, Duration = 1.0 })

	Destroy({ Ids = GetIds({ Name = "WaterEndingObjectsDestroy" }) })

	game.wait(0.7, game.RoomThreadName)
	SetAnimation({ DestinationId = 548134, Name = "MurderBoatGateReverse" })
end

function mod.WrappingPostCombatReloadPresentation(eventSource)
	local encounter = eventSource.Encounter
	Destroy({ Ids = GetIds({ Name = encounter.WrappingData.StartingGroupName }) })
end
