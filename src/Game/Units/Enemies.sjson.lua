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
	-- For LightRanged (HadesLightRanged)
	BaseCaster = {
		InheritFrom = "1_BaseEnemy"
	},
}

mod.ApplyNestedSjsonModifications(hadesEnemiesTable.Units, hadesEnemiesModifications)

-- Rename duplicate enemy names using EnemyNameMappings
mod.RenameSjsonEntries(hadesEnemiesTable.Units, EnemyNameMappings, "Enemies.sjson")
mod.UpdateField(hadesEnemiesTable.Units, "LightRanged", "HadesLightRanged", {"InheritFrom"}, "Enemies.sjson")

sjson.hook(hadesTwoEnemiesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Units, hadesEnemiesTable.Units, "Name")
end)
