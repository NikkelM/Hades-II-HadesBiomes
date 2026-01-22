-- Danger: If this is a normal context wrap (and not static), the wrapped HandleSecretSpawns in RoomLogic.lua will be called twice for some reason
modutil.mod.Path.Context.Wrap.Static("HandleSecretSpawns", function(currentRun)
	modutil.mod.Path.Wrap("SpawnObstacle", function(base, args)
		args = args or {}
		-- Remember on which ID a Chaos Gate was spawned so we can exclude it when generating a potential ShrinePointDoor
		if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and args.Name == "SecretDoor" then
			game.CurrentRun.CurrentRoom = game.CurrentRun.CurrentRoom or {}
			game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesSecretDoorOnId = args.DestinationId
		end

		return base(args)
	end)
end)

modutil.mod.Path.Context.Wrap.Static("LoadCurrentRoomResources", function(currentRun)
	modutil.mod.Path.Wrap("LoadVoiceBanks", function(base, characters, persist, ignoreAssert)
		if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			if mod.LootVoiceBankMappings[characters] ~= nil then
				game.LoadVoiceBanks(mod.LootVoiceBankMappings[characters])
			end
		end

		return base(characters, persist, ignoreAssert)
	end)
end)
