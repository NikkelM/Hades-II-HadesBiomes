-- Hooking CodexText for this language, as ScreenText has """" which sjson.hook doesn't handle correctly
local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\it\\CodexText.it.sjson")

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- Run history
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Incubo",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Incubo",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Incubo",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Incubo",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Incubo",
	},
	-- Codex
	{
		Id = "ModsNikkelMHadesBiomesCodexEntryTitleText",
		DisplayName = "Incubo",
	},
	-- Install screens
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallSuccess",
	-- 	DisplayName = "Installation successful!",
	-- 	Description =
	-- 	"\nWelcome to {#DialogLegendaryFormat}TODO: HadesBiomes WIP title{#Prev}!\n\nYou may now interact with the Chaos Gate in the training grounds to experience Zagreus' original journey to {#DialogLegendaryFormat}escape the Underworld {#Prev}through Melinoë's eyes.\n\n\nIf you experience any issues, please start a discussion on {#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach your {#DialogLegendaryFormat}LogOutput.log {#Prev}file from the \"ReturnOfModding\" folder.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InstallFailure",
	-- 	DisplayName = "Installation failed!",
	-- 	Description =
	-- 	"\nWelcome to {#DialogLegendaryFormat}TODO: HadesBiomes WIP title{#Prev}!\n\nUnfortunately, installing the mod has {#DialogLegendaryFormat}FAILED{#Prev}, or your existing installation is broken.\nSome game features may not work as expected.\nPlease see the console window that opens with the game for how to resolve the problem.\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach your {#DialogLegendaryFormat}LogOutput.log {#Prev}file from the \"ReturnOfModding\" folder.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_UninstallFailure",
	-- 	DisplayName = "Uninstallation failed!",
	-- 	Description =
	-- 	"\nUninstalling {#DialogLegendaryFormat}TODO: HadesBiomes WIP title {#Prev}has {#DialogLegendaryFormat}FAILED {#Prev}, because for one of your saves, the {#BoldFormatGraft}most recent run {#Prev}was a modded run.\n\nThe game persists data after a run, and uninstalling the mod now would {#DialogLegendaryFormat}break your save {#Prev}until you reinstall the mod! To protect your saves, the mod has been {#DialogLegendaryFormat}enabled again{#Prev}. To safely uninstall, start and {#BoldFormatGraft}do not undo {#Prev}a normal run on all affected saves. Then retry uninstalling the mod.\n\nIf you think you should be able to uninstall now, set the {#BoldFormatGraft}uninstall {#Prev}config option to \"{#DialogLegendaryFormat}I am sure - Uninstall{#Prev}\".\nThis can {#DialogLegendaryFormat}break your save {#Prev} until you reinstall the mod!\n\nIf the issue persists, please start a discussion on\n{#ItalicFormat}github.com/NikkelM/Hades-II-HadesBiomes/discussions{#Prev}\nand attach your {#DialogLegendaryFormat}LogOutput.log {#Prev}file from the \"ReturnOfModding\" folder.",
	-- },
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
