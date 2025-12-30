modutil.mod.Path.Wrap("IsGameStateEligible", function(base, source, requirements, args)
	local isEligible = base(source, requirements, args)

	-- If it's a modded run and the already existing requirements are met, also check the Hades requirements
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and isEligible then
		return mod.ModsNikkelMHadesBiomesIsGameStateEligible(source, requirements, args)
	end

	return isEligible
end)

modutil.mod.Path.Wrap("IsVoiceLineEligible", function(base, line, prevLine, parentLine, source, args)
	local isEligible = base(line, prevLine, parentLine, source, args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and isEligible then
		return mod.ModsNikkelMHadesBiomesIsGameStateEligible(source, line, args)
	end

	return isEligible
end)

modutil.mod.Path.Wrap("IsEnemyEligible", function(base, enemyName, encounter, wave)
	local isEligible = base(enemyName, encounter, wave)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and isEligible then
		local args = {}
		if game.EnemyData[enemyName].IsElite and game.GetNumShrineUpgrades("EnemyEliteShrineUpgrade") > 0 then
			args.SkipMinBiomeDepth = true
		end
		return mod.ModsNikkelMHadesBiomesIsGameStateEligible(game.EnemyData[enemyName], game.EnemyData[enemyName], args)
	end

	return isEligible
end)

modutil.mod.Path.Wrap("IsRoomEligible", function(base, currentRun, currentRoom, nextRoomData, args)
	local isEligible = base(currentRun, currentRoom, nextRoomData, args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and isEligible then
		return mod.ModsNikkelMHadesBiomesIsGameStateEligible(nextRoomData, nextRoomData, args)
	end

	return isEligible
end)

modutil.mod.Path.Wrap("IsEncounterEligible", function(base, currentRun, room, nextEncounterData, args)
	local isEligible = base(currentRun, room, nextEncounterData, args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and isEligible then
		return mod.ModsNikkelMHadesBiomesIsGameStateEligible(nextEncounterData, nextEncounterData, args)
	end

	return isEligible
end)

modutil.mod.Path.Wrap("IsInspectPointEligible", function(base, currentRun, source, inspectPointData)
	local isEligible = base(currentRun, source, inspectPointData)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and isEligible then
		return mod.ModsNikkelMHadesBiomesIsGameStateEligible(source, inspectPointData)
	end

	return isEligible
end)

modutil.mod.Path.Wrap("IsTextLineEligible", function(base, currentRun, source, line, prevLine, parentLine, args)
	local isEligible = base(currentRun, source, line, prevLine, parentLine, args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and isEligible then
		-- Check if the whole line is eligible
		if not mod.ModsNikkelMHadesBiomesIsGameStateEligible(source, line, args) then
			return false
		end
		-- But also check if the inner cues are eligible, as in Hades I, there can be requirements in there sometimes
		for _, cue in ipairs(line) do
			if type(cue) == "table" then
				if not mod.ModsNikkelMHadesBiomesIsGameStateEligible(source, cue, args) then
					return false
				end
			end
		end
		return true
	end

	return isEligible
end)

function mod.IsShrinePointDoorEligible(currentRun, currentRoom)
	if currentRoom.ForceShrinePointDoor then
		return true
	end

	if game.HasHeroTraitValue("ForceShrinePointDoor") then
		return true
	end

	if not currentRoom.ShrinePointDoorChanceSuccess then
		return false
	end

	if not game.IsGameStateEligible(currentRun, currentRoom.ShrinePointDoorRequirements) then
		return false
	end

	return true
end

function mod.HasSeenEncounter(encounterName)
	if game.GameState.EncountersOccurredCache[encounterName] ~= nil and game.GameState.EncountersOccurredCache[encounterName] > 0 then
		return true
	end
	return false
end

function mod.HasSeenRoom(roomName, excludeThisRun)
	if game.GameState.RoomCountCache[roomName] ~= nil and game.GameState.RoomCountCache[roomName] > 0 then
		return true
	end
	if not excludeThisRun and mod.HasSeenRoomInRun(CurrentRun, roomName) then
		return true
	end
	return false
end

function mod.HasSeenRoomEarlierInRun(run, roomName)
	if run.RoomCountCache[roomName] ~= nil and run.RoomCountCache[roomName] > 0 then
		return true
	end
	return false
end

function mod.HasSeenRoomInRun(run, roomName)
	if run.CurrentRoom ~= nil and run.CurrentRoom.Name == roomName then
		return true
	end
	if run.RoomCountCache ~= nil and run.RoomCountCache[roomName] ~= nil and run.RoomCountCache[roomName] > 0 then
		return true
	end
	-- For the encoded EndingRoomName for uninstall compatibility
	if run.EndingRoomName == nil and run.VictoryMessage ~= nil then
		local separatorIndex = string.find(run.VictoryMessage, "#")
		if separatorIndex ~= nil and string.sub(run.VictoryMessage, separatorIndex + 1) == roomName then
			return true
		end
	end
	return false
end

function mod.GetFastestRunClearTime(currentRun)
	-- local fastestTime = 999999
	-- if currentRun.Cleared then
	-- 	fastestTime = currentRun.GameplayTime
	-- end
	-- for k, prevRun in pairs(game.GameState.RunHistory) do
	-- 	if prevRun.Cleared and prevRun.BiomesReached.Tartarus and prevRun.GameplayTime ~= nil and prevRun.GameplayTime < fastestTime then
	-- 		fastestTime = prevRun.GameplayTime
	-- 	end
	-- end
	return game.GameState.ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache or 999999
end

function mod.GetHighestShrinePointRunClear(currentRun, args)
	-- args = args or {}
	-- local highestPoints = 0
	-- if currentRun ~= nil and currentRun.Cleared and currentRun.ShrinePointsCache ~= nil then
	-- 	if args.RequiredBiome == nil or currentRun.BiomesReached[args.RequiredBiome] then
	-- 		highestPoints = currentRun.ShrinePointsCache
	-- 	end
	-- end
	-- for runIndex, prevRun in ipairs(game.GameState.RunHistory) do
	-- 	if prevRun.BiomesReached.Tartarus and (args.RequiredBiome == nil or (prevRun.BiomesReached ~= nil and prevRun.BiomesReached[args.RequiredBiome])) then
	-- 		if prevRun.Cleared and prevRun.ShrinePointsCache ~= nil and prevRun.ShrinePointsCache > highestPoints then
	-- 			highestPoints = prevRun.ShrinePointsCache
	-- 		end
	-- 	end
	-- end
	return game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache or 0
end

function mod.RunHasOneOfTraits(run, traits)
	if run.TraitCache == nil then
		return false
	end
	for k, traitName in pairs(traits) do
		if run.TraitCache[traitName] then
			return true
		end
	end
	return false
end

function mod.RunHasTraits(run, traits)
	if run.TraitCache == nil then
		return false
	end
	for k, traitName in pairs(traits) do
		if not run.TraitCache[traitName] then
			return false
		end
	end
	return true
end

function mod.IsMetaUpgradeActive(upgradeName, args)
	args = args or {}
	if game.Contains(game.ShrineUpgradeOrder, upgradeName) then
		return true
	end
	return false
end

function mod.GetPreviousModdedRun()
	for i = #game.GameState.RunHistory, 1, -1 do
		local run = game.GameState.RunHistory[i]
		-- BiomesReached is on the save whitelist, ModsNikkelMHadesBiomesIsModdedRun is not
		if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
			return run
		end
	end
	return
end

function mod.ModsNikkelMHadesBiomesIsGameStateEligible(source, requirements, args)
	if args == nil then
		args = {}
	end
	local roomSkip = args.RoomsSkipped or 0

	-- We assume this is handled correctly in the original function call
	-- if source == nil then
	-- return false
	-- end

	if requirements == nil then
		-- If we still don't have requirements, return true
		if source == nil then
			return true
		end
		requirements = source
	end

	if game.IsEmpty(requirements) then
		return true
	end

	if requirements.Skip then
		return false
	end

	if requirements.Force then
		return true
	end

	-- Map Asphodel & Elysium room names for any requirement that has rooms in it
	local roomRequirementOptions = {
		RequiredRoom = "string",
		RequiredRooms = "table",
		RequiredFalseRooms = "table",
		RequiredSeenRoom = "string",
		RequiredSeenRooms = "table",
		RequiredFalseSeenRoom = "string",
		RequiredFalseSeenRooms = "table",
		RequiredFalseSeenRoomThisRun = "string",
		RequiredFalseSeenRoomsThisRun = "table",
		RequiredSeenRoomsBeforeThisRun = "table",
		RequiredFalseSeenRoomsBeforeThisRun = "table",
		RequiredMinTimesSeenRoom = "string",
		RequiredMaxTimesSeenRoom = "string",
		RequiredRoomThisRun = "string",
		RequiredRoomsThisRun = "table",
		RequiredAnyRoomsThisRun = "table",
		RequiredRoomLastRun = "string",
		RequiredFalseRoomLastRun = "string",
		RequiredAnyRoomsLastRun = "table",
		RequiredDeathRoom = "string",
		RequiredAnyDeathRooms = "table",
		RequiredFalseDeathRoom = "string",
		RequiredFalseDeathRooms = "table",
		RequiredAnyPrevRoom = "table",
		RequiredFalsePrevRooms = "table",
		ConsecutiveDeathsInRoom = "nameTable",
		ConsecutiveClearsOfRoom = "nameTable",
	}
	for roomRequirement, requirementType in pairs(roomRequirementOptions) do
		if requirements[roomRequirement] then
			if requirementType == "string" then
				requirements[roomRequirement] =
						mod.AsphodelRoomNameMappings[requirements[roomRequirement]]
						or mod.ElysiumRoomNameMappings[requirements[roomRequirement]]
						or requirements[roomRequirement]
			elseif requirementType == "table" then
				for i, roomName in ipairs(requirements[roomRequirement]) do
					requirements[roomRequirement][i] =
							mod.AsphodelRoomNameMappings[roomName]
							or mod.ElysiumRoomNameMappings[roomName]
							or roomName
				end
			elseif requirementType == "nameTable" then
				for i, roomName in ipairs(requirements[roomRequirement]) do
					requirements[roomRequirement][i].Name =
							mod.AsphodelRoomNameMappings[roomName.Name]
							or mod.ElysiumRoomNameMappings[roomName.Name]
							or roomName.Name
				end
			end
		end
	end

	-- ChanceToPlay is already taken care of in the Hades II function call
	-- if requirements.ChanceToPlay ~= nil and not RandomChance(requirements.ChanceToPlay) then
	-- 	return false
	-- end

	local currentRunDepth = 0
	if game.CurrentRun.RunDepthCache ~= nil then
		currentRunDepth = game.CurrentRun.RunDepthCache + roomSkip
	end

	local currentBiomeDepth = 0
	if game.CurrentRun.BiomeDepthCache ~= nil then
		currentBiomeDepth = game.CurrentRun.BiomeDepthCache + roomSkip
	end

	if requirements.RequiredGiftLevel ~= nil then
		if GetGiftLevel(requirements.RequiredGiftLevel.NPCName) < requirements.RequiredGiftLevel.MinLevel then
			return false
		end
	end

	if requirements.AssistUpgradeLevel ~= nil then
		if not game.GameState.AssistUnlocks[requirements.AssistUpgradeLevel.Name] or game.GameState.AssistUnlocks[requirements.AssistUpgradeLevel.Name] < requirements.AssistUpgradeLevel.Level then
			return false
		end
	end

	if requirements.RequiredTextLines ~= nil then
		for k, textLineSet in pairs(requirements.RequiredTextLines) do
			if game.GameState.TextLinesRecord[textLineSet] == nil then
				return false
			end
		end
	end

	if requirements.RequiredAnyTextLines ~= nil then
		local anyTrue = false
		for k, textLineSet in pairs(requirements.RequiredAnyTextLines) do
			if game.GameState.TextLinesRecord[textLineSet] then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	-- this is a duplicate of RequiredAnyTextLines above for testing multiple pairs / sets of lines in some cases
	if requirements.RequiredAnyOtherTextLines ~= nil then
		local anyTrue = false
		for k, textLineSet in pairs(requirements.RequiredAnyOtherTextLines) do
			if game.GameState.TextLinesRecord[textLineSet] then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredMinAnyTextLines ~= nil then
		local numTrue = 0
		for k, textLineSet in pairs(requirements.RequiredMinAnyTextLines.TextLines) do
			if game.GameState.TextLinesRecord[textLineSet] then
				numTrue = numTrue + 1
			end
		end
		if numTrue < requirements.RequiredMinAnyTextLines.Count then
			return false
		end
	end
	if requirements.RequiredMaxAnyTextLines ~= nil then
		local numTrue = 0
		for k, textLineSet in pairs(requirements.RequiredMaxAnyTextLines.TextLines) do
			if game.GameState.TextLinesRecord[textLineSet] then
				numTrue = numTrue + 1
			end
		end
		if numTrue > requirements.RequiredMaxAnyTextLines.Count then
			return false
		end
	end

	if requirements.RequiredAnyTextLinesThisRun ~= nil then
		local anyTrue = false
		for k, textLineSet in pairs(requirements.RequiredAnyTextLinesThisRun) do
			if game.CurrentRun.TextLinesRecord[textLineSet] then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredTextLinesThisRoom ~= nil then
		for k, textLines in pairs(requirements.RequiredTextLinesThisRoom) do
			if not game.CurrentRun.CurrentRoom.TextLinesRecord[textLines] then
				return false
			end
		end
	end
	if requirements.RequiredFalseTextLinesThisRoom ~= nil then
		for k, textLines in pairs(requirements.RequiredFalseTextLinesThisRoom) do
			if game.CurrentRun.CurrentRoom.TextLinesRecord[textLines] then
				return false
			end
		end
	end

	if requirements.RequiredTextLinesThisRun ~= nil and game.CurrentRun.TextLinesRecord ~= nil and not game.CurrentRun.TextLinesRecord[requirements.RequiredTextLinesThisRun] then
		return false
	end
	if requirements.RequiredFalseTextLinesThisRun ~= nil and game.CurrentRun.TextLinesRecord ~= nil and type(requirements.RequiredFalseTextLinesThisRun) == "table" then -- Backwards compat
		for k, textLineSet in pairs(requirements.RequiredFalseTextLinesThisRun) do
			if game.CurrentRun.TextLinesRecord[textLineSet] ~= nil then
				return false
			end
		end
	end

	if requirements.RequiredFalseTextLines ~= nil then
		for k, textLineSet in pairs(requirements.RequiredFalseTextLines) do
			if game.GameState.TextLinesRecord[textLineSet] ~= nil then
				return false
			end
		end
	end

	if requirements.RequiredQueuedTextLines ~= nil then
		local anyTrue = false
		for unitId, unit in pairs(game.ActiveEnemies) do
			if unit.NextInteractLines ~= nil and unit.NextInteractLines.Name == requirements.RequiredQueuedTextLines then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end
	if requirements.RequiredAnyQueuedTextLines ~= nil then
		local anyTrue = false
		for unitId, unit in pairs(game.ActiveEnemies) do
			for k, textLineSet in pairs(requirements.RequiredAnyQueuedTextLines) do
				if unit.NextInteractLines ~= nil and unit.NextInteractLines.Name == textLineSet then
					anyTrue = true
					break
				end
			end
		end
		if not anyTrue then
			return false
		end
	end
	if requirements.RequiredFalseQueuedTextLines ~= nil then
		for unitId, unit in pairs(game.ActiveEnemies) do
			for k, textLineSet in pairs(requirements.RequiredFalseQueuedTextLines) do
				if unit.NextInteractLines ~= nil and unit.NextInteractLines.Name == textLineSet then
					return false
				end
			end
		end
	end

	-- local prevRun = game.PrevRun
	local prevRun = mod.GetPreviousModdedRun()
	if requirements.RequiredAnyTextLinesLastRun ~= nil then
		if prevRun == nil or prevRun.TextLinesRecord == nil then
			return false
		end
		local anyTrue = false
		for k, textLineSet in pairs(requirements.RequiredAnyTextLinesLastRun) do
			if prevRun.TextLinesRecord[textLineSet] then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end
	if requirements.RequiredFalseTextLinesLastRun ~= nil and prevRun ~= nil and prevRun.TextLinesRecord ~= nil then
		for k, textLineSet in pairs(requirements.RequiredFalseTextLinesLastRun) do
			if prevRun.TextLinesRecord[textLineSet] ~= nil then
				return false
			end
		end
	end

	if requirements.RequiredCodexEntry ~= nil then
		local requiredEntryName = requirements.RequiredCodexEntry.EntryName
		local requiredEntryIndex = requirements.RequiredCodexEntry.EntryIndex or 1

		if game.CodexData[mod.CodexChapterName].Entries[requiredEntryName] and game.CodexData[mod.CodexChapterName].Entries[requiredEntryName].Entries[requiredEntryIndex] then
			local codexRequirements = game.CodexData[mod.CodexChapterName].Entries[requiredEntryName].Entries
					[requiredEntryIndex].UnlockGameStateRequirements or {}
			if not mod.ModsNikkelMHadesBiomesIsGameStateEligible(nil, codexRequirements) then
				return false
			end
		end
		-- local requiredEntryName = requirements.RequiredCodexEntry.EntryName
		-- local requiredEntryIndex = requirements.RequiredCodexEntry.EntryIndex or 1
		-- local requiredCodexEntryFound = HasCodexEntryBeenFound(requiredEntryName, requiredEntryIndex)
		-- if not requiredCodexEntryFound then
		-- 	return false
		-- end
	end

	if requirements.RequiredCodexEntries ~= nil then
		for requiredEntryName, requiredEntryIndex in pairs(requirements.RequiredCodexEntries) do
			if game.CodexData[mod.CodexChapterName].Entries[requiredEntryName] and game.CodexData[mod.CodexChapterName].Entries[requiredEntryName].Entries[requiredEntryIndex] then
				local codexRequirements = game.CodexData[mod.CodexChapterName].Entries[requiredEntryName].Entries
						[requiredEntryIndex].UnlockGameStateRequirements or {}
				if not mod.ModsNikkelMHadesBiomesIsGameStateEligible(nil, codexRequirements) then
					return false
				end
			end
			-- 	if not HasCodexEntryBeenFound(requiredEntryName, requiredEntryIndex) then
			-- 		return false
			-- 	end
		end
	end

	if requirements.RequiredCodexEntriesMin ~= nil then
		if game.CalcNumCodexEntriesUnlocked() < requirements.RequiredCodexEntriesMin then
			return false
		end
	end

	if requirements.RequiresCodexFullyUnlocked ~= nil then -- not implemented in mod
		for chapterName, chapterData in pairs(game.CodexData) do
			for entryName, entryData in pairs(game.CodexData[chapterName].Entries) do
				if CodexStatus[chapterName] == nil or CodexStatus[chapterName][entryName] == nil then
					return false
				else
					for i = 1, #entryData.Entries do
						if not CodexStatus[chapterName][entryName][i] or not CodexStatus[chapterName][entryName][i].Unlocked then
							return false
						end
					end
				end
			end
		end
	end

	if requirements.RequiredGodLoot ~= nil then --
		if not game.LootData[requirements.RequiredGodLoot] then
			return false
		end

		local hasTrait = false
		for i, traitData in pairs(game.CurrentRun.Hero.Traits) do
			if game.LootData[requirements.RequiredGodLoot].TraitIndex[traitData.Name] then
				hasTrait = true
				break
			end
		end
		if not hasTrait then
			return false
		end
	end

	if requirements.RequiredLootThisRun ~= nil and not game.CurrentRun.LootTypeHistory[requirements.RequiredLootThisRun] then --
		return false
	end

	if requirements.RequiredFalseGodLoot ~= nil and game.CurrentRun.LootTypeHistory[requirements.RequiredFalseGodLoot] then --
		return false
	end
	if requirements.RequiredFalseGodLoots ~= nil then --
		for k, requiredFalseGodLoot in pairs(requirements.RequiredFalseGodLoots) do
			if game.CurrentRun.LootTypeHistory[requiredFalseGodLoot] then
				return false
			end
		end
	end

	if requirements.MinRequiredRunLootPickups ~= nil then -- not implemented in mod
		if not game.CurrentRun.LootTypeHistory[requirements.MinRequiredRunLootPickups.Name] or game.CurrentRun.LootTypeHistory[requirements.MinRequiredRunLootPickups.Name] < requirements.MinRequiredRunLootPickups.Count then
			return false
		end
	end

	if requirements.RequiredNoGodBoons ~= nil then
		for traitName in pairs(game.CurrentRun.Hero.TraitDictionary) do
			if IsGodTrait(traitName, { ForShop = true }) then
				return false
			end
		end
	end

	if requirements.MinRequiredLootPickups ~= nil then -- not used anywhere
		for requiredLoot, requiredLootPickupsCount in pairs(requirements.MinRequiredLootPickups) do
			if game.GameState.LootPickups[requiredLoot] == nil or game.GameState.LootPickups[requiredLoot] < requiredLootPickupsCount then
				return false
			end
		end
	end

	if requirements.RequiredWeapon ~= nil and not game.CurrentRun.Hero.Weapons[requirements.RequiredWeapon] then --
		return false
	end
	if requirements.RequiredAnyWeapon ~= nil then
		local anyTrue = false
		for k, name in pairs(requirements.RequiredAnyWeapon) do
			if game.CurrentRun.Hero.Weapons[name] then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredFalseWeapon ~= nil and game.CurrentRun.Hero.Weapons[requirements.RequiredFalseWeapon] then
		return false
	end
	if requirements.RequiredFalseWeaponLastRun ~= nil and prevRun ~= nil and prevRun.Hero.Weapons[requirements.RequiredFalseWeaponLastRun] then -- not used anywhere
		return false
	end

	if requirements.RequiredMinWeaponKills ~= nil then
		for requiredWeapon, requiredWeaponKillCount in pairs(requirements.RequiredMinWeaponKills) do
			if game.GameState.WeaponKills[requiredWeapon] == nil or game.GameState.WeaponKills[requiredWeapon] < requiredWeaponKillCount then
				return false
			end
		end
	end

	-- As we encode the EndingRoomName/CurrentRoom.Name for the last room into the VictoryMessage for modded runs, we need to reverse this here
	if requirements.ConsecutiveDeathsInRoom ~= nil then
		local consecutiveDeathsInRoom = 0
		-- We only count modded runs, and skip all others to retain integrity of the streak
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			if mod.HasSeenRoomEarlierInRun(game.CurrentRun, requirements.ConsecutiveDeathsInRoom.Name) then
				if not game.CurrentRun.Cleared and game.CurrentRun.EndingRoomName == requirements.ConsecutiveDeathsInRoom.Name or game.CurrentRun.ModsNikkelMHadesBiomesActualCurrentRoomName == requirements.ConsecutiveDeathsInRoom.Name then
					-- Saw the room this run and died in it, streak continues
					consecutiveDeathsInRoom = consecutiveDeathsInRoom + 1
				else
					-- Saw the room this run and didn't die in it, streak is 0
					return false
				end
			end
		end
		for i = #game.GameState.RunHistory, 1, -1 do
			local run = game.GameState.RunHistory[i]
			-- We only count modded runs, and skip all others to retain integrity of the streak
			if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
				if mod.HasSeenRoomInRun(run, requirements.ConsecutiveDeathsInRoom.Name) then
					-- For the encoded EndingRoomName for uninstall compatibility
					if not run.Cleared and run.EndingRoomName == nil and run.VictoryMessage ~= nil then
						local separatorIndex = string.find(run.VictoryMessage, "#")
						if separatorIndex ~= nil and string.sub(run.VictoryMessage, separatorIndex + 1) == requirements.ConsecutiveDeathsInRoom.Name then
							consecutiveDeathsInRoom = consecutiveDeathsInRoom + 1
						else
							-- Saw the room this run and didn't die in it, streak is broken
							break
						end
					elseif not run.Cleared and run.EndingRoomName == requirements.ConsecutiveDeathsInRoom.Name then
						-- Saw the room this run and died in it, streak continues
						consecutiveDeathsInRoom = consecutiveDeathsInRoom + 1
					else
						-- Saw the room this run and didn't die, streak is broken
						break
					end
				end
			end
		end

		if consecutiveDeathsInRoom < requirements.ConsecutiveDeathsInRoom.Count then
			return false
		end
	end

	-- As we encode the EndingRoomName/CurrentRoom.Name for the last room into the VictoryMessage for modded runs, we need to reverse this here
	if requirements.ConsecutiveClearsOfRoom ~= nil then
		local consecutiveClearsOfRoom = 0
		-- We only count modded runs, and skip all others to retain integrity of the streak
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			if mod.HasSeenRoomEarlierInRun(game.CurrentRun, requirements.ConsecutiveClearsOfRoom.Name) then
				if game.CurrentRun.Cleared or (game.CurrentRun.EndingRoomName ~= requirements.ConsecutiveClearsOfRoom.Name and game.CurrentRun.ModsNikkelMHadesBiomesActualCurrentRoomName ~= requirements.ConsecutiveClearsOfRoom.Name) then
					-- Saw the room this run and didn't die in it, streak continues
					consecutiveClearsOfRoom = consecutiveClearsOfRoom + 1
				else
					-- Saw the room this run and died in it, streak is 0
					return false
				end
			end
		end
		for i = #game.GameState.RunHistory, 1, -1 do
			local run = game.GameState.RunHistory[i]
			-- We only count modded runs, and skip all others to retain integrity of the streak
			if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
				if mod.HasSeenRoomInRun(run, requirements.ConsecutiveClearsOfRoom.Name) then
					-- For the encoded EndingRoomName for uninstall compatibility
					if not run.Cleared and run.EndingRoomName == nil and run.VictoryMessage ~= nil then
						local separatorIndex = string.find(run.VictoryMessage, "#")
						if separatorIndex ~= nil and string.sub(run.VictoryMessage, separatorIndex + 1) ~= requirements.ConsecutiveClearsOfRoom.Name then
							-- Saw the room this run and didn't die in it, streak continues
							consecutiveClearsOfRoom = consecutiveClearsOfRoom + 1
						else
							-- Saw the room this run and died in it, streak is broken
							break
						end
					elseif run.Cleared or run.EndingRoomName ~= requirements.ConsecutiveClearsOfRoom.Name then
						-- Saw the room this run and didn't die in it, streak continues
						consecutiveClearsOfRoom = consecutiveClearsOfRoom + 1
					else
						-- Saw the room this run and died in it, streak is broken
						break
					end
				end
			end
		end
		if consecutiveClearsOfRoom < requirements.ConsecutiveClearsOfRoom.Count then
			return false
		end
	end

	if requirements.RequiredFalseSeenRoomThisRun ~= nil then
		if mod.HasSeenRoomInRun(game.CurrentRun, requirements.RequiredFalseSeenRoomThisRun) then
			return false
		end
	end

	if requirements.RequiredFalseSeenRoomsThisRun ~= nil then
		for k, roomName in pairs(requirements.RequiredFalseSeenRoomsThisRun) do
			if mod.HasSeenRoomInRun(game.CurrentRun, roomName) then
				return false
			end
		end
	end

	if requirements.RequiredMinTimesSeenRoom ~= nil then
		for requiredRoom, requiredTimesSeen in pairs(requirements.RequiredMinTimesSeenRoom) do
			if game.GameState.RoomCountCache[requiredRoom] == nil or game.GameState.RoomCountCache[requiredRoom] < requiredTimesSeen then
				return false
			end
		end
	end
	if requirements.RequiredMaxTimesSeenRoom ~= nil then
		for requiredRoom, requiredTimesSeen in pairs(requirements.RequiredMaxTimesSeenRoom) do
			if game.GameState.RoomCountCache[requiredRoom] == nil or game.GameState.RoomCountCache[requiredRoom] > requiredTimesSeen then
				return false
			end
		end
	end

	if requirements.RequiredLastKilledByUnits ~= nil and not Contains(requirements.RequiredLastKilledByUnits, game.GameState.LastKilledByName) then --
		return false
	end

	if requirements.RequiredLastKilledByWeaponNames ~= nil and not Contains(requirements.RequiredLastKilledByWeaponNames, game.GameState.LastKilledByName) then --
		return false
	end

	if requirements.RequiredSlottedTrait ~= nil then -- not implemented in mod
		local hasSlot = false
		for i, traitData in pairs(game.CurrentRun.Hero.Traits) do
			if traitData.Slot == requirements.RequiredSlottedTrait then
				hasSlot = true
				break
			end
			if traitData.AltSlot and traitData.AltSlot == requirements.RequiredSlottedTrait then
				hasSlot = true
				break
			end
		end

		if not hasSlot then
			return false
		end
	end

	if requirements.RequiredTrait ~= nil and (not TraitData[requirements.RequiredTrait] or not HeroHasTrait(requirements.RequiredTrait)) then -- not implemented in mod
		return false
	end

	if requirements.RequiredOneOfTraits ~= nil then -- not implemented in mod
		local hasTrait = false
		for i, traitName in pairs(requirements.RequiredOneOfTraits) do
			if HeroHasTrait(traitName) then
				hasTrait = true
				break
			end
		end
		if not hasTrait then
			return false
		end
	end

	if requirements.RequiredAnyLastPickedTraits ~= nil then -- not implemented in mod
		local hasTrait = false
		for i, traitName in pairs(requirements.RequiredAnyLastPickedTraits) do
			if game.GameState.LastPickedTraitName == traitName then
				hasTrait = true
				break
			end
		end
		if not hasTrait then
			return false
		end
	end

	if requirements.RequiredCountOfTraits ~= nil then -- not implemented in mod
		local numTraits = 0
		for i, traitName in pairs(requirements.RequiredCountOfTraits) do
			if HeroHasTrait(traitName) then
				numTraits = numTraits + 1
			end
		end
		if numTraits < requirements.RequiredCountOfTraitsCount then
			return false
		end
	end

	if requirements.RequiredFalseTrait ~= nil and TraitData[requirements.RequiredFalseTrait] and HeroHasTrait(requirements.RequiredFalseTrait) then -- not implemented in mod
		return false
	end

	if requirements.RequiredFalseTraits ~= nil then -- not implemented in mod
		for i, traitName in pairs(requirements.RequiredFalseTraits) do
			if HeroHasTrait(traitName) then
				return false
			end
		end
	end

	if requirements.RequiredTraitCount ~= nil and requirements.RequiredTraitCount > GetTotalTraitCount(game.CurrentRun.Hero) then -- not implemented in mod
		return false
	end

	if requirements.RequiredTraitsTaken ~= nil then -- not implemented in mod
		for k, traitName in pairs(requirements.RequiredTraitsTaken) do
			if not game.GameState.TraitsTaken[traitName] then
				return false
			end
		end
	end
	if requirements.RequiredAnyTraitsTaken ~= nil then -- not implemented in mod
		local anyTrue = false
		for k, traitName in pairs(requirements.RequiredAnyTraitsTaken) do
			if game.GameState.TraitsTaken[traitName] then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredClearedWithMetaUpgrades ~= nil then -- not implemented in mod
		for k, upgradeName in pairs(requirements.RequiredClearedWithMetaUpgrades) do
			if (game.GameState.ClearedWithMetaUpgrades[upgradeName] or 0) <= 0 then
				return false
			end
		end
	end
	if requirements.RequiredRunHasOneOfTraits ~= nil and not mod.RunHasOneOfTraits(requirements.RequiredRunHasOneOfTraits) then --
		return false
	end

	if requirements.RequiredClearedWithTraits ~= nil then -- not used anywhere
		local hasClear = false
		if game.CurrentRun.Cleared and mod.RunHasTraits(game.CurrentRun, requirements.RequiredClearedWithTraits) then
			hasClear = true
		else
			for k, prevRun in pairs(game.GameState.RunHistory) do
				if prevRun.Cleared and mod.RunHasTraits(prevRun, requirements.RequiredClearedWithTraits) then
					hasClear = true
					break
				end
			end
		end
		if not hasClear then
			return false
		end
	end

	if requirements.RequiredHasEffect ~= nil and not HasEffect({ Id = game.CurrentRun.Hero.ObjectId, EffectName = requirements.RequiredHasEffect }) then --
		return false
	end
	if requirements.RequiredFalseHasEffect ~= nil and HasEffect({ Id = game.CurrentRun.Hero.ObjectId, EffectName = requirements.RequiredFalseHasEffect }) then --
		return false
	end

	if requirements.RequiredKeepsake ~= nil and game.GameState.LastAwardTrait ~= requirements.RequiredKeepsake then --
		return false
	end

	if requirements.RequiredAssistKeepsake ~= nil and game.GameState.LastAssistTrait ~= requirements.RequiredAssistKeepsake then -- not implemented in mod
		return false
	end

	if requirements.RequiredAnyAssistKeepsake ~= nil and game.GameState.LastAssistTrait == nil then -- not implemented in mod
		return false
	end

	if requirements.RequiresMaxAssistTrait ~= nil and (game.GameState.LastAssistTrait ~= requirements.RequiresMaxAssistTrait or GetAssistKeepsakeLevel(requirements.RequiresMaxAssistTrait) < 5) then -- not implemented in mod
		return false
	end

	if requirements.RequiresMaxKeepsake ~= nil and game.GameState.LastAwardTrait ~= nil and not IsKeepsakeMaxed(game.GameState.LastAwardTrait) then --
		return false
	end

	if requirements.RequiresMaxKeepsakes ~= nil then -- not used anywhere (achievement)
		if game.GameState.LastAwardTrait == nil then
			return false
		end
		for k, keepsakeName in pairs(requirements.RequiresMaxKeepsakes) do
			if not IsKeepsakeMaxed(keepsakeName) then
				return false
			end
		end
	end

	if requirements.RequiredAnyKeepsakes ~= nil and not Contains(requirements.RequiredAnyKeepsakes, game.GameState.LastAwardTrait) then --
		return false
	end

	if requirements.RequiresUsedAssistLastRoom then
		local prevRoom = GetPreviousRoom(game.CurrentRun)
		if prevRoom == nil or not prevRoom.UsedAssist then
			return false
		end
	end
	if requirements.RequiredUsedAssistInRoomThisRun ~= nil then
		for roomOrder, roomData in pairs(game.CurrentRun.RoomHistory) do
			if roomData.Name == requirements.RequiredUsedAssistInRoomThisRun and not roomData.UsedAssist then
				return false
			end
		end
	end

	if requirements.RequiredRoom ~= nil then
		if game.CurrentRun.Hero.IsDead and game.CurrentHubRoom ~= nil then
			if game.CurrentHubRoom.Name ~= requirements.RequiredRoom then
				return false
			end
		elseif game.CurrentRun.CurrentRoom.Name ~= requirements.RequiredRoom then
			return false
		end
	end

	if requirements.RequiredRooms ~= nil then
		if game.CurrentRun.Hero.IsDead and game.CurrentHubRoom ~= nil then
			if not Contains(requirements.RequiredRooms, game.CurrentHubRoom.Name) then
				return false
			end
		elseif game.CurrentRun.CurrentRoom == nil or not Contains(requirements.RequiredRooms, game.CurrentRun.CurrentRoom.Name) then
			return false
		end
	end
	if requirements.RequiredSeenRooms ~= nil then
		for k, roomName in pairs(requirements.RequiredSeenRooms) do
			if not mod.HasSeenRoom(roomName) then
				return false
			end
		end
	end
	if requirements.RequiredFalseSeenRooms ~= nil then
		for k, roomName in pairs(requirements.RequiredFalseSeenRooms) do
			if mod.HasSeenRoom(roomName) then
				return false
			end
		end
	end
	if requirements.RequiredSeenRoomsBeforeThisRun ~= nil then
		for k, roomName in pairs(requirements.RequiredSeenRoomsBeforeThisRun) do
			if not mod.HasSeenRoom(roomName, true) then
				return false
			end
		end
	end
	if requirements.RequiredFalseSeenRoomsBeforeThisRun ~= nil then
		for k, roomName in pairs(requirements.RequiredFalseSeenRoomsBeforeThisRun) do
			if mod.HasSeenRoom(roomName, true) then
				return false
			end
		end
	end
	if requirements.RequiredDeathRoom ~= nil then
		if not DidFailRun(game.CurrentRun) or game.CurrentRun.CurrentRoom.Name ~= requirements.RequiredDeathRoom then
			return false
		end
	end
	if requirements.RequiredAnyDeathRooms ~= nil then
		if not DidFailRun(game.CurrentRun) or not Contains(requirements.RequiredAnyDeathRooms, game.CurrentRun.CurrentRoom.Name) then
			return false
		end
	end
	if requirements.RequiredFalseDeathRoom ~= nil and DidFailRun(game.CurrentRun) and game.CurrentRun.CurrentRoom.Name == requirements.RequiredFalseDeathRoom then
		return false
	end
	if requirements.RequiredFalseDeathRooms ~= nil and DidFailRun(game.CurrentRun) and Contains(requirements.RequiredFalseDeathRooms, game.CurrentRun.CurrentRoom.Name) then
		return false
	end

	if requirements.RequiredAnyDeathEncounters ~= nil and game.CurrentRun.Hero.IsDead then
		if game.CurrentRun.CurrentRoom.Encounter == nil or not Contains(requirements.RequiredAnyDeathEncounters, game.CurrentRun.CurrentRoom.Encounter.Name) then
			return false
		end
	end
	if requirements.RequiredFalseDeathEncounters ~= nil and game.CurrentRun.Hero.IsDead then
		if game.CurrentRun.CurrentRoom.Encounter == nil or Contains(requirements.RequiredFalseDeathEncounters, game.CurrentRun.CurrentRoom.Encounter.Name) then
			return false
		end
	end

	if requirements.RequiresInRun then
		if game.CurrentRun.Hero.IsDead then
			return false
		end
	end
	if requirements.RequiresNotInRun then
		if not game.CurrentRun.Hero.IsDead then
			return false
		end
	end

	if requirements.CurrentRoomValueTrue ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil then
			if not game.CurrentRun.CurrentRoom[requirements.CurrentRoomValueTrue] then
				return false
			end
		end
	end
	if requirements.CurrentRoomValueFalse ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil then
			if game.CurrentRun.CurrentRoom[requirements.CurrentRoomValueFalse] then
				return false
			end
		end
	end
	if requirements.RequiredRoomValues ~= nil then
		for key, value in pairs(requirements.RequiredRoomValues) do
			if game.CurrentRun.CurrentRoom[key] ~= value then
				return false
			end
		end
	end
	if requirements.RequiredRoomMinValues ~= nil then
		for key, minValue in pairs(requirements.RequiredRoomMinValues) do
			if (game.CurrentRun.CurrentRoom[key] or 0) < minValue then
				return false
			end
		end
	end
	if requirements.RequireRoomMaxValues ~= nil then
		for key, maxValue in pairs(requirements.RequireRoomMaxValues) do
			if (game.CurrentRun.CurrentRoom[key] or 0) > maxValue then
				return false
			end
		end
	end

	if requirements.CurrentRunValueTrue ~= nil then
		if game.CurrentRun ~= nil then
			if not CurrentRun[requirements.CurrentRunValueTrue] then
				return false
			end
		end
	end
	if requirements.CurrentRunValueFalse ~= nil then
		if game.CurrentRun then
			if CurrentRun[requirements.CurrentRunValueFalse] then
				return false
			end
		end
	end
	if requirements.RequiredRunValues ~= nil then
		if game.CurrentRun then
			for key, value in pairs(requirements.RequiredRunValues) do
				if CurrentRun[key] ~= value then
					return false
				end
			end
		end
	end
	if requirements.RequiredRunMinValues ~= nil then
		if game.CurrentRun then
			for key, value in pairs(requirements.RequiredRunMinValues) do
				if (CurrentRun[key] or 0) < value then
					return false
				end
			end
		end
	end
	if requirements.RequiredRunMaxValues ~= nil then
		if game.CurrentRun then
			for key, value in pairs(requirements.RequiredRunMaxValues) do
				if (CurrentRun[key] or 0) > value then
					return false
				end
			end
		end
	end

	if requirements.CurrentEncounterValueTrue ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.Encounter ~= nil then
			if not game.CurrentRun.CurrentRoom.Encounter[requirements.CurrentEncounterValueTrue] then
				return false
			end
		end
	end
	if requirements.CurrentEncounterValueFalse ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.Encounter ~= nil then
			if game.CurrentRun.CurrentRoom.Encounter[requirements.CurrentEncounterValueFalse] then
				return false
			end
		end
	end

	if requirements.RequireOneOfEncountersSeen ~= nil then
		local hasEncounter = false
		for i, name in pairs(requirements.RequireOneOfEncountersSeen) do
			if mod.HasSeenEncounter(name) then
				hasEncounter = true
				break
			end
		end

		if not hasEncounter then
			return false
		end
	end

	if requirements.RequireEncounterCompleted ~= nil and not HasEncounterBeenCompleted(requirements.RequireEncounterCompleted) then
		return false
	end

	if requirements.RequireAnyEncounterCompleted ~= nil then
		local anyCompleted = false
		for k, encounterName in pairs(requirements.RequireAnyEncounterCompleted) do
			if HasEncounterBeenCompleted(encounterName) then
				anyCompleted = true
				break
			end
		end
		if not anyCompleted then
			return false
		end
	end

	if requirements.RequireCurrentEncounterCompleted ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.Encounter ~= nil then
			if not HasEncounterBeenCompleted(game.CurrentRun.CurrentRoom.Encounter.Name) then
				return false
			end
		end
	end

	if requirements.RequireCurrentEncounterNotComplete ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.Encounter ~= nil and game.CurrentRun.CurrentRoom.Encounter.Completed then
			return false
		end
	end

	if requirements.RequiredAnyPrevRoom ~= nil then
		local previousRoom = GetPreviousRoom(game.CurrentRun)
		if previousRoom == nil then
			return false
		end
		if not Contains(requirements.RequiredAnyPrevRoom, previousRoom.Name) then
			return false
		end
	end
	if requirements.RequiredFalsePrevRooms ~= nil then
		local previousRoom = GetPreviousRoom(game.CurrentRun)
		if previousRoom ~= nil and Contains(requirements.RequiredFalsePrevRooms, previousRoom.Name) then
			return false
		end
	end

	if requirements.RequiredMinExits ~= nil then
		if game.CurrentRun.CurrentRoom == nil or game.CurrentRun.CurrentRoom.NumExits == nil or game.CurrentRun.CurrentRoom.NumExits < requirements.RequiredMinExits then
			return false
		end
	end

	if requirements.RequiredMinOfferedRewardTypes ~= nil then
		local offeredTypes = {}
		if game.CurrentRun.CurrentRoom.OfferedRewards ~= nil then
			for k, offeredReward in pairs(game.CurrentRun.CurrentRoom.OfferedRewards) do
				if offeredReward.Type ~= nil then
					offeredTypes[offeredReward.Type] = true
				end
			end
		end
		if TableLength(offeredTypes) < requirements.RequiredMinOfferedRewardTypes then
			return false
		end
	end

	if requirements.RequiredFalseRooms ~= nil and game.CurrentRun.CurrentRoom ~= nil and Contains(requirements.RequiredFalseRooms, game.CurrentRun.CurrentRoom.Name) then
		return false
	end

	if requirements.RequiredFalseRoomSet ~= nil and game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.RoomSetName == requirements.RequiredFalseRoomSet then
		return false
	end

	if requirements.RequiredEncounters ~= nil and not Contains(requirements.RequiredEncounters, game.CurrentRun.CurrentRoom.Encounter.Name) then
		return false
	end

	if requirements.RequiredFalseEncounters ~= nil and Contains(requirements.RequiredFalseEncounters, game.CurrentRun.CurrentRoom.Encounter.Name) then
		return false
	end

	if requirements.RequiredBiome ~= nil then
		if game.CurrentRun.CurrentRoom == nil or game.CurrentRun.CurrentRoom.RoomSetName ~= requirements.RequiredBiome then
			return false
		end
	end

	if requirements.RequiredBiomes ~= nil then
		if game.CurrentRun.CurrentRoom == nil or not Contains(requirements.RequiredBiome, game.CurrentRun.CurrentRoom.RoomSetName) then
			return false
		end
	end

	if requirements.RequiredFalseBiome ~= nil then
		if game.CurrentRun.CurrentRoom == nil or game.CurrentRun.CurrentRoom.RoomSetName == requirements.RequiredFalseBiome then
			return false
		end
	end

	if requirements.RequiredEncounterActiveEnemyCapMin ~= nil and game.CurrentRun.CurrentRoom.Encounter ~= nil then
		if game.CurrentRun.CurrentRoom.Encounter.ActiveEnemyCap ~= nil and game.CurrentRun.CurrentRoom.Encounter.ActiveEnemyCap < requirements.RequiredEncounterActiveEnemyCapMin then
			return false
		end
	end

	if requirements.RequiredCompletedRuns ~= nil and (game.GameState.ModsNikkelMHadesBiomesCompletedRunsCache or 0) ~= requirements.RequiredCompletedRuns then
		return false
	end

	if requirements.RequiredFalseCompletedRuns ~= nil then
		local completedModdedRuns = 0
		for i, run in pairs(game.GameState.RunHistory) do
			if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
				completedModdedRuns = completedModdedRuns + 1
			end
		end
		if completedModdedRuns == requirements.RequiredFalseCompletedRuns then
			return false
		end
	end

	if requirements.RequiredMinCompletedRuns ~= nil then
		local completedModdedRuns = 0
		for i, run in pairs(game.GameState.RunHistory) do
			if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
				completedModdedRuns = completedModdedRuns + 1
			end
		end
		if completedModdedRuns < requirements.RequiredMinCompletedRuns then
			return false
		end
	end

	if requirements.RequiredMaxCompletedRuns ~= nil then
		local completedModdedRuns = 0
		for i, run in pairs(game.GameState.RunHistory) do
			if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
				completedModdedRuns = completedModdedRuns + 1
			end
		end
		if completedModdedRuns > requirements.RequiredMaxCompletedRuns then
			return false
		end
	end

	if requirements.RequiresRunCleared ~= nil and not game.CurrentRun.Cleared then
		return false
	end
	if requirements.RequiresRunNotCleared ~= nil and game.CurrentRun.Cleared then
		return false
	end
	if requirements.RequiresLastRunCleared ~= nil and (prevRun == nil or not prevRun.Cleared) then
		return false
	end
	if requirements.RequiresLastRunNotCleared ~= nil and prevRun ~= nil and prevRun.Cleared then
		return false
	end

	if requirements.RequiresBestClearTime and game.CurrentRun.Cleared then
		local recordTime = mod.GetFastestRunClearTime(game.CurrentRun)
		if game.CurrentRun.GameplayTime > recordTime then
			return false
		end
	end

	if requirements.RequiresBestClearTimeLastRun and prevRun ~= nil and prevRun.Cleared then
		local recordTime = mod.GetFastestRunClearTime(prevRun)
		if prevRun.GameplayTime > recordTime then
			return false
		end
	end

	if requirements.RequiredMinClearTime ~= nil and mod.GetFastestRunClearTime(game.CurrentRun) > requirements.RequiredMinClearTime then
		return false
	end

	if requirements.RequiredCurrentClearTimeMin ~= nil and game.CurrentRun.GameplayTime < requirements.RequiredCurrentClearTimeMin then
		return false
	end

	if requirements.RequiredCurrentClearTimeMax ~= nil and game.CurrentRun.GameplayTime > requirements.RequiredCurrentClearTimeMax then
		return false
	end

	if requirements.RequiredWeaponsFiredThisRun ~= nil then
		local totalFires = 0
		for k, weaponName in pairs(requirements.RequiredWeaponsFiredThisRun.Names) do
			totalFires = totalFires + (game.CurrentRun.WeaponsFiredRecord[weaponName] or 0)
		end
		if totalFires < requirements.RequiredWeaponsFiredThisRun.Count then
			return false
		end
	end

	if requirements.RequiredClearsWithWeapons ~= nil then
		for k, weaponName in pairs(requirements.RequiredClearsWithWeapons.Names) do
			if (game.GameState.TimesClearedWeapon[weaponName] or 0) <= 0 then
				return false
			end
			if requirements.RequiredClearsWithWeapons.ShrinePoints ~= nil and (game.GameState.WeaponRecordsShrinePoints[weaponName] or 0) <= requirements.RequiredClearsWithWeapons.ShrinePoints then
				return false
			end
			if requirements.RequiredClearsWithWeapons.ClearTime ~= nil and (game.GameState.WeaponRecordsClearTime[weaponName] or 999999) > requirements.RequiredClearsWithWeapons.ClearTime then
				return false
			end
		end
	end

	if requirements.RequiredMinBountiesEarned and game.TableLength(game.GameState.ShrineBountiesCompleted) < requirements.RequiredMinBountiesEarned then
		return false
	end

	if requirements.ReachedShrineSoftCapWithWeaponName ~= nil then -- and GetCurrentRunClearedShrinePointThreshold(requirements.ReachedShrineSoftCapWithWeaponName) <= GetMaximumAllocatableShrinePoints() then
		return false
	end

	if requirements.ReachedShrineSoftCapWithAnyWeaponName ~= nil then
		return false
	end
	-- if requirements.ReachedShrineSoftCapWithAnyWeaponName ~= nil then
	-- 	local anyWeapon = false
	-- 	for i, weaponName in ipairs(WeaponSets.HeroMeleeWeapons) do
	-- 		if GetCurrentRunClearedShrinePointThreshold(weaponName) > GetMaximumAllocatableShrinePoints() then
	-- 			anyWeapon = true
	-- 		end
	-- 	end
	-- 	if not anyWeapon then
	-- 		return false
	-- 	end
	-- end

	if requirements.ReachedShrineSoftCapWithAllWeapons ~= nil then
		return false
	end
	-- if requirements.ReachedShrineSoftCapWithAllWeapons ~= nil then
	-- 	local allWeapons = true
	-- 	for i, weaponName in ipairs(WeaponSets.HeroMeleeWeapons) do
	-- 		if allWeapons and GetCurrentRunClearedShrinePointThreshold(weaponName) <= GetMaximumAllocatableShrinePoints() then
	-- 			allWeapons = false
	-- 		end
	-- 	end
	-- 	if not allWeapons then
	-- 		return false
	-- 	end
	-- end

	if requirements.RequiresLessThanTargetShrinePointThreshold ~= nil then -- and game.GameState.SpentShrinePointsCache and (game.GameState.SpentShrinePointsCache >= GetShrinePointLimit() or GetCurrentRunClearedShrinePointThreshold(GetEquippedWeapon()) > GetMaximumAllocatableShrinePoints()) then
		return false
	end

	if requirements.RequiresShrinePointsAtThreshold ~= nil then -- and game.GameState.SpentShrinePointsCache and (game.GameState.SpentShrinePointsCache ~= GetShrinePointLimit() or GetCurrentRunClearedShrinePointThreshold(GetEquippedWeapon()) > GetMaximumAllocatableShrinePoints()) then
		return false
	end

	if requirements.RequiredMinShrinePointsAboveThreshold ~= nil then -- and game.GameState.SpentShrinePointsCache and (game.GameState.SpentShrinePointsCache - GetShrinePointLimit()) < requirements.RequiredMinShrinePointsAboveThreshold then
		return false
	end

	if requirements.RequiredActiveShrinePointsMax ~= nil and game.GameState.SpentShrinePointsCache and game.GameState.SpentShrinePointsCache > requirements.RequiredActiveShrinePointsMax then
		return false
	end

	if requirements.RequiredActiveShrinePointsMin ~= nil and game.GameState.SpentShrinePointsCache and game.GameState.SpentShrinePointsCache < requirements.RequiredActiveShrinePointsMin then
		return false
	end

	local lastRunShrinePoints = 0
	if prevRun and prevRun.ShrinePointsCache then
		lastRunShrinePoints = prevRun.ShrinePointsCache
	end

	if requirements.RequiresMoreActiveShrinePointsThanPrevRun and game.GameState.SpentShrinePointsCache <= lastRunShrinePoints then
		return false
	end

	if requirements.RequiresLessActiveShrinePointsThanPrevRun and game.GameState.SpentShrinePointsCache >= lastRunShrinePoints then
		return false
	end

	if requirements.RequiredAtLeastShrinePointClear ~= nil and mod.GetHighestShrinePointRunClear(game.CurrentRun) < requirements.RequiredAtLeastShrinePointClear then
		return false
	end

	if requirements.RequiredAtMostShrinePointClear ~= nil and mod.GetHighestShrinePointRunClear(game.CurrentRun) > requirements.RequiredAtMostShrinePointClear then
		return false
	end

	if requirements.RequiredMinShrinePointThresholdClear ~= nil then
		return false
	end
	-- if requirements.RequiredMinShrinePointThresholdClear ~= nil then
	-- 	local recordShrinePoints = GetHighestRunClearShrinePointThreshold()
	-- 	if requirements.RequiredMinShrinePointThresholdClear > recordShrinePoints then
	-- 		return false
	-- 	end
	-- end
	if requirements.RequiredMaxShrinePointThresholdClear ~= nil then
		return false
	end
	-- if requirements.RequiredMaxShrinePointThresholdClear ~= nil then
	-- 	local recordShrinePoints = GetHighestRunClearShrinePointThreshold()
	-- 	if requirements.RequiredMaxShrinePointThresholdClear <= recordShrinePoints then
	-- 		return false
	-- 	end
	-- end

	if requirements.RequiredWeaponsUnlocked ~= nil then
		for k, weaponName in pairs(requirements.RequiredWeaponsUnlocked) do
			if not IsWeaponUnlocked(weaponName) then
				return false
			end
		end
	end
	if requirements.RequiredAnyWeaponsUnlocked ~= nil then
		local anyTrue = false
		for k, weaponName in pairs(requirements.RequiredAnyWeaponsUnlocked) do
			if IsWeaponUnlocked(weaponName) then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredMinUnlockedWeaponEnchantments ~= nil then -- and GetNumUnlockedWeaponUpgrades() < requirements.RequiredMinUnlockedWeaponEnchantments then
		return false
	end
	if requirements.RequiredMaxUnlockedWeaponEnchantments ~= nil then -- and GetNumUnlockedWeaponUpgrades() > requirements.RequiredMaxUnlockedWeaponEnchantments then
		return false
	end
	if requirements.RequiredMinMaxedWeaponEnchantments then -- and GetNumMaxedWeaponUpgrades() < requirements.RequiredMinMaxedWeaponEnchantments then
		return false
	end
	if requirements.RequiredMaxMaxedWeaponEnchantments then -- and GetNumMaxedWeaponUpgrades() > requirements.RequiredMinMaxedWeaponEnchantments then
		return false
	end

	if requirements.RequiredUniqueGodTraitsTaken ~= nil then -- and GetNumUniqueGodTraitsTaken() < requirements.RequiredUniqueGodTraitsTaken then
		return false
	end

	if requirements.RequiredUniqueWeaponUpgradesTaken ~= nil then -- and GetNumUniqueWeaponUpgradesTaken() < requirements.RequiredUniqueWeaponUpgradesTaken then
		return false
	end

	if requirements.RequiredMinSuperLockKeysSpentOnWeapon ~= nil then
		return false
	end
	-- if requirements.RequiredMinSuperLockKeysSpentOnWeapon ~= nil then
	-- 	local totalInvestment = 0
	-- 	local weaponName = requirements.RequiredMinSuperLockKeysSpentOnWeapon.Name
	-- 	for index in pairs(WeaponUpgradeData[weaponName]) do
	-- 		for level = 1, (GetWeaponUpgradeLevel(weaponName, index)) do
	-- 			totalInvestment = totalInvestment + (WeaponUpgradeData[weaponName][index].Costs[level] or 0)
	-- 		end
	-- 	end
	-- 	if totalInvestment < requirements.RequiredMinSuperLockKeysSpentOnWeapon.Count then
	-- 		return false
	-- 	end
	-- end

	if requirements.RequiredMaxWeaponUpgrade ~= nil and requirements.RequiredMaxWeaponUpgradeIndex ~= nil then
		if not IsWeaponUpgradeAtMax(requirements.RequiredMaxWeaponUpgrade) then
			return false
		end
	end
	if requirements.RequiredFalseMaxWeaponUpgrade ~= nil and requirements.RequiredFalseMaxWeaponUpgradeIndex ~= nil then
		if IsWeaponUpgradeAtMax(requirements.RequiredFalseMaxWeaponUpgrade) then
			return false
		end
	end

	if requirements.RequiredLastInteractedWeaponUpgrade ~= nil then
		return false
	end
	-- if requirements.RequiredLastInteractedWeaponUpgrade ~= nil and (game.GameState.LastWeaponUpgradeName == nil or GetWeaponUpgradeTrait(game.GameState.LastWeaponUpgradeName.WeaponName) ~= requirements.RequiredLastInteractedWeaponUpgrade) then
	-- 	return false
	-- end

	if requirements.RequiredLastInteractedWeaponName ~= nil and (game.GameState.LastWeaponUpgradeName == nil or game.GameState.LastWeaponUpgradeName.WeaponName ~= requirements.RequiredLastInteractedWeaponName) then
		return false
	end

	if requirements.RequiredLastInteractedWeaponUpgradeMinLevel ~= nil
			and game.GameState.LastWeaponUpgradeName ~= nil
			and GetWeaponUpgradeLevel(game.GameState.LastWeaponUpgradeName.WeaponName) < requirements.RequiredLastInteractedWeaponUpgradeMinLevel then
		return false
	end

	if requirements.RequiredLastInteractedWeaponUpgradeMaxLevel ~= nil
			and game.GameState.LastWeaponUpgradeName ~= nil
			and GetWeaponUpgradeLevel(game.GameState.LastWeaponUpgradeName.WeaponName) > requirements.RequiredLastInteractedWeaponUpgradeMaxLevel then
		return false
	end

	if requirements.RequiredLastInteractedWeaponUpgradeMaxed ~= nil then
		return false
	end
	-- if requirements.RequiredLastInteractedWeaponUpgradeMaxed ~= nil then
	-- 	if game.GameState.LastWeaponUpgradeName == nil then
	-- 		return false
	-- 	end

	-- 	if GetWeaponUpgradeLevel(game.GameState.LastWeaponUpgradeName.WeaponName, game.GameState.LastWeaponUpgradeName.ItemIndex) < WeaponUpgradeData[game.GameState.LastWeaponUpgradeName.WeaponName][game.GameState.LastWeaponUpgradeName.ItemIndex].MaxUpgradeLevel then
	-- 		return false
	-- 	end
	-- end

	if requirements.RequiredInactiveMetaUpgrade ~= nil and GetNumShrineUpgrades(requirements.RequiredInactiveMetaUpgrade) > 0 then
		return false
	end
	if requirements.RequiredActiveMetaUpgrade ~= nil and GetNumShrineUpgrades(requirements.RequiredActiveMetaUpgrade) < 1 then
		return false
	end

	if requirements.RequiredMetaUpgradeSelected ~= nil then
		return false
	end
	-- if requirements.RequiredMetaUpgradeSelected ~= nil then
	-- 	local upgradeName = requirements.RequiredMetaUpgradeSelected
	-- 	local metaUpgradeFound = false

	-- 	local nulledMetaUpgradeCount = GetNulledMetaUpgradeCount()
	-- 	for k, selectedUpgradeName in pairs(game.GameState.MetaUpgradesSelected) do
	-- 		if k > (#MetaUpgradeOrder - nulledMetaUpgradeCount) then
	-- 			if MetaUpgradeOrder[k][1] == upgradeName then
	-- 				metaUpgradeFound = true
	-- 			end
	-- 		elseif selectedUpgradeName == upgradeName then
	-- 			metaUpgradeFound = true
	-- 			break
	-- 		end
	-- 	end
	-- 	if not metaUpgradeFound then
	-- 		return false
	-- 	end
	-- end

	if requirements.RequiredMinActiveMetaUpgradeLevel ~= nil then
		if GetNumShrineUpgrades(requirements.RequiredMinActiveMetaUpgradeLevel.Name) < requirements.RequiredMinActiveMetaUpgradeLevel.Count then
			return false
		end
	end

	if requirements.RequiredMaxActiveMetaUpgradeLevel ~= nil then
		if GetNumShrineUpgrades(requirements.RequiredMaxActiveMetaUpgradeLevel.Name) > requirements.RequiredMaxActiveMetaUpgradeLevel.Count then
			return false
		end
	end

	if requirements.RequiredActiveMetaUpgradeLevel ~= nil then
		if GetNumShrineUpgrades(requirements.RequiredActiveMetaUpgradeLevel.Name) ~= requirements.RequiredActiveMetaUpgradeLevel.Count then
			return false
		end
	end

	-- if requirements.RequiredAllMetaUpgradesInvestment ~= nil then
	-- 	if not game.GameState.MetaUpgradeState then
	-- 		return false
	-- 	end

	-- 	for metaupgradeName, data in pairs(game.MetaUpgradeData) do
	-- 		-- for s, metaupgradeName in pairs(data) do
	-- 		if not game.GameState.MetaUpgradeState[metaupgradeName] and not game.GameState.MetaUpgrades[metaupgradeName] then
	-- 			return false
	-- 		end
	-- 		local investment = game.GameState.MetaUpgradeState[metaupgradeName] or 0
	-- 		if mod.IsMetaUpgradeActive(metaupgradeName) then
	-- 			investment = game.GameState.MetaUpgrades[metaupgradeName] or 0
	-- 		end

	-- 		if investment < requirements.RequiredAllMetaUpgradesInvestment then
	-- 			return false
	-- 		end
	-- 	end
	-- 	-- end
	-- end

	-- if requirements.RequiredAllMetaUpgradesMaxed ~= nil then
	-- 	if not game.GameState.MetaUpgradeState then
	-- 		return false
	-- 	end

	-- 	for metaupgradeName, data in pairs(game.MetaUpgradeData) do
	-- 		-- for s, metaupgradeName in pairs(data) do
	-- 		if not game.GameState.MetaUpgradeState[metaupgradeName] and not game.GameState.MetaUpgrades[metaupgradeName] then
	-- 			return false
	-- 		end
	-- 		local investment = game.GameState.MetaUpgradeState[metaupgradeName] or 0
	-- 		if mod.IsMetaUpgradeActive(metaupgradeName) then
	-- 			investment = game.GameState.MetaUpgrades[metaupgradeName] or 0
	-- 		end

	-- 		if MetaUpgradeData[metaupgradeName].MaxInvestment then
	-- 			if investment < MetaUpgradeData[metaupgradeName].MaxInvestment then
	-- 				return false
	-- 			end
	-- 		elseif MetaUpgradeData[metaupgradeName].CostTable then
	-- 			if MetaUpgradeData[metaupgradeName].CostTable[investment + 1] then
	-- 				return false
	-- 			end
	-- 		end
	-- 	end
	-- 	-- end
	-- end

	if requirements.RequiredTextLinesPerMetaUpgradeLevel ~= nil then
		if GetNumShrineUpgrades(requirements.RequiredTextLinesPerMetaUpgradeLevel.MetaUpgradeName) >= requirements.RequiredTextLinesPerMetaUpgradeLevel.Count then
			for k, textLineSet in pairs(requirements.RequiredTextLinesPerMetaUpgradeLevel.TextLines) do
				if game.GameState.TextLinesRecord[textLineSet] == nil then
					return false
				end
			end
		end
	end

	game.CurrentRun.SupportAINames = game.CurrentRun.SupportAINames or {}
	if requirements.RequiredSupportAINames ~= nil then
		for k, requiredSupportAIName in pairs(requirements.RequiredSupportAINames) do
			if not game.CurrentRun.SupportAINames[requiredSupportAIName] then
				return false
			end
		end
	end
	if requirements.RequiredFalseSupportAINames ~= nil then
		for k, requiredSupportAIName in pairs(requirements.RequiredFalseSupportAINames) do
			if game.CurrentRun.SupportAINames[requiredSupportAIName] then
				return false
			end
		end
	end
	if requirements.RequiredMinSupportAINames ~= nil then
		local supportAINames = {}
		for enemyId, enemy in pairs(game.ActiveEnemies) do
			ConcatTableValues(supportAINames, enemy.SupportAINames)
		end
		if TableLength(supportAINames) < requirements.RequiredMinSupportAINames then
			return false
		end
	end
	if requirements.RequiredMaxSupportAINames ~= nil then
		local supportAINames = {}
		for enemyId, enemy in pairs(game.ActiveEnemies) do
			ConcatTableValues(supportAINames, enemy.SupportAINames)
		end
		if TableLength(supportAINames) > requirements.RequiredMaxSupportAINames then
			return false
		end
	end

	if requirements.MaxUnitsByType ~= nil then
		for name, count in pairs(requirements.MaxUnitsByType) do
			if #GetIdsByType({ Name = name }) >= count then
				return false
			end
		end
	end

	if requirements.RequiredRunDepth ~= nil and currentRunDepth ~= requirements.RequiredRunDepth then
		return false
	end

	if requirements.RequiredMinDepth ~= nil and currentRunDepth < requirements.RequiredMinDepth then
		return false
	end

	if requirements.RequiredMaxDepth ~= nil and currentRunDepth >= requirements.RequiredMaxDepth then
		return false
	end

	if requirements.RequiredBiomeDepth ~= nil and currentBiomeDepth ~= requirements.RequiredBiomeDepth then
		return false
	end

	if requirements.RequiresGreaterThanPrevRunDepth ~= nil and prevRun ~= nil then
		if currentRunDepth <= prevRun.RunDepthCache then
			return false
		end
	end

	if not args.SkipMinBiomeDepth and (game.CurrentRun.CurrentRoom == nil or not game.CurrentRun.CurrentRoom.SkipMinBiomeDepthRequirements) and requirements.RequiredMinBiomeDepth ~= nil and currentBiomeDepth < requirements.RequiredMinBiomeDepth then
		return false
	end

	if requirements.EliteShrineUpgradeMinBiomeDepth ~= nil and requirements.IsElite and GetNumShrineUpgrades("EnemyEliteShrineUpgrade") > 0 then
		if currentBiomeDepth < requirements.EliteShrineUpgradeMinBiomeDepth then
			return false
		end
	end

	if requirements.RequiredMaxBiomeDepth ~= nil and currentBiomeDepth > requirements.RequiredMaxBiomeDepth then
		return false
	end

	if game.CurrentRun.WingDepth ~= nil then
		if requirements.RequiredMinWingDepth ~= nil and game.CurrentRun.WingDepth < requirements.RequiredMinWingDepth then
			return false
		end
		if requirements.RequiredMaxWingDepth ~= nil and game.CurrentRun.WingDepth > requirements.RequiredMaxWingDepth then
			return false
		end
	end

	if requirements.RequiredLastLinePlayed ~= nil and not Contains(requirements.RequiredLastLinePlayed, game.LastLinePlayed) then
		return false
	end

	-- Helper function to translate voiceline IDs from Hades I to Hades II
	local function TranslateVoiceLine(voiceLine)
		if type(voiceLine) ~= "string" then
			return voiceLine
		end

		local translated = voiceLine:gsub("/VO/Storyteller_", "/VO/Megaera_0")
		translated = translated:gsub("/VO/Charon_", "/VO/Megaera_1")
		translated = translated:gsub("/VO/Persephone_", "/VO/Megaera_2")

		return translated
	end

	if requirements.RequiredPlayed ~= nil then
		if type(requirements.RequiredPlayed) ~= "table" then
			local translatedVoiceLine = TranslateVoiceLine(requirements.RequiredPlayed)
			if game.GameState.SpeechRecord[translatedVoiceLine] == nil then
				return false
			end
		else
			for k, voiceLine in pairs(requirements.RequiredPlayed) do
				local translatedVoiceLine = TranslateVoiceLine(voiceLine)
				if game.GameState.SpeechRecord[translatedVoiceLine] == nil then
					return false
				end
			end
		end
	end
	if requirements.RequiredFalsePlayed ~= nil then
		for k, voiceLine in pairs(requirements.RequiredFalsePlayed) do
			local translatedVoiceLine = TranslateVoiceLine(voiceLine)
			if game.GameState.SpeechRecord[translatedVoiceLine] ~= nil then
				return false
			end
		end
	end

	if requirements.RequiredPlayedThisRun ~= nil then
		for k, voiceLine in pairs(requirements.RequiredPlayedThisRun) do
			local translatedVoiceLine = TranslateVoiceLine(voiceLine)
			if not game.CurrentRun.SpeechRecord[translatedVoiceLine] then
				return false
			end
		end
	end
	if requirements.RequiredAnyPlayedThisRun ~= nil then
		local anyTrue = false
		for k, voiceLine in pairs(requirements.RequiredAnyPlayedThisRun) do
			local translatedVoiceLine = TranslateVoiceLine(voiceLine)
			if Contains(game.CurrentRun.SpeechRecord, translatedVoiceLine) then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end
	if requirements.RequiredFalsePlayedThisRun ~= nil then
		for k, voiceLine in pairs(requirements.RequiredFalsePlayedThisRun) do
			local translatedVoiceLine = TranslateVoiceLine(voiceLine)
			if game.CurrentRun.SpeechRecord[translatedVoiceLine] then
				return false
			end
		end
	end
	if requirements.RequiredFalsePlayedLastRun ~= nil and prevRun ~= nil then
		for k, voiceLine in pairs(requirements.RequiredFalsePlayedLastRun) do
			local translatedVoiceLine = TranslateVoiceLine(voiceLine)
			if prevRun.SpeechRecord ~= nil and prevRun.SpeechRecord[translatedVoiceLine] then
				return false
			end
		end
	end

	if requirements.RequiredPlayedThisRoom ~= nil then
		local translatedLines = {}
		for k, voiceLine in pairs(requirements.RequiredPlayedThisRoom) do
			table.insert(translatedLines, TranslateVoiceLine(voiceLine))
		end
		if not ContainsAny(translatedLines, game.CurrentRun.CurrentRoom.SpeechRecord) then
			return false
		end
	end

	if requirements.RequiredFalsePlayedThisRoom ~= nil then
		local translatedLines = {}
		for k, voiceLine in pairs(requirements.RequiredFalsePlayedThisRoom) do
			table.insert(translatedLines, TranslateVoiceLine(voiceLine))
		end
		if ContainsAny(translatedLines, game.CurrentRun.CurrentRoom.SpeechRecord) then
			return false
		end
	end

	if requirements.RequiredRoomThisRun ~= nil then
		local roomData = RoomData[requirements.RequiredRoomThisRun]
		if roomData == nil or game.CurrentRun.RoomCountCache[roomData.Name] == nil or game.CurrentRun.RoomCountCache[roomData.Name] <= 0 then
			return false
		end
	end
	if requirements.RequiredRoomsThisRun ~= nil then
		for k, roomName in pairs(requirements.RequiredRoomsThisRun) do
			if game.CurrentRun.RoomCountCache[roomName] == nil or game.CurrentRun.RoomCountCache[roomName] == 0 then
				return false
			end
		end
	end
	if requirements.RequiredAnyRoomsThisRun ~= nil then
		local anyTrue = false
		for k, roomName in pairs(requirements.RequiredAnyRoomsThisRun) do
			if game.CurrentRun.RoomCountCache[roomName] ~= nil and game.CurrentRun.RoomCountCache[roomName] >= 1 then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredRoomLastRun ~= nil then
		local roomData = RoomData[requirements.RequiredRoomLastRun]
		if roomData == nil or prevRun == nil or prevRun.RoomCountCache[roomData.Name] == nil or prevRun.RoomCountCache[roomData.Name] < 1 then
			return false
		end
	end
	if requirements.RequiredAnyRoomsLastRun ~= nil then
		local anyTrue = false
		if prevRun == nil then
			return false
		end
		for k, roomName in pairs(requirements.RequiredAnyRoomsLastRun) do
			if prevRun.RoomCountCache[roomName] ~= nil and prevRun.RoomCountCache[roomName] >= 1 then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end
	if requirements.RequiredFalseRoomLastRun ~= nil then
		local roomData = RoomData[requirements.RequiredFalseRoomLastRun]
		if roomData ~= nil and prevRun ~= nil and prevRun.RoomCountCache[roomData.Name] ~= nil and prevRun.RoomCountCache[roomData.Name] > 0 then
			return false
		end
	end

	if requirements.RequiredEncounterThisRun ~= nil then
		if not HasEncounterOccurred(game.CurrentRun, requirements.RequiredEncounterThisRun) then
			return false
		end
	end

	if requirements.RequiredEncountersThisRun ~= nil then
		for k, encounterName in pairs(requirements.RequiredEncountersThisRun) do
			if not HasEncounterOccurred(game.CurrentRun, encounterName, true) then
				return false
			end
		end
	end

	if requirements.RequiredAnyEncountersThisRun ~= nil then
		local anyTrue = false
		for k, encounterName in pairs(requirements.RequiredAnyEncountersThisRun) do
			if HasEncounterOccurred(game.CurrentRun, encounterName, true) then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredSeenEncounter ~= nil then
		if not mod.HasSeenEncounter(requirements.RequiredSeenEncounter) then
			return false
		end
	end

	if requirements.RequiredCompletedEncounter ~= nil then
		if not HasEncounterOccurred(game.CurrentRun, requirements.RequiredCompletedEncounter, true) then
			return false
		end
	end

	if requirements.RequiredMinEncountersThisRun ~= nil then
		local count = 0
		for k, encounterName in pairs(requirements.RequiredMinEncountersThisRun.Names) do
			count = count + (game.CurrentRun.EncountersCompletedCache[encounterName] or 0)
		end
		if count < requirements.RequiredMinEncountersThisRun.Count then
			return false
		end
	end

	if requirements.RequiredKillEnemiesFound and IsEmpty(game.RequiredKillEnemies) then
		return false
	end

	if requirements.RequiredKillEnemiesNotFound ~= nil and not IsEmpty(game.RequiredKillEnemies) then
		return false
	end

	if requirements.RequiredMinKillEnemies and TableLength(game.RequiredKillEnemies) < requirements.RequiredMinKillEnemies then
		return false
	end

	if requirements.RequiredAnyActiveEnemyTypes and game.ActiveEnemies ~= nil then
		local anyTrue = false
		for k, enemy in pairs(game.ActiveEnemies) do
			if Contains(requirements.RequiredAnyActiveEnemyTypes, enemy.Name) then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredUnitAlive ~= nil then
		local unitId = GetClosestUnitOfType({
			Id = game.CurrentRun.Hero.ObjectId,
			DestinationName = requirements.RequiredUnitAlive
		})
		if not IsAlive({ Id = unitId }) then
			return false
		end
	end
	if requirements.RequiredAnyUnitAlive ~= nil then
		local anyTrue = false
		for k, requiredUnit in pairs(requirements.RequiredAnyUnitAlive) do
			local unitId = GetClosestUnitOfType({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = requiredUnit })
			if IsAlive({ Id = unitId }) then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end
	if requirements.RequiredUnitNotAlive ~= nil then
		local unitId = GetClosestUnitOfType({
			Id = game.CurrentRun.Hero.ObjectId,
			DestinationName = requirements.RequiredUnitNotAlive
		})
		if IsAlive({ Id = unitId }) then
			return false
		end
	end
	if requirements.RequiredUnitsNotAlive ~= nil then
		for k, unit in pairs(requirements.RequiredUnitsNotAlive) do
			local unitId = GetClosestUnitOfType({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = unit })
			if IsAlive({ Id = unitId }) then
				return false
			end
		end
	end

	if requirements.RequiredUnitNotDead ~= nil then
		local unitId = GetClosestUnitOfType({
			Id = game.CurrentRun.Hero.ObjectId,
			DestinationName = requirements.RequiredUnitNotDead
		})
		if game.ActiveEnemies[unitId] == nil or game.ActiveEnemies[unitId].IsDead then
			return false
		end
	end

	if requirements.RequiredAnyUnitNotDead ~= nil then
		local anyTrue = false
		for k, requiredUnit in pairs(requirements.RequiredAnyUnitNotDead) do
			local unitId = GetClosestUnitOfType({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = requiredUnit })
			if game.ActiveEnemies[unitId] ~= nil and not game.ActiveEnemies[unitId].IsDead then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredMainWeapon ~= nil and not game.CurrentRun.Hero.Weapons[requirements.RequiredMainWeapon] then
		return false
	end

	if requirements.RequiredMetaUpgradeUnlocked ~= nil and not game.GameState.MetaUpgradesUnlocked[requirements.RequiredMetaUpgradeUnlocked] then
		return false
	end
	if requirements.RequiredMetaUpgradeStageUnlocked ~= nil and game.GameState.MetaUpgradeStagesUnlocked < requirements.RequiredMetaUpgradeStageUnlocked then
		return false
	end

	if requirements.RequiredWeaponsUnlocked ~= nil then
		for k, weaponName in pairs(requirements.RequiredWeaponsUnlocked) do
			if not game.GameState.WeaponsUnlocked[weaponName] then
				return false
			end
		end
	end
	if requirements.RequiredFalseWeaponsUnlocked ~= nil then
		for k, weaponName in pairs(requirements.RequiredFalseWeaponsUnlocked) do
			if game.GameState.WeaponsUnlocked[weaponName] then
				return false
			end
		end
	end

	if requirements.RequiredMinRunsWithWeapons ~= nil then
		for weaponName, runCount in pairs(requirements.RequiredMinRunsWithWeapons) do
			local count = 0
			for k, run in pairs(game.GameState.RunHistory) do
				if run.WeaponsCache ~= nil and run.WeaponsCache[weaponName] then
					count = count + 1
				end
			end
			if count < runCount then
				return false
			end
		end
	end
	if requirements.RequiredMaxRunsWithWeapons ~= nil then
		for weaponName, runCount in pairs(requirements.RequiredMaxRunsWithWeapons) do
			local count = 0
			for k, run in pairs(game.GameState.RunHistory) do
				if run.WeaponsCache ~= nil and run.WeaponsCache[weaponName] then
					count = count + 1
				end
			end
			if count > runCount then
				return false
			end
		end
	end

	if requirements.RequiredMinAwardTraits ~= nil and UIData.AwardMenu.AvailableTraits ~= nil then
		local numAwardTraits = 0
		for itemIndex, upgradeData in ipairs(UIData.AwardMenu.AvailableTraits) do
			if upgradeData.Unlocked then
				numAwardTraits = numAwardTraits + 1
			end
		end
		if requirements.RequiredMinAwardTraits > numAwardTraits then
			return false
		end
	end

	if requirements.RequiredFalseLootPickup ~= nil and game.GameState.LootPickups[requirements.RequiredFalseLootPickup] ~= nil then
		return false
	end

	if requirements.RequiredOnlyNotPickedUp ~= nil then
		if game.GameState.LootPickups[requirements.RequiredOnlyNotPickedUp] then
			return false
		end

		local eligibleLootNames = OrderedKeysToList(game.LootData) or {}
		local output = {}
		for i, lootName in pairs(eligibleLootNames) do
			local lootData = game.LootData[lootName]
			if not lootData.DebugOnly and lootData.GodLoot and not game.GameState.LootPickups[lootName] and lootName ~= requirements.RequiredOnlyNotPickedUp and lootName ~= requirements.RequiredOnlyNotPickedUpIgnoreName then
				return false
			end
		end
	end

	if requirements.RequiredLootChoices ~= nil and requirements.RequiredLootChoices ~= CalcNumLootChoices() then
		return false
	end

	if requirements.RequiredMinNumLockedWeapons ~= nil and GetNumLockedWeapons() < requirements.RequiredMinNumLockedWeapons then
		return false
	end

	if requirements.RequiredMinTotalKills ~= nil and (game.GameState.TotalRequiredEnemyKills == nil or game.GameState.TotalRequiredEnemyKills < requirements.RequiredMinTotalKills) then
		return false
	end

	if requirements.RequiredKills ~= nil then
		for requiredKill, requiredKillCount in pairs(requirements.RequiredKills) do
			if game.GameState.EnemyKills[requiredKill] == nil or game.GameState.EnemyKills[requiredKill] < requiredKillCount then
				return false
			end
		end
	end

	if requirements.RequiredFalseKills ~= nil then
		for k, requiredKill in pairs(requirements.RequiredFalseKills) do
			if game.GameState.EnemyKills[requiredKill] ~= nil and game.GameState.EnemyKills[requiredKill] > 0 then
				return false
			end
		end
	end

	if requirements.RequiredEliteAttributeKills ~= nil then
		for requiredKill, requiredKillCount in pairs(requirements.RequiredEliteAttributeKills) do
			if (game.GameState.EnemyEliteAttributeKills[requiredKill] or 0) < requiredKillCount then
				return false
			end
		end
	end

	if requirements.RequiredKillsThisRun ~= nil then
		local numKillsThisRun = 0
		for k, requiredKill in pairs(requirements.RequiredKillsThisRun) do
			for roomOrder, room in pairs(game.CurrentRun.RoomHistory) do
				if room.Kills ~= nil and room.Kills[requiredKill] ~= nil then
					numKillsThisRun = numKillsThisRun + room.Kills[requiredKill]
				end
			end
		end
		if numKillsThisRun <= 0 then
			return false
		end
	end
	if requirements.RequiredFalseKillsThisRun ~= nil then
		local numKillsThisRun = 0
		for k, requiredKill in pairs(requirements.RequiredFalseKillsThisRun) do
			for roomOrder, room in pairs(game.CurrentRun.RoomHistory) do
				if room.Kills ~= nil and room.Kills[requiredKill] ~= nil then
					numKillsThisRun = numKillsThisRun + room.Kills[requiredKill]
				end
			end
		end
		if numKillsThisRun > 0 then
			return false
		end
	end

	if requirements.RequiredAnyKillsThisRun ~= nil then
		local anyKills = false
		for k, requiredKill in pairs(requirements.RequiredAnyKillsThisRun) do
			for roomOrder, room in pairs(game.CurrentRun.RoomHistory) do
				if room.Kills ~= nil and room.Kills[requiredKill] ~= nil then
					anyKills = true
					break
				end
			end
		end
		if not anyKills then
			return false
		end
	end

	if requirements.RequiredKillsLastRun ~= nil then
		if prevRun == nil then
			return false
		end
		local numKillsLastRun = 0
		for k, requiredKill in pairs(requirements.RequiredKillsLastRun) do
			if prevRun.EnemyKills ~= nil and prevRun.EnemyKills[requiredKill] ~= nil then
				numKillsLastRun = numKillsLastRun + prevRun.EnemyKills[requiredKill]
			end
		end
		if numKillsLastRun <= 0 then
			return false
		end
	end

	if requirements.RequiredBossPhase ~= nil and game.ActiveEnemies[game.CurrentRun.CurrentRoom.BossId] ~= nil then
		local boss = game.ActiveEnemies[game.CurrentRun.CurrentRoom.BossId]
		if boss.CurrentPhase ~= requirements.RequiredBossPhase then
			return false
		end
	end
	if requirements.RequiredFalseBossPhase ~= nil and game.ActiveEnemies[game.CurrentRun.CurrentRoom.BossId] ~= nil then
		local boss = game.ActiveEnemies[game.CurrentRun.CurrentRoom.BossId]
		if boss.CurrentPhase == requirements.RequiredFalseBossPhase then
			return false
		end
	end

	if requirements.RequiredMinMaximumLastStands ~= nil then
		if game.CurrentRun.Hero.MaxLastStands == nil or game.CurrentRun.Hero.MaxLastStands < requirements.RequiredMinMaximumLastStands then
			return false
		end
	end

	if requirements.RequiredMaxHealthFraction ~= nil then
		local currentHealthFraction = game.CurrentRun.Hero.Health / game.CurrentRun.Hero.MaxHealth
		if currentHealthFraction > requirements.RequiredMaxHealthFraction then
			return false
		end
	end

	if requirements.RequiredMinHealthFraction ~= nil then
		local currentHealthFraction = game.CurrentRun.Hero.Health / game.CurrentRun.Hero.MaxHealth
		if currentHealthFraction < requirements.RequiredMinHealthFraction then
			return false
		end
	end

	if requirements.RequiredMinMaxHealthAmount ~= nil then
		local currentMaxHealth = game.CurrentRun.Hero.MaxHealth
		if currentMaxHealth < requirements.RequiredMinMaxHealthAmount then
			return false
		end
	end

	if requirements.RequiredMaxLastStands ~= nil then
		if game.TableLength(game.CurrentRun.Hero.LastStands) > requirements.RequiredMaxLastStands then
			return false
		end
	end

	if requirements.RequiredLastGodLoot ~= nil and game.CurrentLootData ~= nil and game.CurrentLootData.Name ~= requirements.RequiredLastGodLoot then
		return false
	end

	if requirements.RequiredLastGodGender ~= nil and game.CurrentLootData ~= nil and game.CurrentLootData.Gender ~= requirements.RequiredLastGodGender then
		return false
	end

	if requirements.RequiredSwappedGodLoot ~= nil and game.CurrentRun.CurrentRoom.ReplacedTraitSource ~= requirements.RequiredSwappedGodLoot then
		return false
	end

	if requirements.RequiresLastUpgradeSwapped ~= nil and game.CurrentRun.CurrentRoom.ReplacedTraitSource == nil then
		return false
	end

	if game.CurrentLootData ~= nil then
		if requirements.RequiresSwappedGodLoot and not HasExchangeOnLoot(game.CurrentLootData) then
			return false
		end

		if requirements.HasTraitNameInRoom and not HasTraitOnLoot(game.CurrentLootData, requirements.HasTraitNameInRoom) then
			return false
		end

		if requirements.HasAnyTraitNamesInRoom and not HasTraitsOnLoot(game.CurrentLootData, requirements.HasAnyTraitNamesInRoom) then
			return false
		end

		if requirements.ValuableUpgradeInRoom ~= nil then
			local meetsMinRarityRequirement = false
			local meetsHighestRarityRequirement = false


			if requirements.ValuableUpgradeInRoom.AllAtLeastRarity ~= nil and AllAtLeastRarity(game.CurrentLootData, requirements.ValuableUpgradeInRoom.AllAtLeastRarity) then
				meetsMinRarityRequirement = true
			end

			if requirements.ValuableUpgradeInRoom.HasAtLeastRarity ~= nil and HasAtLeastRarity(game.CurrentLootData, requirements.ValuableUpgradeInRoom.HasAtLeastRarity) then
				meetsHighestRarityRequirement = true
			end
			if not meetsMinRarityRequirement or not meetsHighestRarityRequirement then
				return false
			end
		end
	end

	if requirements.RequiredRewardInRoom ~= nil then
		local hasReward = false
		for i, value in pairs(game.CurrentRun.CurrentRoom.Encounter.ActiveSpawns) do
			if value.Name == requirements.RequiredRewardInRoom then
				hasReward = true
				break
			end
		end
		if not hasReward then
			return false
		end
	end

	if requirements.RequiredFalseRewardTypesInRoom ~= nil then
		for i, value in pairs(game.CurrentRun.CurrentRoom.Encounter.ActiveSpawns) do
			if Contains(requirements.RequiredFalseRewardTypesInRoom, value.Name) then
				return false
			end
		end
	end

	if requirements.RequiredFalseRewardType ~= nil then
		if game.CurrentRun.CurrentRoom.ChosenRewardType == requirements.RequiredFalseRewardType then
			return false
		end
	end

	if requirements.RequiredNotActivatedThisRun ~= nil and game.CurrentRun.ActivationRecord[requirements.RequiredNotActivatedThisRun] then
		return false
	end
	if requirements.RequiredIdsNotActivatedThisRun ~= nil then
		for i, id in pairs(requirements.RequiredIdsNotActivatedThisRun) do
			if game.CurrentRun.ActivationRecord[id] then
				return false
			end
		end
	end

	if requirements.RequiredRejectedGodGender ~= nil and game.CurrentRun.CurrentRoom.RejectedLootData ~= nil and game.CurrentRun.CurrentRoom.RejectedLootData.Gender ~= requirements.RequiredRejectedGodGender then
		return false
	end

	if requirements.RequiredSpurnedGodName ~= nil and game.CurrentRun.CurrentRoom.Encounter.SpurnedGodName ~= requirements.RequiredSpurnedGodName then
		return false
	end
	if requirements.RequiredFalseSpurnedGodName ~= nil and game.CurrentRun.CurrentRoom.Encounter.SpurnedGodName ~= nil and game.CurrentRun.CurrentRoom.Encounter.SpurnedGodName == requirements.RequiredFalseSpurnedGodName then
		return false
	end

	-- if requirements.RequiredMinRunsCleared ~= nil and game.GameState.CompletedRunsCache < requirements.RequiredMinRunsCleared then
	if requirements.RequiredMinRunsCleared ~= nil and game.GameState.ModsNikkelMHadesBiomesClearedRunsCache ~= nil and game.GameState.ModsNikkelMHadesBiomesClearedRunsCache < requirements.RequiredMinRunsCleared then
		return false
	end
	if requirements.RequiredMaxRunsCleared ~= nil and game.GameState.ModsNikkelMHadesBiomesClearedRunsCache ~= nil and game.GameState.ModsNikkelMHadesBiomesClearedRunsCache > requirements.RequiredMaxRunsCleared then
		return false
	end
	if requirements.RequiredRunsCleared ~= nil and game.GameState.ModsNikkelMHadesBiomesClearedRunsCache ~= nil and game.GameState.ModsNikkelMHadesBiomesClearedRunsCache ~= requirements.RequiredRunsCleared then
		return false
	end

	-- if requirements.RequiredMinConsecutiveClears ~= nil and game.GameState.ConsecutiveClears ~= nil and game.GameState.ConsecutiveClears < requirements.RequiredMinConsecutiveClears then
	if requirements.RequiredMinConsecutiveClears ~= nil then
		local consecutiveModdedClears = 0
		for k, run in game.GameState.RunHistory do
			if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
				if run.Cleared then
					consecutiveModdedClears = consecutiveModdedClears + 1
				else
					break
				end
			end
		end
		if consecutiveModdedClears < requirements.RequiredMinConsecutiveClears then
			return false
		end
	end

	-- if requirements.RequiredConsecutiveClears ~= nil and game.GameState.ConsecutiveClears ~= nil and game.GameState.ConsecutiveClears ~= requirements.RequiredConsecutiveClears then
	if requirements.RequiredConsecutiveClears ~= nil then
		local hasConsecutiveClears = game.RequiredConsecutiveClearsOfRoom(source,
			{ Name = "D_Boss01", Count = requirements.RequiredConsecutiveClears })
		if not hasConsecutiveClears then
			return false
		end
		-- for k, run in game.GameState.RunHistory do
		-- 	if run.BiomesReached ~= nil and run.BiomesReached.Tartarus then
		-- 		if run.Cleared then
		-- 			consecutiveModdedClears = consecutiveModdedClears + 1
		-- 		else
		-- 			break
		-- 		end
		-- 	end
		-- end
		-- if consecutiveModdedClears ~= requirements.RequiredConsecutiveClears then
		-- 	return false
		-- end
	end

	if requirements.PlayerMaxHealthFraction ~= nil and game.CurrentRun.Hero.Health / game.CurrentRun.Hero.MaxHealth >= requirements.PlayerMaxHealthFraction then
		return false
	end

	if requirements.NotMaxLastStands ~= nil and (not game.CurrentRun.Hero.LastStands or not game.CurrentRun.Hero.MaxLastStands or TableLength(game.CurrentRun.Hero.LastStands) >= game.CurrentRun.Hero.MaxLastStands) then
		return false
	end

	if requirements.RequiredMinLastStandsUsed ~= nil then
		if game.CurrentRun.Hero.LastStandsUsed == nil or requirements.RequiredMinLastStandsUsed > game.CurrentRun.Hero.LastStandsUsed then
			return false
		end
	end

	if requirements.RequiredMinTraitsSold ~= nil then
		if game.CurrentRun.Hero.TraitsSold == nil or requirements.RequiredMinTraitsSold > game.CurrentRun.Hero.TraitsSold then
			return false
		end
	end

	if requirements.IsIdAlive ~= nil and not IsAlive({ Id = requirements.IsIdAlive }) then
		return false
	end
	if requirements.AreIdsAlive ~= nil then
		for i, id in pairs(requirements.AreIdsAlive) do
			if not IsAlive({ Id = id }) then
				return false
			end
		end
	end
	if requirements.AreAnyIdsAlive ~= nil then
		local anyAlive = false
		for i, id in pairs(requirements.AreAnyIdsAlive) do
			if IsAlive({ Id = id }) then
				anyAlive = true
				break
			end
		end
		if not anyAlive then
			return false
		end
	end
	if requirements.AreIdsNotAlive ~= nil then
		for i, id in pairs(requirements.AreIdsNotAlive) do
			if IsAlive({ Id = id }) then
				return false
			end
		end
	end

	if requirements.MaxThanatosSpawnsThisRun ~= nil and game.CurrentRun.ThanatosSpawns ~= nil and game.CurrentRun.ThanatosSpawns >= requirements.MaxThanatosSpawnsThisRun then
		return false
	end

	if requirements.RequiredMaxThanatosKillsThisRun ~= nil then
		if (game.CurrentRun.CurrentRoom.Encounter.ThanatosKills or 0) > requirements.RequiredMaxThanatosKillsThisRun then
			return false
		end
		-- ThanatosKills in the Encounter is not saved in the RoomHistory, moving it up to CurrentRun
		-- for roomIndex = #game.CurrentRun.RoomHistory, 1, -1 do
		-- 	if game.CurrentRun.RoomHistory[roomIndex].Encounter.ThanatosKills then
		-- 		if game.CurrentRun.RoomHistory[roomIndex].Encounter.ThanatosKills > requirements.RequiredMaxThanatosKillsThisRun then
		-- 			return false
		-- 		end
		-- 		break
		-- 	end
		-- end
		if (game.CurrentRun.ModsNikkelMHadesBiomesTotalThanatosKills or 0) > requirements.RequiredMaxThanatosKillsThisRun then
			return false
		end
	end

	if requirements.ObjectivesCompleted ~= nil then
		if requirements.ObjectivesCompleted.Min ~= nil then
			if (game.GameState.ObjectivesCompleted[requirements.ObjectivesCompleted.Name] or 0) < requirements.ObjectivesCompleted.Min then
				return false
			end
		end
		if requirements.ObjectivesCompleted.Max ~= nil then
			if (game.GameState.ObjectivesCompleted[requirements.ObjectivesCompleted.Name] or 0) > requirements.ObjectivesCompleted.Max then
				return false
			end
		end
	end
	if requirements.ObjectivesFailed ~= nil then
		if requirements.ObjectivesFailed.Min ~= nil then
			if (game.GameState.ObjectivesFailed[requirements.ObjectivesFailed.Name] or 0) < requirements.ObjectivesFailed.Min then
				return false
			end
		end
		if requirements.ObjectivesFailed.Max ~= nil then
			if (game.GameState.ObjectivesFailed[requirements.ObjectivesFailed.Name] or 0) > requirements.ObjectivesFailed.Max then
				return false
			end
		end
	end
	if requirements.ObjectiveCompletedLastOffer ~= nil then
		if (game.GameState.LastObjectiveCompletedRun[requirements.ObjectiveCompletedLastOffer] or 0) < (game.GameState.LastObjectiveFailedRun[requirements.ObjectiveCompletedLastOffer] or 0) then
			return false
		end
	end
	if requirements.ObjectiveFailedLastOffer ~= nil then
		if (game.GameState.LastObjectiveFailedRun[requirements.ObjectiveFailedLastOffer] or 0) < (game.GameState.LastObjectiveCompletedRun[requirements.ObjectiveFailedLastOffer] or 0) then
			return false
		end
	end

	if requirements.AnyQuestWithStatus ~= nil and not HasAnyQuestWithStatus(requirements.AnyQuestWithStatus) then
		return false
	end
	if requirements.AllQuestsWithStatus ~= nil and not HasAllQuestsWithStatus(requirements.AllQuestsWithStatus) then
		return false
	end

	if requirements.RequiredMinQuestsComplete ~= nil then
		local numQuestsComplete = 0
		if game.GameState.QuestStatus ~= nil then
			for questName, questStatus in pairs(game.GameState.QuestStatus) do
				if questStatus == "CashedOut" then
					numQuestsComplete = numQuestsComplete + 1
				end
			end
		end
		if numQuestsComplete < requirements.RequiredMinQuestsComplete then
			return false
		end
	end
	if requirements.RequiredMaxQuestsComplete ~= nil then
		local numQuestsComplete = 0
		if game.GameState.QuestStatus ~= nil then
			for questName, questStatus in pairs(game.GameState.QuestStatus) do
				if questStatus == "CashedOut" then
					numQuestsComplete = numQuestsComplete + 1
				end
			end
		end
		if numQuestsComplete > requirements.RequiredMaxQuestsComplete then
			return false
		end
	end

	if requirements.RequireQuestsComplete ~= nil then
		for k, questName in pairs(requirements.RequireQuestsComplete) do
			if game.GameState.QuestStatus[questName] ~= "CashedOut" then
				return false
			end
		end
	end

	if requirements.RequireAnyQuestsComplete ~= nil then
		local anyComplete = false
		for k, questName in pairs(requirements.RequireAnyQuestsComplete) do
			if game.GameState.QuestStatus[questName] == "CashedOut" then
				anyComplete = true
			end
		end
		if not anyComplete then
			return false
		end
	end

	if requirements.AnyAffordableGhostAdminItem ~= nil then
		local canAffordAny = false
		for itemName, itemData in pairs(game.WorldUpgradeData) do
			if not itemData.DebugOnly and itemData.ResourceCost ~= nil and not game.GameState.CosmeticsAdded[itemName] and not itemData.IgnoreAffordable then
				if itemData.Slot == requirements.AnyAffordableGhostAdminItem and HasResource(itemData.ResourceName, itemData.ResourceCost) then
					if itemData.game.GameStateRequirements == nil or IsGameStateEligible(CurrentRun, itemData, itemData.game.GameStateRequirements) then
						canAffordAny = true
						break
					end
				end
			end
		end
		if not canAffordAny then
			return false
		end
	end
	if requirements.RequiredMinCaughtFishThisRun ~= nil then
		return false
	end
	-- if requirements.RequiredMinCaughtFishThisRun ~= nil and GetNumFishCaught(game.CurrentRun) < requirements.RequiredMinCaughtFishThisRun then
	-- 	return false
	-- end

	if requirements.RequiredHasFish ~= nil and IsEmpty(game.GameState.CaughtFish) then
		return false
	end

	if requirements.RequiredHasNoFish ~= nil and not IsEmpty(game.GameState.CaughtFish) then
		return false
	end

	if requirements.RequiredMinHeldFish ~= nil then
		return false
	end
	-- if requirements.RequiredMinHeldFish ~= nil and GetNumHeldFish() < requirements.RequiredMinHeldFish then
	-- 	return false
	-- end

	if requirements.RequiredMinTotalCaughtFish ~= nil then
		local totalFishSum = 0
		for k, fishType in pairs(game.GameState.FishCaught) do
			totalFishSum = totalFishSum + fishType
		end
		if totalFishSum < requirements.RequiredMinTotalCaughtFish then
			return false
		end
	end

	if requirements.RequiredAnyCaughtFishTypes ~= nil then
		local anyTrue = false
		for k, fishType in pairs(requirements.RequiredAnyCaughtFishTypes) do
			if game.GameState.TotalCaughtFish and game.GameState.TotalCaughtFish[fishType] then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredAnyCaughtFishTypesOfEach ~= nil then
		for k, subTable in pairs(requirements.RequiredAnyCaughtFishTypesOfEach) do
			local anyTrue = false
			for k, fishType in pairs(subTable) do
				if game.GameState.TotalCaughtFish and game.GameState.TotalCaughtFish[fishType] then
					anyTrue = true
					break
				end
			end
			if not anyTrue then
				return false
			end
		end
	end

	if requirements.RequiredAnyCaughtFishTypesThisRun ~= nil then
		local anyTrue = false
		if game.CurrentRun.CaughtFish ~= nil then
			for k, fishType in pairs(requirements.RequiredAnyCaughtFishTypesThisRun) do
				if game.CurrentRun.CaughtFish[fishType] then
					anyTrue = true
					break
				end
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredMaxTotalCaughtFish ~= nil then
		local totalFishSum = 0
		for k, fishType in pairs(game.GameState.FishCaught) do
			totalFishSum = totalFishSum + fishType
		end
		if totalFishSum > requirements.RequiredMaxTotalCaughtFish then
			return false
		end
	end

	if requirements.MinRunsSinceSquelchedHermes ~= nil then
		local runsSinceOccurred = 0
		for runIndex = #game.GameState.RunHistory + 1, 1, -1 do
			local prevRun = game.GameState.RunHistory[runIndex] or game.CurrentRun
			if prevRun.SquelchedHermesPermanently then
				return false
			end
			if prevRun.SquelchedHermes then
				if runsSinceOccurred < requirements.MinRunsSinceSquelchedHermes then
					--DebugPrint({ Text = "runsSinceOccurred = "..runsSinceOccurred })
					return false
				end
			end
			if prevRun.BiomesReached ~= nil and prevRun.BiomesReached.Tartarus then
				runsSinceOccurred = runsSinceOccurred + 1
			end
		end
	end
	if requirements.MaxRunsSinceSquelchedHermes ~= nil then
		local runsSinceOccurred = 0
		local squelchedTimes = 0
		for runIndex = #game.GameState.RunHistory + 1, 1, -1 do
			local prevRun = game.GameState.RunHistory[runIndex] or game.CurrentRun
			if prevRun.SquelchedHermesPermanently then
				break
			end
			if prevRun.SquelchedHermes then
				squelchedTimes = squelchedTimes + 1
				if runsSinceOccurred >= requirements.MaxRunsSinceSquelchedHermes then
					--DebugPrint({ Text = "runsSinceOccurred = "..runsSinceOccurred })
					return false
				end
			end
			if prevRun.BiomesReached ~= nil and prevRun.BiomesReached.Tartarus then
				runsSinceOccurred = runsSinceOccurred + 1
			end
		end
		if squelchedTimes == 0 then
			return false
		end
	end

	if requirements.MinRunsSinceAnyTextLines ~= nil then
		for k, textLines in pairs(requirements.MinRunsSinceAnyTextLines.TextLines) do
			local runsSinceOccurred = 0
			for runIndex = #game.GameState.RunHistory + 1, 1, -1 do
				local prevRun = game.PrevRun
				if prevRun.TextLinesRecord ~= nil and prevRun.TextLinesRecord[textLines] then
					if runsSinceOccurred < requirements.MinRunsSinceAnyTextLines.Count then
						DebugPrint({ Text = "textLines = " .. textLines .. ", " .. "runsSinceOccurred = " .. runsSinceOccurred })
						return false
					end
				end
				if prevRun.BiomesReached ~= nil and prevRun.BiomesReached.Tartarus then
					runsSinceOccurred = runsSinceOccurred + 1
					if runsSinceOccurred >= requirements.MinRunsSinceAnyTextLines.Count then
						-- Already exceeded safely
						break
					end
				end
			end
		end
	end
	if requirements.MaxRunsSinceAnyTextLines ~= nil then
		for k, textLines in pairs(requirements.MaxRunsSinceAnyTextLines.TextLines) do
			local runsSinceOccurred = 0
			for runIndex = #game.GameState.RunHistory + 1, 1, -1 do
				local prevRun = game.PrevRun
				if prevRun.TextLinesRecord ~= nil and prevRun.TextLinesRecord[textLines] then
					if runsSinceOccurred > requirements.MaxRunsSinceAnyTextLines.Count then
						DebugPrint({ Text = "textLines = " .. textLines .. ", " .. "runsSinceOccurred = " .. runsSinceOccurred })
						return false
					else
						-- Did occur recently enough
						break
					end
				end
				if prevRun.BiomesReached ~= nil and prevRun.BiomesReached.Tartarus then
					runsSinceOccurred = runsSinceOccurred + 1
				end
			end
		end
	end

	if requirements.RequiredTrueConfigOptions ~= nil then
		for k, configOption in pairs(requirements.RequiredTrueConfigOptions) do
			if not GetConfigOptionValue({ Name = configOption }) then
				return false
			end
		end
	end
	if requirements.RequiredFalseConfigOptions ~= nil then
		for k, configOption in pairs(requirements.RequiredFalseConfigOptions) do
			if GetConfigOptionValue({ Name = configOption }) then
				return false
			end
		end
	end

	if requirements.RequiresFalseHadesProcession then
		if game.CurrentHubRoom ~= nil and game.CurrentHubRoom.HadesProcessionActive then
			return false
		end
	end

	if requirements.RequiresFalseGossiping then
		if game.CurrentHubRoom ~= nil and game.CurrentHubRoom.GossipingActive then
			return false
		end
	end

	if requirements.RequiredCosmeticsAdded ~= nil then
		for k, name in pairs(requirements.RequiredCosmeticsAdded) do
			if not game.GameState.CosmeticsAdded[name] then
				return false
			end
		end
	end

	if requirements.RequiredCosmetics ~= nil then
		for k, name in pairs(requirements.RequiredCosmetics) do
			if not game.GameState.WorldUpgrades[name] then
				return false
			end
		end
	end
	if requirements.RequiredAnyCosmetics ~= nil then
		local anyTrue = false
		for k, name in pairs(requirements.RequiredAnyCosmetics) do
			if game.GameState.WorldUpgrades[name] then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredCosmeticPurchaseable ~= nil then
		local cosmeticData = game.WorldUpgradeData[requirements.RequiredCosmeticPurchaseable]
		if cosmeticData == nil then
			return false
		end
		if game.GameState.WorldUpgradesAdded[cosmeticData.Name] or not IsGameStateEligible(CurrentRun, cosmeticData, cosmeticData.game.GameStateRequirements) then
			return false
		end
	end
	if requirements.RequiredFalseCosmeticPurchaseable ~= nil then
		local cosmeticData = game.WorldUpgradeData[requirements.RequiredFalseCosmeticPurchaseable]
		if cosmeticData ~= nil and not game.GameState.WorldUpgradesAdded[cosmeticData.Name] and IsGameStateEligible(CurrentRun, cosmeticData, cosmeticData.game.GameStateRequirements) then
			return false
		end
	end
	if requirements.RequiredSeenCosmeticPurchaseable ~= nil then
		local cosmeticData = game.WorldUpgradeData[requirements.RequiredSeenCosmeticPurchaseable]
		if cosmeticData == nil then
			return false
		end
		if not game.GameState.WorldUpgradesAdded[cosmeticData.Name] and not game.GameState.WorldUpgradesViewed[cosmeticData.Name] then
			return false
		end
	end

	if requirements.RequiredMinAnyCosmetics ~= nil then
		local numTrue = 0
		for k, name in pairs(requirements.RequiredMinAnyCosmetics.Cosmetics) do
			if game.GameState.WorldUpgrades[name] then
				numTrue = numTrue + 1
			end
		end
		if numTrue < requirements.RequiredMinAnyCosmetics.Count then
			return false
		end
	end
	if requirements.RequiredMaxAnyCosmetics ~= nil then
		local numTrue = 0
		for k, name in pairs(requirements.RequiredMaxAnyCosmetics.Cosmetics) do
			if game.GameState.WorldUpgrades[name] then
				numTrue = numTrue + 1
			end
		end
		if numTrue > requirements.RequiredMaxAnyCosmetics.Count then
			return false
		end
	end

	if requirements.RequiredFalseCosmetics ~= nil then
		for k, name in pairs(requirements.RequiredFalseCosmetics) do
			if game.GameState.WorldUpgrades[name] then
				return false
			end
		end
	end

	if requirements.RequiredNumCosmeticsMin ~= nil then
		if TableLength(game.GameState.CosmeticsAdded) < requirements.RequiredNumCosmeticsMin then
			return false
		end
	end

	if requirements.RequiresPendingCosmeticItems ~= nil then
		local hasPending = false
		local ids = GetIds({ Names = { "Conditional" } }) or {}
		for k, id in pairs(ids) do
			local name = GetName({ Id = id })
			if game.GameState.WorldUpgrades[name] == UIData.Constants.PENDING_REVEAL then
				hasPending = true
			end
		end

		if not hasPending then
			return false
		end
	end

	if requirements.RequiredCosmeticItemVisible and game.GameState.WorldUpgrades[requirements.RequiredCosmeticItemVisible] ~= UIData.Constants.VISIBLE then
		return false
	end

	if requirements.RequiredAnyCosmeticItemVisible then
		local anyTrue = false
		for k, name in pairs(requirements.RequiredAnyCosmeticItemVisible) do
			if game.GameState.WorldUpgrades[name] == UIData.Constants.VISIBLE then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredTrueFlags ~= nil then
		for k, flag in pairs(requirements.RequiredTrueFlags) do
			if not game.GameState.Flags[flag] then
				return false
			end
		end
	end
	if requirements.RequiredFalseFlags ~= nil then
		for k, flag in pairs(requirements.RequiredFalseFlags) do
			if game.GameState.Flags[flag] then
				return false
			end
		end
	end
	if requirements.RequiredAnyTrueFlags ~= nil then
		local anyTrue = false
		for k, flag in pairs(requirements.RequiredAnyTrueFlags) do
			if game.GameState.Flags[flag] then
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	if requirements.RequiredValues ~= nil then
		for key, value in pairs(requirements.RequiredValues) do
			if game.GameState[key] ~= value then
				return false
			end
		end
	end
	if requirements.RequiredFalseValues ~= nil then
		for key, value in pairs(requirements.RequiredFalseValues) do
			if game.GameState[key] == value then
				return false
			end
		end
	end
	if requirements.RequiredMinValues ~= nil then
		for key, minValue in pairs(requirements.RequiredMinValues) do
			if (game.GameState[key] or 0) < minValue then
				return false
			end
		end
	end
	if requirements.RequiredMaxValues ~= nil then
		for key, maxValue in pairs(requirements.RequiredMaxValues) do
			if (game.GameState[key] or 0) > maxValue then
				return false
			end
		end
	end

	if requirements.RequiredAccumulatedMetaPoints ~= nil then
		if GetTotalAccumulatedMetaPoints() < requirements.RequiredAccumulatedMetaPoints then
			return false
		end
	end

	if requirements.RequiredActiveMetaPointsMin ~= nil then
		-- if GetTotalSpentMetaPoints() < requirements.RequiredActiveMetaPointsMin then
		if game.GameState.MetaUpgradeCostCache < requirements.RequiredActiveMetaPointsMin then
			return false
		end
	end
	if requirements.RequiredActiveMetaPointsMax ~= nil then
		-- if GetTotalSpentMetaPoints() > requirements.RequiredActiveMetaPointsMax then
		if game.GameState.MetaUpgradeCostCache > requirements.RequiredActiveMetaPointsMax then
			return false
		end
	end

	if requirements.RequiredResourcesMin ~= nil then
		for name, amount in pairs(requirements.RequiredResourcesMin) do
			if not HasResource(name, amount) then
				return false
			end
		end
	end

	if requirements.RequiredResourcesMax ~= nil then
		for name, amount in pairs(requirements.RequiredResourcesMax) do
			if HasResource(name, amount + 1) then
				return false
			end
		end
	end

	if requirements.RequiredLifetimeResourcesGainedMin ~= nil then
		for name, amount in pairs(requirements.RequiredLifetimeResourcesGainedMin) do
			if game.GameState.LifetimeResourcesGained[name] == nil or (game.GameState.LifetimeResourcesGained[name] ~= nil and game.GameState.LifetimeResourcesGained[name] < amount) then
				return false
			end
		end
	end
	if requirements.RequiredLifetimeResourcesGainedMax ~= nil then
		for name, amount in pairs(requirements.RequiredLifetimeResourcesGainedMax) do
			if game.GameState.LifetimeResourcesGained[name] ~= nil and game.GameState.LifetimeResourcesGained[name] > amount then
				return false
			end
		end
	end

	if requirements.RequiredLifetimeResourcesSpentMin ~= nil then
		for name, amount in pairs(requirements.RequiredLifetimeResourcesSpentMin) do
			if game.GameState.LifetimeResourcesSpent[name] == nil or (game.GameState.LifetimeResourcesSpent[name] ~= nil and game.GameState.LifetimeResourcesSpent[name] < amount) then
				return false
			end
		end
	end
	if requirements.RequiredLifetimeResourcesSpentMax ~= nil then
		for name, amount in pairs(requirements.RequiredLifetimeResourcesSpentMax) do
			if game.GameState.LifetimeResourcesSpent[name] ~= nil and game.GameState.LifetimeResourcesSpent[name] > amount then
				return false
			end
		end
	end

	if requirements.RequiredMoneyMin ~= nil then
		if game.GameState.Resources.Money < requirements.RequiredMoneyMin then
			return false
		end
	end
	if requirements.RequiredMoneyMax ~= nil then
		if game.GameState.Resources.Money > requirements.RequiredMoneyMax then
			return false
		end
	end

	if requirements.RequiredConsumablesThisRun ~= nil then
		local count = 0
		for k, name in pairs(requirements.RequiredConsumablesThisRun.Names) do
			count = count + (game.CurrentRun.ConsumableRecord[name] or 0)
		end
		if count < requirements.RequiredConsumablesThisRun.Count then
			return false
		end
	end

	if requirements.RequiredFalseConsumablesThisRun ~= nil then
		for k, name in pairs(requirements.RequiredFalseConsumablesThisRun) do
			if game.CurrentRun.ConsumableRecord[name] then
				return false
			end
		end
	end

	if requirements.RequiredActiveShrinePointsMin ~= nil then
		if GetTotalSpentShrinePoints() < requirements.RequiredActiveShrinePointsMin then
			return false
		end
	end
	if requirements.RequiredActiveShrinePointsMax ~= nil then
		if GetTotalSpentShrinePoints() > requirements.RequiredActiveShrinePointsMax then
			return false
		end
	end

	if requirements.RequireNewTraits ~= nil then
		if not HasNewTraits() then
			return false
		end
	end

	if requirements.RequiredNoEquipedAwardTrait ~= nil then
		if game.GameState.LastAwardTrait ~= nil then
			return false
		end
	end

	-- note this is for the Daedalus Hammer not Weapon Aspects
	if requirements.RequiredMinWeaponUpgrades ~= nil then
		local numUpgrades = 0
		if game.CurrentRun.LootTypeHistory and game.CurrentRun.LootTypeHistory.WeaponUpgrade then
			if game.CurrentRun.LootTypeHistory.WeaponUpgrade < requirements.RequiredMinWeaponUpgrades then
				return false
			else
				numUpgrades = game.CurrentRun.LootTypeHistory.WeaponUpgrade
			end
		end

		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.ChosenRewardType == "WeaponUpgrade" and (numUpgrades + 1) < requirements.RequiredMinWeaponUpgrades then
			return false
		elseif numUpgrades < requirements.RequiredMinWeaponUpgrades then
			return false
		end
	end

	if requirements.RequiredMaxWeaponUpgrades ~= nil then
		local numUpgrades = 0
		if game.CurrentRun.LootTypeHistory and game.CurrentRun.LootTypeHistory.WeaponUpgrade then
			if game.CurrentRun.LootTypeHistory.WeaponUpgrade > requirements.RequiredMaxWeaponUpgrades then
				return false
			else
				numUpgrades = game.CurrentRun.LootTypeHistory.WeaponUpgrade
			end
		end
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.ChosenRewardType == "WeaponUpgrade" and (numUpgrades + 1) > requirements.RequiredMaxWeaponUpgrades then
			return false
		end
	end

	if requirements.RequiredMaxHermesUpgrades ~= nil then
		local numUpgrades = 0
		if game.CurrentRun.LootTypeHistory and game.CurrentRun.LootTypeHistory.HermesUpgrade then
			if game.CurrentRun.LootTypeHistory.HermesUpgrade > requirements.RequiredMaxHermesUpgrades then
				return false
			else
				numUpgrades = game.CurrentRun.LootTypeHistory.HermesUpgrade
			end
		end
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.ChosenRewardType == "HermesUpgrade" and (numUpgrades + 1) > requirements.RequiredMaxHermesUpgrades then
			return false
		end
	end

	if requirements.RequiredInStore ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.Store ~= nil and game.CurrentRun.CurrentRoom.Store.StoreOptions ~= nil then
			local foundItem = false
			for i, value in pairs(game.CurrentRun.CurrentRoom.Store.StoreOptions) do
				if value.Name == requirements.RequiredInStore then
					foundItem = true
				end
			end
			if not foundItem then
				return false
			end
		end
	end
	if requirements.RequiredInStoreAffordable ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.Store ~= nil and game.CurrentRun.CurrentRoom.Store.StoreOptions ~= nil then
			local foundItem = false
			for i, value in pairs(game.CurrentRun.CurrentRoom.Store.StoreOptions) do
				if value.Name == requirements.RequiredInStoreAffordable then
					foundItem = true
					if value.HealthCost and game.CurrentRun.Hero.Health <= value.HealthCost then
						return false
					end

					if value.Cost and game.GameState.Resources.Money == nil or game.GameState.Resources.Money < value.Cost then
						return false
					end
				end
			end

			if not foundItem then
				return false
			end
		end
	end
	if requirements.RequiredInStoreUnaffordable ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.Store ~= nil and game.CurrentRun.CurrentRoom.Store.StoreOptions ~= nil then
			local foundItem = false
			for i, value in pairs(game.CurrentRun.CurrentRoom.Store.StoreOptions) do
				if value.Name == requirements.RequiredInStoreUnaffordable then
					foundItem = true
					if value.HealthCost and game.CurrentRun.Hero.Health > value.HealthCost then
						return false
					end

					if value.Cost and game.GameState.Resources.Money ~= nil and game.GameState.Resources.Money >= value.Cost then
						return false
					end
				end
			end

			if not foundItem then
				return false
			end
		end
	end

	if requirements.RequiredNotInStore ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.Store ~= nil and game.CurrentRun.CurrentRoom.Store.StoreOptions ~= nil then
			for i, value in pairs(game.CurrentRun.CurrentRoom.Store.StoreOptions) do
				if value.Name == requirements.RequiredNotInStore then
					return false
				end
			end
		end
	end

	if requirements.RequiredNotInStoreNames ~= nil then
		if game.CurrentRun.CurrentRoom ~= nil and game.CurrentRun.CurrentRoom.Store ~= nil and game.CurrentRun.CurrentRoom.Store.StoreOptions ~= nil then
			for i, value in pairs(game.CurrentRun.CurrentRoom.Store.StoreOptions) do
				if Contains(requirements.RequiredNotInStoreNames, value.Name) then
					return false
				end
			end
		end
	end


	if requirements.RequiredPurchasedWorldItemCountMin ~= nil or requirements.RequiredPurchasedWorldItemCountMax ~= nil then
		local num = 0
		if game.CurrentRun.CurrentRoom.Store ~= nil and game.CurrentRun.CurrentRoom.Store.SpawnedStoreItems ~= nil then
			for i, item in pairs(game.CurrentRun.CurrentRoom.Store.SpawnedStoreItems) do
				if not IsAlive({ Id = item.ObjectId }) then
					num = num + 1
				end
			end
		end
		if requirements.RequiredPurchasedWorldItemCountMin and num < requirements.RequiredPurchasedWorldItemCountMin then
			return false
		end
		if requirements.RequiredPurchasedWorldItemCountMax and num > requirements.RequiredPurchasedWorldItemCountMax then
			return false
		end
	end

	if requirements.RequiredMusicName ~= nil then
		if requirements.RequiredMusicName ~= game.AudioState.MusicName then
			return false
		end
	end

	if requirements.RequiredMusicSection ~= nil then
		if requirements.RequiredMusicSection ~= game.AudioState.MusicSection then
			return false
		end
	end

	if requirements.RequiredAmbientTrackName ~= nil then
		if requirements.RequiredAmbientTrackName ~= game.AudioState.AmbientTrackName then
			return false
		end
	end

	if requirements.RequiredAmbientTrackNameMatch and source ~= nil and source.OnQueuedFunctionArgs ~= nil then
		if game.AudioState.AmbientTrackName ~= nil and source.OnQueuedFunctionArgs.TrackName ~= game.AudioState.AmbientTrackName then
			return false
		end
	end

	if requirements.RequiredMusicSectionRoomDuration ~= nil and game.AudioState.MusicSectionStartDepth ~= nil then
		local duration = GetRunDepth(game.CurrentRun) - game.AudioState.MusicSectionStartDepth
		if duration < requirements.RequiredMusicSectionRoomDuration then
			return false
		end
	end

	if requirements.RequiresNotFishing ~= nil and game.CurrentRun.Hero.FishingStarted then
		return false
	end

	if requirements.RequiresMusicId ~= nil and game.AudioState.MusicId == nil then
		return false
	end
	if requirements.RequiresNullMusicId ~= nil and game.AudioState.MusicId ~= nil then
		return false
	end

	if requirements.RequiresSecretMusicId ~= nil and game.AudioState.SecretMusicId == nil then
		return false
	end
	if requirements.RequiresNullSecretMusicId ~= nil and game.AudioState.SecretMusicId ~= nil then
		return false
	end

	if requirements.RequiresAmbientMusicId ~= nil and game.AudioState.AmbientMusicId == nil then
		return false
	end
	if requirements.RequiresNullAmbientMusicId ~= nil and game.AudioState.AmbientMusicId ~= nil then
		return false
	end

	if requirements.RequiredFalseInteractionThisRun ~= nil then
		if game.CurrentRun.NPCInteractions[requirements.RequiredFalseInteractionThisRun] then
			return false
		end
	end
	if requirements.RequiredMinNPCInteractions ~= nil then
		for requiredNPC, requiredNPCInteractionsCount in pairs(requirements.RequiredMinNPCInteractions) do
			if game.GameState.NPCInteractions[requiredNPC] == nil or game.GameState.NPCInteractions[requiredNPC] < requiredNPCInteractionsCount then
				return false
			end
		end
	end
	if requirements.RequiredMaxNPCInteractions ~= nil then
		for requiredNPC, requiredNPCInteractionsCount in pairs(requirements.RequiredMaxNPCInteractions) do
			if game.GameState.NPCInteractions[requiredNPC] == nil or game.GameState.NPCInteractions[requiredNPC] > requiredNPCInteractionsCount then
				return false
			end
		end
	end

	if requirements.RequiredMinItemInteractions ~= nil then
		for requiredItem, requiredItemInteractionsCount in pairs(requirements.RequiredMinItemInteractions) do
			if game.GameState.ItemInteractions[requiredItem] == nil or game.GameState.ItemInteractions[requiredItem] < requiredItemInteractionsCount then
				return false
			end
		end
	end

	if requirements.RequiredUpgradeableGodTraits ~= nil then
		if not UpgradableGodTraitCountAtLeast(requirements.RequiredUpgradeableGodTraits) then
			return false
		end
	end

	if requirements.RequiredInteractedGods ~= nil then
		if TableLength(GetEligibleInteractedGods()) < requirements.RequiredInteractedGods then
			return false
		end
	end

	if requirements.RequiredInteractedGodsThisRun ~= nil then
		if TableLength(GetInteractedGodsThisRun()) < requirements.RequiredInteractedGodsThisRun then
			return false
		end
	end

	if requirements.RequiredMinRoomsSinceDevotion ~= nil then
		if game.CurrentRun.LastDevotionDepth ~= nil and game.CurrentRun.LastDevotionDepth ~= game.CurrentRun.RunDepthCache and game.CurrentRun.RunDepthCache - requirements.RequiredMinRoomsSinceDevotion < game.CurrentRun.LastDevotionDepth then
			return false
		end
	end

	if requirements.RequiredMinRoomsSinceWellShop ~= nil then
		if game.CurrentRun.LastWellShopDepth ~= nil and game.CurrentRun.LastWellShopDepth ~= game.CurrentRun.RunDepthCache and game.CurrentRun.RunDepthCache - requirements.RequiredMinRoomsSinceWellShop < game.CurrentRun.LastWellShopDepth then
			return false
		end
	end

	if requirements.RequiredMinRoomsSinceSellTraitShop ~= nil then
		if game.CurrentRun.LastSellTraitShopDepth ~= nil and game.CurrentRun.LastSellTraitShopDepth ~= game.CurrentRun.RunDepthCache and game.CurrentRun.RunDepthCache - requirements.RequiredMinRoomsSinceSellTraitShop < game.CurrentRun.LastSellTraitShopDepth then
			return false
		end
	end

	if requirements.RequiredMinRoomsSinceSecretDoor ~= nil then
		if game.CurrentRun.LastSecretDepth ~= nil and game.CurrentRun.LastSecretDepth ~= game.CurrentRun.RunDepthCache and game.CurrentRun.RunDepthCache - requirements.RequiredMinRoomsSinceSecretDoor < game.CurrentRun.LastSecretDepth then
			return false
		end
	end

	if requirements.RequiredMinRoomsSinceShrinePointDoor ~= nil then
		if game.CurrentRun.LastShrinePointDoorDepth ~= nil and game.CurrentRun.LastShrinePointDoorDepth ~= game.CurrentRun.RunDepthCache and game.CurrentRun.RunDepthCache - requirements.RequiredMinRoomsSinceShrinePointDoor < game.CurrentRun.LastShrinePointDoorDepth then
			return false
		end
	end

	if requirements.RequiredMinRoomsSinceChallengeSwitch ~= nil then
		if game.CurrentRun.LastChallengeDepth ~= nil and game.CurrentRun.LastChallengeDepth ~= game.CurrentRun.RunDepthCache and game.CurrentRun.RunDepthCache - requirements.RequiredMinRoomsSinceChallengeSwitch < game.CurrentRun.LastChallengeDepth then
			return false
		end
	end

	if requirements.RequiredNoChallengeSwitchInRoom ~= nil and game.CurrentRun.CurrentRoom.ChallengeSwitch then
		return false
	end

	if requirements.RequiredMinRoomsSinceFishingPoint ~= nil then
		if game.CurrentRun.LastFishingPointDepth ~= nil and game.CurrentRun.LastFishingPointDepth ~= game.CurrentRun.RunDepthCache and game.CurrentRun.RunDepthCache - requirements.RequiredMinRoomsSinceFishingPoint < game.CurrentRun.LastFishingPointDepth then
			return false
		end
	end

	if requirements.RequiresFishingPointInRoom ~= nil and not game.CurrentRun.CurrentRoom.FishingPointId then
		return false
	end

	if requirements.RequiresFalseFishingInput and game.CurrentRun.Hero.FishingInput then
		return false
	end

	if requirements.RequiredMinDoorsClosedInRoom ~= nil then
		local roomName = requirements.RequiredMinDoorsClosedRoom or game.CurrentRun.CurrentRoom.Name
		if TableLength(game.CurrentRun.ClosedDoors[roomName] or {}) < requirements.RequiredMinDoorsClosedInRoom then
			return false
		end
	end
	if requirements.RequiredMaxDoorsClosedInRoom ~= nil then
		local roomName = requirements.RequiredMaxDoorsClosedRoom or game.CurrentRun.CurrentRoom.Name
		if TableLength(game.CurrentRun.ClosedDoors[roomName] or {}) > requirements.RequiredMaxDoorsClosedInRoom then
			return false
		end
	end

	if requirements.RequiredScreenOpen ~= nil and not IsScreenOpen(requirements.RequiredScreenOpen) then
		return false
	end
	if requirements.RequiredFalseScreenOpen ~= nil and IsScreenOpen(requirements.RequiredFalseScreenOpen) then
		return false
	end
	if requirements.RequiredFalseScreensOpen ~= nil then
		for k, screenName in pairs(requirements.RequiredFalseScreensOpen) do
			if IsScreenOpen(screenName) then
				return false
			end
		end
	end

	if requirements.RequiredScreenViewed ~= nil and not game.GameState.ScreensViewed[requirements.RequiredScreenViewed] then
		return false
	end

	if requirements.RequiredScreenViewedFalse ~= nil and game.GameState.ScreensViewed[requirements.RequiredScreenViewedFalse] then
		return false
	end

	if requirements.RequiresNewMusicTracks ~= nil then
		local anyTrue = false
		for trackName, trackData in pairs(MusicPlayerTrackData) do
			if game.GameState.WorldUpgrades[trackData.Name] and not game.GameState.WorldUpgradesViewed[trackData.Name] then
				-- Owned but not viewed
				anyTrue = true
				break
			end
		end
		if not anyTrue then
			return false
		end
	end

	return true
end
