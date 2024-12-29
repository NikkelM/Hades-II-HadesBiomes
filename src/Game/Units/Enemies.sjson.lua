-- Adds enemies from Hades to Hades II

local hadesEnemiesFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Units\\Enemies.sjson")
local hadesEnemiesTable = sjson.decode_file(hadesEnemiesFile)

local hadesTwoEnemiesFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\Enemies.sjson")

-- Modifications/overrides to the Hades enemies
local hadesEnemiesModifications = {
	-- Blank_Mesh is a placeholder that allows the enemies to register hits
	BaseGlutton = {
		Thing = {
			GrannyModel = "Blank_Mesh"
		}
	},
	-- LightSpawner = {
	-- 	Thing = {
	-- 		GrannyModel = "Blank_Mesh"
	-- 	}
	-- },
}

mod.applyNestedSjsonModifications(hadesEnemiesTable, hadesEnemiesModifications)

sjson.hook(hadesTwoEnemiesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Units, hadesEnemiesTable.Units, "Name")
end)
