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

modutil.mod.Path.Context.Wrap("FishingEndPresentation", function(fishData, fishingAnimationPointId, fishingArgs)
	modutil.mod.Path.Wrap("PlayVoiceLines", function(base, voiceLines, neverQueue, source, args)
		if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.RoomSetName == "Surface" then
			if fishData and voiceLines == fishData.FishCaughtVoiceLines then
				voiceLines = game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishCaughtVoiceLines
			elseif fishData and voiceLines == fishData.FishIdentifiedVoiceLines then
				voiceLines = game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishIdentifiedVoiceLines
			elseif voiceLines == game.HeroVoiceLines.FishNotCaughtTooLateVoiceLines then
				voiceLines = game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtTooLateVoiceLines
			elseif voiceLines == game.HeroVoiceLines.FishNotCaughtWayTooLateVoiceLines then
				voiceLines = game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtWayTooLateVoiceLines
			elseif voiceLines == game.HeroVoiceLines.FishNotCaughtVoiceLines then
				voiceLines = game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishNotCaughtVoiceLines
			end
		end

		return base(voiceLines, neverQueue, source, args)
	end)
end)
