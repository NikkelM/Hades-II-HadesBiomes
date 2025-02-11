local screenTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/pt-BR/ScreenText.pt-BR.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Pesadelo",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Pesadelo",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Pesadelo",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Pesadelo",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Pesadelo",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
