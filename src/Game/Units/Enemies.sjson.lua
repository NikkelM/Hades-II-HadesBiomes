-- Adds enemies from Hades to Hades II

local hadesEnemiesFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Units\\Enemies.sjson")
local hadesEnemiesTable = sjson.decode_file(hadesEnemiesFile)

local hadesTwoEnemiesFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\Enemies.sjson")

-- Modifications/overrides to the Hades enemies
-- Use the original names from the Hades file here, as modifications are applied before renaming
local hadesEnemiesModifications = {
	-- For PunchingBagUnit
	BaseGlutton = {
		InheritFrom = "1_BaseEnemy"
	},
	LightSpawner = {
		InheritFrom = "1_BaseEnemy"
	},
	-- For HeavyMelee
	BaseThug = {
		InheritFrom = "1_BaseEnemy"
	},
	-- For DisembodiedHand
	SmallEnemy = {
		InheritFrom = "1_BaseEnemy"
	},
	-- For LightRanged (HadesLightRanged) and HeavyRanged
	BaseCaster = {
		InheritFrom = "1_BaseEnemy"
	},
}

local enemyKeyReplacements = {
	Life = {
		DeathGraphic = "DeathFx",
	}
}

mod.ApplyNestedSjsonModifications(hadesEnemiesTable.Units, hadesEnemiesModifications)

-- Rename duplicate enemy names using mod.EnemyNameMappings
mod.RenameSjsonEntries(hadesEnemiesTable.Units, mod.EnemyNameMappings, "Name", "Enemies.sjson")
for oldName, newName in pairs(mod.EnemyNameMappings) do
	mod.UpdateField(hadesEnemiesTable.Units, oldName, newName, { "InheritFrom" }, "Enemies.sjson")
end

for i = #hadesEnemiesTable.Units, 1, -1 do
	local enemy = hadesEnemiesTable.Units[i]
	for parentKey, replacements in pairs(enemyKeyReplacements) do
		if enemy[parentKey] ~= nil then
			for oldName, newName in pairs(replacements) do
				if enemy[parentKey][oldName] ~= nil then
					enemy[parentKey][newName] = enemy[parentKey][oldName]
					enemy[parentKey][oldName] = nil
					mod.DebugPrint("Replaced " ..
					parentKey ..
					"." .. oldName .. " with " .. parentKey .. "." .. newName .. " for " .. enemy.Name .. " in Enemies.sjson")
				end
			end
		end
	end
end

sjson.hook(hadesTwoEnemiesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Units, hadesEnemiesTable.Units, "Name")
end)
