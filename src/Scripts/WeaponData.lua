-- Applies modifications to base weapon objects, and then adds the new weapon objects to the game
local function applyModificationsAndInheritWeaponData(base, modifications, weaponKeyReplacements, AIRequirements)
	-- Apply modifications
	for weaponName, weaponData in pairs(modifications) do
		if not base[weaponName] then
			base[weaponName] = {}
		end
		mod.ApplyModifications(base[weaponName], weaponData)
	end

	-- Move weapon requirements/eligibility data to the Requirements table
	for weaponName, weaponData in pairs(base) do
		print("Processing weapon: " .. weaponName)
		local printWeapon = false
		if weaponData.AIData then
			local aiData = weaponData.AIData
			for key, value in pairs(aiData) do
				if game.Contains(AIRequirements, key) then
					if not weaponData.Requirements then
						weaponData.Requirements = {}
					end
					printWeapon = true
					-- Respect existing override from modifications above
					weaponData.Requirements[key] = weaponData.Requirements[key] or value
					aiData[key] = nil
				end
			end
		end
		if printWeapon then
			mod.PrintTable(weaponData)
			print()
		end
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
	mod.UpdatePropertyName(mod.HadesWeaponData, oldName, newName, {}, "WeaponData")
	-- Inherit properties from this weapon
	mod.UpdateField(mod.HadesWeaponData, oldName, newName, { "InheritFrom" }, "WeaponData")
end

-- Modify or add weapons
local weaponModifications = {
	-- #region TARTARUS
	-- #region Regular
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
	-- #endregion

	-- #region TARTARUS - MEGAERA

	HarpyLightning = {
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
	-- #endregion

	-- #region TARTARUS - ALECTO
	HarpyLungeAlecto = {
		AIData = {
			PreAttackStop = true,
		},
	},
	HarpyWhipArc = {
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
			-- TODO: Check MaxActiveSpawns - was 1, in Hades 5
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
		AIData = {
			PreAttackStop = true,
		},
	},
	HarpyWhipShotRage = {
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
	-- #endregion

	-- #region TARTARUS - TISIPHONE
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
	-- #endregion
	-- #endregion

	-- #region ASPHODEL
	-- #region Regular
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
	-- #endregion

	-- #region ASPHODEL - Witches Circle
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
	-- #endregion

	-- #region ASPHODEL - HYDRA
	HydraCrusher = {
		GameStateRequirements = {
			-- TODO: Is broken
			Skip = true,
		},
	},
	HydraLunge = {
		Requirements = {
			MaxConsecutiveUses = 3,
		},
		AIData = {
			PreAttackDuration = 0.8,
			MoveWithinRangeTimeout = 0.5,
		},
	},
	HydraLungeUntethered = {
		Requirements = {
			MaxConsecutiveUses = 3,
		},
	},
	HydraSlam = {
		AIData = {
			PostAttackDuration = 0.5,
			MoveWithinRange = false,
		},
	},
	HydraDart = {
		AIData = {
			AIMoveWithinRangeTimeout = 1.0,
			PostAttackDuration = 0.5,
		},
	},
	-- #endregion

	-- #endregion

	-- #region ELYSIUM
	-- #region Regular
	ShadeSideDash = {
		AIData = {
			-- Causes an infinite loop, as this would be set to itself
			AttackFailWeapon = mod.NilValue,
		},
	},
	ShadeBowSideDash = {
		AIData = {
			-- Causes an infinite loop, as this would be set to itself
			AttackFailWeapon = mod.NilValue,
		},
	},
	-- #endregion

	-- #region ELYSIUM - MINOTAUR
	Minotaur5AxeCombo3 = {
		AIData = {
			PostAttackAnimation = "MinotaurAttackSwings_AttackLeap",
			-- Applied after takeoff
			FireSelfVelocity = 2000,
			FireSelfUpwardVelocity = 1200,
			-- Don't track during fire, but allow tracking during charge
			StopBeforeFire = true,
			-- If not set, Minotaur stays in one spot each leap
			TrackTargetDuringCharge = true,
			-- Can jump from anywhere
			MoveWithinRange = false,
			PreFireDuration = 0.0,
		},
	},
	Minotaur5AxeCombo4 = {
		AIData = {
			PostAttackAnimation = "MinotaurAttackSwings_AttackLeap",
			FireSelfVelocity = 2000,
			FireSelfUpwardVelocity = 1200,
			StopBeforeFire = true,
			TrackTargetDuringCharge = true,
			MoveWithinRange = false,
			PreFireDuration = 0.0,
			-- Comes down too quickly otherwise
			FireDuration = 0.3,
		},
	},
	MinotaurLeapCombo5 = {
		AIData = {
			PostAttackAnimation = "MinotaurAttackSwings_AttackLeap",
			FireSelfVelocity = 2000,
			FireSelfUpwardVelocity = 1200,
			TrackTargetDuringCharge = true,
			MoveWithinRange = false,
			StopBeforeFire = true,
			PreFireDuration = 0.0,
		},
	},
	-- #endregion

	-- #region ELYSIUM - THESEUS
	-- #endregion
	-- #endregion

	-- #region STYX
	-- #endregion
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

local AIRequirements = {
	"MaxConsecutiveUses",
	"MinAttacksBetweenUse",
	"MaxUses",
	"MaxPlayerDistance",
	"MinPlayerDistance",
	"MaxAttackers",
	"RequireTotalAttacks",
	"RequiresNotCharmed",
	"MaxActiveSpawns",
	"RequiresNotEnraged",
	"ForceUseIfReady",
	"BlockAsFirstWeapon",
	"ForceFirst",
}

applyModificationsAndInheritWeaponData(mod.HadesWeaponData, weaponModifications, weaponKeyReplacements, AIRequirements)
