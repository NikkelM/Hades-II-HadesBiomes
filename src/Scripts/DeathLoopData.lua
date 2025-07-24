-- Adds a door (Chaos gate) to the training room that allows the player to start a Hades run

-- Add the setup function to the Hub room
table.insert(game.HubRoomData.Hub_PreRun.StartUnthreadedEvents, {
	FunctionName = _PLUGIN.guid .. '.' .. 'SpawnHadesRunStartDoor',
})

function mod.SpawnHadesRunStartDoor(source, args)
	-- Vow shrine would be: 589694
	-- Run start door for the underworld
	local spawnId = 420947

	local chaosGate = game.DeepCopyTable(game.ObstacleData.SecretDoor) or {}

	chaosGate.ObjectId = SpawnObstacle({
		Name = "ModsNikkelMHadesBiomes_HadesRunStartDoor",
		Group = "FX_Terrain",
		DestinationId = spawnId,
		AttachedTable = chaosGate,
		OffsetX = 800,
		OffsetY = 10,
	})
	chaosGate.ActivateIds = { chaosGate.ObjectId }

	chaosGate.SetupEvents = { { FunctionName = "ModsNikkelMHadesBiomesUpdateEscapeDoorForLimitGraspShrineUpgrade", }, }
	chaosGate.SpeakerName = nil
	chaosGate.DistanceTrigger = {}
	chaosGate.UnlockedSound = nil
	chaosGate.HealthCost = nil
	chaosGate.ExitBlockedVoiceLines = nil
	chaosGate.ExitDoorOpenAnimation = nil
	chaosGate.ModsNikkelMHadesBiomesIsRunStartDoor = true

	chaosGate.UseText = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText"
	-- Normally this would check if the exit door for a room can be used - we always allow it
	-- Might add a requirement here if we ever put Hades runs behind a requirement/enchantment
	chaosGate.OnUseEvents = {}
	chaosGate.OnUsedFunctionName = _PLUGIN.guid .. "." .. "StartHadesRun"
	chaosGate.OnUsedFunctionArgs = {
		-- TODO: For debugging, change to currently worked on biome
		StartingBiome = "Tartarus",
		-- Don't play a voiceline - we do this when entering the Chaos gate
		-- We have to do it then, as otherwise MelinoeField is being onloaded in PreThingCreation
		GlobalVoiceLines = "EmptyStartNewHadesRunVoiceLines",
		-- For the DirectionHintPresentation if LimitGraspShrineUpgradeEscapeDoorClosed is active
		AltarId = 589766,
	}
	-- Used by LeaveRoomSecretDoorPresentation to determine the fade animation
	chaosGate.Room = {}

	game.SetupObstacle(chaosGate)
	AddToGroup({ Id = chaosGate.ObjectId, Name = "ModsNikkelMHadesBiomes.RunStartDoor" })
	-- Enable MelinoeField voicelines when entering the Chaos gate
	game.LoadVoiceBanks({ Name = "MelinoeField" })
end

function mod.StartHadesRun(source, args)
	args = args or {}
	-- Don't allow rain in underworld/modded runs
	game.GameState.NextBiomeStateName = "VanillaState"

	local cachedRuns = mod.LoadCachedRunsFile()

	if game.GameState.ModsNikkelMHadesBiomesSaveFileIndex == nil then
		-- Assign the GameState memory address (hash) as the index
		game.GameState.ModsNikkelMHadesBiomesSaveFileIndex = tostring(game.GameState):match("table: (.+)")
		game.RequestPreRunLoadoutChangeSave()
		sjson.encode_file(mod.CachedRunsFilePath, cachedRuns)
		mod.DebugPrint(
			"Assigned the following mod save file identifier to the current save slot: " ..
			game.GameState.ModsNikkelMHadesBiomesSaveFileIndex, 4)
	end

	-- Replace the voicelines that can play when entering the Chaos gate
	local originalSecretUnlockedVoiceLines = game.DeepCopyTable(game.HeroVoiceLines.SecretUnlockedVoiceLines)
	game.HeroVoiceLines.SecretUnlockedVoiceLines = game.GlobalVoiceLines.StartNewHadesRunVoiceLines

	-- Don't show the healing text you normally get when exiting rooms with the Arcana activated
	local originalConfigDamageOption = game.ConfigOptionCache.ShowDamageNumbers
	game.ConfigOptionCache.ShowDamageNumbers = false

	game.LeaveRoomSecretDoorPresentation(game.CurrentRun, source)

	game.HeroVoiceLines.SecretUnlockedVoiceLines = originalSecretUnlockedVoiceLines
	game.ConfigOptionCache.ShowDamageNumbers = originalConfigDamageOption

	game.UseEscapeDoor(source, args)
end
