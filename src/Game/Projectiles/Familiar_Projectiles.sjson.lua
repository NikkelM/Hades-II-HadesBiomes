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
		Damage = 5,
		Effect = {
			Name = "ModsNikkelMHadesBiomesSnakeVenom",
			Type = "DAMAGE_OVER_TIME",
			Amount = 2,
			Cooldown = 0.7,
			InitialDelay = 0,
			Duration = 12,
			Stacks = true,
			MaxStacks = 6,
			ExtendDurationOnReapply = true,
			SilentImpact = true,
			FrontFx = "ModsNikkelMHadesBiomesSnakeVenomFx",
			Active = true,
			CanAffectInvulnerable = false,
			Cancelable = true,
			DisableMove = false,
			DisableRotate = false,
			DisableAttack = false,
		},
	},
}

sjson.hook(hadesTwoFamiliarProjectilesFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Familiar_Projectiles"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Projectiles, addProjectiles, "Name")
end)
