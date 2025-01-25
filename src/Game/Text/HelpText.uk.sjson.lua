local helpTextFile = rom.path.combine(rom.paths.Content, 'Game/Text/uk/HelpText.uk.sjson')

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
		Id = "Location_Hades_Tartarus",
		DisplayName = "ТАРТАР (Кошмар)",
	},
}

sjson.hook(helpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
