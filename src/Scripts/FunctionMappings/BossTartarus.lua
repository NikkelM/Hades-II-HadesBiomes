function game.MultiFuryIntro(eventSource, args)
	local boss = game.ActiveEnemies[args.BossId]
	for k, supportAIName in pairs(boss.SupportAINames) do
		local obstacleName = "MultiFury" .. supportAIName .. "Intro"
		SetAnimation({
			DestinationIds = GetIdsByType({ Name = obstacleName }),
			Name = game.ObstacleData[obstacleName].ExitAnimation
		})
		game.wait(0.3)
	end
end

function game.SelectHarpySupportAIs(enemy)
	local shrineLevel = game.GetNumShrineUpgrades(enemy.ShrineMetaUpgradeName)
	enemy.SupportAINames = enemy.SupportAINames or {}

	if shrineLevel > 0 then
		local supportCount = game.RandomInt(1, 2)
		if game.GameState.TextLinesRecord.FurySistersUnion01 == nil then
			supportCount = 2
		end
		for i = 1, supportCount, 1 do
			local supportAIName = game.RemoveRandomValue(enemy.SupportAIWeaponSetOptions) or "Alecto"
			table.insert(enemy.SupportAINames, supportAIName)
			game.CurrentRun.SupportAINames[supportAIName] = true
		end
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

function game.HarpySupportAI(enemy)
	-- Wake up delay
	if enemy.WakeUpDelayMin ~= nil and enemy.WakeUpDelayMax ~= nil then
		enemy.WakeUpDelay = game.RandomFloat(enemy.WakeUpDelayMin, enemy.WakeUpDelayMax)
	end
	if enemy.WakeUpDelay then
		game.wait(game.CalcEnemyWait(enemy, enemy.WakeUpDelay), enemy.AIThreadName)
	end

	while game.ActiveEnemies[enemy.ObjectId] ~= nil do
		local supportAIWeaponSetName = game.GetRandomValue(enemy.SupportAINames)
		local weaponName = game.GetRandomValue(enemy.SupportAIWeaponOptions[supportAIWeaponSetName])
		if weaponName ~= nil then
			local weaponData = WeaponData[weaponName]
			local weaponAIData = game.ShallowCopyTable(enemy.DefaultAIData) or enemy
			if weaponData ~= nil then
				if weaponData.AIData ~= nil then
					game.OverwriteTableKeys(weaponAIData, weaponData.AIData)
				else
					game.OverwriteTableKeys(weaponAIData, weaponData)
				end
			end
			weaponAIData.WeaponName = weaponName

			local targetId = SpawnObstacle({
				Name = "BlankObstacle",
				Group = "Scripting",
				DestinationId = game.GetTargetId(enemy, weaponAIData)
			})

			Teleport({ Id = enemy.ObjectId, DestinationId = targetId })
			game.DoAttack(enemy, weaponAIData)
			if weaponAIData.ForcedEarlyExit then
				SetAnimation({ DestinationId = enemy.ObjectId, Name = supportAIWeaponSetName .. "MultiFurySkyDiveFadeOut" })
			end
			Destroy({ Id = targetId })
		end

		local attackRate = enemy.AttackRate or game.RandomFloat(enemy.AttackRateMin, enemy.AttackRateMax)
		game.wait(game.CalcEnemyWait(enemy, attackRate), enemy.AIThreadName)
	end
end

