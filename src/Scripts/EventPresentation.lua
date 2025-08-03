modutil.mod.Path.Wrap("StartedTextLinesPresentation", function(base, source, textLines)
	if source ~= nil and source.ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 0 })
	end
	base(source, textLines)
end)

modutil.mod.Path.Wrap("FinishedTextLinesPresentation", function(base, source, textLines)
	if source ~= nil and source.ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
	end
	base(source, textLines)
end)
