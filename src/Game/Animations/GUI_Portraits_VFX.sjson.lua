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
		VideoTexture = "DialogueBackgroundTartarus",
		NumFrames = 20,
		StartFrame = 1,
		EndFrame = 20,
		HoldLastFrame = false,
		Loop = false,
		PlaySpeed = 30,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Elysium_In = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium_In",
		Scale = 1,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundElysium",
		VideoTexture = "DialogueBackgroundElysium",
		NumFrames = 20,
		StartFrame = 1,
		EndFrame = 20,
		HoldLastFrame = false,
		Loop = false,
		PlaySpeed = 30,
		Material = "Unlit",
		ChainTo = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium",
	},
}

local addAnimations = {
	ModsNikkelMHadesBiomes_DialogueBackground_Tartarus = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_In",
		NumFrames = 1,
		Duration = 2,
		Loop = true,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundTartarus",
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_Out = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_Out",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Tartarus_In",
		PlayBackwards = true,
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Elysium = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium_In",
		NumFrames = 1,
		Duration = 2,
		Loop = true,
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\DialogueBackgrounds\\DialogueBackgroundElysium",
		ChainTo = "null",
	},
	ModsNikkelMHadesBiomes_DialogueBackground_Elysium_Out = {
		Name = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium_Out",
		InheritFrom = "ModsNikkelMHadesBiomes_DialogueBackground_Elysium_In",
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
