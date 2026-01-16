-- Set a backing for the door's reward preview
modutil.mod.Path.Wrap("ChooseNextRewardStore", function(base, run)
	local rewardStoreName = base(run)
	if run.ModsNikkelMHadesBiomesExitDoors ~= nil then
		for _, exitDoor in ipairs(run.ModsNikkelMHadesBiomesExitDoors) do
			if run.NextRewardStoreName == "RunProgress" and exitDoor.CustomLockedAnimation_Run ~= nil then
				SetAnimation({ Name = exitDoor.CustomLockedAnimation_Run, DestinationId = exitDoor.ObjectId })
			elseif run.NextRewardStoreName == "MetaProgress" and exitDoor.CustomLockedAnimation_Meta ~= nil then
				SetAnimation({ Name = exitDoor.CustomLockedAnimation_Meta, DestinationId = exitDoor.ObjectId })
			end
		end
		run.ModsNikkelMHadesBiomesExitDoors = {}
	end
	return rewardStoreName
end)

-- Wrap to also load modded resources
-- This is not called in any of the Crossroads rooms, so we don't need to check for that
modutil.mod.Path.Wrap("LoadCurrentRoomResources", function(base, currentRoom)
	base(currentRoom)

	-- Load the portraits package immediately for a less laggy transition when opening the Codex
	-- Always do this, so the Codex also doesn't lag when opening it during a normal run
	LoadPackages({ Name = "ModsNikkelMHadesBiomesPortraits" })

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and mod.ValidModdedRunBiomes[currentRoom.RoomSetName] then
		currentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath = currentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath or {}

		if currentRoom.AlwaysLoadModdedPackages then
			LoadPackages({ Names = currentRoom.AlwaysLoadModdedPackages })
		end
		-- The base game doesn't load encounter packages when a save is loaded, or the RoomOpening is entered
		if currentRoom.Encounter ~= nil and currentRoom.Encounter.LoadPackages then
			LoadPackages({ Names = currentRoom.Encounter.LoadPackages })
		end
		if currentRoom.LoadModdedPackages then
			LoadPackages({ Names = currentRoom.LoadModdedPackages })
		end

		-- For the vow that gives a chance for enemies to be from the next biome
		if game.GetShrineUpgradeChangeValue("NextBiomeEnemyShrineUpgrade") > 0 then
			local nextRoomSet = game.NextRoomSets[currentRoom.RoomSetName]
			if nextRoomSet ~= nil then
				LoadPackages({ Name = nextRoomSet })
			end
		end

		-- We don't need to load LoadModdedAudioBanks or LoadCustomModdedAudioBanks here, as they were already loaded in AudioStateInit
		if currentRoom.LoadModdedVoiceBanks ~= nil then
			game.LoadVoiceBanks(currentRoom.LoadModdedVoiceBanks)
		end
		if currentRoom.Encounter ~= nil and currentRoom.Encounter.LoadModdedVoiceBanks ~= nil then
			game.LoadVoiceBanks(currentRoom.Encounter.LoadModdedVoiceBanks)
		end
	end
end)

