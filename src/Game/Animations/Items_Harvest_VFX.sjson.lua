local hadesTwoItemsHarvestVfxFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Items_Harvest_VFX.sjson")

-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoItemsHarvestVfxModifications = {}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {
	-- #region Ore/PickaxePoint
	PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus",
		InheritFrom = "HarvestPoint",
		FilePath = "GUIModded\\Screens\\Resources\\Ore\\OreTartarusUnharvested",
		VisualFx = "PickaxePointGlint",
		VisualFxIntervalMin = 0.6,
		VisualFxIntervalMax = 0.7,
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		Scale = 0.5,
		OffsetY = 0,
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus_Empty = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus_Empty",
		FilePath = "GUIModded\\Screens\\Resources\\Ore\\OreTartarusHarvested",
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		Scale = 0.5,
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel",
		InheritFrom = "HarvestPoint",
		FilePath = "GUIModded\\Screens\\Resources\\Ore\\OreAsphodelUnharvested",
		VisualFx = "PickaxePointGlint",
		VisualFxIntervalMin = 0.6,
		VisualFxIntervalMax = 0.7,
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		Scale = 0.5,
		OffsetY = 0,
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel_Empty = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel_Empty",
		FilePath = "GUIModded\\Screens\\Resources\\Ore\\OreAsphodelHarvested",
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		Scale = 0.5,
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreElysium = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreElysium",
		InheritFrom = "HarvestPoint",
		FilePath = "GUIModded\\Screens\\Resources\\Ore\\OreElysiumUnharvested",
		VisualFx = "PickaxePointGlint",
		VisualFxIntervalMin = 0.6,
		VisualFxIntervalMax = 0.7,
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		Scale = 0.5,
		OffsetY = 0,
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreElysium_Empty = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreElysium_Empty",
		FilePath = "GUIModded\\Screens\\Resources\\Ore\\OreElysiumHarvested",
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		Scale = 0.5,
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreStyx = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreStyx",
		InheritFrom = "HarvestPoint",
		FilePath = "GUIModded\\Screens\\Resources\\Ore\\OreStyxUnharvested",
		VisualFx = "PickaxePointGlint",
		VisualFxIntervalMin = 0.6,
		VisualFxIntervalMax = 0.7,
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		Scale = 0.5,
		OffsetY = 0,
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreStyx_Empty = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreStyx_Empty",
		FilePath = "GUIModded\\Screens\\Resources\\Ore\\OreStyxHarvested",
		EndFrame = 1,
		NumFrames = 1,
		StartFrame = 1,
		Scale = 0.5,
	},
	-- #endregion
}
local addAnimations = {
	-- #region Ore/PickaxePoint
	PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus_Unavailable = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus_Unavailable",
		InheritFrom = "PickaxePoint_ModsNikkelMHadesBiomes_OreTartarus",
		VisualFx = "null",
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel_Unavailable = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel_Unavailable",
		InheritFrom = "PickaxePoint_ModsNikkelMHadesBiomes_OreAsphodel",
		VisualFx = "null",
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreElysium_Unavailable = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreElysium_Unavailable",
		InheritFrom = "PickaxePoint_ModsNikkelMHadesBiomes_OreElysium",
		VisualFx = "null",
	},
	PickaxePoint_ModsNikkelMHadesBiomes_OreStyx_Unavailable = {
		Name = "PickaxePoint_ModsNikkelMHadesBiomes_OreStyx_Unavailable",
		InheritFrom = "PickaxePoint_ModsNikkelMHadesBiomes_OreStyx",
		VisualFx = "null",
	},
	-- #endregion
	-- #region Plants/HarvestPoint
	HarvestPoint_ModsNikkelMHadesBiomes_PlantTartarus = {
		Name = "HarvestPoint_ModsNikkelMHadesBiomes_PlantTartarus",
		InheritFrom = "HarvestPoint",
		FilePath = "GUIModded\\Screens\\Resources\\Plants\\PlantTartarusUnharvested",
		OffsetY = 0.0,
		Scale = 0.4,
	},
	HarvestPoint_ModsNikkelMHadesBiomes_PlantTartarus_Used = {
		Name = "HarvestPoint_ModsNikkelMHadesBiomes_PlantTartarus_Used",
		InheritFrom = "HarvestPointUsed",
		FilePath = "GUIModded\\Screens\\Resources\\Plants\\PlantTartarusHarvested",
		OffsetY = 0.0,
		Scale = 0.4,
		ClearCreateAnimations = true,
	},
	HarvestPoint_ModsNikkelMHadesBiomes_PlantAsphodel = {
		Name = "HarvestPoint_ModsNikkelMHadesBiomes_PlantAsphodel",
		InheritFrom = "HarvestPoint",
		FilePath = "GUIModded\\Screens\\Resources\\Plants\\PlantAsphodelUnharvested",
		OffsetY = 0.0,
		Scale = 0.4,
	},
	HarvestPoint_ModsNikkelMHadesBiomes_PlantAsphodel_Used = {
		Name = "HarvestPoint_ModsNikkelMHadesBiomes_PlantAsphodel_Used",
		InheritFrom = "HarvestPointUsed",
		FilePath = "GUIModded\\Screens\\Resources\\Plants\\PlantAsphodelHarvested",
		OffsetY = 0.0,
		Scale = 0.4,
		ClearCreateAnimations = true,
	},
	HarvestPoint_ModsNikkelMHadesBiomes_PlantElysium = {
		Name = "HarvestPoint_ModsNikkelMHadesBiomes_PlantElysium",
		InheritFrom = "HarvestPoint",
		FilePath = "GUIModded\\Screens\\Resources\\Plants\\PlantElysiumUnharvested",
		OffsetY = 0.0,
		Scale = 0.4,
	},
	HarvestPoint_ModsNikkelMHadesBiomes_PlantElysium_Used = {
		Name = "HarvestPoint_ModsNikkelMHadesBiomes_PlantElysium_Used",
		InheritFrom = "HarvestPointUsed",
		FilePath = "GUIModded\\Screens\\Resources\\Plants\\PlantElysiumHarvested",
		OffsetY = 0.0,
		Scale = 0.4,
	},
	HarvestPoint_ModsNikkelMHadesBiomes_PlantStyx = {
		Name = "HarvestPoint_ModsNikkelMHadesBiomes_PlantStyx",
		InheritFrom = "HarvestPoint",
		FilePath = "GUIModded\\Screens\\Resources\\Plants\\PlantStyxUnharvested",
		OffsetY = 0.0,
		Scale = 0.4,
	},
	HarvestPoint_ModsNikkelMHadesBiomes_PlantStyx_Used = {
		Name = "HarvestPoint_ModsNikkelMHadesBiomes_PlantStyx_Used",
		InheritFrom = "HarvestPointUsed",
		FilePath = "GUIModded\\Screens\\Resources\\Plants\\PlantStyxHarvested",
		OffsetY = 0.0,
		Scale = 0.4,
	},
	-- #endregion
	-- #region Crops/ShovelPoint/Garden
	ModsNikkelMHadesBiomes_CropTartarus_Sprouted = {
		Name = "ModsNikkelMHadesBiomes_CropTartarus_Sprouted",
		InheritFrom = "PlantBaseSprouted",
		FilePath = "GUIModded\\Screens\\Resources\\Crops\\CropTartarusSprouted",
	},
	ModsNikkelMHadesBiomes_CropTartarus_ReadyToHarvest = {
		Name = "ModsNikkelMHadesBiomes_CropTartarus_ReadyToHarvest",
		InheritFrom = "PlantBaseReadyToHarvest",
		FilePath = "GUIModded\\Screens\\Resources\\Crops\\CropTartarusUnharvested",
	},
	ModsNikkelMHadesBiomes_CropAsphodel_Sprouted = {
		Name = "ModsNikkelMHadesBiomes_CropAsphodel_Sprouted",
		InheritFrom = "PlantBaseSprouted",
		FilePath = "GUIModded\\Screens\\Resources\\Crops\\CropAsphodelSprouted",
	},
	ModsNikkelMHadesBiomes_CropAsphodel_ReadyToHarvest = {
		Name = "ModsNikkelMHadesBiomes_CropAsphodel_ReadyToHarvest",
		InheritFrom = "PlantBaseReadyToHarvest",
		FilePath = "GUIModded\\Screens\\Resources\\Crops\\CropAsphodelUnharvested",
	},
	ModsNikkelMHadesBiomes_CropElysium_Sprouted = {
		Name = "ModsNikkelMHadesBiomes_CropElysium_Sprouted",
		InheritFrom = "PlantBaseSprouted",
		FilePath = "GUIModded\\Screens\\Resources\\Crops\\CropElysiumSprouted",
	},
	ModsNikkelMHadesBiomes_CropElysium_ReadyToHarvest = {
		Name = "ModsNikkelMHadesBiomes_CropElysium_ReadyToHarvest",
		InheritFrom = "PlantBaseReadyToHarvest",
		FilePath = "GUIModded\\Screens\\Resources\\Crops\\CropElysiumUnharvested",
	},
	ModsNikkelMHadesBiomes_CropStyx_Sprouted = {
		Name = "ModsNikkelMHadesBiomes_CropStyx_Sprouted",
		InheritFrom = "PlantBaseSprouted",
		FilePath = "GUIModded\\Screens\\Resources\\Crops\\CropStyxSprouted",
	},
	ModsNikkelMHadesBiomes_CropStyx_ReadyToHarvest = {
		Name = "ModsNikkelMHadesBiomes_CropStyx_ReadyToHarvest",
		InheritFrom = "PlantBaseReadyToHarvest",
		FilePath = "GUIModded\\Screens\\Resources\\Crops\\CropStyxUnharvested",
	},
	-- #endregion
}

sjson.hook(hadesTwoItemsHarvestVfxFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addParentAnimations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoItemsHarvestVfxModifications)
end)
