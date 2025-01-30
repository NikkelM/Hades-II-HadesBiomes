-- Contains generic functions to handle migrating room data from Hades to Hades II

-- Loads RoomData from a file in Hades
function mod.LoadHadesRoomData(fileName)
	local originalRoomEventData = game.DeepCopyTable(game.RoomEventData)
	local originalRoomSetData = game.DeepCopyTable(game.RoomSetData)
	local originalRoomData = game.DeepCopyTable(game.RoomData)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		local hadesRoomData = RoomSetData
		game.RoomEventData = originalRoomEventData
		game.RoomSetData = originalRoomSetData
		game.RoomData = originalRoomData
		return hadesRoomData
	else
		mod.DebugPrint("Error loading RoomData: " .. err, 1)
	end
end

local roomKeyReplacements = {
	BoonRaritiesOverride = {
		LegendaryChance = "Legendary",
		EpicChance = "Epic",
		RareChance = "Rare",
	}
}

-- Applies modifications to base room objects, and then adds the new room objects to the game
function mod.ApplyModificationsAndInheritRoomData(base, modifications, replacements, roomSetName)
	-- Rename keys
	for roomName, roomData in pairs(base) do
		mod.RenameKeys(roomData, roomKeyReplacements, roomName)
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

	-- Process data inheritance and add the new data to the game's globals
	-- Once for the RoomSetData of the current set, and once to the global RoomData containing all rooms
	if game.RoomSetData[roomSetName] == nil then
		game.RoomSetData[roomSetName] = base
	else
		mod.AddTableKeysSkipDupes(game.RoomSetData[roomSetName], base, nil)
	end

	base = mod.AddTableKeysSkipDupes(game.RoomData, base, nil)

	for roomName, roomData in pairs(base) do
		-- Add a name key
		roomData.Name = roomName

		game.ProcessDataInheritance(roomData, game.RoomData)
		base[roomName] = roomData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.RoomData, base)
end
