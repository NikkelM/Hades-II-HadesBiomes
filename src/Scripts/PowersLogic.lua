modutil.mod.Path.Wrap("PreDamageBoss", function(base, enemy, damageAmount, damageData)
	-- To prevent Hades from being invisible/invulnerable during this, reducing the delay
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy ~= nil and enemy.Name == "Hades" then
		damageData.Delay = 2.2
	end

	return base(enemy, damageAmount, damageData)
end)
