function mod.ExitToHadesPresentation(currentRun, exitDoor)
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

	game.AudioState.RainSoundId = PlaySound({ Name = "/Leftovers/Ambience/WhippingWindLoop" })
	SetVolume({ Id = game.AudioState.RainSoundId, Value = 0.1 })
	SetVolume({ Id = game.AudioState.RainSoundId, Value = 1.0, Duration = 8 })

	game.LeaveRoomAudio(currentRun, exitDoor)
	game.EndMusic(game.AudioState.MusicId, game.AudioState.MusicName, 0)

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

function mod.RoomEntranceHades(currentRun, currentRoom)
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

	-- Replacing OutdoorAmbientSoundId with AudioState.RainSoundId
	SetVolume({ Id = game.AudioState.RainSoundId, Value = 0.0, Duration = 5 })
	game.AudioState.RainSoundId = nil
	game.wait(0.03)

	AdjustZoom({ Fraction = currentRun.CurrentRoom.IntroZoomFraction or 0.7, Duration = 0.0 })
	FadeIn({ Duration = 5.5 })
	LockCamera({ Id = hadesId, Duration = roomIntroSequenceDuration })

	AdjustColorGrading({ Name = "Rain", Duration = 0 })
	AdjustColorGrading({ Name = "Off", Duration = 4 })
	AddInputBlock({ Name = "MoveHeroToRoomPosition" })

	game.SessionMapState.WeaponsDisabled = true
	SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
	game.SetupMelWalk()

	game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true)

	if currentRoom.HeroEndPoint ~= nil then
		Move({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint, Mode = "Precise" })
		local notifyName = "WithinDistance" .. currentRoom.HeroEndPoint
		NotifyWithinDistance({
			Id = currentRun.Hero.ObjectId,
			DestinationId = currentRoom.HeroEndPoint,
			Distance = 110,
			Notify = notifyName
		})
		game.waitUntil(notifyName)
		-- So the weapon equip animation isn't seen
		game.wait(0.1)
		SetUnitProperty({ Property = "Speed", Value = 50, DestinationId = currentRun.Hero.ObjectId })
		game.wait(0.5)
	end
	Stop({ Id = currentRun.Hero.ObjectId })

	game.RestoreMelRun(currentRun.Hero, { SkipWalkStopAnimation = true })
	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = currentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })
	game.wait(0.3)
	game.UnzeroMouseTether("BossEntrance")
	game.UnblockCombatUI("BossEntrance")
end

function mod.BossIntroHades(eventSource, args)
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

	mod.ModsNikkelMHadesBiomesBossIntro(eventSource, args)
	-- Custom: To re-enable weapons disabled in RoomEntranceHades
	game.SessionMapState.WeaponsDisabled = false
	for i, rushWeaponName in pairs(game.WeaponSets.HeroRushWeapons) do
		SetWeaponProperty({ WeaponName = rushWeaponName, DestinationId = game.CurrentRun.Hero.ObjectId, Property = "Enabled", Value = true })
	end

	if eventSource.Encounter.Name == "BossHadesPeaceful" then
		game.CurrentRun.ActiveBiomeTimer = false
	end
end

function mod.StartFinalBossRoomIntroMusic()
	-- "/Music/BossFightMusic"
	game.MusicPlayer("{fe196260-d08d-4a07-802d-6dfda39efa2e}")
	game.SetMusicSection(8, game.AudioState.MusicId)
end

function mod.StartFinalBossRoomMusic()
	-- "/Music/BossFightMusic"
	game.MusicPlayer("{fe196260-d08d-4a07-802d-6dfda39efa2e}")
	game.SetMusicSection(0, game.AudioState.MusicId)
end

function mod.ClearShadeWeapons()
	local weaponIds = GetIdsByType({ Names = game.EnemyData.ShadeNaked.AIPickupTypes })
	Destroy({ Ids = weaponIds })
end

function mod.HadesBattleKnockDownPreRecoverPresentation(boss)
	SetAnimation({ Name = "HadesBattleKnockDown_PreRecover", DestinationId = boss.ObjectId })
	game.wait(0.25)
	ShakeScreen({ Speed = 600, Distance = 2, Duration = 0.8, FalloffSpeed = 2000 })
end

function mod.DestroyHadesFightObstacles()
	for k, enemy in pairs(game.ActiveEnemies) do
		if enemy.Name == "HadesAmmo" or enemy.Name == "HadesTombstone" or enemy.Name == "ModsNikkelMHadesBiomesHadesTombstone" then
			enemy.OnDeathFunctionName = nil
			SetUnitProperty({ Property = "OnDeathWeapon", Value = "null", DestinationId = enemy.ObjectId })
			game.thread(game.Kill, enemy)
		end
	end
end

function mod.HadesPhaseTransition(boss, currentRun, aiStage)
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

	-- To prevent shades from spawning ShadeNaked
	game.MapState.BlockRespawns = true
	game.MapState.BlockSpawns = true
	mod.ClearStoredAmmoHero()
	mod.DestroyHadesFightObstacles()
	game.DestroyRequiredKills({ BlockLoot = true, SkipIds = { boss.ObjectId }, BlockDeathWeapons = true })
	ExpireProjectiles({ Names = { "HadesCast", "HadesAmmoDrop", "HadesAmmoWeapon", "GraspingHands", "HadesTombstoneSpawn", "HadesCastBeam", "HadesCastBeamNoTracking", "HadesBidentThrow" }, ExcludeNames = { "HadesCerberusAssist" } })
	Destroy({ Ids = GetIdsByType({ Name = "HadesBidentReturnPoint" }) })

	SetAnimation({ Name = "HadesBattleKnockDown", DestinationId = boss.ObjectId })
	SetGoalAngle({ Id = boss.ObjectId, Angle = 270 })
	mod.ClearShadeWeapons()
	game.thread(game.LastKillPresentation, boss)

	local ammoIds = GetIdsByType({ Name = "LobAmmoPack" })
	SetObstacleProperty({ Property = "Magnetism", Value = 3000, DestinationIds = ammoIds })
	SetObstacleProperty({
		Property = "MagnetismSpeedMax",
		Value = currentRun.Hero.LeaveRoomAmmoMangetismSpeed,
		DestinationIds = ammoIds
	})
	StopAnimation({ DestinationIds = ammoIds, Name = "AmmoReturnTimer" })

	-- Do it again, just in case there was some desync
	mod.DestroyHadesFightObstacles()
	ExpireProjectiles({ Names = { "HadesCast", "HadesAmmoDrop", "HadesAmmoWeapon", "GraspingHands", "HadesTombstoneSpawn", "HadesCastBeam", "HadesCastBeamNoTracking", "HadesBidentThrow" } })
	game.thread(game.PlayVoiceLines, boss.PhaseEndedVoiceLines, nil, boss)

	game.SetMusicSection(1)

	game.wait(1.25, boss.AIThreadName)

	game.ProcessTextLines(boss.BossPresentationNextStageTextLineSets)
	game.ProcessTextLines(boss.BossPresentationNextStageRepeatableTextLineSets)

	if game.GameState.TextLinesRecord["LordHadesR1FirstWin"] then
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
		SetSoundCueValue({ Names = { "Duel" }, Id = game.AudioState.MusicId, Value = 1 })
	end

	game.thread(game.PlayVoiceLines, boss.NextPhaseVoiceLines, nil, boss)

	if boss.CurrentPhase == 2 then
		game.thread(mod.HadesBattleKnockDownPreRecoverPresentation, boss)
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
	game.MapState.BlockRespawns = false
	game.MapState.BlockSpawns = false

	game.SetPlayerVulnerable("HadesPhaseTransition")

	-- Adapted from aiStage.FireWeapon
	boss.WeaponName = "HadesRubbleClear"
	local aiData = game.GetWeaponAIData(boss)
	boss.ForcedWeaponInterrupt = nil
	game.DoAttackerAILoop(boss, aiData)

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

