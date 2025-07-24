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

-- Gets called in a ThreadedEvents function in each boss's AIStage.
-- This re-implements some of the logic from Hades' StagedAI that was removed in Hades II
function game.NikkelMHadesBiomesBossAIStageHandler(enemy, args)
	local aiStage = enemy.AIStages[enemy.AIStageActive]

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

	if aiStage.PermanentlyEnrage then
		enemy.PermanentEnraged = true
		game.thread(game.EnrageUnit, enemy)
	end

	if aiStage.ClearObstacleTypes then
		Destroy({ Ids = GetIdsByType({ Name = aiStage.ClearObstacleTypes }) })
	end
end
