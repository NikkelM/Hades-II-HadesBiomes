local screenTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/zh-CN/ScreenText.zh-CN.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "梦魇",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "梦魇",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "梦魇",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "梦魇",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "梦魇",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
