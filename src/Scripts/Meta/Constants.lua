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

-- All enemies have more health and armour in modded runs
mod.ModdedUnitMaxHealthMultiplierBonus = 0.45
mod.ModdedUnitHealthBufferMultiplierBonus = 0.2

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
