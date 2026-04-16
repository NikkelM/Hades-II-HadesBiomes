modutil.mod.Path.Context.Wrap.Static("KillHero", function(victim, triggerArgs)
	modutil.mod.Path.Wrap("UpdateRunHistoryCache", function(base, run, roomAdded)
		if run.ModsNikkelMHadesBiomesIsModdedRun then
			-- Save the actual ending room for when we call EndRun() when starting the next run, so we can still access it there
			run.ModsNikkelMHadesBiomesActualCurrentRoomName = run.CurrentRoom.Name
			-- To prevent an error after uninstalling the mod, due to the room name being unknown by the base game's PatchLogic
			run.CurrentRoom.Name = "BaseRoom"
		end

		return base(run, roomAdded)
	end)
end)
