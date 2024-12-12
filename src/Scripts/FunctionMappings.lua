-- Maps function names with the same behaviour between Hades and Hades II

-- Displays the biome's name as a banner at the top when entering the first room
function game.DisplayLocationText(source, args)
	if not args.Delay then
		args.Delay = 1.5
	end

	game.DisplayInfoBanner(source, args)
end

-- Called when entering the first room of the run
function game.RoomEntranceOpening(currentRun, currentRoom, args)
	printTable(args)
	game.RoomEntranceMaterialize(currentRun, currentRoom, args)
end
