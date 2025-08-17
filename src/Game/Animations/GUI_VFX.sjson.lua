local hadesTwoGuiVfxFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\GUI_VFX.sjson")

-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoGuiVfxModifications = {}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {
	-- Location intros
	ModsNikkelMHadesBiomesInfoBannerTartarusIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerTartarusIn",
		FilePath = "GUIModded\\LocationBackings\\TartarusBacking\\TartarusBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
	ModsNikkelMHadesBiomesInfoBannerAsphodelIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerAsphodelIn",
		FilePath = "GUIModded\\LocationBackings\\AsphodelBacking\\AsphodelBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
	ModsNikkelMHadesBiomesInfoBannerElysiumIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerElysiumIn",
		FilePath = "GUIModded\\LocationBackings\\ElysiumBacking\\ElysiumBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
	ModsNikkelMHadesBiomesInfoBannerStyxIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerStyxIn",
		FilePath = "GUIModded\\LocationBackings\\StyxBacking\\StyxBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
}
local addAnimations = {
	-- Location intros
	ModsNikkelMHadesBiomesInfoBannerTartarusOut = {
		Name = "ModsNikkelMHadesBiomesInfoBannerTartarusOut",
		InheritFrom = "ModsNikkelMHadesBiomesInfoBannerTartarusIn",
		StartAlpha = 1.0,
		EndAlpha = 0.0,
		Duration = 0.5,
	},
	ModsNikkelMHadesBiomesInfoBannerAsphodelOut = {
		Name = "ModsNikkelMHadesBiomesInfoBannerAsphodelOut",
		InheritFrom = "ModsNikkelMHadesBiomesInfoBannerAsphodelIn",
		StartAlpha = 1.0,
		EndAlpha = 0.0,
		Duration = 0.5,
	},
	ModsNikkelMHadesBiomesInfoBannerElysiumOut = {
		Name = "ModsNikkelMHadesBiomesInfoBannerElysiumOut",
		InheritFrom = "ModsNikkelMHadesBiomesInfoBannerElysiumIn",
		StartAlpha = 1.0,
		EndAlpha = 0.0,
		Duration = 0.5,
	},
	ModsNikkelMHadesBiomesInfoBannerStyxOut = {
		Name = "ModsNikkelMHadesBiomesInfoBannerStyxOut",
		InheritFrom = "ModsNikkelMHadesBiomesInfoBannerStyxIn",
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
