local screenTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/en/ScreenText.en.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Nightmare",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Nightmare",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Nightmare",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Nightmare",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Nightmare",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
