-- When the enemy's armor is broken, remove the outline from any tethers as well, if applicable
modutil.mod.Path.Wrap("DoEnemyHealthBufferDeplete", function(base, enemy)
	base(enemy)
	if enemy.TetherIds ~= nil then
		for k, tetherId in ipairs(enemy.TetherIds) do
			RemoveOutline({ Id = tetherId })
		end
	end
end)

modutil.mod.Path.Wrap("Damage", function(base, victim, triggerArgs)
	-- Ignore the first damage occurrence if applicable
	-- Currently used for e.g. the ShadeNaked, which would be damaged when spawning for some reason
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if victim.ModsNikkelMHadesBiomesIgnoreFirstDamage then
			victim.ModsNikkelMHadesBiomesIgnoreFirstDamage = false
			return
		end
	end

	base(victim, triggerArgs)
end)
