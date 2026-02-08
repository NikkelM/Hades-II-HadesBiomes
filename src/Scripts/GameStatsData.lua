-- Move existing and add new columns to GameStats screen
game.ScreenData.GameStats.WeaponColumnHeaders = {
	{ ColumnName = "Name",                                      X = 150,  Justification = "Left", },
	{ ColumnName = "Icon",                                      X = 107 },
	{ ColumnName = "UseCount",                                  X = 690,  HeaderX = 860,                                                                       Text = "GameStatsScreen_Usage", Justification = "Right", HeaderJustification = "Center", },
	{ ColumnName = "BarGraph",                                  X = 705,  Justification = "Right", },
	{ ColumnName = "ClearCount",                                X = 1129, Text = "RunClearScreen_Header_Clears",                                               Justification = "Center", },
	{ ColumnName = "FastestTimeUnderworld",                     X = 1250, Text = "RunClearScreen_Header_RecordClearTime_Underworld",                           Justification = "Center", },
	{ ColumnName = "HighestShrinePointsUnderworld",             X = 1345, Text = "RunClearScreen_Header_RecordShrinePoints_Underworld",                        Justification = "Center", },
	{ ColumnName = "FastestTimeSurface",                        X = 1450, Text = "RunClearScreen_Header_RecordClearTime_Surface",                              Justification = "Center", },
	{ ColumnName = "HighestShrinePointsSurface",                X = 1545, Text = "RunClearScreen_Header_RecordShrinePoints_Surface",                           Justification = "Center", },
	-- New columns
	{ ColumnName = "ModsNikkelMHadesBiomesFastestTime",         X = 1650, Text = "RunClearScreen_Header_RecordClearTime_ModsNikkelMHadesBiomesModdedRoute",    Justification = "Center", },
	{ ColumnName = "ModsNikkelMHadesBiomesHighestShrinePoints", X = 1745, Text = "RunClearScreen_Header_RecordShrinePoints_ModsNikkelMHadesBiomesModdedRoute", Justification = "Center", },
}

-- Allow sorting by Zagreus' Journey clear time and Fear/Heat
table.insert(game.ScreenData.GameStats.SortKeys, "ModsNikkelMHadesBiomesFastestTime")
table.insert(game.ScreenData.GameStats.SortKeys, "ModsNikkelMHadesBiomesHighestShrinePoints")
game.ScreenData.GameStats.SortInReverse["ModsNikkelMHadesBiomesFastestTime"] = true

-- Update the background image
game.ScreenData.GameStats.ComponentData.BackgroundFront.AnimationName = "ModsNikkelMHadesBiomes_GameStatsFront"
