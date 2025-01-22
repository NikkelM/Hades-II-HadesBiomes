-- Adds enemy sets for the new regions

game.EnemySets.EnemiesBiome1 = {
	"Swarmer",             -- Wretch Swarmer -- Duplicate Name!
	"SwarmerElite",        -- Wretch Swarmer
	"LightSpawner",        -- Spawns skulls
	"ThiefMineLayer",      -- Wretch Thief
	"ThiefMineLayerElite", -- Wretch Thief

	"PunchingBagUnit",     -- Wretch Glutton
	"HeavyMelee",          -- Wretch Thug
	"DisembodiedHand",     -- Wringer
	"DisembodiedHandElite",-- Wringer Elite

	"LightRanged",         -- Wretch Caster -- Duplicate name!
	"HeavyRanged",         -- Crystal

	"HeavyMeleeElite",     -- Wretch Thug Elite
	"LightRangedElite",    -- Wretch Caster Elite
	"PunchingBagUnitElite",-- Wretch Glutton Elite
	"HeavyRangedElite",    -- Crystal Elite
}

-- Rename duplicate enemy names using mod.EnemyNameMappings
for i, enemy in ipairs(game.EnemySets.EnemiesBiome1) do
	if mod.EnemyNameMappings[enemy] then
		game.EnemySets.EnemiesBiome1[i] = mod.EnemyNameMappings[enemy]
		mod.DebugPrint("Renamed enemy: " .. enemy .. " to " .. game.EnemySets.EnemiesBiome1[i] .. " in EnemiesBiome1")
	end
end

game.EnemySets.EnemiesBiome1_EliteChallenge = {
	"HeavyMeleeElite",     -- Wretch Thug Elite -- Done through HeavyMelee
	-- "LightRangedElite",    -- Wretch Caster Elite -- Not a very difficult enemy, so not included
	"PunchingBagUnitElite", -- Wretch Glutton Elite -- Done
}

for i, enemy in ipairs(game.EnemySets.EnemiesBiome1_EliteChallenge) do
	if mod.EnemyNameMappings[enemy] then
		game.EnemySets.EnemiesBiome1_EliteChallenge[i] = mod.EnemyNameMappings[enemy]
		mod.DebugPrint("Renamed enemy: " ..
			enemy .. " to " .. game.EnemySets.EnemiesBiome1_EliteChallenge[i] .. " in EnemiesBiome1_EliteChallenge")
	end
end
