local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/it/ScreenText.it.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Incubo",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Incubo",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Incubo",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Incubo",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Incubo",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
