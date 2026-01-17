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

		if not game.CurrentRun.ModsNikkelMHadesBiomesSkipFindKiller then
			-- In Boss and Miniboss rooms, set the killer to the boss/miniboss name instead of any potential minions or traps
			if game.CurrentRun.CurrentRoom.BackupCauseOfDeath ~= nil then
				killer = game.EnemyData[game.CurrentRun.CurrentRoom.BackupCauseOfDeath]
			end

			if killer then
				if killer.Name == "Hades" then
					killer.Name = "NPC_Hades_01"
				elseif killer.Name == "BloodMine" then
					killer.Name = "HadesThiefMineLayer"
				end
			end

			if killer == nil or game.TableLength(killer) == 0 then
				if triggerArgs.Victim and triggerArgs.Victim.CurrentlyPoisoned and triggerArgs.EffectName == "StyxPoison" then
					killer = killer or {}
					killer.Name = game.CurrentRun.ModsNikkelMHadesBiomesStyxPoisonLastInflictedBy
				end
			end
		end

		triggerArgs.AttackerTable = killer
	end

	return base(victim, triggerArgs)
end)

-- This must be the same as the wrap for HubPostBountyLoad, which is called instead of DeathAreaRoomTransition when returning from a Chaos Trial
modutil.mod.Path.Wrap("DeathAreaRoomTransition", function(base, source, args)
	-- Reset the modified game objects when returning to the Crossroads
	mod.ApplyGlobalGameObjectModifications(false)
	-- Load the portraits package immediately for a less laggy transition when opening the run history screen
	LoadPackages({ Name = "ModsNikkelMHadesBiomesPortraits" })
	-- Load our new cosmetics
	LoadPackages({ Name = "NikkelM-HadesBiomesCosmetics" })

	return base(source, args)
end)

-- If returning from a Chaos Trial, this will be called instead of DeathAreaRoomTransition
modutil.mod.Path.Wrap("HubPostBountyLoad", function(base, source, args)
	-- Reset the modified game objects when returning to the Crossroads
	mod.ApplyGlobalGameObjectModifications(false)
	-- Load the portraits package immediately for a less laggy transition when opening the run history screen
	LoadPackages({ Name = "ModsNikkelMHadesBiomesPortraits" })
	-- Load our new cosmetics
	LoadPackages({ Name = "NikkelM-HadesBiomesCosmetics" })

	return base(source, args)
end)
