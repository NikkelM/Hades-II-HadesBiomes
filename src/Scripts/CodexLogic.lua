function mod.CheckLocationUnlock(eventSource, args)
	game.CurrentRun.BiomesReached = game.CurrentRun.BiomesReached or {}
	game.CurrentRun.BiomesReached[args.Biome] = true
	game.CheckCodexUnlock("ModsNikkelMHadesBiomesCodexEntry", args.Biome)
end
