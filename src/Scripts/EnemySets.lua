-- Inserts enemy sets for the new regions

-- This is the original table from Hades
game.EnemySets.EnemiesBiome1 = {
	-- TODO: Swarmer is a re-used name for Hades II Tartarus skulls
	-- "Swarmer",            -- Wretch Swarmer
	-- "SwarmerElite",       -- Wretch Swarmer
	-- "LightSpawner",			 -- Spawns skulls
	-- "ThiefMineLayer",     -- Wretch Thief
	-- "ThiefMineLayerElite", -- Wretch Thief

	"PunchingBagUnit",    -- Wretch Glutton -- Done
	"HeavyMelee",         -- Wretch Thug -- Done
	"DisembodiedHand",			 -- Wringer -- Done
	"DisembodiedHandElite", -- Wringer Elite -- Done with Wringer

	"LightRanged", -- Wretch Caster -- Duplicate name!
	-- "HeavyRanged", -- Crystal
	-- -- "Grenadier", -- Wretch Caster -- COMMENTED OUT IN HADES EnemySets!

	"HeavyMeleeElite",     -- Wretch Thug Elite -- Done with HeavyMelee
	"LightRangedElite",    -- Wretch Caster Elite -- Duplicate name!
	"PunchingBagUnitElite", -- Wretch Glutton Elite -- Done with PunchingBagUnit
	-- "HeavyRangedElite",
}

-- Rename duplicate enemy names using EnemyNameMappings
for i, enemy in ipairs(game.EnemySets.EnemiesBiome1) do
	if EnemyNameMappings[enemy] then
		game.EnemySets.EnemiesBiome1[i] = EnemyNameMappings[enemy]
	end
end
