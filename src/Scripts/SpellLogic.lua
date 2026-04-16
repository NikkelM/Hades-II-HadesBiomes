modutil.mod.Path.Wrap("PolymorphStunApply", function(base, triggerArgs)
	local enemy = triggerArgs.Victim
	if enemy.ModsNikkelMHadesBiomesIsModdedEnemy and enemy.SpawnerThreadName then
		game.killWaitUntilThreads(enemy.SpawnerThreadName)
		game.killTaggedThreads(enemy.SpawnerThreadName)
	end

	return base(triggerArgs)
end)

modutil.mod.Path.Wrap("PolymorphStunClear", function(base, triggerArgs)
	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		local enemy = triggerArgs.Victim
		if enemy.ModsNikkelMHadesBiomesIsModdedEnemy and (enemy.IsDead or enemy.Health <= 0) then
			-- Suppress death weapons if killed under polymorph
			enemy.SpawnUnitOnDeath = nil
			-- Flag so KillPresentation skips the mod's manual death animation
			enemy.ModsNikkelMHadesBiomesDiedWhilePolymorphed = true
			-- Prevent the base game from restoring the original model/animation, which would briefly flash the original sprite before the entity is destroyed
			enemy.PrePolymorphGrannyModel = nil
			enemy.PrePolymorphGraphic = nil
			-- Use the sheep's death visuals instead of the original enemy's
			enemy.DeathAnimation = "Blank"
			enemy.DeathFx = "SheepDisappearFx"
			enemy.DeathSound = "/SFX/Enemy Sounds/Sheep/EmoteDying"
		end
	end

	return base(triggerArgs)
end)
