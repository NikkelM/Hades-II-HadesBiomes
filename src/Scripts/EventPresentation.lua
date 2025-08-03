modutil.mod.Path.Wrap("StartedTextLinesPresentation", function(base, source, textLines)
	if source ~= nil and source.TextLinesPauseAmbientMusicVocals then
		print("Pausing vocals")
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.AmbientMusicId, Value = 0 })
	end
	if source ~= nil and source.TextLinesPauseAmbientMusicVocals2 then
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.AmbientMusicId, Value = 0 })
	end
	if textLines ~= nil and textLines.TextLinesPauseAmbientMusicVocals then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.AmbientMusicId, Value = 0 })
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.AmbientMusicId, Value = 1 })
	end
	if textLines ~= nil and textLines.TextLinesPauseAmbientMusicVocals2 then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.AmbientMusicId, Value = 1 })
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.AmbientMusicId, Value = 0 })
	end
	base(source, textLines)
end)

modutil.mod.Path.Wrap("FinishedTextLinesPresentation", function(base, source, textLines)
	if source ~= nil and source.TextLinesPauseAmbientMusicVocals then
		print("Resuming vocals")
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.AmbientMusicId, Value = 1, Duration = 0.25 })
	end
	if source ~= nil and source.TextLinesPauseAmbientMusicVocals2 then
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.AmbientMusicId, Value = 1, Duration = 0.25 })
	end
	if textLines ~= nil and textLines.TextLinesPauseAmbientMusicVocals then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.AmbientMusicId, Value = 1, Duration = 0.25 })
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.AmbientMusicId, Value = 1 })
	end
	if textLines ~= nil and textLines.TextLinesPauseAmbientMusicVocals2 then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.AmbientMusicId, Value = 1 })
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.AmbientMusicId, Value = 1, Duration = 0.25 })
	end
	base(source, textLines)
end)
