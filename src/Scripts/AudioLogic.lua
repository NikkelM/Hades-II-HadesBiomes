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
		-- Load vanilla Hades II banks from the game's Content directory
		if currentRoom.LoadVanillaAudioBanks ~= nil then
			for _, bank in ipairs(currentRoom.LoadVanillaAudioBanks) do
				rom.audio.load_bank(rom.path.combine(rom.paths.Content(), "Audio\\Desktop\\" .. bank .. ".bank"))
			end
		end

		-- Load modded audio banks from plugins_data
		if currentRoom.LoadModdedAudioBanks ~= nil then
			for _, bank in ipairs(currentRoom.LoadModdedAudioBanks) do
				rom.audio.load_bank(rom.path.combine(_PLUGIN.plugins_data_mod_folder_path,
					"Content\\Audio\\Desktop\\" .. bank .. ".bank"))
			end
		end

		if currentRoom.Encounter ~= nil and currentRoom.Encounter.LoadModdedAudioBanks then
			for _, bank in ipairs(currentRoom.Encounter.LoadModdedAudioBanks) do
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
	if game.AudioState == nil then
		return
	end
	if game.AudioState.MusicId ~= nil and game.AudioState.MusicId ~= 0 and game.AudioState.MusicPaused then
		game.ResumeMusic()
	end
	if game.AudioState.MusicId == nil or game.AudioState.MusicId == 0 then
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
	args = args or {}
	args.Id = source.ObjectId
	local soundId = PlaySound(args)
	if args.Volume ~= nil then
		SetVolume({ Id = soundId, Value = args.Volume })
	end
end

function mod.SecretMusicPlayerEvent(source, args)
	game.SecretMusicPlayer(args.TrackName, args)
end

function mod.OrpheusRoomStartMusicPlayer(source, args)
	local mods = rom.mods
	local hadesOSTModReference = mods["NikkelM-Hades_OST_for_the_Music_Maker"]
	rom.audio.load_bank(rom.path.combine(hadesOSTModReference._PLUGIN.plugins_data_mod_folder_path,
		"Audio\\ModsNikkelMUnlockHadesMusic.bank"))

	source = game.ActiveEnemies[390000]

	if args.TrackName == nil then
		if game.IsGameStateEligible(nil, args.OrpheusSingsAgainRequirements or {}) and game.GameState.ModsNikkelMHadesBiomesLastPlayedOrpheusTrack ~= nil then
			args.TrackName = game.GameState.ModsNikkelMHadesBiomesLastPlayedOrpheusTrack
		else
			args.TrackName = "/Music/BlankMusicCue"
		end
	end

	if args.TrackName ~= "/Music/BlankMusicCue" then
		mod.ModsNikkelMHadesBiomesEurydiceMusic(source, args)
	else
		-- To not have Orpheus do the singing animation
		game.SecretMusicPlayer(args.TrackName, args)
	end
end
