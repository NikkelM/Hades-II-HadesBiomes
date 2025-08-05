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

modutil.mod.Path.Wrap("KillEnemy", function(base, victim, triggerArgs)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and victim.ModsNikkelMHadesBiomesIsModdedEnemy then
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
				game.thread(game.EnrageUnit, game.ActiveEnemies[unitIdToEnrage], game.CurrentRun, victim.EnrageOnDeathStartDelay)
			end
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
