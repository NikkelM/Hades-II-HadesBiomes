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

		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceSurface",
		BlockCombat = true,
		BlockRunProgressUI = true,
	},

	-- OPENING ROOMS
	E_Intro = {
		InheritFrom = { "BaseSurface", "BiomeStartRoom", },
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
				OnUsedFunctionName = "AttemptUseDoor",
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
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Surface, roomModifications, roomReplacements, "Surface")
