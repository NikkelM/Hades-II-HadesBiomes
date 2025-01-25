-- Adds enemy sets for the new regions

-- Rename duplicate enemy names using mod.EnemyNameMappings
local function renameEnemies(enemySet, setName)
	for i, enemy in ipairs(enemySet) do
		if mod.EnemyNameMappings[enemy] then
			enemySet[i] = mod.EnemyNameMappings[enemy]
			mod.DebugPrint("Renamed enemy: " .. enemy .. " to " .. enemySet[i] .. " in " .. setName)
		end
	end
end

game.EnemySets.EnemiesBiome1 = {
	"Swarmer",              -- Wretch Swarmer -- Duplicate Name!
	"SwarmerElite",         -- Wretch Swarmer
	"LightSpawner",         -- Spawns skulls
	"ThiefMineLayer",       -- Wretch Thief
	"ThiefMineLayerElite",  -- Wretch Thief

	"PunchingBagUnit",      -- Wretch Glutton
	"HeavyMelee",           -- Wretch Thug
	"DisembodiedHand",      -- Wringer
	"DisembodiedHandElite", -- Wringer Elite

	"LightRanged",          -- Wretch Caster -- Duplicate name!
	"HeavyRanged",          -- Crystal

	"HeavyMeleeElite",      -- Wretch Thug Elite
	"LightRangedElite",     -- Wretch Caster Elite
	"PunchingBagUnitElite", -- Wretch Glutton Elite
	"HeavyRangedElite",     -- Crystal Elite
}

game.EnemySets.EnemiesBiome1_EliteChallenge = {
	"HeavyMeleeElite",     -- Wretch Thug Elite -- Done through HeavyMelee
	"PunchingBagUnitElite", -- Wretch Glutton Elite -- Done
}

game.EnemySets.EnemiesBiome1MiniBoss = {
	"BloodlessGrenadierElite",
	"BloodlessSelfDestruct_Elite",
	"BloodlessPitcher_Elite"
	-- "BloodlessPitcherElite",
	-- "BloodlessSelfDestructElite",
}

renameEnemies(game.EnemySets.EnemiesBiome1, "EnemiesBiome1")
renameEnemies(game.EnemySets.EnemiesBiome1_EliteChallenge, "EnemiesBiome1_EliteChallenge")
renameEnemies(game.EnemySets.EnemiesBiome1MiniBoss, "EnemiesBiome1MiniBoss")
