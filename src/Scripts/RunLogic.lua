modutil.mod.Path.Wrap("RunStateInit", function(base)
	base()

	-- The custom logic is always called, even if the run is already ongoing
	game.CurrentRun.SupportAINames = game.CurrentRun.SupportAINames or {}
	game.CurrentRun.CompletedStyxWings = game.CurrentRun.CompletedStyxWings or 0
	game.CurrentRun.ThanatosSpawns = game.CurrentRun.ThanatosSpawns or 0

	-- Only do this if we haven't done it yet for this global instance
	-- This key is not included in the save file, so it will always be null when the game is started and a new global is instantiated
	if game.ModsNikkelMHadesBiomesCompletedGlobalsModifications == nil or not game.CurrentRun then
		mod.ApplyGlobalGameObjectModifications(game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun)
		game.ModsNikkelMHadesBiomesCompletedGlobalsModifications = true
	end
end)

-- Displays the biome's name as a banner at the top when entering the first room
function mod.DisplayLocationText(source, args)
	if not args.Delay then
		args.Delay = 1.5
	end

	game.DisplayInfoBanner(source, args)
end

-- Hades run doors have a backing even while still locked (Hades II doors just don't have a preview)
-- Make sure we know which doors to add a backing to already
modutil.mod.Path.Wrap("SetupObstacle", function(base, obstacle, replaceOnlyNull, args)
	base(obstacle, replaceOnlyNull, args)

	if obstacle.Name == "TartarusDoor03b" or obstacle.Name == "AsphodelBoat01b" then
		game.CurrentRun.ModsNikkelMHadesBiomesExitDoors = game.CurrentRun.ModsNikkelMHadesBiomesExitDoors or {}
		table.insert(game.CurrentRun.ModsNikkelMHadesBiomesExitDoors, obstacle)
	end
end)

-- Doing this here instead of in StartNewRun, as StartNewRun creates the first encounter before we can set the modded flag
modutil.mod.Path.Wrap("ChooseStartingRoom", function(base, currentRun, args)
	local cachedRuns = mod.TryLoadCachedSjsonFile("cachedRuns.sjson")

	if mod.ValidModdedRunBiomes[args.StartingBiome] then
		game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun = true
		currentRun.ModsNikkelMHadesBiomesIsModdedRun = true

		cachedRuns.ActiveModdedRuns[game.GameState.ModsNikkelMHadesBiomesSaveFileIndex] = true
		mod.SaveCachedSjsonFile("cachedRuns.sjson", cachedRuns)
	elseif game.GameState.ModsNikkelMHadesBiomesSaveFileIndex ~= nil then
		cachedRuns.ActiveModdedRuns[game.GameState.ModsNikkelMHadesBiomesSaveFileIndex] = false
		mod.SaveCachedSjsonFile("cachedRuns.sjson", cachedRuns)
	end

	-- Edge case: We also need to do these modifications for the first room of a run, as the IsModdedRun flag only gets set after RunStateInit is called
	mod.ApplyGlobalGameObjectModifications(game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun)

	return base(currentRun, args)
end)

-- Recording stats after a run
modutil.mod.Path.Wrap("RecordRunStats", function(base)
	if game.CurrentRun.BiomesReached.Tartarus then
		game.CurrentRun.RunResult = game.GetRunResult(game.CurrentRun)
		game.CurrentRun.EndingRoomName = game.CurrentRun.CurrentRoom.Name
		game.CurrentRun.WeaponsCache = game.DeepCopyTable(game.CurrentRun.Hero.Weapons)
		game.CurrentRun.TraitRarityCache = game.CurrentRun.TraitRarityCache or {}
		for k, traitData in ipairs(game.CurrentRun.Hero.Traits) do
			if not traitData.RecordCacheOnEquip then
				game.CurrentRun.TraitCache[traitData.Name] = (game.CurrentRun.TraitCache[traitData.Name] or 0) + 1
			end
			game.CurrentRun.TraitRarityCache[traitData.Name] = traitData.Rarity or "Common"
		end
		game.CurrentRun.ShrinePointsCache = game.GetTotalSpentShrinePoints()
		game.CurrentRun.ShrineUpgradesCache = game.DeepCopyTable(game.GameState.ShrineUpgrades)
		game.CurrentRun.MetaUpgradeCostCache = game.GameState.MetaUpgradeCostCache
		-- Modded runs shouldn't count for this progress
		-- if game.GameState.HighestRunDepthCache < game.CurrentRun.RunDepthCache then
		-- 	game.GameState.HighestRunDepthCache = game.CurrentRun.RunDepthCache
		-- end
		-- local roomNames = {}
		-- for k, room in ipairs(game.CurrentRun.RoomHistory) do
		-- 	table.insert(roomNames, room.Name)
		-- end
		-- table.insert(roomNames, game.CurrentRun.CurrentRoom.Name)
		-- SendProgressionEvents({
		-- 	Names = roomNames,
		-- 	CompletedRuns = game.GameState.CompletedRunsCache,
		-- 	ClearedUnderworldRuns = game.GameState.ClearedUnderworldRunsCache,
		-- 	ClearedSurfaceRuns = game.GameState.ClearedSurfaceRunsCache,
		-- 	Cleared = game.CurrentRun.Cleared,
		-- 	GameplayTime = game.GameState.GameplayTime,
		-- 	TotalTime = game.GameState.TotalTime
		-- })

		-- 'cleared' means achieved a victory condition as opposed to dying	
		local runsCleared = 0
		local underworldRunsCleared = 0
		local surfaceRunsCleared = 0
		local moddedRunsCleared = 0
		if game.CurrentRun.Cleared then
			runsCleared = runsCleared + 1
			if not game.CurrentRun.ActiveBounty and game.CurrentRun.BiomesReached ~= nil then
				moddedRunsCleared = moddedRunsCleared + 1
				-- Custom fields
				game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache = game.GameState
						.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache or 0
				game.GameState.ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache = game.GameState
						.ModsNikkelMHadesBiomesFastestModdedRunClearTime or 999999
				if game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache < game.CurrentRun.ShrinePointsCache then
					game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache = game.CurrentRun.ShrinePointsCache
				end
				if game.GameState.ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache > game.CurrentRun.GameplayTime then
					game.GameState.ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache = game.CurrentRun.GameplayTime
				end
			end
		end
		for k, run in ipairs(game.GameState.RunHistory) do
			if run.RunResult == game.RunResultData.UnderworldSuccess then
				runsCleared = runsCleared + 1
				underworldRunsCleared = underworldRunsCleared + 1
			elseif run.RunResult == game.RunResultData.SurfaceSuccess then
				runsCleared = runsCleared + 1
				surfaceRunsCleared = surfaceRunsCleared + 1
			elseif run.RunResult == game.RunResultData.ModsNikkelMHadesBiomesUnderworldSuccess then
				runsCleared = runsCleared + 1
				moddedRunsCleared = moddedRunsCleared + 1
			end
		end
		game.GameState.ClearedRunsCache = runsCleared
		game.GameState.ClearedUnderworldRunsCache = underworldRunsCleared
		game.GameState.ClearedSurfaceRunsCache = surfaceRunsCleared
		-- Custom field
		game.GameState.ModsNikkelMHadesBiomesClearedRunsCache = moddedRunsCleared

		game.UpdateLifetimeTraitRecords(game.CurrentRun)

		for bossName, healthFraction in pairs(game.CurrentRun.BossHealthBarRecord) do
			game.GameState.LastBossHealthBarRecord[bossName] = healthFraction
		end

		-- Only used for voicelines, don't need in the modded runs
		-- for bossName, bossData in pairs(game.BossDifficultyShrineEncounterMap) do
		-- 	if game.CurrentRun.EncountersOccurredCache[bossData.Encounter] then
		-- 		game.GameState.LastBossDifficultyRecord[bossName] = false
		-- 	elseif game.CurrentRun.EncountersOccurredCache[bossData.AltEncounter] then
		-- 		game.GameState.LastBossDifficultyRecord[bossName] = true
		-- 	end
		-- end
	else
		base()
		-- Redo the run results to include modded runs in the GameState
		local moddedRunsCleared = 0
		for k, run in ipairs(game.GameState.RunHistory) do
			if run.RunResult == game.RunResultData.ModsNikkelMHadesBiomesUnderworldSuccess then
				moddedRunsCleared = moddedRunsCleared + 1
			end
		end
		-- Custom field
		game.GameState.ModsNikkelMHadesBiomesClearedRunsCache = moddedRunsCleared
	end
end)

modutil.mod.Path.Wrap("UpdateLifetimeTraitRecords", function(base, run)
	if run.BiomesReached.Tartarus then
		-- TODO: These are used in ShowTraitStats() - these runs won't be included for these stats, as there is no display for them (yet)
		local clearCountRecordName = "ModsNikkelMHadesBiomesClearCount"
		local fastestTimeRecordName = "ModsNikkelMHadesBiomesFastestTime"
		local shrinePointsRecordName = "ModsNikkelMHadesBiomesHighestShrinePoints"

		if run.TraitCache ~= nil then
			for traitName in pairs(run.TraitCache) do
				game.GameState.LifetimeTraitStats[traitName] = game.GameState.LifetimeTraitStats[traitName] or {}
				local stats = game.GameState.LifetimeTraitStats[traitName]
				stats.UseCount = (stats.UseCount or 0) + 1
				if run.Cleared then
					stats[clearCountRecordName] = (stats[clearCountRecordName] or 0) + 1
					stats.ClearCount = (stats.ClearCount or 0) + 1
					if run.GameplayTime < (stats[fastestTimeRecordName] or 999999) then
						stats[fastestTimeRecordName] = run.GameplayTime
					end
					if run.ShrinePointsCache > (stats[shrinePointsRecordName] or 0) then
						stats[shrinePointsRecordName] = run.ShrinePointsCache
					end
				end
			end
		end
	else
		base(run)
	end
end)

modutil.mod.Path.Wrap("GetRunResult", function(base, run)
	-- Run this before the base function, as the base function defaults to a surface run if it's not the underworld
	if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
		if run.Cleared then
			return game.RunResultData.ModsNikkelMHadesBiomesUnderworldSuccess
		else
			return game.RunResultData.ModsNikkelMHadesBiomesUnderworldFail
		end
	end
	return base(run)
end)

-- We want our modded runs to be considered a bounty run for the RunHistoryScreen
modutil.mod.Path.Wrap("WasBountyRun", function(base, run)
	return (run.BiomesReached ~= nil and run.BiomesReached.Tartarus) or base(run)
end)

modutil.mod.Path.Wrap("IsRoomForced", function(base, currentRun, currentRoom, nextRoomData, args, otherDoors)
	local isForced = base(currentRun, currentRoom, nextRoomData, args, otherDoors)

	-- Only check if we need to force the room if it isn't forced already
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and not isForced then
		-- Force a miniboss if the current wing should have one, and we've either seen the fountain room already, or can force it in another wing
		if currentRoom ~= nil and currentRoom.ForceWingEndMiniBoss and nextRoomData.WingEndMiniBoss and (currentRun.CompletedStyxWings < 4 or mod.HasSeenRoomInRun(currentRun, "D_Reprieve01")) then
			return true
		end

		-- Randomly force the next room to be a fountain room, with a 100% chance if this is the last wing
		if nextRoomData.ForceChanceByRemainingWings then
			local chance = 1 / (5 - currentRun.CompletedStyxWings)
			if game.RandomChance(chance) then
				return true
			end
		end
	end

	return isForced
end)
