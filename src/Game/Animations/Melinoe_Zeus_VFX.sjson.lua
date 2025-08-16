local hadesTwoTartarusObstacleFile = rom.path.combine(rom.paths.Content(),
	"Game\\Animations\\Melinoe_Zeus_VFX.sjson")

-- These need to be added before the others, as they are inherited from
local addAnimationsParents = {}
local addAnimations = {
	ModsNikkelMHadesBiomesZeusEchoDebuff = {
		Name = "ModsNikkelMHadesBiomesZeusEchoDebuff",
		InheritFrom = "ZeusEchoDebuff",
		ChainTo = "ModsNikkelMHadesBiomesZeusEchoDebuffOut",
		OffsetZ = 300,
	},
	ModsNikkelMHadesBiomesZeusEchoDebuffOut = {
		Name = "ModsNikkelMHadesBiomesZeusEchoDebuffOut",
		InheritFrom = "ZeusEchoDebuffOut",
		OffsetZ = 300,
	},
	ModsNikkelMHadesBiomesZeusEchoDebuffSwell = {
		Name = "ModsNikkelMHadesBiomesZeusEchoDebuffSwell",
		InheritFrom = "ZeusEchoDebuffSwell",
		OffsetZ = 300,
	},
}

sjson.hook(hadesTwoTartarusObstacleFile, function(data)
	-- Add new animations
	mod.AddTableKeysSkipDupes(data.Animations, addAnimationsParents, "Name")
	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
