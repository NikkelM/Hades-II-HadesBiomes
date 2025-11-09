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

-- #region Boss Resources
local newBossResourceValues = {
	-- Tartarus -> Erebus/Ephyra
	{
		BuyName = "MixerFBoss",
		BuyAmount = 1,
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceTartarus = 2,
		},
		-- ConsumeSound of the drop of the resource you're buying
		PurchaseSound = "/SFX/HeatCollectionPickupReverse2",
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "MixerFBoss" },
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	{
		BuyName = "MixerNBoss",
		BuyAmount = 1,
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceTartarus = 2,
		},
		PurchaseSound = "/SFX/WoolPickup",
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "MixerNBoss" },
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	-- Asphodel -> Oceanus/Thessaly
	{
		BuyName = "MixerGBoss",
		BuyAmount = 1,
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
		},
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "MixerGBoss" },
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	{
		BuyName = "MixerOBoss",
		BuyAmount = 1,
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
		},
		PurchaseSound = "/SFX/ApplePickup",
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "MixerOBoss" },
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	-- Elysium -> Fields/Olympus
	{
		BuyName = "MixerHBoss",
		BuyAmount = 1,
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
		},
		PurchaseSound = "/SFX/TearPickup",
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "MixerHBoss" },
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	{
		BuyName = "MixerPBoss",
		BuyAmount = 1,
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceElysium = 2,
		},
		PurchaseSound = "/SFX/FeatherPickup",
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "MixerPBoss" },
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	-- Styx -> Tartarus/Summit
	{
		BuyName = "MixerIBoss",
		BuyAmount = 1,
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
		},
		PurchaseSound = "/SFX/ChronosZSandPickupSFX",
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},
	},
	{
		BuyName = "MixerQBoss",
		BuyAmount = 1,
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
		},
		PurchaseSound = "/SFX/VoidLensPickupSFX",
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ReachedTrueEnding" },
			},
		},
	},
}
-- Add a new category to the broker screen
local newBrokerBossTradeCategory = {
	Name = "ModsNikkelMHadesBiomes_MarketScreen_Resources",
	Icon = "Portraits\\ModsNikkelMHadesBiomesRunHistory\\RunHistory_Door_Red_72x72",
	CurrencyResourceName = "ModsNikkelMHadesBiomes_BrokerResource",
	-- Need this side to ensure we show the correct icons for the resources (not the other way around)
	FlipSides = false,
	RefreshOncePerRun = true,
	GameStateRequirements = {
		-- To prevent an error when this new category is added while the player is in the Crossroads when installing the mod
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
			Comparison = ">=",
			Value = 1,
		},
	},
}
newBrokerBossTradeCategory = game.ConcatTableValuesIPairs(newBrokerBossTradeCategory, newBossResourceValues) or {}
table.insert(game.ScreenData.MarketScreen.ItemCategories, newBrokerBossTradeCategory)
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
