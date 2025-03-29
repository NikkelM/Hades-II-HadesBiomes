-- Sets the actual spawn point as the point the head returns to before attacking (only needed while Tethers do not work)
function game.ModsNikkelMHadesBiomesRememberHydraSpawnpoint(encounter, args)
	local activeHydraHeadIds = encounter.ActiveSpawns or {}
	for id, _ in pairs(activeHydraHeadIds) do
		local hydraHead = game.ActiveEnemies[id]
		if hydraHead ~= nil then
			hydraHead.DefaultAIData.MoveToId = hydraHead.OccupyingSpawnPointId
			hydraHead.DefaultAIData.MoveToClosestId = nil
		end
	end
end
