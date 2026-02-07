modutil.mod.Path.Context.Wrap.Static("AttemptRerollDoor", function(rerollRun, door)
	modutil.mod.Path.Wrap("ChooseRoomReward", function(base, run, room, rewardStoreName, previouslyChosenRewards, args)
		-- Update the previouslyChosenRewards to include the base version of a potential Styx miniboss/ShrineChallenge room reward
		if run and run.ModsNikkelMHadesBiomesIsModdedRun and room and room.UseOptionalOverrides and room.RewardConsumableOverrideMap then
			for index, offeredDoor in pairs(game.MapState.OfferedExitDoors) do
				if offeredDoor.Room ~= nil and offeredDoor.Room.ModsNikkelMHadesBiomesOriginalOverrideReward ~= nil then
					table.insert(previouslyChosenRewards,
						{
							RewardType = offeredDoor.Room.ModsNikkelMHadesBiomesOriginalOverrideReward,
							ForceLootName = offeredDoor.Room.ForceLootName
						})
				end
			end
		end

		return base(run, room, rewardStoreName, previouslyChosenRewards, args)
	end)

	-- For Styx miniboss rooms, we need to make sure to use the upgraded reward versions
	modutil.mod.Path.Wrap("SetupRoomReward", function(base, currentRun, room, previouslyChosenRewards, args)
		if currentRun and currentRun.ModsNikkelMHadesBiomesIsModdedRun and room and room.UseOptionalOverrides and room.RewardConsumableOverrideMap then
			local overrideConsumable = room.RewardConsumableOverrideMap[room.ChosenRewardType]
			if overrideConsumable ~= nil then
				room.ChosenRewardType = overrideConsumable
			end
		end

		return base(currentRun, room, previouslyChosenRewards, args)
	end)

	modutil.mod.Path.Wrap("CreateDoorRewardPreview",
		function(base, exitDoor, chosenRewardType, chosenLootName, index, args)
			if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and mod.HadesExitDoorObstacleNames[exitDoor.Name] then
				local prevChosenRewardType = modutil.mod.Locals.Stacked(2).prevChosenRewardType
				-- Rescale the reward icon for doors in modded runs that need them to be smaller to fit in the new frames
				if game.CurrentRun.CurrentRoom.ChosenRewardType == "Devotion" and prevChosenRewardType ~= "Devotion" then
					SetScale({ Ids = exitDoor.RewardPreviewIconIds, Fraction = 0.0, Duration = 0.1 })
				else
					SetScale({
						Ids = exitDoor.RewardPreviewIconIds,
						Fraction = mod.HadesDoorRoomRewardIconScales[exitDoor.Name] or 1.0,
						Duration = 0.1
					})
				end
			end

			return base(exitDoor, chosenRewardType, chosenLootName, index, args)
		end)
end)
