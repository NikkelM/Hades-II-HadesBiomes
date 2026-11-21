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

-- #region SnakeFamiliar
function mod.SnakeVenomOnHit(victim, victimId, triggerArgs)
	if victim.IsDead or IsInvulnerable({ Id = victim.ObjectId }) then
		return
	end

	local traitData = game.GetProcessedTraitData({
		Unit = game.CurrentRun.Hero,
		TraitName = "ModsNikkelMHadesBiomesSnakePoisonStacks",
		StackNum = game.GetFamiliarTraitStacks("ModsNikkelMHadesBiomesSnakePoisonStacks"),
	})
	local dataProperties = game.DeepCopyTable(game.EffectData.ModsNikkelMHadesBiomesSnakeVenom.DataProperties)
	dataProperties.Duration = traitData.ModsNikkelMHadesBiomesSnakeVenomDuration

	ApplyEffect({
		Id = triggerArgs.AttackerId,
		DestinationId = victim.ObjectId,
		EffectName = "ModsNikkelMHadesBiomesSnakeVenom",
		NumStacks = traitData.ModsNikkelMHadesBiomesSnakeVenomStacksPerHit,
		DataProperties = dataProperties,
	})
end

function mod.SnakeVenomApply(triggerArgs)
	local slowEffectData = game.EffectData.ModsNikkelMHadesBiomesSnakeVenomSlow
	local dataProperties = game.DeepCopyTable(slowEffectData.DataProperties)
	dataProperties.Duration = triggerArgs.Duration

	ApplyEffect({
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationId = triggerArgs.Victim.ObjectId,
		EffectName = slowEffectData.EffectName,
		DataProperties = dataProperties,
	})
end

function mod.SnakeVenomClear(triggerArgs)
	ClearEffect({
		Id = triggerArgs.Victim.ObjectId,
		Name = "ModsNikkelMHadesBiomesSnakeVenomSlow",
	})
end

-- #endregion
