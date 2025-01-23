-- Called when a door reward preview is created
-- For Hades Tartartus doors, we use the original Hades backing art, so we set ReUseIds which prevents the Hades II backing from being created
modutil.mod.Path.Wrap("CreateDoorRewardPreview", function(base, exitDoor, chosenRewardType, chosenLootName, index, args)
	args = args or {}

	if exitDoor.Name == "TartarusDoor03b" then
		local room = exitDoor.Room
		chosenRewardType = chosenRewardType or room.ChosenRewardType

		index = index or 1

		local doorIconOffsetX = 0
		local doorIconOffsetY = 30
		local doorIconOffsetZ = 210
		doorIconOffsetZ = doorIconOffsetZ + ((index - 1) * 180)

		local doorIconIsometricShiftX = -6
		local doorIconIsometricShiftZ = -3

		if chosenRewardType == "MaxHealthDrop" then
			doorIconOffsetY = 40
		end

		if IsHorizontallyFlipped({ Id = exitDoor.ObjectId }) then
			doorIconOffsetX = doorIconOffsetX * -1
			doorIconIsometricShiftX = doorIconIsometricShiftX * -1
		end

		-- Dummy backing - is not attached to the door, so the Hades II preview object isn't visible
		local backingId = SpawnObstacle({ Name = "BlankGeoObstacle", Group = "Combat_UI_World" })

		exitDoor.RewardPreviewBackingIds = exitDoor.RewardPreviewBackingIds or {}
		table.insert(exitDoor.RewardPreviewBackingIds, backingId)

		-- Reward icon
		local doorIconId = SpawnObstacle({
			Name = "RoomRewardPreview",
			Group = "Combat_UI",
			DestinationId = exitDoor.ObjectId,
			OffsetY = doorIconOffsetY,
			OffsetX = doorIconOffsetX + doorIconIsometricShiftX,
			OffsetZ = doorIconOffsetZ + doorIconIsometricShiftZ
		})
		SetAlpha({ Id = doorIconId, Fraction = 0.0, Duration = 0.0 })
		SetAlpha({ Id = doorIconId, Fraction = 1.0, Duration = 0.1 })
		SetScale({ Id = doorIconId, Fraction = 0.85 })

		exitDoor.RewardPreviewIconIds = exitDoor.RewardPreviewIconIds or {}
		table.insert(exitDoor.RewardPreviewIconIds, doorIconId)

		if IsHorizontallyFlipped({ Id = exitDoor.ObjectId }) then
			local ids = { doorIconId, backingId }
			FlipHorizontal({ Ids = ids })
		end

		args.ReUseIds = true
	end

	base(exitDoor, chosenRewardType, chosenLootName, index, args)

end)
