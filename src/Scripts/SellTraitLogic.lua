modutil.mod.Path.Wrap("HandleSellChoiceSelection", function(base, screen, button)
	base(screen, button)

	-- For the Quest tracking - only during modded runs
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and button and button.Data and button.Data.Rarity == "Legendary" and not button.Data.IsDuoBoon then
		game.GameState.ModsNikkelMHadesBiomesCustomFlags.ModsNikkelMHadesBiomes_SoldLegendaryBoonFlag = true
	end
end)
