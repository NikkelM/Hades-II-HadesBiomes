function game.PickupAI(enemy, currentRun)
	if currentRun == nil then
		currentRun = game.CurrentRun
	end

	game.wait(game.CalcEnemyWait(enemy, enemy.WakeDelay), enemy.AIThreadName)

	while game.IsAIActive(enemy) do
		if enemy.RetreatBeforePickup then
			game.Retreat(enemy, enemy, currentRun.Hero.ObjectId)
		end

		local pickupSuccess = game.DoPickup(enemy)

		if pickupSuccess then
			return
		else
			local duration = enemy.PickupAttemptCooldown or 1
			game.wait(game.CalcEnemyWait(enemy, duration), enemy.AIThreadName)
		end
	end
end
