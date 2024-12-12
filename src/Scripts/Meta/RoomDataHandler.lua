-- Contains generic functions to handle migrating room data from Hades to Hades II

-- Loads RoomData from a file in Hades
function mod.LoadHadesRoomData(fileName)
	local pathName = rom.path.combine(mod.hadesGameFolder, "Content/Scripts", fileName)
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		return RoomSetData
	else
		print("Error loading RoomData: " .. err)
	end
end

-- Applies modifications to base room objects, and then adds the new room objects to the game
function mod.ApplyModificationsAndInherit(base, modifications)
	-- Apply modifications
	for roomName, roomData in pairs(modifications) do
		for key, value in pairs(roomData) do
			base[roomName][key] = value
		end
	end

	-- Add a name key
	for roomName, roomData in pairs(base) do
		roomData.Name = roomName
	end

	-- Process data inheritance and add the new data to the game's global
	game.AddTableKeysCheckDupes(game.RoomData, base)
	for roomName, roomData in pairs(base) do
		game.ProcessDataInheritance(roomData, game.RoomData)
		base[roomName] = roomData
	end
	game.AddTableKeysCheckDupes(game.RoomData, base)
end
