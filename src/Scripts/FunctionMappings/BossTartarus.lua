function game.MultiFuryIntro(eventSource, args)
	print("MultiFuryIntro")
	local boss = game.ActiveEnemies[args.BossId]
	for k, supportAIName in pairs(boss.SupportAINames) do
		local obstacleName = "MultiFury" .. supportAIName .. "Intro"
		SetAnimation({
			DestinationIds = GetIdsByType({ Name = obstacleName }),
			Name = ObstacleData[obstacleName]
					.ExitAnimation
		})
		game.wait(0.3)
	end
end

function game.MultiFuryActivations(eventSource, args)
	local boss = game.ActiveEnemies[args.BossId]
	boss.MultiFuryObstacleIds = {}

	for k, supportAIName in pairs(boss.SupportAINames) do
		Activate({ Id = args.ObstacleIds[supportAIName] })
		boss.MultiFuryObstacleIds[supportAIName] = args.ObstacleIds[supportAIName]
	end
end

function game.SelectHarpySupportAIs(enemy, currentRun)
	local shrineLevel = GetNumMetaUpgrades( enemy.ShrineMetaUpgradeName )

	enemy.SupportAINames = enemy.SupportAINames or {}

	if shrineLevel > 0 then
		local supportCount = RandomInt(1, 2)
		if game.TextLinesRecord.FurySistersUnion01 == nil then
			supportCount = 2
		end
		for i=1, supportCount, 1 do
			local supportAIName = RemoveRandomValue(enemy.SupportAIWeaponSetOptions) or "Alecto"
			table.insert(enemy.SupportAINames, supportAIName)
			currentRun.SupportAINames[supportAIName] = true
		end
	end
end

