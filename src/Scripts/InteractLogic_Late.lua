modutil.mod.Path.Context.Wrap.Static("AttemptRerollDoor", function(rerollRun, door)
	modutil.mod.Path.Wrap("ChooseRoomReward", function(base, run, room, rewardStoreName, previouslyChosenRewards)
		-- Update the previouslyChosenRewards to include the base version of a potential Styx miniboss room reward
		if run and run.ModsNikkelMHadesBiomesIsModdedRun and room and room.UseOptionalOverrides and room.RewardConsumableOverrideMap then
			for index, offeredDoor in pairs(game.MapState.OfferedExitDoors) do
				if offeredDoor.Room ~= nil and offeredDoor.Room.ModsNikkelMHadesBiomesStyxMinibossRoomOriginalReward ~= nil then
					table.insert(previouslyChosenRewards,
						{
							RewardType = offeredDoor.Room.ModsNikkelMHadesBiomesStyxMinibossRoomOriginalReward,
							ForceLootName = offeredDoor.Room.ForceLootName
						})
				end
			end
		end

		return base(run, room, rewardStoreName, previouslyChosenRewards)
	end)

	-- For Styx miniboss rooms, we need to make sure to use the upgraded reward versions
	modutil.mod.Path.Wrap("SetupRoomReward", function(base, run, room, rewardsChosen)
		if run and run.ModsNikkelMHadesBiomesIsModdedRun and room and room.UseOptionalOverrides and room.RewardConsumableOverrideMap then
			local overrideConsumable = room.RewardConsumableOverrideMap[room.ChosenRewardType]
			if overrideConsumable ~= nil then
				room.ChosenRewardType = overrideConsumable
			end
		end

		return base(run, room, rewardsChosen)
	end)
end)
