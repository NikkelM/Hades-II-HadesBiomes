local mod = modutil.mod.Mod.Register(_PLUGIN.guid)

local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus
local roomModifications = {
	BaseTartarus = {
		LegalEncounters = game.EncounterSets.FEncountersDefault,
		RoomSetName = "A"
	},
	RoomOpening = {
		LegalEncounters = { "OpeningEmpty", "OpeningGeneratedF" },
		NextRoomSet = { "A", },
		EntranceFunctionName = "RoomEntranceMaterialize",
		EntranceFunctionArgs = { HeroGoalAngle = 335 }, -- the spawn point is a bit far away, so Mel doesn't get all the way to the main room area with her dash
		UnthreadedEvents = {},
		ThreadedEvents = {
			[3] = {}
		}
	},
	-- This is the first run RoomOpening room, which forces Athena boons
	RoomSimple01 = nil,
}

mod.ApplyModificationsAndInherit(roomSetDataTartarus, roomModifications)
