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
		AIOptions = { _PLUGIN.guid .. "." .. "RemoteAttackModsNikkelMHadesBiomes" },
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
			AIFireTicksCooldown = 0.15,
			TrackTargetDuringCharge = false,
			ProjectileName = "DartTrapWeapon",
			PostAttackCooldown = 2.0,
		},
		Material = "MetalObstacle",
		WeaponOptions = { "DartTrapWeapon" },
		WeaponName = "DartTrapWeapon",
		OutgoingDamageModifiers = { { NonPlayerMultiplier = 33.33 } }
	}

	-- Not being used anywhere - defined in BaseG, but doesn't make sense there - may have been left in by accident
	game.WeaponData.LavaSplash.IgnoreOnHitEffects = true
	game.WeaponData.LavaSplash.AIData = game.WeaponData.LavaSplash.AIData or
			{
				DeepInheritance = true,
				PreAttackDuration = 0.1,
				PostAttackDuration = 3.0,
			}

	game.WeaponData.HadesSpikeTrapWeapon = {
		AIData = {
			DeepInheritance = true,
			ProjectileName = "HadesSpikeTrapWeapon",
			TargetSelf = true,
			MoveWithinRange = false,
			PreAttackDuration = 0.2,
			FireDuration = 0.3,
			PostAttackDuration = 0.5,
			PreAttackEndShake = true,
		},
		Sounds = { FireSounds = { { Name = "/SFX/SpikeTrapFire" }, }, },
	}

	game.WeaponData.PhalanxTrapWeapon = {
		-- Not defining AIData, as we use the EnemyData as AIData since AIData does not exist
		Sounds = { FireSounds = { { Name = "/SFX/PhalanxTrapFire" }, }, },
	}

	game.ProjectileData.BlastCubeExplosion.OutgoingDamageModifiers = { { NonPlayerMultiplier = 50, }, }
end

