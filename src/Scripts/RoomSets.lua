local newRoomSets = {
	Tartarus = {
		-- Opening room for the very first run, forces Athena boon, no enemies
		-- "RoomSimple01",
		"RoomOpening",

		"A_Boss01",
		"A_Boss02",
		"A_Boss03",

		"A_PostBoss01",

		"A_PreBoss01",
		"A_Shop01",

		"A_MiniBoss01",
		"A_MiniBoss02",
		"A_MiniBoss03",
		"A_MiniBoss04",

		"A_Reprieve01",

		"A_Combat01",
		"A_Combat02",
		"A_Combat03",
		-- Disabled due to dart traps not working, #52
		-- "A_Combat04",
		-- "A_Combat05",
		"A_Combat06",
		"A_Combat07",
		"A_Combat08A",
		"A_Combat08B",
		"A_Combat09",
		"A_Combat10",
		"A_Combat11",
		"A_Combat12",
		"A_Combat13",
		"A_Combat14",
		"A_Combat15",
		"A_Combat16",
		"A_Combat17",
		"A_Combat18",
		"A_Combat19",
		"A_Combat20",
		"A_Combat21",
		"A_Combat24",

		-- Sisyphus NPC cannot be activated, ID is not found
		-- "A_Story01",
	},
	Asphodel = {
		"X_Intro",

		"X_Boss01",
		"X_Boss02",

		"X_PostBoss01",

		"X_PreBoss01",
		"X_Shop01",

		-- Barge of Death
		"X_Wrapping01",
		"X_MiniBoss01",
		"X_MiniBoss02",

		"X_Reprieve01",

		"X_Combat01",
		"X_Combat02",
		"X_Combat03",
		"X_Combat04",
		"X_Combat05",
		"X_Combat06",
		"X_Combat07",
		"X_Combat08",
		"X_Combat09",
		"X_Combat10",
		"X_Combat21",
		"X_Combat22",

		-- "X_Story01",
	},
	Elysium = {
		"C_Intro",

		"C_Boss01",

		"C_PostBoss01",

		"C_PreBoss01",
		"C_Shop01",

		"C_MiniBoss01",
		"C_MiniBoss02",
		-- Not implemented in Hades
		-- "C_MiniBoss03",

		"C_Reprieve01",

		"C_Combat01",
		"C_Combat02",
		"C_Combat03",
		"C_Combat04",
		"C_Combat05",
		"C_Combat06",
		"C_Combat07",
		"C_Combat08",
		"C_Combat09",
		"C_Combat10",
		"C_Combat11",
		"C_Combat12",
		"C_Combat13",
		"C_Combat14",
		"C_Combat15",

		-- "C_Story01",
	},
}

for key, newRoomSet in pairs(newRoomSets) do
	game.RoomSets[key] = newRoomSet
end

-- This is for the vow that may spawn enemies from the next Biome
local newNextRoomSets = {
	Tartarus = "Asphodel",
	Asphodel = "Elysium",
	Elysium = "Styx",
}

for key, newNextRoomSet in pairs(newNextRoomSets) do
	game.NextRoomSets[key] = newNextRoomSet
end
