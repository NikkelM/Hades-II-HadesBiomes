local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\es\\ScreenText.es.sjson")

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- Run history
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Pesadilla",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Pesadilla",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Pesadilla",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Pesadilla",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Pesadilla",
	},
	-- Codex
	{
		Id = "ModsNikkelMHadesBiomesCodexEntryTitleText",
		DisplayName = "Pesadilla",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