-- For the PhalanxTrap/SpearTrap in Elysium
function mod.AttackOnlyGroups(enemy, currentRun)
	if enemy.IdleAnimation ~= nil then
		SetAnimation({ Name = enemy.IdleAnimation, DestinationId = enemy.ObjectId })
	end

	local aiData = enemy.DefaultAIData or {}
	if game.TableLength(aiData) == 0 then
		aiData = enemy
	end

	local searchId = enemy.ObjectId
	local searchOffsetId = nil
	if aiData.SearchDistanceOffset ~= nil then
		local offset = game.CalcOffset(math.rad(GetAngle({ Id = enemy.ObjectId }) or 0), aiData.SearchDistanceOffset) or
				{ X = 0, Y = 0 }
		searchOffsetId = SpawnObstacle({
			Name = "InvisibleTarget",
			DestinationId = enemy.ObjectId,
			OffsetX = offset.X,
			OffsetY = offset.Y
		})
		searchId = searchOffsetId
	end

	while game.IsAIActive(enemy) do
		-- Wait for target to come within range, no timeout
		enemy.AINotifyName = "WithinDistance" .. enemy.ObjectId
		NotifyWithinDistanceAny({
			Ids = { searchId },
			DestinationNames = enemy.TargetGroups,
			Distance = aiData.AIAttackDistance or aiData.AttackDistance,
			ScaleY = aiData.AttackDistanceScaleY or 0.5,
			Notify = enemy.AINotifyName,
			UseLocationZ = true
		})
		game.waitUntil(enemy.AINotifyName)
		local nearbyTargetId = game.NotifyResultsTable[enemy.AINotifyName]

		if aiData.GroupTrigger then
			local enemyIds = GetIdsByType({ Name = enemy.Name }) or {}
			for k, enemyId in pairs(enemyIds) do
				if game.ActiveEnemies[enemyId] ~= nil then
					game.notifyExistingWaiters(game.ActiveEnemies[enemyId].AINotifyName)
				end
			end
		end

		-- If disabled while waiting
		if not game.IsAIActive(enemy) then
			SetAnimation({ DestinationId = enemy.ObjectId, Name = enemy.DisabledAnimation })
			break
		end

		-- Prepare to attack
		if aiData.PreAttackAnimation ~= nil then
			SetAnimation({ Name = aiData.PreAttackAnimation, DestinationId = enemy.ObjectId })
		end
		if enemy.AttackWarningAnimation ~= nil then
			CreateAnimation({
				Name = aiData.AttackWarningAnimation,
				DestinationId = enemy.ObjectId,
				ScaleRadius = aiData.AttackWarningAnimationRadius
			})
		end
		Shake({ Id = enemy.ObjectId, Speed = 350, Distance = 2, Duration = aiData.PreAttackDuration })
		if enemy.PreAttackFlash ~= nil and aiData.PreAttackDuration ~= nil then
			Flash({
				Id = enemy.ObjectId,
				Speed = 2,
				MinFraction = 0,
				MaxFraction = 0.8,
				Color = game.Color.White,
				Duration = aiData.PreAttackDuration,
				ExpireAfterCycle = true
			})
		end
		if enemy.PreAttackColor ~= nil then
			SetColor({ Color = enemy.PreAttackColor, Id = enemy.ObjectId, Duration = aiData.PreAttackDuration / 3 })
		end
		if aiData.PreAttackSound ~= nil then
			PlaySound({ Name = aiData.PreAttackSound, Id = enemy.ObjectId })
		end
		if aiData.PreAttackFx ~= nil then
			CreateAnimation({ DestinationId = enemy.ObjectId, Name = aiData.PreAttackFx })
		end
		game.wait(game.CalcEnemyWait(enemy, aiData.PreAttackDuration), enemy.AIThreadName)

		if aiData.AttackWarningAnimation ~= nil then
			StopAnimation({ Name = aiData.AttackWarningAnimation, DestinationId = enemy.ObjectId })
		end

		if not game.IsAIActive(enemy) then
			SetAnimation({ DestinationId = enemy.ObjectId, Name = enemy.DisabledAnimation })
			break
		end

		-- Attack
		aiData.WeaponName = game.SelectWeapon(enemy)
		game.AIFireWeapon(enemy, aiData)
		if enemy.FireAnimation ~= nil then
			SetAnimation({ Name = enemy.FireAnimation, DestinationId = enemy.ObjectId })
		end
		game.wait(game.CalcEnemyWait(enemy, aiData.FireDuration), enemy.AIThreadName)

		if not game.IsAIActive(enemy) then
			SetAnimation({ DestinationId = enemy.ObjectId, Name = enemy.DisabledAnimation })
			break
		end

		-- Post-attack recover window
		if aiData.PreAttackColor ~= nil then
			Flash({
				Id = enemy.ObjectId,
				Speed = 2,
				MinFraction = 0,
				MaxFraction = 0.8,
				Color = game.Color.White,
				Duration = aiData.PostAttackCooldown
			})
		end
		if aiData.ReloadingLoopSound ~= nil then
			enemy.ReloadSoundId = PlaySound({ Name = aiData.ReloadingLoopSound, Id = enemy.ObjectId })
		end
		if aiData.PostAttackAnimation ~= nil then
			SetAnimation({ Name = aiData.PostAttackAnimation, DestinationId = enemy.ObjectId })
		end
		game.wait(game.CalcEnemyWait(enemy, aiData.PostAttackCooldown), enemy.AIThreadName)
		SetColor({ Color = enemy.White, Id = enemy.ObjectId })
		StopSound({ Id = enemy.ReloadSoundId, Duration = 0.2 })

		if aiData.AIResetDistance ~= nil then
			-- Wait until target leaves before resetting
			enemy.AINotifyName = "OutsideDistance" .. enemy.ObjectId
			NotifyOutsideDistance({
				Id = searchId,
				DestinationId = nearbyTargetId,
				Distance = aiData.AIResetDistance,
				Notify = enemy.AINotifyName
			})
			game.waitUntil(enemy.AINotifyName)
			if not game.IsAIActive(enemy) then
				break
			end

			if aiData.IdleAnimation ~= nil then
				SetAnimation({ Name = aiData.IdleAnimation, DestinationId = enemy.ObjectId })
			end
			if aiData.ReloadedSound ~= nil then
				PlaySound({ Name = aiData.ReloadedSound, Id = enemy.ObjectId })
			end
		end

		if aiData.KillAfterAttack then
			game.Kill(enemy)
		end
	end

	if searchOffsetId ~= nil then
		Destroy({ Id = searchOffsetId })
	end
end

