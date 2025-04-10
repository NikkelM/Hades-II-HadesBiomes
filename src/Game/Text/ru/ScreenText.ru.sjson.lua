local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\ru\\ScreenText.ru.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- Run history
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Кошмар",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Кошмар",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Кошмар",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Кошмар",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Кошмар",
	},
	-- Codex
	{
		Id = "ModsNikkelMHadesBiomesCodexEntryTitleText",
		DisplayName = "Кошмар",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
