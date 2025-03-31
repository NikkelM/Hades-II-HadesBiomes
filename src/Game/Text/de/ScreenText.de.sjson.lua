local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\de\\ScreenText.de.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- Run history
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Albtraum",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Albtraum",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Albtraum",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Albtraum",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Albtraum",
	},
	-- Codex
	{
		Id = "ModsNikkelMHadesBiomesCodexEntryTitleText",
		DisplayName = "Albtraum",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
