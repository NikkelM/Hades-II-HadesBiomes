-- Adds projectile data for enemies from Hades to Hades II

local function shouldRemoveProjectile(name, projectilesToRemove)
	for _, removeName in ipairs(projectilesToRemove) do
		if name == removeName then
			return true
		end
	end
	return false
end

local hadesProjectilesFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Projectiles\\EnemyProjectiles.sjson")
local hadesProjectilesTable = sjson.decode_file(hadesProjectilesFile)

local hadesTwoProjectilesFile = rom.path.combine(rom.paths.Content(), "Game\\Projectiles\\PlayerProjectiles.sjson")

-- Projectiles that are defined in a different file and therefore not caught by AddTableKeysSkipDupes()
local projectilesToRemove = {
	"1_BaseEnemyMagicProjectile",
	"1_BaseTrapProjectile",
	"HadesCastBeam",
	"HadesCastBeamNoTracking",
	"LavaPuddleLarge",
	"BaseCollisionWeapon",
	"LavaSplash",
	"BloodlessMelee",
	"BloodlessMeleeBerserker",
	"BloodlessMeleeBerserker2",
	"BloodlessGrenadierRanged",
	"BloodlessGrenadierRangedElite",
	"BloodlessGrenadierCluster",
	"BloodlessGrenadierDrop",
	"BloodlessPitch",
	"BloodlessPitchCurve",
	"BloodlessPitcherDeathLob",
	"BloodlessSelfDestructDeathLob",
	"BloodlessWaveFistWeapon",
	"DevotionZeus",
	"DevotionPoseidon",
	"DevotionAphrodite",
	"DevotionAres",
	"DevotionDemeter",
	"SmokeTrapWeapon",
	"ExplosiveBlast",
	"BlastCubeExplosion",
	"BloodlessGrenadierDive",
	"EliteVacuum",
	"LavaTileWeapon",
	"LavaTileTriangle01Weapon",
	"LavaTileTriangle02Weapon",
	"EnemyBombs",
	"LightningAura",
}

-- Modifications/overrides to the Hades enemy projectiles
local hadesProjectilesModifications = {
	-- TARTARUS
	DisembodiedHandGrab = {
		Effect = {
			-- Don't play the ZagreusStun animation
			StartAnimation = "MelinoeGetHit",
		},
	},
	LightRangedWeapon = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
		-- It just disappears instead of exploding like in Hades
		-- The explosion has a weird boxed brightness around it
		DissipateFx = "EnemyProjectileDissipate",
		UnpauseResetLocation = true,
		-- Otherwise the enemy hits itself
		AffectsSelf = false,
	},
	HeavyRangedWeapon = {
		NumPenetrations = 99999,
		InflictedDamageSound = "/SFX/BurnDamage",
	},
	HeavyRangedWeaponSplitter = {
		TotalFuse = 4.0,
		AutoAdjustForTarget = true,
		MaxAdjustRate = 5,
	},
	HeavyRangedSplitterFragment = {
		DieWithOwner = true,
	},
	-- TARTARUS - BOSSES
	HarpyBeam = {
		Speed = 700,
		InheritFrom = "1_BaseEnemyProjectileReflectable",
	},
	HarpySlowBeam = {
		UnpauseAnimation = mod.NilValue,
		Thing = {
			Graphic = "FuryBeamEmitterTisiphone",
		},
	},
	HarpyLightning = {
		CanBeProjectileDefenseDestroyed = false,
		CanBeProjectileDefenseDestroyedByName2 = "null",
		CanBeProjectileDefenseDestroyedByLayer = "null",
	},
	HarpyLightningChase = {
		CanBeProjectileDefenseDestroyed = false,
		CanBeProjectileDefenseDestroyedByName2 = "null",
		CanBeProjectileDefenseDestroyedByLayer = "null",
	},
	HarpyWhipLasso = {
		Effects = {
			[1] = { StartAnimation = "MelinoeGetHit", },
		},
	},
	-- ASPHODEL
	RangedBurrowerWeapon = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
	},
	CrusherUnitTouchdown = {
		DetonateGraphic = "CrusherTouchdownFx",
	},
	-- ASPHODEL - HYDRA
	HydraDart = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
	},
	HydraSummon = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
		CheckObstacleImpact = true,
		DetonateOnTouchdown = true,
	},
	-- ELYSIUM
	SplitShotWeapon = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
		ImpactFx = "EnemyProjectileImpact",
		DissipateFx = "EnemyProjectileMultiBreak",
		SpawnOnDeath = "null",
		SpawnOnDissipate = "SplitShotWeaponSmall",
		UnpauseResetLocation = true,
		AffectsSelf = false,
		Fuse = 1.65,
	},
	SplitShotWeaponSmall = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
		DissipateFx = "EnemyProjectileDissipate",
		UnpauseResetLocation = true,
		AffectsSelf = false,
		Thing = {
			Graphic = "EnemyProjectileIn",
		},
	},
	ChariotRamSelfDestruct = {
		AffectsEnemies = true,
	},
	-- ELYSIUM - MINOTAUR
	MinotaurOverheadTouchdown = {
      DamageRadius = 700,
			-- TODO: Figure this out
      DamageRadiusScaleY = 0.4,
      DamageRadiusScaleX = 0.5,
	},
	-- STYX
	StaggeredSatyrRangedWeapon = {
		UnpauseAnimation = mod.NilValue,
		Thing = {
			Graphic = "SatyrDart",
		},
	},
}

