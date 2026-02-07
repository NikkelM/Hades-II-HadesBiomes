local hadesTwoPortraitsFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Portraits_VFX.sjson")

local hadesTwoPortraitModifications = {
	Portrait_Hades_HelmCape_01 = {
		OffsetY = -90,
	},
	Portrait_Hades_HelmCape_01_Exit = {
		OffsetY = -90,
	},
}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {
	-- #region Dialogue Backgrounds
	ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_In = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_In",
		Scale = 1,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundTartarus",
		VideoTexture = "HadesBiomesDiaBackTartarus",
		NumFrames = 32,
		StartFrame = 1,
		EndFrame = 32,
		HoldLastFrame = false,
		FlipHorizontal = true,
		Loop = false,
		PlaySpeed = 50,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Asphodel_In = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Asphodel_In",
		Scale = 1,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundAsphodel",
		VideoTexture = "HadesBiomesDiaBackAsphodel",
		NumFrames = 32,
		StartFrame = 1,
		EndFrame = 32,
		HoldLastFrame = false,
		FlipHorizontal = true,
		Loop = false,
		PlaySpeed = 50,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_DialogueBackground_Asphodel",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Elysium_In = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium_In",
		Scale = 1,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundElysium",
		VideoTexture = "HadesBiomesDiaBackElysium",
		NumFrames = 32,
		StartFrame = 1,
		EndFrame = 32,
		HoldLastFrame = false,
		FlipHorizontal = true,
		Loop = false,
		PlaySpeed = 50,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions_In = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions_In",
		Scale = 1,
		FilePath =
		"NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundElysiumChampions",
		VideoTexture = "HadesBiomesDiaBackEChamps",
		NumFrames = 32,
		StartFrame = 1,
		EndFrame = 32,
		HoldLastFrame = false,
		FlipHorizontal = true,
		Loop = false,
		PlaySpeed = 50,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss_In = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss_In",
		Scale = 1,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundStyxBoss",
		VideoTexture = "HadesBiomesDiaBackStyxBoss",
		NumFrames = 32,
		-- Lots of blank frames at the start, so cut those out of the in-animation
		StartFrame = 10,
		EndFrame = 32,
		HoldLastFrame = false,
		FlipHorizontal = false,
		Loop = false,
		PlaySpeed = 50,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss",
	},
	-- #endregion
}

local addAnimations = {
	-- #region Dialogue Backgrounds
	ModsNikkelMHadesBiomes_DialogueBackground_Tartarus = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_In",
		NumFrames = 1,
		Duration = 2,
		FlipHorizontal = true,
		Loop = true,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundTartarus",
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_Out = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_Out",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_In",
		PlaySpeed = 60,
		FlipHorizontal = true,
		PlayBackwards = true,
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Asphodel = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Asphodel",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Asphodel_In",
		NumFrames = 1,
		Duration = 2,
		FlipHorizontal = true,
		Loop = true,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundAsphodel",
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Asphodel_Out = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Asphodel_Out",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Asphodel_In",
		PlaySpeed = 60,
		FlipHorizontal = true,
		PlayBackwards = true,
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Elysium = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium_In",
		NumFrames = 1,
		Duration = 2,
		FlipHorizontal = true,
		Loop = true,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundElysium",
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Elysium_Out = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium_Out",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium_In",
		PlaySpeed = 60,
		FlipHorizontal = true,
		PlayBackwards = true,
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions_In",
		NumFrames = 1,
		Duration = 2,
		FlipHorizontal = true,
		Loop = true,
		FilePath =
		"NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundElysiumChampions",
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions_Out = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions_Out",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_ElysiumChampions_In",
		PlaySpeed = 60,
		FlipHorizontal = true,
		PlayBackwards = true,
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss_In",
		NumFrames = 1,
		Duration = 2,
		FlipHorizontal = false,
		Loop = true,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundStyxBoss",
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss_Out = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss_Out",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss_In",
		PlaySpeed = 60,
		FlipHorizontal = false,
		PlayBackwards = true,
		ChainTo = "null",
	},
	-- #endregion
	-- #region Ending Portrait
	{
		Name = "PortraitFamily",
		FilePath = "GUIModded\\FamilyPortraits\\FamilyPortrait_01",
		Ambient = 0.0,
		AngleFromOwner = "Ignore",
	},
	-- #endregion
	-- #region Outro/Remembrance Video
	{
		Name = "ModsNikkelMHadesBiomes_RemBGIntro",
		ChainTo = "ModsNikkelMHadesBiomes_RemBG",
		FilePath = "Screens\\RemBG-Intro\\RemBG-Intro",
		Type = "Book",
		VideoTexture = "RemBGIntro",
		Sound = "/SFX/Menu Sounds/MirrorMenuOpenREMEMBRANCE",
		EndFrame = 10,
		NumFrames = 10,
		PlaySpeed = 24.0,
		StartFrame = 1,
		Ambient = 0.0,
	},
	{
		Name = "ModsNikkelMHadesBiomes_RemBG",
		FilePath = "Screens\\RemBG\\RemBG",
		Type = "Book",
		VideoTexture = "RemZJ",
		Sound = "/Ambience/RemembranceScreenAmbience2",
		StopSoundOnFinishFade = 0.5,
		EndFrame = 120,
		Loop = true,
		NumFrames = 120,
		PlaySpeed = 24.0,
		StartFrame = 1,
		Ambient = 0.0,
	},
	-- #endregion
}

sjson.hook(hadesTwoPortraitsFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["GUI_Portraits_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addParentAnimations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoPortraitModifications)
end)
