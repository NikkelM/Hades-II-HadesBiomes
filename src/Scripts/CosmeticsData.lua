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
			"{$Keywords.CosmeticAdd}: A fear-invoking scroll set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
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
			-- TODO: Having beat Hades on EM - use textline when he is defeated?
		},
		Cost = {
			CosmeticsPoints = 500,
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
			"{$Keywords.CosmeticAdd}: A gift from the heavens, set on a standard before the great {#BoldFormatGraftDark}Tree of Life{#Prev}.",
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
			-- TODO
		},
		Cost = {
			CosmeticsPoints = 500,
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
			"{$Keywords.CosmeticAltAdd}: Awe-inspiring monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
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
			-- TODO
		},
		Cost = {
			-- TODO
			CosmeticsPoints = 500,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Gilded",
		Name = {
			en = "Pillars, Gilded",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Ancient monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
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
			-- TODO
		},
		Cost = {
			-- TODO
			CosmeticsPoints = 500,
		},
	},
	{
		Id = _PLUGIN.guid .. "." .. "Cosmetic_Pillars_Serpentine",
		Name = {
			en = "Pillars, Serpentine",
		},
		Description = {
			en =
			"{$Keywords.CosmeticAltAdd}: Rustic monoliths that stand tall to either side of the {#BoldFormatGraftDark}Cauldron{#Prev}.",
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
			-- TODO
		},
		Cost = {
			-- TODO
			CosmeticsPoints = 500,
		},
	},
	-- #endregion
}
for _, cosmeticData in ipairs(mainHubAreaCosmetics) do
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end