local projectileKeyReplacements = {
	DissipateGraphic = "DissipateFx",
	DetonateGraphic = "DetonateFx",
}

mod.RenameSjsonEntries(hadesProjectilesTable.Projectiles, mod.EnemyProjectileMappings, "Name", "EnemyProjectiles.sjson")
-- Rename projectiles
for oldName, newName in pairs(mod.EnemyProjectileMappings) do
	mod.UpdateField(hadesProjectilesTable.Projectiles, oldName, newName, { "InheritFrom" }, "EnemyProjectiles.sjson")
end
-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesProjectilesTable.Projectiles, oldName, newName, { "Thing", "Graphic" }, "EnemyProjectiles.sjson")
	mod.UpdateField(hadesProjectilesTable.Projectiles, oldName, newName, { "Thing", "AttachedAnim" },
		"EnemyProjectiles.sjson")
	mod.UpdateField(hadesProjectilesTable.Projectiles, oldName, newName, { "DetonateGraphic" }, "EnemyProjectiles.sjson")
end

-- Rename keys in the modifications
for _, projectileMod in pairs(hadesProjectilesModifications) do
	for oldKey, newKey in pairs(projectileKeyReplacements) do
		if projectileMod[oldKey] then
			projectileMod[newKey] = projectileMod[oldKey]
			projectileMod[oldKey] = nil
		end
	end
end

-- Iterating through all projectiles
for i = #hadesProjectilesTable.Projectiles, 1, -1 do
	local projectile = hadesProjectilesTable.Projectiles[i]

	-- Projectiles that should be removed completely, likely as they already exist in Hades II
	if shouldRemoveProjectile(projectile.Name, projectilesToRemove) then
		table.remove(hadesProjectilesTable.Projectiles, i)
		mod.DebugPrint("Removed projectile: " .. projectile.Name .. " from EnemyProjectiles.sjson", 4)
	end

	-- Modifications that should be made to all projectiles
	-- Rename keys
	for oldKey, newKey in pairs(projectileKeyReplacements) do
		if projectile[oldKey] then
			projectile[newKey] = projectile[oldKey]
			projectile[oldKey] = nil
		end
	end
	-- This property was renamed in Hades II
	if projectile.Effect and projectile.Effect.Name == "ZagreusOnHitStun" then
		projectile.Effect.Name = "HeroOnHitStun"
	end
	if projectile.Effects then
		for _, effect in ipairs(projectile.Effects) do
			if effect.Name == "ZagreusOnHitStun" then
				effect.Name = "HeroOnHitStun"
			end
		end
	end

	-- Hades uses DamageLow and DamageHigh properties, Hades II only has Damage
	if projectile.DamageLow or projectile.DamageHigh then
		local damageLow = projectile.DamageLow or 0
		local damageHigh = projectile.DamageHigh or damageLow
		projectile.Damage = math.floor((damageLow + damageHigh) / 2)
		projectile.DamageLow = nil
		projectile.DamageHigh = nil
	end
end

mod.ApplyNestedSjsonModifications(hadesProjectilesTable.Projectiles, hadesProjectilesModifications)

sjson.hook(hadesTwoProjectilesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Projectiles, hadesProjectilesTable.Projectiles, "Name")
end)
