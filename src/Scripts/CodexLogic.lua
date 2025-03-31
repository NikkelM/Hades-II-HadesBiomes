-- Load the modded portraits package, so the codex entry images for the modded entries are loaded
modutil.mod.Path.Wrap("OpenCodexScreen", function(base)
	LoadPackages({ Name = "ModsNikkelMHadesBiomesPortraits" })
	base()
end)
