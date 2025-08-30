function game.ExitToHadesPresentation(currentRun, exitDoor)
	local exitDoorId = exitDoor.ObjectId
	AddInputBlock({ Name = "ExitToHadesPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })
	game.EndMusic()
	game.HideCombatUI("ExitToHadesPresentation")
	AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = exitDoorId })
	SetAnimation({ Name = "ZagreusInteractEquip", DestinationId = currentRun.Hero.ObjectId })
	ClearCameraClamp({ LerpTIme = 0.4 })
	game.wait(0.3)
	PlaySound({ Name = "/SFX/Menu Sounds/WeaponUnlockBoom", Id = exitDoorId })
	ShakeScreen({ Speed = 500, Distance = 4, FalloffSpeed = 1000, Duration = 0.3, Delay = 0.45 })

	if exitDoor ~= nil then
		if exitDoor.AdditionalIcons ~= nil and not game.IsEmpty(exitDoor.AdditionalIcons) then
			Destroy({ Ids = exitDoor.AdditionalIcons })
			exitDoor.AdditionalIcons = nil
		end
		game.DestroyDoorRewardPresenation(exitDoor)
		if exitDoor.ExitDoorOpenAnimation ~= nil then
			SetAnimation({ DestinationId = exitDoorId, Name = exitDoor.ExitDoorOpenAnimation })
			game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.4 }, })
			game.wait(0.5)
		end
	end

	OutdoorAmbientSoundId = PlaySound({ Name = "/Leftovers/Ambience/WhippingWindLoop" })
	SetVolume({ Id = OutdoorAmbientSoundId, Value = 0.1 })
	SetVolume({ Id = OutdoorAmbientSoundId, Value = 1.0, Duration = 8 })

	game.LeaveRoomAudio(currentRun, exitDoor)

	local cameraId = SpawnObstacle({
		Name = "InvisibleTarget",
		DestinationId = exitDoorId,
		OffsetY = -700,
		OffsetX = 600,
		Group = "Standing"
	})

	LockCamera({ Id = cameraId, EaseIn = 0.04, EaseOut = 0.275, Duration = 10 })
	game.wait(1.75)
	FadeOut({ Color = game.Color.White, Duration = 2 })
	game.wait(1.0)

	SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "MelinoeWalk", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 110, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
	local heroExitIds = GetIdsByType({ Name = "HeroExit" })
	local heroExitPointId = GetClosest({ Id = currentRun.Hero.ObjectId, DestinationIds = heroExitIds, Distance = 600 })
	game.thread(game.MoveHeroToRoomPosition, { DestinationId = heroExitPointId })
	game.wait(4.0)

	-- Makes a sound and can be seen, so not doing it, since we do the bright fade
	-- game.FullScreenFadeOutAnimation()
	-- ShowInterMapComponents()
	-- AllowShout = false
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	RemoveInputBlock({ Name = "ExitToHadesPresentation" })
	game.UnblockCombatUI("ExitToHadesPresentation")
end

