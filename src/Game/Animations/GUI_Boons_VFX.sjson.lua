local hadesTwoBoonFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\GUI_Boons_VFX.sjson")

-- Make sure to add a Name key!

local addAnimationsParents = {}
local addAnimations = {
	-- #region Eurydice
	Boon_Eurydice_01 = {
		Name = "Boon_Eurydice_01",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Eurydice_01",
	},
	Boon_Eurydice_02 = {
		Name = "Boon_Eurydice_02",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Eurydice_02",
	},
	Boon_Eurydice_03 = {
		Name = "Boon_Eurydice_03",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Eurydice_03",
	},
	-- #endregion
	-- #region Patroclus
	Boon_Patroclus_01 = {
		Name = "Boon_Patroclus_01",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Patroclus_01",
	},
	Boon_Patroclus_02 = {
		Name = "Boon_Patroclus_02",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Patroclus_02",
	},
	Boon_Patroclus_03 = {
		Name = "Boon_Patroclus_03",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Patroclus_03",
	},
	Boon_Patroclus_04 = {
		Name = "Boon_Patroclus_04",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Patroclus_04",
	},
	Boon_Patroclus_05 = {
		Name = "Boon_Patroclus_05",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Patroclus_05",
	},
	-- #endregion
	-- #region Sisyphus
	Boon_Sisyphus_01 = {
		Name = "Boon_Sisyphus_01",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Sisyphus_01",
	},
	Boon_Sisyphus_02 = {
		Name = "Boon_Sisyphus_02",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Sisyphus_02",
	},
	Boon_Sisyphus_03 = {
		Name = "Boon_Sisyphus_03",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Sisyphus_03",
	},
	Boon_Sisyphus_04 = {
		Name = "Boon_Sisyphus_04",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Sisyphus_04",
	},
	Boon_Sisyphus_05 = {
		Name = "Boon_Sisyphus_05",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Sisyphus_05",
	},
	Boon_Sisyphus_06 = {
		Name = "Boon_Sisyphus_06",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Sisyphus_06",
	},
	Boon_Sisyphus_07 = {
		Name = "Boon_Sisyphus_07",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Sisyphus_07",
	},
	-- #endregion
	-- #region Bouldy
	Boon_Bouldy_01 = {
		Name = "Boon_Bouldy_01",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Bouldy_01",
	},
	-- #endregion
	-- #region Orpheus
	Boon_Orpheus_GodOfTheDead = {
		Name = "Boon_Orpheus_GodOfTheDead",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Orpheus_GodOfTheDead",
	},
	Boon_Orpheus_HymnToZagreus = {
		Name = "Boon_Orpheus_HymnToZagreus",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Orpheus_HymnToZagreus",
	},
	Boon_Orpheus_PrimordialChaos = {
		Name = "Boon_Orpheus_PrimordialChaos",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Orpheus_PrimordialChaos",
	},
	Boon_Orpheus_LamentOfOrpheus = {
		Name = "Boon_Orpheus_LamentOfOrpheus",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Orpheus_LamentOfOrpheus",
	},
	Boon_Orpheus_FinalExpense = {
		Name = "Boon_Orpheus_FinalExpense",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Orpheus_FinalExpense",
	},
	Boon_Orpheus_GoodRiddance = {
		Name = "Boon_Orpheus_GoodRiddance",
		InheritFrom = "BoonIcon",
		FilePath = "GUIModded\\Screens\\BoonIcons\\Orpheus_GoodRiddance",
	},
	-- #endregion
}

sjson.hook(hadesTwoBoonFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["GUI_Boons_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimationsParents, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
