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
		Id = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
		DisplayName = "Bouldy",
		Description = "",
	},

	-- Credits
	{
		Id = "InGameCredits_Craft_Mod_NikkelM",
		DisplayName = "a mod by",
	},
	{
		Id = "InGameCredits_Name_Mod_NikkelM",
		DisplayName = "NikkelM",
	},
	{
		Id = "InGameCredits_Info_Mod_Special_Shoutouts",
		DisplayName = "modding community\ncontributors",
	},
	{
		Id = "InGameCredits_Craft_Mod_iDeath",
		DisplayName = "hell2modding",
	},
	{
		Id = "InGameCredits_Name_Mod_iDeath",
		DisplayName = "iDeathHD",
	},
	{
		Id = "InGameCredits_Craft_Mod_burn",
		DisplayName = "additional artwork",
	},
	{
		Id = "InGameCredits_Name_Mod_burn",
		DisplayName = "burn",
	},
	{
		Id = "InGameCredits_Craft_Mod_Magic",
		DisplayName = "modutil",
	},
	{
		Id = "InGameCredits_Name_Mod_Magic",
		DisplayName = "Magic_Gonads",
	},
	{
		Id = "InGameCredits_Info_Mod_Community",
		DisplayName = "Special thanks to all members of the Hades modding community!",
	},
	{
		Id = "InGameCredits_Info_Mod_SGG_Thanks",
		DisplayName = "Thank you Supergiant Games for creating Hades and Hades II. \n What follows are the original games' credits.",
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