function mod.HadesKillPresentation(unit, args)
	unit.InTransition = true
	game.CurrentRun.CurrentRoom.Encounter.BossKillPresentation = true
	local killerId = game.CurrentRun.Hero.ObjectId
	local victimId = unit.ObjectId
	local deathPanSettings = args
	ClearEffect({ Ids = { victimId, killerId }, All = true, BlockAll = true, })
	-- StopSuper()
	mod.ClearStoredAmmoHero()
	mod.DestroyHadesFightObstacles()
	game.DestroyRequiredKills({ BlockLoot = true, SkipIds = { unit.ObjectId }, BlockDeathWeapons = true })
	ExpireProjectiles({ Names = { "HadesCast", "HadesAmmoDrop", "HadesAmmoWeapon", "GraspingHands", "HadesTombstoneSpawn", "HadesCastBeam", "HadesCastBeamNoTracking", "HadesBidentThrow" } })
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

	-- Do it again, just in case there was some desync
	mod.DestroyHadesFightObstacles()
	ExpireProjectiles({ Names = { "HadesCast", "HadesAmmoDrop", "HadesAmmoWeapon", "GraspingHands", "HadesTombstoneSpawn", "HadesCastBeam", "HadesCastBeamNoTracking", "HadesBidentThrow" } })
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

	if game.GameState.TextLinesRecord["LordHadesDefeated01"] then
		game.wait(2.8, game.RoomThreadName)
	else
		game.wait(4.0, game.RoomThreadName)
	end

	game.ProcessTextLines(unit.BossPresentationOutroTextLineSets)
	game.ProcessTextLines(unit.BossPresentationOutroRepeatableTextLineSets)

	if not game.PlayRandomRemainingTextLines(unit, unit.BossPresentationOutroTextLineSets) then
		game.PlayRandomRemainingTextLines(unit, unit.BossPresentationOutroRepeatableTextLineSets)
	end

	game.SetMusicSection(10)
	-- ZeroSuperMeter()
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	mod.HarpyKillPresentation(unit, args)
	game.wait(1.0, game.RoomThreadName)
	RemoveInputBlock({ Name = "HadesKillPresentation" })
	mod.ModsNikkelMHadesBiomesOpenRunClearScreen()
	game.CurrentRun.ActiveBiomeTimer = false
	game.CurrentRun.CurrentRoom.Encounter.BossKillPresentation = false
	game.thread(game.CheckQuestStatus, { Silent = true })
end

function mod.CheckRunEndPresentation(currentRun, door)
	AddInputBlock({ Name = "CheckRunEndPresentation" })
	if game.GameState.TextLinesRecord["Ending01"] ~= nil then
		currentRun.CurrentRoom.SkipLoadNextMap = true
		game.EndEarlyAccessPresentation()
	else
		-- Custom function to play an incantation animation and voiceline
		mod.SurfaceExitIncantationPresentation(door, game.CurrentRun.Hero)

		local heroExitPointId = GetClosest({ Id = door.ObjectId, DestinationIds = GetIdsByType({ Name = "HeroExit" }), Distance = 600 })
		game.thread(game.MoveHeroToRoomPosition,
			{ DestinationId = heroExitPointId, DisableCollision = true, UseDefaultSpeed = true })
		game.FullScreenFadeOutAnimation()
		if game.GameState.TextLinesRecord["LordHadesBeforePersephoneReturn01"] ~= nil then
			game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.BossHadesPeacefulExitVoiceLines)
		end
	end
	RemoveInputBlock({ Name = "CheckRunEndPresentation" })
end

