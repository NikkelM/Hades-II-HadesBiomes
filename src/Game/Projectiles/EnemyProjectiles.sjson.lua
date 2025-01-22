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

local hadesTwoProjectilesFile = rom.path.combine(rom.paths.Content(), "Game\\Projectiles\\EnemyProjectiles.sjson")

-- Projectiles that are defined in a different file and therefore not caught by AddTableKeysSkipDupes()
local projectilesToRemove = {
	-- TODO: This is also defined as a player weapon in Hades II - do I need to duplicate this with a different name in order to have the original Hades weapon work as expected?
	"HadesCastBeam",
	"HadesCastBeamNoTracking"
}

-- Modifications/overrides to the Hades enemy projectiles
local hadesProjectilesModifications = {
	DisembodiedHandGrab = {
		Effect = {
			StartAnimation = "null"
		}
	},
	LightRangedWeapon = {
		CanBeProjectileDefenseDestroyedByLayer = "BoonDefense",
		CanBeProjectileDefenseDestroyed = false,
		DissipateFx = "EnemyProjectileDissipate",
		DeathFx = "EnemyProjectileDissipate",
		ImpactFx = "EnemyProjectileImpact",
		UnpauseResetLocation = true
	},
	HeavyRangedWeapon = {
		NumPenetrations = 99999,
		InflictedDamageSound = "/SFX/BurnDamage",
		MultiDetonate = true,
	},
}

local projectileKeyReplacements = {
	DissipateGraphic = "DissipateFx",
	DetonateGraphic = "DetonateFx",
}

-- Rename duplicate enemy names using mod.EnemyProjectileMappings
mod.RenameSjsonEntries(hadesProjectilesTable.Projectiles, mod.EnemyProjectileMappings, "Name", "EnemyProjectiles.sjson")
-- Rename projectiles
for oldName, newName in pairs(mod.EnemyProjectileMappings) do
	mod.UpdateField(hadesProjectilesTable.Projectiles, oldName, newName, { "InheritFrom" }, "EnemyProjectiles.sjson")
end
-- Rename attached animations/Fx graphics
for oldName, newName in pairs(mod.FxAnimationMappings) do
	mod.UpdateField(hadesProjectilesTable.Projectiles, oldName, newName, { "DetonateGraphic" }, "EnemyProjectiles.sjson")
end

-- Iterating through all projectiles
for i = #hadesProjectilesTable.Projectiles, 1, -1 do
	local projectile = hadesProjectilesTable.Projectiles[i]

	-- Projectiles that should be removed completely, likely as they already exist in Hades II
	if shouldRemoveProjectile(projectile.Name, projectilesToRemove) then
		table.remove(hadesProjectilesTable.Projectiles, i)
		mod.DebugPrint("Removed projectile: " .. projectile.Name .. " from EnemyProjectiles.sjson")
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
	-- Hades uses DamageLow and DamageHigh properties, Hades II only has Damage
	if projectile.DamageLow or projectile.DamageHigh then
		local damageLow = projectile.DamageLow or 0
		local damageHigh = projectile.DamageHigh or 0
		projectile.Damage = math.floor((damageLow + damageHigh) / 2)
		projectile.DamageLow = nil
		projectile.DamageHigh = nil
	end
end

mod.ApplyNestedSjsonModifications(hadesProjectilesTable.Projectiles, hadesProjectilesModifications)

sjson.hook(hadesTwoProjectilesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Projectiles, hadesProjectilesTable.Projectiles, "Name")
end)
