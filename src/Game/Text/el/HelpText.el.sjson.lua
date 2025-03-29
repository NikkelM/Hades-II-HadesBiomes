local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/el/HelpText.el.sjson')

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
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Tartarus",
		DisplayName = "ΤΑΡΤΑΡΑ (Εφιάλτης)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",
		DisplayName = "ΑΣΦΟΔΕΛΑ ΛΙΒΑΔΙΑ (Εφιάλτης)",
	},
	{
		Id = "CharProtag",
		DisplayName = "Ζαγρεύς",
		Description = "Πρίγκιπας του Κάτω Κόσμου",
	},
}

sjson.hook(helpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
