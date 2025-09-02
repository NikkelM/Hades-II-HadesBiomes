-- Lock the escape chaos gate if the shrine upgrade does not allow starting a run yet
function mod.ModsNikkelMHadesBiomesUpdateEscapeDoorForLimitGraspShrineUpgrade(source, args)
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
			StopAnimation({ Names = { "ChaosDoorOpen", "ChaosDoorFloor" }, DestinationId = escapeDoor.ObjectId })
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
		local moddedEscapeDoorId = nil
		for _, obstacle in pairs(game.MapState.ActiveObstacles) do
			if obstacle.ModsNikkelMHadesBiomesIsRunStartDoor then
				moddedEscapeDoorId = obstacle.ObjectId
				break
			end
		end
		if moddedEscapeDoorId == nil then
			return
		end

		mod.ModsNikkelMHadesBiomesUpdateEscapeDoorForLimitGraspShrineUpgrade(nil, { EscapeDoorIds = { moddedEscapeDoorId } })
	end
	base(source, args)
end)

modutil.mod.Path.Wrap("StartNewRunPresentation", function(base, runDoor, args)
	if runDoor.ModsNikkelMHadesBiomesIsRunStartDoor == true then
		-- Same as in the base game, but without the dash weapon firing
		LockCamera({ Id = runDoor.ObjectId, Duration = 1.3, Retarget = true })
		SetAngle({
			Id = game.CurrentRun.Hero.ObjectId,
			Angle = GetAngleBetween({
				Id = game.CurrentRun.Hero.ObjectId,
				DestinationId = args.DashTarget or runDoor.ObjectId
			}),
			CompleteAngle = true
		})
		if game.MapState.FamiliarUnit ~= nil then
			local familiar = game.MapState.FamiliarUnit
			if familiar.StartNewRunFunctionName ~= nil then
				game.thread(game.CallFunctionName, familiar.StartNewRunFunctionName, familiar, args)
			else
				SetAnimation({ DestinationId = familiar.ObjectId, Name = familiar.StartNewRunAnimation })
			end
		end
		SetUnitProperty({ DestinationId = game.CurrentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
		SetUnitProperty({ DestinationId = game.CurrentRun.Hero.ObjectId, Property = "CollideWithUnits", Value = false })
		game.SetFixedDashPresentationValues()
		-- FireWeaponFromUnit({ Weapon = "WeaponBlink", Id = CurrentRun.Hero.ObjectId })
		game.thread(game.PlayVoiceLines,
			game.GlobalVoiceLines[args.GlobalVoiceLines] or game.GlobalVoiceLines.StartNewRunVoiceLines)
		game.wait(0.1)
		FadeOut({ Duration = 0.3, Color = game.Color.Black })
		game.EndMusic(game.AudioState.MusicId, game.AudioState.MusicName, 0.5)
		game.EndAmbience(0.5)
		game.wait(0.3)
		game.EndFixedDashPresentationValues()
	else
		base(runDoor, args)
	end
end)
