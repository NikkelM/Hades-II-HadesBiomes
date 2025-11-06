local hadesHelpTextFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Text\\ko\\HelpText.ko.sjson")
local hadesHelpTextTable = mod.DecodeSjsonFile(hadesHelpTextFile)

local hadesTwoHelpTextFile = rom.path.combine(rom.paths.Content(), "Game/Text/ko/HelpText.ko.sjson")

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

	-- #region UI
	{
		Id = "Objective_SurvivalTimer",
		DisplayName = "{$RemainingSeconds}초 동안 생존하세요",
	},
	-- #endregion

	-- #region Save File Location Indicators
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Tartarus",
		DisplayName = "타르타로스 (악몽)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Asphodel",
		DisplayName = "아스포델 (악몽)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Elysium",
		DisplayName = "엘리시움 (악몽)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Styx",
		DisplayName = "스틱스 (악몽)",
	},
	{
		Id = "ModsNikkelMHadesBiomesLocation_Hades_Surface",
		DisplayName = "그리스 (악몽)",
	},
	-- #endregion

	-- #region NPC Names
	{
		Id = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
		DisplayName = "돌덩이",
		Description = "",
	},
	-- #endregion

	-- #region Credits
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

	-- #region Inventory/Resources
	-- #region Fish
	-- #region Tartarus
	-- -- Taken from the Hades HelpText Fish_Tartarus_Common_01
	-- {
	-- _Short variants are limited to 10 characters
	-- 	Id = "Fish_Tartarus_Common_01_Short",
	-- 	DisplayName = "Hellfish",
	-- },
	-- {
	-- 	Id = "Fish_Tartarus_Common_01",
	-- 	DisplayName = "Hellfish",
	-- 	Description = "Common denizen of the River Styx.",
	-- },
	-- {
	-- 	Id = "Fish_Tartarus_Common_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Tartarus (Nightmare){#Prev}"
	-- },
	-- -- Adapted from the Hades CodexText CodexData_FishTartarusCommon01_01
	-- -- Character limit for descriptions is ~210
	-- {
	-- 	Id = "Fish_Tartarus_Common_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"From the looks of them, they must have once been stowaways on the outer hull of Charon's boat, securing passage from the surface down into the depths via the River Styx.",
	-- },

	-- {
	-- 	Id = "Fish_Tartarus_Rare_01_Short",
	-- 	DisplayName = "Knuck·head",
	-- },
	-- {
	-- 	Id = "Fish_Tartarus_Rare_01",
	-- 	DisplayName = "Knucklehead",
	-- 	Description = "Uncommon denizen of the River Styx.",
	-- },
	-- {
	-- 	Id = "Fish_Tartarus_Rare_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Tartarus (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Tartarus_Rare_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"It is believed they once were living sea-creatures themselves, their faint spirits having washed down all the way down via the river Styx, to take on a form of un-life.",
	-- },

	-- {
	-- 	Id = "Fish_Tartarus_Legendary_01_Short",
	-- 	DisplayName = "Scy·scion",
	-- },
	-- {
	-- 	Id = "Fish_Tartarus_Legendary_01",
	-- 	DisplayName = "Scyllascion",
	-- 	Description = "Elusive denizen of the River Styx.",
	-- },
	-- {
	-- 	Id = "Fish_Tartarus_Legendary_01_Details",
	-- 	Description =
	-- 	"· Found infrequently using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Tartarus (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Tartarus_Legendary_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"Whether or not these creatures are related to Scylla, or merely appear to be, is a matter that is still contested, as no one has yet bothered asking Scylla herself.",
	-- },

	-- #endregion
	-- #region Asphodel
	-- -- Taken from the Hades HelpText Fish_Asphodel_Common_01
	-- {
	-- 	Id = "Fish_Asphodel_Common_01_Short",
	-- 	DisplayName = "Slavug",
	-- },
	-- {
	-- 	Id = "Fish_Asphodel_Common_01",
	-- 	DisplayName = "Slavug",
	-- 	Description = "Common denizen of the River Phlegethon.",
	-- },
	-- {
	-- 	Id = "Fish_Asphodel_Common_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Asphodel (Nightmare){#Prev}"
	-- },
	-- -- Adapted from the Hades CodexText CodexData_FishAsphodelCommon01_01
	-- {
	-- 	Id = "Fish_Asphodel_Common_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"It is almost impossible to spot with the naked eye, blending in with the boiling magma, feasting off of bits of molten minerals, who knows what else.",
	-- },

	-- {
	-- 	Id = "Fish_Asphodel_Rare_01_Short",
	-- 	DisplayName = "C·tacean",
	-- },
	-- {
	-- 	Id = "Fish_Asphodel_Rare_01",
	-- 	DisplayName = "Chrustacean",
	-- 	Description = "Uncommon denizen of the River Phlegethon.",
	-- },
	-- {
	-- 	Id = "Fish_Asphodel_Rare_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Asphodel (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Asphodel_Rare_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"In ocean waters, similar creatures serve as easy prey -- but not this magma-loving variety, which tends to be left alone. Though, some do swim up from the riverbed in search of companionship.",
	-- },

	-- {
	-- 	Id = "Fish_Asphodel_Legendary_01_Short",
	-- 	DisplayName = "Flameater",
	-- },
	-- {
	-- 	Id = "Fish_Asphodel_Legendary_01",
	-- 	DisplayName = "Flameater",
	-- 	Description = "Elusive denizen of the River Phlegethon.",
	-- },
	-- {
	-- 	Id = "Fish_Asphodel_Legendary_01_Details",
	-- 	Description =
	-- 	"· Found infrequently using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Asphodel (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Asphodel_Legendary_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"Its winding tentacles and scaled body are reminiscent of the serpent Ladon, though whether Ladon or some other monster gave birth to it is, as yet, unknown.",
	-- },

	-- #endregion
	-- #region Elysium
	-- -- Taken from the Hades HelpText Fish_Elysium_Common_01
	-- {
	-- 	Id = "Fish_Elysium_Common_01_Short",
	-- 	DisplayName = "Chlam",
	-- },
	-- {
	-- 	Id = "Fish_Elysium_Common_01",
	-- 	DisplayName = "Chlam",
	-- 	Description = "Common denizen of the River Lethe.",
	-- },
	-- {
	-- 	Id = "Fish_Elysium_Common_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Elysium (Nightmare){#Prev}"
	-- },
	-- -- Adapted from the Hades CodexText CodexData_FishElysiumCommon01_01
	-- {
	-- 	Id = "Fish_Elysium_Common_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"The common Chlam is plentiful within the misty waters of the River Lethe, flowing through the hills and valleys of Elysium. Its shell most of the time is shut so tight, it cannot be opened.",
	-- },

	-- {
	-- 	Id = "Fish_Elysium_Rare_01_Short",
	-- 	DisplayName = "Charp",
	-- },
	-- {
	-- 	Id = "Fish_Elysium_Rare_01",
	-- 	DisplayName = "Charp",
	-- 	Description = "Uncommon denizen of the River Lethe.",
	-- },
	-- {
	-- 	Id = "Fish_Elysium_Rare_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Elysium (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Elysium_Rare_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"The Elysian Charp seems to be the shade of a surface-dwelling fish highly reminiscent of it, with similarly multicolored scales and a placid, almost contemplative temperament.",
	-- },

	-- {
	-- 	Id = "Fish_Elysium_Legendary_01_Short",
	-- 	DisplayName = "Seamare",
	-- },
	-- {
	-- 	Id = "Fish_Elysium_Legendary_01",
	-- 	DisplayName = "Seamare",
	-- 	Description = "Elusive denizen of the River Lethe.",
	-- },
	-- {
	-- 	Id = "Fish_Elysium_Legendary_01_Details",
	-- 	Description =
	-- 	"· Found infrequently using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Elysium (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Elysium_Legendary_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"In Elysium, many former heroes can be seen staring endlessly into the River Lethe's waters, simply in the hopes of catching a brief glimpse of one of these majestic creatures.",
	-- },

	-- #endregion
	-- #region Styx
	-- -- Taken from the Hades HelpText Fish_Styx_Common_01
	-- {
	-- 	Id = "Fish_Styx_Common_01_Short",
	-- 	DisplayName = "Gupp",
	-- },
	-- {
	-- 	Id = "Fish_Styx_Common_01",
	-- 	DisplayName = "Gupp",
	-- 	Description = "Common denizen of the River Styx.",
	-- },
	-- {
	-- 	Id = "Fish_Styx_Common_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Styx (Nightmare){#Prev}"
	-- },
	-- -- Adapted from the Hades CodexText CodexData_FishStyxCommon01_01
	-- {
	-- 	Id = "Fish_Styx_Common_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"This is an altogether odd river-creature, which skirts the border between the surface and the Underworld, likewise persisting in a state somewhere between life and death.",
	-- },

	-- {
	-- 	Id = "Fish_Styx_Rare_01_Short",
	-- 	DisplayName = "Scuffer",
	-- },
	-- {
	-- 	Id = "Fish_Styx_Rare_01",
	-- 	DisplayName = "Scuffer",
	-- 	Description = "Uncommon denizen of the River Styx.",
	-- },
	-- {
	-- 	Id = "Fish_Styx_Rare_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Styx (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Styx_Rare_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"Truly a bottom-feeder, the Scuffer evidently is much more adventurous than similar varieties, as it dares to dwell in the waters of the River Styx near the border where the waters plummet down into the abyss.",
	-- },

	-- {
	-- 	Id = "Fish_Styx_Legendary_01_Short",
	-- 	DisplayName = "Stonewhal",
	-- },
	-- {
	-- 	Id = "Fish_Styx_Legendary_01",
	-- 	DisplayName = "Stonewhal",
	-- 	Description = "Elusive denizen of the River Styx.",
	-- },
	-- {
	-- 	Id = "Fish_Styx_Legendary_01_Details",
	-- 	Description =
	-- 	"· Found infrequently using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} in {#BoldFormat}Styx (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Styx_Legendary_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"The harpoon-nosed Stonewhal is an elusive species that feeds on lesser river creatures that dwell close to the gates of the Underworld, slaying them so that their souls may be eligible for the rest of the journey.",
	-- },

	-- #endregion
	-- #region Surface
	-- -- Taken from the Hades HelpText Fish_Surface_Common_01
	-- {
	-- 	Id = "Fish_Surface_Common_01_Short",
	-- 	DisplayName = "Trout",
	-- },
	-- {
	-- 	Id = "Fish_Surface_Common_01",
	-- 	DisplayName = "Trout",
	-- 	Description = "Common denizen of the Surface Waters.",
	-- },
	-- {
	-- 	Id = "Fish_Surface_Common_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} on the {#BoldFormat}Surface (Nightmare){#Prev}"
	-- },
	-- -- Adapted from the Hades CodexText CodexData_FishSurfaceCommon01_01
	-- {
	-- 	Id = "Fish_Surface_Common_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"On the surface, there are aquatic creatures that live in the drinkable waters of rivers and lakes, and those of Lord Poseidon's salt-filled seas. In the former category, the Trout is a perfectly common breed.",
	-- },

	-- {
	-- 	Id = "Fish_Surface_Rare_01_Short",
	-- 	DisplayName = "Bass",
	-- },
	-- {
	-- 	Id = "Fish_Surface_Rare_01",
	-- 	DisplayName = "Bass",
	-- 	Description = "Uncommon denizen of the Surface Waters.",
	-- },
	-- {
	-- 	Id = "Fish_Surface_Rare_01_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} on the {#BoldFormat}Surface (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Surface_Rare_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"The seas and rivers of the surface absolutely teem with marine life, and people are quite skilled at capturing creatures such as this, which are often traded far and wide.",
	-- },

	-- {
	-- 	Id = "Fish_Surface_Legendary_01_Short",
	-- 	DisplayName = "Sturgeon",
	-- },
	-- {
	-- 	Id = "Fish_Surface_Legendary_01",
	-- 	DisplayName = "Sturgeon",
	-- 	Description = "Elusive denizen of the Surface Waters.",
	-- },
	-- {
	-- 	Id = "Fish_Surface_Legendary_01_Details",
	-- 	Description =
	-- 	"· Found infrequently using the {!Icons.ToolRodIcon} {$WeaponShopItemData.ToolFishingRod.Name} at {$Keywords.FishingPointPlural} on the {#BoldFormat}Surface (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "Fish_Surface_Legendary_01_Flavor",
	-- 	DisplayName = "",
	-- 	Description =
	-- 	"The monstrous Sturgeon is a king among fish. Some are massive in size, their bone-like ridges affording them considerable defense. Little wonder, then, that they are so highly sought-after.",
	-- },

	-- #endregion
	-- #endregion
	-- #region Ore
	-- #region Tartarus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreTartarus",
	-- 	DisplayName = "Candle Wax",
	-- 	Description = "Not even the Fates are privy to what purpose this may hold.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreTartarus_Short",
	-- 	DisplayName = "Wax",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreTartarus_Icon",
	-- 	InheritFrom = "ModsNikkelMHadesBiomes_OreTartarus",
	-- 	DisplayName = "{!Icons.ModsNikkelMHadesBiomes_OreTartarus} Candle Wax",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreTartarus_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolPickIcon} {$WeaponShopItemData.ToolPickaxe.Name} on {$Keywords.PickaxePointPlural} in {#BoldFormat}Tartarus (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreTartarus_Flavor",
	-- 	Description = "Ancient drippings hardened by time, their flames long since extinguished."
	-- },
	-- #endregion
	-- #region Asphodel
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreAsphodel",
	-- 	DisplayName = "Granite",
	-- 	Description = "Not even the Fates are privy to what purpose this may hold.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreAsphodel_Short",
	-- 	DisplayName = "Granite",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreAsphodel_Icon",
	-- 	InheritFrom = "ModsNikkelMHadesBiomes_OreAsphodel",
	-- 	DisplayName = "{!Icons.ModsNikkelMHadesBiomes_OreAsphodel} Granite",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreAsphodel_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolPickIcon} {$WeaponShopItemData.ToolPickaxe.Name} on {$Keywords.PickaxePointPlural} in {#BoldFormat}Asphodel (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreAsphodel_Flavor",
	-- 	Description = "In the heat of Asphodel, only the sturdiest of rocks can  hope to withstand the test of time."
	-- },
	-- #endregion
	-- #region Elysium
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreElysium",
	-- 	DisplayName = "Lapis Lazuli",
	-- 	Description = "Not even the Fates are privy to what purpose this may hold.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreElysium_Short",
	-- 	DisplayName = "Lazuli",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreElysium_Icon",
	-- 	InheritFrom = "ModsNikkelMHadesBiomes_OreElysium",
	-- 	DisplayName = "{!Icons.ModsNikkelMHadesBiomes_OreElysium} Lapis Lazuli",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreElysium_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolPickIcon} {$WeaponShopItemData.ToolPickaxe.Name} on {$Keywords.PickaxePointPlural} in {#BoldFormat}Elysium (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreElysium_Flavor",
	-- 	Description = "Even amongst the most worthy of shades, this celestial stone stands as a treasure worth seeking."
	-- },
	-- #endregion
	-- #region Styx
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreStyx",
	-- 	DisplayName = "Amber",
	-- 	Description = "Not even the Fates are privy to what purpose this may hold.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreStyx_Short",
	-- 	DisplayName = "Amber",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreStyx_Icon",
	-- 	InheritFrom = "ModsNikkelMHadesBiomes_OreStyx",
	-- 	DisplayName = "{!Icons.ModsNikkelMHadesBiomes_OreStyx} Amber",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreStyx_Details",
	-- 	Description =
	-- 	"· Found using the {!Icons.ToolPickIcon} {$WeaponShopItemData.ToolPickaxe.Name} on {$Keywords.PickaxePointPlural} in {#BoldFormat}Styx (Nightmare){#Prev}"
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_OreStyx_Flavor",
	-- 	Description = "Many things seep from the surface into the depths of the Underworld, some more valuable than others."
	-- },
	-- #endregion
	-- #endregion
	-- #region Plants/HarvestPoint
	-- #region Tartarus
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantTartarus",
	-- 	DisplayName = "Blood Root",
	-- 	Description = "Not even the Fates are privy to what purpose this may hold.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantTartarus_Short",
	-- 	DisplayName = "Blood Root",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantTartarus_Icon",
	-- 	InheritFrom = "ModsNikkelMHadesBiomes_PlantTartarus",
	-- 	DisplayName = "{!Icons.ModsNikkelMHadesBiomes_PlantTartarus} Blood Root",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantTartarus_Details",
	-- 	Description = "· Gathered by hand in {#BoldFormat}Tartarus (Nightmare){#Prev}",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantTartarus_Flavor",
	-- 	Description = "The rough hewn stone floors of Tartarus allow this hardy root to take hold and break free.",
	-- },
	-- #endregion
	-- #region Asphodel
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantAsphodel",
	-- 	DisplayName = "Volcanic Fumes",
	-- 	Description = "Not even the Fates are privy to what purpose this may hold.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantAsphodel_Short",
	-- 	DisplayName = "Fumes",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantAsphodel_Icon",
	-- 	InheritFrom = "ModsNikkelMHadesBiomes_PlantAsphodel",
	-- 	DisplayName = "{!Icons.ModsNikkelMHadesBiomes_PlantAsphodel} Fumes",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantAsphodel_Details",
	-- 	Description = "· Gathered by hand in {#BoldFormat}Asphodel (Nightmare){#Prev}",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantAsphodel_Flavor",
	-- 	Description = "In the constant heat of Asphodel, these fumes rise up from cracks in the earth.",
	-- },
	-- #endregion
	-- #region Elysium
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantElysium",
	-- 	DisplayName = "Laurel",
	-- 	Description = "Not even the Fates are privy to what purpose this may hold.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantElysium_Short",
	-- 	DisplayName = "Laurel",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantElysium_Icon",
	-- 	InheritFrom = "ModsNikkelMHadesBiomes_PlantElysium",
	-- 	DisplayName = "{!Icons.ModsNikkelMHadesBiomes_PlantElysium} Laurel",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantElysium_Details",
	-- 	Description = "· Gathered by hand in {#BoldFormat}Elysium (Nightmare){#Prev}",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantElysium_Flavor",
	-- 	Description =
	-- 	"The glorious heroes of Elysium are showered with laurels even in death, where they have no more use for them.",
	-- },
	-- #endregion
	-- #region Styx
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantStyx",
	-- 	DisplayName = "Horned Melon",
	-- 	Description = "Not even the Fates are privy to what purpose this may hold.",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantStyx_Short",
	-- 	DisplayName = "Melon",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantStyx_Icon",
	-- 	InheritFrom = "ModsNikkelMHadesBiomes_PlantStyx",
	-- 	DisplayName = "{!Icons.ModsNikkelMHadesBiomes_PlantStyx} Melon",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantStyx_Details",
	-- 	Description = "· Gathered by hand in {#BoldFormat}Styx (Nightmare){#Prev}",
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_PlantStyx_Flavor",
	-- 	Description = "The toxic environs of Styx give rise to all manner of strange flora.",
	-- },
	-- #endregion
	-- #endregion
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
