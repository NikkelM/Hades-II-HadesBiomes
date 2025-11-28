modutil.mod.Path.Context.Wrap.Static("KillHero", function(victim, triggerArgs)
	modutil.mod.Path.Wrap("UpdateRunHistoryCache", function(base, run, roomAdded)
		if run.ModsNikkelMHadesBiomesIsModdedRun then
			-- To prevent an error after uninstalling the mod, due to the room name being unknown
			game.CurrentRun.CurrentRoom = game.CreateRoom(game.RoomData.BaseRoom)
		end

		return base(run, roomAdded)
	end)
end)
