modutil.mod.Path.Wrap("SelectNextDreamBiome", function(base, source, args)
	if config.z_ExcludeFromDreamDives then
		return base(source, args)
	end

	args = args or {}
	local nextRoomSet = nil
	if game.IsEmpty(game.CurrentRun.DreamBiomePool) then
		-- Fully override the initial pool creation to control starting eligibility of the new biomes
		game.CurrentRun.DreamBiomePool = { "G", "H", "I", "O", "P", "Q" }
		-- Modded biomes are only eligible once you've beaten at least one run
		if game.GameState.ModsNikkelMHadesBiomesClearedRunsCache >= 1 then
			table.insert(game.CurrentRun.DreamBiomePool, "Asphodel")
			table.insert(game.CurrentRun.DreamBiomePool, "Elysium")
			if game.GameState.TextLinesRecord["Ending01"] then
				table.insert(game.CurrentRun.DreamBiomePool, "Styx")
			end
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
		if game.GameState.ModsNikkelMHadesBiomesClearedRunsCache >= 1 then
			table.insert(game.CurrentRun.DreamBiomePool, "Tartarus")
		end
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
