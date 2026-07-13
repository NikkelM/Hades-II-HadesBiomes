modutil.mod.Path.Wrap("HitByFreezeWeapon", function(base, victim)
	if victim and victim.ObjectId then
		-- So the player doesn't slide while sprinting, brings them to a smooth stop
		EndRamWeapons({ Id = victim.ObjectId })
	end

	return base(victim)
end)

modutil.mod.Path.Wrap("AddEffectBlock", function(base, args)
	args = args or {}
	base(args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and args.Id == game.CurrentRun.Hero.ObjectId then
		if args.Name == "MedeaPoison" then
			-- For poison pools or darts in Styx
			args.Name = "StyxPoison"
			AddEffectBlock(args)
			ClearEffect({ Id = args.Id, Name = "StyxPoison" })
			-- For FreezeShotUnit
			args.Name = "FreezeStun"
			AddEffectBlock(args)
			ClearEffect({ Id = args.Id, Name = "FreezeStun" })
			game.CurrentRun.Hero.ModsNikkelMHadesBiomesBoilingBloodShieldActive = true
		elseif args.Name == "ModsNikkelMHadesBiomesHadesCastBlock" then
			--Blocked from Black Coat/WeaponSuit
			game.CurrentRun.Hero.ModsNikkelMHadesBiomesBoilingBloodShieldActive = true
		end
	end
end)

modutil.mod.Path.Wrap("RemoveEffectBlock", function(base, args)
	args = args or {}
	base(args)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and args.Id == game.CurrentRun.Hero.ObjectId then
		if args.Name == "MedeaPoison" then
			-- For poison pools or darts in Styx
			args.Name = "StyxPoison"
			RemoveEffectBlock(args)
			-- For FreezeShotUnit
			args.Name = "FreezeStun"
			RemoveEffectBlock(args)
			game.CurrentRun.Hero.ModsNikkelMHadesBiomesBoilingBloodShieldActive = false
		elseif args.Name == "ModsNikkelMHadesBiomesHadesCastBlock" then
			--Blocked from Black Coat/WeaponSuit
			game.CurrentRun.Hero.ModsNikkelMHadesBiomesBoilingBloodShieldActive = false
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

-- Returns either the default offset, or a per-enemy offset defined in the enemyModifications
function mod.GetModdedEnemyEffectVfxOffsetZ(victim, vfx)
	if vfx == nil or not mod.HeadMarkerEffectVfxes[vfx] then
		return nil
	end

	return (victim and victim.ModsNikkelMHadesBiomesEffectVfxOffsetZ) or mod.DefaultModdedEnemyHeadVfxOffsetZ
end
