modutil.mod.Path.Wrap("AttemptReroll", function(base, run, target)
	-- The reroll function for the D_Boss01 exit door isn't an actual reroll, but lets us enter the Surface instead
	if target ~= nil and target.ModsNikkelMHadesBiomes_IsSurfaceDoor then
		target.ModsNikkelMHadesBiomes_ProceedToSurface = true
		if target.Room == nil then
			target.Room = game.CreateRoom(game.RoomData["E_Intro"])
		end
		game.LeaveRoom(game.CurrentRun, target)
		return
	end

	return base(run, target)
end)
