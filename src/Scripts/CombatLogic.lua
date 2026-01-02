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
		local killer = triggerArgs.AttackerTable or {}

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

		if victim.ModsNikkelMHadesBiomesIsThanatosCursed and victim.ModsNikkelMHadesBiomesBlockOnDeathWeaponIfThanatosCursed and killer.ObjectId ~= game.CurrentRun.Hero.ObjectId then
			SetUnitProperty({ Property = "OnDeathWeapon", Value = "null", DestinationId = victim.ObjectId })
			victim.SpawnsEnemyOnDeath = false
			victim.SpawnUnitOnDeath = nil
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
	-- For ShadeNaked in the process of picking up a weapon
	if enemy.PickupTarget ~= nil then
		if enemy.PickupTarget.PickupFailedAnimation ~= nil then
			SetAnimation({ Name = enemy.PickupTarget.PickupFailedAnimation, DestinationId = enemy.PickupTarget.ObjectId })
		end
		enemy.PickupTarget = nil
	end
end)

-- Only called within OnHit, used to change the damage of the HeavyRanged lock-on hit to 0 before anything else is processed that uses it
-- The OnHitFunctionName is called too late (e.g. Gale block and HitShields still get used up before it would reduce the damage)
modutil.mod.Path.Wrap("CheckImpactReaction",
	function(base, attackerWeaponData, sourceProjectileData, victim, triggerArgs)
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and sourceProjectileData ~= nil and sourceProjectileData.ModsNikkelMHadesBiomesPreOnHitFunctionNames ~= nil and not triggerArgs.IsInvulnerable then
			for _, functionName in pairs(sourceProjectileData.ModsNikkelMHadesBiomesPreOnHitFunctionNames) do
				game.thread(game.CallFunctionName, functionName, victim, victim.ObjectId, triggerArgs)
			end
		end

		return base(attackerWeaponData, sourceProjectileData, victim, triggerArgs)
	end)
