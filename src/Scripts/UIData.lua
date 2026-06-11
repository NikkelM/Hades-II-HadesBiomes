-- #region Icons
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
	ShrinePointLarge = {
		TexturePath = "GUIModded\\Icons\\ShrinePoint_Large",
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
	-- #region Dream Run biome icons
	ModsNikkelMHadesBiomes_BiomeTartarusIcon = {
		TexturePath = "GUIModded\\Screens\\RunHistory\\BiomeTartarus",
	},
	ModsNikkelMHadesBiomes_BiomeAsphodelIcon = {
		TexturePath = "GUIModded\\Screens\\RunHistory\\BiomeAsphodel",
	},
	ModsNikkelMHadesBiomes_BiomeElysiumIcon = {
		TexturePath = "GUIModded\\Screens\\RunHistory\\BiomeElysium",
	},
	ModsNikkelMHadesBiomes_BiomeStyxIcon = {
		TexturePath = "GUIModded\\Screens\\RunHistory\\BiomeStyx",
	},
	-- #endregion
}
for iconName, iconData in pairs(newIcons) do
	game.IconData[iconName] = game.IconData[iconName] or iconData
end
-- #endregiom

-- #region Text
local newTextFormats = {
	TeamThanFormat = {
		Graft = true,
		Color = game.Color.ThanatosVoice,
		Font = "LatoSemibold",
	},
}
-- Adapted from SetupFormatContainers which runs on PreThingCreation before we can add to the table
for formatName, formatData in pairs(newTextFormats) do
	formatData.Name = formatName
	formatData.AutoSetDataProperties = true
	game.TextFormats[formatName] = formatData
	CreateFormatContainer(formatData)
end
-- #endregion

-- #region RunIntroData
-- Prevent the RunIntroData from playing if the fresh file run is a modded run
table.insert(game.RunIntroData[1].GameStateRequirements, {
	PathFalse = { config.z_SpeedrunFreshFileZagreusJourneyRun },
})
-- #endregion
