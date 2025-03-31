-- Hooking CodexText for this language, as sjson.hook doesn't handle ScreentText decoding correctly
local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game\\Text\\ko\\CodexText.ko.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "악몽",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "악몽",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "악몽",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "악몽",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "악몽",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
