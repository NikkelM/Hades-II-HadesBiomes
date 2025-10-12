local hadesTwoPortraitsFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Portraits_VFX.sjson")

local hadesTwoPortraitModifications = {
	Portrait_Hades_HelmCape_01 = {
		OffsetY = -91,
	},
}

-- These need to be added before the others, as they are inherited from
local addParentAnimations = {
	ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_In = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_In",
		Scale = 1,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundTartarus",
		VideoTexture = "HadesBiomesDiaBackTartarus",
		NumFrames = 32,
		StartFrame = 0,
		EndFrame = 31,
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
		StartFrame = 0,
		EndFrame = 31,
		HoldLastFrame = false,
		FlipHorizontal = true,
		Loop = false,
		PlaySpeed = 50,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_DialogueBackground_Asphodel",
	},
}

local addAnimations = {
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
}

sjson.hook(hadesTwoPortraitsFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addParentAnimations, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoPortraitModifications)
end)
