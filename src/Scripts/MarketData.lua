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

-- #region Resource Trades
local regionTradeOrder = { "Tartarus", "Asphodel", "Elysium", "Styx" }
local resourceTypeTradeOrder = { "Plant", "Crop", "Ore", "BossResource" }
local vanillaTradeTargets = {
	Tartarus = {
		Plant = { "PlantFMoly", "PlantNMoss" },
		Crop = { "PlantFNightshade", "PlantNGarlic" },
		Ore = { "OreFSilver", "OreNBronze" },
		BossResource = { "MixerFBoss", "MixerNBoss" },
	},
	Asphodel = {
		Plant = { "PlantGLotus", "PlantODriftwood" },
		Crop = { "PlantGCattail", "PlantOMandrake" },
		Ore = { "OreGLime", "OreOIron" },
		BossResource = { "MixerGBoss", "MixerOBoss" },
	},
	Elysium = {
		Plant = { "PlantHMyrtle", "PlantPIris" },
		Crop = { "PlantHWheat", "PlantPOlive" },
		Ore = { "OreHGlassrock", "OrePAdamant" },
		BossResource = { "MixerHBoss", "MixerPBoss" },
	},
	Styx = {
		Plant = { "PlantIShaderot", "PlantQFang" },
		Crop = { "PlantIPoppy", "PlantQSnakereed" },
		Ore = { "OreIMarble", "OreQScales" },
		BossResource = { "MixerIBoss", "MixerQBoss" },
	},
}

local genericTradePurchaseSound = "/Leftovers/World Sounds/Caravan Interior/MushroomLogInteract"
local tradePurchaseSounds = {
	MixerFBoss = "/SFX/HeatCollectionPickupReverse2",
	MixerNBoss = "/SFX/WoolPickup",
	MixerOBoss = "/SFX/ApplePickup",
	MixerHBoss = "/SFX/TearPickup",
	MixerPBoss = "/SFX/FeatherPickup",
	MixerIBoss = "/SFX/ChronosZSandPickupSFX",
	MixerQBoss = "/SFX/VoidLensPickupSFX",
}

local newResourceTradeValues = {}
mod.NewBrokerTradeCostResources = {}
for _, region in ipairs(regionTradeOrder) do
	for _, resourceType in ipairs(resourceTypeTradeOrder) do
		local costResource = "ModsNikkelMHadesBiomes_" .. resourceType .. region
		local isBossResource = resourceType == "BossResource"
		table.insert(mod.NewBrokerTradeCostResources, costResource)

		for _, buyResource in ipairs(vanillaTradeTargets[region][resourceType]) do
			-- All trades are 2:1
			local tradeValue = {
				BuyName = buyResource,
				BuyAmount = 1,
				Cost = { [costResource] = 2 },
				PurchaseSound = tradePurchaseSounds[buyResource],
			}
			if isBossResource then
				local unlockRequirement = {
					-- Can only trade for boss resources if you already own at least three of the H2 equivalent resources
					Path = { "GameState", "LifetimeResourcesGained", buyResource },
					Comparison = ">=",
					Value = 3,
				}
				if region == "Styx" then
					-- Can only trade for H2 end-boss resources after the ending to prevent softlocks
					unlockRequirement = { PathTrue = { "GameState", "ReachedTrueEnding" } }
				end
				tradeValue.GameStateRequirements = {
					unlockRequirement,
					-- Must know about the resource you're buying
					{ PathTrue = { "GameState", "LifetimeResourcesGained", costResource } },
				}
			else
				tradeValue.PurchaseSound = tradeValue.PurchaseSound or genericTradePurchaseSound
				tradeValue.Priority = true
			end
			table.insert(newResourceTradeValues, tradeValue)
		end
	end
end

-- Add a new category to the broker screen
mod.NewBrokerBossTradeCategory = {
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
		{
			Path = { "GameState", "LifetimeResourcesGained" },
			SumOf = mod.NewBrokerTradeCostResources,
			Comparison = ">=",
			Value = 10,
		},
	},
}
mod.NewBrokerBossTradeCategory = game.ConcatTableValuesIPairs(mod.NewBrokerBossTradeCategory, newResourceTradeValues) or
		{}
table.insert(game.ScreenData.MarketScreen.ItemCategories, mod.NewBrokerBossTradeCategory)
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
