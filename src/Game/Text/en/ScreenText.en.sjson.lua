local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\en\\ScreenText.en.sjson")

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
	{
		Id = "RunHistoryScreen_RouteModsNikkelMHadesBiomes",
		DisplayName = "{!Icons.ModsNikkelMHadesBiomesRunHistoryDoor}",
		-- Icon only, no localization needed
		OverwriteLocalization = true,
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
		DisplayName = "Barter Exchange",
	},
	-- #endregion

	-- #region Install screens
	{
		Id = "ModsNikkelMHadesBiomes_InstallSuccess",
		DisplayName = "Installation successful!",
		Description =
		"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nYou may now interact with the Chaos Gate in the training grounds to experience Zagreus' original journey to {#DialogLegendaryFormat}escape the Underworld {#Prev}through Melinoë's eyes.\n\n\nIf you experience any issues, please start a discussion on {#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InstallFailure",
		DisplayName = "Installation failed!",
		Description =
		"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken.\nSome game features may not work as expected.\nPlease see the console window that opens with the game, or the log for how to resolve the problem.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InstallFailure_HadesNotFound",
		DisplayName = "Installation failed!",
		Description =
		"Welcome to {#DialogLegendaryFormat}Zagreus\' Journey{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken, because the mod {#DialogLegendaryFormat}could not find your Hades installation{#Prev}.\nUpdate the {#DialogLegendaryFormat}hadesGameFolder {#Prev}config setting in your mod manager.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	},
	{
		Id = "ModsNikkelMHadesBiomes_UninstallFailure",
		DisplayName = "Uninstallation failed!",
		Description =
		"Uninstalling {#DialogLegendaryFormat}Zagreus\' Journey {#Prev}has {#DialogLegendaryFormat}FAILED {#Prev}!\n\nPlease check the console that opens with the game, or the log for the potential reason.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach the log file from {#DialogLegendaryFormat}Settings -> Copy log file {#Prev}in your mod manager.",
	},
	-- #endregion
}

sjson.hook(screenTextFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
