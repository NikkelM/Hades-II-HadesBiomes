-- Applies modifications to base weapon objects, and then adds the new weapon objects to the game
local function applyModificationsAndInheritWeaponData(base, modifications, weaponKeyReplacements)
	-- Apply modifications
	for weaponName, weaponData in pairs(modifications) do
		if not base[weaponName] then
			base[weaponName] = {}
		end
		mod.ApplyModifications(base[weaponName], weaponData)
	end

	-- Process data inheritance and add the new data to the game's global
	base = mod.AddTableKeysSkipDupes(game.WeaponData, base, nil)
	for weaponName, weaponData in pairs(base) do
		-- Replace keys that were renamed between the games
		mod.RenameKeys(weaponData, weaponKeyReplacements, weaponName)

		game.ProcessDataInheritance(weaponData, game.WeaponData)
		base[weaponName] = weaponData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.WeaponData, base)
end

-- Some weapons exist in both Hades and Hades II, so we need to rename the Hades weapons
for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	mod.UpdatePropertyName(mod.HadesWeaponData, oldName, newName, { }, "WeaponData")
	-- Inherit properties from this weapon
	mod.UpdateField(mod.HadesWeaponData, oldName, newName, { "InheritFrom" }, "WeaponData")
end

-- Modify or add weapons
local weaponModifications = {
	-- TARTARUS
	HeavyRangedWeapon = {
		AIData = {
			ExpireProjectilesOnHitStun = true,
			ExpireProjectilesOnFreeze = true,
			ExpireProjectilesOnPolymorph = true,
			ProjectileName = "HeavyRangedWeapon",
		},
	},
	HadesLightSpawnerSpawnerWeapon = {
		Requirements = {
			MaxActiveSpawns = 5,
			RequiresNotCharmed = true,
		},
		AIData = {
			SpawnBurstDelay = 4.5,
			SpawnsPerBurst = 3,
			SpawnRadius = 0,
			SpawnRate = 1.2,
			SpawnDelay = 0.6,
			SpawnedAggroTetherDistance = 750,
			SpawnAggroed = false,
			SpawnerOptions = { "HadesSwarmer" },
			NoProjectile = true,
			SpawnBurstOnFire = true,
			MaxActiveSpawns = 5,
			SpawnsSkipActivatePresentation = true,
		},
	},
	SwarmerMelee = {
		AIData = {
			DeepInheritance = true,
			ProjectileName = "HadesSwarmerMelee",
			PreAttackEndShake = true,
			FireProjectileStartDelay = 0.03,
			-- Modified, as the original 1800 is too short
			FireSelfVelocity = 3300,
			ApplyEffectsOnWeaponFire = { WeaponEffectData.AttackHighGrip, },
			PreAttackDuration = 0.5,
			FireDuration = 0.25,
			PostAttackDuration = 0.5,
			PreAttackAnimation = "EnemyWretchSwarmerAttackCharge",
			FireAnimation = "EnemyWretchSwarmerAttackFire",
			PostAttackAnimation = "EnemyWretchSwarmerPostAttack",
			AttackDistance = 350,
			RetreatBufferDistance = 550,
			RetreatAfterAttack = true,
			RequireUnitLoS = true,
			LoSBuffer = 80,
			LoSEndBuffer = 32,
		},
	},
	HeavyRangedWeaponSplitter = {
		InheritFrom = { "HeavyRangedWeapon", },
		AIData = {
			DeepInheritance = true,
			ProjectileName = "HeavyRangedWeaponSplitter",
			NumProjectiles = 8,
			ProjectileStartAngleOffset = 45,
			ProjectileInterval = 0.25,
			ProjectileAngleEvenlySpaced = true,
		},
	},
	HeavyRangedSplitterFragment = {
		AIData = {
			DeepInheritance = true,
			TargetClosestOfTypes = { "HeavyRangedSplitterMiniboss" },
			TargetClosest = mod.NilValue,
			TargetFriends = mod.NilValue,
			ExpireProjectilesOnHitStun = true,
			ExpireProjectilesOnFreeze = true,
			ExpireProjectilesOnPolymorph = true,
		},
	},

	-- TARTARUS - MEGAERA
	HarpyLunge = {
		Requirements = {
			MaxConsecutiveUses = 2,
		},
	},
	HarpyWhipWhirl = {
		Requirements = {
			MinAttacksBetweenUse = 2,
			MaxPlayerDistance = 600,
		},
	},
	HarpyBeam = {
		Requirements = {
			MinAttacksBetweenUse = 3,
		},
	},
	HarpyLightning = {
		Requirements = {
			MinAttacksBetweenUse = 3,
		},
		AIData = {
			AttackSlotInterval = 0.01,
			ProjectileName = "HarpyLightning",
		},
	},
	SummonMegaeraWhipWhirl = {
		AIData = {
			ProjectileName = "SummonMegaeraWhipWhirl",
		},
	},
	SummonMegaeraHarpyBeam = {
		AIData = {
			ProjectileName = "HarpyBeamSky",
			NumProjectiles = 8,
			ProjectileInterval = 0.3,
		},
	},
	-- TARTARUS - ALECTO
	HarpyLungeAlecto = {
		Requirements = {
			MaxConsecutiveUses = 2,
		},
		AIData = {
			PreAttackStop = true,
		},
	},
	HarpyWhipArc = {
		Requirements = {
			MaxConsecutiveUses = 1,
		},
		AIData = {
			PreAttackStop = true,
		},
	},
	HarpyWhipRageBeam = {
		AIData = {
			ProjectileName = "HarpyBeamAlecto",
			NumProjectiles = 5,
			ProjectileAngleInterval = 30,
		},
	},
	HarpyBuildRage = {
		Requirements = {
			MaxActiveSpawns = 1,
			MinAttacksBetweenUse = 5,
			RequiresNotEnraged = true,
			ForceUseIfReady = true,
			BlockAsFirstWeapon = true,
		},
		AIData = {
			PreAttackStop = true,
			PreAttackDuration = 1.5,
			FireMoveTowardTarget = true,
			StopMoveWithinRange = true,
			MoveSuccessDistance = 25,
			ProjectileName = "HarpyBuildRage",
			-- Zagreus voicelines
			PreAttackVoiceLines = mod.NilValue,
		},
	},
	HarpyLightningChase = {
		Requirements = {
			MinAttacksBetweenUse = 5,
		},
		AIData = {
			PreAttackStop = true,
			PreAttackDuration = 0.0,
			FireMoveTowardTarget = true,
			StopMoveWithinRange = true,
			MoveSuccessDistance = 25,
			AttackSlotInterval = 0.01,
			ProjectileName = "HarpyLightningAlecto",
		},
	},
	HarpyLightningChaseRage = {
		Requirements = {
			MinAttacksBetweenUse = 5,
		},
		AIData = {
			PreAttackStop = true,
			PreAttackDuration = 0.0,
			FireMoveTowardTarget = true,
			AttackSlotInterval = 0.01,
			ProjectileName = "HarpyLightningAlecto",
		},
	},
	HarpyBuildRageBlast = {
		AIData = {
			PreAttackStop = true,
			EndOnFlagName = "HarpyBuildRageEarlyExit",
			-- Increasing to match new animation lengths
			FireTicks = 9,
			NumProjectiles = 10,
			ProjectileAngleEvenlySpaced = true,
			ProjectileName = "HarpyBeamAlecto",
		},
	},
	HarpyWhipShot = {
		Requirements = {
			MaxConsecutiveUses = 3,
		},
		AIData = {
			PreAttackStop = true,
		},
	},
	HarpyWhipShotRage = {
		Requirements = {
			MaxConsecutiveUses = 3,
		},
		AIData = {
			PreAttackStop = true,
		},
	},
	SummonAlectoWhipShot = {
		AIData = {
			ProjectileName = "HarpyWhipShotSky",
		},
	},
	SummonAlectoLightningChase = {
		AIData = {
			ProjectileName = "HarpyLightningAlecto",
		},
	},
	-- TARTARUS - TISIPHONE
	HarpyWhipCombo1 = {
		Requirements = {
			MaxConsecutiveUses = 1,
		},
	},
	HarpyLightningLine = {
		Requirements = {
			BlockAsFirstWeapon = true,
		},
		AIData = {
			AttackSlotInterval = 0.01,
			ProjectileName = "HarpyLightningTisiphone",
		},
	},
	HarpyWhipLasso = {
		Requirements = {
			ForceFirst = true,
		},
	},
	HarpyLungeSurgeBeam = {
		AIData = {
			ProjectileName = "HarpyBeamTisiphone",
			NumProjectiles = 2,
			ProjectileAngleInterval = 180,
			ProjectileStartAngleOffset = 90,
		},
	},
	HarpySlowBeam360 = {
		Requirements = {
			MinAttacksBetweenUse = 2,
			BlockAsFirstWeapon = true,
		},
		AIData = {
			ProjectileName = "HarpySlowBeam",
			NumProjectiles = 36,
			ProjectileInterval = 0.0025,
			ProjectileAngleEvenlySpaced = true,
		},
	},
	HarpyLightningCardinal = {
		AIData = {
			AttackSlotInterval = 0.01,
			ProjectileName = "HarpyLightningTisiphone",
		},
	},
	SummonTisiphoneBombingRun = {
		AIData = {
			AttackSlotInterval = 0.01,
			ProjectileName = "HarpyLightningTisiphone",
		},
	},
	SummonTisiphoneFog = {
		AIData = {
			ProjectileName = "TisiphoneFog",
		},
	},

	-- ASPHODEL
	HadesLightSpawnerEliteSpawnerWeapon = {
		Requirements = {
			MaxActiveSpawns = 6,
			RequiresNotCharmed = true,
		},
		AIData = {
			SpawnBurstDelay = 4.5,
			SpawnsPerBurst = 3,
			SpawnRadius = 0,
			SpawnRate = 1.2,
			SpawnDelay = 0.6,
			SpawnedAggroTetherDistance = 1200,
			SpawnAggroed = false,
			SpawnerOptions = { "SwarmerElite" },
			NoProjectile = true,
			SpawnBurstOnFire = true,
			MaxActiveSpawns = 6,
			SpawnsSkipActivatePresentation = true,
		},
	},
	-- Swap which weapon is used first due to how the activate animation was changed
	RangedBurrowerBurrow = {
		AIData = {
			ForceFirst = true,
		},
		ForceFirst = mod.NilValue,
	},
	-- ASPHODEL - Witches Circle
	SpreadShotMinibossRadial = {
		-- Fixing the animations and increasing the cooldown to scale with difficulty of not being able to destroy projectiles
		-- Decreasing cooldown again if the shrine upgrade is active, to increase difficulty
		AIData = {
			PreAttackAnimation = "Enemy_LightRanged_CastPreAttack",
			PreAttackWaitForAnimation = true,
			PostAttackCooldown = mod.NilValue,
			PostAttackCooldownMin = 2.0,
			PostAttackCooldownMax = 3.0,
		},
		ShrineMetaUpgradeName = "MinibossCountShrineUpgrade",
		ShrineMetaUpgradeRequiredLevel = 1,
		ShrineAIDataOverwrites = {
			PostAttackCooldownMin = 1.5,
			PostAttackCooldownMax = 1.5,
		},
	},
	SpreadShotMinibossCone = {
		AIData = {
			PreAttackAnimation = "Enemy_LightRanged_CastPreAttack",
			PreAttackWaitForAnimation = true,
			PostAttackCooldown = mod.NilValue,
			PostAttackCooldownMin = 2.0,
			PostAttackCooldownMax = 3.0,
		},
		ShrineMetaUpgradeName = "MinibossCountShrineUpgrade",
		ShrineMetaUpgradeRequiredLevel = 1,
		ShrineAIDataOverwrites = {
			PostAttackCooldownMin = 1.5,
			PostAttackCooldownMax = 1.5,
		},
	},
	SpreadShotMinibossCross = {
		AIData = {
			PreAttackAnimation = "Enemy_LightRanged_CastPreAttack",
			PreAttackWaitForAnimation = true,
			PostAttackCooldown = mod.NilValue,
			PostAttackCooldownMin = 2.0,
			PostAttackCooldownMax = 3.0,
		},
		ShrineMetaUpgradeName = "MinibossCountShrineUpgrade",
		ShrineMetaUpgradeRequiredLevel = 1,
		ShrineAIDataOverwrites = {
			PostAttackCooldownMin = 1.5,
			PostAttackCooldownMax = 1.5,
		},
	},
	-- ASPHODEL - HYDRA
	HydraCrusher = {
		GameStateRequirements = {
			-- Is broken
			Skip = true,
		},
	},
	HydraLunge = {
		Requirements = {
			MinAttacksBetweenUse = 2,
			MinPlayerDistance = 350,
			MaxConsecutiveUses = 3,
		},
		AIData = {
			PreAttackDuration = 0.8,
			MoveWithinRangeTimeout = 0.5,
		},
	},
	HydraLungeUntethered = {
		Requirements = {
			MinAttacksBetweenUse = 0,
			MaxConsecutiveUses = 3,
		},
	},
	HydraSlam = {
		Requirements = {
			MaxPlayerDistance = 600,
			MinAttacksBetweenUse = 2,
			ForceUseIfReady = true,
		},
		AIData = {
			PostAttackDuration = 0.5,
			MoveWithinRange = false,
		},
	},
	HydraSlamUntethered = {
		Requirements = {
			MinAttacksBetweenUse = 1,
			ForceUseIfReady = false,
			MaxPlayerDistance = 800,
		},
	},
	HydraSlamScattered = {
		Requirements = {
			MaxPlayerDistance = 9999,
		},
	},
	HydraSlamScatteredFrenzy = {
		Requirements = {
			MaxPlayerDistance = 9999,
		},
	},
	HydraPull = {
		Requirements = {
			MinAttacksBetweenUse = 3,
			ForceUseIfReady = true,
		},
	},
	HydraLavaSpit = {
		Requirements = {
			MinAttacksBetweenUse = 1,
			ForceUseIfReady = true,
		},
	},
	HydraLavaSpit2 = {
		Requirements = {
			MinAttacksBetweenUse = 1,
			MinPlayerDistance = 450,
		},
	},
	HydraLavaSpitFrenzy = {
		Requirements = {
			MaxConsecutiveUses = 1,
		},
	},
	HydraLavaSpitExterior = {
		Requirements = {
			MinAttacksBetweenUse = 1,
			ForceUseIfReady = true,
			MinPlayerDistance = 450,
		},
	},
	HydraLavaSpitInterior = {
		Requirements = {
			MinAttacksBetweenUse = 1,
			MaxPlayerDistance = 700,
		},
	},
	HydraDart = {
		Requirements = {
			MinAttacksBetweenUse = 2,
		},
		AIData = {
			AIMoveWithinRangeTimeout = 1.0,
			PostAttackDuration = 0.5,
		},
	},
	HydraDartVolley = {
		Requirements = {
			MinAttacksBetweenUse = 1,
		},
	},
	HydraRoar = {
		Requirements = {
			MaxConsecutiveUses = 1,
			ForceUseIfReady = true,
		},
	},
	HydraRoarVolleyLeft = {
		Requirements = {
			MaxConsecutiveUses = 1,
			ForceUseIfReady = true,
		},
	},
	HydraRoarVolleyRight = {
		Requirements = {
			MaxConsecutiveUses = 1,
			ForceUseIfReady = true,
		},
	},
	HydraRoarVolleyInsideOut = {
		Requirements = {
			MaxConsecutiveUses = 1,
			ForceUseIfReady = true,
		},
	},
	HydraSummon = {
		Requirements = {
			MinAttacksBetweenUse = 3,
			ForceUseIfReady = true,
			MaxActiveSpawns = 10,
		},
	},
	HydraSummon2 = {
		Requirements = {
			MinAttacksBetweenUse = 3,
			ForceUseIfReady = true,
			MaxActiveSpawns = 5,
		},
	},
	HydraSummonSpread = {
		Requirements = {
			MinAttacksBetweenUse = 4,
			ForceUseIfReady = true,
			MaxActiveSpawns = 5,
		},
	},
	HydraSpawns = {
		Requirements = {
			MaxActiveSpawns = 10,
		},
	},
	HydraHeal = {
		Requirements = {
			MinAttacksBetweenUse = 1,
		},
	},
}

