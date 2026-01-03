-- Danger: If this is a normal context wrap (and not static), the wrapped HandleSecretSpawns in RoomLogic.lua will be called twice for some reason
modutil.mod.Path.Context.Wrap.Static("HandleSecretSpawns", function(currentRun)
	modutil.mod.Path.Wrap("SpawnObstacle", function(base, args)
		-- Remember on which ID a Chaos Gate was spawned so we can exclude it when generating a potential ShrinePointDoor
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and args.Name == "SecretDoor" then
			game.CurrentRun.CurrentRoom = game.CurrentRun.CurrentRoom or {}
			game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesSecretDoorOnId = args.DestinationId
		end

		return base(args)
	end)
end)