function game.HarpyKillPresentation(unit, args)
	print("HarpyKillPresentation")
	DebugPrint({ Text = "Harpy Kill Presentation: " })

	if CurrentRun.CurrentRoom.Encounter and CurrentRun.CurrentRoom.Encounter.StartTime then
		CurrentRun.CurrentRoom.Encounter.ClearTime = _worldTime - CurrentRun.CurrentRoom.Encounter.StartTime
	end

	local allBossesDead = true
	if CurrentRun.CurrentRoom.Encounter.HoldKillPresentationForUnitDeaths ~= nil then
		for k, unitName in pairs(CurrentRun.CurrentRoom.Encounter.HoldKillPresentationForUnitDeaths) do
			if unitName ~= unit.Name then
				local unitId = GetClosestUnitOfType({ Id = unit.ObjectId, DestinationName = unitName })
				if game.ActiveEnemies[unitId] ~= nil and IsAlive({ Id = unitId }) then
					allBossesDead = false
				end
			end
		end
	end

	if not allBossesDead then
		LastKillPresentation(unit)
		return
	end

	CurrentRun.CurrentRoom.Encounter.BossKillPresentation = true
	local killerId = CurrentRun.Hero.ObjectId
	local victimId = unit.ObjectId
	local deathPanSettings = args
	ClearEffect({ Ids = { victimId, killerId }, All = true, BlockAll = true, })
	if unit.Frozen then
		UnfrozenPresentation(unit, { SkipPresentation = true })
	end
	-- Stop an active call - not applicable - or is there an alternative for Hexes?
	-- StopSuper()
	SetUnitInvulnerable(unit)


	if unit.DeathFx ~= nil then
		CreateAnimation({ Name = unit.DeathFx, DestinationId = unit.ObjectId, Angle = args.ImpactAngle })
		unit.DeathFx = nil
	end
	if unit.DeathAnimation ~= nil then
		SetAnimation({ Name = unit.DeathAnimation, DestinationId = unit.ObjectId })
		unit.DeathAnimation = nil
	end
	if unit.DeathSound ~= nil then
		PlaySound({ Name = unit.DeathSound, Id = unit.ObjectId })
		unit.DeathSound = nil
	end
	if unit.BossKillVoiceLines ~= nil then
		thread(PlayVoiceLines, unit.BossKillVoiceLines, false, unit)
	end

	CancelWeaponFireRequests({ Id = unit.ObjectId })
	BlockProjectileSpawns({ ExcludeWeaponName = "WeaponLob" })
	ExpireProjectiles({ ExcludeNames = WeaponSets.ExpireProjectileExcludeProjectileNames, BlockSpawns = true })
	-- BlockProjectileSpawns({ ExcludeProjectileName = "SpearWeaponThrow" })
	-- ExpireProjectiles({ Names = { "DionysusLobProjectile", "LightRangedWeapon", "DusaFreezeShotNonHoming", "HarpyBeam", "HydraLavaSpit", "HarpyWhipShot", "HarpyWhipShotRage", "TheseusSpearThrow", "ShieldThrow" }, BlockSpawns = true })
	if CurrentRun.CurrentRoom.DestroyAssistUnitOnEncounterEndId then
		local assistUnit = ActiveEnemies[CurrentRun.CurrentRoom.DestroyAssistUnitOnEncounterEndId]
		if assistUnit ~= nil then
			killTaggedThreads(assistUnit.AIThreadName)
			killWaitUntilThreads(assistUnit.AINotifyName)
		end
	end

	SetPlayerInvulnerable("HarpyKillPresentation")
	SetThingProperty({ Property = "AllowAnyFire", Value = false, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
	EndRamWeapons({ Id = killerId })

	AddInputBlock({ Name = "HarpyKillPresentation" })
	if args.AddInterBiomeTimerBlock then
		AddTimerBlock(CurrentRun, "InterBiome")
	end
	AddTimerBlock(CurrentRun, "HarpyKillPresentation")
	SetConfigOption({ Name = "UseOcclusion", Value = false })
	SetVulnerable({ Id = victimId })
	ClearCameraClamp({ LerpTime = 0 })
	local cameraPanTime = 1.5
	if deathPanSettings.StartPanTime then
		cameraPanTime = deathPanSettings.StartPanTime
	end
	PanCamera({ Id = victimId, Duration = cameraPanTime })
	FocusCamera({ Fraction = 1.1, Duration = cameraPanTime })
	ZeroMouseTether("HarpyKillPresentation")
	ToggleCombatControl(CombatControlsDefaults, false, "BossKill")
	-- DisableCombatControls()
	HideCombatUI("BossKill")

	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAscended" })

	if IsScreenOpen("Codex") then
		CloseCodexScreen()
	end

	if ActiveScreens.TraitTrayScreen ~= nil then
		TraitTrayScreenClose(ActiveScreens.TraitTrayScreen)
	end
	-- if IsScreenOpen("TraitTrayScreen") then
	-- 	CloseAdvancedTooltipScreen()
	-- end

	if deathPanSettings.StartSound then
		PlaySound({ Name = deathPanSettings.StartSound })
	else
		PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteShocked" })
	end
	SetMusicSection(10, MusicId)

	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 0.0, DataValue = false, DestinationId = killerId })
	SetThingProperty({ Property = "Grip", Value = 99999, DestinationId = victimId })
	thread(VictimDeathHold, victimId, 0.02, 0.5)
	if deathPanSettings.FlashRed then
		Flash({ Id = victimId, Speed = 0.01, MinFraction = 1.0, MaxFraction = 1.0, Color = Color.Red, Duration = 0.5, ExpireAfterCycle = true })
	end

	RemoveFromGroup({ Id = killerId, Names = { "Standing" } })
	AddToGroup({ Id = killerId, Name = "Combat_Menu", DrawGroup = true })
	RemoveFromGroup({ Id = victimId, Name = "Standing" })
	AddToGroup({ Id = victimId, Name = "Combat_Menu", DrawGroup = true })

	if deathPanSettings.EndAngle then
		SetGoalAngle({ Id = victimId, Angle = deathPanSettings.EndAngle })
	end

	-- black out world
	AdjustFrame({ Color = Color.TransparentRed, Duration = 0.0, Fraction = 0 })
	ScreenAnchors.DeathBackground = ScreenAnchors.DeathBackground or
			CreateScreenObstacle({ Name = "rectangle01", Group = "Combat_UI", X = ScreenCenterX, Y = ScreenCenterY })
	SetScale({ Id = ScreenAnchors.DeathBackground, Fraction = 10 })
	SetColor({ Id = ScreenAnchors.DeathBackground, Color = Color.Black })
	SetAlpha({ Id = ScreenAnchors.DeathBackground, Fraction = 1.0, Duration = 0 })

	thread(DoRumble,
		{ { ScreenPreWait = 0.04, RightFraction = 0.17, Duration = 0.65 }, { ScreenPreWait = 2.8, LeftFraction = 0.3, Duration = 0.6 } })

	Flash({ Id = victimId, Speed = 0.02, MinFraction = 1.0, MaxFraction = 1.0, Color = Color.Red, Duration = 1.55, ExpireAfterCycle = true })
	-- thread(BossDeathFlash, 0.52, 0.3)

	wait(0.15)
	SetAlpha({ Id = killerId, Fraction = 0, Duration = 0.3 })
	ClearEffect({ Id = killerId, Name = "KillDamageBonus" })

	wait(cameraPanTime)

	-- hydra-specific
	local textMessage = deathPanSettings.Message
	if deathPanSettings.AltMessage and SpeechRecord["/VO/ZagreusField_3147"] then
		textMessage = deathPanSettings.AltMessage
	end

	if deathPanSettings.BossDifficultyMessage and GetNumShrineUpgrades("BossDifficultyShrineUpgrade") > 0 then
		textMessage = deathPanSettings.BossDifficultyMessage
	end
	-- if deathPanSettings.BossDifficultyMessage and GetNumMetaUpgrades("BossDifficultyShrineUpgrade") > 0 then
	-- 	textMessage = deathPanSettings.BossDifficultyMessage
	-- end

	thread(DisplayLocationText, nil,
		{
			Text = textMessage or "BiomeClearedMessage",
			Delay = args.MessageDelay or 0.95,
			Color = Color.White,
			FadeColor = Color.LocationTextGold,
			Layer = args.MessageLayer,
			Duration = args.MessageDuration,
			AnimationName = "LocationTextBGVictoryIn",
			AnimationOutName = "LocationTextBGVictoryOut",
			FontScale = 0.85
		})

	if deathPanSettings.BatsAfterDeath then
		thread(SendCritters,
			{
				MinCount = 80,
				MaxCount = 90,
				StartX = 0,
				StartY = 300,
				MinAngle = 75,
				MaxAngle = 115,
				MinSpeed = 400,
				MaxSpeed = 2000,
				MinInterval = 0.03,
				MaxInterval = 0.1,
				GroupName =
				"CrazyDeathBats"
			})
	end

	if deathPanSettings.EndPanTime then
		wait(deathPanSettings.EndPanTime)
	else
		wait(5.5)
	end

	SetAlpha({ Id = ScreenAnchors.DeathBackground, Fraction = 0.0, Duration = 0.3 })

	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, AllProjectiles = true })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, DestinationId = killerId })
	SetAlpha({ Id = killerId, Fraction = 1.00, Duration = 0.3 })
	RemoveFromGroup({ Id = killerId, Names = { "Combat_Menu" } })
	AddToGroup({ Id = killerId, Name = "Standing", DrawGroup = true })

	PanCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 3.0, EaseOut = 0.5 })
	local defaultZoom = 1.0
	if CurrentDeathAreaRoom ~= nil then
		defaultZoom = CurrentDeathAreaRoom.ZoomFraction or defaultZoom
	else
		defaultZoom = CurrentRun.CurrentRoom.ZoomFraction or defaultZoom
	end
	FocusCamera({ Fraction = defaultZoom, Duration = 3.0, ZoomType = "Ease" })

	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFadeLOCATION" })
	SetVolume({ Id = MusicId, Value = 1, Duration = 0.5 })

	wait(1.0)
	-- TODO - Needed? (from Hades II)
	-- SetAnimation({ DestinationId = killerId, Name = "MelinoeEquip" })
	RemoveInputBlock({ Name = "HarpyKillPresentation" })
	RemoveTimerBlock(CurrentRun, "HarpyKillPresentation")
	SetConfigOption({ Name = "UseOcclusion", Value = true })
	SetPlayerVulnerable("HarpyKillPresentation")
	ShowCombatUI("BossKill")
	ClearEffect({ Ids = { killerId }, All = true })

	CurrentRun.CurrentRoom.Encounter.BossKillPresentation = false
	ToggleCombatControl(CombatControlsDefaults, true, "BossKill")
	-- EnableCombatControls()
	SetThingProperty({ Property = "AllowAnyFire", Value = true, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
end