modutil.mod.Path.Wrap("SetupUnit", function(base, unit, currentRun, args)
	currentRun = currentRun or game.CurrentRun
	args = args or {}

	if currentRun.ModsNikkelMHadesBiomesIsModdedRun and (unit.ModsNikkelMHadesBiomesIsModdedEnemy or unit.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy) then
		-- Overwrite weapon/AI data if necessary due to a vow
		local shrineLevel = game.GetNumShrineUpgrades(unit.ShrineMetaUpgradeName)
		local requiredShrineLevel = unit.ShrineMetaUpgradeRequiredLevel or 1
		if unit.ShrineDataOverwrites ~= nil and shrineLevel >= requiredShrineLevel then
			game.OverwriteTableKeys(unit, unit.ShrineDataOverwrites)
		end
		if unit.ShrineDefualtAIDataOverwrites ~= nil and shrineLevel > 0 then
			if unit.DefaultAIData == nil then
				unit.DefaultAIData = {}
			end
			game.OverwriteTableKeys(unit.DefaultAIData, unit.ShrineDefualtAIDataOverwrites)
		end
		if unit.ShrineWeaponOptionsOverwrite ~= nil and shrineLevel > 0 then
			unit.WeaponOptions = unit.ShrineWeaponOptionsOverwrite
		end

		-- Increase the unit's health and armour, if it shouldn't be excluded from the modded modifiers
		if not unit.ModsNikkelMHadesBiomesIgnoreModdedHealthModifiers then
			local healthBufferBonus = mod.ModdedUnitHealthBufferMultiplierBonus[currentRun.CurrentRoom.RoomSetName] or
					mod.ModdedUnitHealthBufferMultiplierBonus.Default
			local maxHealthBonus = mod.ModdedUnitMaxHealthMultiplierBonus[currentRun.CurrentRoom.RoomSetName] or
					mod.ModdedUnitMaxHealthMultiplierBonus.Default

			if unit.HealthBufferMultiplier ~= nil then
				unit.HealthBufferMultiplier = unit.HealthBufferMultiplier + healthBufferBonus
			else
				unit.HealthBufferMultiplier = 1 + healthBufferBonus
			end
			if unit.HealthMultiplier ~= nil then
				unit.HealthMultiplier = unit.HealthMultiplier + maxHealthBonus
			else
				unit.HealthMultiplier = 1 + maxHealthBonus
			end
		end

		-- For Hades
		if unit.SelectCustomSpawnOptions ~= nil then
			game.CallFunctionName(unit.SelectCustomSpawnOptions, unit)
		end
		-- For HadesSpawns2
		if unit.SetLastInvisibilityTimeOnSpawn then
			unit.LastInvisibilityTime = game._worldTime
		else
			unit.LastInvisibilityTime = 0
		end
	end

	base(unit, currentRun, args)

	if currentRun.ModsNikkelMHadesBiomesIsModdedRun and unit.ModsNikkelMHadesBiomesIsModdedEnemy then
		if unit.PreDamageIfEncounterCompleted ~= nil and game.HasEncounterOccurred(currentRun, unit.PreDamageIfEncounterCompleted, true) then
			unit.Health = unit.MaxHealth * unit.PreDamagePercent
		end
	end
end)

modutil.mod.Path.Wrap("SetupAI", function(base, enemy, args)
	if enemy.SupportUnitName ~= nil then
		mod.SpawnSupportAI(enemy)
	end

	return base(enemy, args)
end)

modutil.mod.Path.Wrap("SetupInspectPoint", function(base, inspectPointData)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentHubRoom == nil then
		-- Storyteller voicelines are added to the Megaera voicebank, as the game can't load unknown voicebanks and Storyteller is already taken
		game.LoadVoiceBanks({ Name = "Megaera" })
	end

	return base(inspectPointData)
end)

modutil.mod.Path.Wrap("StartRoom", function(base, currentRun, currentRoom)
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if currentRoom.WingRoom then
			currentRun.WingDepth = (currentRun.WingDepth or 0) + 1
		else
			currentRun.WingDepth = 0
		end
		if currentRoom.WingEndRoom then
			currentRun.CompletedStyxWings = currentRun.CompletedStyxWings + 1
		end
	end

	return base(currentRun, currentRoom)
end)

modutil.mod.Path.Wrap("LeaveRoom", function(base, currentRun, door)
	-- For Styx D_Hub, we need to regenerate the Shop encounter when re-entering the room
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun and door.Room ~= nil and door.Room.ModsNikkelMHadesBiomesOnReloadStripEncounter and door.Room.TimesVisited ~= nil and door.Room.TimesVisited > 0 then
		door.Room.Encounter = nil
		door.Room.EncountersOccurredCache = nil
		-- Also reset the WingDepth, so that the offered exits all generate mini rooms first
		currentRun.WingDepth = 0
	end

	return base(currentRun, door)
end)

