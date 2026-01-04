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
	local currentRoom = {}
	if game.CurrentRun ~= nil and game.CurrentRun.CurrentRoom ~= nil then
		currentRoom = game.CurrentRun.CurrentRoom
	end

	-- We need to load audio banks here so their events are ready to be used by AudioState init when it restores the MusicId
	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and mod.ValidModdedRunBiomes[currentRoom.RoomSetName] then
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

		if currentRoom.Encounter ~= nil and currentRoom.Encounter.LoadCustomModdedAudioBanks then
			for _, bank in ipairs(currentRoom.Encounter.LoadCustomModdedAudioBanks) do
				rom.audio.load_bank(rom.path.combine(_PLUGIN.plugins_data_mod_folder_path,
					"Content\\Audio\\Desktop\\" .. bank .. ".bank"))
			end
		end
	end

	return base(triggerArgs)
end)

modutil.mod.Path.Wrap("ResumeMusic", function(base, args)
	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- Sometimes after challenge encounters, the next room has doubled music, which is most likely caused by a double ResumeMusic at inopportune times
		if game.AudioState.MusicId == nil or not game.AudioState.MusicPaused then
			return
		end
	end

	return base(args)
end)
