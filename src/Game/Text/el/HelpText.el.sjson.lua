local helpTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/el/HelpText.el.sjson")

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
		DisplayName = "ΑΣΦΟΔΕΛΟΣ (Εφιάλτης)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",
		DisplayName = "ΕΛΥΣΙΟΥΜ (Εφιάλτης)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Styx",
		DisplayName = "ΣΤΥΞ (Εφιάλτης)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Surface",
		-- Means SURFACE, not GREECE
		DisplayName = "ΕΠΙΦΑΝΕΙΑ (Εφιάλτης)",
	},
	{
		Id = "CharProtag",
		DisplayName = "Ζαγρεύς",
		Description = "Πρίγκιπας του Κάτω Κόσμου",
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
