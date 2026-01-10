-- #region ForbiddenShopItem spawn
function mod.CheckForbiddenShopItem(eventSource, args)
	local spawnOnId = GetClosest({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = "ForbiddenShopItemSpawnPoint" })
	if spawnOnId == nil or spawnOnId == 0 then
		return
	end

	game.CurrentRun.ForbiddenShopItemOffered = true

	local consumableName = "ForbiddenShopItem"
	-- local playerId = GetIdsByType({ Name = "_PlayerUnit" })
	local consumableId = SpawnObstacle({ Name = consumableName, DestinationId = spawnOnId, Group = "Standing" })
	local consumable = game.CreateConsumableItem(consumableId, consumableName, 0)
	if consumable.DropMoney ~= nil then
		consumable.DropMoney = game.round(consumable.DropMoney *
			game.GetTotalHeroTraitValue("MoneyMultiplier", { IsMultiplier = true }))
	end

	table.insert(game.CurrentRun.CurrentRoom.Store.SpawnedStoreItems, { ObjectId = consumableId, Cost = consumable.Cost })
	SetObstacleProperty({ Property = "MagnetismWhileBlocked", Value = 0, DestinationId = consumableId })

	local shopIds = GetInactiveIds({ Name = "ForbiddenShop" })
	Activate({ Ids = shopIds })
end

function mod.ForbiddenShopItemTaken(source, args)
	args = args or {}

	game.thread(game.UseConsumableItem, source, args, game.CurrentRun.Hero)

	local charonId = GetClosestUnitOfType({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = "NPC_Charon_01" })

	game.AddTimerBlock(game.CurrentRun, "StealPresentation")
	AddInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	game.HideCombatUI("StealPresentation")

	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ForbiddenShopItemTakenVoiceLines)

	game.wait(0.1)

	game.StopSecretMusic()
	game.EndAmbience(0.1)
	StopAmbientSound({ All = true })

	game.wait(0.2)
	PlaySound({ Name = "/SFX/Menu Sounds/RecordScratch" })
	SetThingProperty({ Property = "AmbientSound", Value = "/EmptyCue", DestinationId = charonId })

	LockCamera({ Ids = { game.CurrentRun.Hero.ObjectId, charonId }, Duration = 0.22 })
	FocusCamera({ Fraction = 0.975, Duration = 0.3, ZoomType = "Overshoot" })

	game.wait(0.2)

	AngleTowardTarget({ Id = charonId, DestinationId = game.CurrentRun.Hero.ObjectId })
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.CharonSurprisedVoiceLines)

	game.wait(0.8)

	AngleTowardTarget({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = charonId })
	game.wait(0.10)
	SetAnimation({ Name = "MelTalkPensive01", DestinationId = game.CurrentRun.Hero.ObjectId })

	game.wait(2.0)
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ForbiddenShopItemCaughtVoiceLines)
	SetAnimation({ Name = "MelTalkPensive01ReturnToIdle", DestinationId = game.CurrentRun.Hero.ObjectId })

	local soundId = PlaySound({ Name = "/Leftovers/Object Ambiences/ThunderLoop" })

	ShakeScreen({ Speed = 500, Distance = 4, FalloffSpeed = 3000, Duration = 5.0 })

	StopSound({ Id = soundId, Duration = 5 })
	soundId = nil

	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0.1 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0.1 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0.1 })

	LockCamera({ Ids = { game.CurrentRun.Hero.ObjectId }, Duration = 7 })

	game.wait(2.0)

	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03 })
	AdjustRadialBlurDistance({ Fraction = 0, Duration = 0.03 })

	-- SetAnimation({ Name = "MelTalkBrooding01", DestinationId = game.CurrentRun.Hero.ObjectId })
	PlaySound({ Name = "/Leftovers/Menu Sounds/AscensionConfirm" })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.7 }, })
	Flash({ Id = game.CurrentRun.Hero.ObjectId, Speed = 0.5, MinFraction = 0, MaxFraction = 1.0, Color = game.Color.White, Duration = 1.0, ExpireAfterCycle = false })
	AdjustColorGrading({ Name = "Chaos", Duration = 0.7 })

	game.wait(0.7)

	CreateAnimation({ Name = "ZagreusSecretDoorDiveFadeFx", DestinationId = game.CurrentRun.Hero.ObjectId })
	SetAlpha({ Id = game.CurrentRun.Hero.ObjectId, Fraction = 0, Duration = 0.13 })

	game.wait(0.4)
	game.FullScreenFadeOutAnimation()
	game.wait(0.2)

	RemoveInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })

	game.RemoveTimerBlock(game.CurrentRun, "StealPresentation")
	args.NextMap = "CharonFight01"
	-- Custom: Does nothing
	game.CurrentRun.CurrentRoom.ExitFunctionName = _PLUGIN.guid .. "." .. "ExitToCharonFightPresentation"
	mod.LeaveRoomWithNoDoor(source, args)
