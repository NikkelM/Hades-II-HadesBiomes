local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/es/HelpText.es.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText",
	-- 	DisplayName = "{I} {#UseTextPreReqFormat}Descend into Nightmare",
	-- },
	{
		Id = "ModdedLocation_Hades_Tartarus",
		DisplayName = "TÁRTARO (Pesadilla)",
	},
	{
		Id = "CharProtag",
		DisplayName = "Zagreo",
		Description = "Príncipe del Inframundo",
	},
}

sjson.hook(helpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