function mod.SurfaceExitIncantationPresentation(usee, args, user)
	args = args or {}
	AddInputBlock({ Name = "MelUsedSystemObject" })
	game.HideUseButton(usee.ObjectId, usee)
	UseableOff({ Id = usee.ObjectId })
	game.MapState.RoomRequiredObjects[usee.ObjectId] = nil

	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ModsNikkelMHadesBiomes_MelinoeDBossExitVoiceLines)
	PanCamera({ Id = 552590, Duration = 5.0, })
	game.wait(0.25)

	Stop({ Id = game.CurrentRun.Hero.ObjectId })
	AdjustFullscreenBloom({ Name = "DesaturatedLight", Duration = 0.9 })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.13, Duration = 1.5 }, })

	local loopingSoundId = PlaySound({ Name = "/SFX/Menu Sounds/CauldronWhispers", Id = game.CurrentRun.Hero.ObjectId })
	AngleTowardTarget({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = usee.ObjectId })
	SetAnimation({ Name = "Melinoe_Gesture", DestinationId = game.CurrentRun.Hero.ObjectId, SpeedMultiplier = 1.15 })

	CreateAnimation({
		Name = "MelHPostBossHandFxLeft",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		Group = "FX_Standing_Add"
	})
	CreateAnimation({
		Name = "MelHPostBossHandFxRight",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		Group = "FX_Standing_Add"
	})
	CreateAnimation({
		Name = "MelHPostBossHandFxLeftB",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		Group = "FX_Standing_Add"
	})
	CreateAnimation({
		Name = "MelHPostBossHandFxRightB",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		Group = "FX_Standing_Add"
	})

	CreateAnimation({
		Name = "CWEntranceHadesSymbolIn",
		DestinationId = usee.ObjectId,
		OffsetZ = 0,
		OffsetY = 0,
		OffsetX = 0,
		Scale = 0.85,
		Group = "Combat_Menu_TraitTray"
	})

	game.wait(3)

	AdjustRadialBlurDistance({ Fraction = 0, Duration = 1 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 1 })

	ShakeScreen({ Distance = 6, Speed = 500, Duration = 0.3, FalloffSpeed = 1000 })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.13, Duration = 0.5 }, })

	StopAnimation({ Name = "CWEntranceHadesSymbolLoop", DestinationId = usee.ObjectId })
	SetAlpha({ Ids = usee.RewardPreviewIconIds, Fraction = 0.0, Duration = 0 })
	AdjustFullscreenBloom({ Name = "FullscreenFlash2", Duration = 0.0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 1 })

	game.wait(1.3)
	StopAnimation({ Name = "MelHPostBossHandFxLeft", DestinationId = game.CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "MelHPostBossHandFxRight", DestinationId = game.CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "MelHPostBossHandFxLeftB", DestinationId = game.CurrentRun.Hero.ObjectId })
	StopAnimation({ Name = "MelHPostBossHandFxRightB", DestinationId = game.CurrentRun.Hero.ObjectId })
	StopSound({ Id = loopingSoundId, Duration = 0.4 })
	loopingSoundId = nil

	PlaySound({ Name = "/Leftovers/SFX/LightOn", Id = usee.ObjectId, Delay = 0.25 })
	PlaySound({ Name = "/Leftovers/SFX/LightOn", Id = usee.ObjectId, Delay = 0.5 })
	PlaySound({ Name = "/Leftovers/SFX/LightOn", Id = usee.ObjectId, Delay = 0.75 })
	PlaySound({ Name = "/Leftovers/SFX/LightOn", Id = usee.ObjectId })

	RemoveInputBlock({ Name = "MelUsedSystemObject" })
end

function mod.SetupHadesSpawnOptions(enemy)
	local enemySetPrefix = "EnemiesHades"
	-- If the BossDifficultShrine is at EM4, use the harder enemies, except if the player has Deep Dissent
	if game.GetNumShrineUpgrades(enemy.ShrineMetaUpgradeName) >= 4 and not game.HeroHasTrait("HadesChronosDebuffBoon") then
		enemySetPrefix = "EnemiesHadesEM"
	end
	enemy.SpawnOptions = {}
	local spawnOptionsLarge = game.EnemySets[enemySetPrefix .. "Large"]
	local spawnOptionsSmall = game.EnemySets[enemySetPrefix .. "Small"]
	table.insert(enemy.SpawnOptions, game.GetRandomValue(spawnOptionsLarge))
	table.insert(enemy.SpawnOptions, game.GetRandomValue(spawnOptionsSmall))
	table.insert(enemy.SpawnOptions, game.GetRandomValue(spawnOptionsSmall))
end

function mod.HadesTeleport(enemy, weaponAIData, args)
	local teleportPoints = GetIds({ Name = weaponAIData.TeleportationPointsGroupName })
	local teleportPointId = game.GetRandomValue(teleportPoints)
	game.RemoveValue(teleportPoints, GetClosest({ Id = enemy.ObjectId, DestinationIds = teleportPoints }))

	Teleport({ Id = enemy.ObjectId, DestinationId = teleportPointId })
	local postTeleportWaitDuration = game.RandomFloat(weaponAIData.PostTeleportWaitDurationMin,
		weaponAIData.PostTeleportWaitDurationMax)
	game.wait(game.CalcEnemyWait(enemy, postTeleportWaitDuration), enemy.AIThreadName)
end

