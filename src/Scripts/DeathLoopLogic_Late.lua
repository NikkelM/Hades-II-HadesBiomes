modutil.mod.Path.Context.Wrap.Static("KillHero", function(victim, triggerArgs)
	modutil.mod.Path.Wrap("UpdateRunHistoryCache", function(base, run, roomAdded)
		if run.ModsNikkelMHadesBiomesIsModdedRun then
			-- Save the actual ending room for when we call EndRun() when starting the next run, so we can still access it there
			run.ModsNikkelMHadesBiomesActualCurrentRoomName = run.CurrentRoom.Name
			-- To prevent an error after uninstalling the mod, due to the room name being unknown
			run.CurrentRoom.Name = "BaseRoom"

			-- Additionally, to prevent an error with opening the Run History screen after uninstalling the mod,
			-- we need to encode the EndingRoomName into the VictoryMessage field, since if it is a modded room name, the game crashes trying to find it
			-- This encoding is reversed when opening the Run History screen with the mod installed
			run.VictoryMessage = (run.VictoryMessage or "") .. "#" .. (run.EndingRoomName or "")
			run.EndingRoomName = nil
		end

		return base(run, roomAdded)
	end)
end)
