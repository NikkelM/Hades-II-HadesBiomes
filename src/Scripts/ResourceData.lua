-- #region Fishing
-- General data for each fish
local newFishData = {
	-- #region Tartarus
	Fish_Tartarus_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Tartarus_Common",
		TextIconPath = "GUIModded\\Screens\\Fish\\Tartarus_Common_Text",
		CostTextId = "Fish_Tartarus_Common_01",
	},
	Fish_Tartarus_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Tartarus_Rare",
		TextIconPath = "GUIModded\\Screens\\Fish\\Tartarus_Rare_Text",
		CostTextId = "Fish_Tartarus_Rare_01",
	},
	Fish_Tartarus_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Tartarus_Legendary",
		TextIconPath = "GUIModded\\Screens\\Fish\\Tartarus_Legendary_Text",
		CostTextId = "Fish_Tartarus_Legendary_01",
	},
	-- #endregion
	-- #region Asphodel
	Fish_Asphodel_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Asphodel_Common",
		TextIconPath = "GUIModded\\Screens\\Fish\\Asphodel_Common_Text",
		CostTextId = "Fish_Asphodel_Common_01",
	},
	Fish_Asphodel_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Asphodel_Rare",
		TextIconPath = "GUIModded\\Screens\\Fish\\Asphodel_Rare_Text",
		CostTextId = "Fish_Asphodel_Rare_01",
	},
	Fish_Asphodel_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Asphodel_Legendary",
		TextIconPath = "GUIModded\\Screens\\Fish\\Asphodel_Legendary_Text",
		CostTextId = "Fish_Asphodel_Legendary_01",
	},
	-- #endregion
	-- #region Elysium
	Fish_Elysium_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Elysium_Common",
		TextIconPath = "GUIModded\\Screens\\Fish\\Elysium_Common_Text",
		CostTextId = "Fish_Elysium_Common_01",
	},
	Fish_Elysium_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Elysium_Rare",
		TextIconPath = "GUIModded\\Screens\\Fish\\Elysium_Rare_Text",
		CostTextId = "Fish_Elysium_Rare_01",
	},
	Fish_Elysium_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Elysium_Legendary",
		TextIconPath = "GUIModded\\Screens\\Fish\\Elysium_Legendary_Text",
		CostTextId = "Fish_Elysium_Legendary_01",
	},
	-- #endregion
	-- #region Styx
	Fish_Styx_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Styx_Common",
		TextIconPath = "GUIModded\\Screens\\Fish\\Styx_Common_Text",
		CostTextId = "Fish_Styx_Common_01",
	},
	Fish_Styx_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Styx_Rare",
		TextIconPath = "GUIModded\\Screens\\Fish\\Styx_Rare_Text",
		CostTextId = "Fish_Styx_Rare_01",
	},
	Fish_Styx_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Styx_Legendary",
		TextIconPath = "GUIModded\\Screens\\Fish\\Styx_Legendary_Text",
		CostTextId = "Fish_Styx_Legendary_01",
	},
	-- #endregion
	-- #region Surface
	Fish_Surface_Common_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Surface_Common",
		TextIconPath = "GUIModded\\Screens\\Fish\\Surface_Common_Text",
		CostTextId = "Fish_Surface_Common_01",
	},
	Fish_Surface_Rare_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Surface_Rare",
		TextIconPath = "GUIModded\\Screens\\Fish\\Surface_Rare_Text",
		CostTextId = "Fish_Surface_Rare_01",
	},
	Fish_Surface_Legendary_01 = {
		InheritFrom = { "BaseResource", "BaseFish" },
		IconPath = "GUIModded\\Screens\\Fish\\Surface_Legendary",
		TextIconPath = "GUIModded\\Screens\\Fish\\Surface_Legendary_Text",
		CostTextId = "Fish_Surface_Legendary_01",
	},
	-- #endregion
}
mod.AddTableKeysSkipDupes(game.ResourceData, newFishData)
-- #endregion

-- #region All
-- The category tab in the inventory containing all new resources
local moddedResourcesInventoryOrder = {
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
newModdedInventoryItemCategory = game.ConcatTableValuesIPairs(newModdedInventoryItemCategory, moddedResourcesInventoryOrder)
-- Insert between Fish and Forget-Me-Nots
table.insert(game.ScreenData.InventoryScreen.ItemCategories, 5, newModdedInventoryItemCategory)

-- The order in which resources are shown in cost menus when buying things
-- In Hades II, this is each resource for a region after another, then the next region
local newResourceDisplayOrderData = {
	-- #region Tartarus
	"Fish_Tartarus_Common_01",
	"Fish_Tartarus_Rare_01",
	"Fish_Tartarus_Legendary_01",
	-- #endregion
	-- #region Asphodel
	"Fish_Asphodel_Common_01",
	"Fish_Asphodel_Rare_01",
	"Fish_Asphodel_Legendary_01",
	-- #endregion
	-- #region Elysium
	"Fish_Elysium_Common_01",
	"Fish_Elysium_Rare_01",
	"Fish_Elysium_Legendary_01",
	-- #endregion
	-- #region Styx
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