-- Overriding to add in the logic for the Styx miniboss and ShrineChallenge/Erebus room rewards
modutil.mod.Path.Wrap("DoUnlockRoomExits", function(base, run, room)
	-- TODO: Only while the mod is in early access
	if run.ModsNikkelMHadesBiomesIsModdedRun and not mod.HiddenConfig.IgnoreShowFeedbackMessage then
		if not game.CurrentRun.ModsNikkelMHadesBiomesHasShownFeedbackMessage then
			game.CurrentRun.ModsNikkelMHadesBiomesHasShownFeedbackMessage = true
			game.thread(game.InCombatTextArgs,
				{ Text = "ModsNikkelMHadesBiomes_LeaveFeedback", TargetId = game.CurrentRun.Hero.ObjectId, SkipRise = true, SkipFlash = true, SkipShadow = true, Duration = 10.0, OffsetY = -160, PreDelay = 1.0 })
		end
	end

	-- We are either in D_Hub and need to set up the miniboss exits, or the room has a ShrineChallenge/Erebus door, which also needs upgraded rewards
	if run.ModsNikkelMHadesBiomesIsModdedRun and (room.Name == "D_Hub" or room.ShrinePointDoorChanceSuccess == true) then
		return mod.ModsNikkelMHadesBiomesDoUnlockRoomExits(run, room)
	else
		return base(run, room)
	end
end)

modutil.mod.Path.Wrap("DisableTrap", function(base, enemy)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy.ModsNikkelMHadesBiomesIsModdedEnemy then
		if enemy.ToggleTrap then
			if enemy.DisableImmediately then
				game.killTaggedThreads(enemy.AIThreadName)
				enemy.AIDisabled = true
			else
				enemy.DisableAIWhenReady = true
			end
			-- This is the modification - some of our modded traps have separate animations depending on if they are currently "active" or not
			if enemy.DefaultAIData and enemy.DefaultAIData.UseResetAnimationIfActive and enemy.DefaultAIData.ResetAnimation ~= nil and enemy.ModsNikkelMHadesBiomesCurrentlyActive then
				SetAnimation({ DestinationId = enemy.ObjectId, Name = enemy.DefaultAIData.ResetAnimation })
			elseif enemy.DefaultAIData and enemy.DefaultAIData.DisabledAnimation ~= nil then
				SetAnimation({ DestinationId = enemy.ObjectId, Name = enemy.DefaultAIData.DisabledAnimation })
			end
		elseif enemy.DestroyOnTrapDisable then
			game.Kill(enemy)
		end
	else
		return base(enemy)
	end
end)

modutil.mod.Path.Wrap("CheckSpecialDoorRequirement", function(base, door)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		local originalReturnValue = base(door)

		-- None of the other, higher priority reasons were eligible
		if originalReturnValue == nil and door and door.ShrinePointReq ~= nil and game.GetTotalSpentShrinePoints() < door.ShrinePointReq then
			return "ExitBlockedByShrinePointReq"
		end

		return originalReturnValue
	end

	return base(door)
end)

