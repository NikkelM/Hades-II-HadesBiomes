local installScreenTemplate = {
	Components = {},
	OpenSound = "/SFX/Menu Sounds/HadesLocationTextAppear",
	CloseSound = "/SFX/Menu Sounds/IrisMenuBack",
	ComponentData = {
		DefaultGroup = "Combat_Menu_TraitTray",
		UseNativeScreenCenter = true,
		BackgroundTint = {
			Graphic = "rectangle01",
			GroupName = "Combat_Menu_TraitTray",
			Scale = 10,
			X = game.ScreenCenterX,
			Y = game.ScreenCenterY,
		},
		Background = {
			AnimationName = "MythmakerBoxDefault",
			GroupName = "Combat_Menu_TraitTray_Overlay",
			X = game.ScreenCenterX,
			-- For some reason, is not perfectly centered otherwise
			Y = game.ScreenCenterY + 70,
			Scale = 1.15,
			Children = {
				TitleText = {
					GroupName = "Combat_Menu_TraitTray_Overlay",
					OffsetY = -330,
					TextArgs = {
						Justification = "Center",
						VerticalJustification = "Center",
						Font = "P22UndergroundSCMedium",
						FontSize = 40,
						Color = { 221, 211, 211, 255 },
						OutlineColor = { 27, 26, 23, 255 },
						ShadowColor = { 12, 11, 10, 255 },
						ShadowBlur = 0,
						ShadowOffset = { 0, 4 },
						OutlineThickness = 4,
					},
				},
				DescriptionText = {
					GroupName = "Combat_Menu_TraitTray_Overlay",
					OffsetY = -75,
					TextArgs = {
						UseDescription = true,
						Justification = "Center",
						VerticalJustification = "Center",
						Font = "LatoMedium",
						FontSize = 20,
						Width = 800,
						TextSymbolScale = 0.8,
						Color = { 207, 225, 217, 255 },
						OutlineColor = { 52, 51, 49, 255 },
						ShadowColor = { 12, 11, 10, 255 },
						ShadowBlur = 0,
						ShadowOffset = { 0, 4 },
						OutlineThickness = 4,
					},
				},
				ConfirmButton = {
					Graphic = "ButtonDefault",
					GroupName = "Combat_Menu_TraitTray_Overlay",
					Scale = 1.0,
					OffsetY = 200,
					-- "Proceed"
					Text = "MarketScreen_ConfirmSellAll",
					TextArgs = {
						FontSize = 22,
						Width = 600,
						Color = game.Color.White,
						Font = "P22UndergroundSCMedium",
						ShadowBlur = 0,
						ShadowColor = { 0, 0, 0, 0 },
						ShadowOffset = { 0, 3 },
					},
					Data = {
						OnPressedFunctionName = _PLUGIN.guid .. "." .. "ConfirmExitInstallSuccessScreen",
						PressSound = "/SFX/Menu Sounds/IrisMenuBack",
					}
				},
			}
		},
	}
}

local screenTextIdsByName = {
	ModsNikkelMHadesBiomesInstallSuccess = "ModsNikkelMHadesBiomes_InstallSuccess",
	ModsNikkelMHadesBiomesInstallFailure = "ModsNikkelMHadesBiomes_InstallFailure",
	ModsNikkelMHadesBiomesInstallFailureHadesNotFound = "ModsNikkelMHadesBiomes_InstallFailure_HadesNotFound",
	ModsNikkelMHadesBiomesInstallFailureHadesModsInstalled = "ModsNikkelMHadesBiomes_InstallFailure_HadesModsInstalled",
	ModsNikkelMHadesBiomesInstallFailureIncompatibleModsInstalled =
	"ModsNikkelMHadesBiomes_InstallFailure_IncompatibleModsInstalled",
	ModsNikkelMHadesBiomesInstallFailureMissingFiles = "ModsNikkelMHadesBiomes_InstallFailure_MissingFiles",
	ModsNikkelMHadesBiomesInstallFailureHadesNotUpdated = "ModsNikkelMHadesBiomes_InstallFailure_HadesNotUpdated",
	ModsNikkelMHadesBiomesUninstallFailure = "ModsNikkelMHadesBiomes_UninstallFailure",
	ModsNikkelMHadesBiomesSjsonLoadError = "ModsNikkelMHadesBiomes_SjsonHookFailure",
}

for screenName, textId in pairs(screenTextIdsByName) do
	local screen = game.DeepCopyTable(installScreenTemplate)
	screen.Name = screenName
	local screenChildren = screen.ComponentData.Background.Children
	screenChildren.TitleText.Text = textId
	screenChildren.DescriptionText.Text = textId
	game.ScreenData[screenName] = screen
end

-- #region Mod update screens
mod.UpdateInstallScreenTextIdsByVersion = {
	["1.3.0"] = "ModsNikkelMHadesBiomes_UpdateSuccess_1_3_0",
}

game.ScreenData.ModsNikkelMHadesBiomesUpdateSuccess = game.DeepCopyTable(game.ScreenData
	.ModsNikkelMHadesBiomesInstallSuccess)
game.ScreenData.ModsNikkelMHadesBiomesUpdateSuccess.Name = "ModsNikkelMHadesBiomesUpdateSuccess"
local updateDescriptionText = game.ScreenData.ModsNikkelMHadesBiomesUpdateSuccess.ComponentData.Background.Children
		.DescriptionText
updateDescriptionText.OffsetX = -400
updateDescriptionText.TextArgs.Justification = "Left"
-- #endregion