-- Modifications easier done in a loop
for _, attackSlot in ipairs(mod.HadesWeaponData.SummonTisiphoneBombingRun.AIData.AttackSlots) do
	attackSlot.AnchorOffset = attackSlot.AnchorAngleOffset or nil
	attackSlot.AnchorAngleOffset = nil
	attackSlot.AnchorOffsetAngle = 0
end

local renamedWeaponModifications = {}

for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	if weaponModifications[oldName] then
		renamedWeaponModifications[newName] = weaponModifications[oldName]
		weaponModifications[oldName] = nil
		mod.DebugPrint("Renamed weapon modification: " .. oldName .. " to " .. newName .. " in WeaponData", 4)
	end
end
for key, value in pairs(renamedWeaponModifications) do
	weaponModifications[key] = value
end

local weaponKeyReplacements = {
	AIData = {
		AIAttackDistance = "AttackDistance",
		AIBufferDistance = "RetreatBufferDistance",
		AITrackTargetDuringCharge = "TrackTargetDuringCharge",
		AILineOfSightBuffer = "LoSBuffer",
		AIMoveWithinRangeTimeout = "MoveWithinRangeTimeout",
		TargetFriends = "TargetRequiredKillEnemy",
		AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
		AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
		AIRequireUnitLineOfSight = "RequireUnitLoS",
		AIRequireProjectileLineOfSight = "RequireProjectileLoS",
		AILineOfSighEndBuffer = "LoSEndBuffer",
		AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
		AIFireTicksMin = "FireTicksMin",
		AIFireTicksMax = "FireTicksMax",
		AIFireTicksCooldown = "FireInterval",
		StandOffTime = "SurroundRefreshInterval",
		FireCooldown = "FireInterval",
	},
	-- Same as above
	ShrineAIDataOverwrites = {
		AIAttackDistance = "AttackDistance",
		AIBufferDistance = "RetreatBufferDistance",
		AITrackTargetDuringCharge = "TrackTargetDuringCharge",
		AILineOfSightBuffer = "LoSBuffer",
		AIMoveWithinRangeTimeout = "MoveWithinRangeTimeout",
		TargetFriends = "TargetRequiredKillEnemy",
		AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
		AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
		AIRequireUnitLineOfSight = "RequireUnitLoS",
		AIRequireProjectileLineOfSight = "RequireProjectileLoS",
		AILineOfSighEndBuffer = "LoSEndBuffer",
		AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
		AIFireTicksMin = "FireTicksMin",
		AIFireTicksMax = "FireTicksMax",
		AIFireTicksCooldown = "FireInterval",
		StandOffTime = "SurroundRefreshInterval",
		FireCooldown = "FireInterval",
	},
}

applyModificationsAndInheritWeaponData(mod.HadesWeaponData, weaponModifications, weaponKeyReplacements)
