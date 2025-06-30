-- Applies modifications to base weapon objects, and then adds the new weapon objects to the game
local function applyModificationsAndInheritWeaponData(base, modifications, replacements, weaponKeyReplacements,
																											AIRequirements, SjsonToAIDataProperties)
	for oldName, newName in pairs(mod.EnemyWeaponMappings) do
		mod.UpdatePropertyName(modifications, oldName, newName, {}, "WeaponDataHandler modifications")
		mod.UpdatePropertyName(replacements, oldName, newName, {}, "WeaponDataHandler replacements")
	end

	-- Apply replacements/additions
	for weaponName, weaponData in pairs(replacements) do
		if not base[weaponName] then
			base[weaponName] = {}
		end
		mod.ApplyModifications(base[weaponName], weaponData, true)
	end

	-- Apply modifications
	for weaponName, weaponData in pairs(modifications) do
		if not base[weaponName] then
			base[weaponName] = {}
		end
		mod.ApplyModifications(base[weaponName], weaponData)
	end

	-- Move weapon requirements/eligibility data to the Requirements table
	for weaponName, weaponData in pairs(base) do
		if weaponData.AIData then
			local aiData = weaponData.AIData
			for key, value in pairs(aiData) do
				if game.Contains(AIRequirements, key) then
					if not weaponData.Requirements then
						weaponData.Requirements = {}
					end
					-- Respect existing override from modifications above
					weaponData.Requirements[key] = weaponData.Requirements[key] or value
				end
			end
		end

		-- Copy properties to the WeaponData table according to the SjsonToAIDataProperties
		if not weaponData.AIData then
			weaponData.AIData = { DeepInheritance = true }
		end
		-- If there is not already a projectile, the enemy should have a projectile, and a projectile with this name exists
		if not weaponData.AIData.ProjectileName and not weaponData.AIData.NoProjectile then
			if mod.HadesSjsonProjectilesTable[weaponName] then
				weaponData.AIData.ProjectileName = weaponName
				-- It's likely an elite version of a weapon for which the default projectile should be used
			elseif mod.HadesSjsonWeaponsTable[weaponName] and mod.HadesSjsonWeaponsTable[weaponName].InheritFrom and mod.HadesSjsonWeaponsTable[weaponName].InheritFrom ~= "1_BasePlayerSlowWeapon" then
				weaponData.AIData.ProjectileName = mod.HadesSjsonWeaponsTable[weaponName].InheritFrom
			end
		end
		if mod.HadesSjsonWeaponsTable[weaponName] and not weaponData.AIData.NoProjectile then
			local sjsonWeaponData = mod.HadesSjsonWeaponsTable[weaponName]
			for key, value in pairs(SjsonToAIDataProperties) do
				if sjsonWeaponData[key] and not weaponData.AIData[value] then
					weaponData.AIData[value] = sjsonWeaponData[key]
				end
			end
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

local weaponReplacements = {
	-- #region TARTARUS

	-- #region TARTARUS - TISIPHONE
	SummonTisiphoneBombingRun = {
		AIData = {
			AttackSlots = {
				-- Left row
				{ OffsetX = -400, OffsetY = -900, OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = -600, OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = -300, OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = 0,    OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = 300,  OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = 600,  OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = 900,  OffsetScaleY = 0.48, PauseDuration = 0.2 },
				-- Center row
				{ OffsetX = 0,    OffsetY = -900, OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = -600, OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = -300, OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = 0,    OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = 300,  OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = 600,  OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = 900,  OffsetScaleY = 0.48, PauseDuration = 0.2 },
				-- Right row
				{ OffsetX = 400,  OffsetY = -900, OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = -600, OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = -300, OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = 0,    OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = 300,  OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = 600,  OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = 900,  OffsetScaleY = 0.48 },
			},
		},
	},
	-- #endregion

	-- #endregion
}

