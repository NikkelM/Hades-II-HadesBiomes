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

local projectilesToRemove = {
	-- TODO: This is also defined as a player weapon in Hades II - do I need to duplicate this with a different name in order to have the original Hades weapon work as expected?
	"HadesCastBeam",
	"HadesCastBeamNoTracking"
}

-- Iterating through all projectiles
for i = #hadesProjectilesTable.Projectiles, 1, -1 do
	local projectile = hadesProjectilesTable.Projectiles[i]

	-- Projectiles that should be removed completely, likely as they already exist in Hades II
	if shouldRemoveProjectile(projectile.Name, projectilesToRemove) then
		table.remove(hadesProjectilesTable.Projectiles, i)
		mod.debugPrint("Removed projectile: " .. projectile.Name)
	end

	-- Modifications that should be made to all projectiles
	-- This property was renamed in Hades II
	if projectile.Effect and projectile.Effect.Name == "ZagreusOnHitStun" then
		projectile.Effect.Name = "HeroOnHitStun"
	end
end

-- Modifications/overrides to the Hades enemy projectiles
local hadesProjectilesModifications = {
	PunchingBagUnitWeapon = {
		Damage = 8
	},
	HeavyMelee = {
		Damage = 10
	},
	DisembodiedHandGrab = {
		Damage = 5,
		Effect = {
			StartAnimation = "null"
		}
	},
}

mod.applyNestedSjsonModifications(hadesProjectilesTable.Projectiles, hadesProjectilesModifications)

local hadesTwoProjectilesFile = rom.path.combine(rom.paths.Content(), "Game\\Projectiles\\EnemyProjectiles.sjson")

sjson.hook(hadesTwoProjectilesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Projectiles, hadesProjectilesTable.Projectiles, "Name")
end)
