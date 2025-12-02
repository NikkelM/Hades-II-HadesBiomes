-- Adds projectile data for traps from Hades to Hades II

local hadesTwoProjectilesFile = rom.path.combine(rom.paths.Content(), "Game\\Projectiles\\Enemy_Traps_Projectiles.sjson")

local addProjectiles = {
	{
		Name = "ModsNikkelMHadesBiomesRubbleFall",
		InheritFrom = "RubbleFall",
		DamageRadius = 300,
	},
	{
		Name = "ModsNikkelMHadesBiomesRubbleFallLarge",
		InheritFrom = "RubbleFall",
		Damage = 300,
		DetonateGraphic = "RadialNovaRubbleLarge",
		DamageRadius = 450,
	},
	{
		-- Overwrites the DamageRadius of the WarningDecal, doesn't change anything else
		Name = "ModsNikkelMHadesBiomesBlastWarningDecalElysium",
		DamageRadius = 450.0,
	},
}

sjson.hook(hadesTwoProjectilesFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_Traps_Projectiles"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Projectiles, addProjectiles, "Name")
end)