-- Modify or add weapons
local weaponModifications = {
	-- #region TARTARUS

	-- #region Regular
	MineToss = {
		AIData = {
			DeepInheritance = true,
			ApplyEffectsOnWeaponFire = { WeaponEffectData.RootedAttacker, },
			ProjectileName = "BloodMineToss",
			Spread = 30,
			FireFx = "BloodlessGrenadierPotDropDust",
		},
		Sounds = { FireSounds = { { Name = "/SFX/Enemy Sounds/EnemyGrenadeMortarLaunch" }, }, },
	},
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
			FireSelfVelocity = 3000,
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackHighGrip, },
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
	HarpyLunge = {
		AIData = {
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
		},
	},
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
	Minotaur5AxeCombo5 = {
		AIData = {
			PostAttackDuration = 1.8,
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
	MinotaurBullRush = {
		AIData = {
			-- ApplyEffectsOnPreAttackStart = {
			-- 	-- {
			-- 	-- 	EffectName = "BullRushSpeed",
			-- 	-- 	DataProperties = {
			-- 	-- 		Type = "SPEED",
			-- 	-- 		-- ChangeType = "ADD",
			-- 	-- 		Duration = 9.0,
			-- 	-- 		Modifier = 1.75,
			-- 	-- 		ClearOnCollision = true,
			-- 	-- 		-- Active = true,
			-- 	-- 		-- ExpiringTimeThreshold = 8.5,
			-- 	-- 		-- ExpiringModifierFalloff = 50,
			-- 	-- 	},
			-- 	-- },
			-- 	{
			-- 		EffectName = "BullRushRotation",
			-- 		DataProperties = {
			-- 			Duration = 9.0,
			-- 			RotationMultiplier = 0.8,
			-- 			ClearOnCollision = true,
			-- 			-- Active = true,
			-- 		},
			-- 	}
			-- },
			-- PreAttackSetUnitProperties =
			-- {
			-- 	Speed = 700,
			-- 	-- RotationMultiplier doesn't work here
			-- },
			-- PostAttackResetUnitProperties = true,
			PostAttackAnimation = "MinotaurBullRush_PreStrike",
			ProjectileName = "MinotaurBullRushRam",
			RamWeaponName = "MinotaurBullRush",
			-- TODO: Doesn't yet work correctly - gets applied erratically, removed too soon or too late
			RamEffectNames = { "BullRushSpeed", "BullRushRotation" },
			RamRecoverTime = 2.0,
			UseRamAILoop = true,
			SetupDistance = 400,
			SetupTimeout = 5.0,
			RamDistance = 150,
			RamTimeout = 9.0,
			AttackDistanceBuffer = 0,
			StopMoveWithinRange = false,
			-- Comment the below out in the HadesWeaponData for testing
			-- AIAttackDistance = 3000,
			-- AILineOfSightBuffer = 200,
			-- AILineOfSighEndBuffer = 80,
			-- PostAttackAI = "MoveUntilEffectExpired",
			-- PostAttackAICanOnlyMoveForward = true,
			-- EffectExpiredName = "BullRushSpeed",
			-- MoveSuccessDistance = 32,
			-- PostAttackAIWait = 2.0,
			-- PostAttackCooldown = 0.0,
		}
	},
	-- #endregion

	-- #region ELYSIUM - THESEUS
	-- #endregion
	-- #endregion

	-- #region STYX
	-- #endregion
}

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
		AILineOfSighEndBuffer = "LoSEndBuffer",
		AIMoveWithinRangeTimeout = "MoveWithinRangeTimeout",
		TargetFriends = "TargetRequiredKillEnemy",
		AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
		AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
		AIRequireUnitLineOfSight = "RequireUnitLoS",
		AIRequireProjectileLineOfSight = "RequireProjectileLoS",
		AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
		AIFireTicksMin = "FireTicksMin",
		AIFireTicksMax = "FireTicksMax",
		AIFireTicksCooldown = "FireInterval",
		StandOffTime = "SurroundRefreshInterval",
		FireCooldown = "FireInterval",
		TeleportToSpawnPoints = "PreMoveTeleport",
		PostAttackTeleportToSpawnPoints = "PostAttackEndTeleport",
	},
	-- Same as above
	ShrineAIDataOverwrites = {
		AIAttackDistance = "AttackDistance",
		AIBufferDistance = "RetreatBufferDistance",
		AITrackTargetDuringCharge = "TrackTargetDuringCharge",
		AILineOfSightBuffer = "LoSBuffer",
		AILineOfSighEndBuffer = "LoSEndBuffer",
		AIMoveWithinRangeTimeout = "MoveWithinRangeTimeout",
		TargetFriends = "TargetRequiredKillEnemy",
		AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
		AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
		AIRequireUnitLineOfSight = "RequireUnitLoS",
		AIRequireProjectileLineOfSight = "RequireProjectileLoS",
		AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
		AIFireTicksMin = "FireTicksMin",
		AIFireTicksMax = "FireTicksMax",
		AIFireTicksCooldown = "FireInterval",
		StandOffTime = "SurroundRefreshInterval",
		FireCooldown = "FireInterval",
		TeleportToSpawnPoints = "PreMoveTeleport",
		PostAttackTeleportToSpawnPoints = "PostAttackEndTeleport",
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

local SjsonToAIDataPropertyMappings = {
	SelfVelocity = "FireSelfVelocity",
	BarrelLength = "BarrelLength",
	Spread = "Spread",
	NumProjectiles = "NumProjectiles",
	ProjectileInterval = "ProjectileInterval",
	ProjectileAngleOffset = "ProjectileAngleInterval",
}

applyModificationsAndInheritWeaponData(mod.HadesWeaponData, weaponModifications, weaponReplacements,
	weaponKeyReplacements, AIRequirements, SjsonToAIDataPropertyMappings)
