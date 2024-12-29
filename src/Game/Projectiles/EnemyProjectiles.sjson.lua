-- Adds projectile data for enemies from Hades to Hades II

local hadesProjectilesFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Projectiles\\EnemyProjectiles.sjson")
local hadesProjectilesTable = sjson.decode_file(hadesProjectilesFile)

-- Modifications
-- TODO: This is also defined as a player weapon in Hades II - do I need to duplicate this with a different name in order to have the original Hades weapon work as expected?
local projectilesToRemove = {
	"HadesCastBeam",
	"HadesCastBeamNoTracking"
}

local function shouldRemoveProjectile(name)
	for _, removeName in ipairs(projectilesToRemove) do
		if name == removeName then
			return true
		end
	end
	return false
end

for i = #hadesProjectilesTable.Projectiles, 1, -1 do
	local projectile = hadesProjectilesTable.Projectiles[i]
	if shouldRemoveProjectile(projectile.Name) then
		table.remove(hadesProjectilesTable.Projectiles, i)
	end
end

-- Modifications/overrides to the Hades enemy projectiles
-- Hades projectiles have a DamageLow and DamageHigh property, Hades II only has Damage
local hadesProjectilesModifications = {
	PunchingBagUnitWeapon = {
		Damage = 8
	},
}

mod.applyNestedSjsonModifications(hadesProjectilesTable.Projectiles, hadesProjectilesModifications)

local hadesTwoProjectilesFile = rom.path.combine(rom.paths.Content(), "Game\\Projectiles\\EnemyProjectiles.sjson")

sjson.hook(hadesTwoProjectilesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Projectiles, hadesProjectilesTable.Projectiles, "Name")
end)
