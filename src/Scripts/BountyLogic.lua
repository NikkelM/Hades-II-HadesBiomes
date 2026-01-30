modutil.mod.Path.Wrap("CheckPackagedBountyCompletion", function(base)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		local bountyData = game.BountyData[game.CurrentRun.ActiveBounty]
		if bountyData == nil or not game.Contains(bountyData.Encounters, game.CurrentRun.CurrentRoom.Encounter.Name) then
			return base()
		end

		if bountyData.ModsNikkelMHadesBiomes_RandomBountyStreakEligible then
			game.GameState.ModsNikkelMHadesBiomes_RandomBountyClearStreak = game.GameState
					.ModsNikkelMHadesBiomes_RandomBountyClearStreak + 1
			if game.GameState.ModsNikkelMHadesBiomes_RandomBountyClearStreak > game.GameState.ModsNikkelMHadesBiomes_RandomBountyHighestClearStreak then
				game.GameState.ModsNikkelMHadesBiomes_RandomBountyHighestClearStreak = game.GameState
						.ModsNikkelMHadesBiomes_RandomBountyClearStreak
			end
		end
	end

	return base()
end)
