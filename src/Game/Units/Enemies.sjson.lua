-- Adds enemies from Hades to Hades II

local hadesEnemiesFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Units\\Enemies.sjson")
local hadesEnemiesTable = mod.DecodeSjsonFile(hadesEnemiesFile)

local hadesTwoEnemiesFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\Enemies.sjson")

-- Modifications/overrides to the Hades enemies
-- Use the original names from the Hades file here, as modifications are applied before renaming
local hadesEnemiesModifications = {
	-- #region TARTARUS
	BaseGlutton = { InheritFrom = "1_BaseEnemy", },
	LightSpawner = {
		InheritFrom = "1_BaseEnemy",
		Thing = {
			-- Prevent it from being pushed
			ImmuneToForce = true,
		},
	},
	BaseThug = { InheritFrom = "1_BaseEnemy", },
	SmallEnemy = { InheritFrom = "1_BaseEnemy", },
	BaseCaster = { InheritFrom = "1_BaseEnemy", },
	BaseSwarmer = { InheritFrom = "1_BaseEnemy", },
	BaseSpawner = { InheritFrom = "1_BaseEnemy", },
	BaseThief = { InheritFrom = "1_BaseEnemy", },
	WretchAssassin = { InheritFrom = "1_BaseEnemy", },
	-- #endregion

	-- #region ASPHODEL
	BaseMedusaHead = {
		InheritFrom = "1_BaseEnemy",
		Thing = {
			-- The MedusaHead ActivateGraphic doesn't show any container, so we use the HitAndRunUnit one instead
			-- It is automatically scaled
			ActivateGraphic = "EnemyActivationFadeInHitAndRunUnitContainer",
		},
	},
	HydraTooth = {
		InheritFrom = "1_BaseEnemy",
		ImmuneToStun = true,
	},
	-- #endregion

	-- #region ELYSIUM
	BaseShade = { InheritFrom = "1_BaseEnemy", },
	FlurrySpawner = { InheritFrom = "1_BaseEnemy", },
	Chariot = {
		Thing = {
			ExternalForceMultiplier = 0.5,
		},
	},
	-- #endregion

	-- #region STYX
	RatThug = { InheritFrom = "1_BaseEnemy", },
	BaseSatyr = { InheritFrom = "1_BaseEnemy", },
	HeavyRangedForkedMiniboss = {
		-- For the player tracking
		RotationSpeed = 20.0,
	},
	HadesAmmo = {
		InheritFrom = "1_BaseEnemy",
		RotationSpeed = 0,
		Speed = 0,
	},
	-- #endregion

	-- #region ENVIRONMENT
	Breakable = { InheritFrom = "1_BaseDestructible", },
	-- #endregion
}

-- Copy an enemy from Hades II as a Hades enemy
-- Needed if the replaced name is skipped in mod.EnemyNameRemovals
local enemyAdditions = {
	-- #region ASPHODEL
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
	-- #endregion

	-- #region STYX
	{
		Name = "ModsNikkelMHadesBiomesHadesTombstone",
		InheritFrom = "1_BaseTrap",
		DisplayInEditor = true,
		ImmuneToDoTs = true,
		ImmuneToStun = true,
		NoAllegiance = true,
		Life = {
			DeathGraphic = "HadesTombstoneExplode",
			DeathSound = "/SFX/Enemy Sounds/EnemyDeathExplode",
			ProjectilesAlwaysPenetrate = true,
			TriggerOnHit = true,
		},
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "ModsNikkelMHadesBiomesHadesTombstoneSpawn",
			AttachedAnim = "HadesStunTotemSpawnDecal",
			Scale = 1.0,
			Tallness = 550.0,
			StopsProjectiles = true,
			Points = {
				{ X = 0,   Y = 16 },
				{ X = 32,  Y = 0 },
				{ X = 16,  Y = -19 },
				{ X = -16, Y = -20 },
				{ X = -30, Y = 1 },
			},
			Using = {
				{ Name = "HadesTombstoneActivate" },
			},
		},
	},
	--#endregion
}

local enemyKeyReplacements = {}

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

-- Iterating through all enemies
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
	-- Note: Enemies.sjson is currently the sjson file that is loaded before all others, meaning we reset the table here
	local sjsonLoads = {}
	-- Set this to a non-boolean so another hook can verify it ran first, the other hook will set it to true
	sjsonLoads["Enemies"] = "FileInitialized"
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Units, hadesEnemiesTable.Units, "Name")
end)

-- Assign to mod so we can get required properties in EnemyData.lua
mod.HadesSjsonEnemiesTable = mod.HadesSjsonEnemiesTable or nil
if mod.HadesSjsonEnemiesTable == nil then
	mod.HadesSjsonEnemiesTable = {}
	for _, enemy in ipairs(hadesEnemiesTable.Units) do
		if enemy.Name then
			mod.HadesSjsonEnemiesTable[enemy.Name] = enemy
		end
	end
end
