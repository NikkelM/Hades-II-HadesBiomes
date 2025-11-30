modutil.mod.Path.Wrap("FormatExtractedValue", function(base, value, extractData)
	if game.CurrentRun ~= nil and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if extractData.Format ~= nil then
			if extractData.Format == "FinalBoss" then
				if not game.IsEmpty(game.CurrentRun.BiomesReached) and game.CurrentRun.BiomesReached.Tartarus then
					return "CharHades"
				end
			end
		end
	end

	return base(value, extractData)
end)
