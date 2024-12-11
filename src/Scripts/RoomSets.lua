local newRoomSets = {
	-- TartarusModsNikkelMHadesBiomes / Tartarus 
	A = {
		-- "RoomSimple01",
		"RoomOpening",

		"A_PreBoss01",
		"A_Boss01",

		"A_Combat01"
	}
}

for key, newRoomSet in pairs(newRoomSets) do
	game.RoomSets[key] = newRoomSet
end

local newNextRoomSets = {
	-- Dummy, after Tartarus comes Erebus
	A = "F"
}

for key, newNextRoomSet in pairs(newNextRoomSets) do
	game.NextRoomSets[key] = newNextRoomSet
end
