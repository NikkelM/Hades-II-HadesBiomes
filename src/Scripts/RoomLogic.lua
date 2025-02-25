-- Set a backing for the door's reward preview
modutil.mod.Path.Wrap("ChooseNextRewardStore", function(base, run)
	base(run)
	if run.ModsNikkelMHadesBiomesExitDoors ~= nil then
		for _, door in ipairs(run.ModsNikkelMHadesBiomesExitDoors) do
			if door.LockedAnimation ~= nil then
				SetAnimation({ Name = door.LockedAnimation, DestinationId = door.ObjectId })
			end
		end

		run.ModsNikkelMHadesBiomesExitDoors = {}
	end
end)

-- Wrap to also load modded resources, such as additional audio banks
modutil.mod.Path.Wrap("LoadCurrentRoomResources", function(base, currentRoom)
	base(currentRoom)

	local validRoomSets = {
		["Tartarus"] = true,
		["Asphodel"] = true,
		["Elysium"] = true,
		["Styx"] = true,
	}

	if validRoomSets[currentRoom.RoomSetName] then
		-- Some packages introduce artifacts
		UnloadPackages({ Name = "DeathArea" })
		UnloadPackages({ Name = "Chaos" })

		-- The base game doesn't load encounter packages when a save is loaded, or the RoomOpening is entered
		if currentRoom.Encounter.LoadPackages then
			for _, name in pairs(currentRoom.Encounter.LoadPackages) do
				LoadPackages({ Name = name })
			end
		end
		if currentRoom.LoadModdedPackages then
			for _, name in pairs(currentRoom.LoadModdedPackages) do
				LoadPackages({ Name = name })
			end
		end

		if currentRoom.LoadModdedAudioBanks ~= nil then
			for _, bank in ipairs(currentRoom.LoadModdedAudioBanks) do
				rom.audio.load_bank(rom.path.combine(rom.paths.Content(), "Audio\\Desktop\\" .. bank .. ".bank"))
			end
		end

		if currentRoom.LoadModdedVoiceBanks ~= nil then
			game.LoadVoiceBanks(currentRoom.LoadModdedVoiceBanks)
		end
	end
end)
