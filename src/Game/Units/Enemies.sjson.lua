-- Adds enemies from Hades to Hades II

-- Applies modifications to the given table
local function applyModifications(enemiesTable, modifications)
	for _, enemy in ipairs(enemiesTable) do
		local modification = modifications[enemy.Name]
		if modification then
			for key, value in pairs(modification) do
				if type(value) == "table" then
					enemy[key] = enemy[key] or {}
					for subKey, subValue in pairs(value) do
						enemy[key][subKey] = subValue
					end
				else
					enemy[key] = value
				end
			end
		end
	end
end

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

applyModifications(hadesEnemiesTable, hadesEnemiesModifications)

sjson.hook(hadesTwoEnemiesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Units, hadesEnemiesTable.Units, "Name")
end)
