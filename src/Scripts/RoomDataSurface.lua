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
	},

	-- OPENING ROOMS
	E_Intro = {
		-- TODO: Is this needed?
		InheritFrom = { "BaseSurface", "BiomeStartRoom", },
		Starting = true,
		-- TODO: Move into BaseSurface?
		BlockRunProgressUI = true,
		-- EntranceFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesDelayedRoomEntranceStandard",
		StartUnthreadedEvents = {
			{ FunctionName = "EndBiomeRecords", },
			{ FunctionName = "EndAllBiomeStates" },
		},
		-- EntranceDirection = "LeftRight",
		-- StrictLeftRight = true,
		ThreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "DisplayLocationText", Args = { AnimationName = "ModsNikkelMHadesBiomesInfoBannerSurfaceIn", AnimationOutName = "ModsNikkelMHadesBiomesInfoBannerSurfaceOut" }, },
		},
	},
	E_Story01 = {
		-- TODO: Move into BaseSurface?
		BlockRunProgressUI = true,
		-- EntranceFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesDelayedRoomEntranceStandard",
		-- EntranceDirection = "LeftRight",
		-- StrictLeftRight = true,
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Styx, roomModifications, roomReplacements, "Surface")