function game.HarpyKillPresentation(unit, args)
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
		game.LastKillPresentation(unit)
		return
	end

	CurrentRun.CurrentRoom.Encounter.BossKillPresentation = true
	local killerId = CurrentRun.Hero.ObjectId
	local victimId = unit.ObjectId
	local deathPanSettings = args
	ClearEffect({ Ids = { victimId, killerId }, All = true, BlockAll = true, })
	if unit.Frozen then
		game.UnfrozenPresentation(unit, { SkipPresentation = true })
	end
	-- Stops an active call - not applicable - or is there an alternative for Hexes?
	-- StopSuper()
	game.SetUnitInvulnerable(unit)


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
		game.thread(PlayVoiceLines, unit.BossKillVoiceLines, false, unit)
	end

	CancelWeaponFireRequests({ Id = unit.ObjectId })
	BlockProjectileSpawns({ ExcludeWeaponName = "WeaponLob" })
	ExpireProjectiles({ ExcludeNames = WeaponSets.ExpireProjectileExcludeProjectileNames, BlockSpawns = true })
	-- BlockProjectileSpawns({ ExcludeProjectileName = "SpearWeaponThrow" })
	-- ExpireProjectiles({ Names = { "DionysusLobProjectile", "LightRangedWeapon", "DusaFreezeShotNonHoming", "HarpyBeam", "HydraLavaSpit", "HarpyWhipShot", "HarpyWhipShotRage", "TheseusSpearThrow", "ShieldThrow" }, BlockSpawns = true })
	if CurrentRun.CurrentRoom.DestroyAssistUnitOnEncounterEndId then
		local assistUnit = game.ActiveEnemies[CurrentRun.CurrentRoom.DestroyAssistUnitOnEncounterEndId]
		if assistUnit ~= nil then
			game.killTaggedThreads(assistUnit.AIThreadName)
			game.killWaitUntilThreads(assistUnit.AINotifyName)
		end
	end

	game.SetPlayerInvulnerable("HarpyKillPresentation")
	SetThingProperty({ Property = "AllowAnyFire", Value = false, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
	EndRamWeapons({ Id = killerId })

	AddInputBlock({ Name = "HarpyKillPresentation" })
	if args.AddInterBiomeTimerBlock then
		game.AddTimerBlock(CurrentRun, "InterBiome")
	end
	game.AddTimerBlock(CurrentRun, "HarpyKillPresentation")
	SetConfigOption({ Name = "UseOcclusion", Value = false })
	SetVulnerable({ Id = victimId })
	ClearCameraClamp({ LerpTime = 0 })
	local cameraPanTime = 1.5
	if deathPanSettings.StartPanTime then
		cameraPanTime = deathPanSettings.StartPanTime
	end
	PanCamera({ Id = victimId, Duration = cameraPanTime })
	FocusCamera({ Fraction = 1.1, Duration = cameraPanTime })
	game.ZeroMouseTether("HarpyKillPresentation")
	game.ToggleCombatControl(CombatControlsDefaults, false, "BossKill")
	-- DisableCombatControls()
	game.HideCombatUI("BossKill")

	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAscended" })

	if game.IsScreenOpen("Codex") then
		game.CloseCodexScreen()
	end

	if game.ActiveScreens.TraitTrayScreen ~= nil then
		game.TraitTrayScreenClose(ActiveScreens.TraitTrayScreen)
	end
	-- if IsScreenOpen("TraitTrayScreen") then
	-- 	CloseAdvancedTooltipScreen()
	-- end

	if deathPanSettings.StartSound then
		PlaySound({ Name = deathPanSettings.StartSound })
	else
		PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteShocked" })
	end
	game.SetMusicSection(10, game.MusicId)

	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 0.0, DataValue = false, DestinationId = killerId })
	SetThingProperty({ Property = "Grip", Value = 99999, DestinationId = victimId })
	game.thread(game.VictimDeathHold, victimId, 0.02, 0.5)
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
	game.ScreenAnchors.DeathBackground = game.ScreenAnchors.DeathBackground or
			game.CreateScreenObstacle({ Name = "rectangle01", Group = "Combat_UI", X = ScreenCenterX, Y = ScreenCenterY })
	SetScale({ Id = game.ScreenAnchors.DeathBackground, Fraction = 10 })
	SetColor({ Id = game.ScreenAnchors.DeathBackground, Color = Color.Black })
	SetAlpha({ Id = game.ScreenAnchors.DeathBackground, Fraction = 1.0, Duration = 0 })

	game.thread(game.DoRumble,
		{ { ScreenPreWait = 0.04, RightFraction = 0.17, Duration = 0.65 }, { ScreenPreWait = 2.8, LeftFraction = 0.3, Duration = 0.6 } })

	Flash({ Id = victimId, Speed = 0.02, MinFraction = 1.0, MaxFraction = 1.0, Color = Color.Red, Duration = 1.55, ExpireAfterCycle = true })
	-- thread(BossDeathFlash, 0.52, 0.3)

	game.wait(0.15)
	SetAlpha({ Id = killerId, Fraction = 0, Duration = 0.3 })
	ClearEffect({ Id = killerId, Name = "KillDamageBonus" })

	game.wait(cameraPanTime)

	-- hydra-specific
	local textMessage = deathPanSettings.Message
	if deathPanSettings.AltMessage and game.GameState.SpeechRecord["/VO/ZagreusField_3147"] then
		textMessage = deathPanSettings.AltMessage
	end

	if deathPanSettings.BossDifficultyMessage and game.GetNumShrineUpgrades("BossDifficultyShrineUpgrade") > 0 then
		textMessage = deathPanSettings.BossDifficultyMessage
	end

	game.thread(DisplayInfoBanner, nil,
		{
			Text = textMessage or "BiomeClearedMessage",
			Delay = args.MessageDelay or 0.95,
			Color = Color.White,
			FadeColor = Color.LocationTextGold,
			Layer = args.MessageLayer,
			Duration = args.MessageDuration,
			AnimationName = "LocationTextBGVictoryIn",
			AnimationOutName = "LocationTextBGVictoryOut",
			FontScale = 0.85,
			TextOffsetY = 0,
		})

	if deathPanSettings.BatsAfterDeath then
		game.thread(SendCritters,
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

	game.SetUnitVulnerable(unit)

	if deathPanSettings.EndPanTime then
		game.wait(deathPanSettings.EndPanTime)
	else
		game.wait(5.5)
	end

	SetAlpha({ Id = game.ScreenAnchors.DeathBackground, Fraction = 0.0, Duration = 0.3 })

	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, AllProjectiles = true })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, DestinationId = killerId })
	SetAlpha({ Id = killerId, Fraction = 1.00, Duration = 0.3 })
	RemoveFromGroup({ Id = killerId, Names = { "Combat_Menu" } })
	AddToGroup({ Id = killerId, Name = "Standing", DrawGroup = true })

	PanCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 3.0, EaseOut = 0.5 })
	-- local defaultZoom = 1.0
	-- if game.CurrentDeathAreaRoom ~= nil then
	-- 	defaultZoom = game.CurrentDeathAreaRoom.ZoomFraction or defaultZoom
	-- else
	-- 	defaultZoom = CurrentRun.CurrentRoom.ZoomFraction or defaultZoom
	-- end
	FocusCamera({ Fraction = CurrentRun.CurrentRoom.ZoomFraction or 1.0, Duration = 3.0, ZoomType = "Ease" })

	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFadeLOCATION" })
	SetVolume({ Id = game.MusicId, Value = 1, Duration = 0.5 })

	game.wait(1.0)
	RemoveInputBlock({ Name = "HarpyKillPresentation" })
	RemoveTimerBlock(CurrentRun, "HarpyKillPresentation")
	SetConfigOption({ Name = "UseOcclusion", Value = true })
	game.SetPlayerVulnerable("HarpyKillPresentation")
	game.ShowCombatUI("BossKill")
	ClearEffect({ Ids = { killerId }, All = true })

	CurrentRun.CurrentRoom.Encounter.BossKillPresentation = false
	game.ToggleCombatControl(CombatControlsDefaults, true, "BossKill")
	-- EnableCombatControls()
	SetThingProperty({ Property = "AllowAnyFire", Value = true, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
end

function game.HarpyBuildRage(enemy, weaponAIData, currentRun)
	if enemy.Enraged or IsInvulnerable({ Id = enemy.ObjectId }) then
		return
	end

	ShakeScreen({ Speed = 300, Distance = 3, FalloffSpeed = 2000, Duration = 1.0 })
	Flash({ Id = game.ScreenAnchors.BossRageFill, Speed = 3.0, MinFraction = 0, MaxFraction = 0.8, Color = Color.Yellow })

	local hitsTaken = 0

	for tick = 1, weaponAIData.BuildRageTicks, 1 do
		if enemy.RageHit then
			enemy.RageHit = nil
			hitsTaken = hitsTaken + 1
		end

		if hitsTaken >= 3 then
			if weaponAIData.EarlyBreakAnimation ~= nil then
				SetAnimation({ Id = enemy.ObjectId, Name = weaponAIData.EarlyBreakAnimation })
			end
			-- To stop the dumb fire from continuing after the early break
			enemy.HarpyBuildRageEarlyExit = true
			StopFlashing({ Id = game.ScreenAnchors.BossRageFill })
			game.wait(game.CalcEnemyWait(enemy, weaponAIData.EarlyBreakStunDuration), enemy.AIThreadName)
			enemy.HarpyBuildRageEarlyExit = false
			return
		end

		local meterAmount = 0.01
		game.BuildRageMeter(currentRun, meterAmount, enemy)
		if enemy.Enraged or IsInvulnerable({ Id = enemy.ObjectId }) then
			enemy.HarpyBuildRageEarlyExit = true
			if not enemy.Enraged then
				StopFlashing({ Id = game.ScreenAnchors.BossRageFill })
			end
			if weaponAIData.BuildRageEndAnimation ~= nil then
				SetAnimation({ Id = enemy.ObjectId, Name = weaponAIData.BuildRageEndAnimation })
			end
			game.wait(game.CalcEnemyWait(enemy, weaponAIData.BuildRageEndDuration), enemy.AIThreadName)
			enemy.HarpyBuildRageEarlyExit = false
			return
		end
		game.wait(game.CalcEnemyWait(enemy, weaponAIData.BuildRageTicksInterval), enemy.AIThreadName)
	end
	enemy.HarpyBuildRageEarlyExit = true
	if weaponAIData.BuildRageEndAnimation ~= nil then
		SetAnimation({ Id = enemy.ObjectId, Name = weaponAIData.BuildRageEndAnimation })
	end
	StopFlashing({ Id = game.ScreenAnchors.BossRageFill })
	game.wait(game.CalcEnemyWait(enemy, weaponAIData.BuildRageEndDuration), enemy.AIThreadName)
	enemy.HarpyBuildRageEarlyExit = false
end

function game.BuildRageMeter(currentRun, meterAmount, enemy)
	if enemy.Enraged then
		return
	end

	local screenId = game.ScreenAnchors.BossRageFill
	enemy.RageFraction = enemy.RageFraction or 0

	enemy.RageFraction = enemy.RageFraction + meterAmount
	enemy.LastRageGainTime = _worldTime
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 1 - enemy.RageFraction, DestinationId = screenId })
	if enemy.RageFraction >= 1 then
		enemy.RageFraction = 0
		thread(game.EnrageUnit, enemy)
	end
