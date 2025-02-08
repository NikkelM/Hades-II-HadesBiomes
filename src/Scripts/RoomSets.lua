local newRoomSets = {
	Tartarus = {
		-- Opening room for the very first run, forces Athena boon, no enemies
		-- "RoomSimple01",
		"RoomOpening",

		"A_Boss01",
		-- "A_Boss02",
		-- "A_Boss03",

		"A_PostBoss01",

		-- "A_MiniBoss01",
		-- "A_MiniBoss02",
		-- "A_MiniBoss03",
		-- "A_MiniBoss04",

		"A_PreBoss01",
		-- "A_Shop01",

		-- "A_Reprieve01",
		-- "A_Reprieve01",

		-- "A_Combat01",
		-- "A_Combat02",
		-- "A_Combat03",
		-- "A_Combat04",
		-- "A_Combat05",
		-- "A_Combat06",
		-- "A_Combat07",
		-- "A_Combat08A",
		-- "A_Combat08B",
		-- "A_Combat09",
		-- "A_Combat10",
		-- "A_Combat11",
		-- "A_Combat12",
		-- "A_Combat13",
		-- "A_Combat14",
		-- "A_Combat15",
		-- "A_Combat16",
		-- "A_Combat17",
		-- "A_Combat18",
		-- "A_Combat19",
		-- "A_Combat20",
		-- "A_Combat21",
		-- "A_Combat24",
		-- "A_Combat25",
		-- These two rooms have no RoomData table attached
		-- "A_Combat22",
		-- "A_Combat23",

		-- "A_Story01",
	},

	Asphodel = {

	},
}

for key, newRoomSet in pairs(newRoomSets) do
	game.RoomSets[key] = newRoomSet
end

-- This is for the vow that may spawn enemies from the next Biome
local newNextRoomSets = {
	Tartarus = "F"
}

for key, newNextRoomSet in pairs(newNextRoomSets) do
	game.NextRoomSets[key] = newNextRoomSet
end
