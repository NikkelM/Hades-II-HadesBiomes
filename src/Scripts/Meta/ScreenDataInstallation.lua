-- Additional ScreenData entries are created here
game.ScreenData.ModsNikkelMHadesBiomesInstallSuccess = {
	Name = "ModsNikkelMHadesBiomesInstallSuccess",
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
			-- For some reason, is not properly centered otherwise
			Y = game.ScreenCenterY + 70,
			Scale = 1.15,
			Children = {
				TitleText = {
					Text = "ModsNikkelMHadesBiomes_InstallSuccess",
					GroupName = "Combat_Menu_TraitTray_Overlay",
					OffsetY = -300,
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
					Text = "ModsNikkelMHadesBiomes_InstallSuccess",
					GroupName = "Combat_Menu_TraitTray_Overlay",
					OffsetY = -100,
					TextArgs = {
						UseDescription = true,
						Justification = "Center",
						VerticalJustification = "Center",
						Font = "LatoMedium",
						FontSize = 23,
						Width = 750,
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
						Color = Color.White,
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

game.ScreenData.ModsNikkelMHadesBiomesInstallFailure = {
	Name = "ModsNikkelMHadesBiomesInstallFailure",
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
					Text = "ModsNikkelMHadesBiomes_InstallFailure",
					GroupName = "Combat_Menu_TraitTray_Overlay",
					OffsetY = -325,
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
					Text = "ModsNikkelMHadesBiomes_InstallFailure",
					GroupName = "Combat_Menu_TraitTray_Overlay",
					OffsetY = -75,
					TextArgs = {
						UseDescription = true,
						Justification = "Center",
						VerticalJustification = "Center",
						Font = "LatoMedium",
						FontSize = 23,
						Width = 750,
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
						Color = Color.White,
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

game.ScreenData.ModsNikkelMHadesBiomesUninstallFailure = {
	Name = "ModsNikkelMHadesBiomesUninstallFailure",
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
					Text = "ModsNikkelMHadesBiomes_UninstallFailure",
					GroupName = "Combat_Menu_TraitTray_Overlay",
					OffsetY = -325,
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
					Text = "ModsNikkelMHadesBiomes_UninstallFailure",
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
						Color = Color.White,
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