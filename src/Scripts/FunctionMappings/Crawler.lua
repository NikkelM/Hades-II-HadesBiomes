function game.CrawlerMiniBossEndPresentation(eventSource)
	SetSoundCueValue({ Names = { "Section", }, Id = game.AudioState.SecretMusicId, Value = 10 })
	game.AudioState.SecretMusicId = nil
	game.AudioState.SecretMusicName = nil
end
