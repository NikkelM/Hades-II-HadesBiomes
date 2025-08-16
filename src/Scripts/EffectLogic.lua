-- Exact same as the original, but with a different trigger animation (for the Z-Offset)
function game.ModsNikkelMHadesBiomesDamageEchoTrigger(enemy, effectName, damageMultiplier, additiveDamageMultiplier,
																											cooldown)
	if enemy and not enemy.IsDead and game.IsEmpty(enemy.InvulnerableFlags) then
		CreateAnimation({
			Name = "ModsNikkelMHadesBiomesZeusEchoDebuffSwell",
			DestinationId = enemy.ObjectId,
			Scale = enemy.EffectVfxScale
		})
		additiveDamageMultiplier = additiveDamageMultiplier or 1
		enemy.QueuedDamageMultipliers[game.EffectData[effectName].ProjectileName] = additiveDamageMultiplier

		game.thread(game.CreateZeusBolt, {
			SourceId = game.CurrentRun.Hero.ObjectId,
			TargetId = enemy.ObjectId,
			Range = 1,
			SeekTarget = true,
			ProjectileName = game.EffectData[effectName].ProjectileName,
			DamageMultiplier = damageMultiplier,
			Delay = 0.45,
			Count = 1
		})
		ApplyEffect({
			DestinationId = enemy.ObjectId,
			Id = game.CurrentRun.Hero.ObjectId,
			EffectName = "DamageEchoVulnerabilityPlaceholder",
			DataProperties = game.EffectData.DamageEchoVulnerabilityPlaceholder.DataProperties
		})
		ClearEffect({ Id = enemy.ObjectId, Name = effectName })
		if cooldown then
			AddEffectBlock({ Id = enemy.ObjectId, Name = effectName })
			game.thread(game.RemoveEffectBlockOnDelay, enemy.ObjectId, cooldown, effectName)
			game.thread(game.RemoveEffectOnDelay, enemy.ObjectId, cooldown, "DamageEchoVulnerabilityPlaceholder")
		end
	end
end

modutil.mod.Path.Wrap("DamageEchoTrigger",
	function(base, enemy, effectName, damageMultiplier, additiveDamageMultiplier, cooldown)
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy.ModsNikkelMHadesBiomesIsModdedEnemy and not enemy.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
			game.ModsNikkelMHadesBiomesDamageEchoTrigger(enemy, effectName, damageMultiplier, additiveDamageMultiplier,
				cooldown)
		else
			base(enemy, effectName, damageMultiplier, additiveDamageMultiplier, cooldown)
		end
	end)
