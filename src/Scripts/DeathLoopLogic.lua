-- For the RunHistoryScreen, we need to set a proper name for when the player is killed by a HarpySupportUnit
modutil.mod.Path.Wrap("KillHero", function(base, victim, triggerArgs)
	local killer = triggerArgs.AttackerTable
	if killer == nil then
		killer = {}
		killer.Name = triggerArgs.AttackerName
		killer.ObjectId = triggerArgs.AttackerId
	end

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- To prevent HandleTrapChain from running into an error as the ActiveEnemies is empty
		if game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.Encounter then
			game.CurrentRun.CurrentRoom.Encounter.InProgress = false
		end
		if killer then
			if killer.Name == "HarpySupportUnit" then
				local resultText = game.CurrentRun.CurrentRoom.ResultText
				if resultText == "RunHistoryScreenResult_A_Boss01" then
					killer.Name = "Harpy"
				elseif resultText == "RunHistoryScreenResult_A_Boss02" then
					killer.Name = "Harpy2"
				elseif resultText == "RunHistoryScreenResult_A_Boss03" then
					killer.Name = "Harpy3"
				end
			elseif killer.Name == "Hades" then
				killer.Name = "NPC_Hades_01"
			elseif killer.Name == "BloodMine" then
				killer.Name = "HadesThiefMineLayer"
			end
		end

		-- TODO: Just setting the name is not enough for the RunHistoryScreen
		-- TODO: Need to differentiate between PoisonTrap, SatyrRanged and RatThug
		if killer == nil or game.TableLength(killer) == 0 then
			if triggerArgs.Victim.CurrentlyPoisoned and triggerArgs.EffectName == "StyxPoison" then
				killer = {}
				killer.Name = "RatThug"
			end
		end
	end

	base(victim, triggerArgs)
end)

modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
	-- Reset the modified game objects when returning to the Crossroads
	mod.ApplyGlobalGameObjectModifications(false)

	base(source, args)
end)
