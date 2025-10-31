-- When the enemy's armor is broken, remove the outline from any tethers as well, if applicable
modutil.mod.Path.Wrap("DoEnemyHealthBufferDeplete", function(base, enemy)
	base(enemy)
	if enemy.TetherIds ~= nil then
		for k, tetherId in ipairs(enemy.TetherIds) do
			RemoveOutline({ Id = tetherId })
		end
	end
end)

modutil.mod.Path.Wrap("KillEnemy", function(base, victim, triggerArgs)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim.ModsNikkelMHadesBiomesIsModdedEnemy then
		local killingWeaponName = triggerArgs.SourceWeapon

		if victim.SupportAIUnitId ~= nil then
			game.thread(game.Kill, game.ActiveEnemies[victim.SupportAIUnitId])
		end

		if victim.EndThreadWaitsOnDeath ~= nil then
			game.SetThreadWait(victim.EndThreadWaitsOnDeath, 0.01)
		end

		if victim.ComboPartnerId ~= nil and game.ActiveEnemies[victim.ComboPartnerId] ~= nil and not game.ActiveEnemies[victim.ComboPartnerId].IsDead then
			if game.ActiveEnemies[victim.ComboPartnerId].WaitingForPartner then
				game.SetThreadWait(game.ActiveEnemies[victim.ComboPartnerId].AIThreadName, 0.0)
			end

			if victim.ExpireComboPartnerEffectOnDeath ~= nil then
				ClearEffect({ Id = victim.ComboPartnerId, Name = victim.ExpireComboPartnerEffectOnDeath })
			end
		end

		if victim.FuseSpawnsOnDeath then
			game.thread(game.FuseSpawns, victim, { Interval = victim.FuseSpawnsInterval or nil })
		end

		if victim.EnrageOnDeath ~= nil then
			local unitIdToEnrage = GetClosestUnitOfType({ Id = victim.ObjectId, DestinationName = victim.EnrageOnDeath })
			if unitIdToEnrage ~= 0 and game.ActiveEnemies[unitIdToEnrage] ~= nil then
				game.ActiveEnemies[unitIdToEnrage].PermanentEnraged = true
				game.thread(mod.EnrageUnit, game.ActiveEnemies[unitIdToEnrage], game.CurrentRun, victim.EnrageOnDeathStartDelay)
			end
		end

		if victim.KillingWeaponBlockDeathWeapons ~= nil and game.Contains(victim.KillingWeaponBlockDeathWeapons, killingWeaponName) then
			SetUnitProperty({ Property = "OnDeathWeapon", Value = "null", DestinationId = victim.ObjectId })
			victim.SpawnsEnemyOnDeath = false
		end
	end

	base(victim, triggerArgs)

	-- These were originally called in Kill() instead of KillEnemy(), so we're moving it past the base call
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim.ModsNikkelMHadesBiomesIsModdedEnemy and victim.ObjectId ~= nil then
		if victim.OnDeathCrowdReaction ~= nil then
			game.thread(game.CrowdReactionPresentation, victim.OnDeathCrowdReaction)
		end

		if victim.StopBiomeTimerIfComboPartnerDead and not victim.CannotDieFromDamage then
			local bothBossesDead = false
			local partnerId = GetClosestUnitOfType({ Id = victim.ObjectId, DestinationName = victim.ComboPartnerName })
			if partnerId == 0 or game.RequiredKillEnemies[partnerId] == nil or game.RequiredKillEnemies[partnerId].IsDead or game.RequiredKillEnemies[partnerId].Health <= 0 then
				bothBossesDead = true
			end
		end
	end
end)

modutil.mod.Path.Wrap("CleanupEnemy", function(base, enemy)
	base(enemy)
	if enemy.DisplayAttackTimer and enemy.AttackTimerId ~= nil then
		Destroy({ Id = enemy.AttackTimerId })
	end
end)
