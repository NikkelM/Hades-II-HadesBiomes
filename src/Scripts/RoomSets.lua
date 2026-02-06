local newRoomSets = {
	Tartarus = {
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
		"A_Story01",

		"RoomSimple01",
		"A_Combat01",
		"A_Combat02",
		"A_Combat03",
		"A_Combat04",
		"A_Combat05",
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
	},
	Asphodel = {
		"X_Intro",

		"X_Boss01",
		"X_Boss02",

		"X_PostBoss01",

		"X_PreBoss01",
		"X_Shop01",

		"X_MiniBoss01",
		"X_MiniBoss02",
		-- Barge of Death
		"X_Wrapping01",

		"X_Reprieve01",
		"X_Story01",

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
	},
	Elysium = {
		"Y_Intro",

		"Y_Boss01",

		"Y_PostBoss01",

		"Y_PreBoss01",
		"Y_Shop01",

		"Y_MiniBoss01",
		"Y_MiniBoss02",

		"Y_Reprieve01",
		"Y_Story01",

		"Y_Combat01",
		"Y_Combat02",
		"Y_Combat03",
		"Y_Combat04",
		"Y_Combat05",
		"Y_Combat06",
		"Y_Combat08",
		"Y_Combat09",
		"Y_Combat10",
		"Y_Combat11",
		"Y_Combat12",
		"Y_Combat13",
		"Y_Combat14",
	},

	Styx = {
		"D_Intro",
		"D_Hub",

		"D_Boss01",

		"D_Reprieve01",

		"D_MiniBoss01",
		"D_MiniBoss02",
		"D_MiniBoss03",
		"D_MiniBoss04",

		"D_Combat01",
		"D_Combat02",
		"D_Combat03",
		"D_Combat04",
		"D_Combat05",
		"D_Combat06",

		"D_Mini01",
		"D_Mini02",
		"D_Mini03",
		"D_Mini04",
		"D_Mini05",
		"D_Mini06",
		"D_Mini07",
		"D_Mini08",
		"D_Mini09",
		"D_Mini10",
		"D_Mini11",
		"D_Mini12",
		"D_Mini13",
		"D_Mini14",
	},

	Surface = {
		"E_Intro",
		"E_Story01",

		"Return01",
		"Return02",
		"Return03",
		"Return04",
		"Return05",
		"Return06",
	},
}

for key, newRoomSet in pairs(newRoomSets) do
	game.RoomSets[key] = newRoomSet
end

-- This is for the vow that may spawn enemies from the next Biome
-- Left empty on purpose to allow Vow of Menace to take effect on the first modded run as well
local newNextRoomSets = {
	-- Tartarus = "Asphodel",
	-- Asphodel = "Elysium",
	-- Elysium = "Styx",
}

for key, newNextRoomSet in pairs(newNextRoomSets) do
	game.NextRoomSets[key] = newNextRoomSet
end
