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
		"Willkommen zu {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nLeider ist die Installation der Mod {#DialogLegendaryFormat}GESCHEITERT{#Prev}, oder deine existierende Installation ist kaputt.\nEinige Spielfunktionen könnten nicht funktionieren.\nBitte konsultiere das Konsolen-Fenster das sich mit dem Spiel öffnet, für Lösungshinweise.\n\nSollte das Problem weiterhin existieren, starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund teile dein Log aus {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in deinem Modmanager.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InstallFailure_HadesNotFound",
		DisplayName = "Installation gescheitert!",
		Description =
		"Willkommen zu {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nLeider ist die Installation der Mod {#DialogLegendaryFormat}GESCHEITERT{#Prev}, oder deine existierende Installation ist kaputt, da die Mod {#DialogLegendaryFormat}keine Hades-Installation finden konnte{#Prev}.\nSetze die {#DialogLegendaryFormat}hadesGameFolder {#Prev}Konfiguration in deinem Modmanager.\n\nSollte das Problem weiterhin existieren, starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund teile dein Log aus {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in deinem Modmanager.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_UninstallFailure",
		DisplayName = "Deinstallation gescheitert!",
		Description =
		"Die Deinstallation von {#DialogLegendaryFormat}Zagreus\' Journey {#Prev}ist {#DialogLegendaryFormat}GESCHEITERT{#Prev}!\n\nDie mit dem Spiel startende Konsole kann zusätzliche Details zu dem Fehler enthalten.\n\nBei weiteren Problemen starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund teile dein Log aus {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in deinem Modmanager.",
	},
	-- #endregion
}

sjson.hook(screenTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
