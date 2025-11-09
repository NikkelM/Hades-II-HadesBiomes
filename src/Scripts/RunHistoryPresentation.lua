modutil.mod.Path.Wrap("RunHistoryScreenOpenPresentation", function(base, screen)
	if mod.WasModdedRun(game.CurrentRun) then
		PlaySound({ Name = "/SFX/Menu Sounds/DialoguePanelIn" })
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.OpenedRunHistoryScreenVoiceLines, true)
		-- Modded index
		local animationIndex = 7
		if not game.WasRunSuccess(game.CurrentRun) then
			SetAlpha({ Id = screen.Components.ResultRibbonSuccess.Id, Fraction = 0.0 })
			animationIndex = animationIndex + 1
		end
		SetAnimation({ DestinationId = screen.Components.ForegroundTheme.Id, Name = screen.InAnimations[animationIndex] })
		game.wait(0.5)
	else
		return base(screen)
	end
end)
