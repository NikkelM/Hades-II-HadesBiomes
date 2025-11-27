modutil.mod.Path.Context.Wrap.Static("DeathPresentation", function(currentRun, killer, deathArgs)
	modutil.mod.Path.Wrap("DisplayInfoBanner", function(base, source, infoArgs)
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			if infoArgs.Text == "DeathMessage" then
				-- Normal death during a run
				infoArgs.Text = "ModsNikkelMHadesBiomes_DeathMessage"
				infoArgs.TextColor = Color.Red
				infoArgs.FontScale = 0.85
				infoArgs.TextOffsetY = -20
				infoArgs.AnimationName = "LocationTextBGDeath"
				infoArgs.AnimationOutName = "LocationTextBGDeathOut"
			elseif infoArgs.Text == "OutroDeathMessageAlt" or infoArgs.Text == "OutroDeathMessageTrueEnding" then
				-- Post Ending01, run cleared
				infoArgs.Text = "ModsNikkelMHadesBiomes_PostEndingDeathMessage"
				infoArgs.TextColor = game.Color.Red
				infoArgs.FontScale = 0.85
				infoArgs.TextOffsetY = -20
				infoArgs.AnimationName = "LocationTextBGDeath"
				infoArgs.AnimationOutName = "LocationTextBGDeathOut"
			end
		end

		return base(source, infoArgs)
	end)
end)

-- For modded run outro remembrances
modutil.mod.Path.Context.Wrap.Static("EndEarlyAccessPresentation", function()
	-- Instead of returning a usual random outro, return a custom modded one
	modutil.mod.Path.Wrap("GetRandomEligiblePrioritizedItem",
		function(base, items, priorities, playedStore, randomRemainingStore, args)
			if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
				game.GameState.ModsNikkelMHadesBiomes_PlayedRunOutros = game.GameState.ModsNikkelMHadesBiomes_PlayedRunOutros or
						{}
				local eligibleOutroData = {}
				local eligibleUnplayedOutroData = {}
				for k, outroData in pairs(mod.ModsNikkelMHadesBiomes_GameOutroData) do
					if outroData.Header ~= nil and game.IsGameStateEligible(game.CurrentRun, outroData) then
						table.insert(eligibleOutroData, outroData)
						if not game.GameState.ModsNikkelMHadesBiomes_PlayedRunOutros[outroData.Header] then
							table.insert(eligibleUnplayedOutroData, outroData)
						end
					end
				end
				local gameOutroData = nil
				if game.IsEmpty(eligibleUnplayedOutroData) then
					-- All played, start the record over
					for index, outroData in pairs(game.GameOutroData) do
						if outroData.Header ~= nil then
							game.GameState.ModsNikkelMHadesBiomes_PlayedRunOutros[outroData.Header] = nil
						end
					end
					gameOutroData = game.GetRandomValue(eligibleOutroData)
				else
					gameOutroData = game.GetRandomValue(eligibleUnplayedOutroData)
				end

				return gameOutroData
			end

			return base(items, priorities, playedStore, randomRemainingStore, args)
		end)
end)
