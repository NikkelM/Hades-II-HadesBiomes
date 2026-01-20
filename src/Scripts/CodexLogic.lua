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

function mod.CalcNumModdedCodexEntriesUnlocked()
	local unlockCount = 0
	for entryName, entryData in pairs(game.CodexData[mod.CodexChapterName].Entries) do
		if game.CodexStatus[mod.CodexChapterName] ~= nil and game.CodexStatus[mod.CodexChapterName][entryName] ~= nil and game.CodexStatus[mod.CodexChapterName][entryName][1] ~= nil and game.CodexStatus[mod.CodexChapterName][entryName][1].Unlocked then
			unlockCount = unlockCount + 1
		end
	end
	return unlockCount
end

modutil.mod.Path.Wrap("CalcNumCodexEntriesUnlocked", function(base)
	game.GameState.ModsNikkelMHadesBiomesCodexEntriesUnlockedCache = mod.CalcNumModdedCodexEntriesUnlocked()

	return base()
end)
