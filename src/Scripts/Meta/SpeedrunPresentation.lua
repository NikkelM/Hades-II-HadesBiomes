function mod.ShowSpeedrunSettingsIndicator()
	local speedrunIndicatorAnchorName = "ModsNikkelMHadesBiomesSpeedrunSettingsIndicator"

	if game.ScreenAnchors[speedrunIndicatorAnchorName] ~= nil or not mod.AnyConfigSettingEnabled(config.speedrunning) then
		return
	end

	local runDepthUI = game.UIData.CurrentRunDepth
	game.ScreenAnchors[speedrunIndicatorAnchorName] = CreateScreenObstacle({
		Name = "BlankObstacle",
		X = game.ScreenWidth - 15,
		Y = 175,
		Group = "Combat_Menu_Overlay",
	})

	local textArgs = game.DeepCopyTable(runDepthUI.TextFormat) or {}
	textArgs.Id = game.ScreenAnchors[speedrunIndicatorAnchorName]
	textArgs.FontSize = 16
	textArgs.Text = "ModsNikkelMHadesBiomesSpeedrunSettingsEnabled"
	CreateTextBox(textArgs)
end

OnAnyLoad {
	function()
		if config.enabled and game.CurrentHubRoom == nil and game.CurrentRun ~= nil and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			mod.ShowSpeedrunSettingsIndicator()
		end
	end
}
