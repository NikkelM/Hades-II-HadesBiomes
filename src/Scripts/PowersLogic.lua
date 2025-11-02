-- To stop the CrusherUnit from being affected by Freeze effects
modutil.mod.Path.Wrap("ApplyRoot", function(base, victim, functionArgs, triggerArgs)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim ~= nil and victim.GenusName == "CrusherUnit" then
		return
	end

	return base(victim, functionArgs, triggerArgs)
end)
