-- Adds basic RoomData from Hades to Hades II
local roomData = {
	-- Traps
	RandomizeTrapTypes = mod.RoomData.Base.RandomizeTrapTypes,
	RandomizeTrapTypesAll = mod.RoomData.Base.RandomizeTrapTypesAll,
	AllPrePlacedTraps = mod.RoomData.Base.AllPrePlacedTraps,
	-- Rooms
	RoomChallenge01 = mod.RoomData.Base.RoomChallenge01,
}

local roomReplacements = {}
local roomModifications = {
	RoomChallenge01 = {
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	},
}

mod.ApplyModificationsAndInheritRoomData(roomData, roomModifications, roomReplacements, "Base")

-- For Styx Hub, allow the custom entrance function, and don't spawn familiars in the reload-room fashion, as we do it custom to ensure a proper animation
table.insert(game.RoomEventData.EntranceFunctionNamePriorities,
	_PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesReturnToStyxHubPresentation")
local blockWeirdFamiliarSpawnStyxHub = {
	Path = { "CurrentRun", "CurrentRoom", "Name" },
	IsNone = { "D_Hub" }
}
table.insert(game.RoomEventData.GlobalRoomPostCombatReloadInputUnblockedEvents[1].GameStateRequirements,
	blockWeirdFamiliarSpawnStyxHub)
