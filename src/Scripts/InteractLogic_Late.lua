modutil.mod.Path.Context.Wrap.Static("AttemptRerollDoor", function(rerollRun, door)
	modutil.mod.Path.Wrap("ChooseRoomReward", function(base, run, room, rewardStoreName, previouslyChosenRewards, args)
		-- Styx miniboss/ShrineChallenge doors upgrade base rewards
		-- Vanilla's exclusion uses the upgraded ChosenRewardType, which doesn't match the base reward pool
		-- Reverse-map each door's upgraded reward to its base version so ChooseRoomReward properly excludes it
		if run and run.ModsNikkelMHadesBiomesIsModdedRun and room and room.UseOptionalOverrides and room.RewardConsumableOverrideMap then
			for _, offeredDoor in pairs(game.MapState.OfferedExitDoors) do
				if offeredDoor.Room ~= nil and offeredDoor.Room.UseOptionalOverrides and offeredDoor.Room.ChosenRewardType ~= nil then
					for baseReward, upgradedReward in pairs(room.RewardConsumableOverrideMap) do
						if upgradedReward == offeredDoor.Room.ChosenRewardType then
							table.insert(previouslyChosenRewards,
								{ RewardType = baseReward, ForceLootName = offeredDoor.Room.ForceLootName })
							break
						end
					end
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
			base(exitDoor, chosenRewardType, chosenLootName, index, args)

			if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and mod.HadesExitDoorObstacleNames[exitDoor.Name] then
				local prevChosenRewardType = modutil.mod.Locals.Stacked(2).prevChosenRewardType
				local rewardType = chosenRewardType or (exitDoor.Room and exitDoor.Room.ChosenRewardType)
				-- Rescale the reward icon for doors in modded runs that need them to be smaller to fit in the new frames
				if game.CurrentRun.CurrentRoom.ChosenRewardType == "Devotion" and prevChosenRewardType ~= "Devotion" then
					SetScale({ Ids = exitDoor.RewardPreviewIconIds, Fraction = 0.0, Duration = 0.1 })
				else
					local baseScale = mod.HadesDoorRoomRewardIconScales[exitDoor.Name] or 1.0
					local rewardTypeDelta = (mod.HadesDoorRewardTypeModifications[rewardType] and mod.HadesDoorRewardTypeModifications[rewardType].doorIconScale) or
							0
					SetScale({
						Ids = exitDoor.RewardPreviewIconIds,
						Fraction = baseScale + rewardTypeDelta,
						Duration = 0.1
					})
				end
			end
		end)
end)
