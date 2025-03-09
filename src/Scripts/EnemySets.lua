-- Adds enemy sets for the new regions

-- Rename duplicate enemy names using mod.EnemyNameMappings
local function renameEnemies(enemySet, setName)
	for i, enemy in ipairs(enemySet) do
		if mod.EnemyNameMappings[enemy] then
			enemySet[i] = mod.EnemyNameMappings[enemy]
			mod.DebugPrint("Renamed enemy: " .. enemy .. " to " .. enemySet[i] .. " in " .. setName, 4)
		end
	end
end

-- Tartarus
game.EnemySets.EnemiesBiome1 = {
	"Swarmer",             -- Wretch Swarmer -- Duplicate Name!
	"SwarmerElite",        -- Wretch Swarmer
	"LightSpawner",        -- Skullomat
	"ThiefMineLayer",      -- Wretch Thief
	"ThiefMineLayerElite", -- Wretch Thief
	"PunchingBagUnit",     -- Wretch Glutton
	"HeavyMelee",          -- Wretch Thug
	"DisembodiedHand",     -- Wringer
	"DisembodiedHandElite", -- Wringer Elite
	"LightRanged",         -- Wretch Caster -- Duplicate name!
	"HeavyRanged",         -- Crystal
	"HeavyMeleeElite",     -- Wretch Thug Elite
	"LightRangedElite",    -- Wretch Caster Elite
	"PunchingBagUnitElite", -- Wretch Glutton Elite
	"HeavyRangedElite",    -- Crystal Elite
}

game.EnemySets.EnemiesBiome1Devotion = {
	"HeavyMeleeElite",     -- Wretch Thug Elite
	"LightRangedElite",    -- Wretch Caster Elite
	"PunchingBagUnitElite", -- Wretch Glutton Elite
	"HeavyRangedElite",
}

game.EnemySets.EnemiesBiome1Survival = {
	"Swarmer",             -- Wretch Swarmer
	"SwarmerElite",        -- Wretch Swarmer
	"LightSpawner",        -- Skullomat
	"ThiefMineLayer",      -- Wretch Thief
	"ThiefMineLayerElite", -- Wretch Thief
	"PunchingBagUnit",     -- Wretch Glutton
	"HeavyMelee",          -- Wretch Thug
	"LightRanged",         -- Wretch Caster
	"HeavyRanged",         -- Crystal
	"HeavyMeleeElite",     -- Wretch Thug Elite
	"LightRangedElite",    -- Wretch Caster Elite
	"PunchingBagUnitElite", -- Wretch Glutton Elite
	"HeavyRangedElite",    -- Crystal Elite
}

game.EnemySets.EnemiesBiome1Hard = {
	"SwarmerElite",        -- Wretch Swarmer
	"HeavyMeleeElite",     -- Wretch Thug Elite
	"LightRangedElite",    -- Wretch Caster Elite
	"ThiefMineLayerElite", -- Wretch Thief
	"PunchingBagUnitElite", -- Wretch Glutton Elite
	"HeavyRangedElite",
}

game.EnemySets.EnemiesBiome1Thanatos = {
	"SwarmerElite",        -- Wretch Swarmer
	"PunchingBagUnit",     -- Wretch Glutton
	"HeavyMelee",          -- Wretch Thug
	"HeavyRanged",         -- Crystal

	"HeavyMeleeElite",     -- Wretch Thug Elite
	"LightRangedElite",    -- Wretch Caster Elite
	"ThiefMineLayerElite", -- Wretch Thief
	"PunchingBagUnitElite", -- Wretch Glutton Elite
	"HeavyRangedElite",
}

game.EnemySets.EnemiesBiome1_EliteChallenge = {
	"HeavyMeleeElite",     -- Wretch Thug Elite
	"PunchingBagUnitElite", -- Wretch Glutton Elite
}

game.EnemySets.EnemiesBiome1MiniBoss = {
	"BloodlessGrenadierElite",
	"BloodlessSelfDestructElite",
	"BloodlessPitcherElite",
}

-- Asphodel
game.EnemySets.EnemiesBiome2 = {
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
}

-- TimeChallenge
game.EnemySets.EnemiesBiome2Challenge = {
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
}

game.EnemySets.EnemiesBiome2Thanatos = {
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
}

game.EnemySets.EnemiesBiome2_EliteChallenge = {
	"BloodlessSelfDestructElite",
	"BloodlessNakedBerserkerElite",
	"BloodlessSelfDestructElite",
	"BloodlessPitcherElite",
	"BloodlessWaveFistElite",
}

game.EnemySets.EnemiesBiome2Wrapping = {
	"BloodlessNakedElite",
	"BloodlessGrenadierElite",
	"BloodlessSelfDestructElite",
	"BloodlessPitcherElite",
	"BloodlessWaveFistElite",
	-- ShieldRanged, -- Added through the encounter directly for each wave
}

game.EnemySets.EnemiesBiome2Devotion = {
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
}

game.EnemySets.EnemiesBiome2Hard = {
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
}

game.EnemySets.HydraHeads = {
	"HydraHeadDartmaker",
	"HydraHeadLavamaker",
	"HydraHeadSummoner",
	"HydraHeadSlammer",
	"HydraHeadWavemaker",
}

-- Decides which traps can be added to rooms that randomize traps
game.EnemySets.TrapsBiome1 = { "SpikeTrap", }
game.EnemySets.TrapsBiome2 = { "GasTrapPassive", }

renameEnemies(game.EnemySets.EnemiesBiome1, "EnemiesBiome1")
renameEnemies(game.EnemySets.EnemiesBiome1Devotion, "EnemiesBiome1Devotion")
renameEnemies(game.EnemySets.EnemiesBiome1Survival, "EnemiesBiome1Survival")
renameEnemies(game.EnemySets.EnemiesBiome1Hard, "EnemiesBiome1Hard")
renameEnemies(game.EnemySets.EnemiesBiome1Thanatos, "EnemiesBiome1Thanatos")
renameEnemies(game.EnemySets.EnemiesBiome1_EliteChallenge, "EnemiesBiome1_EliteChallenge")
renameEnemies(game.EnemySets.EnemiesBiome1MiniBoss, "EnemiesBiome1MiniBoss")
renameEnemies(game.EnemySets.TrapsBiome1, "TrapsBiome1")
renameEnemies(game.EnemySets.EnemiesBiome2, "EnemiesBiome2")
renameEnemies(game.EnemySets.EnemiesBiome2Challenge, "EnemiesBiome2Challenge")
renameEnemies(game.EnemySets.EnemiesBiome2Thanatos, "EnemiesBiome2Thanatos")
renameEnemies(game.EnemySets.EnemiesBiome2_EliteChallenge, "EnemiesBiome2_EliteChallenge")
renameEnemies(game.EnemySets.EnemiesBiome2Wrapping, "EnemiesBiome2Wrapping")
renameEnemies(game.EnemySets.EnemiesBiome2Devotion, "EnemiesBiome2Devotion")
renameEnemies(game.EnemySets.EnemiesBiome2Hard, "EnemiesBiome2Hard")
renameEnemies(game.EnemySets.TrapsBiome2, "TrapsBiome2")
