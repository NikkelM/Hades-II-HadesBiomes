modutil.mod.Path.Context.Wrap.Static("FishingStartPresentation", function(fishingSource, fishingArgs)
	modutil.mod.Path.Wrap("PlayVoiceLines", function(base, voiceLines, neverQueue, source, args)
		if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.RoomSetName == "Surface" then
			if voiceLines == game.HeroVoiceLines.FishingInitiatedVoiceLines then
				voiceLines = game.GlobalVoiceLines.ModsNikkelMHadesBiomes_FishingInitiatedVoiceLines
			end
		end

		return base(voiceLines, neverQueue, source, args)
	end)
end)

modutil.mod.Path.Context.Wrap.Static("FishingEndPresentation", function(fishData, fishingAnimationPointId, fishingArgs)
	modutil.mod.Path.Wrap("PlaySound", function(base, args)
		if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.RoomSetName == "Surface" then
			if args.Name == "/VO/MelinoeEmotes/EmoteAttackingStaff" or args.Name == "/VO/MelinoeEmotes/EmoteCharging" then
				args.Name = "/EmptyCue"
			end
		end

		return base(args)
	end)

	modutil.mod.Path.Wrap("GrantElementFromTool", function(base, toolName, args)
		-- Don't grant an element on the Surface anymore
		if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.RoomSetName == "Surface" then
			return
		end

		return base(toolName, args)
	end)
end)
