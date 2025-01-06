-- Adds weapon data for enemies from Hades to Hades II

local hadesWeaponsFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Weapons\\EnemyWeapons.sjson")
local hadesWeaponsTable = sjson.decode_file(hadesWeaponsFile)

local hadesTwoWeaponsFile = rom.path.combine(rom.paths.Content(), "Game\\Weapons\\EnemyWeapons.sjson")
local hadesTwoWeaponsTable = sjson.decode_file(hadesTwoWeaponsFile)

-- Rename duplicate enemy names using EnemyWeaponMappings
mod.RenameSjsonEntries(hadesWeaponsTable.Weapons, EnemyWeaponMappings, "EnemyWeapons.sjson")
for oldName, newName in pairs(EnemyWeaponMappings) do
	mod.UpdateField(hadesWeaponsTable.Weapons, oldName, newName, { "InheritFrom" }, "EnemyWeapons.sjson")
end
-- Rename attached projectiles
for oldName, newName in pairs(EnemyProjectileMappings) do
	mod.UpdateField(hadesWeaponsTable.Weapons, oldName, newName, { "Projectile" }, "EnemyWeapons.sjson")
end

-- Remove duplicates
hadesWeaponsTable.Weapons = mod.AddTableKeysSkipDupes(hadesTwoWeaponsTable.Weapons, hadesWeaponsTable.Weapons, "Name")

-- We hook this into the playerWeapon file, as it is larger
-- Hooking into the enemy file fails as the file size of the target is too small to insert the new data
local hadesTwoPlayerWeaponsFile = rom.path.combine(rom.paths.Content(), "Game\\Weapons\\PlayerWeapons.sjson")

local hadesWeaponsModifications = {
	LightRangedWeapon = {
		-- The default length of 55 results in the enemy hitting itself
		BarrelLength = 75
	}
}

mod.ApplyNestedSjsonModifications(hadesWeaponsTable.Weapons, hadesWeaponsModifications)

sjson.hook(hadesTwoPlayerWeaponsFile, function(data)
	mod.AddTableKeysSkipDupes(data.Weapons, hadesWeaponsTable.Weapons, "Name")
end)
