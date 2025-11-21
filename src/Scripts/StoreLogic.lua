modutil.mod.Path.Wrap("FillInShopOptions", function(base, args)
	if args == nil then
		args = {}
	end

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- In Hades II RunShopGeneration(), the room name is set to the previous room's name by accident
		args.RoomName = game.CurrentRun.CurrentRoom.Name

		if args.RoomName and game.RoomData[args.RoomName] and game.RoomData[args.RoomName].PersistentStore then
			local store = mod.GetPreviousStore(args)
			if store ~= nil then
				return store
			end
		end
	end
	local store = base(args)

	-- Save the store manually for the next time we need it
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and args.RoomName and game.RoomData[args.RoomName] and game.RoomData[args.RoomName].PersistentStore then
		game.CurrentRun.ModsNikkelMHadesBiomesPersistentStore = store
	end

	return store
end)

function mod.GetPreviousStore(args)
	if game.CurrentRun.RoomCreations[args.RoomName] == nil then
		return nil
	end

	for roomIndex = game.TableLength(game.CurrentRun.RoomHistory), 1, -1 do
		local room = game.CurrentRun.RoomHistory[roomIndex]
		if room.Name == args.RoomName then
			return { StoreOptions = game.DeepCopyTable(game.CurrentRun.ModsNikkelMHadesBiomesPersistentStore.StoreOptions) }
		end
	end
	return nil
end

modutil.mod.Path.Wrap("RemoveStoreItem", function(base, args)
	base(args)

	local roomName = game.CurrentRun.CurrentRoom.Name
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and roomName and game.RoomData[roomName] and game.RoomData[roomName].PersistentStore then
		if game.CurrentRun.CurrentRoom.FirstPurchase then
			game.CurrentRun.ModsNikkelMHadesBiomesDHubFirstPurchaseDone = true
		end

		-- Ensure the persisted store is always up to date
		game.CurrentRun.ModsNikkelMHadesBiomesPersistentStore.StoreOptions = game.CurrentRun.CurrentRoom.Store.StoreOptions
	end
end)

modutil.mod.Path.Wrap("GetShopCostMultiplier", function(base)
	local roomName = game.CurrentRun.CurrentRoom.Name
	-- The FirstPurchase property is not correctly saved in the room, so we need to manually set it in case there already was a first purchase in the room
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and roomName and game.RoomData[roomName] and game.RoomData[roomName].PersistentStore and game.CurrentRun.ModsNikkelMHadesBiomesDHubFirstPurchaseDone then
		game.CurrentRun.CurrentRoom.FirstPurchase = true
	end
	return base()
end)

modutil.mod.Path.Wrap("RestockWorldItem", function(base, replacedIndex, kitId, args)
	base(replacedIndex, kitId, args)

	local room = game.CurrentRun.CurrentRoom
	-- Store the new item in the same index in the StoreOptions as the previous one
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and room.Name and game.RoomData[room.Name] and game.RoomData[room.Name].PersistentStore then
		if room.Store and room.Store.StoreOptions and room.Store.StoreOptions[replacedIndex] then
			game.CurrentRun.ModsNikkelMHadesBiomesPersistentStore.StoreOptions = game.CurrentRun.CurrentRoom.Store
					.StoreOptions
		end
	end
end)
