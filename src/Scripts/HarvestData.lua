-- #region FishingPoint
local newBiomeFish = {
	Tartarus = {
		{
			Weight = 3,
			Name = "Fish_Tartarus_Common_01",
		},
		{
			Weight = 2,
			Name = "Fish_Tartarus_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Tartarus_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 4,
			Name = "Fish_Tartarus_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Tartarus_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Tartarus_Rare_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
		{
			Weight = 1,
			Name = "Fish_Tartarus_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Tartarus_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 3,
			Name = "Fish_Tartarus_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Tartarus_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Tartarus_Legendary_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
	},
	Asphodel = {
		{
			Weight = 3,
			Name = "Fish_Asphodel_Common_01",
		},
		{
			Weight = 2,
			Name = "Fish_Asphodel_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Asphodel_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 4,
			Name = "Fish_Asphodel_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Asphodel_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Asphodel_Rare_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
		{
			Weight = 1,
			Name = "Fish_Asphodel_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Asphodel_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 3,
			Name = "Fish_Asphodel_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Asphodel_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Asphodel_Legendary_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
	},
	Elysium = {
		{
			Weight = 3,
			Name = "Fish_Elysium_Common_01",
		},
		{
			Weight = 2,
			Name = "Fish_Elysium_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Elysium_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 4,
			Name = "Fish_Elysium_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Elysium_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Elysium_Rare_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
		{
			Weight = 1,
			Name = "Fish_Elysium_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Elysium_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 3,
			Name = "Fish_Elysium_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Elysium_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Elysium_Legendary_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
	},
	Styx = {
		{
			Weight = 3,
			Name = "Fish_Styx_Common_01",
		},
		{
			Weight = 2,
			Name = "Fish_Styx_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Styx_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 4,
			Name = "Fish_Styx_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Styx_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Styx_Rare_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
		{
			Weight = 1,
			Name = "Fish_Styx_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Styx_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 3,
			Name = "Fish_Styx_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Styx_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Styx_Legendary_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
	},
	Surface = {
		{
			Weight = 3,
			Name = "Fish_Surface_Common_01",
		},
		{
			Weight = 2,
			Name = "Fish_Surface_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Surface_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 4,
			Name = "Fish_Surface_Rare_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Surface_Common_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Surface_Rare_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
		{
			Weight = 1,
			Name = "Fish_Surface_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Surface_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		{
			Weight = 3,
			Name = "Fish_Surface_Legendary_01",
			GameStateRequirements = {
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Surface_Rare_01" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "GameState", "LifetimeResourcesGained", "Fish_Surface_Legendary_01" },
					Comparison = "<",
					Value = 1,
				},
			},
		},
	},
}
mod.AddTableKeysSkipDupes(game.FishingData.BiomeFish, newBiomeFish)

local newFishValues = {
	-- #region Tartarus
	Fish_Tartarus_Common_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Tartarus_Rare_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Tartarus_Legendary_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	-- #endregion
	-- #region Asphodel
	Fish_Asphodel_Common_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Asphodel_Rare_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Asphodel_Legendary_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	-- #endregion
	-- #region Elysium
	Fish_Elysium_Common_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "PatroclusFishCaughtVoiceLines" },
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Elysium_Rare_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "PatroclusFishCaughtVoiceLines" },
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Elysium_Legendary_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "PatroclusFishCaughtVoiceLines" },
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	-- #endregion
	-- #region Styx
	Fish_Styx_Common_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Styx_Rare_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Styx_Legendary_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	-- #endregion
	-- #region Surface
	Fish_Surface_Common_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Surface_Rare_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Surface_Legendary_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	-- #endregion
}
mod.AddTableKeysSkipDupes(game.FishingData.FishValues, newFishValues)

-- #endregion

-- #region Ore/PickaxePoint
local newBiomeOre = {
	-- Tartarus
	{
		Weight = 1,
		MaxHealth = 3,
		ResourceName = "ModsNikkelMHadesBiomes_OreTartarus",
		SwingDamage = 1,
		UnavailableAnimation = "PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus_Unavailable",
		Animation = "PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus",
		EmptyAnimation = "PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus_Empty",
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Tartarus", },
			},
		},
	},
	-- Asphodel
	{
		Weight = 1,
		MaxHealth = 3,
		ResourceName = "ModsNikkelMHadesBiomes_OreAsphodel",
		SwingDamage = 1,
		UnavailableAnimation = "PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel_Unavailable",
		Animation = "PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel",
		EmptyAnimation = "PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel_Empty",
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Asphodel", },
			},
		},
	},
	-- Elysium
	{
		Weight = 1,
		MaxHealth = 3,
		ResourceName = "ModsNikkelMHadesBiomes_OreElysium",
		SwingDamage = 1,
		UnavailableAnimation = "PickaxePoint_ModsNikkelMHadesBiomes_OreElysium_Unavailable",
		Animation = "PickaxePoint_ModsNikkelMHadesBiomes_OreElysium",
		EmptyAnimation = "PickaxePoint_ModsNikkelMHadesBiomes_OreElysium_Empty",
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Elysium", },
			},
		},
	},
	-- Styx
	{
		Weight = 1,
		MaxHealth = 3,
		ResourceName = "ModsNikkelMHadesBiomes_OreStyx",
		SwingDamage = 1,
		UnavailableAnimation = "PickaxePoint_ModsNikkelMHadesBiomes_OreStyx_Unavailable",
		Animation = "PickaxePoint_ModsNikkelMHadesBiomes_OreStyx",
		EmptyAnimation = "PickaxePoint_ModsNikkelMHadesBiomes_OreStyx_Empty",
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Styx", },
			},
		},
	},
}
game.PickaxePointData.WeightedOptions = game.ConcatTableValuesIPairs(game.PickaxePointData.WeightedOptions, newBiomeOre)

