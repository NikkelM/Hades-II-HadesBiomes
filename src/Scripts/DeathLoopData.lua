-- TODO: Create a new "door" to start a Hades run
-- For now, changes the behaviour of the downstairs door to start a Hades run, instead of a Hades II run
-- game.HubRoomData.Hub_PreRun.ObstacleData[420947].OnUsedFunctionArgs = { StartingBiome = "Tartarus", DashTarget = 588632, AltarId = 589766, }

-- Chaos gate next to the vows shrine?

-- Add the setup function to the Hub room
table.insert(game.HubRoomData.Hub_PreRun.StartUnthreadedEvents, {
	FunctionName = _PLUGIN.guid .. '.' .. 'SpawnHadesRunStartDoor',
})

function mod.SpawnHadesRunStartDoor(source, args)
	print("SpawnHadesRunStartDoor")

	-- Vow shrine: 589694
	-- Run start door underworld
	local spawnId = 420947

	local chaosGate = game.DeepCopyTable(game.ObstacleData.SecretDoor)

	chaosGate.ObjectId = SpawnObstacle({
		Name = "ModsNikkelMHadesBiomes_HadesRunStartDoor",
		Group = "FX_Terrain",
		DestinationId = spawnId,
		AttachedTable = chaosGate,
		OffsetX = 800,
		OffsetY = 10,
	})
	chaosGate.ActivateIds = { chaosGate.ObjectId }

	SetAnimation({ DestinationId = chaosGate.ObjectId, Name = "SecretDoor_RevealedWalkable" })

	-- Overwrite some default values
	chaosGate.SetupEvents = {}
	chaosGate.SpeakerName = nil
	chaosGate.DistanceTrigger = {}
	chaosGate.UnlockedSound = nil
	chaosGate.UseText = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText"
	chaosGate.OnUseEvents = {
		{ FunctionName = _PLUGIN.guid .. '.' .. 'StartHadesRun', },
	}
	-- chaosGate.OnUsedFunctionArgs = { StartingBiome = "F", DashTarget = 588632, AltarId = 589766, }

	game.SetupObstacle(chaosGate)
	AddToGroup({ Id = chaosGate.ObjectId, Name = "ModsNikkelMHadesBiomes.RunStartDoor" })
end

function mod.StartHadesRun(source, args)
	print("StartHadesRun")
	-- LeaveRoomSecretDoorPresentation()
	-- Normal game start, but Tartarus biome
end
