modutil.mod.Path.Wrap("RoomEntranceDreamBiomeStart", function(base, currentRun, currentRoom, args)
	if currentRoom.ModsNikkelMHadesBiomes_DreamRunHeroEndPoint ~= nil then
		currentRoom.HeroEndPoint = currentRoom.ModsNikkelMHadesBiomes_DreamRunHeroEndPoint
	end

	return base(currentRun, currentRoom, args)
end)
