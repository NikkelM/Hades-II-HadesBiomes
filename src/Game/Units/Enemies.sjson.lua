-- Adds enemies from Hades to Hades II

local hadesEnemiesFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Units\\Enemies.sjson")
local hadesEnemiesTable = sjson.decode_file(hadesEnemiesFile)

local hadesTwoEnemiesFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\Enemies.sjson")

-- Modifications/overrides to the Hades enemies
-- Use the original names from the Hades file here, as modifications are applied before renaming
local hadesEnemiesModifications = {
	-- TARTARUS
	BaseGlutton = { InheritFrom = "1_BaseEnemy", },
	LightSpawner = { InheritFrom = "1_BaseEnemy", },
	BaseThug = { InheritFrom = "1_BaseEnemy", },
	SmallEnemy = { InheritFrom = "1_BaseEnemy", },
	BaseCaster = { InheritFrom = "1_BaseEnemy", },
	BaseSwarmer = { InheritFrom = "1_BaseEnemy", },
	BaseSpawner = { InheritFrom = "1_BaseEnemy", },
	BaseThief = { InheritFrom = "1_BaseEnemy", },
	WretchAssassin = { InheritFrom = "1_BaseEnemy", },
	Harpy = { InheritFrom = "1_BaseEnemy", },

	-- ASPHODEL
	BaseMedusaHead = { InheritFrom = "1_BaseEnemy", },
	HydraTooth = { InheritFrom = "1_BaseEnemy", },

	-- ELYSIUM
	BaseShade = { InheritFrom = "1_BaseEnemy", },
	FlurrySpawner = { InheritFrom = "1_BaseEnemy", },
	Chariot = { InheritFrom = "1_BaseEnemy", },

	-- ENVIRONMENT
	Breakable = { InheritFrom = "1_BaseDestructible", },
}

-- Copy an enemy from Hades II as a Hades enemy
-- Needed if the replaced name is skipped in mod.EnemyNameRemovals
local enemyAdditions = {
	-- ASPHODEL
	{
		Name = "HadesBloodlessNaked",
		InheritFrom = "BloodlessNaked",
	},
	{
		Name = "HadesBloodlessNakedElite",
		InheritFrom = "BloodlessNaked_Elite",
	},
	{
		Name = "HadesBloodlessGrenadier",
		InheritFrom = "BloodlessGrenadier",
	},
	{
		Name = "HadesBloodlessGrenadierElite",
		InheritFrom = "BloodlessGrenadier_Elite",
		Speed = 550.0,
	},
	{
		Name = "HadesBloodlessSelfDestruct",
		InheritFrom = "BloodlessSelfDestruct",
	},
	{
		Name = "HadesBloodlessSelfDestructElite",
		InheritFrom = "BloodlessSelfDestruct_Elite",
	},
	{
		Name = "HadesBloodlessPitcher",
		InheritFrom = "BloodlessPitcher",
	},
	{
		Name = "HadesBloodlessPitcherElite",
		InheritFrom = "BloodlessPitcher_Elite",
	},
	{
		Name = "HadesBloodlessWaveFist",
		InheritFrom = "BloodlessWaveFist",
	},
	{
		Name = "HadesBloodlessWaveFistElite",
		InheritFrom = "BloodlessWaveFist_Elite",
	},
	{
		Name = "HadesSpreadShotUnit",
		InheritFrom = "SpreadShotUnit",
	},
	{
		Name = "HadesSpreadShotUnitElite",
		InheritFrom = "SpreadShotUnit_Elite",
	},
	{
		Name = "BloodlessNakedBerserker",
		InheritFrom = "BloodlessBerserker",
	},
	{
		Name = "BloodlessNakedBerserkerElite",
		InheritFrom = "BloodlessBerserker_Elite",
	},
	-- ELYSIUM
	-- STYX
}

local enemyKeyReplacements = {
	Life = { DeathGraphic = "DeathFx", }
}

mod.ApplyNestedSjsonModifications(hadesEnemiesTable.Units, hadesEnemiesModifications)

-- Remove duplicates we don't want at all, as there is one defined in Hades II already
mod.RemoveSjsonEntries(hadesEnemiesTable.Units, mod.EnemyNameRemovals, "Name", "Enemies.sjson")
-- Rename duplicate enemy names using mod.EnemyNameMappings
mod.RenameSjsonEntries(hadesEnemiesTable.Units, mod.EnemyNameMappings, "Name", "Enemies.sjson")

for oldName, newName in pairs(mod.EnemyNameMappings) do
	-- Don't rename if we didn't actually rename this enemy - it should inherit from the enemy from Hades II
	if not game.Contains(mod.EnemyNameRemovals, oldName) then
		mod.UpdateField(hadesEnemiesTable.Units, oldName, newName, { "InheritFrom" }, "Enemies.sjson")
	end
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
						"." .. oldName .. " with " .. parentKey .. "." .. newName .. " for " .. enemy.Name .. " in Enemies.sjson", 4)
				end
			end
		end
	end
end

-- Add new enemies
for _, enemyData in pairs(enemyAdditions) do
	table.insert(hadesEnemiesTable.Units, enemyData)
end

sjson.hook(hadesTwoEnemiesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Units, hadesEnemiesTable.Units, "Name")
end)
