-- Wrap around KillPresentation to call HandleTetherParentDeath() before the victim is destroyed in Kill()
modutil.mod.Path.Wrap("KillPresentation", function(base, victim, killer, args)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim.ModsNikkelMHadesBiomesIsModdedEnemy then
		game.thread(mod.HandleTetherParentDeath, victim)

		if victim.DeathAnimation ~= nil and victim.ManualDeathAnimation then
			-- Set the death animation manually on a new obstacles, to not have to time the DestroyDelay
			local deathAnimationObstacle = SpawnObstacle({
				Name = "BlankObstacle",
				DestinationId = victim.ObjectId,
				-- Need to set SortMode on the DeathAnimation to Isometric to make sure it is rendered behind/in front correctly
				Group = "Standing",
			})
			local angle = GetAngle({ Id = victim.ObjectId })
			if not victim.ModsNikkelMHadesBiomesIgnoreDeathAngle then
				CreateAnimation({ Name = victim.DeathAnimation, DestinationId = deathAnimationObstacle, Angle = angle })
			else
				CreateAnimation({ Name = victim.DeathAnimation, DestinationId = deathAnimationObstacle })
			end

			-- After 5 seconds, destroy the death animation obstacle
			game.thread(function()
				game.wait(5)
				Destroy({ Id = deathAnimationObstacle })
			end)
		end
	end

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

modutil.mod.Path.Wrap("UnitInvulnerableHitPresentation", function(base, blocker, args)
	if blocker.ProjectileBlockSoundName then
		PlaySound({ Name = blocker.ProjectileBlockSoundName, Id = blocker.ObjectId })
	end

	base(blocker, args)
end)
