-- Sets the actual spawn point as the point the head returns to before attacking (only needed while Tethers do not work)
function mod.ModsNikkelMHadesBiomesRememberHydraSpawnpoint(encounter, args)
	local activeHydraHeadIds = encounter.ActiveSpawns or {}
	for id, _ in pairs(activeHydraHeadIds) do
		local hydraHead = game.ActiveEnemies[id]
		if hydraHead ~= nil then
			hydraHead.DefaultAIData.MoveToId = hydraHead.OccupyingSpawnPointId
			hydraHead.DefaultAIData.MoveToClosestId = nil
		end
	end
end

modutil.mod.Path.Wrap("CalculateActiveEnemyCap", function(base, currentRun, currentRoom, currentEncounter)
	local enemyCap = base(currentRun, currentRoom, currentEncounter)

	if currentEncounter.EnemyCountShrineModifierName then
		local modifierName = currentEncounter.EnemyCountShrineModifierName
		enemyCap = math.floor(enemyCap +
			(game.GetNumShrineUpgrades(modifierName) * currentEncounter.EnemyCountShineModifierAmount))
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

-- For ShadeNaked spawns
modutil.mod.Path.Wrap("GetActiveEnemyCount", function(base, encounter)
	return base(encounter) + (game.MapState.PlaceholderEnemyCount or 0)
end)
