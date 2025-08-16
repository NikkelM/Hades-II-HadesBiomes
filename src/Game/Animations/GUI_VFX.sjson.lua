local hadesTwoGuiVfxFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\GUI_VFX.sjson")

-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoGuiVfxModifications = {}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {
	ModsNikkelMHadesBiomesInfoBannerTartarusIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerTartarusIn",
		FilePath = "GUIModded\\LocationBackings\\TartarusBacking\\TartarusBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
}
local addAnimations = {
	ModsNikkelMHadesBiomesInfoBannerTartarusOut = {
		Name = "ModsNikkelMHadesBiomesInfoBannerTartarusOut",
		InheritFrom = "ModsNikkelMHadesBiomesInfoBannerTartarusIn",
		StartAlpha = 1.0,
		EndAlpha = 0.0,
		Duration = 0.5,
	},
}

sjson.hook(hadesTwoGuiVfxFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addParentAnimations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoGuiVfxModifications)
end)
