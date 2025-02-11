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

-- Recording stats after a run
modutil.mod.Path.Wrap("RecordRunStats", function(base)
	if game.CurrentRun.BiomesReached.Tartarus then
		game.CurrentRun.EndingRoomName = game.CurrentRun.CurrentRoom.Name
		game.CurrentRun.WeaponsCache = game.DeepCopyTable(game.CurrentRun.Hero.Weapons)
		game.CurrentRun.TraitRarityCache = game.CurrentRun.TraitRarityCache or {}
		for k, traitData in pairs(game.CurrentRun.Hero.Traits) do
			if not traitData.RecordCacheOnEquip then
				game.CurrentRun.TraitCache[traitData.Name] = (game.CurrentRun.TraitCache[traitData.Name] or 0) + 1
				game.CurrentRun.TraitRarityCache[traitData.Name] = traitData.Rarity or "Common"
			end
		end
		game.CurrentRun.ShrinePointsCache = game.GetTotalSpentShrinePoints()
		game.CurrentRun.ShrineUpgradesCache = game.DeepCopyTable(game.GameState.ShrineUpgrades)
		game.CurrentRun.MetaUpgradeCostCache = game.GameState.MetaUpgradeCostCache

		-- 'cleared' means achieved a victory condition as opposed to dying	
		local runsCleared = 0
		local underworldRunsCleared = 0
		local surfaceRunsCleared = 0
		local moddedRunsCleared = 0
		if CurrentRun.Cleared then
			runsCleared = runsCleared + 1
			if not CurrentRun.ActiveBounty and CurrentRun.BiomesReached ~= nil then
				moddedRunsCleared = moddedRunsCleared + 1
			end
		end
		for k, run in pairs(game.GameState.RunHistory) do
			if run.Cleared then
				runsCleared = runsCleared + 1
				if not run.ActiveBounty then
					if run.BiomesReached == nil or run.BiomesReached.F or run.EndingRoomName == "I_Boss01" then
						underworldRunsCleared = underworldRunsCleared + 1
					elseif run.BiomesReached.N then
						surfaceRunsCleared = surfaceRunsCleared + 1
					else
						-- This is a modded run
						moddedRunsCleared = moddedRunsCleared + 1
					end
				end
			end
		end
		game.GameState.ClearedRunsCache = runsCleared
		game.GameState.ClearedUnderworldRunsCache = underworldRunsCleared
		game.GameState.ClearedSurfaceRunsCache = surfaceRunsCleared
		-- Custom field
		game.GameState.ModsNikkelMHadesBiomesClearedRunsCache = moddedRunsCleared

		game.GameState.HighestShrinePointClearUnderworldCache = GetHighestShrinePointRunClear(CurrentRun,
			{ RequiredBiome = "F" })
		game.GameState.HighestShrinePointClearSurfaceCache = GetHighestShrinePointRunClear(CurrentRun,
			{ RequiredBiome = "N" })
		game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearCache = GetHighestShrinePointRunClear(CurrentRun,
			{ RequiredBiome = "Tartarus" })

		game.UpdateLifetimeTraitRecords(game.CurrentRun)

		for bossName, healthFraction in pairs(game.CurrentRun.BossHealthBarRecord) do
			game.GameState.LastBossHealthBarRecord[bossName] = healthFraction
		end
	else
		base()
	end
end)

modutil.mod.Path.Wrap("UpdateLifetimeTraitRecords", function(base, run)
	if run.BiomesReached.Tartarus then
		-- TODO: These are used in ShowTraitStats() - these runs won't be included for these stats, as there is no display for them
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

		if run.WeaponsCache ~= nil then
			for weaponName in pairs(run.WeaponsCache) do
				if game.Contains(game.WeaponSets.HeroPrimaryWeapons, weaponName) then
					game.GameState.LifetimeWeaponStats[weaponName] = game.GameState.LifetimeWeaponStats[weaponName] or {}
					local stats = game.GameState.LifetimeWeaponStats[weaponName]
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
		end
	else
		base(run)
	end
end)
