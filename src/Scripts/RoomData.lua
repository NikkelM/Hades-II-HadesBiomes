-- Adds basic RoomData from Hades to Hades II

-- #region BASE
local baseRoomData = {
	RandomizeTrapTypes = mod.RoomData.Base.RandomizeTrapTypes,
	RandomizeTrapTypesAll = mod.RoomData.Base.RandomizeTrapTypesAll,
	AllPrePlacedTraps = mod.RoomData.Base.AllPrePlacedTraps,
}

local baseRoomReplacements = {}
local baseRoomModifications = {}

mod.ApplyModificationsAndInheritRoomData(baseRoomData, baseRoomModifications, baseRoomReplacements, "Base")
-- #endregion

-- #region CHALLENGE
local challengeRoomData = {
	RoomChallenge01 = mod.RoomData.Base.RoomChallenge01,
}

local challengeRoomReplacements = {}
local challengeRoomModifications = {
	RoomChallenge01 = {
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	},
}

mod.ApplyModificationsAndInheritRoomData(challengeRoomData, challengeRoomModifications, challengeRoomReplacements,
	"Challenge")
-- #endregion

-- #region SURFACE
local surfaceRoomData = {
	Return01 = mod.RoomData.Base.Return01,
	Return02 = mod.RoomData.Base.Return02,
	Return03 = mod.RoomData.Base.Return03,
	Return04 = mod.RoomData.Base.Return04,
	Return05 = mod.RoomData.Base.Return05,
	Return06 = mod.RoomData.Base.Return06,
}

local surfaceRoomReplacements = {}
local surfaceRoomModifications = {
	Return01 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits", "NikkelM-HadesBiomesFxModded", "ModsNikkelMHadesBiomesFxOriginal", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicModded", },
		EntranceFunctionName = _PLUGIN.guid .. "." .. "ReturnRoomEntrance",
		ExitFunctionName = _PLUGIN.guid .. "." .. "ReturnRoomExit",
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRideAnimationSetup" },
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return02 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits", "NikkelM-HadesBiomesFxModded", "ModsNikkelMHadesBiomesFxOriginal", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = { NextMap = "Return03", } },
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return03 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits", "NikkelM-HadesBiomesFxModded", "ModsNikkelMHadesBiomesFxOriginal", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = { NextMap = "Return04", } },
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return04 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits", "NikkelM-HadesBiomesFxModded", "ModsNikkelMHadesBiomesFxOriginal", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = { NextMap = "Return05", } },
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return05 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits", "NikkelM-HadesBiomesFxModded", "ModsNikkelMHadesBiomesFxOriginal", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = { NextMap = "Return06", } },
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return06 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits", "NikkelM-HadesBiomesFxModded", "ModsNikkelMHadesBiomesFxOriginal", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRideAudio" },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = {} },
			[3] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRideOutro" },
			[4] = { FunctionName = _PLUGIN.guid .. "." .. "SurfaceKillHero", Args = {} },
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
	},
}

mod.ApplyModificationsAndInheritRoomData(surfaceRoomData, surfaceRoomModifications, surfaceRoomReplacements, "Surface")
-- #endregion

-- For Styx Hub, allow the custom entrance function, and don't spawn familiars in the reload-room fashion, as we do it custom to ensure a proper animation
table.insert(game.RoomEventData.EntranceFunctionNamePriorities,
	_PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesReturnToStyxHubPresentation")
local blockWeirdFamiliarSpawnStyxHub = {
	Path = { "CurrentRun", "CurrentRoom", "Name" },
	IsNone = { "D_Hub" }
}
table.insert(game.RoomEventData.GlobalRoomPostCombatReloadInputUnblockedEvents[1].GameStateRequirements,
	blockWeirdFamiliarSpawnStyxHub)
