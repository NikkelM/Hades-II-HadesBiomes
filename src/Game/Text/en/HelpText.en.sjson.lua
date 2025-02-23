local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/en/HelpText.en.sjson')

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	{
		Id = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText",
		DisplayName = "{I} {#UseTextPreReqFormat}Descend into Nightmare",
		-- No matter what, always use this version
		OverwriteLocalization = true
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Tartarus",
		DisplayName = "TARTARUS (Nightmare)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",
		DisplayName = "ASPHODEL (Nightmare)",
	},
	{
		-- Almost all textlines use CharProtag in Hades
		Id = "CharProtag",
		DisplayName = "Zagreus",
		Description = "Prince of the Underworld",
	},
}

sjson.hook(helpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
