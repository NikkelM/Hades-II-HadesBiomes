-- Adds enemy sets for the new regions

game.EnemySets.EnemiesBiome1 = {
	"Swarmer",             -- Wretch Swarmer -- Done -- Duplicate Name!
	"SwarmerElite",        -- Wretch Swarmer -- Done
	"LightSpawner",        -- Spawns skulls -- Done
	"ThiefMineLayer",      -- Wretch Thief
	"ThiefMineLayerElite", -- Wretch Thief

	"PunchingBagUnit",     -- Wretch Glutton -- Done
	"HeavyMelee",          -- Wretch Thug -- Done
	"DisembodiedHand",     -- Wringer -- Done
	"DisembodiedHandElite",-- Wringer Elite -- Done through Wringer

	"LightRanged",         -- Wretch Caster -- Done -- Duplicate name!
	"HeavyRanged",         -- Crystal -- Done

	"HeavyMeleeElite",     -- Wretch Thug Elite -- Done through HeavyMelee
	"LightRangedElite",    -- Wretch Caster Elite -- Done through LightRanged
	"PunchingBagUnitElite",-- Wretch Glutton Elite -- Done through PunchingBagUnit
	"HeavyRangedElite",    -- Crystal Elite -- Done through HeavyRanged
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
