local hadesTwoEnemyTyphonVFXFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Enemy_Typhon_VFX.sjson")

local addAnimations = {
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirtA",
		InheritFrom = "EnemyBurrowDirtA_Fast",
		Scale = 1.2,
		ScaleMin = 0.24,
		ScaleMax = 0.48,
		RandomOffsetX = 15,
		RandomOffsetY = 3,
		VelocityMin = 240,
		VelocityMax = 600,
		Gravity = 720,
		Acceleration = -300,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirtB",
		InheritFrom = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirtA",
		FilePath = "Particles\\particle_dirt_02",
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirtC",
		InheritFrom = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirtA",
		FilePath = "Particles\\particle_dirt_03",
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirt",
		Random = {
			{ Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirtA" },
			{ Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirtB" },
			{ Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirtC" },
		},
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxIn",
		InheritFrom = "DragonBurrowerBurrowFxIn",
		ChainTo = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxPersistent",
		VisualFx = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirt",
		Scale = 0.3,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxPersistent",
		InheritFrom = "DragonBurrowerBurrowFxPersistent",
		ChainTo = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxOut_NoDirt",
		Scale = 0.3,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxOut",
		InheritFrom = "DragonBurrowerBurrowFxOut",
		VisualFx = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirt",
		Scale = 0.3,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxOut_NoDirt",
		InheritFrom = "DragonBurrowerBurrowFxOut_NoDirt",
		Scale = 0.3,
	},
}

sjson.hook(hadesTwoEnemyTyphonVFXFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_Typhon_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