function mod.ModsNikkelMHadesBiomesHandleHadesCastDeath(projectileData, triggerArgs)
	if game.SessionMapState.HandlingDeath or game.MapState.BlockSpawns or (triggerArgs and triggerArgs.BlockSpawns) then
		return
	end

	local newSpawnData = game.EnemyData[projectileData.SpawnName]
	if newSpawnData == nil then
		return
	end

	-- Hit
	local victim = triggerArgs.TriggeredByTable
	local attacker = triggerArgs.AttackerTable
	-- Prevent the effect being added if the player currently has a hit shield active (from Nitro Boost, Lovers etc.), or is invulnerable (e.g. Skull Persephone special)
	if victim ~= nil and victim.ObjectId == game.CurrentRun.Hero.ObjectId and not victim.ModsNikkelMHadesBiomesHitShieldEffectBlockActive and game.TableLength(game.CurrentRun.Hero.InvulnerableFlags or {}) == 0 then
		CreateAnimation({ Name = "BloodstoneHitFxHades", DestinationId = game.CurrentRun.Hero.ObjectId, OffsetY = -100 })
		if victim.IsDead then
			return
		end

		if victim.StoredAmmo == nil then
			victim.StoredAmmo = {}
		end

		local storedAmmo = {}
		storedAmmo.Id = _worldTime
		storedAmmo.AttackerId = attacker.ObjectId
		storedAmmo.LocationX = triggerArgs.LocationX
		storedAmmo.LocationY = triggerArgs.LocationY
		local offset = CalcOffset(math.rad(triggerArgs.Angle), projectileData.AmmoDropDistance or 50) or {}
		storedAmmo.LocationX = storedAmmo.LocationX + offset.X
		storedAmmo.LocationY = storedAmmo.LocationY + offset.Y
		storedAmmo.Angle = triggerArgs.Angle

		if IsEmpty(victim.StoredAmmo) then
			game.AddIncomingDamageModifier(victim,
				{
					Name = "StoredAmmoVulnerability",
					NonPlayerMultiplier = projectileData.StoredAmmoMultiplier or 2.0,
				})
			-- Do this before CastEmbeddedPresentationStart, so we get to decide the vignette being used
			if game.ScreenAnchors.BloodstoneVignetteId == nil then
				game.ScreenAnchors.BloodstoneVignetteId = CreateScreenObstacle({
					Name = "BlankObstacle",
					Group = "Combat_Menu",
					Animation = "HadesBloodstoneVignette",
					X = game.ScreenCenterX,
					Y = game.ScreenCenterY,
					ScaleX = game.ScreenScaleX,
					ScaleY = game.ScreenScaleY,
				})
			end
			game.CastEmbeddedPresentationStart()
		end
		table.insert(victim.StoredAmmo, storedAmmo)

		local offsetX = 575
		local offsetY = -75
		game.ScreenAnchors.StoredAmmo = game.ScreenAnchors.StoredAmmo or {}
		offsetX = offsetX - (#game.ScreenAnchors.StoredAmmo * 22)
		local screenId = CreateScreenObstacle({
			Name = "BlankObstacle",
			Group = "Combat_Menu",
			DestinationId = game.ScreenAnchors.HealthBack,
			X = 10 + offsetX,
			Y = ScreenHeight - 50 + offsetY
		})
		SetThingProperty({ Property = "SortMode", Value = "Id", DestinationId = { Data = storedAmmo, Id = screenId } })

		table.insert(game.ScreenAnchors.StoredAmmo, screenId)
		SetAnimation({ Name = projectileData.StoredAmmoIcon or "AmmoEmbeddedInEnemyIcon", DestinationId = screenId })
		game.thread(game.PlayVoiceLines, game.HeroVoiceLines.HitByHadesAmmoVoiceLines, true)
		game.thread(game.InCombatText, game.CurrentRun.Hero.ObjectId, "HitByHadesAmmo", 0.8, { OffsetY = -60 })

		thread(game.DropStoredAmmoHero, projectileData, storedAmmo.Id)
		return
	end

	-- Miss
	local spawnPointId = SpawnObstacle({
		Name = "InvisibleTarget",
		LocationX = triggerArgs.LocationX,
		LocationY = triggerArgs.LocationY,
		Group = "Scripting"
	})

	local newUnit = game.DeepCopyTable(newSpawnData) or {}
	newUnit.ObjectId = SpawnUnit({ Name = projectileData.SpawnName, DestinationId = spawnPointId, Group = "Standing" })

	if projectileData.SpawnsSkipActivatePresentation then
		newUnit.UseActivatePresentation = false
	end

	game.SetupUnit(newUnit)
	Destroy({ Id = spawnPointId })
end

function mod.ClearStoredAmmoHero()
	local hero = game.CurrentRun.Hero
	if hero ~= nil and hero.StoredAmmo ~= nil then
		hero.StoredAmmo = {}
	end
	if game.ScreenAnchors.StoredAmmo ~= nil then
		Destroy({ Ids = game.ScreenAnchors.StoredAmmo })
		game.ScreenAnchors.StoredAmmo = nil
	end

	game.thread(game.CastEmbeddedPresentationEnd)
end

function mod.ModsNikkelMHadesBiomesAttackAndDie(enemy)
	game.wait(game.CalcEnemyWait(enemy, 0.1), enemy.AIThreadName)

	enemy.WeaponName = game.SelectWeapon(enemy)

	local aiData = game.ShallowCopyTable(enemy.DefaultAIData) or enemy
	if game.WeaponData[enemy.WeaponName] ~= nil and game.WeaponData[enemy.WeaponName].AIData ~= nil then
		game.OverwriteTableKeys(aiData, game.WeaponData[enemy.WeaponName].AIData)
	end
	aiData.WeaponName = enemy.WeaponName

	if enemy.DisplayAttackTimer then
		local attackDuration = aiData.PreAttackDuration
		game.thread(mod.ModsNikkelMHadesBiomesHandleAttackTimer, enemy, attackDuration)
	end

	local targetId = GetTargetId(enemy, aiData)
	game.DoAttackerAILoop(enemy, aiData)

	while enemy.ChainedWeapon ~= nil or enemy.ActiveWeaponCombo ~= nil do
		enemy.WeaponName = game.SelectWeapon(enemy)

		aiData = game.ShallowCopyTable(enemy.DefaultAIData) or {}
		if game.WeaponData[enemy.WeaponName] ~= nil and game.WeaponData[enemy.WeaponName].AIData ~= nil then
			game.OverwriteTableKeys(aiData, game.WeaponData[enemy.WeaponName].AIData)
		end
		aiData.WeaponName = enemy.WeaponName
		game.DoAttackerAILoop(enemy, aiData)
	end

	while enemy.IsPolymorphed do
		game.wait(0.5, enemy.AIThreadName)
	end

	game.Kill(enemy)
end

function mod.ModsNikkelMHadesBiomesHandleAttackTimer(enemy, attackDuration)
	local offsetY = enemy.AttackTimerOffsetY or -150

	for i = 1, attackDuration do
		local timeRemaining = attackDuration - i + 1
		game.thread(game.InCombatText, enemy.ObjectId, attackDuration + 1 - i, 0.5,
			{ OffsetY = offsetY, SkipShadow = true, FontSize = 40, FlashAnimation = "TyphonEggTimerFlash", })
		PlaySound({ Name = "/Leftovers/Menu Sounds/MenuButtonOn2", Id = enemy.ObjectId })
		if timeRemaining == enemy.AttackTimerEndThreshold then
			if enemy.AttackTimerEndSound ~= nil then
				PlaySound({ Name = enemy.AttackTimerEndSound, Id = enemy.ObjectId })
			end
			if enemy.AttackTimerEndShake then
				Shake({ Id = enemy.ObjectId, Speed = 350, Distance = 5, Duration = enemy.AttackTimerEndThreshold })
			end
		end
		game.wait(game.CalcEnemyWait(enemy, 1.0), enemy.AIThreadName)
	end
end

function mod.HadesSpawnsPresentation(args)
	AdjustColorGrading({ Name = "HadesSpawns", Duration = 0.5, Delay = 2.0 })
	AdjustColorGrading({ Name = "Off", Duration = 1.5, Delay = 3 })
end

function mod.HadesConsumeHeal(enemy, weaponAIData, currentRun)
	local urnsConsumed = 0
	while urnsConsumed < weaponAIData.MaxConsumptions and not IsInvulnerable({ Id = enemy.ObjectId }) do
		local urnId = game.GetRandomValue(GetIdsByType({ Name = "ModsNikkelMHadesBiomesHadesTombstone" }))
		if urnId == nil or urnId == 0 then
			break
		end
		if weaponAIData.ConsumeFx ~= nil then
			CreateAnimation({ DestinationId = urnId, Name = weaponAIData.ConsumeFx })
		end
		for i = 1, weaponAIData.HealTicksPerConsume do
			game.wait(game.CalcEnemyWait(enemy, weaponAIData.HealTickInterval), enemy.AIThreadName)
			if game.ActiveEnemies[urnId] ~= nil and not IsInvulnerable({ Id = enemy.ObjectId }) then
				game.Heal(enemy, { HealAmount = weaponAIData.HealPerTick, triggeredById = enemy.ObjectId })
				game.thread(game.UpdateHealthBar, enemy, { Force = true })
			else
				StopAnimation({ DestinationId = urnId, Name = weaponAIData.ConsumeFx })
				break
			end
		end
		if game.ActiveEnemies[urnId] ~= nil then
			game.ActiveEnemies[urnId].OnDeathFunctionName = nil
			SetUnitProperty({ DestinationId = urnId, Property = "OnDeathWeapon", Value = "null" })
			StopAnimation({ DestinationId = urnId, Name = weaponAIData.ConsumeFx })
			Destroy({ Id = urnId })
		end
		urnsConsumed = urnsConsumed + 1
		game.wait(game.CalcEnemyWait(enemy, weaponAIData.NextUrnWait), enemy.AIThreadName)
	end
	if weaponAIData.StopAnimationsOnEnd then
		for k, animationName in pairs(weaponAIData.StopAnimationsOnEnd) do
			StopAnimation({ DestinationId = enemy.ObjectId, Name = animationName })
		end
	end
end

function mod.HitByGraveHandsPresentation(victim)
	if not GetUnitDataValue({ Id = game.CurrentRun.Hero.ObjectId, Property = "ImmuneToStun" }) then
		game.thread(game.PlayVoiceLines, game.HeroVoiceLines.HitByGraveHandsVoiceLines, true)
	end
end

function mod.HandleHadesAssistPresentation(enemy, weaponAIData, currentRun)
	game.thread(game.PlayVoiceLines, enemy.AssistActivatedVoiceLines)
	local fullscreenAlertDisplacementFx = mod.DoHadesAssistPresentation(weaponAIData, enemy.ObjectId)
	game.thread(mod.DoCerberusAssistPresentation)
	mod.DoHadesAssistPresentationPostWeapon(weaponAIData, enemy.ObjectId, fullscreenAlertDisplacementFx)
end

function mod.DoHadesAssistPresentation(assistData, enemyId)
	local currentRun = game.CurrentRun
	game.SetPlayerInvulnerable("Super")
	AddInputBlock({ Name = "AssistPreSummon" })

	PlaySound({ Name = assistData.ProcSound or "/Leftovers/SFX/AuraThrowLarge" })
	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteSparklySFX" })

	AdjustFullscreenBloom({ Name = "LastKillBloom", Duration = 0 })

	local assistDimmer = SpawnObstacle({ Name = "rectangle01", DestinationId = enemyId, Group = "Combat_UI" })
	Teleport({ Id = assistDimmer, OffsetX = game.ScreenCenterX, OffsetY = game.ScreenCenterY })
	DrawScreenRelative({ Ids = { assistDimmer } })
	SetScale({ Id = assistDimmer, Fraction = 10 })
	SetColor({ Id = assistDimmer, Color = { 20, 20, 20, 255 } })
	SetAlpha({ Id = assistDimmer, Fraction = 0.8, Duration = 0 })

	game.wait(0.06)
	ExpireProjectiles({ ExcludeNames = game.WeaponSets.ExpireProjectileExcludeProjectileNames })
	game.AddSimSpeedChange("Assist", { Fraction = 0.005, LerpTime = 0 })

	game.waitUnmodified(0.32)

	game.HideCombatUI("AssistPresentationPortrait")

	Rumble({ RightFraction = 0.7, Duration = 0.3 })
	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
	AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay = 0 })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.03, Delay = 0 })

	local wrathPresentationOffsetY = 100
	local wrathStreak = SpawnObstacle({
		Name = "BlankObstacle",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		Group = "Combat_UI"
	})
	Teleport({ Id = wrathStreak, OffsetX = (1920 / 2), OffsetY = 800 + wrathPresentationOffsetY })
	DrawScreenRelative({ Ids = { wrathStreak } })
	CreateAnimation({
		Name = "WrathPresentationStreak",
		DestinationId = wrathStreak,
		Color = assistData.AssistPresentationColor or Color.Red
	})

	local portraitOffsetXBuffer = assistData.AssistPresentationPortraitOffsetX or 0
	local portraitOffsetYBuffer = assistData.AssistPresentationPortraitOffsetY or 0

	local godImage = SpawnObstacle({
		Name = "BlankObstacle",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		Group = "Combat_Menu"
	})
	Teleport({
		Id = godImage,
		OffsetX = -300 + portraitOffsetXBuffer,
		OffsetY = (1080 / 2) + 80 + wrathPresentationOffsetY + portraitOffsetYBuffer
	})
	DrawScreenRelative({ Ids = { godImage } })
	CreateAnimation({ Name = assistData.AssistPresentationPortrait, DestinationId = godImage, Scale = "1.0" })

	local godImage2 = SpawnObstacle({
		Name = "BlankObstacle",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		Group =
		"Combat_UI"
	})
	Teleport({ Id = godImage2, OffsetX = 60, OffsetY = (1080 / 2) + 80 + wrathPresentationOffsetY })
	DrawScreenRelative({ Ids = { godImage2 } })
	if assistData.AssistPresentationPortrait2 then
		CreateAnimation({ Name = assistData.AssistPresentationPortrait2, DestinationId = godImage2, Scale = "1.0" })
	end

	local wrathStreakFront = SpawnObstacle({
		Name = "BlankObstacle",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		Group = "Combat_Menu_Overlay"
	})
	Teleport({ Id = wrathStreakFront, OffsetX = 900, OffsetY = 1150 + wrathPresentationOffsetY })
	DrawScreenRelative({ Ids = { wrathStreakFront } })
	CreateAnimation({
		Name = "WrathPresentationBottomDivider",
		DestinationId = wrathStreakFront,
		Scale = "1.25",
		Color = assistData.AssistPresentationColor or game.Color.Red
	})

	local wrathVignette = SpawnObstacle({
		Name = "BlankObstacle",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		Group = "FX_Standing_Top"
	})
	CreateAnimation({ Name = "WrathVignette", DestinationId = wrathVignette, Color = game.Color.Red })

	-- audio
	local dummyGodSource = {}

	game.AddSimSpeedChange("Assist", { Fraction = 0.1, LerpTime = 0.06 })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 3, ValueChangeType = "Multiply", DataValue = false, DestinationNames = { "HeroTeam" } })

	ScreenAnchors.FullscreenAlertFxAnchor = CreateScreenObstacle({
		Name = "BlankObstacle",
		Group = "Scripting",
		X = game.ScreenCenterX,
		Y = game.ScreenCenterY
	})

	local fullscreenAlertDisplacementFx = SpawnObstacle({
		Name = "FullscreenAlertDisplace",
		Group = "FX_Displacement",
		DestinationId = game.ScreenAnchors.FullscreenAlertFxAnchor
	})
	DrawScreenRelative({ Id = fullscreenAlertDisplacementFx })

	Move({ Id = godImage, Angle = 8, Distance = 800, Duration = 0.2, EaseIn = 0.2, EaseOut = 1, TimeModifierFraction = 0 })

	Move({ Id = godImage2, Angle = 8, Distance = 800, Duration = 0.2, EaseIn = 0.2, EaseOut = 1, TimeModifierFraction = 0 })

	Move({ Id = wrathStreakFront, Angle = 8, Distance = 200, Duration = 0.5, EaseIn = 0.9, EaseOut = 1, TimeModifierFraction = 0 })
	-- Move({ Id = playerImage, Angle = 170, Speed = 50, TimeModifierFraction = 0 })

	SetColor({ Id = wrathVignette, Color = { 0, 0, 0, 0.4 }, Duration = 0.05, TimeModifierFraction = 0 })

	game.waitUnmodified(0.25)
	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteSurpriseSFX" })

	AdjustFullscreenBloom({ Name = "Off", Duration = 0.1, Delay = 0 })
	Move({ Id = godImage, Angle = 8, Distance = 100, Duration = 1, EaseIn = 0.5, EaseOut = 0.5, TimeModifierFraction = 0 })

	Move({ Id = godImage2, Angle = 8, Distance = 100, Duration = 1, EaseIn = 0.5, EaseOut = 0.5, TimeModifierFraction = 0 })

	Move({ Id = wrathStreakFront, Angle = 8, Distance = 25, Duration = 1, EaseIn = 0.5, EaseOut = 1, TimeModifierFraction = 0 })

	game.waitUnmodified(0.55)
	AdjustZoom({ Fraction = currentRun.CurrentRoom.ZoomFraction or 0.9, LerpTime = 0.25 })

	PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal3" })

	RemoveInputBlock({ Name = "AssistPreSummon" })

	SetAlpha({ Id = godImage, Fraction = 0, Duration = 0.12, TimeModifierFraction = 0 })

	SetAlpha({ Id = godImage2, Fraction = 0, Duration = 0.12, TimeModifierFraction = 0 })

	SetAlpha({ Id = wrathVignette, Fraction = 0, Duration = 0.06 })
	SetColor({ Id = assistDimmer, Color = { 0.0, 0, 0, 0 }, Duration = 0.06 })
	SetAlpha({ Id = fullscreenAlertDisplacementFx, Fraction = 0, Duration = 0.06 })

	game.waitUnmodified(0.06)

	return fullscreenAlertDisplacementFx
