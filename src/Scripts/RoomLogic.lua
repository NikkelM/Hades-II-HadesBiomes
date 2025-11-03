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

-- Wrap to also load modded resources, such as additional audio banks
-- This is not called in any of the Crossroads rooms, so we don't need to check for that
modutil.mod.Path.Wrap("LoadCurrentRoomResources", function(base, currentRoom)
	base(currentRoom)

	-- Load the portraits package immediately for a less laggy transition when opening the Codex
	-- Always do this, so the Codex also doesn't lag when opening it during a normal run
	LoadPackages({ Name = "ModsNikkelMHadesBiomesPortraits" })

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and mod.ValidModdedRunBiomes[currentRoom.RoomSetName] then
		currentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath = currentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath or {}

		-- The base game doesn't load encounter packages when a save is loaded, or the RoomOpening is entered
		if currentRoom.Encounter.LoadPackages then
			for _, name in pairs(currentRoom.Encounter.LoadPackages) do
				LoadPackages({ Name = name })
			end
		end
		if currentRoom.LoadModdedPackages then
			for _, name in pairs(currentRoom.LoadModdedPackages) do
				LoadPackages({ Name = name })
			end
		end

		-- For the vow that gives a chance for enemies to be from the next biome
		if game.GetShrineUpgradeChangeValue("NextBiomeEnemyShrineUpgrade") > 0 then
			local nextRoomSet = game.NextRoomSets[CurrentRun.CurrentRoom.RoomSetName]
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
		-- If the unit is a ShadeNaked, we don't want a summon animation for the picked up enemy
		if currentRun.ModsNikkelMHadesBiomesSkipNextActivatePresentation then
			currentRun.ModsNikkelMHadesBiomesSkipNextActivatePresentation = nil
			unit.UseActivatePresentation = false
		end

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

		-- Increase the unit's health and armour
		if unit.HealthBufferMultiplier ~= nil then
			unit.HealthBufferMultiplier = unit.HealthBufferMultiplier + mod.ModdedUnitHealthBufferMultiplierBonus
		else
			unit.HealthBufferMultiplier = 1 + mod.ModdedUnitHealthBufferMultiplierBonus
		end
		if unit.HealthMultiplier ~= nil then
			unit.HealthMultiplier = unit.HealthMultiplier * mod.ModdedUnitMaxHealthMultiplierBonus
		else
			unit.HealthMultiplier = 1 + mod.ModdedUnitMaxHealthMultiplierBonus
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

-- Overriding to add in the logic for the Styx exit doors always having two minibosses
modutil.mod.Path.Wrap("DoUnlockRoomExits", function(base, run, room)
	if run.ModsNikkelMHadesBiomesIsModdedRun and room.Name == "D_Hub" then
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

function mod.ModsNikkelMHadesBiomesDoUnlockRoomExits(run, room)
	-- Synchronize the RNG to its initial state. Makes room reward choices deterministic on save/load
	RandomSynchronize()

	local roomData = RoomData[room.Name] or room
	local encounterData = EncounterData[room.Encounter.Name] or room.Encounter

	local rewardsChosen = {}
	local rewardStoreName = run.NextRewardStoreName or ChooseNextRewardStore(run)
	local rewardStoreOverrides = {}
	local exitDoorsIPairs = CollapseTableOrdered(MapState.OfferedExitDoors) or {}

	if room.UnavailableDoorIds ~= nil then
		for k, doorId in pairs(room.UnavailableDoorIds) do
			exitDoorsIPairs[doorId] = nil
		end
	end

	for index, door in ipairs(exitDoorsIPairs) do
		if room.PersistentRoomForDoors and room.DoorRoomHistory ~= nil and room.DoorRoomHistory[door.ObjectId] ~= nil then
			door.Room = ShallowCopyTable(run.RoomHistory[room.DoorRoomHistory[door.ObjectId]]) or {}
			-- Restore any missing data that may have been stripped for saving
			local originalRoomData = RoomData[door.Room.Name]
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
				roomForDoorData = RoomData[door.ForceRoomName]
			else
				roomForDoorData = ChooseNextRoomData(run, door.ChooseRoomArgs, exitDoorsIPairs)
			end
			local roomForDoor = CreateRoom(roomForDoorData,
				{ SkipChooseReward = true, SkipChooseEncounter = true, RoomOverrides = room.NextRoomOverrides }) or {}
			roomForDoor.NeedsReward = true
			door.Room = roomForDoor
		end

		local roomForDoorName = door.Room.GenusName or door.Room.Name
		if door.Room.ForcedRewardStore ~= nil then
			rewardStoreOverrides[index] = door.Room.ForcedRewardStore
		end
		if rewardStoreOverrides[index] and not Contains(RewardStoreData.InvalidOverrides, rewardStoreOverrides[index]) then
			rewardStoreName = rewardStoreOverrides[index]
		end
		wait(0.02) -- Distribute workload
	end

	if run.CurrentRoom.FirstAppearanceNumExitOverrides ~= nil and not mod.HasSeenRoomEarlierInRun(run, run.CurrentRoom.Name) then
		local randomDoors = ShallowCopyTable(exitDoorsIPairs)
		for i = 1, run.CurrentRoom.FirstAppearanceNumExitOverrides do
			local randomDoor = RemoveRandomValue(randomDoors)
			if randomDoor ~= nil and randomDoor.Room ~= nil then
				randomDoor.Room.UseOptionalOverrides = true
				for key, value in pairs(randomDoor.Room.OptionalOverrides) do
					randomDoor.Room[key] = value
				end
			end
		end
	end
	--DebugAssert({ Condition = #exitDoorsIPairs == run.CurrentRoom.NumExits, Text = "NumExits data mismatched to actual exits for "..run.CurrentRoom.Name })

	if roomData.MinDoorCageRewards ~= nil and roomData.MaxDoorCageRewards ~= nil then
		local smallestCageAmount = roomData.MaxDoorCageRewards
		for index, door in ipairs(exitDoorsIPairs) do
			if door.Room.MaxCageRewards ~= nil then
				smallestCageAmount = math.min(smallestCageAmount, door.Room.MaxCageRewards)
			end
		end
		room.MaxDoorCageRewards = smallestCageAmount
		if room.MaxDoorDepthChanceTable then
			room.NumDoorCageRewards = SelectFieldsDoorCageCount(run, room)
		else
			room.NumDoorCageRewards = RandomInt(room.MinDoorCageRewards, room.MaxDoorCageRewards)
		end
	end

	for index, door in ipairs(exitDoorsIPairs) do
		local doorRoom = door.Room
		if doorRoom ~= nil and doorRoom.NeedsReward then
			if doorRoom.IndividualRewardStore ~= nil then
				doorRoom.RewardStoreName = doorRoom.IndividualRewardStore
			elseif rewardStoreOverrides[index] ~= nil and not Contains(RewardStoreData.InvalidOverrides, rewardStoreOverrides[index]) then
				doorRoom.RewardStoreName = rewardStoreOverrides[index]
			else
				doorRoom.RewardStoreName = rewardStoreName
			end
			doorRoom.ChosenRewardType = ChooseRoomReward(CurrentRun, doorRoom, doorRoom.RewardStoreName, rewardsChosen,
				{ Door = door })
			if doorRoom.ChosenRewardType ~= nil then
				SetupRoomReward(CurrentRun, doorRoom, rewardsChosen,
					{ Door = door, IgnoreForceLootName = doorRoom.IgnoreForceLootName })
				table.insert(rewardsChosen, { RewardType = doorRoom.ChosenRewardType, ForceLootName = doorRoom.ForceLootName, })
			end
			doorRoom.NeedsReward = false

			if doorRoom.MaxCageRewards ~= nil then
				doorRoom.CageRewards = {}
				for i = 1, room.NumDoorCageRewards or 2 do
					local cageRoom = DeepCopyTable(doorRoom) or {}
					cageRoom.NeedsReward = true
					cageRoom.NoReward = false
					cageRoom.ChosenRewardType = ChooseRoomReward(CurrentRun, cageRoom, cageRoom.RewardStoreName, rewardsChosen)
					SetupRoomReward(CurrentRun, cageRoom, rewardsChosen,
						{ Door = door, IgnoreForceLootName = cageRoom.IgnoreForceLootName })
					local reward = { RewardType = cageRoom.ChosenRewardType, ForceLootName = cageRoom.ForceLootName, }
					table.insert(rewardsChosen, reward)
					table.insert(doorRoom.CageRewards, reward)
				end
			end
			--DebugPrint({ Text = "Door Cage Rewards:" })
			--DebugPrintTable( doorRoom.CageRewards, true )

			if doorRoom.UseOptionalOverrides then
				for key, value in pairs(doorRoom.OptionalOverrides) do
					doorRoom[key] = value
				end
			end
			AssignRoomToExitDoor(door, doorRoom)
			wait(0.02) -- Distribute workload
		end
	end

	wait(0.02) -- Distribute workload

	RandomSynchronize(#exitDoorsIPairs)

	for index, door in ipairs(exitDoorsIPairs) do
		if door.PreExitsUnlockedFunctionName ~= nil then
			thread(CallFunctionName, door.PreExitsUnlockedFunctionName, door, door.PreExitsUnlockedFunctionArgs)
		end
	end

	for index, door in ipairs(exitDoorsIPairs) do
		if not door.SkipUnlock then
			CreateDoorRewardPreview(door)
			thread(ExitDoorUnlockedPresentation, door)
			door.ReadyToUse = true
			if door.OnUnlockThreadedFunctionName ~= nil then
				thread(CallFunctionName, door.OnUnlockThreadedFunctionName, door, door.OnUnlockThreadedFunctionArgs)
			end
		end
	end

	MapState.OfferedRewards = {}
	for i, doorData in pairs(MapState.OfferedExitDoors) do
		if doorData and doorData.Room then
			local room = doorData.Room
			if room.CageRewards then
				for _, cageReward in pairs(room.CageRewards) do
					if cageReward.RewardType then
						MapState.OfferedRewards[cageReward.RewardType] = true
					end
				end
			end
			if room.ChosenRewardType then
				MapState.OfferedRewards[room.ChosenRewardType] = true
			end
		end
	end

	for id, obstacle in pairs(ShallowCopyTable(MapState.ActiveObstacles) or {}) do
		if obstacle.ExitsUnlockedFunctionName ~= nil then
			thread(CallFunctionName, obstacle.ExitsUnlockedFunctionName, obstacle, obstacle.ExitsUnlockedFunctionArgs)
		end
	end

	if CurrentRun.CurrentRoom.ChallengeSwitch ~= nil then
		local challengeSwitch = CurrentRun.CurrentRoom.ChallengeSwitch
		local startingValue = challengeSwitch.StartingValue or 0
		if challengeSwitch.RewardType == "Health" then
			startingValue = startingValue * CalculateHealingMultiplier()
		end
		if challengeSwitch.RewardType == "Money" and HasHeroTraitValue("BlockMoney") then
			startingValue = 0
		end
		challengeSwitch.StartingValue = round(startingValue)
		challengeSwitch.ReadyToUse = true
		challengeSwitch.UseText = challengeSwitch.ChallengeAvailableUseText
		RefreshUseButton(challengeSwitch.ObjectId, challengeSwitch)
		SetAnimation({ Name = challengeSwitch.UnlockedAnimationName, DestinationId = challengeSwitch.ObjectId })
		if challengeSwitch.UnlockedFxAnimationName ~= nil then
			CreateAnimation({ DestinationId = challengeSwitch.ObjectId, Name = challengeSwitch.UnlockedFxAnimationName })
		end
		PlaySound({ Name = "/SFX/ChallengeChestUnlocked", Id = challengeSwitch.ObjectId })
	end

	if CurrentRun.CurrentRoom.WellShop ~= nil then
		CurrentRun.CurrentRoom.WellShop.ReadyToUse = true
		CurrentRun.CurrentRoom.WellShop.UseText = CurrentRun.CurrentRoom.WellShop.AvailableUseText
		RefreshUseButton(CurrentRun.CurrentRoom.WellShop.ObjectId, CurrentRun.CurrentRoom.WellShop)
		SetAnimation({ Name = "WellShopUnlocked", DestinationId = CurrentRun.CurrentRoom.WellShop.ObjectId })
		PlaySound({ Name = "/SFX/WellShopUnlocked", Id = CurrentRun.CurrentRoom.WellShop.ObjectId })
	end

	if CurrentRun.CurrentRoom.SellTraitShop ~= nil and not CurrentRun.CurrentRoom.SellTraitShop.BlockedByRequirements then
		CurrentRun.CurrentRoom.SellTraitShop.ReadyToUse = true
		CurrentRun.CurrentRoom.SellTraitShop.UseText = CurrentRun.CurrentRoom.SellTraitShop.AvailableUseText
		RefreshUseButton(CurrentRun.CurrentRoom.SellTraitShop.ObjectId, CurrentRun.CurrentRoom.SellTraitShop)
		SetAnimation({ Name = "SellTraitShopUnlocked", DestinationId = CurrentRun.CurrentRoom.SellTraitShop.ObjectId })
		PlaySound({ Name = "/SFX/WellShopUnlocked", Id = CurrentRun.CurrentRoom.SellTraitShop.ObjectId })
	end

	if CurrentRun.CurrentRoom.SurfaceShop ~= nil then
		CurrentRun.CurrentRoom.SurfaceShop.ReadyToUse = true
		CurrentRun.CurrentRoom.SurfaceShop.UseText = CurrentRun.CurrentRoom.SurfaceShop.AvailableUseText
		RefreshUseButton(CurrentRun.CurrentRoom.SurfaceShop.ObjectId, CurrentRun.CurrentRoom.SurfaceShop)
		SetAnimation({ Name = "SurfaceShopUnlocked", DestinationId = CurrentRun.CurrentRoom.SurfaceShop.ObjectId })
		PlaySound({ Name = "/SFX/Menu Sounds/KeepsakeHermesFastClear", Id = CurrentRun.CurrentRoom.SurfaceShop.ObjectId })
	end

	if CurrentRun.CurrentRoom.MetaRewardStand ~= nil then
		if GameState.SpentShrinePointsCache >= CurrentRun.CurrentRoom.MetaRewardStand.RequiredShrinePoints then
			CurrentRun.CurrentRoom.MetaRewardStand.ReadyToUse = true
			CurrentRun.CurrentRoom.MetaRewardStand.UseText = CurrentRun.CurrentRoom.MetaRewardStand.AvailableUseText
			RefreshUseButton(CurrentRun.CurrentRoom.MetaRewardStand.ObjectId, CurrentRun.CurrentRoom.MetaRewardStand)
			StopAnimation({ Name = "MetaRewardStandLockedFx", DestinationId = CurrentRun.CurrentRoom.MetaRewardStand.ObjectId })
			SetAnimation({ Name = "MetaRewardStandUnlocked", DestinationId = CurrentRun.CurrentRoom.MetaRewardStand.ObjectId })
			PlaySound({ Name = "/SFX/WellShopUnlocked", Id = CurrentRun.CurrentRoom.MetaRewardStand.ObjectId })
		end
	end

	StartTriggers(CurrentRun.CurrentRoom, roomData.ExitsUnlockedDistanceTriggers)

	RunThreadedEvents(encounterData.ExitsUnlockedThreadedEvents, room.Encounter)
	RunThreadedEvents(roomData.ExitsUnlockedThreadedEvents, room)
end
