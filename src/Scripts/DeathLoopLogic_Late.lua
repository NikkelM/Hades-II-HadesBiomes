modutil.mod.Path.Context.Wrap.Static("KillHero", function(victim, triggerArgs)
	modutil.mod.Path.Wrap("UpdateRunHistoryCache", function(base, run, roomAdded)
		if run.ModsNikkelMHadesBiomesIsModdedRun then
			-- Save the actual ending room for when we call EndRun() when starting the next run, so we can still access it there
			game.CurrentRun.ModsNikkelMHadesBiomesActualCurrentRoom = game.CurrentRun.CurrentRoom
			-- To prevent an error after uninstalling the mod, due to the room name being unknown
			local dummyRoom = game.DeepCopyTable(game.RoomData.BaseRoom) or {}
			-- Don't CreateRoom(), as that would potentially assign an encounter which would fail to be generated
			game.RoomInit(dummyRoom)
			game.CurrentRun.CurrentRoom = dummyRoom

			-- Additionally, to prevent an error with opening the Run History screen after uninstalling the mod,
			-- we need to encode the EndingRoomName into the VictoryMessage field, since if it is a modded room name, the game crashes trying to find it
			-- This encoding is reversed when opening the Run History screen with the mod installed
			game.CurrentRun.VictoryMessage = (game.CurrentRun.VictoryMessage or "") .. "#" .. (game.CurrentRun.EndingRoomName or "")
			game.CurrentRun.EndingRoomName = nil
		end

		return base(run, roomAdded)
	end)
end)
