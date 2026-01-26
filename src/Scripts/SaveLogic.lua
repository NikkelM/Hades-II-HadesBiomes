local forceRecentModdedRuns = {}

modutil.mod.Path.Wrap("Save", function(base)
	forceRecentModdedRuns = {}

	-- Mark the last 10 modded runs as recent, so we don't strip them too far when saving
	local moddedCount = 0
	if game.GameState ~= nil and game.GameState.RunHistory ~= nil then
		for runIndex = #game.GameState.RunHistory, 1, -1 do
			local run = game.GameState.RunHistory[runIndex]
			if mod.WasModdedRun(run) then
				moddedCount = moddedCount + 1
				if moddedCount <= 10 then
					forceRecentModdedRuns[run] = true
				else
					break
				end
			end
		end
	end

	base()

	forceRecentModdedRuns = {}
end)

modutil.mod.Path.Wrap("StripRunForSave", function(base, run, runsBackFromCurrent)
	if run ~= nil and forceRecentModdedRuns[run] then
		-- If this run is a recent modded run, pretend it's within the last 10 runs to avoid stripping too much data
		runsBackFromCurrent = math.min(runsBackFromCurrent or 10, 10)
	end

	return base(run, runsBackFromCurrent)
end)
