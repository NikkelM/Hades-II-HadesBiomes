modutil.mod.Path.Wrap("PolymorphStunClear", function(base, triggerArgs)
	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		local enemy = triggerArgs.Victim
		if enemy.ModsNikkelMHadesBiomesIsModdedEnemy and (enemy.IsDead or enemy.Health <= 0) then
			-- Suppress death weapons if killed under polymorph
			enemy.SpawnUnitOnDeath = nil
		end
	end

	return base(triggerArgs)
end)
