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
		Scale = 0.4,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxPersistent",
		InheritFrom = "DragonBurrowerBurrowFxPersistent",
		ChainTo = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxOut_NoDirt",
		Scale = 0.4,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxOut",
		InheritFrom = "DragonBurrowerBurrowFxOut",
		VisualFx = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowDirt",
		Scale = 0.4,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeFamiliar_BurrowFxOut_NoDirt",
		InheritFrom = "DragonBurrowerBurrowFxOut_NoDirt",
		Scale = 0.4,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeDartTrail",
		InheritFrom = "DragonBurrowerRangedTrail",
		Color = { Red = 1.0, Green = 1.0, Blue = 1.0 },
		Hue = 0.33,
		ScaleMin = 0.208,
		ScaleMax = 0.485,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeDartLoop",
		InheritFrom = "DragonBurrowerRanged",
		Color = { Red = 0.0, Green = 0.0, Blue = 0.0, Alpha = 1.0 },
		Hue = 0.42,
		Value = -0.15,
		Scale = 0.45,
		ScaleY = 0.825,
		VisualFx = "ModsNikkelMHadesBiomesSnakeDartTrail",
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeDartIn",
		InheritFrom = "DragonBurrowerRangedIn",
		Color = { Red = 0.0, Green = 0.0, Blue = 0.0, Alpha = 1.0 },
		Hue = 0.42,
		Value = -0.15,
		Scale = 0.45,
		ScaleY = 0.825,
		ChainTo = "ModsNikkelMHadesBiomesSnakeDartLoop",
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeDartDissipate",
		InheritFrom = "DragonBurrowerRangedDissipate",
		Color = { Red = 0.0, Green = 0.0, Blue = 0.0, Alpha = 1.0 },
		Hue = 0.42,
		Value = -0.15,
		Scale = 0.45,
		ScaleY = 0.825,
	},
	{
		Name = "ModsNikkelMHadesBiomesSnakeDartGlow",
		InheritFrom = "DragonBurrowerRangedGlow",
		Color = { Red = 0.165, Green = 0.75, Blue = 0.165 },
		ScaleMin = 0.228,
		ScaleMax = 0.277,
	},
}

sjson.hook(hadesTwoEnemyTyphonVFXFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_Typhon_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Animations, addAnimations, "Name")
end)
