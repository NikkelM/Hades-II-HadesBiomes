modutil.mod.Path.Context.Wrap.Static("StartDeathLoopPresentation", function(currentRun)
	modutil.mod.Path.Wrap("PlayVoiceLines", function(base, voicelines, neverQueue, source, args)
		-- For a modded run, we need to use different GameStateRequirements for the voicelines, and want to exclude some scenarios that don't make sense
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			voicelines = game.HeroVoiceLines.ModsNikkelMHadesBiomes_EnteredDeathAreaVoiceLines
		end

		return base(voicelines, neverQueue, source, args)
	end)
end)

modutil.mod.Path.Context.Wrap.Static("SpecialInteractChangeNextRunRNG", function(usee, rngArgs)
	modutil.mod.Path.Wrap("InCombatTextArgs", function(base, args)
		-- When showing the reroll die on the underworld door, also show it on the Chaos Gate
		if args.TargetId == 589873 then
			local runStartDoorId = GetIdsByType({ Name = "ModsNikkelMHadesBiomes_HadesRunStartDoor" })[1]
			game.thread(game.InCombatTextArgs,
				{ TargetId = runStartDoorId, Text = "RerollDie", PreDelay = 0, Duration = 0.8, OffsetY = -170, RiseDistance = 40 })
		end

		return base(args)
	end)
end)
