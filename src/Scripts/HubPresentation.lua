-- Lock the escape chaos gate if the shrine upgrade does not allow starting a run yet
function game.ModsNikkelMHadesBiomesUpdateEscapeDoorForLimitGraspShrineUpgrade(source, args)
	args = args or {}

	local shouldLock = false
	if game.GetNumShrineUpgrades("LimitGraspShrineUpgrade") >= 1 then
		local graspPercent = (game.GameState.MetaUpgradeCostCache / game.GameState.MaxMetaUpgradeCostCache) * 100
		if graspPercent > game.MetaUpgradeData.LimitGraspShrineUpgrade.ChangeValue then
			shouldLock = true
		end
	end

	args.EscapeDoorIds = args.EscapeDoorIds or { source.ObjectId }
	local escapeDoorId = args.EscapeDoorIds[1]
	local escapeDoor = game.MapState.ActiveObstacles[escapeDoorId]
	if escapeDoor ~= nil then
		if shouldLock then
			escapeDoor.UseText = "LimitGraspShrineUpgradeEscapeDoorClosed"
			escapeDoor.OnUsedFunctionName = "LimitGraspShrineUpgradeEscapeDoorClosed"
			StopAnimation({  Names = { "ChaosDoorOpen", "ChaosDoorFloor" }, DestinationId = escapeDoor.ObjectId })
			SetAnimation({ DestinationId = escapeDoor.ObjectId, Name = "SecretDoor_Closed" })
		else
			escapeDoor.UseText = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText"
			escapeDoor.OnUsedFunctionName = _PLUGIN.guid .. "." .. "StartHadesRun"
			SetAnimation({ DestinationId = escapeDoor.ObjectId, Name = "ModsNikkelMHadesBiomes_SecretDoor_Revealed" })
		end
	end
end

modutil.mod.Path.Wrap("UpdateEscapeDoorForLimitGraspShrineUpgrade", function(base, source, args)
	args = args or {}
	if args.EscapeDoorIds ~= nil then
		game.ModsNikkelMHadesBiomesUpdateEscapeDoorForLimitGraspShrineUpgrade(nil, { EscapeDoorIds = { 2000043 } })
	end
	base(source, args)
end)
