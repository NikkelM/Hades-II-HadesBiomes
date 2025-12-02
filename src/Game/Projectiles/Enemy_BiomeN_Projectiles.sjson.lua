local hadesTwoProjectilesFile = rom.path.combine(rom.paths.Content(), "Game\\Projectiles\\Enemy_BiomeN_Projectiles.sjson")

local addProjectiles = {
	{
		-- For the HydraCrusher weapon
		Name = "ModsNikkelMHadesBiomesHydraCrusher",
		InheritFrom = "PolyphemusBoulder",
		DetonateFx = "HydraCrusherFx",
		DetonateSound = "/SFX/Enemy Sounds/CrusherAttackImpact",
		Damage = 12,
		DamageRadius = 380,
		DamageRadiusScaleY = 0.6,
		MaxSpeed = 2000.0,
		SpawnOnDeath = "null",
		ImmunityKey = "null",
		Thing = {
			Graphic = "HydraCrusher",
			AttachedAnim = "HydraCrusherShadowStart",
		},
	},
}

sjson.hook(hadesTwoProjectilesFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_BiomeN_Projectiles"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Projectiles, addProjectiles, "Name")
end)
