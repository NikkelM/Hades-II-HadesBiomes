modutil.mod.Path.Wrap("RunStateInit", function(base)
	base()

	if game.CurrentRun == nil then
		return
	end

	game.CurrentRun.SupportAINames = game.CurrentRun.SupportAINames or {}
	game.CurrentRun.CompletedStyxWings = game.CurrentRun.CompletedStyxWings or 0
	game.CurrentRun.ThanatosSpawns = game.CurrentRun.ThanatosSpawns or 0

	-- Only do this if we haven't done it yet for this global instance
	-- This key is not included in the save file on purpose, so it will always be null when the game is started and a new global is instantiated
	if game.ModsNikkelMHadesBiomesCompletedGlobalsModifications == nil then
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
	if mod.ValidModdedRunBiomes[args.StartingBiome] then
		game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun = true
		currentRun.ModsNikkelMHadesBiomesIsModdedRun = true
	end

	-- Edge case: We also need to do these modifications for the first room of a run, as the IsModdedRun flag only gets set after RunStateInit is called
	mod.ApplyGlobalGameObjectModifications(game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun)

	return base(currentRun, args)
end)

modutil.mod.Path.Wrap("CreateRoom", function(base, roomData, args)
	local room = base(roomData, args)

	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		local shrinePointDoorChance = room.ShrinePointDoorSpawnChance or
				game.RoomData.ModsNikkelMHadesBiomesBaseRoom.ShrinePointDoorSpawnChance or 0.0
		room.ShrinePointDoorChanceSuccess = game.RandomChance(shrinePointDoorChance)

		local forbiddenShopItemRequirements = room.ForbiddenShopItemRequirements
		if forbiddenShopItemRequirements ~= nil and game.IsGameStateEligible(forbiddenShopItemRequirements) then
			local forbiddenShopItemChance = room.ForbiddenShopItemSpawnChance or 0.0
			room.ForbiddenShopItemChanceSuccess = game.RandomChance(forbiddenShopItemChance)
		end
	end

	return room
end)