end

function mod.DoCerberusAssistPresentation()
	game.wait(0.3)
	PlaySound({ Name = "/VO/CerberusBarks2" })
	game.wait(0.4)
	PlaySound({ Name = "/VO/CerberusBarks" })
	game.wait(0.3)

	local additionalAnimation = CreateAnimation({
		Name = "LegendaryAspectSnow",
		DestinationId = game.ScreenAnchors.FullscreenAlertFxAnchor
	})
	DrawScreenRelative({ Id = additionalAnimation })

	AdjustFullscreenBloom({ Name = "CerberusSummon", Duration = 0.2 })

	ShakeScreen({ Speed = 900, Distance = 15, Duration = 4, FalloffSpeed = 1400 })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.3, Duration = 4.0 }, })
	PlaySound({ Name = "/SFX/Enemy Sounds/Hades/CerberusSummonCanned" })

	AdjustRadialBlurDistance({ Fraction = 2.0, Duration = 0.3 })
	AdjustRadialBlurStrength({ Fraction = 1.0, Duration = 0.3 })
	game.wait(5.0)

	AdjustFullscreenBloom({ Name = "Off", Duration = 0.4 })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.4 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.4 })

	AdjustFullscreenBloom({ Name = "Off", Duration = 0.8 })
end

function mod.DoHadesAssistPresentationPostWeapon(assistData, enemyId, fullscreenAlertDisplacementFx)
	game.AddSimSpeedChange("Assist", { Fraction = 0.3, LerpTime = 0.3 })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	game.waitUnmodified(assistData.AssistPostWeaponSlowDuration or 0)
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	game.RemoveSimSpeedChange("Assist", { LerpTime = 0.3 })
	game.thread(game.CleanUpShoutPresentation, nil, nil, { fullscreenAlertDisplacementFx })
	game.ShowCombatUI("AssistPresentationPortrait")
	game.thread(mod.RevulnerablePlayerAfterShout)
