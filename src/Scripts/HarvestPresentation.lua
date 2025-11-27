function mod.ModsNikkelMHadesBiomes_StaticBase_UsedHarvestPointPresentation(source, args, user)
	-- This is the UseHarvestPointPresentation, but without the flip that removes the original and adds the used version
	args = args or {}
	SetAnimation({ Name = source.EmptyAnimation or "HarvestPointUsed", DestinationId = source.ObjectId })
	CreateAnimation({ Name = source.ConsumeFx or "ItemConsumeFxSmall", DestinationId = source.ObjectId, Group = "Standing" })

	local harvestPointUsedAnimation = SpawnObstacle({
		Name = "BlankObstacle",
		Group = "FX_Terrain",
		DestinationId = source.ObjectId
	})
	CreateAnimation({ Name = source.EmptyAnimation or "HarvestPointUsed", DestinationId = harvestPointUsedAnimation })

	if not args.SkipVoiceLines then
		game.thread(game.PlayVoiceLines, HeroVoiceLines.HarvestVoiceLines, true, nil, { HarvestPoint = source })
	end

	game.waitUnmodified(0.15)
	if source.HarvestedDrawGroup ~= nil then
		game.ChangeDrawGroup(source.ObjectId, source.HarvestedDrawGroup)
	end
	game.waitUnmodified(0.4)
end
