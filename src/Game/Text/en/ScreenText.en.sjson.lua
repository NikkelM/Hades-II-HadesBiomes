local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\en\\ScreenText.en.sjson")

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- Run history
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Nightmare",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Nightmare",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Nightmare",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Nightmare",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Nightmare",
	},
	{
		Id = "RunHistoryScreen_RouteModsNikkelMHadesBiomes",
		DisplayName = "{!Icons.ModsNikkelMHadesBiomesRunHistoryDoor}",
		-- Icon only, no localization needed
		OverwriteLocalization = true,
	},
	-- Codex
	{
		Id = "ModsNikkelMHadesBiomesCodexEntryTitleText",
		DisplayName = "Nightmare",
	},
	-- Install screens
	{
		Id = "ModsNikkelMHadesBiomes_InstallSuccess",
		DisplayName = "Installation successful!",
		Description =
		"\nWelcome to {#DialogLegendaryFormat}TODO: HadesBiomes WIP title{#Prev}!\n\nYou may now interact with the Chaos Gate in the training grounds to experience Zagreus' original journey to {#DialogLegendaryFormat}escape the Underworld {#Prev}through Melinoë's eyes.\n\n\nIf you experience any issues, please start a discussion on {#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InstallFailure",
		DisplayName = "Installation failed!",
		Description =
		"\nWelcome to {#DialogLegendaryFormat}TODO: HadesBiomes WIP title{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken.\nSome game features may not work as expected.\nPlease see the console window that opens with the game for how to resolve the problem.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach your {#DialogLegendaryFormat}LogOutput {#Prev}file from the ReturnOfModding folder.",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
