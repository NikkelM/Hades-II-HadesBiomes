-- #region Fishing
-- General data for each fish
local newFishData = {
	-- #region Tartarus
	Fish_Tartarus_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Tartarus_Common",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Tartarus_Common_Text",
		CostTextId = "Fish_Tartarus_Common_01",
	},
	Fish_Tartarus_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Tartarus_Rare",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Tartarus_Rare_Text",
		CostTextId = "Fish_Tartarus_Rare_01",
	},
	Fish_Tartarus_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Tartarus_Legendary",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Tartarus_Legendary_Text",
		CostTextId = "Fish_Tartarus_Legendary_01",
	},
	-- #endregion
	-- #region Asphodel
	Fish_Asphodel_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Asphodel_Common",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Asphodel_Common_Text",
		CostTextId = "Fish_Asphodel_Common_01",
	},
	Fish_Asphodel_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Asphodel_Rare",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Asphodel_Rare_Text",
		CostTextId = "Fish_Asphodel_Rare_01",
	},
	Fish_Asphodel_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Asphodel_Legendary",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Asphodel_Legendary_Text",
		CostTextId = "Fish_Asphodel_Legendary_01",
	},
	-- #endregion
	-- #region Elysium
	Fish_Elysium_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Elysium_Common",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Elysium_Common_Text",
		CostTextId = "Fish_Elysium_Common_01",
	},
	Fish_Elysium_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Elysium_Rare",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Elysium_Rare_Text",
		CostTextId = "Fish_Elysium_Rare_01",
	},
	Fish_Elysium_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Elysium_Legendary",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Elysium_Legendary_Text",
		CostTextId = "Fish_Elysium_Legendary_01",
	},
	-- #endregion
	-- #region Styx
	Fish_Styx_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Styx_Common",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Styx_Common_Text",
		CostTextId = "Fish_Styx_Common_01",
	},
	Fish_Styx_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Styx_Rare",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Styx_Rare_Text",
		CostTextId = "Fish_Styx_Rare_01",
	},
	Fish_Styx_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Styx_Legendary",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Styx_Legendary_Text",
		CostTextId = "Fish_Styx_Legendary_01",
	},
	-- #endregion
	-- #region Surface
	Fish_Surface_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Surface_Common",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Surface_Common_Text",
		CostTextId = "Fish_Surface_Common_01",
	},
	Fish_Surface_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Surface_Rare",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Surface_Rare_Text",
		CostTextId = "Fish_Surface_Rare_01",
	},
	Fish_Surface_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Resources\\Fish\\Surface_Legendary",
		TextIconPath = "GUIModded\\Screens\\Resources\\Fish\\Surface_Legendary_Text",
		CostTextId = "Fish_Surface_Legendary_01",
	},
	-- #endregion
}
mod.AddTableKeysSkipDupes(game.ResourceData, newFishData)
-- #endregion

