local hadesTwoGuiVfxFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_VFX.sjson")

-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoGuiVfxModifications = {}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {
	-- #region Location intros
	ModsNikkelMHadesBiomesInfoBannerTartarusIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerTartarusIn",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\LocationBackings\\TartarusBacking\\TartarusBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
	ModsNikkelMHadesBiomesInfoBannerAsphodelIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerAsphodelIn",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\LocationBackings\\AsphodelBacking\\AsphodelBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
	ModsNikkelMHadesBiomesInfoBannerElysiumIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerElysiumIn",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\LocationBackings\\ElysiumBacking\\ElysiumBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
	ModsNikkelMHadesBiomesInfoBannerStyxIn = {
		Name = "ModsNikkelMHadesBiomesInfoBannerStyxIn",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\LocationBackings\\StyxBacking\\StyxBacking",
		OffsetY = 80,
		StartAlpha = 0.0,
		EndAlpha = 1.0,
		Duration = 1.0,
		HoldLastFrame = true,
	},
	-- #endregion
	-- ModsNikkelMHadesBiomesRoomTransitionIn = {
	-- 	Name = "ModsNikkelMHadesBiomesRoomTransitionIn",
	-- 	FilePath = "Screens\\RoomTransition\\RoomTransition",
	-- 	Type = "Book",
	-- -- TODO: The RoomTransition .bik file already exists, so we need to create a new one. Right now, don't know how to correctly rename (issue is likely the .bik_atlas file)
	-- 	VideoTexture = "ModsNikkelMHadesBiomesRoomTransition",
	-- 	EndFrame = 20,
	-- 	HoldLastFrame = true,
	-- 	NumFrames = 20,
	-- 	PlaySpeed = 30.0,
	-- 	StartFrame = 1,
	-- 	Material = "Unlit",
	-- 	OnlyWhenVisible = true,
	-- },
}
local addAnimations = {
	-- #region Location intros
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
	-- #endregion
	-- ModsNikkelMHadesBiomesRoomTransitionOut = {
	-- 	Name = "ModsNikkelMHadesBiomesRoomTransitionOut",
	-- 	InheritFrom = "ModsNikkelMHadesBiomesRoomTransitionIn",
	-- 	EndFrame = 20,
	-- 	HoldLastFrame = false,
	-- 	PlayBackwards = true,
	-- 	StartFrame = 1,
	-- },
}

sjson.hook(hadesTwoGuiVfxFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addParentAnimations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoGuiVfxModifications)
end)
