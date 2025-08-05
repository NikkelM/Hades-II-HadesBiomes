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
modutil.mod.Path.Wrap("LoadCurrentRoomResources", function(base, currentRoom)
	base(currentRoom)

	local moddedRoomSets = {
		["Tartarus"] = true,
		["Asphodel"] = true,
		["Elysium"] = true,
		["Styx"] = true,
	}

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and moddedRoomSets[currentRoom.RoomSetName] then
		currentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath = currentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath or {}

		-- Some packages introduce artifacts
		UnloadPackages({ Name = "DeathArea" })
		UnloadPackages({ Name = "Chaos" })

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

		if currentRoom.LoadModdedAudioBanks ~= nil then
			for _, bank in ipairs(currentRoom.LoadModdedAudioBanks) do
				rom.audio.load_bank(rom.path.combine(rom.paths.Content(), "Audio\\Desktop\\" .. bank .. ".bank"))
			end
		end

		if currentRoom.LoadCustomModdedAudioBanks ~= nil then
			for _, bank in ipairs(currentRoom.LoadCustomModdedAudioBanks) do
				rom.audio.load_bank(rom.path.combine(_PLUGIN.plugins_data_mod_folder_path,
					"Content\\Audio\\Desktop\\" .. bank .. ".bank"))
			end
		end

		if currentRoom.LoadModdedVoiceBanks ~= nil then
			game.LoadVoiceBanks(currentRoom.LoadModdedVoiceBanks)
		end
	end
end)

-- To restore ActivatePrePlaced enemies in story rooms
modutil.mod.Path.Wrap("RestoreUnlockRoomExits", function(base, currentRun, currentRoom)
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if currentRoom.ModsNikkelMHadesBiomesOnReloadRunStartRoomUnthreadedEvents then
			game.RunEventsGeneric(currentRoom.Encounter.StartRoomUnthreadedEvents, currentRoom.Encounter)
			game.RunEventsGeneric(currentRoom.ModsNikkelMHadesBiomesOnReloadUnthreadedEvents)
		end
	end

	base(currentRun, currentRoom)
end)

modutil.mod.Path.Wrap("SetupUnit", function(base, unit, currentRun, args)
	currentRun = currentRun or game.CurrentRun
	args = args or {}

	if currentRun.ModsNikkelMHadesBiomesIsModdedRun and unit.ModsNikkelMHadesBiomesIsModdedEnemy then
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
		game.SpawnSupportAI(enemy)
	end
	base(enemy, args)
end)

modutil.mod.Path.Wrap("SetupInspectPoint", function(base, inspectPointData)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- Storyteller voicelines are added to the Megaera voicebank, as the game can't load unknown voicebanks and Storyteller is already taken
		game.LoadVoiceBanks({ Name = "Megaera" })
	end
	base(inspectPointData)
end)
