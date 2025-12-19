local function applyModificationsAndInheritProjectileData(base, modifications, projectileKeyReplacements)
	for oldName, newName in pairs(mod.EnemyProjectileMappings) do
		mod.UpdatePropertyName(modifications, oldName, newName, {}, "ProjectileDataHandler modifications")
		-- mod.UpdatePropertyName(replacements, oldName, newName, {}, "ProjectileDataHandler replacements")
	end
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

local addProjectiles = {
	ModsNikkelMHadesBiomesRubbleFall = game.DeepCopyTable(game.ProjectileData.RubbleFall),
	ModsNikkelMHadesBiomesRubbleFallLarge = game.DeepCopyTable(game.ProjectileData.RubbleFallLarge),
	HadesCast = {
		OnDeathFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesHandleHadesCastDeath",
		SpawnName = "HadesAmmo",
		CarriesSpawns = true,
		StoredAmmoVulnerabilityMultiplier = 2.0,
		AmmoDropDelay = 6.5,
		StoredAmmoIcon = "AmmoEmbeddedInPlayerIcon",
		AmmoDropProjectile = "HadesAmmoDrop",
	},
	ThanatosDeathCurse = {
		OnHitFunctionNames = { _PLUGIN.guid .. "." .. "CurseHealthBar" },
	},
	ThanatosDeathCurseAoE = {
		OnHitFunctionNames = { _PLUGIN.guid .. "." .. "CurseHealthBar" },
	},
}

for projectileName, projectileData in pairs(addProjectiles) do
	if not mod.HadesProjectileData[projectileName] then
		mod.HadesProjectileData[projectileName] = projectileData
	end
end

-- Also able to modify added projectiles here
local projectileModifications = {
	-- #region TARTARUS
	HeavyRangedWeapon = {
		ModsNikkelMHadesBiomesPreOnHitFunctionNames = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesHeavyRangedCrystalOnWeaponHit" },
	},
	HeavyRangedWeaponSplitter = {
		InheritFrom = { "HeavyRangedWeapon", },
	},
	HeavyRangedSplitterFragment = {
		InheritFrom = { "HeavyRangedWeaponSplitter", },
		ModsNikkelMHadesBiomesPreOnHitFunctionNames = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesHeavyRangedSplitterFragmentOnWeaponHit" },
	},
	HarpyLightning = {
		InheritFrom = { "NoSlowFrameProjectile", },
	},
	-- #endregion

	-- #region STYX
	PoisonTrapWeapon = {
		-- This should not be a PreOnHitFunctionName, as we only want to save the attacker name if the poison actually hits and wasn't blocked
		OnHitFunctionNames = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesStyxPoisonWeaponHit" },
	},
	HadesPoisonPuddle = {
		OnHitFunctionNames = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesStyxPoisonWeaponHit" },
	},
	HadesPoisonPuddleSmall = {
		OnHitFunctionNames = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesStyxPoisonWeaponHit" },
	},
	SatyrRangedWeapon = {
		OnHitFunctionNames = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesStyxPoisonWeaponHit" },
	},
	SatyrRangedMinigun = {
		OnHitFunctionNames = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesStyxPoisonWeaponHit" },
	},
	HeavyRangedWeaponFork = {
		InheritFrom = { "HeavyRangedWeapon", },
	},
	HadesCastBeam = {
		ModsNikkelMHadesBiomesPreOnHitFunctionNames = { _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesHeavyRangedCrystalOnWeaponHit" },
	},
	-- #endregion

	-- #region ENVIRONMENT
	ModsNikkelMHadesBiomesRubbleFall = {
		-- So it doesn't deal more damage to enemies than it should, and it doesn't destroy the rubble obstacles it spawns itself
		OutgoingDamageModifiers = { { ObstacleMultiplier = 0.0, NonPlayerMultiplier = 3.0, }, }
	},
	ModsNikkelMHadesBiomesRubbleFallLarge = {
		OutgoingDamageModifiers = { { ObstacleMultiplier = 0.0, NonPlayerMultiplier = 1.0, }, }
	},
	-- #endregion
}

local projectileKeyReplacements = {
	CancelVulnerabilitySpark = "CancelHitSpark",
}

applyModificationsAndInheritProjectileData(mod.HadesProjectileData, projectileModifications, projectileKeyReplacements)
