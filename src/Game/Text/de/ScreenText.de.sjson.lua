local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\de\\ScreenText.de.sjson")

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
	{
		Id = "ModsNikkelMHadesBiomes_MarketScreen_Resources",
		DisplayName = "Tauschhandel",
	},
	-- #endregion

	-- #region Install screens
	{
		Id = "ModsNikkelMHadesBiomes_InstallSuccess",
		DisplayName = "Installation erfolgreich!",
		Description =
		"Willkommen zu {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nDu kannst nun mit dem Chaos-Tor auf dem Übungsplatz interagieren, um Zagreus\' ursprüngliche Quest, {#DialogLegendaryFormat}der Unterwelt zu entkommen{#Prev}, durch Melinoë's Augen zu erfahren.\n\n\nSolltest du auf Probleme stoßen, starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund teile dein Log aus {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in deinem Modmanager.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InstallFailure",
		DisplayName = "Installation gescheitert!",
		Description =
		"Willkommen zu {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nLeider ist die Installation der Mod {#DialogLegendaryFormat}GESCHEITERT{#Prev}, oder deine existierende Installation ist kaputt.\nBitte konsultiere die Konsole, die sich mit dem Spiel öffnet, für Lösungshinweise. Eine Neuinstallation der Mod könnte helfen, setze dafür {#DialogLegendaryFormat}firstTimeSetup {#Prev}und {#DialogLegendaryFormat}uninstall {#Prev}in der Konfigurationsdatei der Mod auf {#DialogLegendaryFormat}true{#Prev}.\n\nSollte das Problem weiterhin existieren, starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund teile dein Log aus {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in deinem Modmanager.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InstallFailure_HadesNotFound",
		DisplayName = "Installation gescheitert!",
		Description =
		"Willkommen zu {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nLeider ist die Installation der Mod {#DialogLegendaryFormat}GESCHEITERT{#Prev}, oder deine existierende Installation ist kaputt, da die Mod {#DialogLegendaryFormat}keine Hades-Installation finden konnte{#Prev}.\nSetze die {#DialogLegendaryFormat}hadesGameFolder {#Prev}Konfiguration in deinem Modmanager.\n\nSollte das Problem weiterhin existieren, starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund teile dein Log aus {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in deinem Modmanager.",
	},
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
	{
		Id = "ModsNikkelMHadesBiomes_UninstallFailure",
		DisplayName = "Deinstallation gescheitert!",
		Description =
		"Die Deinstallation von {#DialogLegendaryFormat}Zagreus\' Journey {#Prev}ist {#DialogLegendaryFormat}GESCHEITERT{#Prev}!\n\nDie mit dem Spiel startende Konsole kann zusätzliche Details zu dem Fehler enthalten.\n\nBei weiteren Problemen starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund teile dein Log aus {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in deinem Modmanager.",
	},
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
