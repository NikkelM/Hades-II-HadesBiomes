modutil.mod.Path.Wrap("StartRoomAmbience", function(base, currentRun, currentRoom, args)
	base(currentRun, currentRoom, args)

	if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if game.AudioState.AmbienceId ~= nil then
			-- Boost the volume, as it is very quiet compared to Hades
			SetVolume({ Id = AudioState.AmbienceId, Value = 1.5 })
		end
	end
end)

modutil.mod.Path.Wrap("AudioStateInit", function(base, triggerArgs)
	local currentRoom = nil
	if game.CurrentRun ~= nil and game.CurrentRun.CurrentRoom ~= nil then
		currentRoom = game.CurrentRun.CurrentRoom
	end

	-- TODO: Challenge, Charon? What Roomsets are they?
	local moddedRoomSets = {
		["Tartarus"] = true,
		["Asphodel"] = true,
		["Elysium"] = true,
		["Styx"] = true,
		["Surface"] = true,
	}

	-- We need to load audio banks here so their events are ready to be used by AudioState init when it restores the MusicId
	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and moddedRoomSets[currentRoom.RoomSetName] then
		if currentRoom.LoadModdedAudioBanks ~= nil then
			for _, bank in ipairs(currentRoom.LoadModdedAudioBanks) do
				rom.audio.load_bank(rom.path.combine(rom.paths.Content(), "Audio\\Desktop\\" .. bank .. ".bank"))
			end
		end

		if currentRoom.LoadCustomModdedAudioBanks ~= nil then
			for _, bank in ipairs(currentRoom.LoadCustomModdedAudioBanks) do
				rom.audio.load_bank(rom.path.combine(_PLUGIN.plugins_data_mod_folder_path,
					"Content\\Audio\\Desktop\\" .. bank .. ".bank"))
			end
		end
	end

	base(triggerArgs)
end)
