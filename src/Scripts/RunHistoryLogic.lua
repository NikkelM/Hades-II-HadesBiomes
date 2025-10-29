modutil.mod.Path.Wrap("RunHistoryUpdateVisibility", function(base, screen)
	base(screen)

	local firstIndex = screen.NumItems - screen.ScrollOffset
	local lastIndex = math.max(1, firstIndex - screen.ItemsPerPage + 1)
	for runIndex = firstIndex, lastIndex, -1 do
		local run = game.GameState.RunHistory[runIndex] or game.CurrentRun
		if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
			local routeName = "RunHistoryScreen_RouteModsNikkelMHadesBiomes"
			ModifyTextBox({ Id = screen.ButtonIds[firstIndex - runIndex + 1], LuaKey = "TempTextData", LuaValue = { RunNum = runIndex, RouteName = routeName } })
		end
	end
end)

modutil.mod.Path.Context.Wrap("ShowRunHistory", function(screen, button)
	modutil.mod.Path.Wrap("ModifyTextBox", function(base, args)
		if args.Text == "RunHistoryScreen_Cleared" then
			local run = button.Run
			-- If the run was cleared, show the "ESCAPED" text instead of "PREVAILED!!"
			if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
				args.Text = "ModsNikkelMHadesBiomes_RunHistoryScreen_Cleared"
			end
		end
		base(args)
	end)
end)

-- Add the biome Codex entries to the Biome category so they are picked up by the Run History screen
-- Remove them afterwards so they don't show up in the Codex itself
modutil.mod.Path.Wrap("ShowRunHistory", function(base, screen, button)
	local originalEntries = game.DeepCopyTable(game.CodexData.Biomes.Entries)
	local hadesBiomeCodexEntries = {}
	hadesBiomeCodexEntries.BiomeTartarus = game.CodexData.ModsNikkelMHadesBiomesCodexEntry.Entries.Tartarus
	hadesBiomeCodexEntries.BiomeAsphodel = game.CodexData.ModsNikkelMHadesBiomesCodexEntry.Entries.Asphodel
	hadesBiomeCodexEntries.BiomeElysium = game.CodexData.ModsNikkelMHadesBiomesCodexEntry.Entries.Elysium
	hadesBiomeCodexEntries.BiomeStyx = game.CodexData.ModsNikkelMHadesBiomesCodexEntry.Entries.Styx
	hadesBiomeCodexEntries.BiomeChallenge = game.CodexData.ModsNikkelMHadesBiomesCodexEntry.Entries.Challenge
	hadesBiomeCodexEntries.BiomeSurface = game.CodexData.ModsNikkelMHadesBiomesCodexEntry.Entries.Surface
	game.CodexData.Biomes.Entries = game.MergeTables(game.CodexData.Biomes.Entries, hadesBiomeCodexEntries)

	base(screen, button)

	game.CodexData.Biomes.Entries = originalEntries
end)
