modutil.mod.Path.Wrap("CalculateActiveEnemyCap", function(base, currentRun, currentRoom, currentEncounter)
	local enemyCap = base(currentRun, currentRoom, currentEncounter)

	if currentEncounter.EnemyCountShrineModifierName then
		local modifierName = currentEncounter.EnemyCountShrineModifierName
		enemyCap = math.floor(enemyCap +
			(game.GetNumShrineUpgrades(modifierName) * currentEncounter.EnemyCountShineModifierAmount))
	end

	if game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId then
		local assistUnit = game.ActiveEnemies
				[game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId]
		if assistUnit and not assistUnit.IsDead then
			local activeCapWeight = assistUnit.ActiveCapWeight or 1
			enemyCap = enemyCap + activeCapWeight
		end
	end

	return enemyCap
end)

modutil.mod.Path.Wrap("OnAllEnemiesDead", function(base, currentRoom, currentEncounter)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		ClearEffect({ Id = game.CurrentRun.Hero.ObjectId, Name = "MedeaPoison" })
	end

	base(currentRoom, currentEncounter)

	local encounterData = game.EncounterData[currentEncounter.Name] or currentEncounter
	if encounterData.SkipOnAllEnemiesDeadCleanup then
		return
	end

	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if currentEncounter.EncounterType == "PerfectClear" then
			game.thread(game.HadesSpeakingPresentation, currentRoom,
				{
					VoiceLines = { GlobalVoiceLines = "PerfectClearEncounterClearedVoiceLines" },
					ColorGrade = "PerfectClear",
					SubtitleColor = game.Color.HadesVoice,
					LineHistoryName = "Hades"
				})
		end
	end
end)

modutil.mod.Path.Wrap("GetActiveEnemyCount", function(base, encounter)
	local enemyCount = base(encounter)

	-- For ShadeNaked
	enemyCount = enemyCount + (game.MapState.PlaceholderEnemyCount or 0)

	if game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId then
		local assistUnit = game.ActiveEnemies
				[game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId]
		if assistUnit and not assistUnit.IsDead then
			local activeCapWeight = assistUnit.ActiveCapWeight or 1
			enemyCount = enemyCount + activeCapWeight
		end
	end

	return enemyCount
end)

modutil.mod.Path.Wrap("GetEncounterActiveEnemyCount", function(base, encounter)
	local enemyCount = base(encounter)

	if game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId then
		local assistUnit = game.ActiveEnemies
				[game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId]
		if assistUnit and not assistUnit.IsDead then
			local activeCapWeight = assistUnit.ActiveCapWeight or 1
			enemyCount = enemyCount + activeCapWeight
		end
	end

	return enemyCount
end)