end

function mod.RevulnerablePlayerAfterShout()
	game.waitUnmodified(0.4)
	game.SetPlayerVulnerable("Super")
end

function mod.ModsNikkelMHadesBiomesOpenRunClearScreen()
	game.AltAspectRatioFramesShow()
	AddInputBlock({ Name = "OpenRunClearScreen" })
	PlaySound({ Name = "/Leftovers/Menu Sounds/AscensionConfirm2" })
	LoadVoiceBank({ Name = "Chaos", IgnoreAssert = true })

	game.SessionMapState.PrevShowGameplayTimer = game.ConfigOptionCache.ShowGameplayTimer
	SetConfigOption({ Name = "ShowGameplayTimer", Value = false })

	local prevRecordTime = nil
	local prevRecordShrinePoints = nil
	-- TODO: How to handle bounties? How is it done in vanilla?
	prevRecordTime = game.GameState.ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache or 999999
	prevRecordShrinePoints = game.GameState.ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache or 0

	game.RecordRunCleared()

	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ModsNikkelMHadesBiomes_RunClearedVoiceLines)

	local screen = game.DeepCopyTable(game.ScreenData.RunClear) or {}
	screen.DamageDealtStartX = game.ScreenWidth - screen.DamageDealtRightOffset
	screen.DamageDealtStartY = screen.DamageDealtStartY + (game.ScreenCenterNativeOffsetY * 2)
	screen.DamageTakenStartY = screen.DamageTakenStartY + (game.ScreenCenterNativeOffsetY * 2)
	-- TODO: How to handle bounties? How is it done in vanilla?
	screen.ComponentData.VictoryBackground.Animation = "ModsNikkelMHadesBiomes_VictoryScreenIllustration_Elysium"
	screen.ComponentData.TitleText = screen.ComponentData.UnderworldTitleText
	screen.ComponentData.RunClearMessageText = screen.ComponentData.UnderworldRunClearMessageText
	-- Custom colour change due to the different background image
	screen.ComponentData.RunClearMessageText.TextArgs.Color = { 245, 255, 225, 255 }

	screen.ComponentData.UnderworldTitleText = nil
	screen.ComponentData.UnderworldRunClearMessageText = nil
	screen.ComponentData.SurfaceTitleText = nil
	screen.ComponentData.SurfaceRunClearMessageText = nil

	local args = {}
	game.HideMoneyUI(args)
	game.HideRerollUI(args)
	game.HideResourceUIs(args)
	game.HideObjectivesUI()

	if game.MapState.FamiliarUnit ~= nil and game.MapState.FamiliarUnit.StopAIOnRunClear then
		game.CallFunctionName(game.MapState.FamiliarUnit.StopAIFunctionName, game.MapState.FamiliarUnit)
	end

	game.OnScreenOpened(screen)
	game.CreateScreenFromData(screen, screen.ComponentData)
	game.OnScreenOpened(screen)
	game.FrameState.RequestUpdateHealthUI = true

	local components = screen.Components

	-- Badge
	if game.GameState.BadgeRank ~= nil then
		local badgeData = game.BadgeData[game.BadgeOrderData[game.GameState.BadgeRank]]
		if badgeData ~= nil then
			SetAnimation({ DestinationId = components.BadgeRankIcon.Id, Name = badgeData.Icon })
		end
	end

	game.wait(0.3)

	local traitTrayScreen = game.OpenTraitTrayScreen({
		DontDuckAudio = true,
		DisableTooltips = true,
		HideCloseButton = true,
		HideInfoButton = true,
		HideBounty = true,
		HideBackgroundTint = true,
		HideRoomCount = true,
		HideCategoryTitleText = true,
		AutoPin = true,
		SkipInputHandlers = true,
		OverwriteSelf = { IgnoreOtherScreenInput = false, },
	}) or {}

	PlaySound({ Name = "/SFX/Menu Sounds/IrisMenuSwitch" })
	SetConfigOption({ Name = "TooltipShowDelay", Value = 999999 })

	-- ClearTime
	ModifyTextBox({ Id = components.ClearTimeValue.Id, Text = game.GetTimerString(game.CurrentRun.GameplayTime, 2), })
	if game.CurrentRun.GameplayTime <= prevRecordTime then
		wait(0.1)
		SetAlpha({ Id = components.ClearTimeRecord.Id, Duration = game.HUDScreen.FadeOutDuration, Fraction = 1.0 })
	end
	game.wait(0.05)

	-- ShrinePoints
	if (game.CurrentRun.ShrinePointsCache or 0) > 0 then
		SetAlpha({ Id = components.ShrinePointsLabel.Id, Duration = game.HUDScreen.FadeOutDuration, Fraction = 1.0 })
		SetAlpha({ Id = components.ShrinePointsValue.Id, Duration = game.HUDScreen.FadeOutDuration, Fraction = 1.0 })
		ModifyTextBox({ Id = components.ShrinePointsValue.Id, Text = CurrentRun.ShrinePointsCache })
		if game.CurrentRun.ShrinePointsCache > prevRecordShrinePoints then
			game.wait(0.1)
			SetAlpha({ Id = components.ShrinePointsRecord.Id, Duration = game.HUDScreen.FadeOutDuration, Fraction = 1.0 })
		end
		game.wait(0.05)
	end

	-- Damage Dealt
	local damageLocationX = screen.DamageDealtStartX
	local damageLocationY = screen.DamageDealtStartY
	local mappedDamageDealtRecord = {}
	for sourceName, amount in pairs(game.CurrentRun.DamageDealtByHeroRecord) do
		local mappedName = screen.DamageSourceMap[sourceName] or sourceName
		mappedDamageDealtRecord[mappedName] = (mappedDamageDealtRecord[mappedName] or 0) + amount
	end
	for sourceName, amount in pairs(game.CurrentRun.DamageDealtByCharmedEnemiesRecord) do
		local mappedName = "RunClearScreen_DamageDealtAllies"
		mappedDamageDealtRecord[mappedName] = (mappedDamageDealtRecord[mappedName] or 0) + amount
	end
	local damageRecordItems = {}
	for sourceName, amount in pairs(mappedDamageDealtRecord) do
		table.insert(damageRecordItems, { SourceName = sourceName, Amount = amount })
	end
	table.sort(damageRecordItems, game.DamageRecordSort)
	for i, damageRecordItem in ipairs(damageRecordItems) do
		if i > screen.MaxDamageDealtItems then
			break
		end

		local damageSourceComponent = game.CreateScreenComponent({
			Name = "BlankObstacle",
			Group = "Combat_Menu_TraitTray_Overlay_Text",
			X = damageLocationX,
			Y = damageLocationY
		}) or {}
		damageSourceComponent.Data = screen.DamageSourceFormat
		screen.Components["DamageDealtSource" .. damageRecordItem.SourceName] = damageSourceComponent
		local damageSourceFormat = game.ApplyLocalizedProperties(game.ShallowCopyTable(screen.DamageSourceFormat))
		damageSourceFormat.Id = damageSourceComponent.Id
		damageSourceFormat.Text = screen.DamageSourceTextOverrides[damageRecordItem.SourceName] or
				damageRecordItem.SourceName
		CreateTextBox(damageSourceFormat)

		local damageAmountComponent = game.CreateScreenComponent({
			Name = "BlankObstacle",
			Group = "Combat_Menu_TraitTray_Overlay_Text",
			X = damageLocationX + screen.DamageDealtAmountOffsetX,
			Y = damageLocationY
		}) or {}
		damageAmountComponent.Data = screen.DamageAmountFormat
		screen.Components["DamageDealtAmount" .. damageRecordItem.SourceName] = damageAmountComponent
		local damageAmountFormat = game.ShallowCopyTable(screen.DamageAmountFormat) or {}
		damageAmountFormat.Id = damageAmountComponent.Id
		damageAmountFormat.Text = "{$TempTextData.DamageRecordAmount:N}"
		damageAmountFormat.LuaKey = "TempTextData"
		damageAmountFormat.LuaValue = { DamageRecordAmount = round(damageRecordItem.Amount) }
		CreateTextBox(damageAmountFormat)

		damageLocationY = damageLocationY + screen.DamageDealtSpacingY

		game.wait(0.05)
	end

	-- Damage Taken
	damageLocationX = screen.DamageDealtStartX
	damageLocationY = screen.DamageTakenStartY
	local mappedDamageTakenRecord = {}
	for sourceName, amount in pairs(game.CurrentRun.DamageTakenFromRecord) do
		if game.EnemyData[sourceName] ~= nil then
			sourceName = game.GetGenusName(game.EnemyData[sourceName])
		end
		local mappedName = screen.DamageSourceMap[sourceName] or sourceName or ""
		mappedDamageTakenRecord[mappedName] = (mappedDamageTakenRecord[mappedName] or 0) + amount
	end
	damageRecordItems = {}
	for sourceName, amount in pairs(mappedDamageTakenRecord) do
		table.insert(damageRecordItems, { SourceName = sourceName, Amount = amount })
	end
	table.sort(damageRecordItems, game.DamageRecordSort)
	for i, damageRecordItem in ipairs(damageRecordItems) do
		if i > screen.MaxDamageDealtItems then
			break
		end

		local damageSourceComponent = game.CreateScreenComponent({
			Name = "BlankObstacle",
			Group = "Combat_Menu_TraitTray_Overlay_Text",
			X = damageLocationX,
			Y = damageLocationY
		}) or {}
		damageSourceComponent.Data = screen.DamageSourceFormat
		screen.Components["DamageTakenSource" .. damageRecordItem.SourceName] = damageSourceComponent
		local damageSourceFormat = game.ApplyLocalizedProperties(game.ShallowCopyTable(screen.DamageSourceFormat))
		damageSourceFormat.Id = damageSourceComponent.Id
		damageSourceFormat.Text = screen.DamageSourceTextOverrides[damageRecordItem.SourceName] or
				damageRecordItem.SourceName
		CreateTextBox(damageSourceFormat)

		local damageAmountComponent = game.CreateScreenComponent({
			Name = "BlankObstacle",
			Group = "Combat_Menu_TraitTray_Overlay_Text",
			X = damageLocationX + screen.DamageDealtAmountOffsetX,
			Y = damageLocationY
		}) or {}
		damageAmountComponent.Data = screen.DamageAmountFormat
		screen.Components["DamageTakenAmount" .. damageRecordItem.SourceName] = damageAmountComponent
		local damageAmountFormat = game.ShallowCopyTable(screen.DamageAmountFormat) or {}
		damageAmountFormat.Id = damageAmountComponent.Id
		damageAmountFormat.Text = game.round(damageRecordItem.Amount)
		CreateTextBox(damageAmountFormat)

		damageLocationY = damageLocationY + screen.DamageDealtSpacingY

		game.wait(0.05)
	end

	game.wait(0.05)

	-- Clear Message
	local message = nil
	if game.CurrentRun.ActiveBounty then
		message = game.CurrentRun.ActiveBounty
	else
		-- Custom start
		local priorityEligibleMessages = {}
		local eligibleMessages = {}
		for name, origMessage in pairs(game.GameData.ModsNikkelMHadesBiomesRunClearMessageData) do
			if not origMessage.DebugOnly and game.IsGameStateEligible(game.CurrentRun, origMessage.GameStateRequirements) then
				if origMessage.Priority then
					table.insert(priorityEligibleMessages, origMessage)
				else
					table.insert(eligibleMessages, origMessage)
				end
			end
		end
		local messageData = nil
		if not game.IsEmpty(priorityEligibleMessages) then
			messageData = game.GetRandomValue(priorityEligibleMessages)
		else
			messageData = game.GetRandomValue(eligibleMessages)
		end
		-- Custom end
		if messageData ~= nil then
			message = messageData.Name
			game.GameState.PlayedRunClearMessages[message] = true
			game.CurrentRun.VictoryMessage = message
		end
	end
	game.RunClearMessagePresentation(screen, message)

	game.killTaggedThreads(game.CombatUI.HideThreadName)
	RemoveInputBlock({ Name = "OpenRunClearScreen" })

	game.thread(game.HandleScreenInput, traitTrayScreen)
	SetAlpha({ Id = components.CloseButton.Id, Duration = game.HUDScreen.FadeInDuration, Fraction = 1.0 })
	SetAlpha({ Id = traitTrayScreen.Components.ScrollLeft.Id, Duration = game.HUDScreen.FadeInDuration, Fraction = 1.0 })
	SetAlpha({ Id = traitTrayScreen.Components.ScrollRight.Id, Duration = game.HUDScreen.FadeInDuration, Fraction = 1.0 })
	game.HandleScreenInput(screen)
