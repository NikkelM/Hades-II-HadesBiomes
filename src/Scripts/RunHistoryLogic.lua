modutil.mod.Path.Wrap("RunHistoryUpdateVisibility", function(base, screen)
	base(screen)

	local firstIndex = screen.NumItems - screen.ScrollOffset
	local lastIndex = math.max(1, firstIndex - screen.ItemsPerPage + 1)
	for runIndex = firstIndex, lastIndex, -1 do
		local run = game.GameState.RunHistory[runIndex] or game.CurrentRun
		if run.BiomesReached ~= nil and (run.BiomesReached.Tartarus or run.BiomesReached.Asphodel or run.BiomesReached.Elysium or run.BiomesReached.Styx) then
			local button = screen.Components[screen.ButtonName .. runIndex]
			local routeName = "RunHistoryScreen_RouteModsNikkelMHadesBiomes"
			button.AnimationIndex = 7
			if not game.WasRunSuccess(run) then
				button.AnimationIndex = button.AnimationIndex + 1
			end
			ModifyTextBox({ Id = screen.ButtonIds[firstIndex - runIndex + 1], LuaKey = "TempTextData", LuaValue = { RunNum = runIndex, RouteName = routeName } })
		end
	end
end)

-- Can't make static as we need the button reference at runtime in the wrap
modutil.mod.Path.Context.Wrap("ShowRunHistory", function(screen, button)
	modutil.mod.Path.Wrap("ModifyTextBox", function(base, args)
		if args.Text == "RunHistoryScreen_Cleared" then
			local run = button.Run
			-- If the run was cleared, show the "ESCAPED" text instead of "PREVAILED!!"
			if run.BiomesReached ~= nil and (run.BiomesReached.Tartarus or run.BiomesReached.Asphodel or run.BiomesReached.Elysium or run.BiomesReached.Styx) then
				args.Text = "ModsNikkelMHadesBiomes_RunHistoryScreen_Cleared"
			end
		end
		return base(args)
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

	-- To prevent errors when opening the screen with the mod uninstalled, we need to set EndingRoomName to nil for modded runs
	-- We need to revert this here for the selected run
	-- As only a limited number of keys are included in the save file for past runs, we encode the ending room name in the KilledByName field
	-- KilledByName == <EnemyName>#<EndingRoomName>
	local run = game.DeepCopyTable(button.Run) or {}
	if run.EndingRoomName == nil and run.KilledByName ~= nil then
		local separatorIndex = string.find(run.KilledByName, "#")
		if separatorIndex ~= nil then
			run.EndingRoomName = string.sub(run.KilledByName, separatorIndex + 1)
			local enemyName = string.sub(run.KilledByName, 1, separatorIndex - 1)
			-- If the enemy name is empty, the player was not killed
			if enemyName == "" then
				run.KilledByName = nil
			else
				run.KilledByName = enemyName
			end
		end
	end
	button.Run = run

	base(screen, button)

	game.CodexData.Biomes.Entries = originalEntries
end)
