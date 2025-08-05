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
	-- Custom, for Eurydice we currently use SecretMusicId instead of AmbientMusicId
	if textLines ~= nil and source.TextLinesPauseSingingFx and game.AudioState.SecretMusicId ~= nil then
		CreateAnimation({
			Name = source.SingingFx,
			DestinationId = source.ObjectId,
			OffsetX = source.SingingAnimOffsetX or source.AnimOffsetX,
			OffsetZ = source.AnimOffsetZ,
			Group = "Combat_UI_World"
		})
	end
	base(source, textLines)
end)
