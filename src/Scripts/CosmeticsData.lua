-- For reference, modded resource names:
--[[
	"ModsNikkelMHadesBiomes_PlantTartarus",
	"ModsNikkelMHadesBiomes_CropTartarus",
	"ModsNikkelMHadesBiomes_OreTartarus",
	"ModsNikkelMHadesBiomes_BossResourceTartarus",

	"ModsNikkelMHadesBiomes_PlantAsphodel",
	"ModsNikkelMHadesBiomes_CropAsphodel",
	"ModsNikkelMHadesBiomes_OreAsphodel",
	"ModsNikkelMHadesBiomes_BossResourceAsphodel",

	"ModsNikkelMHadesBiomes_PlantElysium",
	"ModsNikkelMHadesBiomes_CropElysium",
	"ModsNikkelMHadesBiomes_OreElysium",
	"ModsNikkelMHadesBiomes_BossResourceElysium",

	"ModsNikkelMHadesBiomes_PlantStyx",
	"ModsNikkelMHadesBiomes_CropStyx",
	"ModsNikkelMHadesBiomes_OreStyx",
	"ModsNikkelMHadesBiomes_BossResourceStyx",
]] --

local mainHubAreaCosmetics = {
	-- #region Banners/Cosmetic_HecateKey
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Infernal",
		Name = {
			en = "Banner, Infernal",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
		},
		FlavorText = {
			en =
			"Eerily resembles the Pact of Punishment once served to your brother, Zagreus, when once he sought to escape the Underworld.",
		},
		CosmeticsGroup = "Cosmetic_HecateKey",
		InsertAfterCosmetic = "Cosmetic_HecateKey",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 780487 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Banner_Infernal",
		IconScale = 0.3,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Banner_Infernal",
		AnimationScale = 3.57,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "Cosmetic_HecateKey" },
			},
			-- Beaten EM4 Hades
			{
				PathTrue = { "GameState", "TextLinesRecord", "LordHadesExtremeMeasuresDefeat01" },
			},
			NamedRequirements = { "T5Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 800,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Divine",
		Name = {
			en = "Banner, Divine",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
		},
		FlavorText = {
			en =
			"Many of the shades that found their way into the Crossroads were deemed unworthy of passage to Elysium. This banner serves to inspire hope in those who see it.",
		},
		CosmeticsGroup = "Cosmetic_HecateKey",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Banner_Infernal",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 780487 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Banner_Divine",
		IconScale = 0.3,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Banner_Divine",
		AnimationScale = 3.57,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "Cosmetic_HecateKey" },
			},
			-- Cleared Elysium
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_PostBoss01" },
			},
			NamedRequirements = { "T5Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 800,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
		},
	},
	-- #endregion
	-- #region Pillars/Cosmetic_CauldronPillars01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Divine",
		Name = {
			en = "Pillars, Divine",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			en =
			"So numerous are the splendors of Elysium, that it was only a matter of time for some of its grandeur to find its way into the Crossroads.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = "Cosmetic_CauldronPillars01c",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Pillars_Divine",
		IconScale = 0.1,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Pillars_Divine",
		AnimationScale = 1.9,
		GameStateRequirements = {
			-- Met Patroclus
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_Story01" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_CropElysium = 1,
			ModsNikkelMHadesBiomes_OreElysium = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Gilded",
		Name = {
			en = "Pillars, Gilded",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			en =
			"Pillars such as these hold up the grand halls in the Temple of Styx, just out of reach of mortals, hidden beneath the surface.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Divine",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Pillars_Gilded",
		IconScale = 0.1,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Pillars_Gilded",
		AnimationScale = 1.9,
		GameStateRequirements = {
			-- Entered Styx Hub
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Hub" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_CropElysium = 1,
			ModsNikkelMHadesBiomes_OreStyx = 4,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Serpentine",
		Name = {
			en = "Pillars, Serpentine",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: Rustic monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
		},
		FlavorText = {
			en =
			"Your animal familiars may need some convincing to approach these pillars, but they remind you of home, somehow.",
		},
		CosmeticsGroup = "Cosmetic_CauldronPillars01",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Gilded",
		ShopCategory = "CosmeticsShop_Main",
		CameraFocusId = 575873,
		SetAnimationIds = { 575834, 575871, 575872, 575874, 575873, 575832, },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Pillars_Serpentine",
		IconScale = 0.1,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Pillars_Serpentine",
		AnimationScale = 1.9,
		GameStateRequirements = {
			-- Met Megaera
			{
				PathTrue = { "GameState", "RoomsEntered", "A_Boss01" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_CropTartarus = 1,
			ModsNikkelMHadesBiomes_OreTartarus = 4,
		},
	},
	-- #endregion
	-- #region Rugs/Cosmetic_OdysseusRug
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Rug_Ancient",
		Name = {
			en = "Rug, Ancient",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: A time-worn piece, near to where {$Keywords.CharOdysseus} typically resides.",
		},
		FlavorText = {
			en =
			"This storied rug is rumoured to have once belonged to Sisyphus, the Founder and King of the City of Ephyra, which has since fallen into ruin at the hands of the Titan of Time.",
		},
		CosmeticsGroup = "Cosmetic_OdysseusRug",
		InsertAfterCosmetic = "Cosmetic_OdysseusRug",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 591259 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Rug_Ancient",
		IconScale = 0.2,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Rug_Ancient",
		AnimationScale = 2.35,
		GameStateRequirements = {
			-- Met Sisyphus
			{
				PathTrue = { "GameState", "RoomsEntered", "A_Story01" },
			},
		},
		Cost = {
			CosmeticsPoints = 250,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_PlantAsphodel = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Rug_Heroic",
		Name = {
			en = "Rug, Heroic",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: A piece that has seen many spectacles, near to where {$Keywords.CharOdysseus} typically resides.",
		},
		FlavorText = {
			en =
			"This rug emits an aura of valor and strength, and only permits the most worthy of shades to tread upon it.",
		},
		CosmeticsGroup = "Cosmetic_OdysseusRug",
		InsertAfterCosmetic = _PLUGIN.guid .. "." .. "Cosmetic_Rug_Ancient",
		ShopCategory = "CosmeticsShop_Main",
		ActivateIds = { 591259 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Rug_Heroic",
		IconScale = 0.18,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Rug_Heroic",
		AnimationScale = 2.3,
		GameStateRequirements = {
			-- Beaten both Asterius solo and the Champions both
			{
				PathTrue = { "GameState", "EncountersCompletedCache", "MiniBossMinotaur" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_PostBoss01" },
			},
		},
		Cost = {
			CosmeticsPoints = 300,
			ModsNikkelMHadesBiomes_PlantElysium = 3,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
		},
	},
	-- #endregion
	-- #region War Table/Cosmetic_OdysseusTable01
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_War_Table_Heroic",
		Name = {
			en = "War Table, Heroic",
		},
		Description = {
			en =
			"{$Keywords.CosmeticSwap}: To inspire heroic deeds, near to where {$Keywords.CharOdysseus} typically resides.",
		},
		FlavorText = {
			en =
			"Odysseus is no stranger to the logistics of war, and knows well the value of a sturdy table upon which to plan one's campaigns.",
		},
		CosmeticsGroup = "Cosmetic_OdysseusTable01",
		InsertAfterCosmetic = "Cosmetic_OdysseusTable01",
		ShopCategory = "CosmeticsShop_Main",
		SetAnimationIds = { 561464 },
		IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\War_Table_Heroic",
		IconScale = 0.2,
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\War_Table_Heroic",
		AnimationScale = 2,
		GameStateRequirements = {
			-- Beaten the Champions on Extreme Measures
			{
				PathTrue = { "GameState", "EnemyKills", "Theseus2" },
			},
			{
				PathTrue = { "GameState", "EnemyKills", "Minotaur2" },
			},
			NamedRequirements = { "T3Cosmetic" },
		},
		Cost = {
			CosmeticsPoints = 700,
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
		},
	},
	-- #endregion
	-- #region Broker Lantern/Cosmetic_BrokerLantern01
	-- TODO: Temporarily disabled as the glow animation does not look good on the current asset
	-- {
	-- 	Id = _PLUGIN.guid .. "." .. "Cosmetic_Lantern_Infernal",
	-- 	Name = {
	-- 		en = "Lantern, Infernal",
	-- 	},
	-- 	Description = {
	-- 		en =
	-- 		"{$Keywords.CosmeticAltAdd}: A caged shade providing infernal light, near to where the {$Keywords.Broker} typically resides.",
	-- 	},
	-- 	FlavorText = {
	-- 		en =
	-- 		"Some skulls are so numb that they believe they can escape from Tartarus. This one ended up in the Crossroads, it is unclear how.",
	-- 	},
	-- 	CosmeticsGroup = "Cosmetic_BrokerLantern01",
	-- 	InsertAfterCosmetic = "Cosmetic_BrokerLantern01",
	-- 	ShopCategory = "CosmeticsShop_Main",
	-- 	ActivateIds = { 743049 },
	-- 	DeactivateIds = { 743058, 743060, 743057, 743061, 743059, 743063 },
	-- 	SetAnimationIds = { 743049 },
	-- 	IconPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Lantern_Infernal",
	-- 	IconScale = 0.6,
	-- 	CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Lantern_Infernal",
	-- 	AnimationScale = 4,
	-- 	GameStateRequirements = {
	-- 		{
	-- 			PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeMarket" }
	-- 		},
	-- 		{
	-- 			Path = { "GameState", "EnemyKills", "HadesSwarmer" },
	-- 			Comparison = ">=",
	-- 			Value = 100,
	-- 		},
	-- 	},
	-- 	Cost = {
	-- 		CosmeticsPoints = 300,
	-- 		ModsNikkelMHadesBiomes_BossResourceTartarus = 1,
	-- 		ModsNikkelMHadesBiomes_PlantTartarus = 2,
	-- 	},
	-- 	RevealReactionVoiceLines = {
	-- 		{
	-- 			PreLineWait = 0.35,
	-- 			UsePlayerSource = true,
	-- 			{ Cue = "/VO/Melinoe_4137", Text = "I think a hanging light would go quite nicely over there." },
	-- 		},
	-- 		{ GlobalVoiceLines = "DoraCosmeticReactionVoiceLines" },
	-- 	},
	-- },
	-- #endregion
}
for _, cosmeticData in ipairs(mainHubAreaCosmetics) do
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end
