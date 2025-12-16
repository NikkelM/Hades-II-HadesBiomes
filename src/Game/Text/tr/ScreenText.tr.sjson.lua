local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\tr\\ScreenText.tr.sjson")

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
	"OverwriteLocalization"
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

	-- #region Codex/Inventory
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_MarketScreen_Resources",
	-- 	DisplayName = "Barter Exchange",
	-- },
	-- #endregion

	-- #region Install screens
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallSuccess",
	-- 	DisplayName = "Installation successful!",
	-- 	Description =
	-- 	"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nYou may now interact with the Chaos Gate in the training grounds to experience Zagreus' original journey to {#DialogLegendaryFormat}escape the Underworld {#Prev}through Melinoë's eyes.\n\n\nIf you experience any issues, please start a discussion on {#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
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
}

sjson.hook(screenTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
