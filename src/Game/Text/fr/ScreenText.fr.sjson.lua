local screenTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/fr/ScreenText.fr.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "RunHistoryScreen_RouteTartarus",
		DisplayName = "Cauchemar",
	},
	{
		Id = "RunHistoryScreen_RouteAsphodel",
		DisplayName = "Cauchemar",
	},
	{
		Id = "RunHistoryScreen_RouteElysium",
		DisplayName = "Cauchemar",
	},
	{
		Id = "RunHistoryScreen_RouteStyx",
		DisplayName = "Cauchemar",
	},
	{
		Id = "RunHistoryScreen_RouteSurface",
		DisplayName = "Cauchemar",
	},
}

sjson.hook(screenTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
