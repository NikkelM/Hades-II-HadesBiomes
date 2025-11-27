modutil.mod.Path.Context.Wrap.Static("StartDeathLoopPresentation", function(currentRun)
	modutil.mod.Path.Wrap("PlayVoiceLines", function(base, voicelines, neverQueue, source, args)
		-- For a modded run, we need to use different GameStateRequirements for the voicelines, and want to exclude some scenarios that don't make sense
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			voicelines = game.HeroVoiceLines.ModsNikkelMHadesBiomes_EnteredDeathAreaVoiceLines
		end

		return base(voicelines, neverQueue, source, args)
	end)
end)
