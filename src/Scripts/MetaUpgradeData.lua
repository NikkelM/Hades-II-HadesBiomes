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
	CrusherUnit = { Name = "FlurrySpawner", },
	LightSpawnerElite = { Name = "FlurrySpawner", },
	BloodlessNaked = { Name = "ShadeSpearUnit", },
	BloodlessNakedElite = { Name = "ShadeSpearUnitElite", },
	BloodlessNakedBerserker = { Name = "ShadeSpearUnit", },
	BloodlessNakedBerserkerElite = { Name = "ShadeSpearUnitElite", },
	BloodlessGrenadier = { Name = "ShadeBowUnit", },
	BloodlessGrenadierElite = { Name = "ShadeBowUnitElite", },
	BloodlessSelfDestruct = { Name = "ShadeShieldUnit", },
	BloodlessSelfDestructElite = { Name = "ShadeShieldUnitElite", },
	BloodlessPitcher = { Name = "ShadeSwordUnit", },
	BloodlessPitcherElite = { Name = "ShadeSwordUnitElite", },
	BloodlessWaveFist = { Name = "ShadeBowUnit", },
	BloodlessWaveFistElite = { Name = "ShadeBowUnitElite", },
	SpreadShotUnit = { Name = "SplitShotUnit", },
	SpreadShotUnitElite = { Name = "SplitShotUnitElite", },
	FreezeShotUnit = { Name = "ChariotSuicide", },
	FreezeShotUnitElite = { Name = "ChariotSuicideElite", },
	RangedBurrower = { Name = "Chariot", },
	RangedBurrowerElite = { Name = "ChariotElite", },

	-- TODO: Elysium -> Styx
}

-- Map the names
for oldName, newName in pairs(mod.EnemyNameMappings) do
	mod.UpdatePropertyName(nextbiomeShrineSwapMap, oldName, newName, { }, "nextbiomeShrineSwapMap")
	mod.UpdateField(nextbiomeShrineSwapMap, oldName, newName, { "Name" }, "nextbiomeShrineSwapMap")
end

mod.AddTableKeysSkipDupes(game.MetaUpgradeData.NextBiomeEnemyShrineUpgrade.BiomeEnemySets, nextBiomeShrineBiomeEnemySets)
mod.AddTableKeysSkipDupes(game.MetaUpgradeData.NextBiomeEnemyShrineUpgrade.SwapMap, nextbiomeShrineSwapMap)
