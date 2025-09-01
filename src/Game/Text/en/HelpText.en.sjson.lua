local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\en\\HelpText.en.sjson")
local hadesHelpTextTable = mod.DecodeSjsonFile(hadesHelpTextFile)

local hadesTwoHelpTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/en/HelpText.en.sjson")

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

-- Entirely new, custom entries
local newData = {
	{
		Id = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText",
		DisplayName = "{I} {#UseTextPreReqFormat}Descend into Nightmare",
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
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",
		DisplayName = "ELYSIUM (Nightmare)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Styx",
		DisplayName = "STYX (Nightmare)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Surface",
		DisplayName = "GREECE (Nightmare)",
	},
	{
		-- Almost all textlines use CharProtag in Hades
		Id = "CharProtag",
		DisplayName = "Zagreus",
		Description = "Prince of the Underworld",
	},
	{
		Id = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
		DisplayName = "Bouldy",
		Description = "",
	},
}

local hadesHelpTextCopiedEntries = mod.ModifyHadesHelpTextEntries(hadesHelpTextTable)

sjson.hook(hadesTwoHelpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
	for _, newValue in ipairs(hadesHelpTextCopiedEntries) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
