local animationsFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Model\\Enemy_HadesTombstone_Animation.sjson")

local addAnimations = {
	{
		Name = "ModsNikkelMHadesBiomesHadesTombstoneExplode",
		InheritFrom = "HadesTombstoneExplode",
		FilePath =
		"NikkelM-HadesBiomesFxModded\\Fx\\ModsNikkelMHadesBiomesHadesTombstoneExplode\\ModsNikkelMHadesBiomesHadesTombstoneExplode",
		CreateAnimation = "QuickFlashRed",
	},
}

sjson.hook(animationsFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_HadesTombstone_Animation"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
