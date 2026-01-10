-- #region ForbiddenShopItem spawn
function mod.CheckForbiddenShopItem(eventSource, args)
	print("CheckForbiddenShopItem called")
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

	SetAnimation({ Name = "MelTalkBrooding01", DestinationId = game.CurrentRun.Hero.ObjectId })
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
