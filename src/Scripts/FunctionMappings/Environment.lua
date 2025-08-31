-- Functions required for Traps to work

-- Mixes functionality from the original Hades RemoteAttack and the Hades II replacement, RemoteAI, to work with the Dart trap
function game.RemoteAttackModsNikkelMHadesBiomes(enemy)
	while game.IsAIActive(enemy) do
		enemy.WeaponName = game.SelectWeapon(enemy)
		table.insert(enemy.WeaponHistory, enemy.WeaponName)
		local aiData = game.GetWeaponAIData(enemy) or {}

		if aiData.IdleAnimation ~= nil then
			SetAnimation({ Name = aiData.IdleAnimation, DestinationId = enemy.ObjectId })
		end

		-- Wait for target to come within range, no timeout
		enemy.AINotifyName = "WithinDistance_" .. enemy.Name .. "_" .. enemy.ObjectId
		NotifyWithinDistanceAny({
			Ids = { enemy.ObjectId },
			DestinationNames = enemy.TargetGroups,
			Distance = aiData.AttackDistance,
			ScaleY = 0.5,
			MaxZ = aiData.MaxVictimZ,
			Notify = enemy.AINotifyName
		})
		game.waitUntil(enemy.AINotifyName)
		aiData.TargetId = game.NotifyResultsTable[enemy.AINotifyName]

		-- If disabled while waiting
		if not game.IsAIActive(enemy) then
			SetAnimation({ DestinationId = enemy.ObjectId, Name = aiData.DisabledAnimation })
			return
		end

		local linkedEnemy = game.ActiveEnemies
				[GetClosestUnitOfType({ Id = enemy.ObjectId, DestinationName = aiData.LinkedEnemy, Distance = 2000 })]

		local trapChainData = nil
		if game.CurrentRun.CurrentRoom.RemoteTrapChains ~= nil then
			trapChainData = game.CurrentRun.CurrentRoom.RemoteTrapChains[enemy.ObjectId]
		end

		-- For rooms where more than one trap is triggered by a plate
		if not aiData.SkipAngleTowardTarget then
			if trapChainData ~= nil and trapChainData.Chains ~= nil then
				for k, linkTable in ipairs(trapChainData.Chains) do
					for k, trapId in ipairs(linkTable) do
						AngleTowardTarget({ Id = trapId, DestinationId = enemy.ObjectId })
					end
				end
			else
				-- This angles the linked enemy toward the trigger plate
				AngleTowardTarget({ Id = linkedEnemy.ObjectId, DestinationId = enemy.ObjectId })
			end
		end

		-- Prepare to attack
		if aiData.PreAttackAnimation ~= nil then
			SetAnimation({ Name = aiData.PreAttackAnimation, DestinationId = enemy.ObjectId })
		end

		if aiData.PreAttackColor ~= nil then
			SetColor({ Color = enemy.PreAttackColor, Id = enemy.ObjectId, Duration = enemy.PreAttackDuration / 3 })
		end
		if aiData.PreAttackSound ~= nil then
			PlaySound({ Name = enemy.PreAttackSound, Id = enemy.ObjectId })
		end
		game.wait(game.CalcEnemyWait(enemy, aiData.PreAttackDuration), enemy.AIThreadName)

		-- Not called in Hades
		-- DoAttack(enemy, aiData)

		if trapChainData ~= nil then
			for i, chain in ipairs(trapChainData.Chains) do
				for j, chainedEnemyId in ipairs(chain) do
					game.notifyExistingWaiters("WithinDistance" .. chainedEnemyId)
					local chainedEnemy = game.ActiveEnemies[chainedEnemyId]
					if chainedEnemy ~= nil then
						local chainedWeaponAIData = game.ShallowCopyTable(chainedEnemy.DefaultAIData) or chainedEnemy
						if game.WeaponData[chainedEnemy.WeaponName] ~= nil and game.WeaponData[chainedEnemy.WeaponName].AIData ~= nil then
							game.OverwriteTableKeys(chainedWeaponAIData, game.WeaponData[chainedEnemy.WeaponName].AIData)
						end
						chainedWeaponAIData.WeaponName = chainedEnemy.WeaponName

						game.thread(game.DoAttack, chainedEnemy, chainedWeaponAIData)
					end
				end
				game.wait(game.CalcEnemyWait(enemy, trapChainData.ChainInterval), enemy.AIThreadName)
			end
		end

		if linkedEnemy ~= nil then
			local linkedWeaponAIData = game.ShallowCopyTable(linkedEnemy.DefaultAIData) or linkedEnemy
			if game.WeaponData[linkedEnemy.WeaponName] ~= nil and game.WeaponData[linkedEnemy.WeaponName].AIData ~= nil then
				game.OverwriteTableKeys(linkedWeaponAIData, game.WeaponData[linkedEnemy.WeaponName].AIData)
			end
			linkedWeaponAIData.WeaponName = linkedEnemy.WeaponName

			if not linkedWeaponAIData.SkipAngleTowardTargetWait then
				linkedEnemy.AINotifyName = "WaitForRotation" .. linkedEnemy.ObjectId
				NotifyOnRotationComplete({ Id = linkedEnemy.ObjectId, Cosmetic = true, Notify = linkedEnemy.AINotifyName, Timeout = 9.0 })
				game.waitUntil(linkedEnemy.AINotifyName)
			end

			game.thread(game.DoAttack, linkedEnemy, linkedWeaponAIData)
		end

		if not game.IsAIActive(enemy) then
			break
		end

		-- Post-attack recover window
		if aiData.PreAttackColor ~= nil then
			SetColor({ Color = enemy.PreAttackColor, Id = enemy.ObjectId })
			SetColor({ Color = enemy.White, Id = enemy.ObjectId, Duration = enemy.PostAttackCooldown })
		end
		if aiData.PostAttackAnimation ~= nil then
			SetAnimation({ Name = enemy.PostAttackAnimation, DestinationId = enemy.ObjectId })
		end

		if aiData.ReloadingLoopSound ~= nil then
			enemy.ReloadSoundId = PlaySound({ Name = enemy.ReloadingLoopSound, Id = enemy.ObjectId })
		end
		game.wait(game.CalcEnemyWait(enemy, aiData.PostAttackCooldown), enemy.AIThreadName)
		StopSound({ Id = aiData.ReloadSoundId, Duration = 0.2 })

		-- Wait until target leaves before resetting
		if aiData.AIResetDistance ~= nil then
			enemy.AINotifyName = "OutsideDistance" .. enemy.ObjectId
			NotifyOutsideDistance({
				Id = enemy.ObjectId,
				DestinationId = aiData.TargetId,
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
	end
end

-- Triggered when a breakable is hit
function game.BreakableOnHitModsNikkelMHadesBiomes(victim, attacker, triggerArgs)
	triggerArgs = triggerArgs or {}
	game.CheckMoneyDrop(victim, victim.MoneyDropOnDeath, attacker)
	game.KillPresentation(victim, attacker, triggerArgs)
	-- Only destroy the breakable once
	victim.IgnoreDamage = true
	-- Turn off collision
	SetThingProperty({ Property = "StopsUnits", Value = false, DestinationId = victim.ObjectId })
	SetThingProperty({ Property = "StopsLight", Value = false, DestinationId = victim.ObjectId })
	SetThingProperty({ Property = "StopsProjectiles", Value = false, DestinationId = victim.ObjectId })
	SetUnitProperty({ Property = "CollideWithUnits", Value = false, DestinationId = victim.ObjectId })
end
