-- Adds RoomData for Tartarus from Hades to Hades II

local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus
local roomModifications = {
	BaseTartarus = {
		-- For debugging, toggle this to toggle Tartarus or Erebus encounters
		-- LegalEncounters = game.EncounterSets.FEncountersDefault,
		SaveProfileLocationText = roomSetDataTartarus.BaseTartarus.LocationText,
	},
	RoomOpening = {
		-- For debugging, switch between these two to toggle Tartarus or Erebus encounters
		LegalEncounters = { "OpeningGenerated" },
		-- LegalEncounters = { "OpeningGeneratedF" },
		EntranceFunctionArgs = { HeroGoalAngle = 335 },
		UnthreadedEvents = {},
		ThreadedEvents = {
			[1] = roomSetDataTartarus.RoomOpening.ThreadedEvents[1],
			[2] = roomSetDataTartarus.RoomOpening.ThreadedEvents[2],
			-- This will work with roomSetDataTartarus.RoomOpening.ThreadedEvents[3].Args.SpawnTypes = { "TartarusGhost01" }, but has the problem of spawning all Ghosts on the same ID
			[3] = nil
		},
	},
	-- This is the first run's opening room, which forces Athena boons
	RoomSimple01 = nil,
}

mod.ApplyModificationsAndInheritRoomData(roomSetDataTartarus, roomModifications)
