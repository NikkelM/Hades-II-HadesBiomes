local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Melinoe_Zeus_VFX.sjson")

-- Modifications to existing obstacle animations in Hades II
-- These should NOT be in use by Hades II to not break functionality there!
local hadesTwoObstacleModifications = {}

-- Make sure to add a Name key!
local addAnimations = {
	ModsNikkelMHadesBiomesZeusEchoDebuff = {
		Name = "ModsNikkelMHadesBiomesZeusEchoDebuff",
		InheritFrom = "ZeusEchoDebuff",
		OffsetZ = 300,
	},
}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
	-- Apply modifications to existing obstacle animations
	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoObstacleModifications)
end)
