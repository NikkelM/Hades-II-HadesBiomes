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
mod.ExpectedNumSjsonHooks = 30

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

-- TODO: Challenge, Charon? What Roomsets are they?
-- For Challenge, can use Melinoe_0376 as enter voiceline
mod.ValidModdedRunBiomes = {
	["Tartarus"] = true,
	["Asphodel"] = true,
	["Elysium"] = true,
	["Styx"] = true,
	["Surface"] = true,
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

-- Can either be directly gathered in rooms, or grown in the Crossroads
mod.NonBossResourceNames = game.ConcatTableValuesIPairs(game.DeepCopyTable(mod.GatherableResourceNames), {
	"ModsNikkelMHadesBiomes_CropTartarus",
	"ModsNikkelMHadesBiomes_CropAsphodel",
	"ModsNikkelMHadesBiomes_CropElysium",
	"ModsNikkelMHadesBiomes_CropStyx",
})

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
