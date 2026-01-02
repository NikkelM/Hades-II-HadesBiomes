function mod.WrappingEncounterStartPresentation(eventSource)
	if GetConfigOptionValue({ Name = "EditingMode" }) then
		return
	end

	-- Using a modified version/original Hades version, as it has a game.wait() call that feels more natural when starting the level
	game.thread(mod.ModsNikkelMHadesBiomesHandleWrapping, eventSource)
	game.wait(2.0, game.RoomThreadName)

	-- Custom: End the biome music, but don't set it to Section 10, which is the boss-theme ending
	game.EndMusic(game.AudioState.MusicId, game.AudioState.MusicName, nil, { IgnoreSection = true, Duration = 0.25 })

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

	game.wait(3.0, game.RoomThreadName)

	Move({ Ids = wrappingData.StartingIds, Angle = -155, Speed = 300, EaseIn = 0.5 })
	game.thread(game.DestroyOnDelay, wrappingData.StartingIds, 5.0)

	for _, obstacleWrapData in pairs(wrappingData.ObstacleWrapData) do
		if obstacleWrapData.Destroy then
			Destroy({ Ids = obstacleWrapData.Ids })
		else
			if (obstacleWrapData.FirstWrapDelay or 0) == 0 then
				Move({ Ids = obstacleWrapData.Ids, Angle = -155, Speed = 500, EaseIn = 0.5 })
			end
			for _, id in pairs(obstacleWrapData.Ids) do
				offset = game.CalcOffset(math.rad(-155), obstacleWrapData.ResetOffsetDistance) or { X = 0, Y = 0 }
				local resetTargetId = SpawnObstacle({
					Name = "InvisibleTarget",
					DestinationId = id,
					OffsetX = offset.X,
					OffsetY = offset.Y
				})
				obstacleWrapData.WrapCount = 0
				game.thread(mod.WrapObstacle, id, obstacleWrapData, resetTargetId, 0)
			end
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

	if game.AudioState.SecretMusicId ~= nil then
		game.EndMusic(game.AudioState.SecretMusicId, game.AudioState.SecretMusicName)
		game.AudioState.SecretMusicId = nil
		game.AudioState.SecretMusicName = nil
	end

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

function mod.WrapObstacle(id, obstacleWrapData, resetTargetId, wrapCount)
	local encounter = game.CurrentRun.CurrentRoom.Encounter
	local repeatDelay = 24
	local moveTime = obstacleWrapData.MoveTime

	if wrapCount == 0 then
		game.wait(obstacleWrapData.FirstWrapDelay, game.RoomThreadName)
		moveTime = obstacleWrapData.FirstMoveTime or moveTime
		repeatDelay = obstacleWrapData.FirstRepeatDelay or repeatDelay
	end

	if not encounter.InProgress then
		return
	end
	-- Get in position right before platform
	if obstacleWrapData.FirstTeleport or wrapCount > 0 then
		Teleport({ Id = id, DestinationId = resetTargetId })
	end
	Move({ Id = id, Angle = -155, Speed = 500 })
	game.wait(moveTime, game.RoomThreadName)

	Stop({ Id = id })
	if not encounter.InProgress then
		return
	end
	game.wait(repeatDelay - moveTime, game.RoomThreadName)

	game.thread(mod.WrapObstacle, id, obstacleWrapData, resetTargetId, wrapCount + 1)
end