end

function game.HandleHarpyRage(enemy, currentRun)
	if game.ScreenAnchors.BossRageFill == nil then
		game.CreateBossRageMeter(enemy)
	end
	local screenId = game.ScreenAnchors.BossRageFill
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 1.0, DestinationId = screenId })
	enemy.RageFraction = enemy.RageFraction or 0

	local rageDecayInterval = 1.0
	local rageDecayRate = enemy.RageDecayRate or 0.01

	while not enemy.IsDead and not enemy.PermanentEnraged do
		game.wait(rageDecayInterval)
		if enemy.RageFraction > 0 and _worldTime - enemy.LastRageGainTime > enemy.RageDecayStartDuration then
			enemy.RageFraction = enemy.RageFraction - rageDecayRate
			SetAnimationFrameTarget({
				Name = "EnemyHealthBarFillBoss",
				Fraction = 1 - enemy.RageFraction,
				DestinationId = screenId
			})
		end
	end
end

function game.CreateBossRageMeter(boss)
	game.ScreenAnchors.BossRageTitle = CreateScreenObstacle({
		Name = "BlankObstacle",
		Group = "Combat_UI",
		X = ScreenCenterX,
		Y = 130,
		Scale = 1.0
	})
	game.ScreenAnchors.BossRageBack = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", X = ScreenCenterX, Y = 150, Scale = 0.5 })
	game.ScreenAnchors.BossRageFill = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Combat_UI", X = ScreenCenterX, Y = 152, Scale = 0.5 })

	CreateTextBox({
		Id = game.ScreenAnchors.BossRageTitle,
		Text = "RageMeter",
		Font = "LatoBold",
		FontSize = 14,
		ShadowRed = 0,
		ShadowBlue = 0,
		ShadowGreen = 0,
		OutlineColor = { 0, 0, 0, 1 },
		OutlineThickness = 2,
		ShadowAlpha = 1.0,
		ShadowBlur = 0,
		ShadowOffsetY = 3,
		ShadowOffsetX = 0,
		Justification = "Center"
	})
	SetAlpha({ Id = game.ScreenAnchors.BossRageTitle, Fraction = 0.01, Duration = 0.0 })
	SetAlpha({ Id = game.ScreenAnchors.BossRageTitle, Fraction = 1, Duration = 2.0 })

	SetAnimation({ Name = "EnemyHealthBarBoss", DestinationId = game.ScreenAnchors.BossRageBack })
	SetAlpha({ Id = game.ScreenAnchors.BossRageBack, Fraction = 0.01, Duration = 0.0 })
	SetAlpha({ Id = game.ScreenAnchors.BossRageBack, Fraction = 1, Duration = 2.0 })

	boss.RageBarFill = "EnemyHealthBarFillBoss"
	SetAnimation({ Name = "EnemyHealthBarFillBoss", DestinationId = game.ScreenAnchors.BossRageFill })
	SetAnimationFrameTarget({ Name = "EnemyHealthBarFillBoss", Fraction = 1, DestinationId = game.screenId })
	SetAlpha({ Id = game.ScreenAnchors.BossRageFill, Fraction = 0.01, Duration = 0.0 })
	SetAlpha({ Id = game.ScreenAnchors.BossRageFill, Fraction = 1, Duration = 2.0 })