function game.RoomEntranceHades(currentRun, currentRoom)
	local hadesId = 510857
	if currentRoom.Encounter.Name == "BossHadesPeaceful" then
		hadesId = 552710
	end

	game.HideCombatUI("BossEntrance")
	game.ZeroMouseTether("BossEntrance")
	local roomIntroSequenceDuration = currentRoom.IntroSequenceDuration or game.RoomData.BaseRoom.IntroSequenceDuration or
			0.0

	FadeOut({ Color = game.Color.White, Duration = 0 })
	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
	AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay = 0 })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.03, Delay = 0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 5.0, Delay = 0.1 })

	SetVolume({ Id = OutdoorAmbientSoundId, Value = 0.0, Duration = 5 })
	OutdoorAmbientSoundId = nil
	game.wait(0.03)

	AdjustZoom({ Fraction = currentRun.CurrentRoom.IntroZoomFraction or 0.7, Duration = 0.0 })
	FadeIn({ Duration = 5.5 })
	LockCamera({ Id = hadesId, Duration = roomIntroSequenceDuration })
	-- Makes a sound and can be seen, so not doing it, since we do the bright fade
	-- game.FullScreenFadeInAnimation()
	AdjustColorGrading({ Name = "Rain", Duration = 0 })
	AdjustColorGrading({ Name = "Off", Duration = 4 })
	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
	local initialSpeed = GetUnitDataValue({ Id = currentRun.Hero.ObjectId, Property = "Speed" })
	SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
	SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "MelinoeWalk", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 130, DestinationId = currentRun.Hero.ObjectId })

	game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
	-- TODO
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true)

	if currentRoom.HeroEndPoint ~= nil then
		Move({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint, Mode = "Precise" })
		local notifyName = "WithinDistance" .. currentRoom.HeroEndPoint
		NotifyWithinDistance({
			Id = currentRun.Hero.ObjectId,
			DestinationId = currentRoom.HeroEndPoint,
			Distance = 80,
			Notify = notifyName
		})
		game.waitUntil(notifyName)
		-- Slight extra wait to account for the withinDistance not being very precise
		game.wait(0.3)
	end
	Stop({ Id = currentRun.Hero.ObjectId })

	SetUnitProperty({ Property = "StartGraphic", Value = "MelinoeStart", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "MelinoeRun", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = "MelinoeStop", DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = initialSpeed, DestinationId = currentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = currentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })
	game.wait(0.3)
	game.UnzeroMouseTether("BossEntrance")
	game.UnblockCombatUI("BossEntrance")
end

function game.BossIntroHades(eventSource, args)
	if eventSource.Encounter.Name == "BossHadesPeaceful" then
		args.ProcessTextLinesIds = { 552710 }
		args.UnlockDelay = 0.0
		args.SetupBossIds = nil
		args.ResetRoomZoom = nil
		eventSource.SpawnRewardDelay = 1.32
	end

	if game.GameState.TextLinesRecord["HadesAllowsLegendaryKeepsakes01"] ~= nil then
		eventSource.BlockHadesAssistTraits = false
	else
		eventSource.BlockHadesAssistTraits = true
	end

	game.ModsNikkelMHadesBiomesBossIntro(eventSource, args)

	if eventSource.Encounter.Name == "BossHadesPeaceful" then
		game.CurrentRun.ActiveBiomeTimer = false
	end
end

