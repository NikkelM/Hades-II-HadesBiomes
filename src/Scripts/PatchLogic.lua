modutil.mod.Path.Wrap("DoPatches", function(base)
	if game.GameState ~= nil then
		-- IMPORTANT: Whenever this function is changed, increase the PatchRevision number at the end of this function
		-- All required checks will run once with the previous GameState's PatchRevision number, and then the PatchRevision number will be updated to the latest one
		game.GameState.ModsNikkelMHadesBiomesPatchRevision = game.GameState.ModsNikkelMHadesBiomesPatchRevision or 0
		mod.DebugPrint(
			"Applying patches to GameState, current patch revision: " .. game.GameState.ModsNikkelMHadesBiomesPatchRevision, 4)

		if game.GameState.ModsNikkelMHadesBiomesPatchRevision < 1 then
			-- #region RunHistory
			if not game.IsEmpty(game.GameState.RunHistory) then
				for _, runData in pairs(game.GameState.RunHistory) do
					if mod.WasModdedRun(runData) then
						-- #region Fix any older runs from before the uninstall-error was fixed
						if runData.EndingRoomName ~= nil and runData.EndingRoomName ~= "BaseRoom" then
							runData.VictoryMessage = (runData.VictoryMessage or "") .. "#" .. (runData.EndingRoomName or "")
							runData.EndingRoomName = nil
						elseif runData.EndingRoomName == "BaseRoom" and runData.VictoryMessage ~= nil and string.find(runData.VictoryMessage, "#") then
							runData.EndingRoomName = nil
						end
						-- #endregion
						if runData.EndingRoomName == nil and runData.VictoryMessage ~= nil then
							local endingRoomName = string.match(runData.VictoryMessage, "#(.-)$")
							if endingRoomName ~= nil and endingRoomName ~= "" then
								-- #region Fix BackupCauseOfDeath not being set for boss and miniboss room deaths in older runs
								if game.RoomData[endingRoomName] ~= nil and game.RoomData[endingRoomName].BackupCauseOfDeath then
									runData.KilledByName = game.RoomData[endingRoomName].BackupCauseOfDeath
								end
								-- #endregion
								-- #region Fix double-encoding (e.g. #D_Boss01#) after some bad patching in earlier versions
								if string.find(endingRoomName, "#") then
									endingRoomName = string.match(endingRoomName, "^(.-)#$")
									local originalVictoryMessage = string.sub(runData.VictoryMessage, 1,
										string.find(runData.VictoryMessage, "#") - 1)
									runData.VictoryMessage = originalVictoryMessage .. "#" .. endingRoomName
								end
								-- #endregion
							end
						end
					end
				end
			end
			-- #endregion

			-- #region Misc GameState
			-- #region Initialize GameState variables
			game.GameState.ModsNikkelMHadesBiomesCompletedRunsCache = game.GameState.ModsNikkelMHadesBiomesCompletedRunsCache or
					0
			game.GameState.ModsNikkelMHadesBiomesClearedRunsCache = game.GameState.ModsNikkelMHadesBiomesClearedRunsCache or 0
			game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache = game.GameState
					.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache or 0
			game.GameState.ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache = game.GameState
					.ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache or 999999
			game.GameState.ModsNikkelMHadesBiomesCodexEntriesUnlockedCache = game.GameState
					.ModsNikkelMHadesBiomesCodexEntriesUnlockedCache or 0
			-- #endregion

			-- #region Patch GiftTextLineSets
			-- If ThanatosGift04 has already been completed, move it to ThanatosGift04_B, since that is now the only one still available
			if game.GameState.TextLinesRecord["ThanatosGift04"] ~= nil then
				game.GameState.TextLinesRecord["ThanatosGift04"] = nil
				game.GameState.TextLinesRecord["ThanatosGift04_B"] = true
			end
			-- #endregion
			-- #endregion

			-- #region Retroactively award additional Nightmare for modded testaments that were completed before the rewards were increased
			if not game.GameState.ModsNikkelMHadesBiomesPatchedTestamentsIncreasedRewards then
				-- Not setting the GameState variable anymore as this won't be called after revision 1 anymore
				mod.PatchTestamentIncreasedRewards()
			end
			-- In case it was set before the revision system was introduced
			game.GameState.ModsNikkelMHadesBiomesPatchedTestamentsIncreasedRewards = nil
			-- #endregion

			-- #region Patch missing Codex unlocks in CodexStatus
			for entryName, _ in pairs(game.CodexData[mod.CodexChapterName].Entries) do
				game.CheckCodexUnlock(mod.CodexChapterName, entryName)
			end
			-- #endregion

			-- #region CurrentRun
			if game.CurrentRun ~= nil then
				-- #region If in the Hub and the current run is modded
				if game.CurrentHubRoom ~= nil and game.Contains(mod.ModdedRoomNamesWithOldElysium, game.CurrentRun.CurrentRoom.Name) then
					-- Save the actual ending room for when we call EndRun() when starting the next run, so we can still access it there
					game.CurrentRun.ModsNikkelMHadesBiomesActualCurrentRoomName = game.CurrentRun.CurrentRoom.Name
					-- To prevent an error after uninstalling the mod, due to the room name being unknown
					game.CurrentRun.CurrentRoom.Name = "BaseRoom"

					-- Additionally, to prevent an error with opening the Run History screen after uninstalling the mod,
					-- we need to encode the EndingRoomName into the VictoryMessage field, since if it is a modded room name, the game crashes trying to find it
					-- This encoding is reversed when opening the Run History screen with the mod installed
					game.CurrentRun.VictoryMessage = (game.CurrentRun.VictoryMessage or "") ..
							"#" .. (game.CurrentRun.EndingRoomName or "")
					game.CurrentRun.EndingRoomName = nil
				end
				-- #endregion
			end
			-- #endregion
		end
		if game.GameState.ModsNikkelMHadesBiomesPatchRevision < 2 then
			game.GameState.ModsNikkelMHadesBiomes_ClearedWithShrineUpgrades = game.GameState
					.ModsNikkelMHadesBiomes_ClearedWithShrineUpgrades or {}
		end

		-- IMPORTANT: This must be incremented every time this function is changed
		game.GameState.ModsNikkelMHadesBiomesPatchRevision = 2
	end

	return base()
end)

function mod.PatchTestamentIncreasedRewards()
	local owedNightmare = 0
	for bountyName, _ in pairs(game.GameState.ShrineBountiesCompleted) do
		local bountyData = game.BountyData[bountyName]
		if game.Contains(mod.ModdedShrineBountyNames, bountyName) then
			-- Minus one since we already awarded one Nightmare when the testament was originally completed
			-- This will add 0 Nightmare for normal bounties, and 1/2 Nightmare for those rewarding 2/3 Nightmare on the higher heats
			owedNightmare = owedNightmare + bountyData.LootOptions[1].Overrides.AddResources.WeaponPointsRare - 1
		end
	end

	game.AddResource("WeaponPointsRare", owedNightmare, "Patch",
		{ Silent = true, SkipVoiceLines = true, SkipInventoryObjective = true })
end
