modutil.mod.Path.Wrap("StartRoomAmbience", function(base, currentRun, currentRoom, args)
	base(currentRun, currentRoom, args)

	if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if game.AudioState.AmbienceId ~= nil then
			-- Boost the volume, as it is very quiet compared to Hades
			SetVolume({ Id = AudioState.AmbienceId, Value = 1.5 })
		end
	end
end)
