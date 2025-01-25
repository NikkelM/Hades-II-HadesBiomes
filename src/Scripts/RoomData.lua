-- Adds basic RoomData from Hades to Hades II

local roomDataBase = mod.LoadHadesRoomData("RoomData.lua").Base

local roomData = {
	RandomizeTrapTypes = roomDataBase.RandomizeTrapTypes,
	RandomizeTrapTypesAll = roomDataBase.RandomizeTrapTypesAll,
	AllPrePlacedTraps = roomDataBase.AllPrePlacedTraps,
}

local roomReplacements = {}

local roomModifications = {}

mod.ApplyModificationsAndInheritRoomData(roomData, roomModifications, roomReplacements, "Base")
