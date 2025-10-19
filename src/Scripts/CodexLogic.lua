-- Load the modded portraits package, so the codex entry images for the modded entries are loaded
modutil.mod.Path.Wrap("OpenCodexScreen", function(base)
	LoadPackages({ Name = "ModsNikkelMHadesBiomesPortraits" })
	base()
end)

-- TODO: Move into mod., check for other biomes
function game.CheckLocationUnlock(eventSource, args)
	game.CurrentRun.BiomesReached = game.CurrentRun.BiomesReached or {}
	game.CurrentRun.BiomesReached[args.Biome] = true
	game.CheckCodexUnlock("ModsNikkelMHadesBiomesCodexEntry", args.Biome)
end
