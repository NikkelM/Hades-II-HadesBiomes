-- Adds enemy sets for the new regions
local additionalEnemySets = {
	-- #region ELITE ATTRIBUTES
	RangedOnlyEliteAttributes = {
		"Homing",
		"Homing",
		"Homing",
		"Homing",
		"Homing",
	},
	ShadeOnlyEliteAttributes = {
		-- TODO: Implement MultiEgg
		-- "MultiEgg",
		-- "MultiEgg",
		-- "MultiEgg",
		-- "MultiEgg",
	},
	-- #endregion

	-- #region TARTARUS
	EnemiesBiome1 = {
		"Swarmer",
		"SwarmerElite",
		"LightSpawner",
		"ThiefMineLayer",
		"ThiefMineLayerElite",
		"PunchingBagUnit",
		"PunchingBagUnitElite",
		"HeavyMelee",
		"HeavyMeleeElite",
		"DisembodiedHand",
		"DisembodiedHandElite",
		"LightRanged",
		"LightRangedElite",
		"HeavyRanged",
		"HeavyRangedElite",
	},
	EnemiesBiome1Devotion = {
		"HeavyMeleeElite",
		"LightRangedElite",
		"PunchingBagUnitElite",
		"HeavyRangedElite",
	},
	EnemiesBiome1Survival = {
		"Swarmer",
		"SwarmerElite",
		"LightSpawner",
		"ThiefMineLayer",
		"ThiefMineLayerElite",
		"PunchingBagUnit",
		"HeavyMelee",
		"LightRanged",
		"HeavyRanged",
		"HeavyMeleeElite",
		"LightRangedElite",
		"PunchingBagUnitElite",
		"HeavyRangedElite",
	},
	EnemiesBiome1Hard = {
		"SwarmerElite",
		"HeavyMeleeElite",
		"LightRangedElite",
		"ThiefMineLayerElite",
		"PunchingBagUnitElite",
		"HeavyRangedElite",
	},
	EnemiesBiome1Thanatos = {
		"SwarmerElite",
		"PunchingBagUnit",
		"HeavyMelee",
		"HeavyRanged",
		"HeavyMeleeElite",
		"LightRangedElite",
		"ThiefMineLayerElite",
		"PunchingBagUnitElite",
		"HeavyRangedElite",
	},
	-- Custom
	EnemiesBiome1_EliteChallenge = {
		"HeavyMeleeElite",
		"PunchingBagUnitElite",
	},
	EnemiesBiome1MiniBoss = {
		"BloodlessGrenadierElite",
		"BloodlessSelfDestructElite",
		"BloodlessPitcherElite",
	},
	-- #endregion

	-- #region ASPHODEL
	EnemiesBiome2 = {
		"CrusherUnit",
		"LightSpawnerElite",
		"BloodlessNaked",
		"BloodlessNakedElite",
		"BloodlessNakedBerserker",
		"BloodlessNakedBerserkerElite",
		"BloodlessGrenadier",
		"BloodlessGrenadierElite",
		"BloodlessSelfDestruct",
		"BloodlessSelfDestructElite",
		"BloodlessPitcher",
		"BloodlessPitcherElite",
		"BloodlessWaveFist",
		"BloodlessWaveFistElite",
		"SpreadShotUnit",
		"SpreadShotUnitElite",
		"FreezeShotUnit",
		"FreezeShotUnitElite",
		"RangedBurrower",
		"RangedBurrowerElite",
	},
	-- TimeChallenge
	EnemiesBiome2Challenge = {
		"LightSpawnerElite",
		"BloodlessNaked",
		"BloodlessNaked",
		"BloodlessNakedElite",
		"BloodlessNakedBerserkerElite",
		"BloodlessGrenadier",
		"BloodlessGrenadierElite",
		"BloodlessSelfDestruct",
		"BloodlessSelfDestructElite",
		"BloodlessPitcher",
		"BloodlessPitcherElite",
		"BloodlessWaveFist",
		"BloodlessWaveFistElite",
		"HeavyRangedElite",
		"SpreadShotUnit",
		"SpreadShotUnitElite",
		"FreezeShotUnit",
		"FreezeShotUnitElite",
		"RangedBurrower",
		"RangedBurrowerElite",
	},
	EnemiesBiome2Thanatos = {
		"CrusherUnit",
		"BloodlessNaked",
		"BloodlessNakedElite",
		"BloodlessNakedBerserker",
		"BloodlessNakedBerserkerElite",
		"BloodlessGrenadier",
		"BloodlessSelfDestruct",
		"BloodlessSelfDestructElite",
		"BloodlessPitcher",
		"BloodlessWaveFist",
		"BloodlessWaveFistElite",
		"SpreadShotUnit",
		"SpreadShotUnitElite",
		"FreezeShotUnit",
		"RangedBurrower",
		"RangedBurrowerElite",
	},
	-- Custom
	EnemiesBiome2_EliteChallenge = {
		"BloodlessSelfDestructElite",
		"BloodlessNakedBerserkerElite",
		"BloodlessSelfDestructElite",
		"BloodlessPitcherElite",
		"BloodlessWaveFistElite",
	},
	EnemiesBiome2Wrapping = {
		"BloodlessNakedElite",
		"BloodlessGrenadierElite",
		"BloodlessSelfDestructElite",
		"BloodlessPitcherElite",
		"BloodlessWaveFistElite",
		-- ShieldRanged, -- Added through the encounter directly for each wave
	},
	EnemiesBiome2Devotion = {
		"SpreadShotUnitElite",
		"FreezeShotUnitElite",
		"BloodlessNakedElite",
		"BloodlessNakedBerserkerElite",
		"BloodlessGrenadierElite",
		"BloodlessSelfDestructElite",
		"BloodlessPitcherElite",
		"BloodlessWaveFistElite",
		"RangedBurrowerElite",
		-- Multiplying to favour elite enemies when available
		"SpreadShotUnitElite",
		"FreezeShotUnitElite",
		"BloodlessNakedElite",
		"BloodlessNakedBerserkerElite",
		"BloodlessGrenadierElite",
		"BloodlessSelfDestructElite",
		"BloodlessPitcherElite",
		"BloodlessWaveFistElite",
		"RangedBurrowerElite",
		"SpreadShotUnitElite",
		"FreezeShotUnitElite",
		"BloodlessNakedElite",
		"BloodlessNakedBerserkerElite",
		"BloodlessGrenadierElite",
		"BloodlessSelfDestructElite",
		"BloodlessPitcherElite",
		"BloodlessWaveFistElite",
		"RangedBurrowerElite",
		"SpreadShotUnitElite",
		"FreezeShotUnitElite",
		"BloodlessNakedElite",
		"BloodlessNakedBerserkerElite",
		"BloodlessGrenadierElite",
		"BloodlessSelfDestructElite",
		"BloodlessPitcherElite",
		"BloodlessWaveFistElite",
		"RangedBurrowerElite",
		-- Need to add some non-elite enemies, to ensure there are always valid enemies available
		"SpreadShotUnit",
		"RangedBurrower",
		"BloodlessPitcher",
		"BloodlessWaveFist",
	},
	EnemiesBiome2Hard = {
		"SpreadShotUnitElite",
		"LightSpawnerElite",
		"FreezeShotUnitElite",
		"CrusherUnit",
		"BloodlessNakedElite",
		"BloodlessNakedBerserkerElite",
		"BloodlessGrenadierElite",
		"BloodlessSelfDestructElite",
		"BloodlessPitcherElite",
		"BloodlessWaveFistElite",
		"RangedBurrowerElite",
	},
	HydraHeads = {
		"HydraHeadDartmaker",
		"HydraHeadLavamaker",
		"HydraHeadSummoner",
		"HydraHeadSlammer",
		"HydraHeadWavemaker",
	},
	-- #endregion

	-- #region ELYSIUM
	EnemiesBiome3 = {
		"ShadeSpearUnit",
		"ShadeSpearUnitElite",
		"ShadeBowUnit",
		"ShadeBowUnitElite",
		"ShadeShieldUnit",
		"ShadeShieldUnitElite",
		"ShadeSwordUnit",
		"ShadeSwordUnitElite",
		"ShieldRangedElite",
		"ShieldRangedElite",
		"SplitShotUnit",
		"SplitShotUnitElite",
		"Chariot",
		"ChariotElite",
		"ChariotSuicide",
		"ChariotSuicideElite",
		"FlurrySpawner",
		"FlurrySpawner",
	},
	EnemiesBiome3Survival = {
		"ShadeSpearUnit",
		"ShadeSpearUnitElite",
		"ShadeBowUnit",
		"ShadeBowUnitElite",
		"ShadeShieldUnit",
		"ShadeShieldUnitElite",
		"ShadeSwordUnit",
		"ShadeSwordUnitElite",
		"SplitShotUnit",
		"SplitShotUnitElite",
		"Chariot",
		"ChariotElite",
	},
	EnemiesBiome3Hard = {
		"ShieldRangedElite",
		"ShadeSpearUnitElite",
		"ShadeBowUnitElite",
		"ShadeShieldUnitElite",
		"ShadeSwordUnitElite",
		"SplitShotUnitElite",
		"ChariotElite",
	},
	EnemiesBiome3Devotion = {
		"ShieldRangedElite",
		"ShadeSpearUnitElite",
		"ShadeBowUnitElite",
		"ShadeShieldUnitElite",
		"ShadeSwordUnitElite",
		"SplitShotUnitElite",
		"ChariotElite",
	},
	-- Custom
	EnemiesBiome3_EliteChallenge = {
		"ShadeSpearUnitElite",
		"ShadeShieldUnitElite",
		"ShadeSwordUnitElite",
	},
	-- #endregion

	-- #region STYX
	EnemiesBiome4 = {
		"Crawler",
		"RatThug",
		"RatThugElite",
		"SatyrRanged",
		"SatyrRangedElite",
		"HeavyRangedForked",
		"HeavyRangedForkedElite",
		"ThiefImpulseMineLayer",
		"ThiefImpulseMineLayerElite",
	},
	EnemiesBiome4MiniBoss = {
		"SatyrRangedMiniboss",
		"RatThugMiniboss",
		"ThiefImpulseMineLayerMiniboss",
		"HeavyRangedForkedMiniboss"
	},
	EnemiesBiome4MiniBossFodder = {
		"Crawler",
		"RatThug",
		"SatyrRanged",
		"HeavyRangedForked",
		"ThiefImpulseMineLayer",
	},
	EnemiesBiome4Mini = {
		"Crawler",
		"RatThug",
		"SatyrRanged",
		"HeavyRangedForked",
		"ThiefImpulseMineLayer",
	},
	EnemiesBiome4MiniHard = {
		"RatThugElite",
		"SatyrRangedElite",
		"HeavyRangedForkedElite",
		"ThiefImpulseMineLayerElite",
	},
	EnemiesBiome4MiniSingle = {
		"RatThugElite",
		"SatyrRangedElite",
		"HeavyRangedForkedElite",
	},
	-- Custom
	EnemiesBiome4_EliteChallenge = {
		"RatThugElite",
		"SatyrRangedElite",
		"HeavyRangedForkedElite",
	},
	-- Hades
	EnemiesHadesLarge = {
		"BloodlessPitcherSuperElite",
		"ShadeShieldUnitSuperElite",
		"ShadeSpearUnitSuperElite",
		"ShadeSwordUnitSuperElite",
		"ShieldRangedSuperElite",
	},
	EnemiesHadesSmall = {
		"ShadeBowUnitSuperElite",
		"PunchingBagUnitSuperElite",
		"LightRangedSuperElite",
		"BloodlessNakedSuperElite",
		"ChariotSuperElite",
		"SwarmerSuperElite",
		"RangedBurrowerSuperElite",
		"DisembodiedHandSuperElite",
	},
	EnemiesHadesEMLarge = {
		"WretchAssassinMinibossSuperElite",
		"HitAndRunUnitSuperElite",
	},
	EnemiesHadesEMSmall = {
		-- "HeavyRangedSplitterMinibossSuperElite", -- Disabled, as the laser beam jumps layers
		"CrusherUnitSuperElite",
		"FlurrySpawnerSuperElite",
	},
	-- #endregion

	-- #region ENVIRONMENT
	-- Decides which traps can be added to rooms that randomize traps
	TrapsBiome1 = { "SpikeTrap", },
	TrapsBiome2 = { "GasTrapPassive", },
	-- #endregion
}

table.insert(game.EnemySets.GenericEliteAttributes, "ModsNikkelMHadesBiomesStasisDeath")

for oldName, newName in pairs(mod.EnemyNameMappings) do
	mod.UpdateField(additionalEnemySets, oldName, newName, {}, "EnemySets.lua")
end

-- Adds the new enemy sets to the game
for setName, setData in pairs(additionalEnemySets) do
	if not game.EnemySets[setName] then
		game.EnemySets[setName] = setData
	end
end
