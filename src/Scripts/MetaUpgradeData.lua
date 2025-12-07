local nextBiomeShrineBiomeEnemySets = {
	-- On purpose not setting these, so that we can only swap the enemies that have a defined partner in the swap map
	-- Tartarus = game.EnemySets.EnemiesBiome2,
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
	PunchingBagUnitElite = { Name = "BloodlessNakedBerserkerElite", },
	HeavyMelee = { Name = "BloodlessGrenadier", },
	HeavyMeleeElite = { Name = "BloodlessGrenadierElite", },
	DisembodiedHand = { Name = "FreezeShotUnit", },
	DisembodiedHandElite = { Name = "FreezeShotUnitElite", },
	LightRanged = { Name = "SpreadShotUnit", },
	LightRangedElite = { Name = "SpreadShotUnitElite", },
	HeavyRanged = { Name = "RangedBurrower", },
	HeavyRangedElite = { Name = "RangedBurrowerElite", },

	-- Asphodel -> Elysium
	-- Balancing in the first game doesn't really work for the difficulties we need, so replacing normal units with elites and not touching the previous elites
	CrusherUnit = { Name = "FlurrySpawner", },
	LightSpawnerElite = { Name = "FlurrySpawner", },
	BloodlessNaked = { Name = "ShadeSpearUnitElite", },
	-- BloodlessNakedElite = { Name = "ShadeSpearUnitElite", },
	BloodlessNakedBerserker = { Name = "ShadeSpearUnitElite", },
	-- BloodlessNakedBerserkerElite = { Name = "ShadeSpearUnitElite", },
	BloodlessGrenadier = { Name = "ShadeBowUnitElite", },
	-- BloodlessGrenadierElite = { Name = "ShadeBowUnitElite", },
	BloodlessSelfDestruct = { Name = "ShadeShieldUnitElite", },
	-- BloodlessSelfDestructElite = { Name = "ShadeShieldUnitElite", },
	BloodlessPitcher = { Name = "ShadeSwordUnitElite", },
	-- BloodlessPitcherElite = { Name = "ShadeSwordUnitElite", },
	BloodlessWaveFist = { Name = "ShadeBowUnitElite", },
	-- BloodlessWaveFistElite = { Name = "ShadeBowUnitElite", },
	SpreadShotUnit = { Name = "SplitShotUnit", },
	SpreadShotUnitElite = { Name = "SplitShotUnitElite", },
	-- FreezeShotUnit = { Name = "ChariotSuicide", },
	-- FreezeShotUnitElite = { Name = "ChariotSuicideElite", },
	RangedBurrower = { Name = "ChariotElite", },
	-- RangedBurrowerElite = { Name = "ChariotElite", },

	-- Elysium -> Styx
	-- ShadeSpearUnit = { Name = "SatyrRanged", },
	-- ShadeSpearUnitElite = { Name = "SatyrRangedElite", },
	ShadeBowUnit = { Name = "SatyrRanged", },
	ShadeBowUnitElite = { Name = "SatyrRangedElite", },
	-- ShadeShieldUnit = { Name = "RatThug", },
	-- ShadeShieldUnitElite = { Name = "RatThugElite", },
	ShadeSwordUnit = { Name = "RatThug", },
	ShadeSwordUnitElite = { Name = "RatThugElite", },
	ShieldRangedElite = { Name = "HeavyRangedForkedElite", },
	SplitShotUnit = { Name = "HeavyRangedForked" },
	SplitShotUnitElite = { Name = "HeavyRangedForkedElite" },
	Chariot = { Name = "RatThug" },
	ChariotElite = { Name = "RatThugElite" },
	-- ChariotSuicide,
	-- ChariotSuicideElite,
	FlurrySpawner = { Name = "ThiefImpulseMineLayerElite" },
}

-- Map the names
for oldName, newName in pairs(mod.EnemyNameMappings) do
	mod.UpdatePropertyName(nextbiomeShrineSwapMap, oldName, newName, {}, "nextbiomeShrineSwapMap")
	mod.UpdateField(nextbiomeShrineSwapMap, oldName, newName, { "Name" }, "nextbiomeShrineSwapMap")
end

mod.AddTableKeysSkipDupes(game.MetaUpgradeData.NextBiomeEnemyShrineUpgrade.BiomeEnemySets, nextBiomeShrineBiomeEnemySets)
mod.AddTableKeysSkipDupes(game.MetaUpgradeData.NextBiomeEnemyShrineUpgrade.SwapMap, nextbiomeShrineSwapMap)
