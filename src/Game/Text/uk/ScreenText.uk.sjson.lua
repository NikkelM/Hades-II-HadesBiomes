local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\uk\\ScreenText.uk.sjson")

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
	"Description",
	"OverwriteLocalization",
}

local newData = {
	-- #region Run history
	{
		Id = "RunHistoryScreen_RouteTartarus",
		InheritFrom = "WeaponPointsRare",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		InheritFrom = "WeaponPointsRare",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		InheritFrom = "WeaponPointsRare",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		InheritFrom = "WeaponPointsRare",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		InheritFrom = "WeaponPointsRare",
	},
	-- #endregion

	-- #region Codex/Inventory/Cauldron/Dialogue
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_MarketScreen_Resources",
	-- 	DisplayName = "Barter Exchange",
	-- },	
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_BoonInfo_Orpheus",
	-- 	DisplayName = "Songs of {$TempTextData.BoonName}",
	-- },
	-- #region Relationship/Unlock hints
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_Custom_Relationship_Requirement",
	-- 	DisplayName =
	-- 	"\\n {#CodexStandardFormat}{!Icons.CodexEntryIncompleteIcon}  {#CodexChapterClearFormat} Learn more by deepening your connection with {$TempTextData.Name} {#CodexStandardFormat}",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_EurydiceUnlockHint01",
	-- 	DisplayName =
	-- 	"{$TempTextData.CharacterName} would love to cook with {!TempTextData.ResourceIcon} once she has reconnected with her long lost love."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_BondForgedEurydice",
	-- 	DisplayName = "You and {$TempTextData.CharacterName} share an inspiring bond.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_OrpheusUnlockHint01",
	-- 	DisplayName =
	-- 	"{$TempTextData.CharacterName} does not feel he deserves {!TempTextData.ResourceIcon} until he has come to terms with his past mistakes."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_BondForgedOrpheus",
	-- 	DisplayName = "You and {$TempTextData.CharacterName} share a sonorous bond.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_PatroclusUnlockHint01",
	-- 	DisplayName =
	-- 	"{$TempTextData.CharacterName} has little use for {!TempTextData.ResourceIcon} while he still mourns his loss."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_BondForgedPatroclus",
	-- 	DisplayName = "You and {$TempTextData.CharacterName} share an enlightened bond.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_ThanatosUnlockHint01",
	-- 	DisplayName =
	-- 	"{$TempTextData.CharacterName} won't accept any {!TempTextData.ResourceIcon} until he understands what you are to each other."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_BondForgedThanatos",
	-- 	DisplayName = "You and {$TempTextData.CharacterName} share an undying bond.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_SisyphusUnlockHint01",
	-- 	DisplayName =
	-- 	"{$TempTextData.CharacterName} might be interested in {!TempTextData.ResourceIcon} once a great weight has been lifted off his shoulders."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_BondForgedSisyphus",
	-- 	DisplayName = "You and {$TempTextData.CharacterName} share a rock-solid bond.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_MegaeraUnlockHint01",
	-- 	DisplayName =
	-- 	"{$TempTextData.CharacterName} will not make time for {!TempTextData.ResourceIcon} while she feels that she alone bears her duty, with no one by her side."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Codex_BondForgedMegaera",
	-- 	DisplayName = "You and {$TempTextData.CharacterName} share an intense bond.",
	-- },
	-- #endregion
	-- #region Relationship Dialogue Choices
	-- {
	-- 	Id = "Meg_GoToHer",
	-- 	DisplayName = "{CF} Go to Her",
	-- },
	-- {
	-- 	Id = "Meg_BackOff",
	-- 	DisplayName = "{CN} Ease Off",
	-- },
	-- {
	-- 	Id = "Than_GoToHim",
	-- 	DisplayName = "{CF} Comfort Him",
	-- },
	-- {
	-- 	Id = "Than_BackOff",
	-- 	DisplayName = "{CN} Ease Off",
	-- },
	-- {
	-- 	Id = "Dusa_Accept",
	-- 	DisplayName = "{CF} Politely Accept",
	-- },
	-- {
	-- 	Id = "Dusa_Decline",
	-- 	DisplayName = "{CN} Kindly Decline",
	-- },
	-- {
	-- 	Id = "MegThan_GoToThem",
	-- 	DisplayName = "{CF} Go to Them",
	-- },
	-- {
	-- 	Id = "MegThan_BackOff",
	-- 	DisplayName = "{CN} Ease Off",
	-- },
	-- #endregion
	-- #endregion

	-- #region Install screens
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallSuccess",
	-- 	DisplayName = "Installation successful!",
	-- 	Description =
	-- 	"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nOnce you have met Chaos, you may interact with the Chaos Gate in the training grounds to experience Zagreus' original journey to {#DialogLegendaryFormat}escape the Underworld {#Prev}through Melinoë's eyes!\n\nEnjoying the mod? Say thanks and support the development on {#DialogLegendaryFormat}ko-fi.com/nikkelm{#Prev}.\n\nIf you experience any issues, please start a discussion on {#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallFailure",
	-- 	DisplayName = "Installation failed!",
	-- 	Description =
	-- 	"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken.\nPlease see the console window that opens with the game, or the log, for how to resolve the problem.\nA reinstallation of the mod may help, to do so set\n{#DialogLegendaryFormat}firstTimeSetup {#Prev}and {#DialogLegendaryFormat}uninstall {#Prev}to {#DialogLegendaryFormat}true {#Prev}in the mod config in your mod manager.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallFailure_HadesNotFound",
	-- 	DisplayName = "Installation failed!",
	-- 	Description =
	-- 	"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken, because the mod {#DialogLegendaryFormat}could not find your Hades installation{#Prev}.\nUpdate the {#DialogLegendaryFormat}hadesGameFolder {#Prev}config setting in your mod manager.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallFailure_HadesModsInstalled",
	-- 	DisplayName = "Installation failed!",
	-- 	Description =
	-- 	"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken, because the mod detected that {#DialogLegendaryFormat}you have Hades mods installed{#Prev}.\nIn order to use this mod, you must uninstall all Hades mods. Delete or rename the {#DialogLegendaryFormat}Mods {#Prev}folder in your Hades install location, and then run {#DialogLegendaryFormat}modimporter.exe{#Prev}. If that does not work, verify your game files for both Hades and Hades II.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallFailure_IncompatibleModsInstalled",
	-- 	DisplayName = "Incompatible Mods Detected!",
	-- 	Description =
	-- 	"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nInstallation was successful, but the mod detected that you have {#DialogLegendaryFormat}incompatible mods installed{#Prev}, which you must uninstall. Please go to\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/wiki/Incompatible-Mods{#Prev}\nand uninstall all incompatible mods. If you have none of the listed mods installed, you can disregard this message.\nKeeping incompatible mods installed can cause a variety of gameplay issues and is not recommended.\n\nIf issues persist even after resolving incompatibilities, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallFailure_MissingFiles",
	-- 	DisplayName = "Installation failed!",
	-- 	Description =
	-- 	"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken, because the mod {#DialogLegendaryFormat}detected missing files{#Prev}.\nA reinstallation of the mod may help, to do so set\n{#DialogLegendaryFormat}firstTimeSetup {#Prev}and {#DialogLegendaryFormat}uninstall {#Prev}to {#DialogLegendaryFormat}true {#Prev}in the mod config in your mod manager. You may also try verifying your game files for both Hades and Hades II.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallFailure_HadesNotUpdated",
	-- 	DisplayName = "Installation failed!",
	-- 	Description =
	-- 	"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken, because your {#DialogLegendaryFormat}HADES {#Prev} installation is not up-to-date and required data is missing. Please update your Hades installation (not Hades II!) through your respective launcher. You may also try verifying your game files for Hades.\nAnother likely reason is that your copy of Hades is pirated, in which case the mod will not work with your current version.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_UninstallFailure",
	-- 	DisplayName = "Uninstallation failed!",
	-- 	Description =
	-- 	"Uninstalling {#DialogLegendaryFormat}Zagreus\' Journey {#Prev}has {#DialogLegendaryFormat}FAILED {#Prev}!\n\nPlease check the console logs for the potential reason.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	-- },
	-- -- If we failed to execute all sjson hooks
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_SjsonHookFailure",
	-- 	DisplayName = "Restart Needed!",
	-- 	Description =
	-- 	"The game was {#DialogLegendaryFormat}unable to load {#Prev}some files required by {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nThis means that the game may crash, enemies not deal damage, or assets not load.\n\nAs a workaround, {#DialogLegendaryFormat}restarting the game should fix this{#Prev}! If not, try reinstalling the mod by setting {#DialogLegendaryFormat}firstTimeSetup {#Prev}and {#DialogLegendaryFormat}uninstall {#Prev} to {#DialogLegendaryFormat}true {#Prev}in the mod config.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	-- },
	-- #endregion

	-- #region WeaponUpgrade (Silver Pool/Aspect selection) stats screen
	{
		Id = "WeaponUpgradeScreen_ClearTimeRecord_ModsNikkelMHadesBiomesModdedRoute",
		DisplayName = "{!Icons.ModsNikkelMHadesBiomesRunHistoryDoor} Швидка перемога:",
	},
	{
		Id = "WeaponUpgradeScreen_ShrinePointRecord_ModsNikkelMHadesBiomesModdedRoute",
		DisplayName =
		"{!Icons.ModsNikkelMHadesBiomesRunHistoryDoor} Найвищий {!Icons.ShrinePoint}{#BoldFormatGraft}страх{#Prev}:",
	},
	-- #endregion

	-- #region Shrine screen Skelly statues
	-- {
	-- 	Id = "ShrineScreen_SkellyStatueModsNikkelMHadesBiomesModdedRun_Incomplete",
	-- 	DisplayName =
	-- 	"Conquer the {#BoldFormatGraft}{$Keywords.ModsNikkelMHadesBiomesModdedRoute} {#Prev}— {#ShrineHighlightFormat}{$ActiveScreens.Shrine.NextModsNikkelMHadesBiomesModdedRouteSkellyShrinePointGoal}{!Icons.ShrinePoint}",
	-- },
	-- {
	-- 	Id = "ShrineScreen_SkellyStatueModsNikkelMHadesBiomesModdedRun_Insufficient",
	-- 	DisplayName =
	-- 	"Conquer the {#BoldFormatGraft}{$Keywords.ModsNikkelMHadesBiomesModdedRoute} {#Prev}— {#ShrineHighlightInsufficientFormat}{$ActiveScreens.Shrine.NextModsNikkelMHadesBiomesModdedRouteSkellyShrinePointGoal}{!Icons.ShrinePoint}",
	-- },
	-- {
	-- 	Id = "ShrineScreen_SkellyStatueModsNikkelMHadesBiomesModdedRun_Complete",
	-- 	InheritFrom = "ShrineScreen_SkellyStatueModsNikkelMHadesBiomesModdedRun_Incomplete",
	-- },
	-- #endregion
}

sjson.hook(screenTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
