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
		Id = "ModsNikkelMHadesBiomesCodexEntryTitleText",
		InheritFrom = "WeaponPointsRare",
	},
	{
		Id = "InventoryScreen_ModesNikkelMHadesBiomesTab",
		InheritFrom = "ModsNikkelMHadesBiomesCodexEntryTitleText",
	},
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
		"Willkommen zu {#DialogLegendaryFormat}Zagreus\' Pfad{#Prev}!\n\nDu kannst nun mit dem Chaos-Tor auf dem Übungsplatz interagieren, um Zagreus\' ursprüngliche Quest, {#DialogLegendaryFormat}der Unterwelt zu entkommen{#Prev}, durch Melinoë's Augen zu erfahren.\n\n\nSolltest du auf Probleme stoßen, starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund lade die {#DialogLegendaryFormat}LogOutput.log {#Prev}Datei aus dem \"ReturnOfModding\" Ordner hoch.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InstallFailure",
		DisplayName = "Installation gescheitert!",
		Description =
		"Willkommen zu {#DialogLegendaryFormat}Zagreus\' Pfad{#Prev}!\n\nLeider ist die Installation der Mod {#DialogLegendaryFormat}GESCHEITERT{#Prev}, oder deine existierende Installation ist kaputt.\nEinige Spielfunktionen könnten nicht funktionieren.\nBitte konsultiere das Konsolen-Fenster das sich mit dem Spiel öffnet, für Lösungshinweise.\n\nSollte das Problem weiterhin existieren, starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund lade die {#DialogLegendaryFormat}LogOutput.log {#Prev}Datei aus dem \"ReturnOfModding\" Ordner hoch.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_UninstallFailure",
		DisplayName = "Deinstallation gescheitert!",
		Description =
		"Die Deinstallation von {#DialogLegendaryFormat}Zagreus\' Pfad {#Prev}ist {#DialogLegendaryFormat}GESCHEITERT{#Prev}, da der {#BoldFormatGraft}aktuellste Durchgang {#Prev}einer deiner Speicherplätze modifiziert war.\n\nDas Spiel speichert Daten des letzten Durchgangs, daher würde eine Deinstallation {#DialogLegendaryFormat}deinen Speicherstand korrumpieren{#Prev}, bis die Mod wieder installiert wird! Daher wurde die Mod {#DialogLegendaryFormat}wieder eingeschaltet{#Prev}. Um sicher zu deinstallieren, starte einen neuen normalen Durchangang und {#BoldFormatGraft}gib ihn nicht auf {#Prev}. Dann versuche eine erneute Deinstallation.\n\nMöchtest du trotzdem deinstallieren, setze die {#BoldFormatGraft}uninstall{#Prev}-Option auf \"{#DialogLegendaryFormat}I am sure - Uninstall{#Prev}\". Dies kann deinen Speicherstand {#DialogLegendaryFormat}korrumpieren{#Prev}!\n\nBei weiteren Problemen starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund lade die {#DialogLegendaryFormat}LogOutput.log {#Prev}Datei aus dem \"ReturnOfModding\" Ordner hoch.",
	},
	-- #endregion
}

sjson.hook(screenTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
