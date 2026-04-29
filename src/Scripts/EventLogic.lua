-- D_Hub is visited multiple times per run, but the ZagContractReward should only be collectable once
function mod.ModsNikkelMHadesBiomes_DHubZagContractRewardUsed(consumableItem, args, user)
	game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomes_ZagContractRewardPickedUp = true
	game.CallFunctionName(consumableItem.ModsNikkelMHadesBiomes_OriginalOnUsedFunctionName, consumableItem, args, user)
end

modutil.mod.Path.Context.Wrap("SpawnZagContractRewards", function(room, args)
	if room.Name == "D_Hub" and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		modutil.mod.Path.Wrap("SpawnStoreItemInWorld", function(base, itemData, kitId)
			local item = base(itemData, kitId)
			if item then
				item.ModsNikkelMHadesBiomes_OriginalOnUsedFunctionName = item.OnUsedFunctionName
				item.OnUsedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomes_DHubZagContractRewardUsed"
			end

			return item
		end)
	end
end)

modutil.mod.Path.Wrap("SpawnZagContractRewards", function(base, room, args)
	if not game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun or room.Name ~= "D_Hub" then
		return base(room, args)
	end

	if room.ModsNikkelMHadesBiomes_ZagContractRewardPickedUp then
		if args and args.ActivateGroups then
			Activate({ Names = args.ActivateGroups })
		end

		return
	end

	-- Prevent FillInShopOptions from overwriting the shop's persistent store with ZagContract options
	local savedPersistentStore = game.CurrentRun.ModsNikkelMHadesBiomesPersistentStore
	base(room, args)
	game.CurrentRun.ModsNikkelMHadesBiomesPersistentStore = savedPersistentStore
end)