end

-- #endregion

-- #region Boss fight intro/outro
function mod.BossIntroCharon(eventSource, args)
	AddInputBlock({ Name = "BossIntro" })
	game.AddTimerBlock(game.CurrentRun, "CharonIntro")
	game.HideCombatUI("BossIntroCharon")

	game.wait(2.5)

	RemoveInputBlock({ Name = "BossIntro" })
	game.RemoveTimerBlock(game.CurrentRun, "CharonIntro")
	mod.ModsNikkelMHadesBiomesBossIntro(eventSource, args)
	game.ShowCombatUI("BossIntroCharon")
end

function mod.StartCharonBossRoomMusic()
	-- /Music/CharonFightTheme
	game.MusicPlayer("{c5808c4e-a192-4f33-bcae-1e1415b6f8e8}")
	game.SetMusicSection(0, game.AudioState.MusicId)
end

function mod.CharonFightEndPresentation(boss, currentRun)
	game.AddTimerBlock(game.CurrentRun, "CharonEarlyExitPresentation")
	AddInputBlock({ Name = "CharonFightEnd" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })
	ExpireProjectiles({})
	game.DestroyRequiredKills({ BlockLoot = true, SkipIds = { boss.ObjectId }, BlockDeathWeapons = true })
	game.notifyExistingWaiters("AllRequiredKillEnemiesDead")
	game.HideCombatUI("CharonFightEnd")
	boss.AIDisabled = true

	SetUnitProperty({ Property = "Speed", Value = 500, DestinationId = boss.ObjectId })

	game.thread(game.LastKillPresentation, boss)
	PlaySound({ Name = "/Leftovers/SFX/AnnouncementPing3" })
	SetSoundCueValue({ Names = { "Section", }, Id = game.AudioState.MusicId, Value = 10 })
	game.AudioState.MusicName = nil
	game.AudioState.MusicSection = nil
	game.AudioState.MusicId = nil

	-- ZeroSuperMeter()

	game.thread(game.PlayVoiceLines, boss.EarlyExitVoiceLines, nil, boss)

	game.wait(0.5, game.RoomThreadName)

	StopAnimation({ Name = "Invincibubble_Charon", DestinationId = boss.ObjectId })
	SetLifeProperty({ DestinationId = boss.ObjectId, Property = "InvulnerableFx", Value = nil })
	SetAnimation({ DestinationId = boss.ObjectId, Name = GetThingDataValue({ Id = boss.ObjectId, Property = "Graphic" }) })
	LockCamera({ Id = boss.ObjectId, Duration = 1.25 })
	Move({ Id = boss.ObjectId, DestinationId = 40055, SuccessDistance = 32 })
	local notifyName = "WithinDistance" .. boss.ObjectId
	NotifyWithinDistance({ Id = boss.ObjectId, DestinationId = 40055, Distance = 50, Notify = notifyName, Timeout = 9.0, })
	game.waitUntil(notifyName, boss.AIThreadName)

	game.thread(game.PlayVoiceLines, boss.PostMatchTauntVoiceLines, true, boss)
	Stop({ Id = boss.ObjectId })

	game.wait(0.2, game.RoomThreadName)
	AngleTowardTarget({ Id = boss.ObjectId, DestinationId = 50065 })

	game.wait(0.70, game.RoomThreadName)

	local consumableId = SpawnObstacle({ Name = "CharonStoreDiscount", DestinationId = boss.ObjectId, Group = "Standing" })
	local consumable = game.CreateConsumableItem(consumableId, "CharonStoreDiscount", 0)
	game.MapState.RoomRequiredObjects[consumable.ObjectId] = consumable

	SetAnimation({ DestinationId = boss.ObjectId, Name = "CharonMeleeFront_ReturnToIdleLeft" })

	ApplyUpwardForce({ Id = consumableId, Speed = 700 })
	local forceAngle = GetAngleBetween({ Id = boss.ObjectId, DestinationId = game.CurrentRun.Hero.ObjectId })
	ApplyForce({ Id = consumableId, Speed = 300, Angle = forceAngle, SelfApplied = true })

	PlaySound({ Name = "/Leftovers/World Sounds/TrainingMontageWhoosh", Id = consumableId })

	game.wait(2.0, game.RoomThreadName)

	game.ProcessTextLines(boss.BossPresentationOutroTextLineSets)
	game.ProcessTextLines(boss.BossPresentationOutroRepeatableTextLineSets)

	game.RemoveEnemyUI(boss)

	if not game.PlayRandomRemainingTextLines(boss, boss.BossPresentationOutroTextLineSets) then
		game.PlayRandomRemainingTextLines(boss, boss.BossPresentationOutroRepeatableTextLineSets)
	end

	-- Similar lines being played through CharonStoreDiscount pickup
	-- game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.CharonFightRewardVoiceLines, true)

	LockCamera({ Id = game.CurrentRun.Hero.ObjectId, Duration = 1.25 })
	AngleTowardTarget({ Id = boss.ObjectId, DestinationId = 50065 })

	game.wait(0.5, game.RoomThreadName)

	RemoveInputBlock({ Name = "CharonFightEnd" })
	game.RemoveTimerBlock(game.CurrentRun, "CharonEarlyExitPresentation")
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	game.ShowCombatUI("CharonFightEnd")
end