-- For the ArcherTrap in Elysium among others
function mod.PassiveAttack(enemy, currentRun)
	enemy.WeaponName = enemy.WeaponName or game.SelectWeapon(enemy)
	local weaponAIData = game.GetWeaponAIData(enemy) or {}

	if weaponAIData.PreAttackAnimation ~= nil then
		SetAnimation({ Name = weaponAIData.PreAttackAnimation, DestinationId = enemy.ObjectId })
	end
	if enemy.WakeUpDelay ~= nil or (enemy.WakeUpDelayMin ~= nil and enemy.WakeUpDelayMax ~= nil) then
		local wakeUpDelay = enemy.WakeUpDelay or game.RandomFloat(enemy.WakeUpDelayMin, enemy.WakeUpDelayMax)
		game.wait(game.CalcEnemyWait(enemy, wakeUpDelay), enemy.AIThreadName)
	end

	while game.IsAIActive(enemy) do
		if weaponAIData.AIResetDistance ~= nil then
			-- Check if target within range
			enemy.AINotifyName = "WithinDistance" .. enemy.ObjectId

			NotifyWithinDistanceAny({
				Ids = { enemy.ObjectId },
				DestinationNames = weaponAIData.TargetGroups,
				Distance = weaponAIData.AIAttackDistance,
				ScaleY = 0.5,
				Notify = enemy.AINotifyName,
				Timeout = 0.1
			})
			game.waitUntil(enemy.AINotifyName)
			local nearbyTargetId = game.NotifyResultsTable[enemy.AINotifyName]
			local targetId = nil
			if nearbyTargetId ~= nil and targetId ~= 0 then
				-- Wait until target leaves before resetting
				enemy.AINotifyName = "OutsideDistance" .. enemy.ObjectId

				NotifyOutsideDistance({
					Id = enemy.ObjectId,
					DestinationId = nearbyTargetId,
					Distance = weaponAIData.AIResetDistance,
					Notify = enemy.AINotifyName
				})
				game.waitUntil(enemy.AINotifyName)
				if weaponAIData.IdleAnimation ~= nil then
					SetAnimation({ Name = weaponAIData.IdleAnimation, DestinationId = enemy.ObjectId })
				end
				if weaponAIData.ReloadedSound ~= nil then
					PlaySound({ Name = weaponAIData.ReloadedSound, Id = enemy.ObjectId })
				end
			end
		end

		local preAttackDuration = weaponAIData.PreAttackDuration or 0.5
		if weaponAIData.PreAttackDuration == nil and weaponAIData.PreAttackDurationMin ~= nil and weaponAIData.PreAttackDurationMax ~= nil then
			preAttackDuration = game.RandomFloat(weaponAIData.PreAttackDurationMin, weaponAIData.PreAttackDurationMax) or 0.5
		end

		local preAttackEndDuration = weaponAIData.PreAttackEndDuration or math.min(0.5, preAttackDuration)
		local preAttackStartDuration = math.max(preAttackDuration - preAttackEndDuration, 0)

		-- Prepare to attack
		if weaponAIData.PreAttackAnimation ~= nil then
			SetAnimation({ Name = weaponAIData.PreAttackAnimation, DestinationId = weaponAIData.ObjectId })
		end
		if weaponAIData.AttackWarningAnimation ~= nil then
			CreateAnimation({
				Name = weaponAIData.AttackWarningAnimation,
				DestinationId = enemy.ObjectId,
				ScaleRadius = weaponAIData.AttackWarningAnimationRadius
			})
		end
		if weaponAIData.PreAttackSound ~= nil then
			PlaySound({ Name = weaponAIData.PreAttackSound, Id = weaponAIData.ObjectId })
		end

		local originalColor = weaponAIData.Color
		if weaponAIData.PreAttackColor ~= nil then
			SetColor({ Color = weaponAIData.PreAttackColor, Id = enemy.ObjectId, Duration = weaponAIData.PreAttackDuration })
		end
		game.wait(game.CalcEnemyWait(enemy, preAttackStartDuration), enemy.AIThreadName)

		if weaponAIData.PreAttackEndShake then
			Shake({ Id = enemy.ObjectId, Speed = 400, Distance = 3, Duration = preAttackEndDuration })
			Flash({
				Id = enemy.ObjectId,
				Speed = 1,
				MinFraction = 0,
				MaxFraction = 0.8,
				Color = game.Color.White,
				Duration = preAttackEndDuration
			})
		end
		if weaponAIData.PreAttackEndShakeSound ~= nil then
			PlaySound({ Name = weaponAIData.PreAttackEndShakeSound, Id = enemy.ObjectId })
		end

		game.wait(game.CalcEnemyWait(enemy, preAttackEndDuration), enemy.AIThreadName)
		-- 543225 is the non-working Saw Trap in this room, that is angled towards some indestructible obstacle I can't find
		if game.CurrentRun.CurrentRoom.Name == "D_Mini13" and enemy.ObjectId == 543225 then
			local newAngle = 205
			if game.CurrentRun.CurrentRoom.Flipped then
				newAngle = 335
			end
			SetAngle({ Id = enemy.ObjectId, Angle = newAngle })
		end

		local targetId = nil
		if weaponAIData.TargetSelf then
			targetId = enemy.ObjectId
		end
		if weaponAIData.TargetOffsetForward then
			local offset = game.CalcOffset(math.rad(GetAngle({ Id = enemy.ObjectId }) or 0), weaponAIData.TargetOffsetForward) or
					{ X = 0, Y = 0 }
			targetId = SpawnObstacle({
				Name = "InvisibleTarget",
				Group = "Scripting",
				DestinationId = targetId,
				OffsetX = offset.X,
				OffsetY = offset.Y
			})
		end

		if weaponAIData.AttackWarningAnimation ~= nil then
			StopAnimation({ Name = weaponAIData.AttackWarningAnimation, DestinationId = enemy.ObjectId })
		end

		if not enemy.DisableAIWhenReady then
			-- Attack
			if weaponAIData.FireAnimation ~= nil then
				SetAnimation({ Name = weaponAIData.FireAnimation, DestinationId = enemy.ObjectId })
			end
			weaponAIData.WeaponName = game.SelectWeapon(enemy)
			game.AIFireWeapon(enemy, weaponAIData)
			-- FireWeaponFromUnit({ Weapon = enemy.WeaponName, Id = enemy.ObjectId, DestinationId = targetId })

			-- Post-attack recover window
			if weaponAIData.PreAttackColor ~= nil then
				SetColor({ Color = originalColor, Id = enemy.ObjectId, Duration = weaponAIData.PostAttackCooldown })
			end
			if weaponAIData.PostAttackFlash then
				Flash({
					Id = enemy.ObjectId,
					Speed = 2,
					MinFraction = 0,
					MaxFraction = 0.8,
					Color = game.Color.White,
					Duration = weaponAIData.PostAttackCooldown
				})
			end
			if weaponAIData.PostAttackAnimation ~= nil then
				SetAnimation({ Name = weaponAIData.PostAttackAnimation, DestinationId = enemy.ObjectId })
			end
			if weaponAIData.ReloadingLoopSound ~= nil then
				enemy.ReloadSoundId = PlaySound({ Name = weaponAIData.ReloadingLoopSound, Id = enemy.ObjectId })
			end

			local postAttackCooldown = weaponAIData.PostAttackCooldown
			if weaponAIData.PostAttackCooldown == nil and weaponAIData.PostAttackCooldownMin ~= nil and weaponAIData.PostAttackCooldownMax ~= nil then
				postAttackCooldown = game.RandomFloat(weaponAIData.PostAttackCooldownMin, weaponAIData.PostAttackCooldownMax)
			end
			game.wait(game.CalcEnemyWait(enemy, postAttackCooldown), enemy.AIThreadName)

			StopSound({ Id = weaponAIData.ReloadSoundId, Duration = 0.2 })
			if weaponAIData.ReloadedSound ~= nil then
				PlaySound({ Name = weaponAIData.ReloadedSound, Id = enemy.ObjectId })
			end
		end

		if weaponAIData.TargetOffsetForward then
			Destroy({ Id = targetId })
		end
	end
end

function mod.ModsNikkelMHadesBiomesToggleTrapState(enemy, aiData)
	-- For the first trigger, ensure it's flipped with the map if needed
	if game.CurrentRun.CurrentRoom.Flipped and enemy.ModsNikkelMHadesBiomesFlipIfRoomFlipped and not enemy.ModsNikkelMHadesBiomesIsFlipped then
		FlipHorizontal({ Id = enemy.ObjectId })
		enemy.ModsNikkelMHadesBiomesIsFlipped = true
	end
	if enemy.ModsNikkelMHadesBiomesCurrentlyActive then
		enemy.ModsNikkelMHadesBiomesCurrentlyActive = false
	else
		enemy.ModsNikkelMHadesBiomesCurrentlyActive = true
	end
end
