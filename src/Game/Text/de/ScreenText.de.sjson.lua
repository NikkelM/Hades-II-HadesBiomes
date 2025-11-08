local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\de\\ScreenText.de.sjson")

local order = {
	"Id",
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
	-- 	"Welcome to {#DialogLegendaryFormat}TODO: HadesBiomes WIP title{#Prev}!\n\nYou may now interact with the Chaos Gate in the training grounds to experience Zagreus' original journey to {#DialogLegendaryFormat}escape the Underworld {#Prev}through Melinoë's eyes.\n\n\nIf you experience any issues, please start a discussion on {#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach your {#DialogLegendaryFormat}LogOutput.log {#Prev}file from the \"ReturnOfModding\" folder.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallFailure",
	-- 	DisplayName = "Installation failed!",
	-- 	Description =
	-- 	"Welcome to {#DialogLegendaryFormat}TODO: HadesBiomes WIP title{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken.\nSome game features may not work as expected.\nPlease see the console window that opens with the game for how to resolve the problem.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach your {#DialogLegendaryFormat}LogOutput.log {#Prev}file from the \"ReturnOfModding\" folder.",
	-- },
	{
		Id = "ModsNikkelMHadesBiomes_UninstallFailure",
		DisplayName = "Deinstallation gescheitert!",
		Description =
		"Die Deinstallation von {#DialogLegendaryFormat}TODO: HadesBiomes WIP title {#Prev}ist {#DialogLegendaryFormat}GESCHEITERT{#Prev}, da der {#BoldFormatGraft}aktuellste Durchgang {#Prev}einer deiner Speicherplätze modifiziert war.\n\nDas Spiel speichert Daten des letzten Durchgangs, daher würde eine Deinstallation {#DialogLegendaryFormat}deinen Speicherstand korrumpieren{#Prev}, bis die Mod wieder installiert wird! Daher wurde die Mod {#DialogLegendaryFormat}wieder eingeschaltet{#Prev}. Um sicher zu deinstallieren, starte einen neuen normalen Durchangang und {#BoldFormatGraft}gib ihn nicht auf {#Prev}. Dann versuche eine erneute Deinstallation.\n\nMöchtest du trotzdem deinstallieren, setze die {#BoldFormatGraft}uninstall{#Prev}-Option auf \"{#DialogLegendaryFormat}I am sure - Uninstall{#Prev}\". Dies kann deinen Speicherstand {#DialogLegendaryFormat}korrumpieren{#Prev}!\n\nBei weiteren Problemen starte bitte eine Diskussion auf\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nund lade die {#DialogLegendaryFormat}LogOutput.log {#Prev}Datei aus dem \"ReturnOfModding\" Ordner hoch.",
	},
	-- #endregion
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
