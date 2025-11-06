-- #region Fish
local newMarketFishValues = {
	{
		BuyName = "MetaCurrency",
		BuyAmount = 25,
		Cost = {
			Fish_Tartarus_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 45,
		Cost = {
			Fish_Tartarus_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 80,
		Cost = {
			Fish_Tartarus_Legendary_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 29,
		Cost = {
			Fish_Asphodel_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 53,
		Cost = {
			Fish_Asphodel_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 89,
		Cost = {
			Fish_Asphodel_Legendary_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 33,
		Cost = {
			Fish_Elysium_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 61,
		Cost = {
			Fish_Elysium_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 103,
		Cost = {
			Fish_Elysium_Legendary_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 37,
		Cost = {
			Fish_Styx_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 69,
		Cost = {
			Fish_Styx_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 117,
		Cost = {
			Fish_Styx_Legendary_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 59,
		Cost = {
			Fish_Surface_Common_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 79,
		Cost = {
			Fish_Surface_Rare_01 = 1,
		},
		Priority = true,
	},
	{
		BuyName = "MetaCurrency",
		BuyAmount = 173,
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
		BuyAmount = 31,
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
		BuyAmount = 37,
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
		BuyAmount = 44,
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
		BuyAmount = 51,
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

-- #region Plants/HarvestPoint
local newMarketPlantValues = {
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 16,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_PlantTartarus = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 18,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_PlantAsphodel = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 20,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_PlantElysium = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 24,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_PlantStyx = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
}
-- #endregion

-- #region Crops/Seeds/ShovelPoint/Garde
local newMarketCropValues = {
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 90,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_CropTartarus = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 110,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_CropAsphodel = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 130,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_CropElysium = 1,
		},
		Priority = true,
		PurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract",
	},
	{
		BuyName = "CosmeticsPoints",
		BuyAmount = 160,
		GameStateRequirements = {
			{
				FunctionName = "HasAllWorldUpgradesRequiringResource",
			},
		},
		Cost = {
			ModsNikkelMHadesBiomes_CropStyx = 1,
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
	if category.Name == "MarketScreen_Exchange" then
		-- The order here is also the order in the game menu
		-- Plants
		category = game.ConcatTableValuesIPairs(category, newMarketPlantValues) or {}
		-- Crops
		category = game.ConcatTableValuesIPairs(category, newMarketCropValues) or {}
		-- Ore
		category = game.ConcatTableValuesIPairs(category, newMarketOreValues) or {}
	end
end