-- Recording stats after a run (clearing or losing)
modutil.mod.Path.Wrap("RecordRunStats", function(base)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
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
		-- Custom fields
		game.GameState.ModsNikkelMHadesBiomesClearedRunsCache = moddedRunsCleared

		game.UpdateLifetimeTraitRecords(game.CurrentRun)

		for bossName, healthFraction in pairs(game.CurrentRun.BossHealthBarRecord) do
			game.GameState.LastBossHealthBarRecord[bossName] = healthFraction
		end

		for bossName, bossData in pairs(game.BossDifficultyShrineEncounterMap) do
			if game.CurrentRun.EncountersOccurredCache[bossData.Encounter] then
				game.GameState.LastBossDifficultyRecord[bossName] = false
			elseif game.CurrentRun.EncountersOccurredCache[bossData.AltEncounter] then
				game.GameState.LastBossDifficultyRecord[bossName] = true
			end
		end
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

modutil.mod.Path.Wrap("RecordRunCleared", function(base)
	base()

	-- Most of the stats tracked here are for Quests
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and (game.CurrentRun.ActiveBounty == nil or (game.BountyData[game.CurrentRun.ActiveBounty]) and game.BountyData[game.CurrentRun.ActiveBounty].ModsNikkelMHadesBiomesAllowRecordRunClearedStatistics) then
		local currentBiome = game.CurrentRun.CurrentRoom.RoomSetName

		-- Record with which level of each ShrineUpgrades/Vows/Fear the run was cleared
		game.GameState.ModsNikkelMHadesBiomes_ClearedWithShrineUpgrades[currentBiome] = game
				.GameState.ModsNikkelMHadesBiomes_ClearedWithShrineUpgrades[currentBiome] or {}
		for shrineUpgradeName, shrineUpgradeLevel in pairs(game.GameState.ShrineUpgrades) do
			-- Only record non-zero levels
			if shrineUpgradeLevel > (game.GameState.ModsNikkelMHadesBiomes_ClearedWithShrineUpgrades[currentBiome][shrineUpgradeName] or 0) then
				game.GameState.ModsNikkelMHadesBiomes_ClearedWithShrineUpgrades[currentBiome][shrineUpgradeName] =
						shrineUpgradeLevel
			end
		end

		-- Record full run clears for modded runs separately
		if #game.CurrentRun.KeepsakeCache == 1 then
			game.GameState.ModsNikkelMHadesBiomes_ClearedFullRunWithKeepsakes[game.CurrentRun.KeepsakeCache[1]] = true
		end
	end
end)

modutil.mod.Path.Wrap("EndRun", function(base, run)
	if run.ModsNikkelMHadesBiomesIsModdedRun then
		if run.ModsNikkelMHadesBiomesActualCurrentRoomName ~= nil then
			run.CurrentRoom.Name = run.ModsNikkelMHadesBiomesActualCurrentRoomName
		end
		-- To prevent an error with opening the Run History screen after uninstalling the mod, we need to encode the EndingRoomName into the VictoryMessage field
		-- If it is a modded room name, the game otherwise crashes trying to find it
		-- This encoding is reversed when opening the Run History screen with the mod installed
		-- Only encode it if we've not already encoded it before for this run for some reason
		if not string.find(run.VictoryMessage or "", "#") then
			run.VictoryMessage = (run.VictoryMessage or "") .. "#" .. (run.CurrentRoom.Name or "")
		end
		-- The actual room name needs to be set to nil to ensure the base function assigns nil to EndingRoomName
		run.CurrentRoom.Name = nil

		-- Increase counter for completed modded runs
		game.GameState.ModsNikkelMHadesBiomesCompletedRunsCache = game.GameState.ModsNikkelMHadesBiomesCompletedRunsCache + 1
	end

	return base(run)
end)

modutil.mod.Path.Wrap("UpdateLifetimeTraitRecords", function(base, run)
	if run.ModsNikkelMHadesBiomesIsModdedRun then
		-- Bounty runs shouldn't count towards lifetime stats
		if game.CurrentRun.ActiveBounty == nil then
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
		end
	else
		return base(run)
	end
end)

modutil.mod.Path.Wrap("GetRunResult", function(base, run)
	if run.ActiveBounty ~= nil then
		if run.BountyCleared then
			return game.RunResultData.BountySuccess
		else
			return game.RunResultData.BountyFail
		end
	end

	-- Run this before the base function, as the base function defaults to a surface run if it's not the underworld
	if run.ModsNikkelMHadesBiomesIsModdedRun then
		if run.Cleared then
			return game.RunResultData.ModsNikkelMHadesBiomesUnderworldSuccess
		else
			return game.RunResultData.ModsNikkelMHadesBiomesUnderworldFail
		end
	end
	return base(run)
end)

modutil.mod.Path.Wrap("WasRunSuccess", function(base, run)
	return run.RunResult == game.RunResultData.ModsNikkelMHadesBiomesUnderworldSuccess or base(run)
end)

function mod.WasModdedRun(run)
	return run.RunResult == game.RunResultData.ModsNikkelMHadesBiomesUnderworldSuccess or
			run.RunResult == game.RunResultData.ModsNikkelMHadesBiomesUnderworldFail
end

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
			if config.z_SpeedrunForceTwoSack then
				-- If the config option is enabled, always force the fountain room in the second wing
				if currentRun.CompletedStyxWings == 1 then
					mod.DebugPrint("Forcing fountain room in Styx wing 2 due to config option.", 2)
					return true
				end
			end
			local chance = 1 / (5 - currentRun.CompletedStyxWings)
			if game.RandomChance(chance) then
				return true
			end
		end
	end

	return isForced
end)

-- We don't need this anymore as all the crashes have been fixed
-- Don't invalidate checkpoints in modded runs, as we still have some crashes every now and then that could reset run progress
-- modutil.mod.Path.Wrap("InvalidateCheckpoint", function(base)
-- 	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
-- 		ValidateCheckpoint({ Value = true })
-- 	else
-- 		base()
-- 	end
-- end)
