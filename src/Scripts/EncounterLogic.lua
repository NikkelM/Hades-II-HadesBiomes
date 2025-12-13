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
			(GetNumShrineUpgrades(modifierName) * currentEncounter.EnemyCountShineModifierAmount))
	end

	return enemyCap
end)

modutil.mod.Path.Wrap("OnAllEnemiesDead", function(base, currentRoom, currentEncounter)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		ClearEffect({ Id = CurrentRun.Hero.ObjectId, Name = "MedeaPoison" })
	end

	return base(currentRoom, currentEncounter)
end)

-- For ShadeNaked spawns
modutil.mod.Path.Wrap("GetActiveEnemyCount", function(base, encounter)
	return base(encounter) + (game.MapState.PlaceholderEnemyCount or 0)
end)
