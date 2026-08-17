local mods = rom.mods
local hadesOSTModReference = mods["NikkelM-Hades_OST_for_the_Music_Maker"]

mod.NilValue = {}
mod.TableValue = {}

mod.DefaultHiddenConfig = {
	HasShownSuccessfulInstallScreen = false,
	IsValidInstallation = false,
	MustShowIncompatibleModsInstallScreen = false,
	InstallationFailReason = "",
	MustShowUninstallFailureScreen = false,
	-- Tracks which mod version was last installed to detect mod updates
	InstalledModVersion = "",
	-- For debugging purposes
	EnableVanillaDebugKeybinds = false,
	DeveloperMode = false,
}

-- This is the number of sjson.hook calls we normally make
-- If the count in the cache/sjsonLoads.sjson file is different when OnAnyLoad is called, we know something went wrong and need to ask the user to restart the game
mod.ExpectedNumSjsonHooks = 38

-- All enemies have more health and armour in modded runs, scales with each biome
-- Should not apply to bosses, which should opt out using ModsNikkelMHadesBiomesIgnoreModdedHealthModifiers and define their own modified health
mod.ModdedUnitMaxHealthMultiplierBonus = {
	Default = 0.38,
	Tartarus = 0.32,
	Asphodel = 0.38,
	Elysium = 0.40,
	Styx = 0.45
}
mod.ModdedUnitHealthBufferMultiplierBonus = {
	Default = 0.13,
	Tartarus = 0.09,
	Asphodel = 0.13,
	Elysium = 0.18,
	Styx = 0.2
}

mod.ValidModdedRunBiomes = {
	["Tartarus"] = true,
	["Asphodel"] = true,
	["Elysium"] = true,
	["Styx"] = true,
	["Surface"] = true,
	["Challenge"] = true,
}

mod.ModdedRoomNames = {
	-- Tartarus
	"RoomOpening",
	"RoomSimple01",
	"A_PreBoss01",
	"A_Boss01",
	"A_Boss02",
	"A_Boss03",
	"A_PostBoss01",
	"A_MiniBoss01",
	"A_MiniBoss02",
	"A_MiniBoss03",
	"A_MiniBoss04",
	"A_Shop01",
	"A_Story01",
	"A_Reprieve01",
	"A_Combat01",
	"A_Combat02",
	"A_Combat03",
	"A_Combat04",
	"A_Combat05",
	"A_Combat06",
	"A_Combat07",
	"A_Combat08A",
	"A_Combat08B",
	"A_Combat09",
	"A_Combat10",
	"A_Combat11",
	"A_Combat12",
	"A_Combat13",
	"A_Combat14",
	"A_Combat15",
	"A_Combat16",
	"A_Combat17",
	"A_Combat18",
	"A_Combat19",
	"A_Combat20",
	"A_Combat21",
	"A_Combat24",
	-- Asphodel - B_ is also used for Anomaly in Hades II
	"X_Intro",
	"X_Boss01",
	"X_Boss02",
	"X_PostBoss01",
	"X_Wrapping01",
	"X_MiniBoss01",
	"X_MiniBoss02",
	"X_PreBoss01",
	"X_Shop01",
	"X_Reprieve01",
	"X_Combat01",
	"X_Combat02",
	"X_Combat03",
	"X_Combat04",
	"X_Combat05",
	"X_Combat06",
	"X_Combat07",
	"X_Combat08",
	"X_Combat09",
	"X_Combat10",
	"X_Combat21",
	"X_Combat22",
	"X_Story01",
	-- Elysium - C_ is also used for Zagreus/Charon fight in Hades II
	"Y_Intro",
	"Y_PreBoss01",
	"Y_Boss01",
	"Y_PostBoss01",
	"Y_MiniBoss01",
	"Y_MiniBoss02",
	"Y_MiniBoss03",
	"Y_Shop01",
	"Y_Story01",
	"Y_Reprieve01",
	"Y_Combat01",
	"Y_Combat02",
	"Y_Combat03",
	"Y_Combat04",
	"Y_Combat05",
	"Y_Combat06",
	"Y_Combat07",
	"Y_Combat08",
	"Y_Combat09",
	"Y_Combat10",
	"Y_Combat11",
	"Y_Combat12",
	"Y_Combat13",
	"Y_Combat14",
	"Y_Combat15",
	-- Styx
	"D_Intro",
	"D_Hub",
	"D_Boss01",
	"D_MiniBoss01",
	"D_MiniBoss02",
	"D_MiniBoss03",
	"D_MiniBoss04",
	"D_Reprieve01",
	"D_Combat01",
	"D_Combat02",
	"D_Combat03",
	"D_Combat04",
	"D_Combat05",
	"D_Combat06",
	"D_Mini01",
	"D_Mini02",
	"D_Mini03",
	"D_Mini04",
	"D_Mini05",
	"D_Mini06",
	"D_Mini07",
	"D_Mini08",
	"D_Mini09",
	"D_Mini10",
	"D_Mini11",
	"D_Mini12",
	"D_Mini13",
	"D_Mini14",
	-- Surface
	"E_Intro",
	"E_Story01",
	-- Surface - Return/Ending
	"Return01",
	"Return02",
	"Return03",
	"Return04",
	"Return05",
	"Return06",
	-- Erebus/Challenge
	"RoomChallenge01",
	"RoomChallenge02",
	"RoomChallenge03",
	"RoomChallenge04",
	-- Charon
	"CharonFight01",
}

mod.ModdedRoomNamesSet = {}
for _, name in ipairs(mod.ModdedRoomNames) do
	mod.ModdedRoomNamesSet[name] = true
end

