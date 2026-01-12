-- Fixing the function call to get the shrine upgrade level
modutil.mod.Path.Wrap("GetWeaponAIData", function(base, enemy, weaponName)
	weaponName = weaponName or enemy.WeaponName
	local aiData = base(enemy, weaponName)
	if game.WeaponData[weaponName] ~= nil and game.WeaponData[weaponName].AIData ~= nil then
		if game.WeaponData[weaponName].ShrineAIDataOverwrites ~= nil and game.GetNumShrineUpgrades(game.WeaponData[enemy.WeaponName].ShrineMetaUpgradeName) >= game.WeaponData[enemy.WeaponName].ShrineMetaUpgradeRequiredLevel then
			game.OverwriteTableKeys(aiData, WeaponData[weaponName].ShrineAIDataOverwrites)
		end
	end
	return aiData
end)

modutil.mod.Path.Wrap("DoWeaponFire", function(base, enemy, aiData)
	if aiData.OnFireCrowdReaction ~= nil then
		game.thread(game.CrowdReactionPresentation, aiData.OnFireCrowdReaction)
	end

	return base(enemy, aiData)
end)

modutil.mod.Path.Wrap("AIFireWeapon", function(base, enemy, aiData)
	local success = base(enemy, aiData)

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy.ModsNikkelMHadesBiomesIsModdedEnemy then
		-- For Hades' BidentThrow
		if aiData.ModsNikkelMHadesBiomesDestroyObstacleOnFire then
			Destroy({ Ids = GetIdsByType({ Name = aiData.ModsNikkelMHadesBiomesDestroyObstacleOnFire }), })
		end
	end

	return success
end)

modutil.mod.Path.Wrap("AIFireProjectile", function(base, enemy, aiData, projectileData)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy.ModsNikkelMHadesBiomesIsModdedEnemy then
		-- For Theseus' SpearThrow
		if aiData.ModsNikkelMHadesBiomesFireFromObstacle then
			aiData.FireFromId = GetIdsByType({ Name = aiData.ModsNikkelMHadesBiomesFireFromObstacle })[1] or nil
		end
		if aiData.ModsNikkelMHadesBiomesDestroyObstacleOnFire then
			Destroy({ Ids = GetIdsByType({ Name = aiData.ModsNikkelMHadesBiomesDestroyObstacleOnFire }), })
		end
		if aiData.ModsNikkelMHadesBiomesFireAtSelf then
			aiData.TargetId = enemy.ObjectId
		end
	end

	return base(enemy, aiData, projectileData)
end)

-- Gets called in a ThreadedEvents function in each boss's AIStage.
-- This re-implements some of the logic from Hades' StagedAI that was removed in Hades II
function mod.ModsNikkelMHadesBiomesBossAIStageHandler(enemy, args)
	local aiStage = enemy.AIStages[enemy.AIStageActive]

	-- Revert any FireRotationDampening/treat it like a OnHitStun event for them
	if not game.IsEmpty(enemy.ClearEffectsOnHitStun) then
		ClearEffect({ Id = enemy.ObjectId, Names = enemy.ClearEffectsOnHitStun })
	end

	if aiStage.UnequipWeapons ~= nil then
		for k, weaponName in pairs(aiStage.UnequipWeapons) do
			game.RemoveValueAndCollapse(enemy.WeaponOptions, weaponName)
			-- This crashes the game for some reason
			-- UnequipWeapon({ Name = weaponName, DestinationId = enemy.ObjectId })
		end
	end

	if aiStage.AddSupportAIWeaponOptions ~= nil then
		local supportAIUnit = game.ActiveEnemies[enemy.SupportAIUnitId]
		if supportAIUnit ~= nil then
			for supportAIName, addWeaponOptions in pairs(aiStage.AddSupportAIWeaponOptions) do
				game.ConcatTableValues(supportAIUnit.SupportAIWeaponOptions[supportAIName],
					aiStage.AddSupportAIWeaponOptions[supportAIName])
			end
		end
	end

	if aiStage.SetRageWeapon ~= nil then
		enemy.RageWeapon = aiStage.SetRageWeapon
	end

	-- Transition
	if aiStage.ThreadedFunctions ~= nil then
		for k, aiFunctionName in pairs(aiStage.ThreadedFunctions) do
			game.thread(game.CallFunctionName, aiFunctionName, enemy)
		end
	end

	if aiStage.TransitionUnthreadedFunctionNames ~= nil then
		for i, functionName in ipairs(aiStage.TransitionUnthreadedFunctionNames) do
			game.CallFunctionName(functionName, enemy, aiStage.TransitionUnthreadedFunctionArgs[i])
		end
	end

	if aiStage.PermanentlyEnrage then
		enemy.PermanentEnraged = true
		game.thread(mod.EnrageUnit, enemy, game.CurrentRun)
	end

	if aiStage.ClearObstacleTypes then
		Destroy({ Ids = GetIdsByType({ Name = aiStage.ClearObstacleTypes }) })
	end
end
