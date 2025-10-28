-- Update the requirements for the Devotion reward to require a minimum biome depth of 3, as that's where Elites become eligible
local devotionOrRequirements = {
	-- Either, we are not in a modded run, or we are in a modded run and at least at biome depth 3
	{
		{
			PathFalse = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" },
		},
	},
	{
		{
			PathTrue = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" },
		},
		{
			Path = { "CurrentRun", "BiomeEncounterDepth" },
			Comparison = ">=",
			Value = 3,
		},
	},
}

for _, reward in ipairs(game.RewardStoreData.RunProgress) do
	if reward.Name == "Devotion" then
		reward.GameStateRequirements.OrRequirements = devotionOrRequirements
		break
	end
end
