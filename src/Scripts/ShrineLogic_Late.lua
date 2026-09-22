modutil.mod.Path.Context.Wrap.Static("RespawnEggCountdown", function()
	modutil.mod.Path.Wrap("IsLocationBlocked", function(base, args)
		-- In Asphodel, make the eggs destroy themselves when landing on lava
		if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.RoomSetName == "Asphodel" then
			args.CheckUnits = true
			args.PathfindersPreferAvoid = true
		end

		return base(args)
	end)
end)
