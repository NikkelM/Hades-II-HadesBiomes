modutil.mod.Path.Wrap("RamAILoop", function(base, enemy, aiData)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy.ModsNikkelMHadesBiomesIsModdedEnemy then
		game.ModsNikkelMHadesBiomesRamAILoop(enemy, aiData)
	else
		base(enemy, aiData)
	end
end)

function game.ModsNikkelMHadesBiomesRamAILoop(enemy, aiData)
	if not CanAttack({ Id = enemy.ObjectId }) then
		enemy.AINotifyName = "CanAttack" .. enemy.ObjectId
		NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
		waitUntil(enemy.AINotifyName)
	end

	aiData.TargetId = GetTargetId(enemy, aiData)
	if aiData.TargetId ~= nil and aiData.TargetId ~= 0 then
		-- Setup move
		aiData.AttackDistance = aiData.SetupDistance
		aiData.MoveWithinRangeTimeout = aiData.SetupTimeout
		MoveWithinRange(enemy, aiData.TargetId, aiData)

		if not _eventTimeoutRecord[enemy.AINotifyName] then
			-- Teleportation
			if aiData.TeleportToSpawnPoints then
				HandleEnemyTeleportation(enemy, aiData)
			end

			-- Prepare to ram
			if aiData.PreAttackStop then
				Stop({ Id = enemy.ObjectId })
			end
			if aiData.TrackTargetDuringCharge then
				Track({ Ids = { enemy.ObjectId }, DestinationIds = { aiData.TargetId } })
			end
			if aiData.PreAttackShake ~= nil then
				Shake({ Id = enemy.ObjectId, Speed = aiData.PreAttackShake, Distance = 3, Duration = aiData.PreAttackDuration })
			end
			if aiData.PreAttackFlash ~= nil then
				Flash({
					Id = enemy.ObjectId,
					Speed = aiData.PreAttackFlash,
					MinFraction = 0,
					MaxFraction = 0.8,
					Color = Color
							.White,
					Duration = aiData.PreAttackDuration
				})
			end
			if aiData.PreAttackSound ~= nil then
				PlaySound({ Name = aiData.PreAttackSound, Id = enemy.ObjectId, ManagerCap = aiData.SoundManagerCap or 46 })
			end
			if aiData.PreAttackAnimation ~= nil then
				SetAnimation({ Name = aiData.PreAttackAnimation, DestinationId = enemy.ObjectId })
			end
			if aiData.PreAttackFx ~= nil then
				CreateAnimation({ DestinationId = enemy.ObjectId, Name = aiData.PreAttackFx })
			end
			wait(CalcEnemyWait(enemy, aiData.PreAttackDuration), enemy.AIThreadName)

			if HeroHasTrait("FocusDamageShaveBoon") then
				for _, data in pairs(GetHeroTraitValues("OnAttackWindUpAction")) do
					CallFunctionName(data.FunctionName, enemy, data.Args)
				end
			end
			if aiData.RamEffectName ~= nil and WeaponEffectData[aiData.RamEffectName] ~= nil then
				effectData = DeepCopyTable(WeaponEffectData[aiData.RamEffectName])
				effectData.Id = enemy.ObjectId
				effectData.DestinationId = enemy.ObjectId
				ApplyEffect(effectData)
			end
			-- Adds the speedup during ram
			ApplyEffectFromWeapon({
				Id = enemy.ObjectId,
				DestinationId = enemy.ObjectId,
				AutoEquip = true,
				WeaponName = aiData
						.RamWeaponName,
				EffectName = aiData.RamEffectName,
				Duration = aiData.RamTimeout
			})
			if aiData.FireSound ~= nil then
				PlaySound({ Name = aiData.FireSound, Id = enemy.ObjectId })
			end
			if aiData.FireAlpha ~= nil then
				SetAlpha({ Id = enemy.ObjectId, Fraction = aiData.FireAlpha, Duration = aiData.FireAlphaDuration or 0 })
			end
			if aiData.FireAnimation ~= nil then
				SetAnimation({ Name = aiData.FireAnimation, DestinationId = enemy.ObjectId })
			end
			if aiData.FireFx ~= nil then
				CreateAnimation({ DestinationId = enemy.ObjectId, Name = aiData.FireFx })
			end
			-- Ram move
			aiData.AttackDistance = aiData.RamDistance
			aiData.MoveWithinRangeTimeout = aiData.RamTimeout
			local moveSuccess = MoveWithinRange(enemy, aiData.TargetId, aiData)
			-- Added: Fires the weapon after a successful ram
			if moveSuccess ~= false then
				AIFireProjectile(enemy, aiData)
			end
			Stop({ Id = enemy.ObjectId })
			if aiData.PostAttackAnimation ~= nil then
				SetAnimation({ Name = aiData.PostAttackAnimation, DestinationId = enemy.ObjectId })
			end
			wait(CalcEnemyWait(enemy, aiData.RamRecoverTime), enemy.AIThreadName)
		end
	else
		MoveToRandomLocation(enemy, enemy.ObjectId, aiData.NoTargetWanderDistance or 100, aiData.NoTargetWanderDistance or 0,
			aiData.NoTargetWanderDuration)
		wait(CalcEnemyWait(enemy, aiData.NoTargetWanderDuration or 0.5), enemy.AIThreadName)
	end

	if aiData.RetreatAfterRam then
		Retreat(enemy, aiData, aiData.TargetId)
	end
end
