local hadesTwoFamiliarProjectilesFile =
	rom.path.combine(rom.paths.Content(), "Game\\Projectiles\\Familiar_Projectiles.sjson")

local addProjectiles = {
	{
		Name = "ModsNikkelMHadesBiomesSnakeDart",
		InheritFrom = "DragonBurrowerRanged",
		AffectsEnemies = true,
		AffectsFriends = false,
		AffectsSelf = false,
		CanBeReflected = false,
		Damage = 10,
		Effects = {
			{
				Name = "HeroOnHitStun",
				Active = false,
			},
		},
	},
}

sjson.hook(hadesTwoFamiliarProjectilesFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Familiar_Projectiles"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Projectiles, addProjectiles, "Name")
end)
