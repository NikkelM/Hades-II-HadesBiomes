-- Adding new Seeds
local newGardenSeeds = {
	ModsNikkelMHadesBiomes_SeedTartarus = {
		GrowTimeMin = 11,
		GrowTimeMax = 11,
		RandomOutcomes = {
			{
				Weight = 1,
				AddResources = {
					ModsNikkelMHadesBiomes_CropTartarus = 1,
				},
				SproutedAnimation = "ModsNikkelMHadesBiomes_CropTartarus_Sprouted",
				ReadyToHarvestAnimation = "ModsNikkelMHadesBiomes_CropTartarus_ReadyToHarvest",
			},
		},
	},
	ModsNikkelMHadesBiomes_SeedAsphodel = {
		GrowTimeMin = 23,
		GrowTimeMax = 23,
		RandomOutcomes = {
			{
				Weight = 1,
				AddResources = {
					ModsNikkelMHadesBiomes_CropAsphodel = 1,
				},
				SproutedAnimation = "ModsNikkelMHadesBiomes_CropAsphodel_Sprouted",
				ReadyToHarvestAnimation = "ModsNikkelMHadesBiomes_CropAsphodel_ReadyToHarvest",
			},
		},
	},
	ModsNikkelMHadesBiomes_SeedElysium = {
		GrowTimeMin = 45,
		GrowTimeMax = 45,
		RandomOutcomes = {
			{
				Weight = 1,
				AddResources = {
					ModsNikkelMHadesBiomes_CropElysium = 1,
				},
				SproutedAnimation = "ModsNikkelMHadesBiomes_CropElysium_Sprouted",
				ReadyToHarvestAnimation = "ModsNikkelMHadesBiomes_CropElysium_ReadyToHarvest",
			},
		},
	},
	ModsNikkelMHadesBiomes_SeedStyx = {
		GrowTimeMin = 83,
		GrowTimeMax = 83,
		RandomOutcomes = {
			{
				Weight = 1,
				AddResources = {
					ModsNikkelMHadesBiomes_CropStyx = 1,
				},
				SproutedAnimation = "ModsNikkelMHadesBiomes_CropStyx_Sprouted",
				ReadyToHarvestAnimation = "ModsNikkelMHadesBiomes_CropStyx_ReadyToHarvest",
			},
		},
	},
}
mod.AddTableKeysSkipDupes(game.GardenData.Seeds, newGardenSeeds)

-- Adding new seeds as options for SeedMystery
local newSeedMysteryRandomOutcomes = {
	{
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedTartarus" },
				Comparison = ">=",
				Value = 1,
			},
		},
		Weight = 4,
		AddResources = {
			ModsNikkelMHadesBiomes_CropTartarus = 1,
		},
		SproutedAnimation = "ModsNikkelMHadesBiomes_CropTartarus_Sprouted",
		ReadyToHarvestAnimation = "ModsNikkelMHadesBiomes_CropTartarus_ReadyToHarvest",
		BonusSeedName = "ModsNikkelMHadesBiomes_SeedTartarus",
	},
	{
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedAsphodel" },
				Comparison = ">=",
				Value = 1,
			},
		},
		Weight = 3,
		AddResources = {
			ModsNikkelMHadesBiomes_CropAsphodel = 1,
		},
		SproutedAnimation = "ModsNikkelMHadesBiomes_CropAsphodel_Sprouted",
		ReadyToHarvestAnimation = "ModsNikkelMHadesBiomes_CropAsphodel_ReadyToHarvest",
		BonusSeedName = "ModsNikkelMHadesBiomes_SeedAsphodel",
	},
	{
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedElysium" },
				Comparison = ">=",
				Value = 1,
			},
		},
		Weight = 2,
		AddResources = {
			ModsNikkelMHadesBiomes_CropElysium = 1,
		},
		SproutedAnimation = "ModsNikkelMHadesBiomes_CropElysium_Sprouted",
		ReadyToHarvestAnimation = "ModsNikkelMHadesBiomes_CropElysium_ReadyToHarvest",
		BonusSeedName = "ModsNikkelMHadesBiomes_SeedElysium",
	},
	{
		GameStateRequirements = {
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedStyx" },
				Comparison = ">=",
				Value = 1,
			},
		},
		Weight = 1,
		AddResources = {
			ModsNikkelMHadesBiomes_CropStyx = 1,
		},
		SproutedAnimation = "ModsNikkelMHadesBiomes_CropStyx_Sprouted",
		ReadyToHarvestAnimation = "ModsNikkelMHadesBiomes_CropStyx_ReadyToHarvest",
		BonusSeedName = "ModsNikkelMHadesBiomes_SeedStyx",
	},
}
game.GardenData.Seeds.SeedMystery.RandomOutcomes = game.ConcatTableValuesIPairs(
	game.GardenData.Seeds.SeedMystery.RandomOutcomes, newSeedMysteryRandomOutcomes)