mod.ModdedRoomNamesWithOldElysium = {
	-- Tartarus
	"RoomOpening",
	"RoomSimple01",
	"A_PreBoss01",
	"A_Boss01",
	"A_Boss02",
	"A_Boss03",
	"A_PostBoss01",
	"A_MiniBoss01",
	"A_MiniBoss02",
	"A_MiniBoss03",
	"A_MiniBoss04",
	"A_Shop01",
	"A_Story01",
	"A_Reprieve01",
	"A_Combat01",
	"A_Combat02",
	"A_Combat03",
	"A_Combat04",
	"A_Combat05",
	"A_Combat06",
	"A_Combat07",
	"A_Combat08A",
	"A_Combat08B",
	"A_Combat09",
	"A_Combat10",
	"A_Combat11",
	"A_Combat12",
	"A_Combat13",
	"A_Combat14",
	"A_Combat15",
	"A_Combat16",
	"A_Combat17",
	"A_Combat18",
	"A_Combat19",
	"A_Combat20",
	"A_Combat21",
	"A_Combat24",
	-- Asphodel - B_ is also used for Anomaly in Hades II
	"X_Intro",
	"X_Boss01",
	"X_Boss02",
	"X_PostBoss01",
	"X_Wrapping01",
	"X_MiniBoss01",
	"X_MiniBoss02",
	"X_PreBoss01",
	"X_Shop01",
	"X_Reprieve01",
	"X_Combat01",
	"X_Combat02",
	"X_Combat03",
	"X_Combat04",
	"X_Combat05",
	"X_Combat06",
	"X_Combat07",
	"X_Combat08",
	"X_Combat09",
	"X_Combat10",
	"X_Combat21",
	"X_Combat22",
	"X_Story01",
	-- Elysium - C_ is also used for Zagreus/Charon fight in Hades II
	"Y_Intro",
	"Y_PreBoss01",
	"Y_Boss01",
	"Y_PostBoss01",
	"Y_MiniBoss01",
	"Y_MiniBoss02",
	"Y_MiniBoss03",
	"Y_Shop01",
	"Y_Story01",
	"Y_Reprieve01",
	"Y_Combat01",
	"Y_Combat02",
	"Y_Combat03",
	"Y_Combat04",
	"Y_Combat05",
	"Y_Combat06",
	"Y_Combat07",
	"Y_Combat08",
	"Y_Combat09",
	"Y_Combat10",
	"Y_Combat11",
	"Y_Combat12",
	"Y_Combat13",
	"Y_Combat14",
	"Y_Combat15",
	-- Old Elysium
	"C_Intro",
	-- "C_Boss01", -- Also used in Hades II! Don't replace it when patching
	"C_PostBoss01",
	"C_PreBoss01",
	"C_Shop01",
	"C_MiniBoss01",
	"C_MiniBoss02",
	"C_Reprieve01",
	"C_Story01",
	"C_Combat01",
	"C_Combat02",
	"C_Combat03",
	"C_Combat04",
	"C_Combat05",
	"C_Combat06",
	"C_Combat07",
	"C_Combat08",
	"C_Combat09",
	"C_Combat10",
	"C_Combat11",
	"C_Combat12",
	"C_Combat13",
	"C_Combat14",
	"C_Combat15",
	-- Styx
	"D_Intro",
	"D_Hub",
	"D_Boss01",
	"D_MiniBoss01",
	"D_MiniBoss02",
	"D_MiniBoss03",
	"D_MiniBoss04",
	"D_Reprieve01",
	"D_Combat01",
	"D_Combat02",
	"D_Combat03",
	"D_Combat04",
	"D_Combat05",
	"D_Combat06",
	"D_Mini01",
	"D_Mini02",
	"D_Mini03",
	"D_Mini04",
	"D_Mini05",
	"D_Mini06",
	"D_Mini07",
	"D_Mini08",
	"D_Mini09",
	"D_Mini10",
	"D_Mini11",
	"D_Mini12",
	"D_Mini13",
	"D_Mini14",
	-- Surface
	"E_Intro",
	"E_Story01",
	-- Surface - Return/Ending
	"Return01",
	"Return02",
	"Return03",
	"Return04",
	"Return05",
	"Return06",
	-- Erebus/Challenge
	"RoomChallenge01",
	"RoomChallenge02",
	"RoomChallenge03",
	"RoomChallenge04",
	-- Charon
	"CharonFight01",
}

mod.ModdedShrineBountyNames = {
	-- Heat 6
	"ModsNikkelMHadesBiomes_BountyShrineSuit_TartarusBoss",
	"ModsNikkelMHadesBiomes_BountyShrineLob_AsphodelBoss",
	"ModsNikkelMHadesBiomes_BountyShrineAxe_TartarusBoss",
	"ModsNikkelMHadesBiomes_BountyShrineTorches_ElysiumBoss",
	"ModsNikkelMHadesBiomes_BountyShrineDaggers_AsphodelBoss",
	"ModsNikkelMHadesBiomes_BountyShrineStaff_TartarusBoss",

	-- Heat 14
	"ModsNikkelMHadesBiomes_BountyShrineSuit_StyxBoss",
	"ModsNikkelMHadesBiomes_BountyShrineLob_TartarusBoss",
	"ModsNikkelMHadesBiomes_BountyShrineAxe_ElysiumBoss",
	"ModsNikkelMHadesBiomes_BountyShrineTorches_StyxBoss",
	"ModsNikkelMHadesBiomes_BountyShrineDaggers_TartarusBoss",
	"ModsNikkelMHadesBiomes_BountyShrineStaff_AsphodelBoss",

	-- Heat 18
	"ModsNikkelMHadesBiomes_BountyShrineSuit_ElysiumBoss",
	"ModsNikkelMHadesBiomes_BountyShrineLob_ElysiumBoss",
	"ModsNikkelMHadesBiomes_BountyShrineAxe_AsphodelBoss",
	"ModsNikkelMHadesBiomes_BountyShrineTorches_TartarusBoss",
	"ModsNikkelMHadesBiomes_BountyShrineDaggers_StyxBoss",
	"ModsNikkelMHadesBiomes_BountyShrineStaff_ElysiumBoss",

	-- Heat 22
	"ModsNikkelMHadesBiomes_BountyShrineSuit_AsphodelBoss",
	"ModsNikkelMHadesBiomes_BountyShrineLob_StyxBoss",
	"ModsNikkelMHadesBiomes_BountyShrineAxe_StyxBoss",
	"ModsNikkelMHadesBiomes_BountyShrineTorches_AsphodelBoss",
	"ModsNikkelMHadesBiomes_BountyShrineDaggers_ElysiumBoss",
	"ModsNikkelMHadesBiomes_BountyShrineStaff_StyxBoss",
}

