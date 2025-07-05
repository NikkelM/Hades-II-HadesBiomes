modutil.mod.Path.Wrap("OpenRunHistoryScreen", function(base, openedFrom)
	LoadPackages({ Name = "ModsNikkelMHadesBiomesPortraits" })

	base(openedFrom)
end)

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
