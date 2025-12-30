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
	RoomChallenge02 = mod.RoomData.Base.RoomChallenge02,
	RoomChallenge03 = mod.RoomData.Base.RoomChallenge03,
	RoomChallenge04 = mod.RoomData.Base.RoomChallenge04,
}

local challengeRoomReplacements = {}
local challengeRoomModifications = {
	RoomChallenge01 = {
		RoomSetName = "Challenge",

		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "NikkelM-HadesBiomesFxModded", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicModded", },

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Challenge",

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerErebusIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerErebusOut",

		IneligibleRewards = { "Devotion", "WeaponUpgrade", "SpellDrop", "HermesUpgrade" },

		InspectPoints = {
			[515865] = {
				InteractTextLineSets = {
					CharonFirstInspect = mod.NilValue,
					ModsNikkelMHadesBiomes_Challenge01FirstInspect = {
						-- Is this where Father's goons assemble to come after me?
						EndCue = "/VO/ZagreusField_1472",
						EndWait = 0.3,
						{
							Cue = "/VO/Storyteller_0220",
							Text =
							"{#DialogueItalicFormat}Concealed in the dark recesses of the Underworld is the land of Erebus, wherein the dead await eternal sentencing; they long for the attention and good graces of their master, the Lord Hades."
						},
					},
				}
			}
		},
	},
}

mod.ApplyModificationsAndInheritRoomData(challengeRoomData, challengeRoomModifications, challengeRoomReplacements,
	"Challenge")
-- #endregion

-- #region CHARON
local charonRoomData = {
	CharonFight01 = mod.RoomData.Base.CharonFight01,
}

local charonRoomReplacements = {}
local charonRoomModifications = {
	CharonFight01 = {
		RoomSetName = "Charon",
	},
}

-- mod.ApplyModificationsAndInheritRoomData(charonRoomData, charonRoomModifications, charonRoomReplacements, "Charon")
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
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "NikkelM-HadesBiomesFxModded", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicModded", "ModsNikkelMHadesBiomesMusicSurfaceModded", },
		EntranceFunctionName = _PLUGIN.guid .. "." .. "ReturnRoomEntrance",
		ExitFunctionName = _PLUGIN.guid .. "." .. "ReturnRoomExit",
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRideAnimationSetup" },
		},
		HeroOverwrites = {
			AttachedAnimationName = "nil",
			LineHistoryName = "NPC_Zagreus_Past_01",
			NarrativeFadeInColor = game.Color.ZagreusVoice,
			SubtitleColor = game.Color.ZagreusVoice,
		},
		RoomExitHeroOverwrites = {
			AttachedAnimationName = "LaurelCindersSpawner",
			LineHistoryName = "PlayerUnit",
			NarrativeFadeInColor = game.Color.Teal,
			SubtitleColor = game.Color.White,
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		BlockDoorHealFromPrevious = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return02 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "NikkelM-HadesBiomesFxModded", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = { NextMap = "Return03", } },
		},
		HeroOverwrites = {
			AttachedAnimationName = "nil",
			LineHistoryName = "NPC_Zagreus_Past_01",
			NarrativeFadeInColor = game.Color.ZagreusVoice,
			SubtitleColor = game.Color.ZagreusVoice,
		},
		RoomExitHeroOverwrites = {
			AttachedAnimationName = "LaurelCindersSpawner",
			LineHistoryName = "PlayerUnit",
			NarrativeFadeInColor = game.Color.Teal,
			SubtitleColor = game.Color.White,
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		BlockDoorHealFromPrevious = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return03 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "NikkelM-HadesBiomesFxModded", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = { NextMap = "Return04", } },
		},
		HeroOverwrites = {
			AttachedAnimationName = "nil",
			LineHistoryName = "NPC_Zagreus_Past_01",
			NarrativeFadeInColor = game.Color.ZagreusVoice,
			SubtitleColor = game.Color.ZagreusVoice,
		},
		RoomExitHeroOverwrites = {
			AttachedAnimationName = "LaurelCindersSpawner",
			LineHistoryName = "PlayerUnit",
			NarrativeFadeInColor = game.Color.Teal,
			SubtitleColor = game.Color.White,
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		BlockDoorHealFromPrevious = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return04 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "NikkelM-HadesBiomesFxModded", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = { NextMap = "Return05", } },
		},
		HeroOverwrites = {
			AttachedAnimationName = "nil",
			LineHistoryName = "NPC_Zagreus_Past_01",
			NarrativeFadeInColor = game.Color.ZagreusVoice,
			SubtitleColor = game.Color.ZagreusVoice,
		},
		RoomExitHeroOverwrites = {
			AttachedAnimationName = "LaurelCindersSpawner",
			LineHistoryName = "PlayerUnit",
			NarrativeFadeInColor = game.Color.Teal,
			SubtitleColor = game.Color.White,
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		BlockDoorHealFromPrevious = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return05 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "NikkelM-HadesBiomesFxModded", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = { NextMap = "Return06", } },
		},
		HeroOverwrites = {
			AttachedAnimationName = "nil",
			LineHistoryName = "NPC_Zagreus_Past_01",
			NarrativeFadeInColor = game.Color.ZagreusVoice,
			SubtitleColor = game.Color.ZagreusVoice,
		},
		RoomExitHeroOverwrites = {
			AttachedAnimationName = "LaurelCindersSpawner",
			LineHistoryName = "PlayerUnit",
			NarrativeFadeInColor = game.Color.Teal,
			SubtitleColor = game.Color.White,
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		BlockDoorHealFromPrevious = true,
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
	},
	Return06 = {
		RoomSetName = "Surface",
		LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "NikkelM-HadesBiomesFxModded", "NikkelM-HadesBiomesGUIModded", "ModsNikkelMHadesBiomesGUIOriginal", },
		UnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRideAudio" },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRide", Args = {} },
			[3] = { FunctionName = _PLUGIN.guid .. "." .. "HandleReturnBoatRideOutro" },
			[4] = { FunctionName = _PLUGIN.guid .. "." .. "SurfaceKillHero", Args = {} },
		},
		HeroOverwrites = {
			AttachedAnimationName = "nil",
			LineHistoryName = "NPC_Zagreus_Past_01",
			NarrativeFadeInColor = game.Color.ZagreusVoice,
			SubtitleColor = game.Color.ZagreusVoice,
		},
		RoomExitHeroOverwrites = {
			AttachedAnimationName = "LaurelCindersSpawner",
			LineHistoryName = "PlayerUnit",
			NarrativeFadeInColor = game.Color.Teal,
			SubtitleColor = game.Color.White,
		},
		BlockCombat = true,
		UnloadWeapons = true,
		BlockFamiliars = true,
		BlockRunProgressUI = true,
		BlockDoorHealFromPrevious = true,
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