end

function game.EnrageHarpyPermanent(enemy, currentRun)
	enemy.Enraged = true
	enemy.PermanentEnraged = true
	SetAnimationFrameTarget({
		Name = "EnemyHealthBarFillBoss",
		Fraction = 0.0,
		DestinationId = game.ScreenAnchors.BossRageFill
	})
	EnrageUnit(enemy)
end

function game.HarpyEnragedPresentation(enemy, currentRun)
	local screenId = ScreenAnchors.BossRageFill

	if enemy.PermanentEnraged then
		game.thread(game.InCombatText, enemy.ObjectId, "Combat_PermanentEnraged", 1)
	else
		game.thread(game.InCombatText, enemy.ObjectId, "Combat_Enraged", 1)
	end

	AdjustColorGrading({ Name = "AlectoRage", Duration = 0.5 })
	ShakeScreen({ Speed = 600, Distance = 6, FalloffSpeed = 2000, Duration = 1.0 })
	Flash({ Id = screenId, Speed = 2.0, MinFraction = 0, MaxFraction = 0.8, Color = Color.Purple })

	if enemy.RageFullVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, enemy.RageFullVoiceLines, nil, enemy)
	end
	if enemy.RageFullSound ~= nil then
		PlaySound({ Name = enemy.RageFullSound })
	end

	if not enemy.PermanentEnraged then
		game.thread(game.DrainHarpyRageMeter, enemy, game.CurrentRun, enemy.EnragedDuration)
	end
