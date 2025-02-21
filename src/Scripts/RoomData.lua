-- Adds basic RoomData from Hades to Hades II

local roomData = {
	RandomizeTrapTypes = mod.RoomData.Base.RandomizeTrapTypes,
	RandomizeTrapTypesAll = mod.RoomData.Base.RandomizeTrapTypesAll,
	AllPrePlacedTraps = mod.RoomData.Base.AllPrePlacedTraps,
}

local roomReplacements = {}

local roomModifications = {}

mod.ApplyModificationsAndInheritRoomData(roomData, roomModifications, roomReplacements, "Base")
