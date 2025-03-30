local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/uk/ScreenText.uk.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
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
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
