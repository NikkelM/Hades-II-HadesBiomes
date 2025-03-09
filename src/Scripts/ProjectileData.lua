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

local addProjectiles = {
	ModsNikkelMHadesBiomesRubbleFall = game.DeepCopyTable(game.ProjectileData.RubbleFall),
}

for projectileName, projectileData in pairs(addProjectiles) do
	if not mod.HadesProjectileData[projectileName] then
		mod.HadesProjectileData[projectileName] = projectileData
	end
end

-- Also able to modify added projectiles here
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
	ModsNikkelMHadesBiomesRubbleFall = {
		-- So it doesn't deal more damage to enemies than it should, and it doesn't destroy the rubble obstacles it spawns itself
		OutgoingDamageModifiers = { { ObstacleMultiplier = 0.0, NonPlayerMultiplier = 3.0, }, }
	},
}

local projectileKeyReplacements = {
	CancelVulnerabilitySpark = "CancelHitSpark",
}

applyModificationsAndInheritProjectileData(mod.HadesProjectileData, projectileModifications, projectileKeyReplacements)