mod.RandomizedChaosTrialBountyNames = {
	"ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty1",
	"ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty2",
	"ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty3",
}

mod.DifficultRandomizedChaosTrialBountyNames = {
	"ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty2",
	"ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty3",
}

mod.CodexChapterName = "ModsNikkelMHadesBiomesCodexEntry"

-- Can be directly gathered in rooms
mod.GatherableResourceNames = {
	"ModsNikkelMHadesBiomes_PlantTartarus",
	"ModsNikkelMHadesBiomes_SeedTartarus",
	"ModsNikkelMHadesBiomes_OreTartarus",

	"ModsNikkelMHadesBiomes_PlantAsphodel",
	"ModsNikkelMHadesBiomes_SeedAsphodel",
	"ModsNikkelMHadesBiomes_OreAsphodel",

	"ModsNikkelMHadesBiomes_PlantElysium",
	"ModsNikkelMHadesBiomes_SeedElysium",
	"ModsNikkelMHadesBiomes_OreElysium",

	"ModsNikkelMHadesBiomes_PlantStyx",
	"ModsNikkelMHadesBiomes_SeedStyx",
	"ModsNikkelMHadesBiomes_OreStyx",

	"Fish_Tartarus_Common_01",
	"Fish_Tartarus_Rare_01",
	"Fish_Tartarus_Legendary_01",
	"Fish_Asphodel_Common_01",
	"Fish_Asphodel_Rare_01",
	"Fish_Asphodel_Legendary_01",
	"Fish_Elysium_Common_01",
	"Fish_Elysium_Rare_01",
	"Fish_Elysium_Legendary_01",
	"Fish_Styx_Common_01",
	"Fish_Styx_Rare_01",
	"Fish_Styx_Legendary_01",
	"Fish_Surface_Common_01",
	"Fish_Surface_Rare_01",
	"Fish_Surface_Legendary_01",
}

mod.SeedResourceNames = {
	"ModsNikkelMHadesBiomes_SeedTartarus",
	"ModsNikkelMHadesBiomes_SeedAsphodel",
	"ModsNikkelMHadesBiomes_SeedElysium",
	"ModsNikkelMHadesBiomes_SeedStyx",
}

mod.GrowableResourceNames = {
	"ModsNikkelMHadesBiomes_CropTartarus",
	"ModsNikkelMHadesBiomes_CropAsphodel",
	"ModsNikkelMHadesBiomes_CropElysium",
	"ModsNikkelMHadesBiomes_CropStyx",
}

-- Can either be directly gathered in rooms, or grown in the Crossroads
mod.NonBossResourceNames = game.ConcatTableValuesIPairs(game.DeepCopyTable(mod.GatherableResourceNames),
	game.DeepCopyTable(mod.GrowableResourceNames))

-- Only obtainable from bosses
mod.BossResourceNames = {
	"ModsNikkelMHadesBiomes_BossResourceTartarus",
	"ModsNikkelMHadesBiomes_BossResourceAsphodel",
	"ModsNikkelMHadesBiomes_BossResourceElysium",
	"ModsNikkelMHadesBiomes_BossResourceStyx",
}

-- All new resources
mod.AllNewResourceNames = game.ConcatTableValuesIPairs(game.DeepCopyTable(mod.NonBossResourceNames),
	game.DeepCopyTable(mod.BossResourceNames))

-- Populated in the loops in CosmeticData.lua
mod.ModdedCosmeticIds = {}

-- Song names/Ids from Hades OST for the Music Maker
-- Note: Unseen Ones is not part of this, as it is also a vanilla song
mod.HadesOstSongNames = hadesOSTModReference.HadesOstSongNames

-- Keepsake names from SharedKeepsakePort
mod.SharedKeepsakePortSisyphusKeepsakeTrait = "zannc-SharedKeepsakePort-SisyphusVanillaKeepsake"
mod.SharedKeepsakePortSisyphusKeepsakeBondIcon = "Keepsake_zannc-SharedKeepsakePort-Sisyphus"
mod.SharedKeepsakePortEurydiceKeepsakeTrait = "zannc-SharedKeepsakePort-ShieldBossKeepsake"
mod.SharedKeepsakePortEurydiceKeepsakeBondIcon = "Keepsake_zannc-SharedKeepsakePort-Eurydice"
mod.SharedKeepsakePortPatroclusKeepsakeTrait = "zannc-SharedKeepsakePort-ShieldAfterHitKeepsake"
mod.SharedKeepsakePortPatroclusKeepsakeBondIcon = "Keepsake_zannc-SharedKeepsakePort-Patroclus"
mod.SharedKeepsakePortThanatosKeepsakeTrait = "zannc-SharedKeepsakePort-PerfectClearDamageBonusKeepsake"
mod.SharedKeepsakePortThanatosKeepsakeBondIcon = "Keepsake_zannc-SharedKeepsakePort-Thanatos"
mod.SharedKeepsakePortOrpheusKeepsakeTrait = "zannc-SharedKeepsakePort-DistanceDamageKeepsake"
mod.SharedKeepsakePortOrpheusKeepsakeBondIcon = "Keepsake_zannc-SharedKeepsakePort-Orpheus"
mod.SharedKeepsakePortMegaeraKeepsakeTrait = "zannc-SharedKeepsakePort-LowHealthDamageKeepsake"
mod.SharedKeepsakePortMegaeraKeepsakeBondIcon = "Keepsake_zannc-SharedKeepsakePort-Megaera"

