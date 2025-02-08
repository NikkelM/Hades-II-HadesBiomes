-- Functions that ensure the run logic works as intended

-- Displays the biome's name as a banner at the top when entering the first room
function game.DisplayLocationText(source, args)
	if not args.Delay then
		args.Delay = 1.5
	end

	game.DisplayInfoBanner(source, args)
end

-- Hades run doors have a backing even while still locked (Hades II doors just don't have a preview)
-- Make sure we know which doors to add a backing to already
modutil.mod.Path.Wrap("SetupObstacle", function(base, obstacle, replaceOnlyNull, args)
	base(obstacle, replaceOnlyNull, args)

	if obstacle.Name == "TartarusDoor03b" then
		game.CurrentRun.ModsNikkelMHadesBiomesExitDoors = game.CurrentRun.ModsNikkelMHadesBiomesExitDoors or {}
		table.insert(game.CurrentRun.ModsNikkelMHadesBiomesExitDoors, obstacle)
	end
end)

modutil.mod.Path.Wrap("StartNewRun", function(base, prevRun, args)
	local currentRun = base(prevRun, args)

	local cachedRuns = mod.LoadCachedRunsFile()

	-- Only set the flag if we are starting a Hades run
	if args.StartingBiome == "Tartarus" then
		game.CurrentRun.IsModsNikkelMHadesBiomesHadesRun = true
		currentRun.IsModsNikkelMHadesBiomesHadesRun = true

		cachedRuns.ActiveModdedRuns[game.GameState.ModsNikkelMHadesBiomesSaveFileIndex] = true
		sjson.encode_file(mod.CachedRunsFilePath, cachedRuns)
	elseif game.GameState.ModsNikkelMHadesBiomesSaveFileIndex ~= nil then
		cachedRuns.ActiveModdedRuns[game.GameState.ModsNikkelMHadesBiomesSaveFileIndex] = false
		sjson.encode_file(mod.CachedRunsFilePath, cachedRuns)
	end

	return currentRun
end)
