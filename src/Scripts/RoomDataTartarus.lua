-- Adds RoomData for Tartarus from Hades to Hades II

local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus
local roomModifications = {
	BaseTartarus = {
		-- TODO: Localization?
		SaveProfileLocationText = "TARTARUS (Nightmare)", -- roomSetDataTartarus.BaseTartarus.LocationText,

		TimeChallengeEncounterOptions = { "TimeChallengeTartarus" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeTartarus" },
		EliteChallengeEncounterOptions = { "EliteChallengeTartarus" },
	},
	RoomOpening = {
		LegalEncounters = { "OpeningGenerated" },
		EntranceFunctionArgs = { HeroGoalAngle = 335 },
		UnthreadedEvents = {},
		ThreadedEvents = {
			[1] = roomSetDataTartarus.RoomOpening.ThreadedEvents[1],
			[2] = roomSetDataTartarus.RoomOpening.ThreadedEvents[2],
			-- This will work with roomSetDataTartarus.RoomOpening.ThreadedEvents[3].Args.SpawnTypes = { "TartarusGhost01" }, but has the problem of spawning all Ghosts on the same ID
			[3] = mod.NilValue
		},
	},
	-- This is the first run's opening room, which forces Athena boons
	RoomSimple01 = mod.NilValue,
}

mod.ApplyModificationsAndInheritRoomData(roomSetDataTartarus, roomModifications)
