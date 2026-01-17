-- Called when a door reward preview is created
-- For Hades Tartartus doors, we use the original Hades backing art, so we set ReUseIds which prevents the Hades II backing from being created
modutil.mod.Path.Wrap("CreateDoorRewardPreview", function(base, exitDoor, chosenRewardType, chosenLootName, index, args)
	args = args or {}

	if not args.ReUseIds and (exitDoor.Name == "TartarusDoor03b" or exitDoor.Name == "AsphodelBoat01b") then
		local room = exitDoor.Room
		chosenRewardType = chosenRewardType or room.ChosenRewardType

		index = index or 1
		-- Positive X is to the left, negative to the right
		-- Positive Y is down, negative up
		local properties = {
			doorIconOffsetX = 0,
			doorIconOffsetY = 30,
			doorIconScale = 0.85,
			doorIconFrontOffsetY = -140,
		}
		local doorIconOffsetZ = 210
		doorIconOffsetZ = doorIconOffsetZ + ((index - 1) * 180)

		local doorIconIsometricShiftX = -6
		local doorIconIsometricShiftZ = -3

		local offsetMappings = {}
		local skipModifiers = {}
		local additionalModifications = {
			Devotion = {
				doorIconOffsetY = -5,
			},
		}

		if exitDoor.Name == "TartarusDoor03b" then
			offsetMappings = {
				RoomOpening = {
					doorIconOffsetY = 20,
				},
				RoomSimple01 = {
					doorIconOffsetY = 55,
				},
				A_Combat03 = {
					doorIconOffsetY = 40,
				},
				A_Combat06 = {
					doorIconOffsetY = 55,
				},
				A_Combat10 = {
					doorIconOffsetY = 35,
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
					overrideSkip = true,
				},
				A_MiniBoss02 = {
					doorIconOffsetY = 62,
					overrideSkip = true,
				},
				A_MiniBoss03 = {
					doorIconOffsetY = 62,
					overrideSkip = true,
				},
				A_MiniBoss04 = {
					doorIconOffsetY = 62,
					overrideSkip = true,
				},
				A_PreBoss01 = {
					doorIconOffsetY = 20,
					doorIconScale = 0.75,
				},
				A_Boss01 = {
					doorIconOffsetY = -20,
				},
			}

			skipModifiers = {
				Shop = { doorIconOffsetX = true, doorIconOffsetY = true, doorIconScale = true },
				StackUpgrade = { doorIconScale = true },
			}

			if offsetMappings[game.CurrentRun.CurrentRoom.Name] then
				for property, value in pairs(properties) do
					if offsetMappings[game.CurrentRun.CurrentRoom.Name].overrideSkip or not skipModifiers[chosenRewardType] or (skipModifiers[chosenRewardType] and not skipModifiers[chosenRewardType][property]) then
						properties[property] = offsetMappings[game.CurrentRun.CurrentRoom.Name][property] or properties[property]
					end
				end
			end
		elseif exitDoor.Name == "AsphodelBoat01b" then
			properties = {
				doorIconOffsetX = -5,
				doorIconOffsetY = 50,
				doorIconScale = 0.85,
				doorIconFrontOffsetY = -132,
			}
		end

		-- Add the additional modifications for the chosen reward type (or multiply for scale)
		if additionalModifications[chosenRewardType] then
			for property, value in pairs(properties) do
				properties[property] = properties[property] + (additionalModifications[chosenRewardType][property] or 0)
			end
		end

		-- For rewards like Devotion that don't reuse the preview we build below
		exitDoor.RewardPreviewOffsetX = properties.doorIconOffsetX
		exitDoor.RewardPreviewOffsetY = properties.doorIconOffsetY
		exitDoor.RewardPreviewOffsetZ = doorIconOffsetZ

		if IsHorizontallyFlipped({ Id = exitDoor.ObjectId }) then
			properties.doorIconOffsetX = properties.doorIconOffsetX * -1
			doorIconIsometricShiftX = doorIconIsometricShiftX * -1
		end

		-- Dummy backing - is not attached to the door, so the Hades II preview object isn't visible
		local backingId = SpawnObstacle({ Name = "BlankGeoObstacle", Group = "Combat_UI" })
		SetAlpha({ Id = backingId, Fraction = 0.0, Duration = 0.0 })

		exitDoor.RewardPreviewBackingIds = exitDoor.RewardPreviewBackingIds or {}
		table.insert(exitDoor.RewardPreviewBackingIds, backingId)

		-- Reward icon
		local doorIconId = SpawnObstacle({
			Name = "RoomRewardPreview",
			Group = "Combat_UI",
			DestinationId = exitDoor.ObjectId,
			OffsetY = properties.doorIconOffsetY,
			OffsetX = properties.doorIconOffsetX + doorIconIsometricShiftX,
			OffsetZ = doorIconOffsetZ + doorIconIsometricShiftZ
		})
		SetAlpha({ Id = doorIconId, Fraction = 0.0, Duration = 0.0 })
		SetAlpha({ Id = doorIconId, Fraction = 1.0, Duration = 0.1 })
		if skipModifiers[chosenRewardType] == nil or (skipModifiers[chosenRewardType] and not skipModifiers[chosenRewardType].doorIconScale) then
			SetScale({ Id = doorIconId, Fraction = properties.doorIconScale })
		end

		exitDoor.RewardPreviewIconIds = exitDoor.RewardPreviewIconIds or {}
		table.insert(exitDoor.RewardPreviewIconIds, doorIconId)

		-- Not adding for Tartarus, as the previews work differently there and it's always breaking
		if exitDoor.Name == "AsphodelBoat01b" then
			-- Shimmer animation in front of the backing and reward
			exitDoor.AdditionalAttractIds = exitDoor.AdditionalAttractIds or {}
			exitDoor.DoorIconFront = SpawnObstacle({
				Name = "BlankGeoObstacle",
				Group = "Combat_Menu_Backing"
			})
			table.insert(exitDoor.AdditionalAttractIds, exitDoor.DoorIconFront)
			-- Custom: To destroy it on death (would otherwise overlay on the blacked out screen)
			table.insert(game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath, exitDoor.DoorIconFront)
			Attach({ Id = exitDoor.DoorIconFront, DestinationId = exitDoor.ObjectId, DynamicScaleOffset = true })
			SetThingProperty({
				Property = "SortMode",
				Value = exitDoor.IconSortMode or "FromParent",
				DestinationId = exitDoor.DoorIconFront
			})
			SetThingProperty({ Property = "SortBoundsScale", Value = 2, DestinationId = exitDoor.DoorIconFront })

			local rewardContainerAnim = "ModsNikkelMHadesBiomes-RoomRewardAvailable-Front"
			-- Same for both in Asphodel!
			-- if room.RewardStoreName == "MetaProgress" then
			-- 	rewardContainerAnim = rewardContainerAnim .. "_MetaReward"
			-- end

			SetAnimation({
				Name = rewardContainerAnim,
				DestinationId = exitDoor.DoorIconFront,
				OffsetY = properties.doorIconFrontOffsetY
			})
		end

		if IsHorizontallyFlipped({ Id = exitDoor.ObjectId }) then
			local ids = { doorIconId, exitDoor.DoorIconFront or nil, backingId }
			FlipHorizontal({ Ids = ids })
		end

		args.ReUseIds = true
	end

	return base(exitDoor, chosenRewardType, chosenLootName, index, args)
end)

modutil.mod.Path.Wrap("PopulateDoorRewardPreviewSubIcons", function(base, exitDoor, args)
	local subIcons = base(exitDoor, args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and not args.RewardHidden and not args.SkipRoomSubIcons then
		local room = exitDoor.Room
		if room.ForbiddenShopItemChanceSuccess then
			table.insert(subIcons, { Name = "ModsNikkelMHadesBiomes_RoomRewardSubIcon_ForbiddenShopItem" })
		end
	end

	return subIcons
end)
