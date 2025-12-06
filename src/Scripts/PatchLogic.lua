modutil.mod.Path.Wrap("DoPatches", function(base)
	local moddedRoomNames = {}
	for _, roomName in pairs(mod.MapFileMappings) do
		table.insert(moddedRoomNames, roomName)
	end
	-- For even more backwards compatibility, also include the old Elysium-style room names
	-- Except C_Boss01, it's also used in Hades II, and won't break the history (though it will lie about the ending room)
	local oldElysiumRoomNames = {
		"C_Intro",
		-- "C_Boss01", -- Also used in Hades II! Don't replace it when patching
		"C_PostBoss01",
		"C_PreBoss01",
		"C_Shop01",
		"C_MiniBoss01",
		"C_MiniBoss02",
		"C_Reprieve01",
		"C_Story01",
		"C_Combat01",
		"C_Combat02",
		"C_Combat03",
		"C_Combat04",
		"C_Combat05",
		"C_Combat06",
		"C_Combat07",
		"C_Combat08",
		"C_Combat09",
		"C_Combat10",
		"C_Combat11",
		"C_Combat12",
		"C_Combat13",
		"C_Combat14",
		"C_Combat15",
	}
	moddedRoomNames = game.ConcatTableValuesIPairs(moddedRoomNames, oldElysiumRoomNames)

	if game.GameState ~= nil then
		-- #region Fixing any older runs from before the uninstall-error was fixed
		if not game.IsEmpty(game.GameState.RunHistory) then
			for _, runData in pairs(game.GameState.RunHistory) do
				if game.Contains(moddedRoomNames, runData.EndingRoomName) then
					runData.VictoryMessage = (runData.VictoryMessage or "") .. "#" .. (runData.EndingRoomName or "")
					runData.EndingRoomName = nil
				end
			end
		end
		-- #endregion

		-- #region Initialize GameState variables
		game.GameState.ModsNikkelMHadesBiomesCompletedRunsCache = game.GameState.ModsNikkelMHadesBiomesCompletedRunsCache or
				0
		game.GameState.ModsNikkelMHadesBiomesClearedRunsCache = game.GameState.ModsNikkelMHadesBiomesClearedRunsCache or 0
		game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache = game.GameState
				.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache or 0
		game.GameState.ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache = game.GameState
				.ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache or 999999
		-- #endregion
	end

	if game.CurrentRun ~= nil then
		-- #region If in the Hub and the current run is modded
		if game.CurrentHubRoom ~= nil and game.Contains(moddedRoomNames, game.CurrentRun.CurrentRoom.Name) then
			-- Save the actual ending room for when we call EndRun() when starting the next run, so we can still access it there
			game.CurrentRun.ModsNikkelMHadesBiomesActualCurrentRoomName = game.CurrentRun.CurrentRoom.Name
			-- To prevent an error after uninstalling the mod, due to the room name being unknown
			game.CurrentRun.CurrentRoom.Name = "BaseRoom"

			-- Additionally, to prevent an error with opening the Run History screen after uninstalling the mod,
			-- we need to encode the EndingRoomName into the VictoryMessage field, since if it is a modded room name, the game crashes trying to find it
			-- This encoding is reversed when opening the Run History screen with the mod installed
			game.CurrentRun.VictoryMessage = (game.CurrentRun.VictoryMessage or "") ..
					"#" .. (game.CurrentRun.EndingRoomName or "")
			game.CurrentRun.EndingRoomName = nil
		end
	end
	-- #endregion

	base()
end)
