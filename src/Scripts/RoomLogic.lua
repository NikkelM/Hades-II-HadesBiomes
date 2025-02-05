-- Set the correct reward preview backing for the door, after choosing the next reward type
modutil.mod.Path.Wrap("ChooseNextRewardStore", function(base, run)
	base(run)
	if run.ModsNikkelMHadesBiomesExitDoors ~= nil then
		for _, door in ipairs(run.ModsNikkelMHadesBiomesExitDoors) do
			if door.MetaRewardAnimation ~= nil and run.NextRewardStoreName == "MetaProgress" then
				SetAnimation({ Name = door.MetaRewardAnimation, DestinationId = door.ObjectId })
			elseif door.LockedAnimation ~= nil then
				SetAnimation({ Name = door.LockedAnimation, DestinationId = door.ObjectId })
			end
		end

		run.ModsNikkelMHadesBiomesExitDoors = {}
	end
end)

-- Wrap to also load modded resources, such as additional audio banks
modutil.mod.Path.Wrap("LoadCurrentRoomResources", function(base, currentRoom)
	base(currentRoom)

	if currentRoom.LoadModdedAudioBanks ~= nil then
		for _, bank in ipairs(currentRoom.LoadModdedAudioBanks) do
			rom.audio.load_bank(rom.path.combine(rom.paths.Content(), "Audio\\Desktop\\" .. bank .. ".bank"))
		end
	end

	if currentRoom.LoadModdedVoiceBanks ~= nil then
		game.LoadVoiceBanks(currentRoom.LoadModdedVoiceBanks)
	end
end)
