local screenTextFile = rom.path.combine(rom.paths.Content(), 'Game/Text/pl/ScreenText.pl.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Koszmar",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Koszmar",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Koszmar",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Koszmar",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Koszmar",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