modutil.mod.Path.Wrap("HandleSecretSpawns", function(base, currentRun)
	base(currentRun)

	if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
		local currentRoom = currentRun.CurrentRoom
		local secretPointIds = GetIdsByType({ Name = "SecretPoint" })

		if currentRun.CurrentRoom and currentRun.CurrentRoom.ModsNikkelMHadesBiomesSecretDoorOnId then
			-- Exclude the ID of the Chaos Gate that was spawned in this room from being used for the ShrinePointDoor
			for i, secretPointId in ipairs(secretPointIds) do
				if secretPointId == currentRun.CurrentRoom.ModsNikkelMHadesBiomesSecretDoorOnId then
					table.remove(secretPointIds, i)
					break
				end
			end
		end

		-- ShrineChallenge/Erebus Gates
		if not game.IsEmpty(secretPointIds) and mod.IsShrinePointDoorEligible(currentRun, currentRoom) then
			currentRoom.ForceShrinePointDoor = true
			local shrinePointRoomOptions = currentRoom.ShrinePointRoomOptions or game.RoomData.ModsNikkelMHadesBiomesBaseRoom

			if game.IsEmpty(shrinePointRoomOptions) then
				mod.DebugPrint(
					"No shrine point room options available! They should be contained in all modded rooms, or fall back to ModsNikkelMHadesBiomesBaseRoom",
					1)
				return
			end

			local shrinePointRoomName = game.GetRandomValue(shrinePointRoomOptions)
			local shrinePointRoomData = game.RoomSetData.Challenge[shrinePointRoomName]
			if shrinePointRoomData ~= nil then
				local secretPointId = game.RemoveRandomValue(secretPointIds)
				local shrinePointDoor = game.DeepCopyTable(game.ObstacleData.ShrinePointDoor)
				shrinePointDoor.ObjectId = SpawnObstacle({
					Name = "ShrinePointDoor",
					Group = "FX_Terrain",
					DestinationId = secretPointId,
					AttachedTable = shrinePointDoor
				})
				game.SetupObstacle(shrinePointDoor)
				shrinePointDoor.ShrinePointReq = currentRoom.ShrinePointDoorCost or
						(shrinePointDoor.CostBase + (shrinePointDoor.CostPerDepth * (currentRun.RunDepthCache - 1)))
				local activeShrinePoints = game.GetTotalSpentShrinePoints()
				local costFontColor = game.Color.CostAffordable
				if shrinePointDoor.ShrinePointReq > activeShrinePoints then
					costFontColor = game.Color.CostUnaffordable
				end
				local shrinePointRoom = game.CreateRoom(shrinePointRoomData, { SkipChooseReward = true })
				shrinePointRoom.NeedsReward = true
				game.AssignRoomToExitDoor(shrinePointDoor, shrinePointRoom)
				shrinePointDoor.OnUsedPresentationFunctionName = "ShrinePointDoorUsedPresentation"
				currentRun.LastShrinePointDoorDepth = game.GetRunDepth(currentRun)
			end
		end

		-- ForbiddenShopItem/Charon Sack of Gold
		local forbiddenShopItemId = GetClosest({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = "ForbiddenShopItemSpawnPoint" })
		if forbiddenShopItemId ~= nil and forbiddenShopItemId ~= 0 and mod.IsForbiddenShopItemEligible(currentRun, currentRoom) then
			mod.SpawnForbiddenShopItem(currentRoom, { SpawnOnId = forbiddenShopItemId })
		end
	end
end)