end

function game.DrainHarpyRageMeter(enemy, currentRun, duration)
	local tickDuration = duration * 0.01

	local fraction = 0.00
	for tick = 1, 100 do
		if enemy.PermanentEnraged then
			return
		end
		fraction = fraction + 0.01
		SetAnimationFrameTarget({
			Name = "EnemyHealthBarFillBoss",
			Fraction = fraction,
			DestinationId = ScreenAnchors.BossRageFill
		})
		game.wait(tickDuration, RoomThreadName)
	end
end

function game.Harpy3MapTransition(enemy, currentRun)
	local currentRoom = currentRun.CurrentRoom
	currentRoom.InStageTransition = true

	if currentRoom.Name ~= "A_Boss03" then
		return
	end

	AdjustColorGrading({ Name = "Team02", Duration = 0.5 })

	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteDepressed" })
	PlaySound({ Name = "/Leftovers/World Sounds/ThunderHuge" })
	ShakeScreen({ Speed = 1000, Distance = 10, FalloffSpeed = 2000, Duration = 1.5 })
	FocusCamera({ Fraction = 0.97, ZoomType = "Ease", Duration = 2.5 })
	--PanCamera({ Id =  enemy.ObjectId, Duration = 4.0 })

	AdjustRadialBlurDistance({ Fraction = 2.0, Duration = 2.0 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 2.0 })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.04, RightFraction = 0.17, Duration = 1.5 } })
	game.thread(game.Harpy3MapRubbleFall)

	for k, simData in ipairs(game.CurrentRun.Hero.FinalHitSlowParameters) do
		if simData.Fraction < 1.0 then
			game.AddSimSpeedChange("Harpy3MapTransition", { Fraction = simData.Fraction, LerpTime = simData.LerpTime })
		else
			game.RemoveSimSpeedChange("Harpy3MapTransition", { LerpTime = simData.LerpTime })
		end
	end

	ExpireProjectiles({ ExcludeNames = WeaponSets.MapTransitionExpireProjectileExcludeNames })
	game.wait(0.75)

	ExpireProjectiles({ ExcludeNames = WeaponSets.MapTransitionExpireProjectileExcludeNames })
	AddInputBlock({ Name = "Harpy3MapTransition" })
	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })
	game.FullScreenFadeOutAnimation()

	game.wait(0.4)

	FocusCamera({ Fraction = currentRoom.ZoomFraction, Duration = 0.02 })

	if enemy.MapTransitionReactionVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, enemy.MapTransitionReactionVoiceLines, nil, enemy)
	end

	PlaySound({ Name = "/SFX/A_Boss03_RoomTransitionSFX" })
	game.wait(0.3)
	Teleport({ Id = currentRun.Hero.ObjectId, DestinationId = 40012 })
	Teleport({ Id = enemy.ObjectId, DestinationId = 410021 })
	-- Skelly Summon
	local skellyId = GetIdsByType({ Name = "TrainingMeleeSummon" })
	Teleport({ Id = skellyId, DestinationId = 520857 })
	-- Dusa Summon
	local dusaId = GetIdsByType({ Name = "DusaSummon" })
	Teleport({ Id = dusaId, DestinationId = 520857 })

	local activateObstacles = {}
	local deactivateObstacles = {}

	if currentRoom.CurrentPhase == nil then
		currentRoom.CurrentPhase = 2
	end

	if currentRoom.CurrentPhase == 1 then
		--activateObstacles = GetInactiveIds({ Name = "Phase2Add" })
		--deactivateObstacles = GetIds({ Name = "Phase2Remove" })
	elseif currentRoom.CurrentPhase == 2 then
		activateObstacles = game.CombineTables(GetInactiveIds({ Name = "Phase3Add" }), GetInactiveIds({ Name = "Phase2Add" })) or
				{}
		deactivateObstacles = game.CombineTables(GetIds({ Name = "Phase3Remove" }), GetIds({ Name = "Phase2Remove" })) or {}
	elseif currentRoom.CurrentPhase == 3 then
		activateObstacles = GetInactiveIds({ Name = "Phase4Add" }) or {}
		deactivateObstacles = GetIds({ Name = "Phase4Remove" }) or {}
	else
		DebugPrint({ Text = "Harpy 3: No more phases" })
	end

	for k, id in pairs(activateObstacles) do
		Activate({ Id = id })
	end

	for k, id in pairs(deactivateObstacles) do
		SetAlpha({ Id = id, Fraction = 0.0, Duration = 1.5 })
	end

	currentRoom.CurrentPhase = currentRoom.CurrentPhase + 1
	if currentRoom.CurrentPhase ~= nil then
		game.thread(game.Harpy3MapReturnSmoke, currentRoom.CurrentPhase)
	end
	game.wait(0.1)

	local ammoIds = GetIdsByType({ Name = "AmmoPack" })
	SetObstacleProperty({ Property = "Magnetism", Value = 3000, DestinationIds = ammoIds })
	SetObstacleProperty({
		Property = "MagnetismSpeedMax",
		Value = currentRun.Hero.LeaveRoomAmmoMangetismSpeed,
		DestinationIds = ammoIds
	})
	StopAnimation({ DestinationIds = ammoIds, Name = "AmmoReturnTimer" })

	RemoveInputBlock({ Name = "Harpy3MapTransition" })
	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })
	game.FullScreenFadeInAnimation()
	ShakeScreen({ Speed = 300, Distance = 3, FalloffSpeed = 1000, Duration = 0.65 })
	AdjustRadialBlurDistance({ Fraction = 0.0, Duration = 1.4 })
	AdjustRadialBlurStrength({ Fraction = 0.0, Duration = 1.4 })

	game.wait(1.3)

	AdjustColorGrading({ Name = "Off", Duration = 0.45 })
	currentRoom.InStageTransition = false
