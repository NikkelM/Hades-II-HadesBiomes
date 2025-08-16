modutil.mod.Path.Wrap("FillInShopOptions", function(base, args)
	if args == nil then
		args = {}
	end

	-- TODO: Test if this works
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and args.RoomName and game.RoomData[args.RoomName] and game.RoomData[args.RoomName].PersistentStore then
		print("Checking previous store")
		local store = game.GetPreviousStore(args)
		if store ~= nil then
			mod.PrintTable(store)
			return store
		end
	end
	return base(args)
end)


function game.GetPreviousStore(args)
	print("GetPreviousStore")
	if game.CurrentRun.RoomCreations[args.RoomName] == nil then
		print("No previous room creation")
		return nil
	end

	for roomIndex = #game.CurrentRun.RoomHistory, 1, -1 do
		local room = game.CurrentRun.RoomHistory[roomIndex]
		if room.Name == args.RoomName then
			print("Returning previous store")
			return { StoreOptions = game.DeepCopyTable(room.Store.StoreOptions) }
		end
	end
	return nil
end