-- This is essentially the same function as vanilla, and only inserts the logic to upgrade consumable rewards for Styx miniboss rooms and ShrineChallenge/Erebus rooms
function mod.ModsNikkelMHadesBiomesDoUnlockRoomExits(run, room)
	-- Synchronize the RNG to its initial state. Makes room reward choices deterministic on save/load
	game.RandomSynchronize()

	local roomData = game.RoomData[room.Name] or room
	local encounterData = game.EncounterData[room.Encounter.Name] or room.Encounter

	local rewardsChosen = {}
	local rewardStoreName = run.NextRewardStoreName or game.ChooseNextRewardStore(run)
	local rewardStoreOverrides = {}
	local exitDoorsIPairs = game.CollapseTableOrdered(game.MapState.OfferedExitDoors) or {}

	if room.UnavailableDoorIds ~= nil then
		for k, doorId in pairs(room.UnavailableDoorIds) do
			exitDoorsIPairs[doorId] = nil
		end
	end

	for index, door in ipairs(exitDoorsIPairs) do
		if room.PersistentRoomForDoors and room.DoorRoomHistory ~= nil and room.DoorRoomHistory[door.ObjectId] ~= nil then
			door.Room = game.ShallowCopyTable(run.RoomHistory[room.DoorRoomHistory[door.ObjectId]]) or {}
			-- Restore any missing data that may have been stripped for saving
			local originalRoomData = game.RoomData[door.Room.Name]
			if originalRoomData ~= nil then
				for roomKey, roomValue in pairs(originalRoomData) do
					if door.Room[roomKey] == nil then
						door.Room[roomKey] = roomValue
					end
				end
			end
		end

		if door.Room == nil then
			if roomData.PredeterminedDoorRooms ~= nil and roomData.PredeterminedDoorRooms[door.ObjectId] ~= nil then
				door.ForceRoomName = roomData.PredeterminedDoorRooms[door.ObjectId]
			elseif room.PersistentRoomForDoors and room.ExitDoorRooms[door.ObjectId] ~= nil then
				door.ForceRoomName = room.ExitDoorRooms[door.ObjectId]
			end
			local roomForDoorData = nil
			if door.ForceRoomName ~= nil then
				roomForDoorData = game.RoomData[door.ForceRoomName]
			else
				roomForDoorData = game.ChooseNextRoomData(run, door.ChooseRoomArgs, exitDoorsIPairs)
			end
			local roomForDoor = game.CreateRoom(roomForDoorData,
				{ SkipChooseReward = true, SkipChooseEncounter = true, RoomOverrides = room.NextRoomOverrides }) or {}
			roomForDoor.NeedsReward = true
			door.Room = roomForDoor
		end

		local roomForDoorName = door.Room.GenusName or door.Room.Name
		if door.Room.ForcedRewardStore ~= nil then
			rewardStoreOverrides[index] = door.Room.ForcedRewardStore
		end
		if rewardStoreOverrides[index] and not game.Contains(game.RewardStoreData.InvalidOverrides, rewardStoreOverrides[index]) then
			rewardStoreName = rewardStoreOverrides[index]
		end
		game.wait(0.02) -- Distribute workload
	end

	if run.CurrentRoom.FirstAppearanceNumExitOverrides ~= nil and not mod.HasSeenRoomEarlierInRun(run, run.CurrentRoom.Name) then
		local randomDoors = game.ShallowCopyTable(exitDoorsIPairs)
		for i = 1, run.CurrentRoom.FirstAppearanceNumExitOverrides do
			local randomDoor = game.RemoveRandomValue(randomDoors)
			if randomDoor ~= nil and randomDoor.Room ~= nil then
				randomDoor.Room.UseOptionalOverrides = true
				for key, value in pairs(randomDoor.Room.OptionalOverrides) do
					randomDoor.Room[key] = value
				end
			end
		end
	end

	if roomData.MinDoorCageRewards ~= nil and roomData.MaxDoorCageRewards ~= nil then
		local smallestCageAmount = roomData.MaxDoorCageRewards
		for index, door in ipairs(exitDoorsIPairs) do
			if door.Room.MaxCageRewards ~= nil then
				smallestCageAmount = math.min(smallestCageAmount, door.Room.MaxCageRewards)
			end
		end
		room.MaxDoorCageRewards = smallestCageAmount
		if room.MaxDoorDepthChanceTable then
			room.NumDoorCageRewards = game.SelectFieldsDoorCageCount(run, room)
		else
			room.NumDoorCageRewards = game.RandomInt(room.MinDoorCageRewards, room.MaxDoorCageRewards)
		end
	end

	for index, door in ipairs(exitDoorsIPairs) do
		local doorRoom = door.Room
		if doorRoom ~= nil and doorRoom.NeedsReward then
			if doorRoom.IndividualRewardStore ~= nil then
				doorRoom.RewardStoreName = doorRoom.IndividualRewardStore
			elseif rewardStoreOverrides[index] ~= nil and not game.Contains(game.RewardStoreData.InvalidOverrides, rewardStoreOverrides[index]) then
				doorRoom.RewardStoreName = rewardStoreOverrides[index]
			else
				doorRoom.RewardStoreName = rewardStoreName
			end
			doorRoom.ChosenRewardType = game.ChooseRoomReward(game.CurrentRun, doorRoom, doorRoom.RewardStoreName,
				rewardsChosen, { Door = door })

			-- Custom logic for Styx Miniboss and ShrineChallenge rooms - change Consumables to their big variant
			if doorRoom.ChosenRewardType ~= nil and doorRoom.UseOptionalOverrides and doorRoom.RewardConsumableOverrideMap then
				-- Add the original reward to the chosen list to avoid duplicates
				table.insert(rewardsChosen, { RewardType = doorRoom.ChosenRewardType, ForceLootName = doorRoom.ForceLootName, })
				-- For the reroll logic
				doorRoom.ModsNikkelMHadesBiomesOriginalOverrideReward = doorRoom.ChosenRewardType
				-- Then replace it with the upgraded version
				local overrideConsumable = doorRoom.RewardConsumableOverrideMap[doorRoom.ChosenRewardType]
				if overrideConsumable ~= nil then
					doorRoom.ChosenRewardType = overrideConsumable
				end
			end

			if doorRoom.ChosenRewardType ~= nil then
				game.SetupRoomReward(game.CurrentRun, doorRoom, rewardsChosen,
					{ Door = door, IgnoreForceLootName = doorRoom.IgnoreForceLootName })
				table.insert(rewardsChosen, { RewardType = doorRoom.ChosenRewardType, ForceLootName = doorRoom.ForceLootName, })
			end
			doorRoom.NeedsReward = false

			if doorRoom.MaxCageRewards ~= nil then
				doorRoom.CageRewards = {}
				for i = 1, room.NumDoorCageRewards or 2 do
					local cageRoom = game.DeepCopyTable(doorRoom) or {}
					cageRoom.NeedsReward = true
					cageRoom.NoReward = false
					cageRoom.ChosenRewardType = game.ChooseRoomReward(game.CurrentRun, cageRoom, cageRoom.RewardStoreName,
						rewardsChosen)
					game.SetupRoomReward(game.CurrentRun, cageRoom, rewardsChosen,
						{ Door = door, IgnoreForceLootName = cageRoom.IgnoreForceLootName })
					local reward = { RewardType = cageRoom.ChosenRewardType, ForceLootName = cageRoom.ForceLootName, }
					table.insert(rewardsChosen, reward)
					table.insert(doorRoom.CageRewards, reward)
				end
			end

			if doorRoom.UseOptionalOverrides then
				for key, value in pairs(doorRoom.OptionalOverrides) do
					doorRoom[key] = value
				end
			end
			game.AssignRoomToExitDoor(door, doorRoom)
			game.wait(0.02) -- Distribute workload
		end
	end

	game.wait(0.02) -- Distribute workload

	game.RandomSynchronize(#exitDoorsIPairs)

	for index, door in ipairs(exitDoorsIPairs) do
		if door.PreExitsUnlockedFunctionName ~= nil then
			game.thread(game.CallFunctionName, door.PreExitsUnlockedFunctionName, door, door.PreExitsUnlockedFunctionArgs)
		end
	end

	for index, door in ipairs(exitDoorsIPairs) do
		if not door.SkipUnlock then
			game.CreateDoorRewardPreview(door)
			game.thread(game.ExitDoorUnlockedPresentation, door)
			door.ReadyToUse = true
			if door.OnUnlockThreadedFunctionName ~= nil then
				game.thread(game.CallFunctionName, door.OnUnlockThreadedFunctionName, door, door.OnUnlockThreadedFunctionArgs)
			end
		end
	end

	game.MapState.OfferedRewards = {}
	for i, doorData in pairs(game.MapState.OfferedExitDoors) do
		if doorData and doorData.Room then
			local room = doorData.Room
			if room.CageRewards then
				for _, cageReward in pairs(room.CageRewards) do
					if cageReward.RewardType then
						game.MapState.OfferedRewards[cageReward.RewardType] = true
					end
				end
			end
			if room.ChosenRewardType then
				game.MapState.OfferedRewards[room.ChosenRewardType] = true
			end
		end
	end

	for id, obstacle in pairs(game.ShallowCopyTable(game.MapState.ActiveObstacles) or {}) do
		if obstacle.ExitsUnlockedFunctionName ~= nil then
			game.thread(game.CallFunctionName, obstacle.ExitsUnlockedFunctionName, obstacle, obstacle
				.ExitsUnlockedFunctionArgs)
		end
	end

	if game.CurrentRun.CurrentRoom.ChallengeSwitch ~= nil then
		local challengeSwitch = game.CurrentRun.CurrentRoom.ChallengeSwitch
		local startingValue = challengeSwitch.StartingValue or 0
		if challengeSwitch.RewardType == "Health" then
			startingValue = startingValue * game.CalculateHealingMultiplier()
		end
		if challengeSwitch.RewardType == "Money" and game.HasHeroTraitValue("BlockMoney") then
			startingValue = 0
		end
		challengeSwitch.StartingValue = round(startingValue)
		challengeSwitch.ReadyToUse = true
		challengeSwitch.UseText = challengeSwitch.ChallengeAvailableUseText
		game.RefreshUseButton(challengeSwitch.ObjectId, challengeSwitch)
		SetAnimation({ Name = challengeSwitch.UnlockedAnimationName, DestinationId = challengeSwitch.ObjectId })
		if challengeSwitch.UnlockedFxAnimationName ~= nil then
			CreateAnimation({ DestinationId = challengeSwitch.ObjectId, Name = challengeSwitch.UnlockedFxAnimationName })
		end
		PlaySound({ Name = "/SFX/ChallengeChestUnlocked", Id = challengeSwitch.ObjectId })
	end

	if game.CurrentRun.CurrentRoom.WellShop ~= nil then
		game.CurrentRun.CurrentRoom.WellShop.ReadyToUse = true
		game.CurrentRun.CurrentRoom.WellShop.UseText = game.CurrentRun.CurrentRoom.WellShop.AvailableUseText
		game.RefreshUseButton(game.CurrentRun.CurrentRoom.WellShop.ObjectId, game.CurrentRun.CurrentRoom.WellShop)
		SetAnimation({ Name = "WellShopUnlocked", DestinationId = game.CurrentRun.CurrentRoom.WellShop.ObjectId })
		PlaySound({ Name = "/SFX/WellShopUnlocked", Id = game.CurrentRun.CurrentRoom.WellShop.ObjectId })
	end

	if game.CurrentRun.CurrentRoom.SellTraitShop ~= nil and not game.CurrentRun.CurrentRoom.SellTraitShop.BlockedByRequirements then
		game.CurrentRun.CurrentRoom.SellTraitShop.ReadyToUse = true
		game.CurrentRun.CurrentRoom.SellTraitShop.UseText = game.CurrentRun.CurrentRoom.SellTraitShop.AvailableUseText
		game.RefreshUseButton(game.CurrentRun.CurrentRoom.SellTraitShop.ObjectId, game.CurrentRun.CurrentRoom.SellTraitShop)
		SetAnimation({ Name = "SellTraitShopUnlocked", DestinationId = game.CurrentRun.CurrentRoom.SellTraitShop.ObjectId })
		PlaySound({ Name = "/SFX/WellShopUnlocked", Id = game.CurrentRun.CurrentRoom.SellTraitShop.ObjectId })
	end

	if game.CurrentRun.CurrentRoom.SurfaceShop ~= nil then
		game.CurrentRun.CurrentRoom.SurfaceShop.ReadyToUse = true
		game.CurrentRun.CurrentRoom.SurfaceShop.UseText = game.CurrentRun.CurrentRoom.SurfaceShop.AvailableUseText
		game.RefreshUseButton(game.CurrentRun.CurrentRoom.SurfaceShop.ObjectId, game.CurrentRun.CurrentRoom.SurfaceShop)
		SetAnimation({ Name = "SurfaceShopUnlocked", DestinationId = game.CurrentRun.CurrentRoom.SurfaceShop.ObjectId })
		PlaySound({ Name = "/SFX/Menu Sounds/KeepsakeHermesFastClear", Id = game.CurrentRun.CurrentRoom.SurfaceShop.ObjectId })
	end

	if game.CurrentRun.CurrentRoom.MetaRewardStand ~= nil then
		if game.GameState.SpentShrinePointsCache >= game.CurrentRun.CurrentRoom.MetaRewardStand.RequiredShrinePoints then
			game.CurrentRun.CurrentRoom.MetaRewardStand.ReadyToUse = true
			game.CurrentRun.CurrentRoom.MetaRewardStand.UseText = game.CurrentRun.CurrentRoom.MetaRewardStand.AvailableUseText
			game.RefreshUseButton(game.CurrentRun.CurrentRoom.MetaRewardStand.ObjectId,
				game.CurrentRun.CurrentRoom.MetaRewardStand)
			StopAnimation({
				Name = "MetaRewardStandLockedFx",
				DestinationId = game.CurrentRun.CurrentRoom.MetaRewardStand.ObjectId
			})
			SetAnimation({
				Name = "MetaRewardStandUnlocked",
				DestinationId = game.CurrentRun.CurrentRoom.MetaRewardStand.ObjectId
			})
			PlaySound({ Name = "/SFX/WellShopUnlocked", Id = game.CurrentRun.CurrentRoom.MetaRewardStand.ObjectId })
		end
	end

	game.StartTriggers(game.CurrentRun.CurrentRoom, roomData.ExitsUnlockedDistanceTriggers)

	game.RunThreadedEvents(encounterData.ExitsUnlockedThreadedEvents, room.Encounter)
	game.RunThreadedEvents(roomData.ExitsUnlockedThreadedEvents, room)
end
