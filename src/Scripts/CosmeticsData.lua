-- For reference:
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
		Id = _PLUGIN.guid .. "Cosmetic_Banner_Infernal",
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
		IconPath = "GUI\\Screens\\CosmeticIcons\\cosmetic_arachneTapestry", -- TODO
		-- IconScale = 1,
		ActivateIds = { 780487 },
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Banner_Infernal",
		AnimationScale = 3.57,
		GameStateRequirements = {
			-- Having beat Hades on EM - use textline when he is defeated?
		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
		},
	},
	{
		Id = _PLUGIN.guid .. "Cosmetic_Banner_Divine",
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
		InsertAfterCosmetic = _PLUGIN.guid .. "Cosmetic_Banner_Infernal",
		ShopCategory = "CosmeticsShop_Main",
		IconPath = "GUI\\Screens\\CosmeticIcons\\cosmetic_arachneTapestry", -- TODO
		-- IconScale = 1,
		ActivateIds = { 780487 },
		CosmeticAnimationPath = "NikkelM-HadesBiomesCosmetics\\Crossroads\\Assets\\Banner_Divine",
		AnimationScale = 3.57,
		GameStateRequirements = {

		},
		Cost = {
			CosmeticsPoints = 500,
			ModsNikkelMHadesBiomes_PlantElysium = 2,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
		},
	},
	-- #endregion
}
for _, cosmeticData in ipairs(mainHubAreaCosmetics) do
	CosmeticsAPI.RegisterCosmetic(cosmeticData)
end
