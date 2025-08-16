local hadesTwoGuiVfxFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\GUI_VFX.sjson")

-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoGuiVfxModifications = {}

-- Make sure to add a Name key!
local addAnimations = {
	ModsNikkelMHadesBiomesInfoBannerTartarusIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerTartarusIn",
		FilePath = "GUIModded\\LocationBackings\\TartarusBacking\\TartarusBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
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
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoGuiVfxModifications)
end)
