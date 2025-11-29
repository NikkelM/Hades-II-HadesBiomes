-- Applies modifications to base weapon objects, and then adds the new weapon objects to the game
local function applyModificationsAndInheritWeaponData(base, modifications, replacements, weaponKeyReplacements,
																											sjsonToAIDataPropertyMappings)
	for oldName, newName in pairs(mod.EnemyWeaponMappings) do
		mod.UpdatePropertyName(modifications, oldName, newName, {}, "WeaponDataHandler modifications")
		mod.UpdatePropertyName(replacements, oldName, newName, {}, "WeaponDataHandler replacements")
	end

	-- Assign the AIData before replacements and modifications, to make sure we take the parent's table if we need to
	for _, weaponData in pairs(base) do
		if not weaponData.AIData then
			if game.TableLength(weaponData.InheritFrom) == 1 and base[weaponData.InheritFrom[1]] and base[weaponData.InheritFrom[1]].AIData then
				weaponData.AIData = game.DeepCopyTable(base[weaponData.InheritFrom[1]].AIData) or {}
			else
				weaponData.AIData = {}
			end
		end
	end

	-- Apply replacements/additions
	for weaponName, weaponData in pairs(replacements) do
		if not base[weaponName] then
			base[weaponName] = {}
		end
		mod.ApplyModifications(base[weaponName], weaponData, true)
	end

	-- Apply modifications
	for weaponName, weaponData in pairs(modifications) do
		if not base[weaponName] then
			base[weaponName] = {}
		end
		mod.ApplyModifications(base[weaponName], weaponData)
	end

	for weaponName, weaponData in pairs(base) do
		-- For weapons added through the modifications or replacements (didn't exist in HadesWeaponData), ensure they have an AIData table
		if not weaponData.AIData then
			weaponData.AIData = {}
		end

		if weaponData.OnFireCrowdReaction then
			weaponData.AIData.OnFireCrowdReaction = weaponData.OnFireCrowdReaction
			weaponData.OnFireCrowdReaction = nil
		end

		-- This key was renamed, but if it was true before, it must be false now
		if weaponData.AIData.SkipMovement then
			weaponData.AIData.MoveWithinRange = false
			weaponData.AIData.SkipMovement = nil
		end

		-- If the weapon defines a projectile to use, it might be different from the weapon name, so use it instead
		local sjsonWeaponProjectileName = (mod.HadesSjsonWeaponsTable[weaponName] and
			mod.HadesSjsonWeaponsTable[weaponName].Projectile) or weaponName
		local parentWeaponName = nil
		local grandParentWeaponName = nil
		-- If there is not already a projectile, and if the enemy should have a projectile, and the projectile is not explicitly nil
		if not weaponData.AIData.ProjectileName and not weaponData.AIData.NoProjectile and not game.Contains({ "nil", "null" }, sjsonWeaponProjectileName) then
			-- If the projectile we are looking for exists already, use it directly
			if mod.HadesSjsonProjectilesTable[sjsonWeaponProjectileName] then
				weaponData.AIData.ProjectileName = sjsonWeaponProjectileName
				-- Look for the projectile used by the parent of the weapon instead
			elseif mod.HadesSjsonWeaponsTable[sjsonWeaponProjectileName] then
				-- If a proper parent weapon exists
				if mod.HadesSjsonWeaponsTable[sjsonWeaponProjectileName].InheritFrom and not game.Contains({ "1_BasePlayerSlowWeapon", "1_BaseEnemyMagicWeapon", "1_BaseTrapWeapon" }, mod.HadesSjsonWeaponsTable[sjsonWeaponProjectileName].InheritFrom) then
					parentWeaponName = mod.HadesSjsonWeaponsTable[sjsonWeaponProjectileName].InheritFrom
					-- If the parent weapon has a projectile defined, use it directly
					if mod.HadesSjsonWeaponsTable[parentWeaponName] and mod.HadesSjsonWeaponsTable[parentWeaponName].Projectile then
						if not game.Contains({ "nil", "null" }, mod.HadesSjsonWeaponsTable[parentWeaponName].Projectile) then
							weaponData.AIData.ProjectileName = mod.HadesSjsonWeaponsTable[parentWeaponName].Projectile
						end
					else
						-- The parent weapon did not define a projectile, try to look one level deeper, if this weapon also inherits from another weapon
						if mod.HadesSjsonWeaponsTable[parentWeaponName].InheritFrom and not game.Contains({ "1_BasePlayerSlowWeapon", "1_BaseEnemyMagicWeapon", "1_BaseTrapWeapon" }, mod.HadesSjsonWeaponsTable[parentWeaponName].InheritFrom) then
							grandParentWeaponName = mod.HadesSjsonWeaponsTable[parentWeaponName].InheritFrom
							-- If the grandparent weapon has a projectile defined, use it directly
							if mod.HadesSjsonWeaponsTable[grandParentWeaponName] and mod.HadesSjsonWeaponsTable[grandParentWeaponName].Projectile then
								if not game.Contains({ "nil", "null" }, mod.HadesSjsonWeaponsTable[grandParentWeaponName].Projectile) then
									weaponData.AIData.ProjectileName = mod.HadesSjsonWeaponsTable[grandParentWeaponName].Projectile
								end
							else
								-- The grandparent weapon did not define a projectile, so we use it as the projectile name instead as a fallback
								if not game.Contains({ "nil", "null" }, grandParentWeaponName) then
									weaponData.AIData.ProjectileName = grandParentWeaponName
								end
							end
						else
							-- There is no grandparent weapon, so we use the parent weapon as the projectile name instead as a fallback
							if not game.Contains({ "nil", "null" }, parentWeaponName) then
								weaponData.AIData.ProjectileName = parentWeaponName
							end
						end
					end
				end
			end
		end

		-- Move properties that were in the sjson in Hades to the lua table in Hades II
		if mod.HadesSjsonWeaponsTable[weaponName] and not weaponData.AIData.NoProjectile then
			local sjsonWeaponData = mod.HadesSjsonWeaponsTable[weaponName]
			local alternativeSjsonWeaponData = nil
			local secondAlternativeSjsonWeaponData = nil
			-- If this weapon inherits from another, use it as an alternative base, if the existing sjsonWeaponData does not have the property
			if mod.HadesSjsonWeaponsTable[weaponName].InheritFrom and mod.HadesSjsonWeaponsTable[weaponName].InheritFrom ~= "1_BasePlayerSlowWeapon" then
				local inheritFrom = mod.HadesSjsonWeaponsTable[weaponName].InheritFrom
				if mod.HadesSjsonWeaponsTable[inheritFrom] then
					alternativeSjsonWeaponData = mod.HadesSjsonWeaponsTable[inheritFrom]
					-- If this also inherits, we add a second, final alternative
					if alternativeSjsonWeaponData.InheritFrom and alternativeSjsonWeaponData.InheritFrom ~= "1_BasePlayerSlowWeapon" then
						secondAlternativeSjsonWeaponData = mod.HadesSjsonWeaponsTable[alternativeSjsonWeaponData.InheritFrom]
					end
				end
			end

			-- Move properties from the sjson to the AIData table
			for key, value in pairs(sjsonToAIDataPropertyMappings) do
				-- Check if parent or grandparent have modifications for this property defined already
				local skipProperty = false
				if parentWeaponName and modifications[parentWeaponName] and modifications[parentWeaponName].AIData and modifications[parentWeaponName].AIData[value] then
					skipProperty = true
				elseif grandParentWeaponName and modifications[grandParentWeaponName] and modifications[grandParentWeaponName].AIData and modifications[grandParentWeaponName].AIData[value] then
					skipProperty = true
				end

				if not skipProperty then
					if sjsonWeaponData[key] and not weaponData.AIData[value] then
						weaponData.AIData[value] = sjsonWeaponData[key]
					elseif alternativeSjsonWeaponData and alternativeSjsonWeaponData[key] and not weaponData.AIData[value] then
						weaponData.AIData[value] = alternativeSjsonWeaponData[key]
					elseif secondAlternativeSjsonWeaponData and secondAlternativeSjsonWeaponData[key] and not weaponData.AIData[value] then
						weaponData.AIData[value] = secondAlternativeSjsonWeaponData[key]
					end
				end
			end
		end

		-- Assign FireSounds if none exist
		if not weaponData.Sounds or not weaponData.Sounds.FireSounds then
			weaponData.Sounds = weaponData.Sounds or {}
			weaponData.Sounds.FireSounds = weaponData.Sounds.FireSounds or {}

			if parentWeaponName and base[parentWeaponName] and base[parentWeaponName].Sounds and base[parentWeaponName].Sounds.FireSounds then
				weaponData.Sounds.FireSounds = base[parentWeaponName].Sounds.FireSounds
			elseif grandParentWeaponName and base[grandParentWeaponName] and base[grandParentWeaponName].Sounds and base[grandParentWeaponName].Sounds.FireSounds then
				weaponData.Sounds.FireSounds = base[grandParentWeaponName].Sounds.FireSounds
			end

			-- If still no sounds exist, use the ones from the sjson
			if not weaponData.Sounds or not weaponData.Sounds.FireSounds or #weaponData.Sounds.FireSounds == 0 then
				if mod.HadesSjsonWeaponsTable[weaponName] and mod.HadesSjsonWeaponsTable[weaponName].FireSound then
					if mod.HadesSjsonWeaponsTable[weaponName].FireSound ~= "null" then
						table.insert(weaponData.Sounds.FireSounds, { Name = mod.HadesSjsonWeaponsTable[weaponName].FireSound })
					end
				elseif parentWeaponName and mod.HadesSjsonWeaponsTable[parentWeaponName].FireSound then
					if mod.HadesSjsonWeaponsTable[parentWeaponName].FireSound ~= "null" then
						table.insert(weaponData.Sounds.FireSounds, { Name = mod.HadesSjsonWeaponsTable[parentWeaponName].FireSound })
					end
				elseif grandParentWeaponName and mod.HadesSjsonWeaponsTable[grandParentWeaponName].FireSound then
					if mod.HadesSjsonWeaponsTable[grandParentWeaponName].FireSound ~= "null" then
						table.insert(weaponData.Sounds.FireSounds,
							{ Name = mod.HadesSjsonWeaponsTable[grandParentWeaponName].FireSound })
					end
				end
			end

			if #weaponData.Sounds.FireSounds == 0 then
				weaponData.Sounds = nil
			end
		end
	end

	-- Process data inheritance and add the new data to the game's global
	base = mod.AddTableKeysSkipDupes(game.WeaponData, base, nil)
	for weaponName, weaponData in pairs(base) do
		-- Replace keys that were renamed between the games
		-- Need to replace this property first, as others might change other properties to FireInterval
		if weaponData.AIData and weaponData.AIData.FireInterval then
			weaponData.AIData.DumbFireInterval = weaponData.AIData.FireInterval
			weaponData.AIData.FireInterval = nil
		end
		if weaponData.ShrineAIDataOverwrites and weaponData.ShrineAIDataOverwrites.FireInterval then
			weaponData.ShrineAIDataOverwrites.DumbFireInterval = weaponData.ShrineAIDataOverwrites.FireInterval
			weaponData.ShrineAIDataOverwrites.FireInterval = nil
		end
		mod.RenameKeys(weaponData, weaponKeyReplacements, weaponName)

		-- Update cooldowns on voicelines, as the Hades format no longer works for Hades II for some reason
		local voicelineTables = {
			"PreAttackVoiceLines",
			"PreMoveVoiceLines",
			"WrathVoiceLines",
			"OnDestroyVoiceLines",
			"FiredHeroVoiceLines",
		}
		for _, tableName in ipairs(voicelineTables) do
			if weaponData.AIData and weaponData.AIData[tableName] then
				if weaponData.AIData[tableName].CooldownTime then
					weaponData.AIData[tableName].Cooldowns = weaponData.AIData[tableName].Cooldowns or {}
					table.insert(weaponData.AIData[tableName].Cooldowns, {
						Name = weaponData.AIData[tableName].CooldownName or (weaponName .. "." .. tableName),
						Time = weaponData.AIData[tableName].CooldownTime,
					})
					mod.DebugPrint("Added cooldown for voiceline table " .. tableName .. " on weapon " .. weaponName, 4)
					weaponData.AIData[tableName].CooldownName = nil
					weaponData.AIData[tableName].CooldownTime = nil
				end
				for _, voicelineEntry in ipairs(weaponData.AIData[tableName]) do
					if voicelineEntry.CooldownTime then
						voicelineEntry.Cooldowns = voicelineEntry.Cooldowns or {}
						table.insert(voicelineEntry.Cooldowns, {
							Name = voicelineEntry.CooldownName or (weaponName .. "." .. tableName),
							Time = voicelineEntry.CooldownTime,
						})
						mod.DebugPrint("Added cooldown for voiceline entry in table " .. tableName .. " on weapon " .. weaponName, 4)
						voicelineEntry.CooldownName = nil
						voicelineEntry.CooldownTime = nil
					end
				end
			end
		end

		game.ProcessDataInheritance(weaponData, game.WeaponData)
		base[weaponName] = weaponData
	end
	-- Don't skip duplicates, since we have already added all the data before
	-- AddTableKeysSkipDupes also removed duplicates, so overwriting here will only overwrite keys we added ourselves
	game.OverwriteTableKeys(game.WeaponData, base)
end

-- Some weapons exist in both Hades and Hades II, so we need to rename the Hades weapons
for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	mod.UpdatePropertyName(mod.HadesWeaponData, oldName, newName, {}, "WeaponData")
	-- Inherit properties from this weapon
	mod.UpdateField(mod.HadesWeaponData, oldName, newName, { "InheritFrom" }, "WeaponData")
end

-- Replacements/Additions
local weaponReplacements = {
	-- #region TARTARUS
	-- #region TARTARUS - Alecto
	HarpyLungeAlectoRage = {
		InheritFrom = { "HarpyLungeAlecto" },
		GenusName = "HarpyLungeAlecto",
		AIData = {
			FireDuration = 0.5,
		},
	},
	-- #endregion
	-- #region TARTARUS - Tisiphone
	HarpyLassoLungeEM = {
		InheritFrom = { "HarpyLassoLunge" },
		GenusName = "HarpyLassoLunge",
		GameStateRequirements = {
			{
				FunctionName = "RequiredShrineLevel",
				FunctionArgs =
				{
					ShrineUpgradeName = "BossDifficultyShrineUpgrade",
					Comparison = ">=",
					Value = 1,
				},
			},
		},
		AIData = {
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
			PostAttackDuration = 1.7,
			-- Do the beam attack both before and after the lunge
			PostAttackDumbFireWeapons = { "HarpyLungeSurgeBeam" },
		},
	},
	SummonTisiphoneBombingRun = {
		AIData = {
			AttackSlots = {
				-- Left row
				{ OffsetX = -400, OffsetY = -900, OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = -600, OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = -300, OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = 0,    OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = 300,  OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = 600,  OffsetScaleY = 0.48 },
				{ OffsetX = -400, OffsetY = 900,  OffsetScaleY = 0.48, PauseDuration = 0.2 },
				-- Center row
				{ OffsetX = 0,    OffsetY = -900, OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = -600, OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = -300, OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = 0,    OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = 300,  OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = 600,  OffsetScaleY = 0.48 },
				{ OffsetX = 0,    OffsetY = 900,  OffsetScaleY = 0.48, PauseDuration = 0.2 },
				-- Right row
				{ OffsetX = 400,  OffsetY = -900, OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = -600, OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = -300, OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = 0,    OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = 300,  OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = 600,  OffsetScaleY = 0.48 },
				{ OffsetX = 400,  OffsetY = 900,  OffsetScaleY = 0.48 },
			},
		},
	},
	-- #endregion
	-- #endregion

	-- #region ELYSIUM
	-- #region Minibosses
	FlurrySpawnerWeaponElite = {
		InheritFrom = { "FlurrySpawnerWeapon" },
	},
	-- #endregion
	-- #endregion

	-- #region STYX
	-- From Hades II CrawlerRush_Miniboss, but using Hades animations
	CrawlerRushMiniBoss = {
		AIData = {
			DeepInheritance = true,
			ProjectileName = "CrawlerRushMiniBoss",
			FireSelfVelocity = 3250,
			FireProjectileStartDelay = 0.03,
			LoSBuffer = 25,
			LoSEndBuffer = 32,
			RequireUnitLoS = true,
			AttackDistance = 750,
			WaitForAngleTowardTarget = true,
			WaitForAngleTowardTargetTimeOut = 0.8,
			TrackTargetDuringCharge = true,
			StopBeforeFire = true,
			PreAttackDuration = 0.675,
			PreAttackEndShake = true,
			FireDuration = 0.27,
			PostAttackDuration = 0.4,
			RetreatAfterAttack = true,
			RetreatBufferDistance = 450,
			RetreatTimeout = 1.0,
			PreAttackSound = "/SFX/Enemy Sounds/RatThug/EmoteCharging",
			PreAttackAnimation = "EnemyCrawlerIdle",
			FireAnimation = "EnemyCrawlerRun",
			PostAttackAnimation = "EnemyCrawlerIdle",
		},
	},
	-- #endregion

	-- #region CHARON
	CharonGhostChargeLeft = {
		Sounds = { FireSounds = { { Name = "/VO/Megaera_10026" }, }, },
	},
	CharonGhostChargeTopAndBot = {
		Sounds = { FireSounds = { { Name = "/VO/Megaera_10026" }, }, },
	},
	CharonGhostChargeLeftAndRight = {
		Sounds = { FireSounds = { { Name = "/VO/Megaera_10026" }, }, },
	},
	CharonGhostCharge360 = {
		Sounds = { FireSounds = { { Name = "/VO/Megaera_10026" }, }, },
	},
	CharonWaveStraight = {
		Sounds = {
			FireSounds = {
				{ Name = "/SFX/Enemy Sounds/Charon/CharonGroundBlastFire" },
				{ Name = "/VO/Megaera_10005" },
			},
		},
	},
	-- #endregion
}

-- Modify or add weapons
local weaponModifications = {
	-- #region TARTARUS
	-- #region TARTARUS - Regular
	MineToss = {
		AIData = {
			DeepInheritance = true,
			ApplyEffectsOnWeaponFire = { WeaponEffectData.RootedAttacker, },
			ProjectileName = "BloodMineToss",
		},
		Sounds = { FireSounds = { { Name = "/SFX/Enemy Sounds/EnemyGrenadeMortarLaunch" }, }, },
	},
	HeavyRangedWeapon = {
		AIData = {
			ExpireProjectilesOnHitStun = true,
			ExpireProjectilesOnFreeze = true,
			ExpireProjectilesOnPolymorph = true,
		},
	},
	HadesLightSpawnerSpawnerWeapon = {
		Requirements = {
			MaxActiveSpawns = 5,
			RequiresNotCharmed = true,
		},
		AIData = {
			SpawnBurstDelay = 4.5,
			SpawnsPerBurst = 3,
			SpawnRadius = 0,
			SpawnRate = 1.2,
			SpawnDelay = 0.6,
			SpawnedAggroTetherDistance = 750,
			SpawnAggroed = false,
			SpawnerOptions = { "HadesSwarmer" },
			NoProjectile = true,
			SpawnBurstOnFire = true,
			MaxActiveSpawns = 5,
			SpawnsSkipActivatePresentation = true,
		},
	},
	SwarmerMelee = {
		AIData = {
			DeepInheritance = true,
			PreAttackEndShake = true,
			FireProjectileStartDelay = 0.03,
			-- Modified, as the original 1800 is too short
			FireSelfVelocity = 3000,
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackHighGrip, },
			PreAttackDuration = 0.5,
			FireDuration = 0.25,
			PostAttackDuration = 0.5,
			PreAttackAnimation = "EnemyWretchSwarmerAttackCharge",
			FireAnimation = "EnemyWretchSwarmerAttackFire",
			PostAttackAnimation = "EnemyWretchSwarmerPostAttack",
			AttackDistance = 350,
			RetreatBufferDistance = 550,
			RetreatAfterAttack = true,
			RequireUnitLoS = true,
			LoSBuffer = 80,
			LoSEndBuffer = 32,
		},
	},
	DisembodiedHandGrab = {
		AIData = {
			-- Allow all Wringers to move at the same time, as sometimes there's only a few of these in the room and the fight feels boring
			OnlyClosestOfTypesMove = mod.NilValue,
			NotClosestSleepTime = mod.NilValue,
		},
	},
	-- #endregion
	-- #region TARTARUS - Minibosses
	-- #region TARTARUS - Minibosses - HeavyRangedSplitter
	HeavyRangedWeaponSplitter = {
		InheritFrom = { "HeavyRangedWeapon", },
		AIData = {
			DeepInheritance = true,
			ProjectileAngleEvenlySpaced = true,
		},
	},
	HeavyRangedSplitterFragment = {
		AIData = {
			DeepInheritance = true,
			TargetClosestOfTypes = { "HeavyRangedSplitterMiniboss", "HeavyRangedSplitterMinibossSuperElite" },
			TargetClosest = mod.NilValue,
			TargetFriends = mod.NilValue,
			ExpireProjectilesOnHitStun = true,
			ExpireProjectilesOnFreeze = true,
			ExpireProjectilesOnPolymorph = true,
		},
	},
	-- #endregion
	-- #region TARTARUS - Minibosses - WretchAssassin
	WretchAssassinStab = {
		AIData = {
			-- Fixed to use the Hades II teleportation
			PreAttackTeleport = true,
			TeleportToTarget = true,
			TeleportBehindTarget = true,
			PostTeleportAngleTowardTarget = true,
			PreAttackFunctionName = mod.NilValue,
			PreMoveFunctionName = _PLUGIN.guid .. "." .. "EnemyInvisibility",
		},
	},
	WretchAssassinRanged = {
		AIData = {
			-- Fixed to use the Hades II teleportation
			PreAttackTeleport = true,
			PostTeleportAngleTowardTarget = true,
			PreAttackFunctionName = mod.NilValue,
			PreMoveFunctionName = _PLUGIN.guid .. "." .. "EnemyInvisibility",
		},
	},
	-- #endregion
	-- #endregion
	-- #region TARTARUS - Megaera
	HarpyLunge = {
		AIData = {
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
		},
	},
	HarpyLightning = {
		AIData = {
			AttackSlotInterval = 0.01,
			FireAnimation = "FuryLightningLoop",
			PostAttackAnimation = "FuryLightningReturnToIdle",
		},
	},
	HarpySpawns = {
		AIData = {
			FireFunctionName = _PLUGIN.guid .. "." .. "HandleBossSpawns",
			FireAnimation = "FuryLightningLoop",
			PostAttackAnimation = "FuryLightningReturnToIdle",
		},
	},
	-- #endregion
	-- #region TARTARUS - Alecto
	HarpyLungeAlecto = {
		AIData = {
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
			PreAttackStop = true,
			-- So the Rage version works correctly
			DeepInheritance = true,
			EnragedWeaponSwap = "HarpyLungeAlectoRage",
			ForceFirst = true,
		},
	},
	HarpyWhipArc = {
		AIData = {
			PreAttackStop = true,
		},
	},
	HarpyBuildRage = {
		BlockInterrupt = true,
		AIData = {
			FireFunctionName = _PLUGIN.guid .. "." .. "HarpyBuildRage",
			FireStartFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesHarpyBuildRageStart",
			PreAttackStop = true,
			PreAttackDuration = 1.5,
			FireMoveTowardTarget = true,
			StopMoveWithinRange = true,
			MoveSuccessDistance = 25,
			PreAttackVoiceLines = mod.NilValue,
			BlockAsFirstWeapon = true,
		},
	},
	HarpyLightningChase = {
		AIData = {
			PreAttackStop = true,
			PreAttackDuration = 0.0,
			FireMoveTowardTarget = true,
			StopMoveWithinRange = true,
			MoveSuccessDistance = 25,
			AttackSlotInterval = 0.01,
			RemoveFromGroups = { "GroundEnemies" },
		},
	},
	HarpyLightningChaseRage = {
		AIData = {
			PreAttackStop = true,
			PreAttackDuration = 0.0,
			FireMoveTowardTarget = true,
			AttackSlotInterval = 0.01,
			RemoveFromGroups = { "GroundEnemies" },
		},
	},
	HarpyLightningCone = {
		AIData = {
			FireAnimation = "Fury2LightningLoop",
			PostAttackAnimation = "Fury2LightningReturnToIdle",
		},
	},
	HarpyLightningConeRage = {
		AIData = {
			FireAnimation = "Fury2LightningLoop",
			PostAttackAnimation = "Fury2LightningReturnToIdle",
		},
	},
	HarpyBuildRageBlast = {
		AIData = {
			PreAttackStop = true,
			EndOnFlagName = "HarpyBuildRageEarlyExit",
			-- Increasing to match new animation lengths
			FireTicks = 9,
			ProjectileAngleEvenlySpaced = true,
		},
	},
	HarpyWhipShot = {
		AIData = {
			PreAttackStop = true,
		},
	},
	HarpyWhipShotRage = {
		AIData = {
			PreAttackStop = true,
		},
	},
	-- #endregion
	-- #region TARTARUS - Tisiphone
	HarpyLightningLine = {
		AIData = {
			AttackSlotInterval = 0.01,
			PreAttackAngleTowardTarget = true,
			WaitForAngleTowardTarget = true,
			AttackSlots = {
				{ OffsetDistance = 300,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue },
				{ OffsetDistance = 600,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue },
				{ OffsetDistance = 900,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue },
				{ OffsetDistance = 1200, OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue },
				{ OffsetDistance = 1500, OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue },
			},
			BlockAsFirstWeapon = true,
			FireAnimation = "Fury3LightningLoop",
			PostAttackAnimation = "Fury3LightningReturnToIdle",
		},
	},
	HarpyWhipLasso = {
		AIData = {
			ChainedWeaponOptions = { "HarpyLassoLunge", "HarpyLassoLungeEM" },
			ChainedWeapon = mod.NilValue,
			ForceFirst = true,
		},
	},
	-- Chained from HarpyWhipLasso
	HarpyLassoLunge = {
		-- In the EM version, we use an alternative with an extra DumbFireAttack after the lunge
		GameStateRequirements = {
			{
				FunctionName = "RequiredShrineLevel",
				FunctionArgs = {
					ShrineUpgradeName = "BossDifficultyShrineUpgrade",
					Comparison = "==",
					Value = 0,
				},
			},
		},
		AIData = {
			DeepInheritance = true,
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
		},
	},
	HarpyLungeSurgeBeam = {
		AIData = {
			-- Alternative attack pattern (circular beams) instead of the original, as I could not get the tracking working on it
			AttackSlots = {
				{ AIDataOverrides = { FireProjectileAngleRelative = 9 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -9 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = 27 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -27 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = 45 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -45 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = 63 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -63 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = 81 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -81 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = 99 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -99 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = 117 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -117 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = 135 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -135 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = 153 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -153 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = 171 } },
				{ AIDataOverrides = { FireProjectileAngleRelative = -171 } },
			},
			FireTicks = 1,
			NumProjectiles = 1,
		},
	},
	HarpySlowBeam360 = {
		AIData = {
			ProjectileAngleEvenlySpaced = true,
			BlockAsFirstWeapon = true,
		},
		Sounds = {
			-- Otherwise the sound is terribly loud and overlayed
			FireSounds = {
				{ Name = "/SFX/Enemy Sounds/Tisiphone/TisiphoneHarpySlowBeam", Cooldown = 0.15 },
			},
		},
	},
	HarpyLightningCardinal = {
		AIData = {
			AttackSlotInterval = 0.01,
			AttackSlots = {
				{ OffsetDistance = 300,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue },
				{ OffsetDistance = 600,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue },
				{ OffsetDistance = 900,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue },
				{ OffsetDistance = 1200, OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue },
				{ OffsetDistance = 300,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue, OffsetAngle = 90 },
				{ OffsetDistance = 600,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue, OffsetAngle = 90 },
				{ OffsetDistance = 900,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue, OffsetAngle = 90 },
				{ OffsetDistance = 300,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue, OffsetAngle = 270 },
				{ OffsetDistance = 600,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue, OffsetAngle = 270 },
				{ OffsetDistance = 900,  OffsetScaleY = 0.6, OffsetFromAttacker = true, UseAttackerAngle = true, UseAngleBetween = mod.NilValue, OffsetAngle = 270 },
			},
			FireAnimation = "Fury3LightningLoop",
			PostAttackAnimation = "Fury3LightningReturnToIdle",
		},
	},
	HarpyWhipCombo1 = {
		AIData = {
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
			BlockAsFirstWeapon = true,
		},
	},
	HarpyWhipCombo2 = {
		AIData = {
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
		},
	},
	HarpyWhipCombo3 = {
		AIData = {
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
		},
	},
	SummonTisiphoneBombingRun = {
		AIData = {
			AttackSlotInterval = 0.01,
		},
	},
	-- #endregion
	-- #endregion

	-- #region ASPHODEL
	-- #region ASPHODEL - Regular
	HadesLightSpawnerEliteSpawnerWeapon = {
		AIData = {
			SpawnBurstDelay = 4.5,
			SpawnsPerBurst = 3,
			SpawnRadius = 0,
			SpawnRate = 1.2,
			SpawnDelay = 0.6,
			SpawnedAggroTetherDistance = 1200,
			SpawnAggroed = false,
			SpawnerOptions = { "SwarmerElite" },
			NoProjectile = true,
			SpawnBurstOnFire = true,
			SpawnsSkipActivatePresentation = true,
			MaxActiveSpawns = 6,
			RequiresNotCharmed = true,
		},
	},
	-- #endregion
	-- #region ASPHODEL - Minibosses
	-- #region ASPHODEL - Minibosses - SpreadShot
	SpreadShotMinibossRadial = {
		-- Fixing the animations and increasing the cooldown to scale with difficulty of not being able to destroy projectiles
		-- Decreasing cooldown again if the shrine upgrade is active, to increase difficulty
		AIData = {
			PreAttackAnimation = "Enemy_LightRanged_CastPreAttack",
			PreAttackWaitForAnimation = true,
			PostAttackCooldown = mod.NilValue,
			PostAttackCooldownMin = 2.0,
			PostAttackCooldownMax = 3.0,
		},
		ShrineMetaUpgradeName = "MinibossCountShrineUpgrade",
		ShrineMetaUpgradeRequiredLevel = 1,
		ShrineAIDataOverwrites = {
			PostAttackCooldownMin = 1.5,
			PostAttackCooldownMax = 1.5,
		},
	},
	SpreadShotMinibossCone = {
		AIData = {
			PreAttackAnimation = "Enemy_LightRanged_CastPreAttack",
			PreAttackWaitForAnimation = true,
			PostAttackCooldown = mod.NilValue,
			PostAttackCooldownMin = 2.0,
			PostAttackCooldownMax = 3.0,
		},
		ShrineMetaUpgradeName = "MinibossCountShrineUpgrade",
		ShrineMetaUpgradeRequiredLevel = 1,
		ShrineAIDataOverwrites = {
			PostAttackCooldownMin = 1.5,
			PostAttackCooldownMax = 1.5,
		},
	},
	SpreadShotMinibossCross = {
		AIData = {
			PreAttackAnimation = "Enemy_LightRanged_CastPreAttack",
			PreAttackWaitForAnimation = true,
			PostAttackCooldown = mod.NilValue,
			PostAttackCooldownMin = 2.0,
			PostAttackCooldownMax = 3.0,
		},
		ShrineMetaUpgradeName = "MinibossCountShrineUpgrade",
		ShrineMetaUpgradeRequiredLevel = 1,
		ShrineAIDataOverwrites = {
			PostAttackCooldownMin = 1.5,
			PostAttackCooldownMax = 1.5,
		},
	},
	-- #endregion
	-- #endregion
	-- #region ASPHODEL - Hydra (Basic)
	HydraLunge = {
		AIData = {
			PreAttackDuration = 0.8,
			MoveWithinRangeTimeout = 0.5,
			MaxConsecutiveUses = 3,
		},
	},
	HydraLungeUntethered = {
		AIData = {
			PreAttackDuration = 0.8,
			MaxConsecutiveUses = 3,
		},
	},
	HydraSlam = {
		AIData = {
			PostAttackDuration = 0.5,
			MoveWithinRange = false,
		},
	},
	HydraSlamFrenzy = {
		AIData = {
			PostAttackDuration = 0.5,
		},
	},
	HydraSlamUntethered = {
		AIData = {
			PostAttackDuration = 0.5,
		},
	},
	HydraDart = {
		AIData = {
			AIMoveWithinRangeTimeout = 1.0,
			PostAttackDuration = 0.5,
		},
	},
	HydraDartVolley = {
		AIData = {
			FireProjectileTowardTarget = true,
			AttackSlots = {
				-- InstantAngleTowardsTarget was removed
				{ UseAttackerAngle = true, OffsetAngle = 0,   OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = 15,  OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = -15, OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = 30,  OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = -30, OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = 45,  OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = -45, OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = 60,  OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = -60, OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = 75,  OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = -75, OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = 90,  OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
				{ UseAttackerAngle = true, OffsetAngle = -90, OffsetDistance = 1500, OffsetScaleY = 0.55, InstantAngleTowardsTarget = true, UseTargetPosition = true, UseAngleBetween = mod.NilValue, },
			},
		},
	},
	-- #endregion
	-- #region ASPHODEL - Hydra (Orange/Lava)
	HydraLavaSpitExterior = {
		AIData = {
			-- Not the same as InstantAngleTowardsTarget (Hydra head will not move), but will make sure it's fired at the target instead of straight line ahead
			FireProjectileTowardTarget = true,
		},
	},
	HydraLavaSpitInterior = {
		AIData = {
			FireProjectileTowardTarget = true,
		},
	},
	-- #endregion
	-- #region ASPHODEL - Hydra (Green/Summoner)
	HydraSpawns = {
		AIData = {
			FireFunctionName = _PLUGIN.guid .. "." .. "HandleBossSpawns",
		},
	},
	HydraSummon = {
		AIData = {
			PreAttackDuration = 0.2,
		},
	},
	HydraSummon2 = {
		AIData = {
			PreAttackDuration = 0.2,
		},
	},
	HydraSummonSpread = {
		AIData = {
			PreAttackDuration = 0.2,
			FireProjectileTowardTarget = true,
		},
	},
	HydraCrusher = {
		AIData = {
			ProjectileName = "ModsNikkelMHadesBiomesHydraCrusher",
			PreAttackDuration = 0.7,
			CreateOwnTargetFromOriginalTarget = true,
			FireProjectileTowardTarget = true,
			TrackTargetDuringCharge = true,
		},
	},
	HydraCrusher2 = {
		AIData = {
			ProjectileName = "ModsNikkelMHadesBiomesHydraCrusher",
			ResetTargetPerTick = true,
			PreAttackDuration = 0.7,
			FireCooldown = 0.7,
			CreateOwnTargetFromOriginalTarget = false,
			FireProjectileTowardTarget = true,
			TrackTargetDuringFire = true,
			TrackTargetDuringCharge = true,
		},
	},
	HydraCrusher3 = {
		AIData = {
			ProjectileName = "ModsNikkelMHadesBiomesHydraCrusher",
			ResetTargetPerTick = true,
			PreAttackDuration = 0.7,
			FireCooldown = 0.7,
			CreateOwnTargetFromOriginalTarget = false,
			TrackTargetDuringFire = true,
			FireProjectileTowardTarget = true,
			TrackTargetDuringCharge = true,
		},
	},
	-- #endregion
	-- #region ASPHODEL - Hydra (Purple/Wavemaker)
	HydraRoar = {
		AIData = {
			PreAttackDuration = 0.5,
			PostAttackDuration = 1.2,
		},
	},
	HydraRoarVolleyLeft = {
		AIData = {
			PreAttackDuration = 0.5,
			PostAttackDuration = 1.2,
			FireProjectileTowardTarget = true,
		},
	},
	HydraRoarVolleyRight = {
		AIData = {
			PreAttackDuration = 0.5,
			PostAttackDuration = 1.2,
			FireProjectileTowardTarget = true,
		},
	},
	HydraRoarVolleyInsideOut = {
		AIData = {
			PreAttackDuration = 0.5,
			PostAttackDuration = 1.2,
			FireProjectileTowardTarget = true,
		},
	},
	-- #endregion
	-- #endregion

	-- #region ELYSIUM
	-- #region ELYSIUM - Regular
	ShadeSideDash = {
		AIData = {
			-- Causes an infinite loop, as this would be set to itself
			AttackFailWeapon = mod.NilValue,
		},
	},
	ShadeBowSideDash = {
		AIData = {
			-- Causes an infinite loop, as this would be set to itself
			AttackFailWeapon = mod.NilValue,
		},
	},
	ShadeSpearLeap = {
		AIData = {
			DeepInheritance = true,
			PreAttackAnimation = mod.NilValue,
			FireAnimation = mod.NilValue,
			LeapToTarget = true,
			PreMoveLeap = true,
			LeapAgainIfBlocked = true,
			RequireLeapTargetLoS = true,
			LeapChargeAnimation = "ShadeSpear_LeapPreAttack",
			FireProjectileStartDelay = 0.05,
			MoveWithinRange = false,
			PreAttackDuration = 0.0,
			PreFireDuration = 0.0,
			FireDuration = 0,
			PostAttackDuration = 0.35,
			TrackTargetDuringCharge = true,
			StopBeforeFire = true,
			PostAttackStop = true,
			MinAttacksBetweenUse = 2,
			MaxPlayerDistance = 800,
		},
	},
	ShadeSpearLeapSuper = {
		AIData = {
			DeepInheritance = true,
			PreAttackAnimation = mod.NilValue,
			FireAnimation = mod.NilValue,
			LeapToTarget = true,
			PreMoveLeap = true,
			LeapAgainIfBlocked = true,
			RequireLeapTargetLoS = true,
			LeapChargeAnimation = "ShadeSpear_LeapPreAttack",
			FireProjectileStartDelay = 0.05,
			MoveWithinRange = false,
			PreAttackDuration = 0.0,
			PreFireDuration = 0.0,
			FireDuration = 0,
			TrackTargetDuringCharge = true,
			StopBeforeFire = true,
			PostAttackStop = true,
		},
	},
	ShieldAlliesAoE = {
		AIData = {
			-- Don't remove this - doesn't work without, even though it's the same name
			ProjectileName = "ShieldAlliesAoE",
		},
	},
	ShieldAlliesAoELarge = {
		AIData = {
			-- Don't remove this - doesn't work without, even though it's the same name
			ProjectileName = "ShieldAlliesAoELarge",
		},
	},
	-- #endregion
	-- #region ELYSIUM - Minotaur
	Minotaur5AxeCombo3 = {
		AIData = {
			PostAttackAnimation = "MinotaurAttackSwings_AttackLeap",
			-- Increased velocity to allow him to go further, but not too high
			FireSelfVelocity = 2500,
			FireSelfUpwardVelocity = 2000,
			-- Don't track during fire, but allow tracking during charge
			StopBeforeFire = true,
			-- If not set, Minotaur stays in one spot each leap
			TrackTargetDuringCharge = true,
			-- Can jump from anywhere
			MoveWithinRange = false,
			PreFireDuration = 0.0,
			-- Slightly adjusted so he doesn't hover at the end before the touchdown
			FireDuration = 0.28,
		},
	},
	MinotaurArmored5AxeCombo3 = {
		AIData = {
			PostAttackAnimation = "MinotaurArmoredAttackSwings_AttackLeap",
		},
	},
	Minotaur5AxeCombo5 = {
		AIData = {
			PostAttackDuration = 1.8,
		},
	},
	MinotaurLeapCombo3 = {
		AIData = {
			-- Should be the same as Minotaur5AxeCombo3
			FireSelfVelocity = 2500,
			FireSelfUpwardVelocity = 2000,
			FireDuration = 0.28,
		},
	},
	MinotaurLeapCombo4 = {
		AIData = {
			-- Should be the same as Minotaur5AxeCombo3
			FireSelfVelocity = 2500,
			FireSelfUpwardVelocity = 2000,
			FireDuration = 0.28,
		},
	},
	MinotaurLeapCombo5 = {
		AIData = {
			-- Should be the same as Minotaur5AxeCombo3
			PostAttackAnimation = "MinotaurAttackSwings_AttackLeap",
			FireSelfVelocity = 2500,
			FireSelfUpwardVelocity = 2000,
			StopBeforeFire = true,
			TrackTargetDuringCharge = true,
			MoveWithinRange = false,
			PreFireDuration = 0.0,
			FireDuration = 0.28,
		},
	},
	MinotaurArmoredLeapCombo5 = {
		AIData = {
			PostAttackAnimation = "MinotaurArmoredAttackSwings_AttackLeap",
		},
	},
	MinotaurAxeOverhead = {
		AIData = {
			-- Should be the same as Minotaur5AxeCombo3
			PostAttackAnimation = "MinotaurAttackSwings_AttackLeap",
			FireSelfVelocity = 2500,
			FireSelfUpwardVelocity = 2000,
			StopBeforeFire = true,
			TrackTargetDuringCharge = true,
			MoveWithinRange = false,
			PreFireDuration = 0.0,
			FireDuration = 0.28,
		},
	},
	MinotaurArmoredAxeOverhead = {
		AIData = {
			PostAttackAnimation = "MinotaurArmoredAttackSwings_AttackLeap",
		},
	},
	MinotaurCrescentCombo3 = {
		AIData = {
			PreAttackDuration = 0.0,
		},
	},
	MinotaurBullRush = {
		AIData = {
			ProjectileName = "MinotaurBullRushRam",
			WaitUntilProjectileDeath = "MinotaurBullRushRam",
			PreAttackSetUnitProperties = {
				Speed = 1200,
				CanOnlyMoveForward = "true",
			},
			-- Setting explicitly to not break when inferring the reset values as CanOnlyMoveForward will be a boolean instead of string
			PostAttackSetUnitProperties = {
				Speed = 475,
				CanOnlyMoveForward = "false",
			},
			TrackTargetDuringCharge = true,
			FireMoveTowardTarget = true,
			FireRotationDampening = 0.6,
			MoveWithinRange = true,
			-- A lower value causes consistent crashes
			MoveSuccessDistance = 35,
			PostAttackStop = true,
			PostAttackDuration = 1.2,
			PostAttackFx = "MinotaurBullRushHornStrike",
			PostAttackAnimation = "MinotaurBullRush_PreStrike",

			PostAttackAI = mod.NilValue,
			PostAttackAICanOnlyMoveForward = mod.NilValue,
			EffectExpiredName = mod.NilValue,
		}
	},
	MinotaurTheseusSlam_Minotaur = {
		AIData = {
			ProjectileName = "MinotaurBullRushRam",
			WaitUntilProjectileDeath = "MinotaurBullRushRam",
			PreAttackSetUnitProperties = {
				Speed = 1000,
				CanOnlyMoveForward = "true",
			},
			-- Setting explicitly to not break when inferring the reset values as CanOnlyMoveForward will be a boolean instead of string
			PostAttackSetUnitProperties = {
				Speed = 475,
				CanOnlyMoveForward = "false",
			},
			TrackTargetDuringCharge = true,
			FireMoveTowardTarget = true,
			FireRotationDampening = 0.8,
			MoveWithinRange = true,
			-- A lower value causes consistent crashes
			MoveSuccessDistance = 35,
			PostAttackStop = true,
			PostAttackDuration = 1.2,
			PostAttackFx = "MinotaurBullRushHornStrike",
			PostAttackAnimation = "MinotaurBullRush_PreStrike",

			PostAttackAI = mod.NilValue,
			PostAttackAICanOnlyMoveForward = mod.NilValue,
			EffectExpiredName = mod.NilValue,

			RequireComboPartnerNotifyName = "MinotaurTheseusSlam_Minotaur",
			ForceIfComboPartnerNotifyName = "MinotaurTheseusSlam_Minotaur",

			PostAttackThreadedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesStopTheseusSlamWait",
		},
	},
	MinotaurTheseusThrow_Minotaur = {
		GameStateRequirements = {
			RequiredAnyTextLines = { "TheseusAboutFraternalBonds06_A", "TheseusAboutFraternalBonds06_B" },
		},
		AIData = {
			PartnerForceWeaponInterrupt = "MinotaurTheseusThrow_Theseus",
			WaitForComboPartnerMoveAnimation = "Minotaur_Crouch",
			MaxDistanceFromComboPartner = 500,
		},
	},
	MinotaurTheseusSlamNova = {
		AIData = {
			CancelOutsideDistanceFromComboPartner = 300,
		},
	},
	MinotaurArmoredBullRush = {
		AIData = {
			ProjectileName = "MinotaurArmoredBullRushRam",
			WaitUntilProjectileDeath = "MinotaurArmoredBullRushRam",
			PreAttackSetUnitProperties = {
				Speed = 1300,
				CanOnlyMoveForward = "true",
			},
			PostAttackAnimation = "MinotaurArmoredBullRush_PreStrike",
			FireRotationDampening = 0.7,
			EffectExpiredName = mod.NilValue,
		},
	},
	MinotaurBullRush2 = {
		AIData = {
			ProjectileName = "MinotaurBullRushRam",
			WaitUntilProjectileDeath = "MinotaurBullRushRam",
			PreAttackSetUnitProperties = {
				Speed = 1200,
				CanOnlyMoveForward = "true",
			},
			PostAttackSetUnitProperties = {
				Speed = 475,
				CanOnlyMoveForward = "false",
			},
			TrackTargetDuringCharge = true,
			FireMoveTowardTarget = true,
			FireRotationDampening = 0.7,
			MoveWithinRange = true,
			MoveSuccessDistance = 35,
			PostAttackStop = true,
			-- To immediately start the CrescentStrike follow-up
			PostAttackDuration = 0.0,
			PostAttackFx = "MinotaurBullRushHornStrike",
			PostAttackAnimation = "MinotaurBullRush_PreStrike",

			PostAttackAI = mod.NilValue,
			PostAttackAICanOnlyMoveForward = mod.NilValue,
			EffectExpiredName = mod.NilValue,
		}
	},
	MinotaurArmoredBullRush2 = {
		AIData = {
			ProjectileName = "MinotaurArmoredBullRushRam",
			WaitUntilProjectileDeath = "MinotaurArmoredBullRushRam",
			PreAttackSetUnitProperties = {
				Speed = 1300,
				CanOnlyMoveForward = "true",
			},
			PostAttackAnimation = "MinotaurArmoredBullRush_PreStrike",
			FireRotationDampening = 0.7,
			EffectExpiredName = mod.NilValue,
		},
	},
	MinotaurArmoredAxeSpin = {
		AIData = {
			FireSelfVelocity = 600,
		},
	},
	-- #endregion
	-- #region ELYSIUM - Theseus
	TheseusSpearThrowReturn = {
		AIData = {
			FireProjectileTowardTarget = true,
			-- Modded properties, to make sure the spear is fired from the obstacle and towards Theseus
			ModsNikkelMHadesBiomesFireAtSelf = true,
			ModsNikkelMHadesBiomesFireFromObstacle = "TheseusSpearReturnPoint",
			ModsNikkelMHadesBiomesDestroyObstacleOnFire = "TheseusSpearReturnPoint",
		},
	},
	TheseusSpearSpin = {
		AIData = {
			FireSelfVelocity = 2000,
			-- So there are some opportunities to attack him without him blocking everything
			PostAttackStop = true,
			-- Also for this, removing the cooldown to not make it too easy
			PostAttackCooldownMin = 0.75,
			PostAttackCooldownMax = 1.25,
		},
	},
	-- Has it's properties in the root instead of in AIData
	TheseusZeusUpgradePassive = {
		AIData = {
			FireTicks = 7,
			FireCooldown = 0.15,
			FireInterval = 5.0,
		},
		FireTicks = mod.NilValue,
		FireCooldown = mod.NilValue,
		FireInterval = mod.NilValue,
	},
	-- Combo attacks require TheseusAboutFraternalBonds06_A/B to have run, which requires PersephoneFirstMeeting at the root
	MinotaurTheseusSlam_Theseus = {
		AIData = {
			PartnerForceWeaponInterrupt = "MinotaurTheseusSlam_Minotaur",
			WaitDurationForComboPartnerMove = mod.NilValue,
			PreAttackAnimation = mod.NilValue,
			PreAttackDuration = 0,
			-- Will be set to 0 as soon as the Minotaur has ended the rush attack
			FireDuration = 9,
		},
	},
	MinotaurTheseusThrow_Theseus = {
		GameStateRequirements = {
			RequiredAnyTextLines = { "TheseusAboutFraternalBonds06_A", "TheseusAboutFraternalBonds06_B" },
		},
		AIData = {
			RequireComboPartnerNotifyName = "MinotaurTheseusThrow_Theseus",
			ForceIfComboPartnerNotifyName = "MinotaurTheseusThrow_Theseus",
			MoveSuccessDistance = 32,
			MoveWithinRange = true,
		},
	},
	TheseusChariotWait = {
		AIData = {
			BlockAsFirstWeapon = true,
		},
	},
	TheseusChariotExteriorPatrol = {
		AIData = {
			ApplyEffectsOnMove = {
				{
					EffectName = "SpeedIncrease",
					DataProperties = {
						Type = "Speed",
						Duration = 9999,
						Modifier = 1.6,
					},
				},
			},
		},
	},
	TheseusChariotCenterDive = {
		AIData = {
			ProjectileName = "TheseusChariotTurrets",
			ApplyEffectsOnMove = {
				{
					EffectName = "SpeedIncrease",
					DataProperties = {
						Type = "Speed",
						Duration = 9999,
						Modifier = 1.6,
					},
				},
			},
			Spread = 40,
		},
	},
	TheseusChariotCenterDive2 = {
		AIData = {
			ProjectileName = "TheseusChariotTurrets",
			ApplyEffectsOnMove = {
				{
					EffectName = "SpeedIncrease",
					DataProperties = {
						Type = "Speed",
						Duration = 9999,
						Modifier = 1.6,
					},
				},
			},
			Spread = 40,
		},
	},
	-- #endregion
	-- #endregion

	-- #region STYX
	-- #region STYX - Regular
	-- From Hades II CrawlerRush, but using Hades animations
	HadesCrawlerRush = {
		AIData = {
			DeepInheritance = true,
			ProjectileName = "HadesCrawlerRush",
			FireSelfVelocity = 2600,
			FireProjectileStartDelay = 0.03,
			PreAttackSound = "/SFX/Enemy Sounds/RatThug/EmoteCharging",
			PreAttackAnimation = "EnemyCrawlerIdle",
			FireAnimation = "EnemyCrawlerRun",
			PostAttackAnimation = "EnemyCrawlerIdle",
			PreAttackDuration = 0.7,
			PreAttackEndShake = true,
			FireDuration = 0.3,
			PostAttackDuration = 0.0,
			WaitForAngleTowardTarget = false,
			AttackDistance = 300,
			RetreatBufferDistance = 650,
			RetreatAfterAttack = true,
			RequireUnitLoS = true,
			LoSBuffer = 80,
			LoSEndBuffer = 32,
		},
		Sounds = { FireSounds = { { Name = "/SFX/Enemy Sounds/RatThug/EmoteAttacking" }, }, },
	},
	HeavyRangedWeaponFork = {
		AIData = {
			ProjectileAngleInterval = 45,
			ProjectileInterval = 0.05,
		},
	},
	HeavyRangedWeaponForkElite = {
		AIData = {
			ProjectileAngleInterval = 45,
			ProjectileInterval = 0.05,
		},
	},
	GrenadierWeapon = {
		AIData = {
			DeepInheritance = true,
			ApplyEffectsOnWeaponFire = { WeaponEffectData.RootedAttacker, },
			ProjectileName = "GrenadierWeapon",
			-- Custom addition to make the spread a little more random
			Spread = 50,
		},
		Sounds = { FireSounds = { { Name = "/SFX/Enemy Sounds/EnemyGrenadeMortarLaunch" }, }, },
	},
	-- #endregion
	-- #region STYX - Minibosses
	CrawlerSpawns = {
		AIData = {
			ThreadFunctionName = _PLUGIN.guid .. "." .. "HandleBossSpawns",
		},
	},
	CrawlerReburrowShockwave = {
		AIData = {
			ProjectileName = "CrawlerReburrowShockwave",
		},
	},
	RatThugMeleeMiniboss = {
		AIData = {
			AIAttackDistance = 500,
			AIBufferDistance = 50,
		},
	},
	GrenadierWeaponMiniboss = {
		AIData = {
			DeepInheritance = true,
			ApplyEffectsOnWeaponFire = { WeaponEffectData.RootedAttacker, },
			ProjectileName = "GrenadierWeapon",
			Spread = 40,
		},
		Sounds = { FireSounds = { { Name = "/SFX/Enemy Sounds/EnemyGrenadeMortarLaunch" }, }, },
	},
	-- #endregion
	-- #region HADES
	HadesBidentStrike = {
		AIData = {
			MoveWithinRange = true,
			PreAttackStop = true,
			PreAttackEndStop = true,
			PostAttackStop = true,
			PostAttackDuration = 0.5,
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.ModsNikkelMHadesBiomesAttackSuperLowGrip, },
		},
	},
	HadesCast = {
		StoreAmmoOnHit = mod.NilValue,
		AmmoDropDelay = mod.NilValue,
		StoredAmmoIcon = mod.NilValue,
		AmmoDropFireWeapon = mod.NilValue,
		SkipAmmoDropOnMiss = mod.NilValue,
		StoreAmmoInLastHit = mod.NilValue,
		FireAmmoDropWeaponOnDeflect = mod.NilValue,
	},
	HadesBidentStrikeCombo1 = {
		AIData = {
			ProjectileName = "HadesCast",
			PreAttackAngleTowardTarget = true,
			WaitForAngleTowardTarget = true,
		},
	},
	HadesBidentStrikeCombo2 = {
		AIData = {
			ProjectileName = "HadesCast",
			PreAttackDuration = 0.2,
			PreAttackAngleTowardTarget = true,
			WaitForAngleTowardTarget = true,
		},
	},
	HadesBidentStrikeCombo3 = {
		AIData = {
			ProjectileName = "HadesBidentStrike",
			MoveWithinRange = true,
			PreAttackStop = true,
			PreAttackEndStop = true,
			PostAttackStop = true,
			TargetPlayer = true,
			PreAttackAngleTowardTarget = true,
			WaitForAngleTowardTarget = true,
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.ModsNikkelMHadesBiomesAttackSuperLowGrip, },
		},
	},
	HadesBidentSpin = {
		AIData = {
			MoveWithinRange = true,
			PreAttackStop = true,
			PreAttackEndStop = true,
			PostAttackStop = true,
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.ModsNikkelMHadesBiomesAttackSuperLowGrip, },
		},
	},
	HadesBidentSpin2Reverse = {
		AIData = {
			FireSelfVelocity = 2300,
		},
	},
	HadesSpawns = {
		AIData = {
			ThreadFunctionName = _PLUGIN.guid .. "." .. "HandleBossSpawns",
			PreAttackEndFunctionName = _PLUGIN.guid .. "." .. "HadesSpawnsPresentation",
			PreAttackDuration = 1,
		},
	},
	HadesSpawns2 = {
		AIData = {
			-- ShieldRangedSuperElite since it's tethers wouldn't go invisible
			SpawnSkipOverridesForTypes = { "WretchAssassinMinibossSuperElite", "ShieldRangedSuperElite" },
			SpawnDefaultAIDataOverrides = {
				PreAttackEndFunctionName = _PLUGIN.guid .. "." .. "EnemyHandleInvisibleAttack",
				PreMoveFunctionName = _PLUGIN.guid .. "." .. "EnemyInvisibility",
				PostInvisibilityFunction = _PLUGIN.guid .. "." .. "HadesTeleport",
			}
		},
	},
	HadesDash = {
		AIData = {
			PreAttackAnimation = "HadesBattleDash_Start",
			PostAttackAnimation = "HadesBattleDash_ReturnToIdle",
			PreAttackDuration = 0.03,
			FireDuration = 0.1,
			PostAttackDuration = 0.2,
			WaitForAngleTowardTarget = true,
			TrackTargetDuringCharge = true,
			StopBeforeFire = true,
			PostAttackStop = true,
			MoveWithinRange = false,
			AttackDistance = 9999,
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
		},
		Sounds = {
			-- Need to change from FireSounds to WeaponFireSounds, as it's not a projectile weapon
			WeaponFireSounds = {
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteEvading" },
				{ Name = "/SFX/Enemy Sounds/Hades/HadesDash" },
			},
		},
	},
	HadesSideDash = {
		AIData = {
			DeepInheritance = true,
			PreAttackAnimation = "HadesBattleDash_Start",
			PostAttackAnimation = "HadesBattleDash_ReturnToIdle",
			PreAttackDuration = 0.03,
			FireDuration = 0.1,
			PostAttackDuration = 0.2,
			WaitForAngleTowardTarget = true,
			TrackTargetDuringCharge = true,
			StopBeforeFire = true,
			PostAttackStop = true,
			MoveWithinRange = false,
			AttackDistance = 9999,
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
			-- Causes an infinite loop, as this would be set to itself
			AttackFailWeapon = mod.NilValue,
		},
		Sounds = {
			-- Need to change from FireSounds to WeaponFireSounds, as it's not a projectile weapon
			WeaponFireSounds = {
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteEvading" },
				{ Name = "/SFX/Enemy Sounds/Hades/HadesDash" },
			},
		},
	},
	HadesBidentThrow = {
		AIData = {
			TrackTargetDuringFire = false,
			PostAttackStop = true,
		},
	},
	HadesBidentRecoveryDash = {
		AIData = {
			FireProjectileTowardTarget = true,
			AngleTowardsTargetWhileFiring = true,
			WaitForAngleTowardTarget = false,
			TrackTargetDuringCharge = false,
			PreAttackStop = true,
			ModsNikkelMHadesBiomesDestroyObstacleOnFire = "HadesBidentReturnPoint",
			PreAttackAnimation = "HadesBattleBidentDash_Loop",
			PostAttackAnimation = "HadesBattleDash_ReturnToIdle",
			PreAttackDuration = 0.03,
			FireDuration = 0.2,
			PostAttackDuration = 0.2,
			StopBeforeFire = true,
			PostAttackStop = true,
			MoveWithinRange = false,
			AttackDistance = 9999,
			ApplyEffectsOnWeaponFire = { game.WeaponEffectData.AttackLowGrip, },
		},
		Sounds = {
			-- Need to change from FireSounds to WeaponFireSounds, as it's not a projectile weapon
			WeaponFireSounds = {
				{ Name = "/SFX/Enemy Sounds/Hades/EmoteEvading" },
				{ Name = "/SFX/Enemy Sounds/Hades/HadesDash" },
			},
		},
	},
	HadesInvisibility = {
		AIData = {
			-- Different call, as for FireFunctionName, CurrentRun is also passed as an argument
			FireFunctionName = _PLUGIN.guid .. "." .. "HadesEnemyInvisibility",
		},
	},
	HadesCastBeam = {
		RapidDamageType = true,
		AIData = {
			PreFireFunctionName = _PLUGIN.guid .. "." .. "HadesBeamDampeningOn",
			PostAttackEndFunctionName = _PLUGIN.guid .. "." .. "HadesBeamDampeningOff",
			ModsNikkelMHadesBiomes_HadesBeamDampeningValue = 0.02,
		},
	},
	HadesCastBeam360 = {
		RapidDamageType = true,
		AIData = {
			PreFireFunctionName = _PLUGIN.guid .. "." .. "HadesBeamDampeningOn",
			PostAttackEndFunctionName = _PLUGIN.guid .. "." .. "HadesBeamDampeningOff",
			ModsNikkelMHadesBiomes_HadesBeamDampeningValue = 0.015,
		},
	},
	HadesMobilityCombo1 = {
		AIData = {
			PostAttackDuration = 0.03,
			ChainedWeapon = "HadesMobilityCombo3",
		},
	},
	HadesMobilityCombo2 = {
		AIData = {
			PreAttackDuration = 0.03,
			PostAttackDuration = 0.03,
		},
	},
	HadesMobilityCombo3 = {
		AIData = {
			PreAttackDuration = 0.03,
			PostAttackDuration = 0.03,
		},
	},
	HadesConsumeHeal = {
		AIData = {
			RequireExistingIdsOfType = "ModsNikkelMHadesBiomesHadesTombstone",
			PreAttackFunctionName = _PLUGIN.guid .. "." .. "HadesConsumeHeal",
		},
	},
	HadesCerberusAssist = {
		AIData = {
			PreAttackFunctionName = _PLUGIN.guid .. "." .. "HandleHadesAssistPresentation",
			AssistPresentationPortrait = "ModsNikkelMHadesBiomes_Portrait_Cerberus",
			PreMoveFunctionName = _PLUGIN.guid .. "." .. "EnemyInvisibility",
		},
	},
	-- #endregion
	-- #endregion

	-- #region THANATOS
	ThanatosDeathCurse = {
		AIData = {
			PostAttackDuration = 0.4,
		},
	},
	ThanatosDeathCurseAoE = {
		AIData = {
			PostAttackDuration = 0.5,
			PostAttackCooldown = 1.5,
		},
	},
	-- #endregion

	-- #region ENVIRONMENT
	BlastCubeExplosionElysium = {
		AIData = {
			DeepInheritance = true,
			FireProjectileAtSelf = true,
			FireFromTarget = true,
			PreAttackDuration = 0.0,
			FireDuration = 0.0,
			PostAttackDuration = 0.0,
			MoveWithinRange = false,
			AttackDistance = 9999999,
			PostAttackAnimation = "BlastCubeFusedRegeneratingExplode",
		},
	},
	AxeTrapWeapon = {
		Sounds = {
			ImpactSounds = {
				Invulnerable = "/SFX/SwordWallHitClank",
				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
				Bone = "/SFX/MetalBoneSmash",
				Brick = "/SFX/MetalStoneClang",
				Stone = "/SFX/MetalStoneClang",
				Organic = "/SFX/StabSplatterSmall",
				StoneObstacle = "/SFX/SwordWallHitClank",
				BrickObstacle = "/SFX/SwordWallHitClank",
				MetalObstacle = "/SFX/SwordWallHitClank",
				BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
			},
		},
	},
	-- #endregion

	-- #region DEVOTION
	-- Compatibility: Droppable Gods
	DevotionZeus = mod.NilValue,
	DevotionArtemis_ALT = mod.NilValue,
	DevotionArtemis	= mod.NilValue,
	DevotionPoseidon_ALT = mod.NilValue,
	DevotionAres = mod.NilValue,
	DevotionDionysus_ALT = mod.NilValue,
	DevotionDionysus = mod.NilValue,
	DevotionAthena = mod.NilValue,
	DevotionAphrodite = mod.NilValue,
	DevotionDionysus2 = mod.NilValue,
	DevotionDemeter = mod.NilValue,
	-- #endregion
}

