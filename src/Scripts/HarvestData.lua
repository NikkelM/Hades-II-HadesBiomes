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
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Elysium_Rare_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
			{ GlobalVoiceLines = "FishCaughtByCatVoiceLines" },
			{ GlobalVoiceLines = "FishIdentifiedVoiceLines" },
		},
	},
	Fish_Elysium_Legendary_01 = {
		InheritFrom = { "BaseFish" },
		FishIdentifiedVoiceLines = {
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
