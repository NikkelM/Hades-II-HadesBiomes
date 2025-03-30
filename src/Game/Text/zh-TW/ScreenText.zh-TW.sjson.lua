local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/zh-TW/ScreenText.zh-TW.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "夢魘",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "夢魘",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "夢魘",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "夢魘",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "夢魘",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