-- TODO: Stop Hexes
function game.HadesPhaseTransition(boss, currentRun, aiStage)
	-- TODO: Called very late?
	boss.InTransition = true
	if boss.IsInvisible then
		boss.IsInvisible = false

		SetLifeProperty({ DestinationId = boss.ObjectId, Property = "InvulnerableFx", Value = "Invincibubble_Hades" })
		SetAlpha({ Id = boss.ObjectId, Fraction = 1.0 })
	end

	Stop({ Id = boss.ObjectId })
	-- if game.CurrentRun.Hero.SuperActive then
	-- StopSuper()
	-- 	if CurrentRun.Hero.CurrentSuperMeterDecrement then
	-- 		local decrement = CurrentRun.Hero.SuperMeterDecrement or 0
	-- 		CurrentRun.Hero.SuperMeter = CurrentRun.Hero.SuperMeter -
	-- 				(decrement - CurrentRun.Hero.CurrentSuperMeterDecrement)
	-- 	end
	-- 	CurrentRun.Hero.CurrentSuperMeterDecrement = CurrentRun.Hero.SuperMeterDecrement
	-- 	UpdateSuperMeterUI()
	-- end

	game.SetPlayerInvulnerable("HadesPhaseTransition")
	-- ClearStoredAmmoHero()
	game.DestroyHadesFightObstacles()
	game.DestroyRequiredKills({ BlockLoot = true, SkipIds = { boss.ObjectId }, BlockDeathWeapons = true })
	ExpireProjectiles({ Names = { "HadesCast", "HadesAmmoDrop", "HadesAmmoWeapon", "GraspingHands", "HadesTombstoneSpawn", "HadesCastBeam", "HadesCastBeamNoTracking" }, ExcludeNames = { "HadesCerberusAssist" } })
	Destroy({ Ids = GetIdsByType({ Name = "HadesBidentReturnPoint" }) })
	SetAnimation({ Name = "HadesBattleKnockDown", DestinationId = boss.ObjectId })
	SetGoalAngle({ Id = boss.ObjectId, Angle = 270 })
	game.ClearShadeWeapons()
	game.thread(game.LastKillPresentation, boss)

	local ammoIds = GetIdsByType({ Name = "AmmoPack" })
	SetObstacleProperty({ Property = "Magnetism", Value = 3000, DestinationIds = ammoIds })
	SetObstacleProperty({
		Property = "MagnetismSpeedMax",
		Value = currentRun.Hero.LeaveRoomAmmoMangetismSpeed,
		DestinationIds = ammoIds
	})
	StopAnimation({ DestinationIds = ammoIds, Name = "AmmoReturnTimer" })

	game.thread(game.PlayVoiceLines, boss.PhaseEndedVoiceLines, nil, boss)

	game.SetMusicSection(1)

	game.wait(1.25, boss.AIThreadName)

	game.ProcessTextLines(boss.BossPresentationNextStageTextLineSets)
	game.ProcessTextLines(boss.BossPresentationNextStageRepeatableTextLineSets)

	if game.GameState.TextLinesRecord["HadesR1FirstWin"] then
		game.wait(0.5, game.RoomThreadName)
	else
		game.wait(2.0, game.RoomThreadName)
	end

	if not game.PlayRandomRemainingTextLines(boss, boss.BossPresentationNextStageTextLineSets) then
		game.PlayRandomRemainingTextLines(boss, boss.BossPresentationNextStageRepeatableTextLineSets)
	end

	game.wait(1.0, boss.AIThreadName)

	game.SetMusicSection(2)
	if boss.CurrentPhase == 2 then
		-- TODO
		SetSoundCueValue({ Names = { "Duel" }, Id = game.AudioState.MusicId, Value = 1 })
	end

	game.thread(game.PlayVoiceLines, boss.NextPhaseVoiceLines, nil, boss)

	if boss.CurrentPhase == 2 then
		game.thread(game.HadesBattleKnockDownPreRecoverPresentation, boss)
	else
		SetAnimation({ Name = "HadesBattleKnockDownRecover", DestinationId = boss.ObjectId })
	end
	if boss.CurrentPhase == 1 and boss.Phase2ActivateGroups ~= nil then
		Activate({ Names = boss.Phase2ActivateGroups })
		SetAlpha({ Ids = GetIds({ Names = boss.Phase2ActivateGroups }), Fraction = 0.0 })
		SetAlpha({ Ids = GetIds({ Names = boss.Phase2ActivateGroups }), Fraction = 1.0, Duration = 0.3 })
	end
	if boss.CurrentPhase == 1 and boss.Phase2DeactivateGroups ~= nil then
		SetAlpha({ Ids = GetIds({ Names = boss.Phase2DeactivateGroups }), Fraction = 0.0, Duration = 0.3 })
	end
	if boss.CurrentPhase == 2 and boss.Phase3ActivateGroups ~= nil then
		Activate({ Names = boss.Phase3ActivateGroups })
		SetAlpha({ Ids = GetIds({ Names = boss.Phase3ActivateGroups }), Fraction = 0.0 })
		SetAlpha({ Ids = GetIds({ Names = boss.Phase3ActivateGroups }), Fraction = 1.0, Duration = 0.3 })
	end
	if boss.CurrentPhase == 2 and boss.Phase3DeactivateGroups ~= nil then
		SetAlpha({ Ids = GetIds({ Names = boss.Phase3DeactivateGroups }), Fraction = 0.0, Duration = 0.3 })
	end

	boss.Health = boss.MaxHealth
	if aiStage.SetHealthPercent ~= nil then
		boss.Health = boss.Health * aiStage.SetHealthPercent
	end
	game.BossHealthBarPresentation(boss)

	game.wait(0.65, boss.AIThreadName)

	game.SetPlayerVulnerable("HadesPhaseTransition")
	FireWeaponFromUnit({ Id = boss.ObjectId, Weapon = "HadesRubbleClear", DestinationId = game.CurrentRun.Hero.ObjectId, AutoEquip = true })

	-- Fire passive weapons
	if aiStage.DumbFireWeapons ~= nil then
		for k, weaponName in pairs(aiStage.DumbFireWeapons) do
			local weaponData = game.WeaponData[weaponName].AIData or game.WeaponData[weaponName]
			weaponData.Name = weaponName
			game.thread(game.DumbFireAttack, boss, currentRun, weaponData)
		end
	end

	if boss.CurrentPhase == 1 and boss.Phase2VFX ~= nil then
		CreateAnimation({ Name = boss.Phase2VFX, DestinationId = boss.ObjectId })
	end

	if boss.CurrentPhase == 2 then
		SetAlpha({ Ids = GetIds({ Name = "Terrain_Lighting_01" }), Fraction = 0, Duration = 1.0 })
		game.WeaponData.HadesConsumeHeal.AIData.MaxUses = 4
		Destroy({ Ids = GetIdsByType({ Name = "HadesBidentReturnPoint" }) })
	end

	boss.CurrentPhase = boss.CurrentPhase + 1
	game.SetUnitVulnerable(boss)
	game.wait(0.5, boss.AIThreadName)
	boss.InTransition = false
