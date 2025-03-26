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

	local validRoomSets = {
		["Tartarus"] = true,
		["Asphodel"] = true,
		["Elysium"] = true,
		["Styx"] = true,
	}

	if validRoomSets[currentRoom.RoomSetName] then
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

		if currentRoom.LoadModdedAudioBanks ~= nil then
			for _, bank in ipairs(currentRoom.LoadModdedAudioBanks) do
				rom.audio.load_bank(rom.path.combine(rom.paths.Content(), "Audio\\Desktop\\" .. bank .. ".bank"))
			end
		end

		if currentRoom.LoadModdedVoiceBanks ~= nil then
			game.LoadVoiceBanks(currentRoom.LoadModdedVoiceBanks)
		end
	end
end)

modutil.mod.Path.Wrap("SetupUnit", function(base, unit, currentRun, args)
	base(unit, currentRun, args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and unit.ModsNikkelMHadesBiomesIsModdedEnemy then
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
	end
end)
