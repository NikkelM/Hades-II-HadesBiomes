-- Loads WeaponData from the Hades file
local function LoadHadesWeaponData()
	local originalWeaponData = game.DeepCopyTable(game.WeaponData)
	local originalProjectileData = game.DeepCopyTable(game.ProjectileData)
	local originalEffectData = game.DeepCopyTable(game.EffectData)
	local originalWeaponEquipOrderData = game.DeepCopyTable(game.GameData.WeaponEquipOrder)
	local originalMissingPackages = game.DeepCopyTable(game.GameData.MissingPackages)

	local pathName = rom.path.combine(mod.hadesGameFolder, "Content\\Scripts\\WeaponData.lua")
	local chunk, err = loadfile(pathName)
	if chunk then
		chunk()
		-- No worries if this is marked as undefined, it comes from the loaded file
		---@diagnostic disable-next-line: undefined-global
		local hadesWeaponData = WeaponData

		game.WeaponData = originalWeaponData
		game.ProjectileData = originalProjectileData
		game.EffectData = originalEffectData
		game.GameData.WeaponEquipOrder = originalWeaponEquipOrderData
		game.GameData.MissingPackages = originalMissingPackages

		return hadesWeaponData
	else
		mod.DebugPrint("Error loading WeaponData: " .. err)
	end
end

-- Applies modifications to base weapon objects, and then adds the new weapon objects to the game
local function ApplyModificationsAndInheritWeaponData(base, modifications, AIDataKeyReplacements)
	-- Apply modifications
	for weaponName, weaponData in pairs(modifications) do
		if not base[weaponName] then
			base[weaponName] = {}
		end
		mod.ApplyModifications(base[weaponName], weaponData)
	end

	-- Process data inheritance and add the new data to the game's global
	base = mod.AddTableKeysSkipDupes(game.WeaponData, base, nil)
	for weaponName, weaponData in pairs(base) do
		-- Replace keys that were renamed between the games
		if weaponData.AIData then
			for oldKey, newKey in pairs(AIDataKeyReplacements) do
				if weaponData.AIData[oldKey] then
					weaponData.AIData[newKey] = weaponData.AIData[oldKey]
					weaponData.AIData[oldKey] = nil
				end
			end
		end

		game.ProcessDataInheritance(weaponData, game.WeaponData)
		base[weaponName] = weaponData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.WeaponData, base)
end

-- Adds weapons from Hades to Hades II
local hadesWeaponData = LoadHadesWeaponData()

-- Some weapons exist in both Hades and Hades II, so we need to rename the Hades weapons
for oldName, newName in pairs(EnemyWeaponMappings) do
	hadesWeaponData[newName] = hadesWeaponData[oldName]
	hadesWeaponData[oldName] = nil
	-- Update the name in dependent fields
	-- Inherit properties from this name
	mod.UpdateField(hadesWeaponData, oldName, newName, { "InheritFrom" }, "WeaponData")
end

local modifications = {}

local AIDataKeyReplacements = {
	AIAttackDistance = "AttackDistance",
	AIBufferDistance = "RetreatBufferDistance"
}

ApplyModificationsAndInheritWeaponData(hadesWeaponData, modifications, AIDataKeyReplacements)
