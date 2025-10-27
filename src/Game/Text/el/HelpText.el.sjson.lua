local helpTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/el/HelpText.el.sjson")

local order = {
	"Id",
	"DisplayName",
	"OverwriteLocalization"
}

local newData = {
	-- #region Meta
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Mod_Name",
	-- 	DisplayName = "Zagreus\' Journey",
	-- },
	-- #endregion
	-- #region Button/Use Prompts
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText",
	-- 	DisplayName = "{I} {#UseTextPreReqFormat}Descend into Nightmare",
	-- },
	-- #endregion
	-- #region Save File Location Indicators
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
	-- #endregion
	-- NPC Names
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
	-- 	DisplayName = "Bouldy",
	-- 	Description = "",
	-- },
	-- #endregion
	-- region Credits
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Craft_NikkelM",
	-- 	DisplayName = "a mod by",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Name_NikkelM",
	-- 	DisplayName = "NikkelM",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Info_Special_Shoutouts",
	-- 	DisplayName = "modding community contributors",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Craft_iDeath",
	-- 	DisplayName = "hell2modding",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Name_iDeath",
	-- 	DisplayName = "iDeathHD",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Craft_burn",
	-- 	DisplayName = "additional artwork",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Name_burn",
	-- 	DisplayName = "burn",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Craft_Magic",
	-- 	DisplayName = "modutil",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Name_Magic",
	-- 	DisplayName = "Magic_Gonads",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Info_Community",
	-- 	DisplayName =
	-- 	"Special thanks to all members of the Hades modding community \n that helped with testing and provided feedback!",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_InGameCredits_Info_SGG_Thanks",
	-- 	DisplayName =
	-- 	"Thank you Supergiant Games for creating Hades and Hades II. \n What follows are the original games' credits.",
	-- },
	-- #endregion
}

sjson.hook(helpTextFile, function(data)
	for _, newValue in ipairs(newData) do
		table.insert(data.Texts, sjson.to_object(newValue, order))
	end
end)
