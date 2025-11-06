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

-- #region All
-- The category tab in the inventory containing all new resources
-- Order should be Plants, Seed, Harvest, Ore, Fish
local moddedResourcesInventoryOrder = {
	-- Plants
	"ModsNikkelMHadesBiomes_PlantTartarus",
	"ModsNikkelMHadesBiomes_PlantAsphodel",
	"ModsNikkelMHadesBiomes_PlantElysium",
	"ModsNikkelMHadesBiomes_PlantStyx",
	-- Ore
	"ModsNikkelMHadesBiomes_OreTartarus",
	"ModsNikkelMHadesBiomes_OreAsphodel",
	"ModsNikkelMHadesBiomes_OreElysium",
	"ModsNikkelMHadesBiomes_OreStyx",
	-- Fish
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
}

local newModdedInventoryItemCategory = {
	Name = "InventoryScreen_ModesNikkelMHadesBiomesTab",
	Icon = "Portraits\\ModsNikkelMHadesBiomesRunHistory\\RunHistory_Door_Red_72x72",
	OpenAnimation = "InventoryScreenInGrid",
	CloseAnimation = "InventoryScreenOutGrid",
	GameStateRequirements = {
		{
			Path = { "GameState", "LifetimeResourcesGained" },
			HasAny = moddedResourcesInventoryOrder,
		}
	},
}
newModdedInventoryItemCategory = game.ConcatTableValuesIPairs(newModdedInventoryItemCategory,
	moddedResourcesInventoryOrder)
-- Insert between Fish and Forget-Me-Nots
table.insert(game.ScreenData.InventoryScreen.ItemCategories, 5, newModdedInventoryItemCategory)

-- The order in which resources are shown in cost menus when buying things
-- In Hades II, this is each resource for a region after another, then the next region
-- Order should be Plants, Seed, Harvest, Ore, Fish
local newResourceDisplayOrderData = {
	-- #region Tartarus
	"ModsNikkelMHadesBiomes_PlantTartarus",
	"ModsNikkelMHadesBiomes_OreTartarus",
	"Fish_Tartarus_Common_01",
	"Fish_Tartarus_Rare_01",
	"Fish_Tartarus_Legendary_01",
	-- #endregion
	-- #region Asphodel
	"ModsNikkelMHadesBiomes_PlantAsphodel",
	"ModsNikkelMHadesBiomes_OreAsphodel",
	"Fish_Asphodel_Common_01",
	"Fish_Asphodel_Rare_01",
	"Fish_Asphodel_Legendary_01",
	-- #endregion
	-- #region Elysium
	"ModsNikkelMHadesBiomes_PlantElysium",
	"ModsNikkelMHadesBiomes_OreElysium",
	"Fish_Elysium_Common_01",
	"Fish_Elysium_Rare_01",
	"Fish_Elysium_Legendary_01",
	-- #endregion
	-- #region Styx
	"ModsNikkelMHadesBiomes_PlantStyx",
	"ModsNikkelMHadesBiomes_OreStyx",
	"Fish_Styx_Common_01",
	"Fish_Styx_Rare_01",
	"Fish_Styx_Legendary_01",
	-- #endregion
	-- #region Surface
	"Fish_Surface_Common_01",
	"Fish_Surface_Rare_01",
	"Fish_Surface_Legendary_01",
	-- #endregion
}
game.ResourceDisplayOrderData = game.ConcatTableValuesIPairs(game.ResourceDisplayOrderData, newResourceDisplayOrderData)
-- #endregion
