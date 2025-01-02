-- Adds a door (Chaos gate) to the training room that allows the player to start a Hades run

-- Add the setup function to the Hub room
table.insert(game.HubRoomData.Hub_PreRun.StartUnthreadedEvents, {
	FunctionName = _PLUGIN.guid .. '.' .. 'SpawnHadesRunStartDoor',
})

function mod.SpawnHadesRunStartDoor(source, args)
	-- Vow shrine would be: 589694
	-- Run start door for the underworld
	local spawnId = 420947

	local chaosGate = game.DeepCopyTable(game.ObstacleData.SecretDoor) or {}

	chaosGate.ObjectId = SpawnObstacle({
		Name = "ModsNikkelMHadesBiomes_HadesRunStartDoor",
		Group = "FX_Terrain",
		DestinationId = spawnId,
		AttachedTable = chaosGate,
		OffsetX = 800,
		OffsetY = 10,
	})
	chaosGate.ActivateIds = { chaosGate.ObjectId }

	SetAnimation({ DestinationId = chaosGate.ObjectId, Name = "SecretDoor_Revealed" }) -- SecretDoor_RevealedWalkable if no collision wanted

	-- Overwrite some default values
	chaosGate.SetupEvents = {}
	chaosGate.SpeakerName = nil
	chaosGate.DistanceTrigger = {}
	chaosGate.UnlockedSound = nil
	chaosGate.HealthCost = nil

	chaosGate.UseText = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText"
	-- Normally this would check if the exit door for a room can be used - we always allow it
	-- Might add a requirement here if we ever put Hades runs behind a requirement/enchantment
	chaosGate.OnUseEvents = {}
	chaosGate.OnUsedFunctionName = _PLUGIN.guid .. '.' .. 'StartHadesRun'
	chaosGate.OnUsedFunctionArgs = { StartingBiome = "Tartarus" }

	game.SetupObstacle(chaosGate)
	AddToGroup({ Id = chaosGate.ObjectId, Name = "ModsNikkelMHadesBiomes.RunStartDoor" })
end

function mod.StartHadesRun(source, args)
	args = args or {}

	-- Don't show the healing text you normally get when exiting rooms with the Arcana activated
	local originalConfigDamageOption = game.ConfigOptionCache.ShowDamageNumbers
	game.ConfigOptionCache.ShowDamageNumbers = false
	game.LeaveRoomSecretDoorPresentation(game.CurrentRun, source)
	game.ConfigOptionCache.ShowDamageNumbers = originalConfigDamageOption

	game.UseEscapeDoor(source, args)
end