end

-- Ending
function game.DoHadesSigh()
	SetAlpha({ Id = game.ScreenAnchors.DialogueBackgroundId, Fraction = 0.0, Duration = 0.5 })
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.HadesSighVoiceLines)
	-- "/Music/PersephoneTheme_MC"
	game.thread(game.MusicPlayer, "{6925b297-5627-4549-b137-135aca5919d2}")
	SetSoundCueValue({ Names = { "Strings", "Harp", "Percussion", "Room" }, Id = game.AudioState.MusicId, Value = 1, Duration = 0.75 })
	SetSoundCueValue({ Names = { "WoodWinds", "Trombones" }, Id = game.AudioState.MusicId, Value = 0, Duration = 0.75 })
	-- Custom
	SetVolume({ Id = game.AudioState.MusicId, Value = 1.4 })

	game.wait(4.6)
	SetAlpha({ Id = game.ScreenAnchors.DialogueBackgroundId, Fraction = 1.0, Duration = 0.5 })
end

-- Only for assigning the victory message
function mod.ModsNikkelMHadesBiomesHadesPeacefulVictory()
	game.GameState.PlayedRunClearMessages.ModsNikkelMHadesBiomes_RunClear_ClearNumTen = true
	game.CurrentRun.VictoryMessage = "ModsNikkelMHadesBiomes_RunClear_ClearNumTen"
end