local renamedWeaponModifications = {}

for oldName, newName in pairs(mod.EnemyWeaponMappings) do
	if weaponModifications[oldName] then
		renamedWeaponModifications[newName] = weaponModifications[oldName]
		weaponModifications[oldName] = nil
		mod.DebugPrint("Renamed weapon modification: " .. oldName .. " to " .. newName .. " in WeaponData", 4)
	end
end
for key, value in pairs(renamedWeaponModifications) do
	weaponModifications[key] = value
end

local weaponKeyReplacements = {
	-- Should be the same as for DefaultAIData in in EnemyData.lua
	AIData = {
		AttackSlots = { TeleportToId = "InstantTeleportToId", },
		AIAttackDistance = "AttackDistance",
		AIBufferDistance = "RetreatBufferDistance",
		AITrackTargetDuringCharge = "TrackTargetDuringCharge",
		AILineOfSightBuffer = "LoSBuffer",
		AILineOfSighEndBuffer = "LoSEndBuffer",
		AIMoveWithinRangeTimeout = "MoveWithinRangeTimeout",
		TargetFriends = "TargetRequiredKillEnemy",
		AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
		AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
		AIRequireUnitLineOfSight = "RequireUnitLoS",
		AIRequireProjectileLineOfSight = "RequireProjectileLoS",
		AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
		AIFireTicksMin = "FireTicksMin",
		AIFireTicksMax = "FireTicksMax",
		-- Done manually, to make sure it's done before others
		-- FireInterval = "DumbFireInterval",
		AIFireTicksCooldown = "FireInterval",
		StandOffTime = "SurroundRefreshInterval",
		FireCooldown = "FireInterval",
		TeleportToSpawnPoints = "PreMoveTeleport",
		PostAttackTeleportToSpawnPoints = "PostAttackEndTeleport",
		PostAttackAIDumbFireWeapons = "PostAttackDumbFireWeapons",
		SkipAttackAfterMoveTimeout = "SkipAttackIfMoveTimeout",
	},
	-- Same as above
	ShrineAIDataOverwrites = {
		AttackSlots = { TeleportToId = "InstantTeleportToId", },
		AIAttackDistance = "AttackDistance",
		AIBufferDistance = "RetreatBufferDistance",
		AITrackTargetDuringCharge = "TrackTargetDuringCharge",
		AILineOfSightBuffer = "LoSBuffer",
		AILineOfSighEndBuffer = "LoSEndBuffer",
		AIMoveWithinRangeTimeout = "MoveWithinRangeTimeout",
		TargetFriends = "TargetRequiredKillEnemy",
		AIMoveWithinRangeTimeoutMin = "MoveWithinRangeTimeoutMin",
		AIMoveWithinRangeTimeoutMax = "MoveWithinRangeTimeoutMax",
		AIRequireUnitLineOfSight = "RequireUnitLoS",
		AIRequireProjectileLineOfSight = "RequireProjectileLoS",
		AIAngleTowardsPlayerWhileFiring = "AngleTowardsTargetWhileFiring",
		AIFireTicksMin = "FireTicksMin",
		AIFireTicksMax = "FireTicksMax",
		-- Done manually, to make sure it's done before others
		-- FireInterval = "DumbFireInterval",
		AIFireTicksCooldown = "FireInterval",
		StandOffTime = "SurroundRefreshInterval",
		FireCooldown = "FireInterval",
		TeleportToSpawnPoints = "PreMoveTeleport",
		PostAttackTeleportToSpawnPoints = "PostAttackEndTeleport",
		PostAttackAIDumbFireWeapons = "PostAttackDumbFireWeapons",
		SkipAttackAfterMoveTimeout = "SkipAttackIfMoveTimeout",
	},
}

local SjsonToAIDataPropertyMappings = {
	SelfVelocity = "FireSelfVelocity",
	SelfUpwardVelocity = "FireSelfUpwardVelocity",
	BarrelLength = "BarrelLength",
	Spread = "Spread",
	NumProjectiles = "NumProjectiles",
	ProjectileInterval = "ProjectileInterval",
	ProjectileAngleOffset = "ProjectileAngleInterval",
	ProjectileAngleStartOffset = "ProjectileAngleStartOffset",
	ProjectileStartAngleOffset = "ProjectileStartAngleOffset",
	ProjectileStartAngleOffsetMin = "ProjectileStartAngleOffsetMin",
	ProjectileStartAngleOffsetMax = "ProjectileStartAngleOffsetMax",
	ProjectileOffset = "ProjectileOffsetDistance",
	FireFx = "FireFx",
	UseTargetAngle = "UseTargetAngle",
}

applyModificationsAndInheritWeaponData(mod.HadesWeaponData, weaponModifications, weaponReplacements,
	weaponKeyReplacements, SjsonToAIDataPropertyMappings)
