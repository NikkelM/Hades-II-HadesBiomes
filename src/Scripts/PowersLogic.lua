-- To stop the CrusherUnit from being affected by Freeze effects
modutil.mod.Path.Wrap("ApplyRoot", function(base, victim, functionArgs, triggerArgs)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim ~= nil and victim.GenusName == "CrusherUnit" then
		return
	end

	return base(victim, functionArgs, triggerArgs)
end)

modutil.mod.Path.Wrap("PreDamageBoss", function(base, enemy, damageAmount, damageData)
	-- To prevent Hades from being invisible/invulnerable during this, reducing the delay
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy ~= nil and enemy.Name == "Hades" then
		damageData.Delay = 1
	end

	return base(enemy, damageAmount, damageData)
end)
