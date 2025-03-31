local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\el\\ScreenText.el.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- Run history
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Εφιάλτης",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Εφιάλτης",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Εφιάλτης",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Εφιάλτης",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Εφιάλτης",
	},
	-- Codex
	{
		Id = "ModsNikkelMHadesBiomesCodexEntryTitleText",
		DisplayName = "Εφιάλτης",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
