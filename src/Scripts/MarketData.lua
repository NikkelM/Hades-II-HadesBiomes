-- #region Fish
local newMarketFishValues = {
	{
		BuyName = "MetaCurrency",
		BuyAmount = 20,
		Cost = {
			Fish_Tartarus_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 40,
		Cost = {
			Fish_Tartarus_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 75,
		Cost = {
			Fish_Tartarus_Legendary_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 24,
		Cost = {
			Fish_Asphodel_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 48,
		Cost = {
			Fish_Asphodel_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 84,
		Cost = {
			Fish_Asphodel_Legendary_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 28,
		Cost = {
			Fish_Elysium_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 56,
		Cost = {
			Fish_Elysium_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 98,
		Cost = {
			Fish_Elysium_Legendary_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 32,
		Cost = {
			Fish_Styx_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 64,
		Cost = {
			Fish_Styx_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 112,
		Cost = {
			Fish_Styx_Legendary_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 44,
		Cost = {
			Fish_Surface_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 74,
		Cost = {
			Fish_Surface_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 168,
		Cost = {
			Fish_Surface_Legendary_01 = 1,
		},
		Priority = true,
	},
}
-- #endregion

-- #region Ore/PickaxePoint
local newMarketOreValues = {
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 27,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_OreTartarus = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 33,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_OreAsphodel = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 40,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_OreElysium = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 47,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_OreStyx = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
}
-- #endregion

for _, category in ipairs(game.ScreenData.MarketScreen.ItemCategories) do
	-- Fish
	if category.Name == "MarketScreen_Sell" then
		category = game.ConcatTableValuesIPairs(category, newMarketFishValues) or {}
	end
	-- Ore
	if category.Name == "MarketScreen_Exchange" then
		category = game.ConcatTableValuesIPairs(category, newMarketOreValues) or {}
	end
end
