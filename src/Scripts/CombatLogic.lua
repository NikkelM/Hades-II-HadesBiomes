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
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- Ignore the first damage occurrence if applicable
		-- Currently used for the ShadeNaked, which would be damaged when spawning for some reason
		if victim.ModsNikkelMHadesBiomesIgnoreFirstRapidDamage then
			victim.ModsNikkelMHadesBiomesIgnoreFirstRapidDamage = false
			-- We only ignore the damage if it occurs within 0.01 seconds of the enemy being activated
			if game._worldTime - victim.ModsNikkelMHadesBiomesActivatedTime < 0.01 then
				return
			end
		end
	end

	base(victim, triggerArgs)
end)
