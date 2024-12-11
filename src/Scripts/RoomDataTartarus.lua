
local mod = modutil.mod.Mod.Register(_PLUGIN.guid)

local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus
local modifications = {
	BaseTartarus = {
		LegalEncounters = game.EncounterSets.FEncountersDefault,
	},
	RoomOpening = {
		LegalEncounters = { "OpeningEmpty", "OpeningGeneratedF" },
		NextRoomSet = { "A", },
		EntranceFunctionName = "RoomEntranceMaterialize",
		EntranceFunctionArgs = { HeroGoalAngle = 335 },
		UnthreadedEvents = {},
		ThreadedEvents = {
			[3] = {}
		}
	}
}

-- Apply the modifications to the room set data, not removing other child tables, only overwriting or adding explicitly set new ones
for roomName, roomData in pairs(modifications) do
	for key, value in pairs(roomData) do
		roomSetDataTartarus[roomName][key] = value
	end
end

-- Add the Tartarus room set data to the game
game.AddTableKeysCheckDupes(game.RoomData, roomSetDataTartarus)
