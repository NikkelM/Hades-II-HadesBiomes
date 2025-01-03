-- Contains generic functions to handle migrating room data from Hades to Hades II

-- Loads RoomData from a file in Hades
function mod.LoadHadesRoomData(fileName)
	local originalRoomData = game.DeepCopyTable(game.RoomData)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		local hadesRoomData = RoomSetData
		game.RoomData = originalRoomData
		return hadesRoomData
	else
		mod.DebugPrint("Error loading RoomData: " .. err)
	end
end

-- Applies modifications to base room objects, and then adds the new room objects to the game
function mod.ApplyModificationsAndInheritRoomData(base, modifications)
	-- Apply modifications
	for roomName, roomData in pairs(modifications) do
		for key, value in pairs(roomData) do
			base[roomName][key] = value
		end
	end

	-- Process data inheritance and add the new data to the game's global
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