mod.SharedKeepsakePortKeepsakeTraitNames = {
	mod.SharedKeepsakePortSisyphusKeepsakeTrait,
	mod.SharedKeepsakePortEurydiceKeepsakeTrait,
	mod.SharedKeepsakePortPatroclusKeepsakeTrait,
	mod.SharedKeepsakePortThanatosKeepsakeTrait,
	mod.SharedKeepsakePortOrpheusKeepsakeTrait,
	mod.SharedKeepsakePortMegaeraKeepsakeTrait,
}

-- Not actually a constant, will be populated in mod.AddNarrativeDataEntries()
mod.LootVoiceBankMappings = mod.LootVoiceBankMappings or {}

-- Some rooms might deviate from this, but this is the base scaling for most doors
mod.HadesDoorRoomRewardIconScales = {
	TartarusDoor03b = 0.85,
	AsphodelBoat01b = 0.85,
	ElysiumExitDoor = 0.9,
	TravelDoor03 = 0.85,
	StyxDoor01 = 0.85,
	ShrinePointDoor = 0.9,
	ShrinePointExitDoor = 0.9,
}

-- Reward preview scale adjustments per reward type
mod.HadesDoorRewardTypeModifications = {
	MetaCurrencyDrop = {
		doorIconOffsetY = -5,
		doorIconScale = -0.1
	},
	MetaCurrencyBigDrop = {
		doorIconOffsetX = 5,
		doorIconScale = -0.1
	},
	MetaCardPointsCommonBigDrop = {
		doorIconOffsetX = 5,
		doorIconScale = -0.05
	},
	RoomRewardHealDrop = {
		doorIconScale = -0.1
	},
	WeaponUpgrade = {
		doorIconScale = -0.1
	},
	TalentDrop = {
		doorIconScale = -0.2
	},
	TalentBigDrop = {
		doorIconScale = -0.22
	},
	-- Star Dust
	Mixer5CommonDrop = {
		doorIconScale = -0.1
	},
	-- The below are for Styx and Erebus/Challenge doors
	RoomMoneyBigDrop = {
		doorIconScale = -0.1
	},
	MaxHealthDropBig = {
		doorIconScale = -0.1
	},
	MaxManaDropBig = {
		doorIconScale = -0.1
	},
	StackUpgradeBig = {
		doorIconScale = -0.05
	},
}
mod.HadesExitDoorObstacleNames = {
	TartarusDoor03b = true,
	AsphodelBoat01b = true,
	ElysiumExitDoor = true,
	TravelDoor03 = true,
	StyxDoor01 = true,
	ShrinePointDoor = true,
	ShrinePointExitDoor = true,
}

mod.FormalNPCRelationships = {
	"NPC_Sisyphus_01",
	"NPC_Eurydice_01",
	"NPC_Patroclus_01",
	"NPC_Thanatos_Field_01",
	"NPC_Orpheus_01",
	-- "NPC_Dusa_01",
	-- "NPC_Achilles_01",
}

mod.InformalNPCRelationshipsF = {
	"ModsNikkelMHadesBiomes_NPC_Persephone_01",
	"NPC_FurySister_01",
}

mod.InformalNPCRelationshipsM = {
	"ModsNikkelMHadesBiomes_NPC_Bouldy_01",
	"NPC_Thanatos_01",
	"NPC_Orpheus_Story_01",
}

-- Controls if the Skelly and ZagreusHome voicebanks are loaded in the Crossroads, and the insertion order into Skelly's priority conversations (last in this list has highest priority)
mod.SkellyModdedCrossroadsConversations = {
	"ModsNikkelMHadesBiomes_SkellyHintMeeting_EasyMode01",
	"ModsNikkelMHadesBiomes_HadesStatueUnveil03",
	"ModsNikkelMHadesBiomes_HadesStatueUnveil02",
	"ModsNikkelMHadesBiomes_HadesStatueUnveil01",
	"ModsNikkelMHadesBiomes_HadesStatueIntro01",
}

mod.ModdedPlayerScaleMultiplier = 0.9

mod.IncreasedZoomFractionOffset = 0.13

mod.ExitToHadesFadeColour = config.accessibility.z_FadeToBlackEnteringHades and game.Color.Black or game.Color.White

-- Populated in ApplyModificationsAndInheritEnemyData()
mod.AllRequiredKillModdedEnemyNames = {}

