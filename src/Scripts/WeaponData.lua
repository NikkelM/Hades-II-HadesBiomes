-- Loads WeaponData from the Hades file
local function LoadHadesWeaponData()
	local originalWeaponData = game.DeepCopyTable(game.WeaponData)
	local originalProjectileData = game.DeepCopyTable(game.ProjectileData)
	local originalEffectData = game.DeepCopyTable(game.EffectData)
	local originalWeaponEquipOrderData = game.DeepCopyTable(game.GameData.WeaponEquipOrder)
	local originalMissingPackages = game.DeepCopyTable(game.GameData.MissingPackages)

	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts\\WeaponData.lua")
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		local hadesWeaponData = WeaponData
		local hadesProjectileData = ProjectileData

		game.WeaponData = originalWeaponData
		game.ProjectileData = originalProjectileData
		game.EffectData = originalEffectData
		game.GameData.WeaponEquipOrder = originalWeaponEquipOrderData
		game.GameData.MissingPackages = originalMissingPackages

		return hadesWeaponData, hadesProjectileData
	else
		mod.DebugPrint("Error loading WeaponData: " .. err, 1)
	end
end

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

-- Adds weapons from Hades to Hades II
local hadesWeaponData, hadesProjectileData = LoadHadesWeaponData()

-- Some weapons exist in both Hades and Hades II, so we need to rename the Hades weapons
for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	hadesWeaponData[newName] = hadesWeaponData[oldName]
	hadesWeaponData[oldName] = nil
	-- Update the name in dependent fields
	-- Inherit properties from this name
	mod.UpdateField(hadesWeaponData, oldName, newName, { "InheritFrom" }, "WeaponData")
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
		Requirements =
		{
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
			ProjectileName = "HeavyRangedWeaponSplitter",
			NumProjectiles = 8,
			ProjectileStartAngleOffset = 45,
			ProjectileInterval = 0.25,
			ProjectileAngleEvenlySpaced = true,
		},
	},
	HeavyRangedSplitterFragment = {
		AIData = {
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
		AIData = {
			AttackSlotInterval = 0.01,
			ProjectileName = "HarpyLightningTisiphone",
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
}

-- Modifications easier done in a loop
for _, attackSlot in ipairs(hadesWeaponData.SummonTisiphoneBombingRun.AIData.AttackSlots) do
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

applyModificationsAndInheritWeaponData(hadesWeaponData, weaponModifications, weaponKeyReplacements)

-- Projectiles
local function applyModificationsAndInheritProjectileData(base, modifications, projectileKeyReplacements)
	-- Apply modifications
	for projectileName, projectileData in pairs(modifications) do
		if not base[projectileName] then
			base[projectileName] = {}
		end
		mod.ApplyModifications(base[projectileName], projectileData)
	end

	-- Process data inheritance and add the new data to the game's global
	base = mod.AddTableKeysSkipDupes(game.ProjectileData, base, nil)
	for projectileName, projectileData in pairs(base) do
		mod.RenameKeys(projectileData, projectileKeyReplacements, projectileName)

		game.ProcessDataInheritance(projectileData, game.ProjectileData)
		base[projectileName] = projectileData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.ProjectileData, base)
end

local projectileModifications = {
	HeavyRangedWeapon = {
		OnHitFunctionNames = { "ModsNikkelMHadesBiomesHeavyRangedCrystalOnWeaponHit" },
	},
	HeavyRangedWeaponSplitter = {
		InheritFrom = { "HeavyRangedWeapon", },
		OnHitFunctionNames = { "ModsNikkelMHadesBiomesHeavyRangedCrystalOnWeaponHit" },
	},
	HarpyLightning = {
		InheritFrom = { "NoSlowFrameProjectile", },
	},
}

local projectileKeyReplacements = {
	CancelVulnerabilitySpark = "CancelHitSpark",
}

applyModificationsAndInheritProjectileData(hadesProjectileData, projectileModifications, projectileKeyReplacements)
