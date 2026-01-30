modutil.mod.Path.Wrap("PackagedBountyEarnedPresentation", function(base, bountyData)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- To not play the CauseOfDeath voicelines for the current boss
		game.CurrentRun.ModsNikkelMHadesBiomesSkipFindKiller = true
	end

	return base(bountyData)
end)