-- #endregion

-- #region Exorcism
local newBiomeExorcismData = {
	-- Tartarus
	{
		Weight = 1,
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Tartarus" },
			},
		},
		-- This is custom
		Animation = "3dGhostIdle",
		AttemptsRemaining = 2,
		NumMovesMin = 4,
		NumMovesMax = 4,
		MoveDurationMin = 1.5,
		MoveDurationMax = 2.0,
		InputCheckInterval = 0.1,
		TotalCheckFails = 999,
		ConsecutiveCheckFails = 13,
		AddResources = {
			MemPointsCommon = 40,
		}
	},
	-- Asphodel
	{
		Weight = 1,
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Asphodel" },
			},
		},
		-- This is custom
		Animation = "AsphodelGhostIdle",
		AttemptsRemaining = 2,
		NumMovesMin = 5,
		NumMovesMax = 5,
		MoveDurationMin = 1.0,
		MoveDurationMax = 1.4,
		InputCheckInterval = 0.1,
		TotalCheckFails = 999,
		ConsecutiveCheckFails = 10,
		AddResources = {
			MemPointsCommon = 50,
		}
	},
	-- Elysium
	{
		Weight = 1,
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Elysium" },
			},
		},
		-- This is custom
		Animation = "ElysiumGhostIdle",
		AttemptsRemaining = 2,
		NumMovesMin = 6,
		NumMovesMax = 6,
		MoveDurationMin = 0.6,
		MoveDurationMax = 0.8,
		InputCheckInterval = 0.1,
		TotalCheckFails = 999,
		ConsecutiveCheckFails = 9,
		AddResources = {
			MemPointsCommon = 45,
		}
	},
	-- Styx
	{
		Weight = 1,
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Styx" },
			},
		},
		-- This is custom
		Animation = "3dGhostIdle",
		AttemptsRemaining = 2,
		NumMovesMin = 7,
		NumMovesMax = 7,
		MoveDurationMin = 0.345,
		MoveDurationMax = 0.460,
		InputCheckInterval = 0.1,
		TotalCheckFails = 999,
		ConsecutiveCheckFails = 8,
		AddResources = {
			MemPointsCommon = 55,
		}
	},
}
game.ExorcismData.WeightedOptions = game.ConcatTableValuesIPairs(game.ExorcismData.WeightedOptions, newBiomeExorcismData)

-- #endregion

-- #region Plants/HarvestPoint
local newBiomePlants = {
	-- Tartarus
	{
		Weight = 15,
		Animation = "HarvestPoint_ModsNikkelMHadesBiomes_PlantTartarus",
		EmptyAnimation = "HarvestPoint_ModsNikkelMHadesBiomes_PlantTartarus_Used",
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Tartarus", },
			},
		},
		AddResources = {
			ModsNikkelMHadesBiomes_PlantTartarus = 1,
		},
	},
	-- Asphodel
	{
		Weight = 15,
		Animation = "HarvestPoint_ModsNikkelMHadesBiomes_PlantAsphodel",
		EmptyAnimation = "HarvestPoint_ModsNikkelMHadesBiomes_PlantAsphodel_Used",
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Asphodel", },
			},
		},
		AddResources = {
			ModsNikkelMHadesBiomes_PlantAsphodel = 1,
		},
	},
	-- Elysium
	{
		Weight = 15,
		Animation = "HarvestPoint_ModsNikkelMHadesBiomes_PlantElysium",
		EmptyAnimation = "HarvestPoint_ModsNikkelMHadesBiomes_PlantElysium_Used",
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Elysium", },
			},
		},
		AddResources = {
			ModsNikkelMHadesBiomes_PlantElysium = 1,
		},
	},
	-- Styx
	{
		Weight = 15,
		Animation = "HarvestPoint_ModsNikkelMHadesBiomes_PlantStyx",
		EmptyAnimation = "HarvestPoint_ModsNikkelMHadesBiomes_PlantStyx_Used",
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Styx", },
			},
		},
		AddResources = {
			ModsNikkelMHadesBiomes_PlantStyx = 1,
		},
	},
}
game.HarvestData.WeightedOptions = game.ConcatTableValuesIPairs(game.HarvestData.WeightedOptions, newBiomePlants)
-- #endregion

-- #region Seeds/ShovelPoints
local newBiomeShovelPointSeeds = {
	-- Tartarus
	{
		Weight = 4,
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Tartarus", },
			},
		},
		AddResources = {
			ModsNikkelMHadesBiomes_SeedTartarus = 1,
		},
	},
	-- Asphodel
	{
		Weight = 4,
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Asphodel", },
			},
		},
		AddResources = {
			ModsNikkelMHadesBiomes_SeedAsphodel = 1,
		},
	},
	-- Elysium
	{
		Weight = 4,
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Elysium", },
			},
		},
		AddResources = {
			ModsNikkelMHadesBiomes_SeedElysium = 1,
		},
	},
	-- Styx
	{
		Weight = 4,
		GameStateRequirements = {
			{
				PathFromArgs = true,
				Path = { "RoomSetName" },
				IsAny = { "Styx", },
			},
		},
		AddResources = {
			ModsNikkelMHadesBiomes_SeedStyx = 1,
		},
	},
}
game.ShovelPointData.WeightedOptions = game.ConcatTableValuesIPairs(game.ShovelPointData.WeightedOptions, newBiomeShovelPointSeeds)
-- #endregion
