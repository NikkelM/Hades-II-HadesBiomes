local helpTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/tr/HelpText.tr.sjson")

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
		DisplayName = "TARTAROS (Kâbus)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",
		DisplayName = "ASFODEL (Kâbus)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",
		DisplayName = "ELISYUM (Kâbus)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Styx",
		DisplayName = "STIKS (Kâbus)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Surface",
		DisplayName = "YÜZEY (Kâbus)",
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
