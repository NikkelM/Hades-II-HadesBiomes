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
	-- #region Meta
	{
		Id = "ModsNikkelMHadesBiomes_Mod_Name",
		DisplayName = "Zagreus\' Journey",
	},
	-- #endregion

	-- #region UI
	{
		Id = "Objective_SurvivalTimer",
		DisplayName = "Survive for: {$RemainingSeconds} Sec.",
	},
	-- #endregion

	-- #region Button/Use Prompts
	{
		Id = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText",
		DisplayName = "{I} {#UseTextPreReqFormat}Descend into Nightmare",
	},
	-- #endregion

	-- #region Save File Location Indicators
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
	-- #endregion

	-- NPC Names
	{
		Id = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
		DisplayName = "Bouldy",
		Description = "",
	},
	-- #endregion

	-- region Credits
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Craft_NikkelM",
		DisplayName = "a mod by",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Name_NikkelM",
		DisplayName = "NikkelM",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Info_Special_Shoutouts",
		DisplayName = "modding community contributors",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Craft_iDeath",
		DisplayName = "hell2modding",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Name_iDeath",
		DisplayName = "iDeathHD",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Craft_burn",
		DisplayName = "additional artwork",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Name_burn",
		DisplayName = "burn",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Craft_Magic",
		DisplayName = "modutil",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Name_Magic",
		DisplayName = "Magic_Gonads",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Info_Community",
		DisplayName =
		"Special thanks to all members of the Hades modding community \n that helped with testing and provided feedback!",
	},
	{
		Id = "ModsNikkelMHadesBiomes_InGameCredits_Info_SGG_Thanks",
		DisplayName =
		"Thank you Supergiant Games for creating Hades and Hades II. \n What follows are the original games' credits.",
	},
	-- #endregion
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
