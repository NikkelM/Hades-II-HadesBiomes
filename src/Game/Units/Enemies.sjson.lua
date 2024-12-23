-- Adds enemies from Hades to Hades II

local hadesEnemiesFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Units\\Enemies.sjson")
local hadesEnemiesTable = sjson.decode_file(hadesEnemiesFile)

local hadesTwoEnemiesFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\Enemies.sjson")

sjson.hook(hadesTwoEnemiesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Units, hadesEnemiesTable.Units, "Name")
end)
