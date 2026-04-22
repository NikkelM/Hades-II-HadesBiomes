-- Fully override the initial pool creation to control starting eligibility of H1 biomes.
modutil.mod.Path.Wrap("SelectNextDreamBiome", function(base, source, args)
	args = args or {}
	local nextRoomSet = nil
	if game.IsEmpty(game.CurrentRun.DreamBiomePool) then
		game.CurrentRun.DreamBiomePool = { "G", "H", "I", "O", "P", "Q", "Asphodel", "Elysium" }
		if game.GameState.TextLinesRecord["Ending01"] then
			table.insert(game.CurrentRun.DreamBiomePool, "Styx")
		end

		-- special handling for the first biome on the first dream run
		if args.ForceHBiomeRequirements ~= nil and game.IsGameStateEligible(source, args.ForceHBiomeRequirements) then
			nextRoomSet = game.RemoveValue(game.CurrentRun.DreamBiomePool, "H")
		else
			nextRoomSet = game.RemoveRandomValue(game.CurrentRun.DreamBiomePool)
		end

		-- reroll if we got the previous Dream Run's first biome
		if nextRoomSet == game.GameState.LastDreamStartingBiome then
			nextRoomSet = game.RemoveRandomValue(game.CurrentRun.DreamBiomePool)
			table.insert(game.CurrentRun.DreamBiomePool, game.GameState.LastDreamStartingBiome)
		end
		game.GameState.LastDreamStartingBiome = nextRoomSet

		-- can't start in F, N or Tartarus, but they're eligible afterwards!
		table.insert(game.CurrentRun.DreamBiomePool, "F")
		table.insert(game.CurrentRun.DreamBiomePool, "N")
		table.insert(game.CurrentRun.DreamBiomePool, "Tartarus")
	else
		nextRoomSet = game.RemoveRandomValue(game.CurrentRun.DreamBiomePool)

		-- reroll if we got the naturally connected biome as the next biome
		local currentRoomSet = game.CurrentRun.BiomeVisitOrder[game.CurrentRun.EnteredBiomes]
		if nextRoomSet == game.NextRoomSets[currentRoomSet] then
			local ineligibleRoomSet = nextRoomSet
			nextRoomSet = game.RemoveRandomValue(game.CurrentRun.DreamBiomePool)
			table.insert(game.CurrentRun.DreamBiomePool, ineligibleRoomSet)
		end
	end

	game.CurrentRun.CurrentRoom.NextRoomSet = { nextRoomSet }
end)
