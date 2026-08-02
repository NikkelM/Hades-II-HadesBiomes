modutil.mod.Path.Context.Wrap.Static("DamageEchoTrigger",
	function(origEnemy, effectName, damageMultiplier, additiveDamageMultiplier, cooldown)
		modutil.mod.Path.Wrap("CreateAnimation", function(base, args)
			if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and args and args.Name == "ZeusEchoDebuffSwell"
					and args.OffsetZ == nil and args.DestinationId then
				local enemy = game.ActiveEnemies[args.DestinationId]
				if enemy and enemy.ModsNikkelMHadesBiomesIsModdedEnemy and not enemy.ModsNikkelMHadesBiomesOriginalHadesTwoEnemy then
					args.OffsetZ = mod.GetModdedEnemyEffectVfxOffsetZ(enemy, "ZeusEchoDebuff") or 0
				end
			end

			return base(args)
		end)
	end)
