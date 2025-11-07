-- Adds RoomData for the Surface from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseSurface = {
		RoomSetName = "Surface",

		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasExorcismPoint = false,

		HasFishingPoint = true,
		FishingPointRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "PersephoneFirstMeeting" },
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				SumPrevRooms = 5,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},

			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", },
						NotHasAll = { "Fish_Surface_Common_01", "Fish_Surface_Rare_01", "Fish_Surface_Legendary_01" },
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 2,
						Path = { "NumExorcismPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
	},
}

local roomModifications = {
	-- GENERIC
	BaseSurface = {
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits", "NikkelM-HadesBiomesFxModded", "ModsNikkelMHadesBiomesFxOriginal", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicModded", "ModsNikkelMHadesBiomesMusicSurfaceModded", },

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
			-- Fishing
			["Melinoe_Staff_Unequip"] = "ModsNikkelMHadesBiomes_ZagreusIdle",
			["Melinoe_Torch_Unequip"] = "ModsNikkelMHadesBiomes_ZagreusIdle",
			["Melinoe_Axe_Unequip"] = "ModsNikkelMHadesBiomes_ZagreusIdle",
			["Melinoe_Dagger_Unequip"] = "ModsNikkelMHadesBiomes_ZagreusIdle",
			["Melinoe_Lob_Unequip"] = "ModsNikkelMHadesBiomes_ZagreusIdle",
			["Melinoe_Suit_Unequip"] = "ModsNikkelMHadesBiomes_ZagreusIdle",
			["Melinoe_Fishing_Start"] = "ZagreusInteractionFishing_Start",
			["Melinoe_Fishing_Idle"] = "ZagreusInteractionFishing",
			["Melinoe_Fishing_Fidget"] = "ZagreusInteractionFishing_FishingWait",
			["Melinoe_Fishing_Success"] = "ZagreusInteractionFishing_PullSuccess",
			["Melinoe_Fishing_Failure"] = "ZagreusInteractionFishing_PullFailure",
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
		-- "/Music/PersephoneTheme_MC"
		Music = "{6925b297-5627-4549-b137-135aca5919d2}",
		-- "/Leftovers/Ambience/ShoreAmbienceGentleWind"
		Ambience = "{8235412b-da78-464a-8b1b-b1d528fda957}",

		Starting = true,
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceE_Intro",

		StartUnthreadedEvents = {
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "RoomStartAlphaChanges" },
		},
		DistanceTriggers = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "SunriseOverlook", },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "SunriseOverlookBackToRoom", },
		},
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },

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
		-- "/Leftovers/Ambience/FarmAmbience"
		Ambience = "{b4e1c250-5dfc-4d9e-8c38-8f44c4462d1a}",
		DistanceTriggers = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "CottageBloom", },
		},
		ExitFunctionName = _PLUGIN.guid .. "." .. "SurfaceToBoatRideExit",
		-- Blocks the Centaur and other on-room-start events from triggering during the ending
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Surface, roomModifications, roomReplacements, "Surface")