end

function game.Harpy3MapRubbleFall()
	local rubbleLimit = 15
	for index = 1, rubbleLimit, 1 do
		local offsetX = game.RandomFloat(-400, 400)
		local offsetY = game.RandomFloat(-400, 400)
		local targetId = SpawnObstacle({
			Name = "BlankObstacle",
			DestinationId = game.CurrentRun.Hero.ObjectId,
			OffsetX = offsetX,
			OffsetY =
					offsetY
		})
		FireWeaponFromUnit({ Weapon = "RubbleFall", Id = game.CurrentRun.Hero.ObjectId, DestinationId = targetId, FireFromTarget = true })
		local rubbleWait = game.RandomFloat(0.06, 0.12)
		game.wait(rubbleWait)
	end
end

function game.Harpy3MapReturnSmoke(currentPhase)
	local phaseSmokeObstacles = {
		[3] = { 519116, 520677, 519118, 518995, 519033, 519037, 519220, 519970, 519010, 519097, 519039, 519074, 519123, 519124, 520676, 519126, 520128, 519020, 519104, 519052, 519082, 511073 },
		[4] = { 518874, 518857, 518880, 518890, 518896, 518902, 518906, 518910, 518914, 520866, 520862, 518948, 518870, 520872, 518894, 518892, 520866, 518864, 518885, 518862 },
	}
	if currentPhase == nil then
		return
	end
	DebugPrint({ Text = tostring(currentPhase) })
	game.wait(0.1)
	local smokeTable = phaseSmokeObstacles[currentPhase]
	if smokeTable ~= nil then
		for k, obstacleId in pairs(smokeTable) do
			local randomScale = game.RandomFloat(0.8, 1.2)
			CreateAnimation({
				Name = "SmokeTrapLoopDissipate",
				DestinationId = obstacleId,
				Group = "FX_Standing_Top",
				Scale = randomScale
			})
		end
	end
end