-- Set of duplicate TextLineSet names that exist in both games, agnostic to the actual table they exist in
-- Gift lines are intentionally left commented out - they are not ported, so dialogues requiring them should reference the Hades II versions
public.DuplicateTextLineSetNames = {
	-- #region Aphrodite
	["AphroditeAboutAres01"] = true,
	["AphroditeAboutArtemis01"] = true,
	["AphroditeAboutAthena01"] = true,
	["AphroditeAboutDemeter01"] = true,
	["AphroditeAboutDionysus01"] = true,
	["AphroditeAboutKeepsake01"] = true,
	["AphroditeAboutLove01"] = true,
	["AphroditeAboutLove02"] = true,
	["AphroditeAboutLove03"] = true,
	["AphroditeAboutPoseidon01"] = true,
	["AphroditeAboutZeus01"] = true,
	["AphroditeFirstPickUp"] = true,
	-- ["AphroditeGift01"] = true,
	-- ["AphroditeGift02"] = true,
	-- ["AphroditeGift03"] = true,
	-- ["AphroditeGift04"] = true,
	-- ["AphroditeGift05"] = true,
	-- ["AphroditeGift06"] = true,
	-- ["AphroditeGift07"] = true,
	["AphroditeLegendaryPickUp01"] = true,
	["AphroditeLegendaryPickUp02"] = true,
	["AphroditeLootBought01"] = true,
	["AphroditeLootBought02"] = true,
	["AphroditeLootBought03"] = true,
	["AphroditeLootBought04"] = true,
	["AphroditeLowHealth01"] = true,
	["AphroditeLowHealth02"] = true,
	["AphroditeLowHealth03"] = true,
	["AphroditeLowHealth04"] = true,
	["AphroditeMakeUp01"] = true,
	["AphroditeMakeUp02"] = true,
	["AphroditeMakeUp03"] = true,
	["AphroditeMakeUp04"] = true,
	["AphroditeMakeUp05"] = true,
	["AphroditeMakeUp06"] = true,
	["AphroditeMakeUp07"] = true,
	["AphroditeMakeUp08"] = true,
	["AphroditeMakeUp09"] = true,
	["AphroditeMakeUp10"] = true,
	["AphroditeMakeUp11"] = true,
	["AphroditeMakeUp12"] = true,
	["AphroditePostEpilogue01"] = true,
	["AphroditePostEpilogue02"] = true,
	["AphroditeRejection01"] = true,
	["AphroditeRejection02"] = true,
	["AphroditeRejection03"] = true,
	["AphroditeRejection04"] = true,
	["AphroditeRejection05"] = true,
	["AphroditeRejection06"] = true,
	["AphroditeRejection07"] = true,
	["AphroditeRejection08"] = true,
	["AphroditeRejection09"] = true,
	["AphroditeRejection10"] = true,
	["AphroditeRejection11"] = true,
	["AphroditeRejection12"] = true,
	["AphroditeWithAres01"] = true,
	["AphroditeWithDemeter01"] = true,
	["AphroditeWithPoseidon01"] = true,
	["AphroditeWithZeus01"] = true,
	-- #endregion

	-- #region Ares
	["AresAboutAphrodite01"] = true,
	["AresAboutArtemis01"] = true,
	["AresAboutAthena01"] = true,
	["AresAboutDemeter01"] = true,
	["AresAboutHermes01"] = true,
	["AresAboutKeepsake01"] = true,
	["AresAboutNyx01"] = true,
	["AresAboutNyx02"] = true,
	["AresAboutPoseidon01"] = true,
	["AresAboutWar01"] = true,
	["AresAboutWar02"] = true,
	["AresAboutWar03"] = true,
	["AresAboutZeus01"] = true,
	["AresFirstPickUp"] = true,
	-- ["AresGift01"] = true,
	-- ["AresGift02"] = true,
	-- ["AresGift03"] = true,
	-- ["AresGift04"] = true,
	-- ["AresGift05"] = true,
	-- ["AresGift06"] = true,
	-- ["AresGift07"] = true,
	["AresLegendaryPickUp01"] = true,
	["AresLegendaryPickUp02"] = true,
	["AresLootBought01"] = true,
	["AresLootBought02"] = true,
	["AresLootBought03"] = true,
	["AresLootBought04"] = true,
	["AresLowHealth01"] = true,
	["AresLowHealth02"] = true,
	["AresLowHealth03"] = true,
	["AresLowHealth04"] = true,
	["AresMakeUp01"] = true,
	["AresMakeUp02"] = true,
	["AresMakeUp03"] = true,
	["AresMakeUp04"] = true,
	["AresMakeUp05"] = true,
	["AresMakeUp06"] = true,
	["AresMakeUp07"] = true,
	["AresMakeUp08"] = true,
	["AresMakeUp09"] = true,
	["AresMakeUp10"] = true,
	["AresMakeUp11"] = true,
	["AresMakeUp12"] = true,
	["AresPostEpilogue01"] = true,
	["AresRejection01"] = true,
	["AresRejection02"] = true,
	["AresRejection03"] = true,
	["AresRejection04"] = true,
	["AresRejection05"] = true,
	["AresRejection06"] = true,
	["AresRejection07"] = true,
	["AresRejection08"] = true,
	["AresRejection09"] = true,
	["AresRejection10"] = true,
	["AresRejection11"] = true,
	["AresRejection12"] = true,
	["AresWithAphrodite01"] = true,
	["AresWithAphrodite02"] = true,
	["AresWithDemeter01"] = true,
	["AresWithPoseidon01"] = true,
	-- #endregion

	-- #region Artemis
	["ArtemisAboutAthena01"] = true,
	["ArtemisAboutHermes01"] = true,
	["ArtemisAboutKeepsake01"] = true,
	["ArtemisAboutZagreus01"] = true,
	-- ["ArtemisGift01"] = true,
	-- ["ArtemisGift02"] = true,
	-- ["ArtemisGift03"] = true,
	-- ["ArtemisGift04"] = true,
	-- ["ArtemisGift05"] = true,
	-- ["ArtemisGift06"] = true,
	-- ["ArtemisGift07"] = true,
	["ArtemisLowHealth01"] = true,
	["ArtemisLowHealth02"] = true,
	["ArtemisLowHealth03"] = true,
	["ArtemisLowHealth04"] = true,
	["ArtemisPostEpilogue01"] = true,
	-- #endregion

	-- #region Athena
	["AthenaAboutAres01"] = true,
	["AthenaAboutDionysus01"] = true,
	["AthenaAboutKeepsake01"] = true,
	["AthenaAboutZeus01"] = true,
	-- ["AthenaGift01"] = true,
	-- ["AthenaGift02"] = true,
	-- ["AthenaGift03"] = true,
	-- ["AthenaGift04"] = true,
	-- ["AthenaGift06"] = true,
	-- ["AthenaGift07"] = true,
	["AthenaLowHealth01"] = true,
	["AthenaPostEpilogue01"] = true,
	["AthenaPostEpilogue02"] = true,
	-- #endregion

	-- #region Bouldy
	["BouldyChat01"] = true,
	["BouldyFirstMeeting"] = true,
	-- #endregion

	-- #region Cerberus
	["CerberusChat01"] = true,
	["CerberusChat02"] = true,
	["CerberusChat03"] = true,
	["CerberusChat04"] = true,
	["CerberusChat05"] = true,
	["CerberusChat06"] = true,
	["CerberusChat07"] = true,
	["CerberusChat08"] = true,
	["CerberusChat09"] = true,
	["CerberusChat10"] = true,
	["CerberusChat11"] = true,
	["CerberusChat12"] = true,
	["CerberusChat13"] = true,
	["CerberusChat14"] = true,
	["CerberusChat15"] = true,
	-- #endregion

	-- #region Chaos
	["ChaosAboutAphrodite01"] = true,
	["ChaosAboutAres01"] = true,
	["ChaosAboutArtemis01"] = true,
	["ChaosAboutDemeter01"] = true,
	["ChaosAboutFates01"] = true,
	["ChaosAboutFishing01"] = true,
	["ChaosAboutHades01"] = true,
	["ChaosAboutHermes01"] = true,
	["ChaosAboutKeepsake01"] = true,
	["ChaosAboutNyx01"] = true,
	["ChaosAboutNyx02"] = true,
	["ChaosAboutOlympians01"] = true,
	["ChaosAboutPoseidon01"] = true,
	["ChaosAboutZeus01"] = true,
	-- Removed as duplicate as we don't add the H1 version since we have custom dialogues to introduce the Nightmare Realm
	-- Any H1 dialogues depending on this will depend on the H2 ChaosFirstPickUp instead
	-- ["ChaosFirstPickUp"] = true,
	-- ["ChaosGift01"] = true,
	-- ["ChaosGift02"] = true,
	-- ["ChaosGift03"] = true,
	-- ["ChaosGift04"] = true,
	-- ["ChaosGift05"] = true,
	-- ["ChaosGift06"] = true,
	-- ["ChaosGift07"] = true,
	["ChaosLowHealth01"] = true,
	["ChaosLowHealth02"] = true,
	["ChaosLowHealth03"] = true,
	["ChaosLowHealth04"] = true,
	["ChaosPostEpilogue01"] = true,
	["ChaosWithNyx01"] = true,
	["ChaosWithNyx02"] = true,
	-- #endregion

	-- #region Charon
	["CharonAboutHermes01"] = true,
	["CharonAboutHermes02"] = true,
	["CharonAboutHermes03"] = true,
	["CharonChat01"] = true,
	["CharonChat02"] = true,
	["CharonChat03"] = true,
	["CharonChat04"] = true,
	["CharonChat05"] = true,
	["CharonChat06"] = true,
	["CharonChat07"] = true,
	["CharonChat08"] = true,
	["CharonChat09"] = true,
	["CharonChat10"] = true,
	["CharonChat11"] = true,
	["CharonChat12"] = true,
	["CharonChat13"] = true,
	["CharonChat14"] = true,
	["CharonChat15"] = true,
	["CharonChat16"] = true,
	["CharonChat17"] = true,
	["CharonChat18"] = true,
	["CharonChat19"] = true,
	["CharonChat20"] = true,
	["CharonFirstMeeting"] = true,
	-- ["CharonGift01"] = true,
	-- ["CharonGift02"] = true,
	-- ["CharonGift03"] = true,
	-- ["CharonGift04"] = true,
	-- ["CharonGift05"] = true,
	-- ["CharonGift06"] = true,
	-- ["CharonGift07"] = true,
	["CharonPostEpilogue01"] = true,
	-- #endregion

	-- #region Demeter
	["DemeterAboutAphrodite01"] = true,
	["DemeterAboutAres01"] = true,
	["DemeterAboutArtemis01"] = true,
	["DemeterAboutAthena01"] = true,
	["DemeterAboutChaos01"] = true,
	["DemeterAboutDionysus01"] = true,
	["DemeterAboutHades01"] = true,
	["DemeterAboutHades02"] = true,
	["DemeterAboutKeepsake01"] = true,
	["DemeterAboutPersephone01"] = true,
	["DemeterAboutPersephone02"] = true,
	["DemeterAboutPom01"] = true,
	["DemeterAboutPoseidon01"] = true,
	["DemeterAboutSisters01"] = true,
	["DemeterAboutSurface01"] = true,
	["DemeterAboutSurface02"] = true,
	["DemeterAboutZeus01"] = true,
	["DemeterFirstPickUp"] = true,
	-- ["DemeterGift01"] = true,
	-- ["DemeterGift02"] = true,
	-- ["DemeterGift03"] = true,
	-- ["DemeterGift04"] = true,
	-- ["DemeterGift05"] = true,
	-- ["DemeterGift06"] = true,
	-- ["DemeterGift07"] = true,
	["DemeterLegendaryPickUp01"] = true,
	["DemeterLegendaryPickUp02"] = true,
	["DemeterLootBought01"] = true,
	["DemeterLootBought02"] = true,
	["DemeterLootBought03"] = true,
	["DemeterLowHealth01"] = true,
	["DemeterLowHealth02"] = true,
	["DemeterLowHealth03"] = true,
	["DemeterLowHealth04"] = true,
	["DemeterMakeUp01"] = true,
	["DemeterMakeUp02"] = true,
	["DemeterMakeUp03"] = true,
	["DemeterMakeUp04"] = true,
	["DemeterMakeUp05"] = true,
	["DemeterMakeUp06"] = true,
	["DemeterMakeUp07"] = true,
	["DemeterMakeUp08"] = true,
	["DemeterMakeUp09"] = true,
	["DemeterMakeUp10"] = true,
	["DemeterMakeUp11"] = true,
	["DemeterPostEpilogue01"] = true,
	["DemeterPostEpilogue02"] = true,
	["DemeterPostEpilogue03"] = true,
	["DemeterRejection01"] = true,
	["DemeterRejection02"] = true,
	["DemeterRejection03"] = true,
	["DemeterRejection04"] = true,
	["DemeterRejection05"] = true,
	["DemeterRejection06"] = true,
	["DemeterRejection07"] = true,
	["DemeterRejection08"] = true,
	["DemeterRejection09"] = true,
	["DemeterRejection10"] = true,
	["DemeterRejection11"] = true,
	["DemeterWithAphrodite01"] = true,
	["DemeterWithAres01"] = true,
	["DemeterWithPoseidon01"] = true,
	["DemeterWithZeus01"] = true,
	-- #endregion

	-- #region Dionysus
	["DionysusAboutAmbrosia01"] = true,
	["DionysusAboutAmbrosia02"] = true,
	["DionysusAboutAmbrosia03"] = true,
	["DionysusAboutKeepsake01"] = true,
	-- ["DionysusGift01"] = true,
	-- ["DionysusGift02"] = true,
	-- ["DionysusGift03"] = true,
	-- ["DionysusGift04"] = true,
	-- ["DionysusGift05"] = true,
	-- ["DionysusGift06"] = true,
	-- ["DionysusGift07"] = true,
	["DionysusLowHealth01"] = true,
	["DionysusPostEpilogue01"] = true,
	-- #endregion

	-- #region Hades
	["HadesAboutCharon01"] = true,
	["HadesAboutPersephone01"] = true,
	["HadesAboutShrine01"] = true,
	["HadesChat01"] = true,
	["HadesChat02"] = true,
	["HadesChat03"] = true,
	["HadesChat04"] = true,
	["HadesChat05"] = true,
	["HadesChat06"] = true,
	["HadesChat07"] = true,
	["HadesChat08"] = true,
	["HadesChat09"] = true,
	["HadesChat10"] = true,
	["HadesChat11"] = true,
	["HadesChat12"] = true,
	["HadesChat13"] = true,
	["HadesChat14"] = true,
	["HadesChat15"] = true,
	["HadesChat16"] = true,
	["HadesChat18"] = true,
	["HadesChat19"] = true,
	["HadesChat20"] = true,
	["HadesFirstMeeting"] = true,
	["HadesFirstMeeting_B"] = true,
	-- #endregion

	-- #region Hermes
	["HermesAboutAphrodite01"] = true,
	["HermesAboutAres01"] = true,
	["HermesAboutArtemis01"] = true,
	["HermesAboutAthena01"] = true,
	["HermesAboutDemeter01"] = true,
	["HermesAboutDionysus01"] = true,
	["HermesAboutHades01"] = true,
	["HermesAboutPoseidon01"] = true,
	["HermesAboutZeus01"] = true,
	["HermesFirstPickUp"] = true,
	-- ["HermesGift01"] = true,
	-- ["HermesGift02"] = true,
	-- ["HermesGift03"] = true,
	-- ["HermesGift04"] = true,
	-- ["HermesGift05"] = true,
	-- ["HermesGift06"] = true,
	-- ["HermesGift07"] = true,
	-- ["HermesGift08"] = true,
	["HermesLegendaryPickUp01"] = true,
	["HermesLegendaryPickUp02"] = true,
	["HermesLegendaryPickUp03"] = true,
	["HermesLootBought01"] = true,
	["HermesLootBought02"] = true,
	["HermesLootBought03"] = true,
	["HermesLootBought04"] = true,
	["HermesLootBought05"] = true,
	["HermesLowHealth01"] = true,
	["HermesLowHealth02"] = true,
	["HermesLowHealth03"] = true,
	["HermesLowHealth04"] = true,
	["HermesPostEpilogue01"] = true,
	["HermesPostEpilogue02"] = true,
	["HermesPostEpilogue03"] = true,
	-- #endregion

	-- #region Hypnos
	-- TODO: When Hypnos is added his gifting will likely be reimplemented, so uncomment the Gift lines below so they get de-duplicated
	["HypnosFirstMeeting"] = true,
	-- ["HypnosGift01"] = true,
	-- ["HypnosGift02"] = true,
	-- #endregion

	-- #region Narrator
	-- ["InspectPreRun01"] = true,
	-- #endregion

	-- #region Nyx
	-- ["NyxGift01"] = true,
	-- ["NyxGift02"] = true,
	-- #endregion

	-- #region Nyx (Field)
	["NyxInChaos01"] = true,
	-- #endregion

	-- #region Poseidon
	["PoseidonAboutAphrodite01"] = true,
	["PoseidonAboutAres01"] = true,
	["PoseidonAboutArtemis01"] = true,
	["PoseidonAboutAthena01"] = true,
	["PoseidonAboutDemeter01"] = true,
	["PoseidonAboutDionysus01"] = true,
	["PoseidonAboutFishing01"] = true,
	["PoseidonAboutFishing02"] = true,
	["PoseidonAboutFishing03"] = true,
	["PoseidonAboutHermes01"] = true,
	["PoseidonAboutKeepsake01"] = true,
	["PoseidonAboutZeus01"] = true,
	["PoseidonFirstPickUp"] = true,
	-- ["PoseidonGift01"] = true,
	-- ["PoseidonGift02"] = true,
	-- ["PoseidonGift03"] = true,
	-- ["PoseidonGift04"] = true,
	-- ["PoseidonGift05"] = true,
	-- ["PoseidonGift06"] = true,
	-- ["PoseidonGift07"] = true,
	["PoseidonLegendaryPickUp01"] = true,
	["PoseidonLegendaryPickUp02"] = true,
	["PoseidonLootBought01"] = true,
	["PoseidonLootBought02"] = true,
	["PoseidonLootBought03"] = true,
	["PoseidonLootBought04"] = true,
	["PoseidonLootBought05"] = true,
	["PoseidonLowHealth01"] = true,
	["PoseidonLowHealth02"] = true,
	["PoseidonLowHealth03"] = true,
	["PoseidonLowHealth04"] = true,
	["PoseidonMakeUp01"] = true,
	["PoseidonMakeUp02"] = true,
	["PoseidonMakeUp03"] = true,
	["PoseidonMakeUp04"] = true,
	["PoseidonMakeUp05"] = true,
	["PoseidonMakeUp06"] = true,
	["PoseidonMakeUp07"] = true,
	["PoseidonMakeUp08"] = true,
	["PoseidonMakeUp09"] = true,
	["PoseidonMakeUp10"] = true,
	["PoseidonMakeUp11"] = true,
	["PoseidonPostEpilogue01"] = true,
	["PoseidonPostEpilogue02"] = true,
	["PoseidonRejection01"] = true,
	["PoseidonRejection02"] = true,
	["PoseidonRejection03"] = true,
	["PoseidonRejection04"] = true,
	["PoseidonRejection05"] = true,
	["PoseidonRejection06"] = true,
	["PoseidonRejection07"] = true,
	["PoseidonRejection08"] = true,
	["PoseidonRejection09"] = true,
	["PoseidonRejection10"] = true,
	["PoseidonRejection11"] = true,
	["PoseidonRejection12"] = true,
	["PoseidonWithAres01"] = true,
	["PoseidonWithDemeter01"] = true,
	["PoseidonWithZeus01"] = true,
	-- #endregion

	-- #region Skelly
	["SkellyChat01"] = true,
	["SkellyChat02"] = true,
	["SkellyChat03"] = true,
	["SkellyChat04"] = true,
	["SkellyChat05"] = true,
	["SkellyChat06"] = true,
	["SkellyChat07"] = true,
	["SkellyChat08"] = true,
	["SkellyChat09"] = true,
	["SkellyChat10"] = true,
	["SkellyChat11"] = true,
	["SkellyChat12"] = true,
	["SkellyChat13"] = true,
	["SkellyChat14"] = true,
	["SkellyChat15"] = true,
	["SkellyChat16"] = true,
	["SkellyChat17"] = true,
	["SkellyChat18"] = true,
	["SkellyChat19"] = true,
	["SkellyChat20"] = true,
	["SkellyChat21"] = true,
	["SkellyFirstMeeting"] = true,
	-- ["SkellyGift01"] = true,
	-- ["SkellyGift02"] = true,
	-- ["SkellyGift03"] = true,
	-- ["SkellyGift04"] = true,
	-- ["SkellyGift05"] = true,
	-- ["SkellyGift06"] = true,
	-- ["SkellyGift07"] = true,
	-- ["SkellyGift08"] = true,
	-- ["SkellyGift09"] = true,
	["SkellyPostEpilogue01"] = true,
	-- #endregion

	-- #region Zeus
	["ZeusAboutAphrodite01"] = true,
	["ZeusAboutAres01"] = true,
	["ZeusAboutArtemis01"] = true,
	["ZeusAboutAthena01"] = true,
	["ZeusAboutDemeter01"] = true,
	["ZeusAboutDionysus01"] = true,
	["ZeusAboutHades01"] = true,
	["ZeusAboutHermes01"] = true,
	["ZeusAboutKeepsake01"] = true,
	["ZeusAboutPoseidon01"] = true,
	["ZeusFirstPickUp"] = true,
	-- ["ZeusGift01"] = true,
	-- ["ZeusGift02"] = true,
	-- ["ZeusGift03"] = true,
	-- ["ZeusGift04"] = true,
	-- ["ZeusGift05"] = true,
	-- ["ZeusGift06"] = true,
	-- ["ZeusGift07"] = true,
	["ZeusLegendaryPickUp01"] = true,
	["ZeusLegendaryPickUp02"] = true,
	["ZeusLootBought01"] = true,
	["ZeusLootBought02"] = true,
	["ZeusLootBought03"] = true,
	["ZeusLootBought04"] = true,
	["ZeusLootBought05"] = true,
	["ZeusLowHealth01"] = true,
	["ZeusLowHealth02"] = true,
	["ZeusLowHealth03"] = true,
	["ZeusLowHealth04"] = true,
	["ZeusMakeUp01"] = true,
	["ZeusMakeUp02"] = true,
	["ZeusMakeUp03"] = true,
	["ZeusMakeUp04"] = true,
	["ZeusMakeUp05"] = true,
	["ZeusMakeUp06"] = true,
	["ZeusMakeUp07"] = true,
	["ZeusMakeUp08"] = true,
	["ZeusMakeUp09"] = true,
	["ZeusMakeUp10"] = true,
	["ZeusMakeUp11"] = true,
	["ZeusMakeUp12"] = true,
	["ZeusPostEpilogue01"] = true,
	["ZeusPostEpilogue02"] = true,
	["ZeusPostEpilogue03"] = true,
	["ZeusRejection01"] = true,
	["ZeusRejection02"] = true,
	["ZeusRejection03"] = true,
	["ZeusRejection04"] = true,
	["ZeusRejection05"] = true,
	["ZeusRejection06"] = true,
	["ZeusRejection07"] = true,
	["ZeusRejection08"] = true,
	["ZeusRejection09"] = true,
	["ZeusRejection10"] = true,
	["ZeusRejection11"] = true,
	["ZeusRejection12"] = true,
	["ZeusRejection13"] = true,
	["ZeusRejection14"] = true,
	["ZeusWithAphrodite01"] = true,
	["ZeusWithAres01"] = true,
	["ZeusWithDemeter01"] = true,
	-- #endregion
}
