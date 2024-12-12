local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus
local roomModifications = {
	BaseTartarus = {
		LegalEncounters = game.EncounterSets.FEncountersDefault,
		SaveProfileLocationText = roomSetDataTartarus.BaseTartarus.LocationText,
	},
	RoomOpening = {
		LegalEncounters = { "OpeningEmpty", "OpeningGeneratedF" },
		EntranceFunctionArgs = { HeroGoalAngle = 335 },
		UnthreadedEvents = {},
		ThreadedEvents = {
			[1] = roomSetDataTartarus.RoomOpening.ThreadedEvents[1],
			[2] = roomSetDataTartarus.RoomOpening.ThreadedEvents[2],
			[3] = nil
		},
	},
	-- This is the first run's opening room, which forces Athena boons
	RoomSimple01 = nil,
}

mod.ApplyModificationsAndInherit(roomSetDataTartarus, roomModifications)
