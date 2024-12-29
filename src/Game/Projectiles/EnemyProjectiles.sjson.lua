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

-- TODO: Make this one with the same function in Enemies.sjson.lua
-- Applies modifications to the given table
local function applyModifications(projectileTable, modifications)
	for _, projectile in ipairs(projectileTable) do
		local modification = modifications[projectile.Name]
		if modification then
			for key, value in pairs(modification) do
				if type(value) == "table" then
					projectile[key] = projectile[key] or {}
					for subKey, subValue in pairs(value) do
						projectile[key][subKey] = subValue
					end
				else
					projectile[key] = value
				end
			end
		end
	end
end

-- Modifications/overrides to the Hades enemy projectiles
-- Hades projectiles have a DamageLow and DamageHigh property, Hades II only has Damage
local hadesProjectilesModifications = {
	PunchingBagUnitWeapon = {
		Damage = 8
	},
}

applyModifications(hadesProjectilesTable.Projectiles, hadesProjectilesModifications)

local hadesTwoProjectilesFile = rom.path.combine(rom.paths.Content(), "Game\\Projectiles\\EnemyProjectiles.sjson")

sjson.hook(hadesTwoProjectilesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Projectiles, hadesProjectilesTable.Projectiles, "Name")
end)
