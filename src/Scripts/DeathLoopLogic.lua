-- For the RunHistoryScreen, we need to set a proper name for when the player is killed by a HarpySupportUnit
modutil.mod.Path.Wrap("KillHero", function(base, victim, triggerArgs)
	local killer = triggerArgs.AttackerTable
	if killer.Name == "HarpySupportUnit" then
		local resultText = game.CurrentRun.CurrentRoom.ResultText
		if resultText == "RunHistoryScreenResult_A_Boss01" then
			killer.Name = "Harpy"
		elseif resultText == "RunHistoryScreenResult_A_Boss02" then
			killer.Name = "Harpy2"
		elseif resultText == "RunHistoryScreenResult_A_Boss03" then
			killer.Name = "Harpy3"
		end
	end
	base(victim, triggerArgs)
end)
