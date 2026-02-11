-- Realign the existing rows to make room for the new ones
game.ScreenData.WeaponUpgradeScreen.ComponentData.KillsLabel.Y = 765
game.ScreenData.WeaponUpgradeScreen.ComponentData.KillsValue.Y = 765
game.ScreenData.WeaponUpgradeScreen.ComponentData.ClearsLabel.Y = 790
game.ScreenData.WeaponUpgradeScreen.ComponentData.ClearsValue.Y = 790
game.ScreenData.WeaponUpgradeScreen.ComponentData.UnderworldClearTimeRecordLabel.Y = 820
game.ScreenData.WeaponUpgradeScreen.ComponentData.UnderworldClearTimeRecordValue.Y = 820
game.ScreenData.WeaponUpgradeScreen.ComponentData.UnderworldShrinePointRecordLabel.Y = 845
game.ScreenData.WeaponUpgradeScreen.ComponentData.UnderworldShrinePointRecordValue.Y = 845
game.ScreenData.WeaponUpgradeScreen.ComponentData.SurfaceClearTimeRecordLabel.Y = 875
game.ScreenData.WeaponUpgradeScreen.ComponentData.SurfaceClearTimeRecordValue.Y = 875
game.ScreenData.WeaponUpgradeScreen.ComponentData.SurfaceShrinePointRecordLabel.Y = 900
game.ScreenData.WeaponUpgradeScreen.ComponentData.SurfaceShrinePointRecordValue.Y = 900

-- Add the new rows
game.ScreenData.WeaponUpgradeScreen.ComponentData.ModsNikkelMHadesBiomesFastestTimeRecordLabel = {
	X = 44,
	Y = 930,
	Text = "WeaponUpgradeScreen_ClearTimeRecord_ModsNikkelMHadesBiomesModdedRoute",
	TextArgs = {
		Font = "LatoMedium",
		FontSize = 17,
		Color = { 241, 241, 241, 255 },
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 2 },
		OutlineThickness = 2,
		OutlineColor = { 0, 0, 0, 1 },
		Justification = "Left",
		TextSymbolScale = 0.8,
	},
}
game.ScreenData.WeaponUpgradeScreen.ComponentData.ModsNikkelMHadesBiomesFastestTimeRecordValue = {
	X = 380,
	Y = 930,
	TextArgs = {
		Color = { 1.000, 0.910, 0.510, 1.0 },
		FontSize = 21,
		Font = "NumericP22UndergroundSCMedium",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 2 },
		OutlineThickness = 2,
		OutlineColor = { 0, 0, 0, 1 },
		Justification = "Right",
	},
}
game.ScreenData.WeaponUpgradeScreen.ComponentData.ModsNikkelMHadesBiomesHighestShrinePointsRecordLabel = {
	X = 44,
	Y = 955,
	Text = "WeaponUpgradeScreen_ShrinePointRecord_ModsNikkelMHadesBiomesModdedRoute",
	TextArgs = {
		Font = "LatoMedium",
		FontSize = 17,
		Color = { 241, 241, 241, 255 },
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 2 },
		OutlineThickness = 2,
		OutlineColor = { 0, 0, 0, 1 },
		Justification = "Left",
		TextSymbolScale = 0.8,
	},
}
game.ScreenData.WeaponUpgradeScreen.ComponentData.ModsNikkelMHadesBiomesHighestShrinePointsRecordValue = {
	X = 380,
	Y = 955,
	TextArgs = {
		Color = { 1.000, 0.910, 0.510, 1.0 },
		FontSize = 21,
		Font = "NumericP22UndergroundSCMedium",
		ShadowBlur = 0,
		ShadowColor = { 0, 0, 0, 1 },
		ShadowOffset = { 0, 2 },
		OutlineThickness = 2,
		OutlineColor = { 0, 0, 0, 1 },
		Justification = "Right",
	},
}
