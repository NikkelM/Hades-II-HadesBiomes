modutil.mod.Path.Wrap("RoomEntranceDreamBiomeStart", function(base, currentRun, currentRoom, args)
	if currentRoom.ModsNikkelMHadesBiomes_DreamRunHeroEndPoint ~= nil then
		currentRoom.HeroEndPoint = currentRoom.ModsNikkelMHadesBiomes_DreamRunHeroEndPoint
	end

	return base(currentRun, currentRoom, args)
end)

modutil.mod.Path.Wrap("EndDreamRunPresentation", function(base)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- To not play the CauseOfDeath voicelines for the current boss
		game.CurrentRun.ModsNikkelMHadesBiomesSkipFindKiller = true
		game.CurrentRun.CurrentRoom.BlockHadesOverlay = false
	end

	return base()
end)
