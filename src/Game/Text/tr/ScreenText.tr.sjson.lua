local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\tr\\ScreenText.tr.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- Run history
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Kâbus",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Kâbus",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Kâbus",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Kâbus",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Kâbus",
	},
	-- Codex
	{
		Id = "ModsNikkelMHadesBiomesCodexEntryTitleText",
		DisplayName = "Kâbus",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
