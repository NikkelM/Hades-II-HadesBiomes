function game.BossIntroElysium(eventSource, args)
	local shrineLevel = game.GetNumShrineUpgrades(eventSource.ShrineMetaUpgradeName)
	game.ModsNikkelMHadesBiomesBossIntro(eventSource, args[shrineLevel])
end

-- TODO: Might not be needed depending on the implementation we end up with
-- Set as PostAttackAI for the Minotaur
function game.MoveUntilEffectExpired(enemy, aiData)
	print("MoveUntilEffectExpired")
	aiData = aiData or enemy.DefaultAIData
	aiData.TargetId = aiData.TargetId or CurrentRun.Hero.ObjectId

	if aiData.PostAttackAICanOnlyMoveForward then
		SetUnitProperty({ Property = "CanOnlyMoveForward", Value = true, DestinationId = enemy.ObjectId })
	end
	-- Used to be args.TargetId
	Move({ Id = enemy.ObjectId, DestinationId = aiData.TargetId, SuccessDistance = aiData.MoveSuccessDistance or 32 })
	enemy.AINotifyName = "EffectExpired" .. enemy.ObjectId
	NotifyOnEffectExpired({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, EffectName = aiData.EffectExpiredName })
	game.waitUntil(enemy.AINotifyName, enemy.AIThreadName)
	if aiData.PostAttackAICanOnlyMoveForward then
		SetUnitProperty({ Property = "CanOnlyMoveForward", Value = false, DestinationId = enemy.ObjectId })
	end
	if HasEffect({ Id = enemy.ObjectId, EffectName = aiData.EffectExpiredName }) then
		SetAnimation({ DestinationId = enemy.ObjectId, Name = GetThingDataValue({ Id = enemy.ObjectId, Property = "Graphic" }) })
	end
	Stop({ Id = enemy.ObjectId })
	if aiData.EndPartnerWaitPostAttackAI and enemy.ComboPartnerId ~= nil then
		if game.ActiveEnemies[enemy.ComboPartnerId] ~= nil and not game.ActiveEnemies[enemy.ComboPartnerId].IsDead then
			game.SetThreadWait(game.ActiveEnemies[enemy.ComboPartnerId].AIThreadName, 0.0)
		end
	end
	if aiData.PostAttackAIDumbFireWeapons ~= nil then
		for k, weaponName in pairs(aiData.PostAttackAIDumbFireWeapons) do
			game.thread(game.DumbFireAttack, enemy, weaponName)
		end
	end
	print("End MoveUntilEffectExpired")
end
