---Modifies enemy data for traps. Some data is modified directly on the game's trap object, as otherwise maps won't populate with them correctly.
---@param enemyData table The table containing the traps to modify.
function mod.ModifyEnemyTrapData(enemyData)
	-- We need to edit the original trap/enemy instead of adding a new one, as otherwise the maps won't populate the correct trap
	-- AFAIK, the original SpikeTrap is not used anywhere in Hades II at the moment
	game.EnemyData.SpikeTrap.WeaponOptions = { "HadesSpikeTrapWeapon" }
	game.EnemyData.SpikeTrap.DefaultAIData.IdleAnimation = "HadesSpikeTrapIdle"
	game.EnemyData.SpikeTrap.DefaultAIData.PreAttackAnimation = "HadesSpikeTrapPreFire"
	game.EnemyData.SpikeTrap.DefaultAIData.PostAttackAnimation = "HadesSpikeTrapPressed"
	game.EnemyData.SpikeTrap.DefaultAIData.DisabledAnimation = "HadesSpikeTrapDeactivated"

	enemyData.DartTrap = {
		InheritFrom = { "BaseTrap" },
		TargetGroups = { "GroundEnemies", "HeroTeam" },
		-- All of these properties were in the root before, but need to be in DefaultAIData for Hades II
		DefaultAIData = {
			DeepInheritance = true,
			PreAttackDuration = 0.2,
			PostAttackCooldown = 2.0,
			LinkedEnemy = "DartTrapEmitter",
			IdleAnimation = "DartTrapIdle",
			PreAttackAnimation = "DartTrapPreFire",
			PreAttackSound = "/SFX/TrapSet",
			PostAttackAnimation = "DartTrapPressed",
			ReloadingLoopSound = "/SFX/TrapSettingLoop",
			ReloadedSound = "/Leftovers/Menu Sounds/TalismanMetalClankDown",
			DisabledAnimation = "DartTrapDeactivated",
			AttackDistance = 100,
			AIResetDistance = 110,
			MaxVictimZ = 1,
		},
		AIOptions =
		{
			-- RemoteAI
			"RemoteAttackModsNikkelMHadesBiomes"
		},
		ToggleTrap = true,
	}
	-- Fires when the player steps on a Dart trap plate
	enemyData.DartTrapEmitter = {
		InheritFrom = { "IsNeutral" },
		Type = "Trap",
		TriggersOnHitEffects = false,
		DefaultAIData = {
			DeepInheritance = true,
			PreAttackAnimation = "DartTrapEmitterFire",
			PostAttackAnimation = "DartTrapEmitterReturnToIdle",
			PreAttackDuration = 0.0,
			PostAttackDuration = 0.0,
			FireTicksMin = 3,
			FireTicksMax = 3,
			FireInterval = 0.15,
			TrackTargetDuringCharge = false,
			-- Manually added!
			ProjectileName = "DartTrapWeapon",
			PostAttackCooldown = 2.0,
		},
		Material = "MetalObstacle",
		WeaponOptions = { "DartTrapWeapon" },
		WeaponName = "DartTrapWeapon",
		OutgoingDamageModifiers = { { NonPlayerMultiplier = 33.33 } }
	}
end
