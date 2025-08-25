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
	"PoisonPuddle",
	"PoisonPuddleSmall",
}

-- Modifications/overrides to the Hades enemy projectiles
local hadesProjectilesModifications = {
	-- #region TARTARUS
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
	WretchAssassinRanged = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
	},
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
	HarpyWhipArc = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	SummonMegaeraWhipWhirl = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	-- #endregion

	-- #region ASPHODEL
	RangedBurrowerWeapon = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
		DissipateFx = "EnemyProjectileDissipate",
	},
	CrusherUnitTouchdown = {
		DetonateGraphic = "CrusherTouchdownFx",
	},
	HydraDart = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
		DissipateFx = "EnemyProjectileDissipate",
	},
	HydraSummon = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
		CheckObstacleImpact = true,
		DetonateOnTouchdown = true,
	},
	CrusherUnitSlamUpgraded = {
		Fuse = 0.1,
	},
	-- #endregion

	-- #region ELYSIUM
	SplitShotWeapon = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
		ImpactFx = "EnemyProjectileImpact",
		DissipateFx = "EnemyProjectileMultiBreak",
		-- Removing this, as otherwise the small projectiles all hit the player when spawning
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
	MinotaurOverheadTouchdown = {
		AttachToOwner = false,
		DamageRadius = 400,
		DamageRadiusScaleY = 0.4,
	},
	MinotaurBullRushRam = {
		InheritFrom = "1_BaseEnemyProjectile",
		RotateWithOwner = true,
		ImpactLineOfSight = true,
		Fuse = 9.0,
		NumPenetrations = "null",
		UnlimitedUnitPenetration = false,
		DieWithOwner = true,
	},
	TheseusSpearThrow = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
		SpawnOnDissipate = "TheseusSpearReturnPoint",
	},
	TheseusSpearThrowReturn = {
		SpawnOnDissipate = "null",
	},
	TheseusChariotMortar = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
		Thing = {
			Scale = 1.0,
		},
	},
	TheseusChariotTurrets = {
		InheritFrom = "1_BaseEnemyProjectileReflectable",
		Thing = {
			Scale = 1.0,
		},
	},
	-- Not used?
	TheseusChariotRam = {
		InheritFrom = "1_BaseEnemyProjectile",
		RotateWithOwner = true,
		ImpactLineOfSight = true,
		Fuse = 9.0,
		NumPenetrations = "null",
		UnlimitedUnitPenetration = false,
		DieWithOwner = true,
	},
	-- Theseus God Wrath attacks
	TheseusArtemisBolt = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	TheseusAresBolt = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	TheseusDionysusBolt = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	TheseusDemeterBolt = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	TheseusAphroditeBolt = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	TheseusAthenaBolt = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	TheseusPoseidonBolt = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	TheseusZeusStormBolt = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	TheseusLightningBolt = {
		InheritFrom = "1_BaseEnemyProjectileUndestroyable",
	},
	-- #endregion

	-- #region STYX
	StaggeredSatyrRangedWeapon = {
		UnpauseAnimation = mod.NilValue,
		Thing = {
			Graphic = "SatyrDart",
		},
	},
	-- #endregion

	-- #region ENVIRONMENT
	-- TODO: Still work in progress, as it is not aligned perfectly with the trap itself
	SpikeTrapWeapon = {
		Thing = {
			Scale = 1.0,
		},
	},
	PhalanxTrapWeapon = {
		Range = 200,
	},
	SawTrapWeapon = {
		ImpactFx = "SawTrapProjectileEnd",
	},
	-- #endregion
}

local addProjectiles = {
	{
		Name = "HadesCrawlerRush",
		InheritFrom = "CrawlerRush",
		Damage = 3,
	},
}

local renamedProjectileModifications = {}
for oldName, newName in pairs(mod.EnemyProjectileMappings) do
	if hadesProjectilesModifications[oldName] then
		renamedProjectileModifications[newName] = hadesProjectilesModifications[oldName]
		hadesProjectilesModifications[oldName] = nil
		mod.DebugPrint("Renamed projectile modification: " .. oldName .. " to " .. newName .. " in EnemyProjectiles.sjson", 4)
	end
end
for key, value in pairs(renamedProjectileModifications) do
	hadesProjectilesModifications[key] = value
end

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
for modName, projectileMod in pairs(hadesProjectilesModifications) do
	mod.RenameKeys(projectileMod, projectileKeyReplacements, "hadesProjectilesModifications[" .. tostring(modName) .. "]")
end

-- Replace the ZagreusOnHitStun effect with HeroOnHitStun
mod.UpdateField(hadesProjectilesTable.Projectiles, "ZagreusOnHitStun", "HeroOnHitStun", { "Effect", "Name" },
	"EnemyProjectiles.sjson")
mod.UpdateField(hadesProjectilesTable.Projectiles, "ZagreusOnHitStun", "HeroOnHitStun", { "Effects", "*", "Name" },
	"EnemyProjectiles.sjson")

-- Iterating through all projectiles
for i = #hadesProjectilesTable.Projectiles, 1, -1 do
	local projectile = hadesProjectilesTable.Projectiles[i]

	-- Projectiles that should be removed completely, likely as they already exist in Hades II
	if shouldRemoveProjectile(projectile.Name, projectilesToRemove) then
		table.remove(hadesProjectilesTable.Projectiles, i)
		mod.DebugPrint("Removed projectile: " .. projectile.Name .. " from EnemyProjectiles.sjson", 4)
	end

	-- Modifications that should be made to all projectiles
	mod.RenameKeys(projectile, projectileKeyReplacements, "hadesProjectilesTable.Projectiles[" .. tostring(i) .. "]")

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
	if projectile.DamageLow or projectile.DamageHigh and not projectile.Damage then
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
	mod.AddTableKeysSkipDupes(data.Projectiles, addProjectiles, "Name")
end)

-- Assign to mod so we can check if the projectile exists in WeaponData.lua
mod.HadesSjsonProjectilesTable = {}
for _, projectile in ipairs(hadesProjectilesTable.Projectiles) do
	if projectile.Name then
		mod.HadesSjsonProjectilesTable[projectile.Name] = true
	end
end
