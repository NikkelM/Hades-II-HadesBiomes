-- "Rage" icon for Alecto
local superIcon = {
	TexturePath = "GUI\\Icons\\Super",
	UseTooltip = true,
}
game.IconData.Super = game.IconData.Super or superIcon

-- Run History Screen
game.IconData.ModsNikkelMHadesBiomesRunHistoryDoor = {
	TexturePath = "Portraits\\ModsNikkelMHadesBiomesRunHistory\\RunHistory_Door_Red_64x64",
}

-- ShrineChallenge/Erebus Gates
local newShrinePointIcons = {
	ShrinePointSmall = {
		TexturePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Icons\\ShrinePoint_Small",
		UseTooltip = true,
	},
	ShrinePointSmall_Active = {
		TexturePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Icons\\ShrinePoint_Small_Active",
		UseTooltip = true,
	},
	ShrinePointSmall_Active_Grayscale = {
		TexturePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Icons\\ShrinePoint_Small_Active_Grayscale",
	},
}
for iconName, iconData in pairs(newShrinePointIcons) do
	game.IconData[iconName] = game.IconData[iconName] or iconData
end
