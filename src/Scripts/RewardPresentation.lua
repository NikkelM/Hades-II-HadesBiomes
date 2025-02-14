-- Called when a door reward preview is created
-- For Hades Tartartus doors, we use the original Hades backing art, so we set ReUseIds which prevents the Hades II backing from being created
modutil.mod.Path.Wrap("CreateDoorRewardPreview", function(base, exitDoor, chosenRewardType, chosenLootName, index, args)
	args = args or {}

	if exitDoor.Name == "TartarusDoor03b" then
		local room = exitDoor.Room
		chosenRewardType = chosenRewardType or room.ChosenRewardType

		index = index or 1

		local modifiedProperties = {
			doorIconOffsetX = 0,
			doorIconOffsetY = 30,
			doorIconScale = 0.85,
		}
		local doorIconOffsetZ = 210
		doorIconOffsetZ = doorIconOffsetZ + ((index - 1) * 180)

		local doorIconIsometricShiftX = -6
		local doorIconIsometricShiftZ = -3

		local offsetMappings = {
			RoomOpening = {
				doorIconOffsetY = 20,
			},
			A_Combat03 = {
				doorIconOffsetY = 40,
			},
			A_Combat06 = {
				doorIconOffsetY = 55,
			},
			A_Combat10 = {
				doorIconOffsetY = 30,
			},
			A_Combat11 = {
				doorIconOffsetY = 35,
			},
			A_Combat19 = {
				doorIconOffsetY = 35,
			},
			A_Combat24 = {
				doorIconOffsetY = 40,
			},
			A_MiniBoss01 = {
				doorIconOffsetY = 62,
			},
			A_MiniBoss02 = {
				doorIconOffsetY = 62,
			},
			A_MiniBoss03 = {
				doorIconOffsetY = 62,
			},
			A_MiniBoss04 = {
				doorIconOffsetY = 62,
			},
			A_PreBoss01 = {
				doorIconOffsetY = 20,
				doorIconScale = 0.75,
			},
			A_Boss01 = {
				doorIconOffsetY = -20,
			},
		}

		local skipModifiers = {
			Shop = { doorIconOffsetX = true, doorIconOffsetY = true, doorIconScale = true },
			StackUpgrade = { doorIconScale = true },
		}

		local properties = { "doorIconOffsetX", "doorIconOffsetY", "doorIconScale" }
		if offsetMappings[game.CurrentRun.CurrentRoom.Name] then
			for _, property in ipairs(properties) do
				if not skipModifiers[chosenRewardType] or (skipModifiers[chosenRewardType] and not skipModifiers[chosenRewardType][property]) then
					modifiedProperties[property] = offsetMappings[game.CurrentRun.CurrentRoom.Name][property] or
							modifiedProperties[property]
				end
			end
		end

		if IsHorizontallyFlipped({ Id = exitDoor.ObjectId }) then
			modifiedProperties.doorIconOffsetX = modifiedProperties.doorIconOffsetX * -1
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
			OffsetY = modifiedProperties.doorIconOffsetY,
			OffsetX = modifiedProperties.doorIconOffsetX + doorIconIsometricShiftX,
			OffsetZ = doorIconOffsetZ + doorIconIsometricShiftZ
		})
		SetAlpha({ Id = doorIconId, Fraction = 0.0, Duration = 0.0 })
		SetAlpha({ Id = doorIconId, Fraction = 1.0, Duration = 0.1 })
		if skipModifiers[chosenRewardType] == nil or (skipModifiers[chosenRewardType] and not skipModifiers[chosenRewardType].doorIconScale) then
			SetScale({ Id = doorIconId, Fraction = modifiedProperties.doorIconScale })
		end

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
