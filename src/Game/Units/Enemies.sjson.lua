-- Adds enemies from Hades to Hades II

local hadesEnemiesFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Units\\Enemies.sjson")
local hadesEnemiesTable = sjson.decode_file(hadesEnemiesFile)

local hadesTwoEnemiesFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\Enemies.sjson")

-- Modifications/overrides to the Hades enemies
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
mod.RenameSjsonEntries(hadesEnemiesTable.Units, EnemyNameMappings, "Enemies.sjson")

sjson.hook(hadesTwoEnemiesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Units, hadesEnemiesTable.Units, "Name")
end)
