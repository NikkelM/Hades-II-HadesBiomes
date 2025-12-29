function mod.CheckLocationUnlock(eventSource, args)
	game.CurrentRun.BiomesReached = game.CurrentRun.BiomesReached or {}
	game.CurrentRun.BiomesReached[args.Biome] = true
	game.CheckCodexUnlock(mod.CodexChapterName, args.Biome)
end

modutil.mod.Path.Wrap("InitKillCountText", function(base, screen, entryData)
	if entryData.ModsNikkelMHadesBiomesSkipShowKillCount == true then
		return
	end

	return base(screen, entryData)
end)
