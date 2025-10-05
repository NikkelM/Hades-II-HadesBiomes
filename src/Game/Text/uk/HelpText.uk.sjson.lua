local helpTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/uk/HelpText.uk.sjson")

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
		DisplayName = "ТАРТАР (Кошмар)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",
		DisplayName = "АСФОДЕЛЬ (Кошмар)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",
		DisplayName = "ЕЛІСІЙ (Кошмар)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Styx",
		DisplayName = "СТІКСУ (Кошмар)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Surface",
		DisplayName = "ПОВЕРХНЮ (Кошмар)",
	},
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
	-- 	DisplayName = "Bouldy",
	-- 	Description = "",
	-- },
}

sjson.hook(helpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
