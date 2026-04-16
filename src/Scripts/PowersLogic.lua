modutil.mod.Path.Wrap("PreDamageBoss", function(base, enemy, damageAmount, damageData)
	-- To prevent Hades from being invisible/invulnerable during this, reducing the delay
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and enemy ~= nil and enemy.Name == "Hades" then
		damageData.Delay = 2.2
	end

	return base(enemy, damageAmount, damageData)
end)

modutil.mod.Path.Wrap("AttachCastAtLocation", function(base, triggerArgs)
	-- To prevent the launched Cast from the Hades boon from sticking to CrusherUnit enemies
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and triggerArgs ~= nil and triggerArgs.TriggeredByTable ~= nil and game.GetGenusName(triggerArgs.TriggeredByTable) == "CrusherUnit" then
		local enemyLocation = GetLocation({ Id = triggerArgs.triggeredById }) or {}
		triggerArgs.LocationX = enemyLocation.X or triggerArgs.LocationX
		triggerArgs.LocationY = enemyLocation.Y or triggerArgs.LocationY
		triggerArgs.triggeredById = nil
		triggerArgs.TriggeredByTable = nil
	end

	return base(triggerArgs)
end)

modutil.mod.Path.Wrap("HadesInvisibility", function(base)
	-- Hades reaction voicelines
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.ModsNikkelMHadesBiomes_HadesInvisibilityReactionVoiceLines)

	return base()
end)

-- Same as vanilla, but for the modded assist unit from Orpheus' God of the Dead boon
function mod.CleanupOrpheusRaiseDeadEncounter(currentRoom)
	local assistUnit = game.ActiveEnemies[currentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId]
	local expireProjectiles = {}
	local destroyDelay = 0.1
	for projectileId, enemyId in pairs(game.SessionMapState.ProjectileSpawnRecord) do
		if enemyId == currentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId then
			table.insert(expireProjectiles, projectileId)
		end
	end

	ExpireProjectiles({ ProjectileIds = expireProjectiles })
	local destroyUnits = {}
	for unitId, unit in pairs(game.ShallowCopyTable(game.ActiveEnemies) or {}) do
		if unit.SpawnedById == currentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId then
			table.insert(destroyUnits, unit)
			if unit.DestroyDelay then
				destroyDelay = math.max(destroyDelay, unit.DestroyDelay + 0.1)
			end
		end
	end
	for _, unit in pairs(destroyUnits) do
		game.thread(game.Kill, unit)
	end
	if assistUnit then
		game.thread(game.Kill, assistUnit)
		if assistUnit.DestroyDelay then
			destroyDelay = math.max(destroyDelay, assistUnit.DestroyDelay + 0.1)
		end
	end
	game.wait(destroyDelay, game.RoomThreadName)
	currentRoom.ModsNikkelMHadesBiomes_DestroyAssistUnitOnEncounterEndId = nil
	currentRoom.ModsNikkelMHadesBiomes_AssistUnitName = nil
	game.MapState.OrpheusRaiseDeadCount = nil
end
