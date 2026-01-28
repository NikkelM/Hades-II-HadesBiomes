local mods = rom.mods
local hadesOSTModReference = mods["NikkelM-Hades_OST_for_the_Music_Maker"]

mod.NilValue = {}
mod.TableValue = {}

mod.DefaultHiddenConfig = {
	HasShownSuccessfulInstallScreen = false,
	IsValidInstallation = false,
	InstallationFailReason = "",
	MustShowUninstallFailureScreen = false,
	-- For debugging purposes
	IgnoreShowFeedbackMessage = false,
	EnableVanillaDebugKeybinds = false,
}

-- This is the number of sjson.hook calls we normally make
-- If the count in the cache/sjsonLoads.sjson file is different when OnAnyLoad is called, we know something went wrong and need to ask the user to restart the game
mod.ExpectedNumSjsonHooks = 32

-- All enemies have more health and armour in modded runs, scales with each biome
-- Should not apply to bosses, which should opt out using ModsNikkelMHadesBiomesIgnoreModdedHealthModifiers and define their own modified health
mod.ModdedUnitMaxHealthMultiplierBonus = {
	Default = 0.4,
	Tartarus = 0.35,
	Asphodel = 0.4,
	Elysium = 0.45,
	Styx = 0.48
}
mod.ModdedUnitHealthBufferMultiplierBonus = {
	Default = 0.15,
	Tartarus = 0.1,
	Asphodel = 0.15,
	Elysium = 0.2,
	Styx = 0.22
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
	-- "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty3", -- More heat?
}

mod.DifficultRandomizedChaosTrialBountyNames = {
	"ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty2",
	-- "ModsNikkelMHadesBiomes_PackageBountyRandom_Difficulty3", -- More heat?
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

mod.SharedKeepsakePortKeepsakeTraitNames = {
	mod.SharedKeepsakePortSisyphusKeepsakeTrait,
	mod.SharedKeepsakePortEurydiceKeepsakeTrait,
	mod.SharedKeepsakePortPatroclusKeepsakeTrait,
	mod.SharedKeepsakePortThanatosKeepsakeTrait,
}

-- Not actually a constant, will be populated in mod.AddNarrativeDataEntries()
mod.LootVoiceBankMappings = mod.LootVoiceBankMappings or {}
