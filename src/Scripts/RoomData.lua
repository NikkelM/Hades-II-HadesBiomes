-- Adds RoomData for Tartarus from Hades to Hades II

local roomDataBase = mod.LoadHadesRoomData("RoomData.lua").Base
local roomData = {}
local roomModifications = {}

mod.ApplyModificationsAndInheritRoomData(roomData, roomModifications)
