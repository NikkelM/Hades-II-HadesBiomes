-- To stop the CrusherUnit from being affected by Freeze effects
modutil.mod.Path.Wrap("ApplyRoot", function(base, victim, functionArgs, triggerArgs)
	if victim ~= nil and victim.GenusName == "CrusherUnit" then
		return
	end
	base(victim, functionArgs, triggerArgs)
end)
