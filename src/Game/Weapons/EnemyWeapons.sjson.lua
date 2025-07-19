-- Adds weapon data for enemies from Hades to Hades II

local hadesWeaponsFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Weapons\\EnemyWeapons.sjson")
local hadesWeaponsTable = sjson.decode_file(hadesWeaponsFile)

local hadesTwoWeaponsFile = rom.path.combine(rom.paths.Content(), "Game\\Weapons\\Weapons.sjson")
local hadesTwoWeaponsTable = sjson.decode_file(hadesTwoWeaponsFile)

-- Rename duplicate enemy names using mod.EnemyWeaponMappings
mod.RenameSjsonEntries(hadesWeaponsTable.Weapons, mod.EnemyWeaponMappings, "Name", "EnemyWeapons.sjson")
for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	mod.UpdateField(hadesWeaponsTable.Weapons, oldName, newName, { "InheritFrom" }, "EnemyWeapons.sjson")
end
-- Rename attached projectiles
for oldName, newName in pairs(mod.EnemyProjectileMappings) do
	mod.UpdateField(hadesWeaponsTable.Weapons, oldName, newName, { "Projectile" }, "EnemyWeapons.sjson")
end

-- Remove duplicates
hadesWeaponsTable.Weapons = mod.AddTableKeysSkipDupes(hadesTwoWeaponsTable.Weapons, hadesWeaponsTable.Weapons, "Name")

-- We hook this into the playerWeapon file, as it is larger
-- Hooking into the enemy file fails as the file size of the target is too small to insert the new data
local hadesTwoPlayerWeaponsFile = rom.path.combine(rom.paths.Content(), "Game\\Weapons\\PlayerWeapons.sjson")

local hadesWeaponAdditions = {
	HarpyLungeAlectoRage = {
		Name = "HarpyLungeAlectoRage",
		InheritFrom = "HarpyLungeAlecto",
	},
	HarpyLassoLungeEM = {
		Name = "HarpyLassoLungeEM",
		InheritFrom = "HarpyLassoLunge",
	},
}
-- Add the added weapons
mod.AddTableKeysSkipDupes(hadesWeaponsTable.Weapons, hadesWeaponAdditions, "Name")

local hadesWeaponsModifications = {
	-- #region TARTARUS
	-- #endregion

	-- #region ASPHODEL
	HydraLunge = {
		-- Needs to be lowered due to tethers not locking the head in place
		-- It would otherwise fly over the whole map
		SelfVelocity = 4300.0,
	},
	HydraSnap = {
		SelfVelocity = 4000.0,
	},
	-- #endregion

	-- #region ELYSIUM
	ShadeSpearLeap = {
		SelfVelocity = mod.NilValue,
		SelfUpwardVelocity = mod.NilValue,
	},
	-- TODO: Rework same as for ChariotRam
	TheseusChariotRam = {
		Effect = {
			Modifier = 760,
		},
	},
	-- #endregion

	-- #region STYX
	-- #endregion
}

mod.ApplyNestedSjsonModifications(hadesWeaponsTable.Weapons, hadesWeaponsModifications)

sjson.hook(hadesTwoPlayerWeaponsFile, function(data)
	mod.AddTableKeysSkipDupes(data.Weapons, hadesWeaponsTable.Weapons, "Name")
end)

-- Assign to mod so we can get required properties in WeaponData.lua
mod.HadesSjsonWeaponsTable = {}
for _, weapon in ipairs(hadesWeaponsTable.Weapons) do
	if weapon.Name then
		mod.HadesSjsonWeaponsTable[weapon.Name] = weapon
	end
end