end

function game.HadesKillPresentation(unit, args)
	DebugPrint({ Text = "Hades Kill Presentation: " })
	unit.InTransition = true
	game.CurrentRun.CurrentRoom.Encounter.BossKillPresentation = true
	local killerId = game.CurrentRun.Hero.ObjectId
	local victimId = unit.ObjectId
	local deathPanSettings = args
	ClearEffect({ Ids = { victimId, killerId }, All = true, BlockAll = true, })
	-- StopSuper()
	-- ClearStoredAmmoHero()
	game.DestroyHadesFightObstacles()
	ExpireProjectiles({ Names = { "HadesCast", "HadesAmmoDrop", "HadesAmmoWeapon", "GraspingHands", "HadesTombstoneSpawn", "HadesCastBeam", "HadesCastBeamNoTracking" } })
	Destroy({ Ids = GetIdsByType({ Name = "HadesBidentReturnPoint" }) })
	StopAnimation({ DestinationId = game.CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessVignetteHold" })
	SetAlpha({ Ids = GetIds({ Name = "Terrain_Lighting_01" }), Fraction = 1.0, Duration = 1.0 })

	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	-- I think these are for the Zagreus Cast
	local ammoIds = GetIdsByType({ Name = "AmmoPack" })
	SetObstacleProperty({ Property = "Magnetism", Value = 3000, DestinationIds = ammoIds })
	SetObstacleProperty({
		Property = "MagnetismSpeedMax",
		Value = CurrentRun.Hero.LeaveRoomAmmoMangetismSpeed,
		DestinationIds = ammoIds
	})
	StopAnimation({ DestinationIds = ammoIds, Name = "AmmoReturnTimer" })
	game.SetUnitInvulnerable(unit)

	game.thread(game.LastKillPresentation, unit)
	game.SetPlayerInvulnerable("HadesKillPresentation")
	AddInputBlock({ Name = "HadesKillPresentation" })
	game.AddTimerBlock(game.CurrentRun, "HadesKillPresentation")
	EndRamWeapons({ Id = killerId })

	if game.IsScreenOpen("Codex") then
		game.CloseCodexScreen()
	end

	if game.IsScreenOpen("TraitTrayScreen") then
		game.TraitTrayScreenClose(game.ActiveScreens.TraitTrayScreen, nil, { IgnoreHUDShow = true })
	end

	game.SetMusicSection(3)

	Stop({ Id = unit.ObjectId })
	SetAnimation({ Name = "HadesBattleKnockDownTwo", DestinationId = unit.ObjectId })
	AngleTowardTarget({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = unit.ObjectId })

	if unit.Phase2ActivateGroups ~= nil then
		SetAlpha({ Ids = GetIds({ Names = unit.Phase2ActivateGroups }), Fraction = 0.0, Duration = 0.3 })
	end
	if unit.Phase2DeactivateGroups ~= nil then
		SetAlpha({ Ids = GetIds({ Names = unit.Phase2DeactivateGroups }), Fraction = 1.0, Duration = 0.3 })
	end

	if unit.Phase2VFX ~= nil then
		StopAnimation({ Name = unit.Phase2VFX, DestinationId = unit.ObjectId })
	end

	if unit.DefeatedSound ~= nil then
		PlaySound({ Name = unit.DefeatedSound, Id = unit.ObjectId })
	end
	game.thread(game.PlayVoiceLines, unit.DefeatedVoiceLines, true, unit)

	if game .. GameState.TextLinesRecord["LordHadesFirstDefeat"] then
		wait(2.8, game.RoomThreadName)
	else
		wait(4.0, game.RoomThreadName)
	end

	game.ProcessTextLines(unit.BossPresentationOutroTextLineSets)
	game.ProcessTextLines(unit.BossPresentationOutroRepeatableTextLineSets)

	if not game.PlayRandomRemainingTextLines(unit, unit.BossPresentationOutroTextLineSets) then
		game.PlayRandomRemainingTextLines(unit, unit.BossPresentationOutroRepeatableTextLineSets)
	end

	game.SetMusicSection(10)
	-- ZeroSuperMeter()
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	game.HarpyKillPresentation(unit, args)
	game.wait(1.0, game.RoomThreadName)
	RemoveInputBlock({ Name = "HadesKillPresentation" })
	-- TODO: Show Modded screen
	-- ShowRunClearScreen()
	game.CurrentRun.ActiveBiomeTimer = false
	game.CurrentRun.CurrentRoom.Encounter.BossKillPresentation = false
	game.thread(game.CheckQuestStatus, { Silent = true })
end

function game.ClearShadeWeapons()
	local weaponIds = GetIdsByType({ Names = game.EnemyData.ShadeNaked.AIPickupType })
	Destroy({ Ids = weaponIds })
end

function game.HadesBattleKnockDownPreRecoverPresentation(boss)
	SetAnimation({ Name = "HadesBattleKnockDown_PreRecover", DestinationId = boss.ObjectId })
	game.wait(0.25)
	ShakeScreen({ Speed = 600, Distance = 2, Duration = 0.8, FalloffSpeed = 2000 })
end

function game.DestroyHadesFightObstacles()
	for k, enemy in pairs(game.ActiveEnemies) do
		if enemy.Name == "HadesAmmo" or enemy.Name == "HadesTombstone" then
			SetUnitProperty({ Property = "OnDeathWeapon", Value = "null", DestinationId = enemy.ObjectId })
			game.thread(game.Kill, enemy)
		end
	end
end

function game.CheckRunEndPresentation(currentRun, door)
	AddInputBlock({ Name = "CheckRunEndPresentation" })
	if game.GameState.TextLinesRecord["Ending01"] ~= nil then
		currentRun.CurrentRoom.SkipLoadNextMap = true
	-- TODO: Check?
		game.EndEarlyAccessPresentation()
	else
		local heroExitPointId = GetClosest({ Id = door.ObjectId, DestinationIds = GetIdsByType({ Name = "HeroExit" }), Distance = 600 })
		game.thread(game.MoveHeroToRoomPosition,
			{ DestinationId = heroExitPointId, DisableCollision = true, UseDefaultSpeed = true })
		game.FullScreenFadeOutAnimation()
		if game.GameState.TextLinesRecord["LordHadesBeforePersephoneReturn01"] ~= nil then
			-- TODO
			game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.BossHadesPeacefulExitVoiceLines)
		end
		game.wait(3.5)
	end
	RemoveInputBlock({ Name = "CheckRunEndPresentation" })
end

function game.SetupHadesSpawnOptions(enemy)
	local enemySetPrefix = "EnemiesHades"
	-- If the BossDifficultShrine is at EM4, use the harder enemies
	if game.GetNumShrineUpgrades(enemy.ShrineMetaUpgradeName) >= 4 then
		enemySetPrefix = "EnemiesHadesEM"
	end
	enemy.SpawnOptions = {}
	local spawnOptionsLarge = game.EnemySets[enemySetPrefix .. "Large"]
	local spawnOptionsSmall = game.EnemySets[enemySetPrefix .. "Small"]
	table.insert(enemy.SpawnOptions, game.GetRandomValue(spawnOptionsLarge))
	table.insert(enemy.SpawnOptions, game.GetRandomValue(spawnOptionsSmall))
	table.insert(enemy.SpawnOptions, game.GetRandomValue(spawnOptionsSmall))
end
