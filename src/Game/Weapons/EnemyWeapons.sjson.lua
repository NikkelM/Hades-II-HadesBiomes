-- Adds weapon data for enemies from Hades to Hades II

local hadesWeaponsFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Weapons\\EnemyWeapons.sjson")
local hadesWeaponsTable = mod.DecodeSjsonFile(hadesWeaponsFile)

local hadesTwoWeaponsFile = rom.path.combine(rom.paths.Content(), "Game\\Weapons\\Weapons.sjson")
local hadesTwoWeaponsTable = mod.DecodeSjsonFile(hadesTwoWeaponsFile)

-- Rename duplicate enemy names using mod.EnemyWeaponMappings
mod.RenameSjsonEntries(hadesWeaponsTable.Weapons, mod.EnemyWeaponMappings, "Name", "EnemyWeapons.sjson")
for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	mod.UpdateField(hadesWeaponsTable.Weapons, oldName, newName, { "InheritFrom" }, "EnemyWeapons.sjson")
end
-- Rename attached projectiles
for oldName, newName in pairs(mod.EnemyProjectileMappings) do
	mod.UpdateField(hadesWeaponsTable.Weapons, oldName, newName, { "Projectile" }, "EnemyWeapons.sjson")
end

-- Could be for compatibility reasons, or because we simply don't need them
local weaponsToRemove = {
	-- Compatibility: Droppable Gods
	"DevotionZeus",
	"DevotionArtemis_ALT",
	"DevotionArtemis",
	"DevotionPoseidon_ALT",
	"DevotionAres",
	"DevotionDionysus_ALT",
	"DevotionDionysus",
	"DevotionAthena",
	"DevotionAphrodite",
	"DevotionDionysus2",
	"DevotionDemeter",
}

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
	-- #region ELYSIUM
	EliteDeathMultiEgg = {
		ProjectileInterval = 0.05,
	},
	ShadeSpearLeap = {
		SelfVelocity = mod.NilValue,
		SelfUpwardVelocity = mod.NilValue,
	},
	FlurrySpawnerDash = {
		-- WeaponRange = 800
		SelfVelocity = 6000,
		SelfVelocityCap = 6000,
	},
	MinotaurBullRush = {
		Effects = mod.NilValue,
	},
	MinotaurArmoredBullRush = {
		Effects = mod.NilValue,
	},
	MinotaurOverheadShockwave = {
		ProjectileAngleOffset = 90,
	},
	-- Not used?
	TheseusChariotRam = {
		Effect = mod.NilValue,
	},
	-- #endregion

	-- #region STYX
	SatyrDash = {
		-- WeaponRange = 350
		SelfVelocity = 2500,
		SelfVelocityCap = 2500,
	},
	CrawlerReburrowShockwave = {
		Projectile = "CrawlerReburrowShockwaveTouchdown",
	},
	HadesDash = {
		-- WeaponRange = 500
		SelfVelocity = 2700,
		SelfVelocityCap = 2700,
		FireFx = "DashCrackSnowHades",
	},
	HadesSideDash = {
		-- WeaponRange = 500
		SelfVelocity = 2400,
		SelfVelocityCap = 2400,
		FireFx = "DashCrackSnowHades",
	},
	HadesBidentRecoveryDash = {
		-- WeaponRange = 1400
		SelfVelocity = 5100,
		SelfVelocityCap = 5100,
	},
	-- #endregion
}

mod.ApplyNestedSjsonModifications(hadesWeaponsTable.Weapons, hadesWeaponsModifications)

for i = #hadesWeaponsTable.Weapons, 1, -1 do
	local weapon = hadesWeaponsTable.Weapons[i]

	-- Weapons that should be removed completely
	if mod.ShouldRemoveEntry(weapon.Name, weaponsToRemove) then
		table.remove(hadesWeaponsTable.Weapons, i)
		mod.DebugPrint("Removed weapon: " .. weapon.Name .. " from EnemyWeapons.sjson", 4)
	end

	-- Hades II uses NumProjectiles instead of ClipSize
	if weapon.ClipSize and not weapon.NumProjectiles then
		weapon.NumProjectiles = weapon.ClipSize
	end
end

sjson.hook(hadesTwoPlayerWeaponsFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["EnemyWeapons"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Weapons, hadesWeaponsTable.Weapons, "Name")
end)

-- Assign to mod so we can get required properties in WeaponData.lua
mod.HadesSjsonWeaponsTable = mod.HadesSjsonWeaponsTable or nil
if mod.HadesSjsonWeaponsTable == nil then
	mod.HadesSjsonWeaponsTable = {}
	for _, weapon in ipairs(hadesWeaponsTable.Weapons) do
		if weapon.Name then
			mod.HadesSjsonWeaponsTable[weapon.Name] = weapon
		end
	end
end