function mod.LeaveCharonFight(eventSource, args)
	args = args or {}
	AddInputBlock({ Name = "LeaveCharonFight" })
	game.wait(args.Delay or 1.0, game.RoomThreadName)

	PlaySound({ Name = "/Leftovers/SFX/NomadSprint", DestinationId = game.CurrentRun.Hero.ObjectId })

	PlaySound({ Name = "/Leftovers/Menu Sounds/AscensionConfirm" })
	Flash({ Id = game.CurrentRun.Hero.ObjectId, Speed = 0.5, MinFraction = 0, MaxFraction = 1.0, Color = game.Color.White, Duration = 1.0, ExpireAfterCycle = false })
	AdjustColorGrading({ Name = "Chaos", Duration = 0.7 })

	game.wait(0.7)

	CreateAnimation({ Name = "ZagreusSecretDoorDiveFadeFx", DestinationId = game.CurrentRun.Hero.ObjectId })
	SetAlpha({ Id = game.CurrentRun.Hero.ObjectId, Fraction = 0, Duration = 0.13 })

	game.wait(0.4)
	game.FullScreenFadeOutAnimation()
	game.wait(0.2)

	RemoveInputBlock({ Name = "LeaveCharonFight" })
	-- Custom: Does nothing
	game.CurrentRun.CurrentRoom.ExitFunctionName = _PLUGIN.guid .. "." .. "ExitFromCharonFightPresentation"
	local nextMap = game.ChooseNextRoomData(game.CurrentRun).Name
	mod.LeaveRoomWithNoDoor(game.CurrentRun, { NextMap = nextMap })
end

-- #endregion

-- #region Boss fight
function mod.RandomizeCover(source, args)
	local coverOptions = args.CoverOptions
	local coverCount = game.RandomInt(args.CoverCountMin or 0, args.CoverCountMax or 0)

	game.wait(args.StartWait, game.RoomThreadName)

	if args.ShakeScreen then
		ShakeScreen({ Speed = 300, Distance = 3, FalloffSpeed = 2000, Duration = 1.0 })
	end

	for i = 1, coverCount do
		local coverId = game.RemoveRandomValue(coverOptions)
		local obstacle = game.MapState.ActiveObstacles[coverId]
		if obstacle ~= nil and not obstacle.ToggledOn then
			if obstacle.ToggleOnAnimation ~= nil then
				SetAnimation({ DestinationId = coverId, Name = obstacle.ToggleOnAnimation })
			end
			SetThingProperty({ Property = "StopsProjectiles", Value = true, DestinationId = coverId })
			obstacle.ToggledOn = true
		end
	end
	for k, coverId in pairs(coverOptions) do
		local obstacle = game.MapState.ActiveObstacles[coverId]
		if obstacle ~= nil and obstacle.ToggledOn then
			if obstacle.ToggleOffAnimation ~= nil then
				SetAnimation({ DestinationId = coverId, Name = obstacle.ToggleOffAnimation })
			end
			SetThingProperty({ Property = "StopsProjectiles", Value = false, DestinationId = coverId })
			obstacle.ToggledOn = false
		end
	end

	game.wait(args.EndWait, game.RoomThreadName)
end

-- #endregion
