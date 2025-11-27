modutil.mod.Path.Context.Wrap.Static("DamageEnemy", function(victim, triggerArgs)
	modutil.mod.Path.Wrap("ProcessHealthBuffer", function(base, enemy, damageEventArgs)
		if enemy.ModsNikkelMHadesBiomesIsThanatosCursed and not (triggerArgs.AttackerTable ~= nil and triggerArgs.AttackerTable.ObjectId == game.CurrentRun.Hero.ObjectId) then
			return false
		end

		return base(enemy, damageEventArgs)
	end)
end)
