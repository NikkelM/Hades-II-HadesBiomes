-- Adds enemy sets for the new regions
local additionalEnemySets = {
	-- TARTARUS
	EnemiesBiome1 = {
		"Swarmer",           -- Wretch Swarmer -- Duplicate Name!
		"SwarmerElite",      -- Wretch Swarmer
		"LightSpawner",      -- Skullomat
		"ThiefMineLayer",    -- Wretch Thief
		"ThiefMineLayerElite", -- Wretch Thief
		"PunchingBagUnit",   -- Wretch Glutton
		"HeavyMelee",        -- Wretch Thug
		"DisembodiedHand",   -- Wringer
		"DisembodiedHandElite", -- Wringer Elite
		"LightRanged",       -- Wretch Caster -- Duplicate name!
		"HeavyRanged",       -- Crystal
		"HeavyMeleeElite",   -- Wretch Thug Elite
		"LightRangedElite",  -- Wretch Caster Elite
		"PunchingBagUnitElite", -- Wretch Glutton Elite
		"HeavyRangedElite",  -- Crystal Elite
	},
	EnemiesBiome1Devotion = {
		"HeavyMeleeElite",   -- Wretch Thug Elite
		"LightRangedElite",  -- Wretch Caster Elite
		"PunchingBagUnitElite", -- Wretch Glutton Elite
		"HeavyRangedElite",
	},
	EnemiesBiome1Survival = {
		"Swarmer",           -- Wretch Swarmer
		"SwarmerElite",      -- Wretch Swarmer
		"LightSpawner",      -- Skullomat
		"ThiefMineLayer",    -- Wretch Thief
		"ThiefMineLayerElite", -- Wretch Thief
		"PunchingBagUnit",   -- Wretch Glutton
		"HeavyMelee",        -- Wretch Thug
		"LightRanged",       -- Wretch Caster
		"HeavyRanged",       -- Crystal
		"HeavyMeleeElite",   -- Wretch Thug Elite
		"LightRangedElite",  -- Wretch Caster Elite
		"PunchingBagUnitElite", -- Wretch Glutton Elite
		"HeavyRangedElite",  -- Crystal Elite
	},
	EnemiesBiome1Hard = {
		"SwarmerElite",      -- Wretch Swarmer
		"HeavyMeleeElite",   -- Wretch Thug Elite
		"LightRangedElite",  -- Wretch Caster Elite
		"ThiefMineLayerElite", -- Wretch Thief
		"PunchingBagUnitElite", -- Wretch Glutton Elite
		"HeavyRangedElite",
	},
	EnemiesBiome1Thanatos = {
		"SwarmerElite",      -- Wretch Swarmer
		"PunchingBagUnit",   -- Wretch Glutton
		"HeavyMelee",        -- Wretch Thug
		"HeavyRanged",       -- Crystal

		"HeavyMeleeElite",   -- Wretch Thug Elite
		"LightRangedElite",  -- Wretch Caster Elite
		"ThiefMineLayerElite", -- Wretch Thief
		"PunchingBagUnitElite", -- Wretch Glutton Elite
		"HeavyRangedElite",
	},
	EnemiesBiome1_EliteChallenge = {
		"HeavyMeleeElite",   -- Wretch Thug Elite
		"PunchingBagUnitElite", -- Wretch Glutton Elite
	},
	EnemiesBiome1MiniBoss = {
		"BloodlessGrenadierElite",
		"BloodlessSelfDestructElite",
		"BloodlessPitcherElite",
	},
	-- ASPHODEL
	EnemiesBiome2 = {
		"CrusherUnit",
		"LightSpawnerElite",
		"BloodlessNaked",
		"BloodlessNakedElite",
		"BloodlessNakedBerserker", -- BloodlessBerserker in Hades II
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
	-- ELYSIUM
	-- STYX
	-- Decides which traps can be added to rooms that randomize traps
	TrapsBiome1 = { "SpikeTrap", },
	TrapsBiome2 = { "GasTrapPassive", },
}

for oldName, newName in pairs(mod.EnemyNameMappings) do
	mod.UpdateField(additionalEnemySets, oldName, newName, { }, "EnemySets.lua")
end

-- Adds the new enemy sets to the game
for setName, setData in pairs(additionalEnemySets) do
	if not game.EnemySets[setName] then
		game.EnemySets[setName] = setData
	end
end
