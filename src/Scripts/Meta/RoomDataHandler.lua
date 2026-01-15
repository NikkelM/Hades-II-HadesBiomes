-- Contains generic functions to handle migrating room data from Hades to Hades II

-- Applies modifications to base room objects, and then adds the new room objects to the game
function mod.ApplyModificationsAndInheritRoomData(base, modifications, replacements, roomSetName)
	-- Rename keys
	local roomKeyReplacements = {
		BoonRaritiesOverride = {
			LegendaryChance = "Legendary",
			EpicChance = "Epic",
			RareChance = "Rare",
		},
		SellTraitShopChance = "SellShopSpawnChance",
		SellTraitShopRequirements = "SellShopRequirements",
	}
	for roomName, roomData in pairs(base) do
		mod.RenameKeys(roomData, roomKeyReplacements, roomName)
	end
	for oldName, newName in pairs(mod.EnemyNameMappings) do
		mod.UpdateField(modifications, oldName, newName, { "BackupCauseOfDeath" }, "RoomDataHandler modifications")
		mod.UpdateField(replacements, oldName, newName, { "BackupCauseOfDeath" }, "RoomDataHandler replacements")
		mod.UpdateField(modifications, oldName, newName,
			{ "EncounterSpecificDataOverwrites", "*", "BackupCauseOfDeath" }, "RoomDataHandler modifications")
		mod.UpdateField(replacements, oldName, newName,
			{ "EncounterSpecificDataOverwrites", "*", "BackupCauseOfDeath" }, "RoomDataHandler replacements")
	end

	-- Apply replacements
	for roomName, roomData in pairs(replacements) do
		if not base[roomName] then
			base[roomName] = {}
		end
		mod.ApplyModifications(base[roomName], roomData, true)
	end

	-- Apply modifications
	for roomName, roomData in pairs(modifications) do
		if not base[roomName] then
			base[roomName] = {}
		end
		mod.ApplyModifications(base[roomName], roomData)
	end

	-- Modify InspectPoint Storyteller voiceline identifiers
	-- Do this before the inheritance processing
	for roomName, roomData in pairs(base) do
		if roomData.InspectPoints then
			for inspectPointId, inspectPointData in pairs(roomData.InspectPoints) do
				if inspectPointData.InteractTextLineSets then
					for setName, setData in pairs(inspectPointData.InteractTextLineSets) do
						for _, line in ipairs(setData) do
							if line.Cue and line.Cue:find("^/VO/Storyteller_") then
								line.Cue = line.Cue:gsub("^/VO/Storyteller_", "/VO/Megaera_0")
							end
						end
					end
				end
			end
		end
	end

	-- Process data inheritance and add the new data to the game's globals
	-- Once for the RoomSetData of the current set, and once to the global RoomData containing all rooms
	if game.RoomSetData[roomSetName] == nil then
		game.RoomSetData[roomSetName] = base
	else
		mod.AddTableKeysSkipDupes(game.RoomSetData[roomSetName], base, nil)
	end

	base = mod.AddTableKeysSkipDupes(game.RoomData, base, nil)

	for roomName, roomData in pairs(base) do
		if not roomData.InheritFrom then
			roomData.InheritFrom = {}
		end
		table.insert(roomData.InheritFrom, "ModsNikkelMHadesBiomesBaseRoom")

		roomData.Name = roomName

		game.ProcessDataInheritance(roomData, game.RoomData)
		base[roomName] = roomData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.RoomData, base)
end
