function mod.CrawlerMiniBossEndPresentation(eventSource)
	SetSoundCueValue({ Names = { "Section", }, Id = game.AudioState.SecretMusicId, Value = 10 })
	game.AudioState.SecretMusicId = nil
	game.AudioState.SecretMusicName = nil
end

function mod.ModsNikkelMHadesBiomesOnDeathFireProjectile(unit, args)
	CreateProjectileFromUnit({
		Name = args.ProjectileName,
		Id = unit.ObjectId,
		DestinationId = unit.ObjectId,
		FireFromTarget = true
	})
end
