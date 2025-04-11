local nextBiomeShrineBiomeEnemySets = {
	Tartarus = game.EnemySets.EnemiesBiome2,
	-- Asphodel = game.EnemySets.EnemiesBiome3,
	-- Elysium = game.EnemySets.EnemiesBiome4,
}

-- Which enemy is swapped for which other enemy
local nextbiomeShrineSwapMap = {
	-- Tartarus -> Asphodel
	Swarmer = { Name = "BloodlessNaked", },
	SwarmerElite = { Name = "BloodlessNakedElite", },
	LightSpawner = { Name = "LightSpawnerElite", },
	ThiefMineLayer = { Name = "BloodlessPitcher", },
	ThiefMineLayerElite = { Name = "BloodlessPitcherElite", },
	PunchingBagUnit = { Name = "BloodlessNakedBerserker", },
	HeavyMelee = { Name = "BloodlessGrenadier", },
	DisembodiedHand = { Name = "FreezeShotUnit", },
	DisembodiedHandElite = { Name = "FreezeShotUnitElite", },
	LightRanged = { Name = "SpreadShotUnit", },
	HeavyRanged = { Name = "RangedBurrower", },
	HeavyMeleeElite = { Name = "BloodlessGrenadierElite", },
	LightRangedElite = { Name = "SpreadShotUnitElite", },
	PunchingBagUnitElite = { Name = "BloodlessNakedBerserkerElite", },
	HeavyRangedElite = { Name = "RangedBurrowerElite", },

	-- Asphodel -> Elysium
	-- CrusherUnit = { Name = "CrusherUnit", },
	-- LightSpawnerElite = { Name = "LightSpawnerElite", },
	-- BloodlessNaked = { Name = "BloodlessNaked", },
	-- BloodlessNakedElite = { Name = "BloodlessNakedElite", },
	-- BloodlessNakedBerserker = { Name = "BloodlessNakedBerserker", },
	-- BloodlessNakedBerserkerElite = { Name = "BloodlessNakedBerserkerElite", },
	-- BloodlessGrenadier = { Name = "BloodlessGrenadier", },
	-- BloodlessGrenadierElite = { Name = "BloodlessGrenadierElite", },
	-- BloodlessSelfDestruct = { Name = "BloodlessSelfDestruct", },
	-- BloodlessSelfDestructElite = { Name = "BloodlessSelfDestructElite", },
	-- BloodlessPitcher = { Name = "BloodlessPitcher", },
	-- BloodlessPitcherElite = { Name = "BloodlessPitcherElite", },
	-- BloodlessWaveFist = { Name = "BloodlessWaveFist", },
	-- BloodlessWaveFistElite = { Name = "BloodlessWaveFistElite", },
	-- SpreadShotUnit = { Name = "SpreadShotUnit", },
	-- SpreadShotUnitElite = { Name = "SpreadShotUnitElite", },
	-- FreezeShotUnit = { Name = "FreezeShotUnit", },
	-- FreezeShotUnitElite = { Name = "FreezeShotUnitElite", },
	-- RangedBurrower = { Name = "RangedBurrower", },
	-- RangedBurrowerElite = { Name = "RangedBurrowerElite", },

	-- Elysium -> Styx
}

-- Map the names
for oldName, newName in pairs(mod.EnemyNameMappings) do
	mod.UpdatePropertyName(nextbiomeShrineSwapMap, oldName, newName, { }, "nextbiomeShrineSwapMap")
	mod.UpdateField(nextbiomeShrineSwapMap, oldName, newName, { "Name" }, "nextbiomeShrineSwapMap")
end

mod.AddTableKeysSkipDupes(game.MetaUpgradeData.NextBiomeEnemyShrineUpgrade.BiomeEnemySets, nextBiomeShrineBiomeEnemySets)
mod.AddTableKeysSkipDupes(game.MetaUpgradeData.NextBiomeEnemyShrineUpgrade.SwapMap, nextbiomeShrineSwapMap)