-- #region Ore/PickaxePoint
local newOreData = {
	ModsNikkelMHadesBiomes_OreTartarus = {
		InheritFrom = { "BaseResource", "BaseOre" },
		IconPath = "GUIModded\\Screens\\Resources\\Ore\\OreTartarus",
		TextIconPath = "GUIModded\\Screens\\Resources\\Ore\\OreTartarus_Text",
		TooltipId = "ModsNikkelMHadesBiomes_OreTartarus_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_OreTartarus_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
	ModsNikkelMHadesBiomes_OreAsphodel = {
		InheritFrom = { "BaseResource", "BaseOre" },
		IconPath = "GUIModded\\Screens\\Resources\\Ore\\OreAsphodel",
		TextIconPath = "GUIModded\\Screens\\Resources\\Ore\\OreAsphodel_Text",
		TooltipId = "ModsNikkelMHadesBiomes_OreAsphodel_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_OreAsphodel_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
	ModsNikkelMHadesBiomes_OreElysium = {
		InheritFrom = { "BaseResource", "BaseOre" },
		IconPath = "GUIModded\\Screens\\Resources\\Ore\\OreElysium",
		TextIconPath = "GUIModded\\Screens\\Resources\\Ore\\OreElysium_Text",
		TooltipId = "ModsNikkelMHadesBiomes_OreElysium_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_OreElysium_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
	ModsNikkelMHadesBiomes_OreStyx = {
		InheritFrom = { "BaseResource", "BaseOre" },
		IconPath = "GUIModded\\Screens\\Resources\\Ore\\OreStyx",
		TextIconPath = "GUIModded\\Screens\\Resources\\Ore\\OreStyx_Text",
		TooltipId = "ModsNikkelMHadesBiomes_OreStyx_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_OreStyx_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
}
mod.AddTableKeysSkipDupes(game.ResourceData, newOreData)
-- #endregion

-- #region Plants/HarvestPoint
local newPlantData = {
	ModsNikkelMHadesBiomes_PlantTartarus = {
		InheritFrom = { "BaseResource", "BasePlant" },
		IconPath = "GUIModded\\Screens\\Resources\\Plants\\PlantTartarus",
		TextIconPath = "GUIModded\\Screens\\Resources\\Plants\\PlantTartarus_Text",
		TooltipId = "ModsNikkelMHadesBiomes_PlantTartarus_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_PlantTartarus_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
	ModsNikkelMHadesBiomes_PlantAsphodel = {
		InheritFrom = { "BaseResource", "BasePlant" },
		IconPath = "GUIModded\\Screens\\Resources\\Plants\\PlantAsphodel",
		TextIconPath = "GUIModded\\Screens\\Resources\\Plants\\PlantAsphodel_Text",
		TooltipId = "ModsNikkelMHadesBiomes_PlantAsphodel_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_PlantAsphodel_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
	ModsNikkelMHadesBiomes_PlantElysium = {
		InheritFrom = { "BaseResource", "BasePlant" },
		IconPath = "GUIModded\\Screens\\Resources\\Plants\\PlantElysium",
		TextIconPath = "GUIModded\\Screens\\Resources\\Plants\\PlantElysium_Text",
		TooltipId = "ModsNikkelMHadesBiomes_PlantElysium_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_PlantElysium_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
	ModsNikkelMHadesBiomes_PlantStyx = {
		InheritFrom = { "BaseResource", "BasePlant" },
		IconPath = "GUIModded\\Screens\\Resources\\Plants\\PlantStyx",
		TextIconPath = "GUIModded\\Screens\\Resources\\Plants\\PlantStyx_Text",
		TooltipId = "ModsNikkelMHadesBiomes_PlantStyx_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_PlantStyx_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
}
mod.AddTableKeysSkipDupes(game.ResourceData, newPlantData)
-- #endregion

-- #region Seeds/Crops/ShovelPoint
local newSeedData = {
	ModsNikkelMHadesBiomes_SeedTartarus = {
		InheritFrom = { "BaseResource", "BaseSeed" },
		IconPath = "GUIModded\\Screens\\Resources\\Crops\\CropTartarusSeed",
		TextIconPath = "GUIModded\\Screens\\Resources\\Crops\\CropTartarusSeed_Text",
		TooltipId = "ModsNikkelMHadesBiomes_SeedTartarus_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_SeedTartarus_Short",
		OnAddVoiceLines = {
			{ GlobalVoiceLines = "FoundSeedVoiceLines" },
			{ GlobalVoiceLines = "ResourceFoundVoiceLines" },
		},
	},
	ModsNikkelMHadesBiomes_SeedAsphodel = {
		InheritFrom = { "BaseResource", "BaseSeed" },
		IconPath = "GUIModded\\Screens\\Resources\\Crops\\CropAsphodelSeed",
		TextIconPath = "GUIModded\\Screens\\Resources\\Crops\\CropAsphodelSeed_Text",
		TooltipId = "ModsNikkelMHadesBiomes_SeedAsphodel_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_SeedAsphodel_Short",
		OnAddVoiceLines = {
			{ GlobalVoiceLines = "FoundSeedVoiceLines" },
			{ GlobalVoiceLines = "ResourceFoundVoiceLines" },
		},
	},
	ModsNikkelMHadesBiomes_SeedElysium = {
		InheritFrom = { "BaseResource", "BaseSeed" },
		IconPath = "GUIModded\\Screens\\Resources\\Crops\\CropElysiumSeed",
		TextIconPath = "GUIModded\\Screens\\Resources\\Crops\\CropElysiumSeed_Text",
		TooltipId = "ModsNikkelMHadesBiomes_SeedElysium_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_SeedElysium_Short",
		OnAddVoiceLines = {
			{ GlobalVoiceLines = "FoundSeedVoiceLines" },
			{ GlobalVoiceLines = "ResourceFoundVoiceLines" },
		},
	},
	ModsNikkelMHadesBiomes_SeedStyx = {
		InheritFrom = { "BaseResource", "BaseSeed" },
		IconPath = "GUIModded\\Screens\\Resources\\Crops\\CropStyxSeed",
		TextIconPath = "GUIModded\\Screens\\Resources\\Crops\\CropStyxSeed_Text",
		TooltipId = "ModsNikkelMHadesBiomes_SeedStyx_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_SeedStyx_Short",
		OnAddVoiceLines = {
			{ GlobalVoiceLines = "FoundSeedVoiceLines" },
			{ GlobalVoiceLines = "ResourceFoundVoiceLines" },
		},
	},
}
local newCropData = {
	ModsNikkelMHadesBiomes_CropTartarus = {
		InheritFrom = { "BaseResource" },
		IconPath = "GUIModded\\Screens\\Resources\\Crops\\CropTartarus",
		TextIconPath = "GUIModded\\Screens\\Resources\\Crops\\CropTartarus_Text",
		TooltipId = "ModsNikkelMHadesBiomes_CropTartarus_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_CropTartarus_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
	ModsNikkelMHadesBiomes_CropAsphodel = {
		InheritFrom = { "BaseResource" },
		IconPath = "GUIModded\\Screens\\Resources\\Crops\\CropAsphodel",
		TextIconPath = "GUIModded\\Screens\\Resources\\Crops\\CropAsphodel_Text",
		TooltipId = "ModsNikkelMHadesBiomes_CropAsphodel_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_CropAsphodel_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
	ModsNikkelMHadesBiomes_CropElysium = {
		InheritFrom = { "BaseResource" },
		IconPath = "GUIModded\\Screens\\Resources\\Crops\\CropElysium",
		TextIconPath = "GUIModded\\Screens\\Resources\\Crops\\CropElysium_Text",
		TooltipId = "ModsNikkelMHadesBiomes_CropElysium_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_CropElysium_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
	ModsNikkelMHadesBiomes_CropStyx = {
		InheritFrom = { "BaseResource" },
		IconPath = "GUIModded\\Screens\\Resources\\Crops\\CropStyx",
		TextIconPath = "GUIModded\\Screens\\Resources\\Crops\\CropStyx_Text",
		TooltipId = "ModsNikkelMHadesBiomes_CropStyx_Icon",
		CostTextId = "ModsNikkelMHadesBiomes_CropStyx_Short",
		OnAddVoiceLines = { { GlobalVoiceLines = "ResourceFoundVoiceLines" }, },
	},
}
mod.AddTableKeysSkipDupes(game.ResourceData, newSeedData)
mod.AddTableKeysSkipDupes(game.ResourceData, newCropData)
-- #endregion

-- #region All
-- The order in which resources are shown in cost menus when buying things, and the order of the items in the new inventory tab
-- In Hades II, this is each resource for a region after another, then the next region
-- Order should be Plant, Seed, Crop, Ore. We move the fish to the end as there are a lot of them
local newResourceDisplayOrderData = {
	"ModsNikkelMHadesBiomes_PlantTartarus",
	"ModsNikkelMHadesBiomes_SeedTartarus",
	"ModsNikkelMHadesBiomes_CropTartarus",
	"ModsNikkelMHadesBiomes_OreTartarus",

	"ModsNikkelMHadesBiomes_PlantAsphodel",
	"ModsNikkelMHadesBiomes_SeedAsphodel",
	"ModsNikkelMHadesBiomes_CropAsphodel",
	"ModsNikkelMHadesBiomes_OreAsphodel",

	"ModsNikkelMHadesBiomes_PlantElysium",
	"ModsNikkelMHadesBiomes_SeedElysium",
	"ModsNikkelMHadesBiomes_CropElysium",
	"ModsNikkelMHadesBiomes_OreElysium",

	"ModsNikkelMHadesBiomes_PlantStyx",
	"ModsNikkelMHadesBiomes_SeedStyx",
	"ModsNikkelMHadesBiomes_CropStyx",
	"ModsNikkelMHadesBiomes_OreStyx",

	"Fish_Tartarus_Common_01",
	"Fish_Tartarus_Rare_01",
	"Fish_Tartarus_Legendary_01",
	"Fish_Asphodel_Common_01",
	"Fish_Asphodel_Rare_01",
	"Fish_Asphodel_Legendary_01",
	"Fish_Elysium_Common_01",
	"Fish_Elysium_Rare_01",
	"Fish_Elysium_Legendary_01",
	"Fish_Styx_Common_01",
	"Fish_Styx_Rare_01",
	"Fish_Styx_Legendary_01",
	"Fish_Surface_Common_01",
	"Fish_Surface_Rare_01",
	"Fish_Surface_Legendary_01",
	-- #endregion
}

local newModdedInventoryItemCategory = {
	Name = "InventoryScreen_ModesNikkelMHadesBiomesTab",
	Icon = "Portraits\\ModsNikkelMHadesBiomesRunHistory\\RunHistory_Door_Red_72x72",
	OpenAnimation = "InventoryScreenInGrid",
	CloseAnimation = "InventoryScreenOutGrid",
	GameStateRequirements = {
		{
			Path = { "GameState", "LifetimeResourcesGained" },
			HasAny = newResourceDisplayOrderData,
		}
	},
}
newModdedInventoryItemCategory = game.ConcatTableValuesIPairs(newModdedInventoryItemCategory,
	newResourceDisplayOrderData)
-- Insert between Fish and Forget-Me-Nots
table.insert(game.ScreenData.InventoryScreen.ItemCategories, 5, newModdedInventoryItemCategory)

game.ResourceDisplayOrderData = game.ConcatTableValuesIPairs(game.ResourceDisplayOrderData, newResourceDisplayOrderData)
-- #endregion
