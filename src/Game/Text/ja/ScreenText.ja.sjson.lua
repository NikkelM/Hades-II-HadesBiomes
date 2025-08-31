-- Hooking CodexText for this language, as sjson.hook doesn't handle ScreentText decoding correctly
local screenTextFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\ja\\CodexText.ja.sjson")

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- Run history
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "凶夢",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "凶夢",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "凶夢",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "凶夢",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "凶夢",
	},
	-- Codex
	{
		Id = "ModsNikkelMHadesBiomesCodexEntryTitleText",
		DisplayName = "凶夢",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
