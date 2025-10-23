-- Adds RoomData for the Surface from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseSurface = {
		RoomSetName = "Surface",
	},
}

local roomModifications = {
	-- GENERIC
	BaseSurface = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Surface",

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerSurfaceIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerSurfaceOut",

		-- Swap the player model to Zagreus
		-- TODO: Dialogue animations
		SwapAnimations = {
			["MelinoeIdle"] = "ModsNikkelMHadesBiomes_ZagreusIdle",
			["MelinoeWalkStart"] = "ModsNikkelMHadesBiomes_ZagreusWalk2",
			["MelinoeWalk"] = "ModsNikkelMHadesBiomes_ZagreusWalk2",
			["MelinoeWalkStop"] = "ModsNikkelMHadesBiomes_ZagreusWalk2Stop",
			["MelinoeStart"] = "ModsNikkelMHadesBiomes_ZagreusStart",
			["MelinoeRun"] = "ModsNikkelMHadesBiomes_ZagreusRun",
			["MelinoeStop"] = "ModsNikkelMHadesBiomes_ZagreusStop",
		},

		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceSurface",
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
	},

	-- OPENING ROOMS
	E_Intro = {
		Starting = true,
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceE_Intro",

		StartUnthreadedEvents = {
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "RoomStartAlphaChanges" },
		},
		DistanceTriggers = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "SunriseOverlook", },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "SunriseOverlookBackToRoom", },
		},

		ObstacleData = {
			[552607] = {
				OnUsedFunctionName = _PLUGIN.guid .. "." .. "LeaveRoomWithNoDoor",
				SetupEvents = {
					{
						FunctionName = "SetupDefaultDoor",
					},
					{
						FunctionName = "GenericPresentation",
						Args = {
							AddToGroup = "ExitDoors",
						},
					}
				},
				HideRewardPreview = true,
			},
		},
	},

	E_Story01 = {
		DistanceTriggers = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "CottageBloom", },
		},
		ExitFunctionName = _PLUGIN.guid .. "." .. "SurfaceToBoatRideExit",
		-- Blocks the Centaur and other on-room-start events from triggering during the ending
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Surface, roomModifications, roomReplacements, "Surface")
