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

-- Called in some boss intros - just in case there is no Music playing (either paused or MusicId == nil), we resume it/create it
function mod.SafetyResumeBossMusic()
	if game.AudioState.MusicId ~= nil and game.AudioState.MusicPaused then
		game.ResumeMusic()
	end
	if game.AudioState.MusicId == nil then
		game.MusicMixer({ PlayBiomeMusic = true, MusicSection = 0, UseRoomMusicSection = true, })
	end
end

function mod.EndSecretMusicAndResumeMusic()
	SetSoundCueValue({ Names = { "Section" }, Id = game.AudioState.SecretMusicId, Value = 10 })
	StopSound({ Id = game.AudioState.SecretMusicId, Duration = 2 })
	game.AudioState.SecretMusicId = nil
	game.AudioState.SecretMusicName = nil
	game.ResumeMusic()
end

function mod.PlaySoundWithSource(source, args)
	PlaySound(args)
end
