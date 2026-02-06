-- Called when a door reward preview is created
-- For Hades Tartartus doors, we use the original Hades backing art, so we set ReUseIds which prevents the Hades II backing from being created
modutil.mod.Path.Wrap("CreateDoorRewardPreview", function(base, exitDoor, chosenRewardType, chosenLootName, index, args)
	args = args or {}

	-- Don't create a preview for the Zag fight
	if game.CurrentRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.Name == "C_Boss01" then
		return
	end

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and mod.HadesExitDoorObstacleNames[exitDoor.Name] and not args.ReUseIds then
		local room = exitDoor.Room
		chosenRewardType = chosenRewardType or room.ChosenRewardType

		index = index or 1
		-- Positive X is to the left, negative to the right
		-- Positive Y is down, negative up
		local properties = {
			doorIconOffsetX = 0,
			doorIconOffsetY = 30,
			doorIconScale = 0.85,
			doorIconFrontOffsetX = 0,
			doorIconFrontOffsetY = -140,
		}
		local doorIconOffsetZ = 210
		doorIconOffsetZ = doorIconOffsetZ + ((index - 1) * 180)

		local doorIconIsometricShiftX = -6
		local doorIconIsometricShiftZ = -3

		local offsetMappings = {}
		local skipModifiers = {}
		local additionalModifications = {
			MetaCurrencyDrop = {
				-- Make smaller, they often clip out of the bottom of the door preview
				doorIconScale = -0.1,
			},
			WeaponUpgrade = {
				doorIconScale = -0.1,
			},
			Devotion = {
				doorIconOffsetY = -5,
			},
			-- The below are for Styx and Erebus doors
			RoomMoneyBigDrop = {
				doorIconScale = -0.1,
			},
			MaxHealthDropBig = {
				doorIconScale = -0.1,
			},
			MaxManaDropBig = {
				doorIconScale = -0.1,
			},
			StackUpgradeBig = {
				doorIconScale = -0.05,
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
				doorIconFrontOffsetY = -130,
			}
		elseif exitDoor.Name == "ElysiumExitDoor" then
			-- Used for Y_Combat02, Y_Combat14, Y_Shop01
			properties = {
				doorIconOffsetX = 0,
				doorIconOffsetY = -130,
				doorIconScale = 0.9,
				doorIconFrontOffsetX = 3,
				doorIconFrontOffsetY = -250,
			}

			offsetMappings = {
				Y_Intro = {
					doorIconOffsetY = -125,
					doorIconFrontOffsetY = -240,
				},
				Y_Combat01 = {
					doorIconOffsetY = -110,
					doorIconFrontOffsetY = -230,
				},
				Y_Combat03 = {
					doorIconOffsetY = -140,
					doorIconFrontOffsetY = -260,
				},
				Y_Combat04 = {
					doorIconOffsetY = -135,
					doorIconFrontOffsetY = -255,
				},
				Y_Combat05 = {
					doorIconOffsetY = -183,
					doorIconFrontOffsetX = 0,
					doorIconFrontOffsetY = -298,
				},
				Y_Combat06 = {
					doorIconOffsetY = -140,
					doorIconFrontOffsetY = -260,
				},
				Y_Combat08 = {
					doorIconOffsetY = -147,
					doorIconFrontOffsetY = -262,
				},
				Y_Combat09 = {
					doorIconOffsetY = -170,
					doorIconFrontOffsetX = 0,
					doorIconFrontOffsetY = -285,
				},
				Y_Combat10 = {
					doorIconOffsetY = -180,
					doorIconFrontOffsetY = -300,
				},
				Y_Combat11 = {
					doorIconOffsetY = -175,
					doorIconFrontOffsetY = -283,
				},
				Y_Combat12 = {
					doorIconOffsetY = -180,
					doorIconFrontOffsetY = -300,
				},
				Y_Combat13 = {
					doorIconOffsetY = -184,
					doorIconFrontOffsetX = 0,
					doorIconFrontOffsetY = -298,
				},
				Y_Reprieve01 = {
					doorIconOffsetY = -105,
					doorIconFrontOffsetY = -220,
				},
				Y_MiniBoss01 = {
					doorIconOffsetY = -185,
					doorIconFrontOffsetY = -300,
				},
				Y_MiniBoss02 = {
					doorIconOffsetY = -180,
					doorIconFrontOffsetY = -300,
				},
				Y_Story01 = {
					doorIconOffsetY = -148,
					doorIconFrontOffsetY = -268,
				},
				Y_PreBoss01 = {
					doorIconOffsetY = -100,
					doorIconFrontOffsetY = -213,
				},
				Y_Boss01 = {
					doorIconOffsetY = -155,
					doorIconFrontOffsetY = -275,
				},
			}

			-- Additional modification for one of the exit doors in Y_Story01, as the two doors have different scales
			if game.CurrentRun.CurrentRoom.Name == "Y_Story01" and exitDoor.ObjectId == 528520 then
				offsetMappings.Y_Story01 = {
					doorIconOffsetY = -130,
					doorIconFrontOffsetY = -250,
				}
			end

			if offsetMappings[game.CurrentRun.CurrentRoom.Name] then
				for property, value in pairs(properties) do
					if offsetMappings[game.CurrentRun.CurrentRoom.Name].overrideSkip or not skipModifiers[chosenRewardType] or (skipModifiers[chosenRewardType] and not skipModifiers[chosenRewardType][property]) then
						properties[property] = offsetMappings[game.CurrentRun.CurrentRoom.Name][property] or properties[property]
					end
				end
			end
		elseif exitDoor.Name == "TravelDoor03" then
			properties = {
				doorIconOffsetX = 3,
				doorIconOffsetY = -95,
				doorIconScale = 0.85,
				doorIconFrontOffsetX = 0,
				doorIconFrontOffsetY = 0,
			}
		elseif exitDoor.Name == "StyxDoor01" then
			properties = {
				doorIconOffsetX = 3,
				doorIconOffsetY = -78,
				doorIconScale = 0.85,
				doorIconFrontOffsetX = 0,
				doorIconFrontOffsetY = -10,
			}

			offsetMappings = {
				D_Mini01 = {
					doorIconOffsetY = -78,
					doorIconFrontOffsetY = -6,
				},
				D_Mini05 = {
					doorIconOffsetY = -85,
					doorIconFrontOffsetX = 2,
					doorIconFrontOffsetY = -10,
				},
				D_Mini06 = {
					doorIconOffsetY = -89,
					doorIconFrontOffsetY = -22,
				},
				D_Mini07 = {
					doorIconOffsetY = -85,
					doorIconFrontOffsetY = -18,
				},
				D_Mini08 = {
					doorIconOffsetY = -80,
					doorIconFrontOffsetX = 3,
					doorIconFrontOffsetY = -10,
				},
				D_Mini09 = {
					doorIconOffsetY = -73,
					doorIconFrontOffsetY = 0,
				},
				D_Mini10 = {
					doorIconOffsetY = -80,
					doorIconFrontOffsetY = -10,
				},
				D_Mini11 = {
					doorIconOffsetY = -80,
					doorIconFrontOffsetY = -10,
				},
				D_Mini12 = {
					doorIconOffsetY = -73,
					doorIconFrontOffsetY = 0,
				},
				D_Mini13 = {
					doorIconOffsetY = -83,
					doorIconFrontOffsetY = -10,
				},
				D_Mini14 = {
					doorIconOffsetY = -50,
					doorIconFrontOffsetY = 20,
				},
			}

			if offsetMappings[game.CurrentRun.CurrentRoom.Name] then
				for property, value in pairs(properties) do
					if offsetMappings[game.CurrentRun.CurrentRoom.Name].overrideSkip or not skipModifiers[chosenRewardType] or (skipModifiers[chosenRewardType] and not skipModifiers[chosenRewardType][property]) then
						properties[property] = offsetMappings[game.CurrentRun.CurrentRoom.Name][property] or properties[property]
					end
				end
			end
		elseif exitDoor.Name == "ShrinePointDoor" or exitDoor.Name == "ShrinePointExitDoor" then
			properties = {
				doorIconOffsetX = 10,
				doorIconOffsetY = 90,
				doorIconScale = 1,
				doorIconFrontOffsetX = 6,
				doorIconFrontOffsetY = 161,
			}
		end

		-- Add the additional modifications for the chosen reward type
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
			properties.doorIconFrontOffsetX = properties.doorIconFrontOffsetX * -1
			doorIconIsometricShiftX = doorIconIsometricShiftX * -1
		end

		-- Dummy backing - is not attached to the door, so the Hades II preview object isn't visible
		local backingId = SpawnObstacle({ Name = "BlankGeoObstacle", Group = "Combat_UI" })
		SetAlpha({ Id = backingId, Fraction = 0.0, Duration = 0.0 })

		exitDoor.RewardPreviewBackingIds = exitDoor.RewardPreviewBackingIds or {}
		table.insert(exitDoor.RewardPreviewBackingIds, backingId)

		exitDoor.AdditionalAttractIds = exitDoor.AdditionalAttractIds or {}

		-- For the Erebus/ShrinePointDoor exits
		if exitDoor.BackingAnimation ~= nil then
			exitDoor.DoorIconBackingId = SpawnObstacle({ Name = "BlankGeoObstacle", Group = "Combat_UI_Backing" })
			Attach({
				Id = exitDoor.DoorIconBackingId,
				DestinationId = exitDoor.ObjectId,
				OffsetY = properties.doorIconOffsetY,
				OffsetX = properties.doorIconOffsetX + doorIconIsometricShiftX,
				OffsetZ = doorIconOffsetZ + doorIconIsometricShiftZ
			})
			SetThingProperty({
				Property = "SortMode",
				Value = exitDoor.IconSortMode or "FromParent",
				DestinationId = exitDoor.DoorIconBackingId
			})
			SetThingProperty({ Property = "SortBoundsScale", Value = 10, DestinationId = exitDoor.DoorIconBackingId })
			table.insert(exitDoor.AdditionalAttractIds, exitDoor.DoorIconBackingId)
			table.insert(game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath, exitDoor.DoorIconBackingId)
			SetAnimation({ Name = exitDoor.BackingAnimation, DestinationId = exitDoor.DoorIconBackingId })
		end

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

		-- Not adding for Tartarus, as the previews work differently there
		if game.Contains({ "AsphodelBoat01b", "ElysiumExitDoor", "TravelDoor03", "StyxDoor01", "ShrinePointDoor", "ShrinePointExitDoor" }, exitDoor.Name) then
			-- Shimmer animation in front of the backing and reward
			exitDoor.DoorIconFront = SpawnObstacle({
				Name = "BlankGeoObstacle",
				Group = "Combat_Menu_Backing",
				DestinationId = doorIconId,
			})
			-- Custom: To destroy it on death (would otherwise overlay on the blacked out screen)
			table.insert(game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath, exitDoor.DoorIconFront)
			Attach({ Id = exitDoor.DoorIconFront, DestinationId = exitDoor.ObjectId, DynamicScaleOffset = true })
			SetThingProperty({
				Property = "SortMode",
				Value = exitDoor.IconSortMode or "FromParent",
				DestinationId = exitDoor.DoorIconFront
			})
			SetThingProperty({ Property = "SortBoundsScale", Value = 2, DestinationId = exitDoor.DoorIconFront })

			local rewardContainerAnim = ""
			if exitDoor.Name == "AsphodelBoat01b" then
				rewardContainerAnim = "ModsNikkelMHadesBiomesAsphodel-RoomRewardAvailable-Front"
			elseif exitDoor.Name == "ElysiumExitDoor" then
				rewardContainerAnim = "ModsNikkelMHadesBiomesElysium-RoomRewardAvailable-Front"
			elseif exitDoor.Name == "TravelDoor03" then
				rewardContainerAnim = "ModsNikkelMHadesBiomesStyxTravelDoor-RoomRewardAvailable-Front"
			elseif exitDoor.Name == "StyxDoor01" then
				rewardContainerAnim = "ModsNikkelMHadesBiomesStyxDoor-RoomRewardAvailable-Front"
				-- Just reusing the same front, originally overlooked, but it works with the offsets now
			elseif exitDoor.Name == "ShrinePointDoor" then
				rewardContainerAnim = "ModsNikkelMHadesBiomesStyxDoor-RoomRewardAvailable-Front"
			elseif exitDoor.Name == "ShrinePointExitDoor" then
				rewardContainerAnim = "ModsNikkelMHadesBiomesShrinePointExitDoor-RoomRewardAvailable-Front"
			end

			if room.RewardStoreName == "MetaProgress" then
				rewardContainerAnim = rewardContainerAnim .. "_MetaReward"
			end

			SetAnimation({
				Name = rewardContainerAnim,
				DestinationId = exitDoor.DoorIconFront,
				OffsetX = properties.doorIconFrontOffsetX,
				OffsetY = properties.doorIconFrontOffsetY,
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
