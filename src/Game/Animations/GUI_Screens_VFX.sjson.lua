local hadesTwoScreensVFXFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Screens_VFX.sjson")

local hadesTwoScreenVFXModifications = {}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {}

local addAnimations = {
	ModsNikkelMHadesBiomes_VictoryScreenIllustration_Elysium = {
		Name = "ModsNikkelMHadesBiomes_VictoryScreenIllustration_Elysium",
		InheritFrom = "VictoryScreenIllustration_Underworld",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\VictoryScreen\\VictoryScreenBackground_Elysium",
	},
}

sjson.hook(hadesTwoScreensVFXFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addParentAnimations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoScreenVFXModifications)
end)
