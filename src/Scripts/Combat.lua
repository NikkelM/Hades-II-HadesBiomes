modutil.mod.Path.Wrap("DamageEnemy", function(base, victim, triggerArgs)
	base(victim, triggerArgs)

	if victim.RageChargeMultiplier ~= nil then
		victim.RageHit = true
		local meterAmount = triggerArgs.DamageAmount * victim.RageChargeMultiplier * 0.01
		mod.BuildRageMeter(meterAmount, victim)
	end
end)
