local hadesTwoBoonFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Boons_VFX.sjson")

-- Make sure to add a Name key!

local addAnimationsParents = {}
local addAnimations = {
	-- #region Eurydice
	Boon_Eurydice_01 = {
		Name = "Boon_Eurydice_01",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Eurydice_01",
	},
	Boon_Eurydice_02 = {
		Name = "Boon_Eurydice_02",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Eurydice_02",
	},
	Boon_Eurydice_03 = {
		Name = "Boon_Eurydice_03",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Eurydice_03",
	},
	-- #endregion
	-- #region Patroclus
	Boon_Patroclus_01 = {
		Name = "Boon_Patroclus_01",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Patroclus_01",
	},
	Boon_Patroclus_02 = {
		Name = "Boon_Patroclus_02",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Patroclus_02",
	},
	Boon_Patroclus_03 = {
		Name = "Boon_Patroclus_03",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Patroclus_03",
	},
	Boon_Patroclus_04 = {
		Name = "Boon_Patroclus_04",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Patroclus_04",
	},
	Boon_Patroclus_05 = {
		Name = "Boon_Patroclus_05",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Patroclus_05",
	},
	-- #endregion
	-- #region Sisyphus
	Boon_Sisyphus_01 = {
		Name = "Boon_Sisyphus_01",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Sisyphus_01",
	},
	Boon_Sisyphus_02 = {
		Name = "Boon_Sisyphus_02",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Sisyphus_02",
	},
	Boon_Sisyphus_03 = {
		Name = "Boon_Sisyphus_03",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Sisyphus_03",
	},
	-- #endregion
	-- #region Bouldy
	Boon_Bouldy_01 = {
		Name = "Boon_Bouldy_01",
		InheritFrom = "BoonIcon",
		FilePath = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\BoonIcons\\Bouldy_01",
	},
	-- #endregion
}

sjson.hook(hadesTwoBoonFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addAnimationsParents, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
