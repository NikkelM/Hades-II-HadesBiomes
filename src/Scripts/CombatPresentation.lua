-- Wrap around KillPresentation to call HandleTetherParentDeath() before the victim is destroyed in Kill()
modutil.mod.Path.Wrap("KillPresentation", function(base, victim, killer, args)
	game.thread(game.HandleTetherParentDeath, victim)
	base(victim, killer, args)
end)

-- For the Alecto bossfight, if dying while the enemy is permanently enraged
modutil.mod.Path.Wrap("PlayerLastStandPresentationEnd", function(base)
	base()
	if not IsEmpty(game.ActiveEnemies) then
		local colorGrade = "None"
		for id, enemy in pairs(game.ActiveEnemies) do
			if enemy.PermanentEnraged and enemy.PermanentEnragedColorGrade then
				colorGrade = enemy.PermanentEnragedColorGrade
			end
		end
		AdjustColorGrading({ Name = colorGrade, Duration = 4, Delay = 0 })
	end
end)
