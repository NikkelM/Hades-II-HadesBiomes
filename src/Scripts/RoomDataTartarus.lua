local mod = modutil.mod.Mod.Register(_PLUGIN.guid)

local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus
local roomModifications = {
	BaseTartarus = {
		LegalEncounters = game.EncounterSets.FEncountersDefault,
	},
	RoomOpening = {
		LegalEncounters = { "OpeningEmpty", "OpeningGeneratedF" },
		-- NextRoomSet = { "A" }, -- No longer needed as we are using Tartarus again
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
-- Applies modifications to the rooms, such as LegalEncounterDictionary
-- TODO: Move to after all biomes are loaded
game.SetupRunData()
