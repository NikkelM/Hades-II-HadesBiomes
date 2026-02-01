-- "Rage" icon for Alecto
local superIcon = {
	TexturePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Icons\\Super",
	UseTooltip = true,
}
game.IconData.Super = game.IconData.Super or superIcon

local newIcons = {
	-- #region Run History Screen/Codex/Inventory/Quest Log/Cauldron
	ModsNikkelMHadesBiomesRunHistoryDoorLarge = {
		TexturePath = "Portraits\\ModsNikkelMHadesBiomesRunHistory\\RunHistory_Door_Red_72x72",
	},
	ModsNikkelMHadesBiomesRunHistoryDoor = {
		TexturePath = "Portraits\\ModsNikkelMHadesBiomesRunHistory\\RunHistory_Door_Red_64x64",
	},
	ModsNikkelMHadesBiomesRunHistoryDoorSmall = {
		TexturePath = "Portraits\\ModsNikkelMHadesBiomesRunHistory\\RunHistory_Door_Red_48x48",
	},
	-- #endregion
	-- #region ShrineChallenge/Erebus Gates
	ShrinePointSmall = {
		TexturePath = "GUIModded\\Icons\\ShrinePoint_Small",
		UseTooltip = true,
	},
	ShrinePointSmall_Active = {
		TexturePath = "GUIModded\\Icons\\ShrinePoint_Small_Active",
		UseTooltip = true,
	},
	-- #endregion
	-- #region Elite Attributes
	EliteSoulbound = {
		TexturePath = "GUI\\Icons\\Attributes\\Soulbound",
	},
	EliteCloner = {
		TexturePath = "GUI\\Icons\\Attributes\\Doppelganger",
	},
	EliteSpawner = {
		TexturePath = "GUI\\Icons\\Attributes\\Spawner",
	},
	EliteSmoked = {
		TexturePath = "GUI\\Icons\\Attributes\\Smoked",
	},
	-- #endregion
}
for iconName, iconData in pairs(newIcons) do
	game.IconData[iconName] = game.IconData[iconName] or iconData
end
