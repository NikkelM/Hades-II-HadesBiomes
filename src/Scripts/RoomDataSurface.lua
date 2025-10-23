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
		SwapAnimations = {
			["MelinoeIdle"] = "ModsNikkelMHadesBiomes_ZagreusIdle",
			["MelinoeWalkStart"] = "ModsNikkelMHadesBiomes_ZagreusWalk2",
			["MelinoeWalk"] = "ModsNikkelMHadesBiomes_ZagreusWalk2",
			["MelinoeWalkStop"] = "ModsNikkelMHadesBiomes_ZagreusWalk2Stop",
			["MelinoeStart"] = "ModsNikkelMHadesBiomes_ZagreusStart",
			["MelinoeRun"] = "ModsNikkelMHadesBiomes_ZagreusRun",
			["MelinoeStop"] = "ModsNikkelMHadesBiomes_ZagreusStop",
			-- Dialogue animations
			["ZagreusTalkEmpathyStart"] = "ModsNikkelMHadesBiomes_ZagreusTalkEmpathyStart",
			["ZagreusTalkEmpathy_Return"] = "ModsNikkelMHadesBiomes_ZagreusTalkEmpathy_Return",
			["ZagreusInteractionThoughtful"] = "ModsNikkelMHadesBiomes_ZagreusInteractionThoughtful",
			["ZagreusTalkDenialStart"] = "ModsNikkelMHadesBiomes_ZagreusTalkDenialStart",
			["ZagreusTalkDenial_Full"] = "ModsNikkelMHadesBiomes_ZagreusTalkDenial_Full",
			["ZagreusTalkDenialReturnToIdle"] = "ModsNikkelMHadesBiomes_ZagreusTalkDenialReturnToIdle",
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
