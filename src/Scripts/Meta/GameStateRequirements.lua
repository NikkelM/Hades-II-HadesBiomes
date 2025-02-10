-- Handles translation of GameStateRequirements to the Hades II format

---Maps any GameStateRequirements in the Hades format to the Hades II in the path, using the given context.
---@param base table The table containing the table for which to map the requirements, under the requirementsPath.
---@param requirementsPath table The path within base to where the original requirement(s) are located that should be mapped.
function mod.MapGameStateRequirements(base, requirementsPath)
	---Maps a Hades requirement to a Hades II GameStateRequirement.
	---@param hadesBaseTable any The requirements in Hades. Can have a number of different formats.
	---@return table GameStateRequirements A table containing the requirements in the Hades II format, to be assigned to GameStateRequirements = { ... }.
	local function mapSpecificRequirements(hadesBaseTable)
		local hades2Requirements = {}

		if hadesBaseTable.RequiredSupportAINames then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "SupportAINames" },
				Value = hadesBaseTable.RequiredSupportAINames,
				Comparison = "=="
			})
			hadesBaseTable.RequiredSupportAINames = nil
		end
		if hadesBaseTable.RequiredMaxSupportAINames then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "SupportAINames" },
				Value = hadesBaseTable.RequiredMaxSupportAINames,
				Comparison = "<=",
				UseLength = true
			})
			hadesBaseTable.RequiredMaxSupportAINames = nil
		end
		if hadesBaseTable.RequiredMinActiveMetaUpgradeLevel then
			table.insert(hades2Requirements, {
				Path = { "GameState", "ShrineUpgrades", hadesBaseTable.RequiredMinActiveMetaUpgradeLevel.Name },
				Value = hadesBaseTable.RequiredMinActiveMetaUpgradeLevel.Count,
				Comparison = ">="
			})
			hadesBaseTable.RequiredMinActiveMetaUpgradeLevel = nil
		end
		if hadesBaseTable.RequiredRoom then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				Value = hadesBaseTable.RequiredRoom,
				Comparison = "=="
			})
			hadesBaseTable.RequiredRoom = nil
		end
		if hadesBaseTable.RequiredFalseTextLines then
			table.insert(hades2Requirements, {
				Path = { "GameState", "TextLinesRecord" },
				HasNone = hadesBaseTable.RequiredFalseTextLines,
			})
			hadesBaseTable.RequiredFalseTextLines = nil
		end
		if hadesBaseTable.RequiredFalseTextLinesThisRun then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "TextLinesRecord" },
				HasNone = hadesBaseTable.RequiredFalseTextLinesThisRun,
			})
			hadesBaseTable.RequiredFalseTextLinesThisRun = nil
		end
		if hadesBaseTable.RequiredAnyTextLinesLastRun then
			table.insert(hades2Requirements, {
				Path = { "PrevRun", "TextLinesRecord" },
				HasAny = hadesBaseTable.RequiredAnyTextLinesLastRun,
			})
			hadesBaseTable.RequiredAnyTextLinesLastRun = nil
		end
		if hadesBaseTable.RequiredFalseTextLinesLastRun then
			table.insert(hades2Requirements, {
				Path = { "PrevRun", "TextLinesRecord" },
				HasNone = hadesBaseTable.RequiredFalseTextLinesLastRun,
			})
			hadesBaseTable.RequiredFalseTextLinesLastRun = nil
		end
		if hadesBaseTable.RequiredTextLines then
			table.insert(hades2Requirements, {
				Path = { "GameState", "TextLinesRecord" },
				HasAll = hadesBaseTable.RequiredTextLines,
			})
			hadesBaseTable.RequiredTextLines = nil
		end
		if hadesBaseTable.RequiredAnyTextLines then
			table.insert(hades2Requirements, {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = hadesBaseTable.RequiredAnyTextLines,
			})
			hadesBaseTable.RequiredAnyTextLines = nil
		end
		if hadesBaseTable.RequiredMinAnyTextLines then
			table.insert(hades2Requirements, {
				Path = { "GameState", "TextLinesRecord" },
				CountOf = hadesBaseTable.RequiredMinAnyTextLines.TextLines,
				Comparison = ">=",
				Value = hadesBaseTable.RequiredMinAnyTextLines.Value,
			})
			hadesBaseTable.RequiredMinAnyTextLines = nil
		end
		if hadesBaseTable.RequiredMaxAnyTextLines then
			table.insert(hades2Requirements, {
				Path = { "GameState", "TextLinesRecord" },
				CountOf = hadesBaseTable.RequiredMaxAnyTextLines.TextLines,
				Comparison = "<=",
				Value = hadesBaseTable.RequiredMaxAnyTextLines.Value,
			})
			hadesBaseTable.RequiredMaxAnyTextLines = nil
		end
		if hadesBaseTable.RequiredTextLinesThisRun then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "TextLinesRecord" },
				HasAll = hadesBaseTable.RequiredTextLinesThisRun,
			})
			hadesBaseTable.RequiredTextLinesThisRun = nil
		end
		if hadesBaseTable.RequiredAnyTextLinesThisRun then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "TextLinesRecord" },
				HasAny = hadesBaseTable.RequiredAnyTextLinesThisRun,
			})
			hadesBaseTable.RequiredAnyTextLinesThisRun = nil
		end
		if hadesBaseTable.RequiredTextLinesThisRoom then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "CurrentRoom", "TextLinesRecord" },
				HasAll = hadesBaseTable.RequiredTextLinesThisRoom,
			})
			hadesBaseTable.RequiredTextLinesThisRoom = nil
		end
		if hadesBaseTable.RequiredFalseTextLinesThisRoom then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "CurrentRoom", "TextLinesRecord" },
				HasNone = hadesBaseTable.RequiredFalseTextLinesThisRoom,
			})
			hadesBaseTable.RequiredFalseTextLinesThisRoom = nil
		end
		if hadesBaseTable.RequiredQueuedTextLines then
			table.insert(hades2Requirements, {
				FunctionName = "RequiredQueuedTextLine",
				FunctionArgs = { IsAny = hadesBaseTable.RequiredQueuedTextLines, },
			})
			hadesBaseTable.RequiredQueuedTextLines = nil
		end
		if hadesBaseTable.RequiredAnyQueuedTextLines then
			table.insert(hades2Requirements, {
				FunctionName = "RequiredAnyQueuedTextLine",
				FunctionArgs = { IsAny = hadesBaseTable.RequiredAnyQueuedTextLines, },
			})
			hadesBaseTable.RequiredAnyQueuedTextLines = nil
		end
		if hadesBaseTable.RequiredFalseQueuedTextLines then
			table.insert(hades2Requirements, {
				FunctionName = "RequiredQueuedTextLine",
				FunctionArgs = { IsNone = hadesBaseTable.RequiredFalseQueuedTextLines },
			})
			hadesBaseTable.RequiredFalseQueuedTextLines = nil
		end
		if hadesBaseTable.RequiredAnyOtherTextLines then
			table.insert(hades2Requirements, {
				Path = { "GameState", "TextLinesRecord" },
				HasAny = hadesBaseTable.RequiredAnyOtherTextLines,
			})
			hadesBaseTable.RequiredAnyOtherTextLines = nil
		end
		if hadesBaseTable.ConsecutiveDeathsInRoom then
			table.insert(hades2Requirements, {
				FunctionName = "RequiredConsecutiveDeathsInRoom",
				FunctionArgs = { Name = hadesBaseTable.ConsecutiveDeathsInRoom.Name, Count = hadesBaseTable.ConsecutiveDeathsInRoom.Count },
			})
			hadesBaseTable.ConsecutiveDeathsInRoom = nil
		end
		if hadesBaseTable.ConsecutiveClearsOfRoom then
			table.insert(hades2Requirements, {
				FunctionName = "RequiredConsecutiveClearsOfRoom",
				FunctionArgs = { Name = hadesBaseTable.ConsecutiveClearsOfRoom.Name, Count = hadesBaseTable.ConsecutiveClearsOfRoom.Count },
			})
			hadesBaseTable.ConsecutiveClearsOfRoom = nil
		end
		if hadesBaseTable.RequiredKills then
			for enemyName, enemyCount in pairs(hadesBaseTable.RequiredKills) do
				table.insert(hades2Requirements, {
					Path = { "GameState", "EnemyKills", enemyName },
					Comparison = ">=",
					Value = enemyCount,
				})
			end
			hadesBaseTable.RequiredKills = nil
		end
		if hadesBaseTable.RequiredGodLoot then
			table.insert(hades2Requirements, {
				PathTrue = { "CurrentRun", "UseRecord", hadesBaseTable.RequiredGodLoot },
			})
			hadesBaseTable.RequiredGodLoot = nil
		end
		if hadesBaseTable.RequiredLootThisRun then
			table.insert(hades2Requirements, {
				PathTrue = { "CurrentRun", "LootRecord", hadesBaseTable.RequiredLootThisRun },
			})
			hadesBaseTable.RequiredLootThisRun = nil
		end
		if hadesBaseTable.RequiredFalseGodLoot then
			table.insert(hades2Requirements, {
				PathFalse = { "CurrentRun", "UseRecord", hadesBaseTable.RequiredFalseGodLoot },
			})
			hadesBaseTable.RequiredFalseGodLoot = nil
		end
		if hadesBaseTable.RequiredFalseGodLoots then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "UseRecord" },
				HasNone = hadesBaseTable.RequiredFalseGodLoots,
			})
			hadesBaseTable.RequiredFalseGodLoots = nil
		end
		if hadesBaseTable.RequiredWeapon then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = { hadesBaseTable.RequiredWeapon },
			})
			hadesBaseTable.RequiredWeapon = nil
		end
		if hadesBaseTable.RequiredAnyWeapon then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasAny = hadesBaseTable.RequiredAnyWeapon,
			})
			hadesBaseTable.RequiredAnyWeapon = nil
		end
		if hadesBaseTable.RequiredFalseWeapon then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "Hero", "Weapons" },
				HasNone = { hadesBaseTable.RequiredFalseWeapon },
			})
			hadesBaseTable.RequiredFalseWeapon = nil
		end
		if hadesBaseTable.RequiredMinWeaponKills then
			for weaponName, weaponKills in pairs(hadesBaseTable.RequiredMinWeaponKills) do
				table.insert(hades2Requirements, {
					Path = { "GameState", "WeaponKills", weaponName },
					Comparison = ">=",
					Value = weaponKills,
				})
			end
			hadesBaseTable.RequiredMinWeaponKills = nil
		end
		if hadesBaseTable.RequiredFalseSeenRoomThisRun then
			table.insert(hades2Requirements, {
				PathFalse = { "CurrentRun", "RoomsEntered", hadesBaseTable.RequiredFalseSeenRoomThisRun },
			})
			hadesBaseTable.RequiredFalseSeenRoomThisRun = nil
		end
		if hadesBaseTable.RequiredFalseSeenRoomsThisRun then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "RoomsEntered" },
				HasNone = hadesBaseTable.RequiredFalseSeenRoomsThisRun,
			})
			hadesBaseTable.RequiredFalseSeenRoomsThisRun = nil
		end
		if hadesBaseTable.RequiredMinTimesSeenRoom then
			for roomName, roomCount in pairs(hadesBaseTable.RequiredMinTimesSeenRoom) do
				table.insert(hades2Requirements, {
					Path = { "GameState", "RoomsEntered", roomName },
					Comparison = ">=",
					Value = roomCount,
				})
			end
			hadesBaseTable.RequiredMinTimesSeenRoom = nil
		end
		if hadesBaseTable.RequiredMaxTimesSeenRoom then
			for roomName, roomCount in pairs(hadesBaseTable.RequiredMaxTimesSeenRoom) do
				table.insert(hades2Requirements, {
					Path = { "GameState", "RoomsEntered", roomName },
					Comparison = "<=",
					Value = roomCount,
				})
			end
			hadesBaseTable.RequiredMaxTimesSeenRoom = nil
		end
		if hadesBaseTable.RequiredLastKilledByUnits then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "KilledByName" },
				IsAny = hadesBaseTable.RequiredLastKilledByUnits,
			})
			hadesBaseTable.RequiredLastKilledByUnits = nil
		end
		if hadesBaseTable.RequiredLastKilledByWeaponNames then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "KilledByName" },
				IsAny = hadesBaseTable.RequiredLastKilledByWeaponNames,
			})
			hadesBaseTable.RequiredLastKilledByWeaponNames = nil
		end
		if hadesBaseTable.RequiredRunHasOneOfTraits then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "TraitsTaken" },
				CountOf = hadesBaseTable.RequiredRunHasOneOfTraits,
				Comparison = ">=",
				Value = 1,
			})
			hadesBaseTable.RequiredRunHasOneOfTraits = nil
		end
		if hadesBaseTable.RequiredHasEffect then
			-- TODO: Test
			table.insert(hades2Requirements, {
				PathFromArgs = true,
				Path = { "EffectName" },
				IsAny = hadesBaseTable.RequiredHasEffect,
			})
			hadesBaseTable.RequiredHasEffect = nil
		end
		if hadesBaseTable.RequiredFalseHasEffect then
			-- TODO: Test
			table.insert(hades2Requirements, {
				PathFromArgs = true,
				Path = { "EffectName" },
				IsNone = hadesBaseTable.RequiredFalseHasEffect,
			})
			hadesBaseTable.RequiredFalseHasEffect = nil
		end
		if hadesBaseTable.RequiredKeepsake then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasAny = { hadesBaseTable.RequiredKeepsake },
			})
			-- Nested as will only be used if RequiredKeepsake is also true
			if hadesBaseTable.RequiresMaxKeepsake then
				table.insert(hades2Requirements, {
					FunctionName = "IsKeepsakeMaxed",
					FunctionArgs = hadesBaseTable.RequiredKeepsake,
				})
				hadesBaseTable.RequiresMaxKeepsake = nil
			end
			hadesBaseTable.RequiredKeepsake = nil
		end
		if hadesBaseTable.RequiredAnyKeepsakes then
			table.insert(hades2Requirements, {
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasAny = hadesBaseTable.RequiredAnyKeepsakes,
			})
			hadesBaseTable.RequiredAnyKeepsakes = nil
		end

		return hades2Requirements
	end

	if #requirementsPath == 0 then
		-- We can and want to only map requirements if the object we are looking at is a table
		if type(base) == "table" then
			base.GameStateRequirements = base.GameStateRequirements or {}
			local mappedRequirements = mapSpecificRequirements(base)
			if next(mappedRequirements) then
				base.GameStateRequirements = mappedRequirements
			end
			if next(base.GameStateRequirements) == nil then
				base.GameStateRequirements = nil
			end
		end
		return base
	else
		-- Go one level deeper
		local key = table.remove(requirementsPath, 1)
		if key == '*' and type(base) == "table" then
			for k, v in pairs(base) do
				base[k] = mod.MapGameStateRequirements(v, { table.unpack(requirementsPath) })
			end
		elseif base ~= nil and base[key] then
			base[key] = mod.MapGameStateRequirements(base[key], requirementsPath)
		end
		return base
	end
end
