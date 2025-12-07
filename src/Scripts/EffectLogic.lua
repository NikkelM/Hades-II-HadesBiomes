-- Exact same as the original, but with a different trigger animation (for the Z-Offset)
function mod.ModsNikkelMHadesBiomesDamageEchoTrigger(enemy, effectName, damageMultiplier, additiveDamageMultiplier,
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
			mod.ModsNikkelMHadesBiomesDamageEchoTrigger(enemy, effectName, damageMultiplier, additiveDamageMultiplier,
				cooldown)
		else
			return base(enemy, effectName, damageMultiplier, additiveDamageMultiplier, cooldown)
		end
	end)


modutil.mod.Path.Wrap("AddEffectBlock", function(base, args)
	args = args or {}
	base(args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- Also block Styx Poison and Hades' Boiling Blood every time we block Medea Poison
		if args.Name == "MedeaPoison" then
			args.Name = "StyxPoison"
			AddEffectBlock(args)
			-- Also clear any already applied stacks immediately
			ClearEffect({ Id = args.Id or game.CurrentRun.Hero.ObjectId, Name = "StyxPoison" })
			game.CurrentRun.Hero.ModsNikkelMHadesBiomesHitShieldEffectBlockActive = true
		end
	end
end)

modutil.mod.Path.Wrap("RemoveEffectBlock", function(base, args)
	args = args or {}
	base(args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- Also unblock Styx Poison and Hades' Boiling Blood block every time we unblock Medea Poison
		if args.Name == "MedeaPoison" then
			args.Name = "StyxPoison"
			RemoveEffectBlock(args)
			game.CurrentRun.Hero.ModsNikkelMHadesBiomesHitShieldEffectBlockActive = false
		end
	end
end)

modutil.mod.Path.Wrap("ClearEffect", function(base, args)
	args = args or {}
	base(args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- Also clear Styx Poison every time we clear Medea Poison
		if args.Name == "MedeaPoison" then
			args.Name = "StyxPoison"
			ClearEffect(args)
		end
	end
end)
