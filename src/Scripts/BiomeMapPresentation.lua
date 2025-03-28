function game.ModsNikkelMHadesBiomesBiomeMapPresentation(source, args)
	local dataTable = {
		Tartarus = {
			PreviousFillGraphic = "GUI\\BiomeMap\\MapFill_Tartarus",
			FillGraphic = "GUI\\BiomeMap\\MapFill_Asphodel",
			OffsetX = -62,
			OffsetY = 234,
			-- PactRewardOffsetX = -100,
			-- PactRewardOffsetY = 250,
			-- PactRewardRoomName = "A_Boss",
			-- Index = 1,
			-- BiomePanDurationIncrease = 1.2,
		},
		Asphodel = {
			PreviousFillGraphic = "GUI\\BiomeMap\\MapFill_Asphodel",
			FillGraphic = "GUI\\BiomeMap\\BiomeMapFill_Elysium",
			OffsetX = 108,
			OffsetY = 200,
			-- PactRewardOffsetX = 350,
			-- PactRewardOffsetY = 150,
			-- PactRewardRoomName = "B_Boss01",
			-- Index = 2,
			-- BiomePanDurationIncrease = 2.1,
		},
		Elysium = {
			PreviousFillGraphic = "GUI\\BiomeMap\\MapFill_Elysium",
			FillGraphic = "GUI\\BiomeMap\\MapFill_Styx",
			OffsetX = 111,
			OffsetY = 1190,
			-- PactRewardOffsetX = -300,
			-- PactRewardOffsetY = 200,
			-- PactRewardRoomName = "C_Boss01",
			-- Index = 3,
			-- BiomePanDurationIncrease = 2.3,
		},
		Styx = {
			PreviousFillGraphic = "GUI\\BiomeMap\\MapFill_Elysium",
			FillGraphic = "GUI\\BiomeMap\\MapFill_Styx",
			OffsetX = 0,
			OffsetY = 1675,
			-- PactRewardOffsetX = 200,
			-- PactRewardOffsetY = 400,
			-- PactRewardRoomName = "D_Boss01",
			-- Index = 4,
			-- BiomePanDurationIncrease = 0,
		},
	}

	game.killTaggedThreads("MetaUpgradePresentation")
	for _, id in pairs(game.SessionMapState.ShownMetaUpgradeCardIds) do
		StopAnimation({ Names = { "MetaUpgradeCardFlip", "CardFlipGlowA", "CardFlipGlowB" }, DestinationId = id })
	end
	Destroy({ Ids = game.CollapseTable(game.SessionMapState.ShownMetaUpgradeCardIds) })

	AddInputBlock({ Name = "BiomeMapPresentation" })
	LoadPackages({ Name = "BiomeMap", IgnoreAssert = true })

	-- setup biome map
	local groupName = "Combat_UI"
	local backgroundId = SpawnObstacle({ Name = "rectangle01", Group = groupName, LocationX = 0.0, LocationY = 0.0, SortById = true })
	SetColor({ Id = backgroundId, Color = game.Color.Black, Duration = 0 })
	SetScale({ Id = backgroundId, Fraction = 10.0 })

	-- Bottom must be first so it is sorted behind the top
	local biomeMapBottomId = SpawnObstacle({ Name = "BlankObstacle", Group = groupName, LocationX = 0.0, LocationY = 0.0, SortById = true })
	local biomeMapTopId = SpawnObstacle({ Name = "BlankObstacle", Group = groupName, LocationX = 0.0, LocationY = -1872.0, SortById = true })
	SetAnimation({ DestinationId = biomeMapTopId, Name = "GUI\\BiomeMap\\MapTop" })
	SetAnimation({ DestinationId = biomeMapBottomId, Name = "GUI\\BiomeMap\\MapBottom" })

	-- Overlay graphics for previous and next biome
	local previousFillGraphic = SpawnObstacle({
		Name = "BlankObstacle",
		Group = groupName,
		OffsetX = dataTable[args.BiomeStart].OffsetX,
		OffsetY = dataTable[args.BiomeStart].OffsetY,
		SortById = true
	})
	SetAnimation({ Name = dataTable[args.BiomeStart].PreviousFillGraphic, DestinationId = previousFillGraphic })
	SetThingProperty({ DestinationId = previousFillGraphic, Property = "Ambient", Value = 0.0 })

	-- TODO: Next biome overlay - start with move?

	ClearCameraClamp({ LerpTime = 0 })
	FocusCamera({ Fraction = 0.95, Duration = 0.0 })
	PanCamera({ Id = biomeMapBottomId, OffsetY = args.HeroStartOffsetY, Duration = 0.0 })

	-- setup marker units
	local melId = SpawnObstacle({
		Name = "BlankObstacle3D",
		Group = "Combat_Menu_TraitTray",
		SortById = true,
		LocationX = args.HeroStartOffsetX,
		LocationY = args.HeroStartOffsetY
	})
	SetThingProperty({ Property = "GrannyModel", Value = "MelMarker_Mesh", DestinationId = melId })
	SetAnimation({ Name = "MelMarkerIdle", DestinationId = melId })

	local playerTeamIds = { melId }
	local familiarId = nil
	if game.MapState.FamiliarUnit ~= nil and game.MapState.FamiliarUnit.MarkerModel ~= nil then
		familiarId = SpawnObstacle({
			Name = "BlankObstacle3D",
			Group = "Combat_Menu_TraitTray",
			SortById = true,
			LocationX = args.FamiliarStartOffsetX,
			LocationY = args.FamiliarStartOffsetY
		})
		SetThingProperty({
			Property = "GrannyModel",
			Value = game.MapState.FamiliarUnit.MarkerModel,
			DestinationId = familiarId
		})
		SetAnimation({ Name = game.MapState.FamiliarUnit.MarkerIdleAnimation, DestinationId = familiarId })
		table.insert(playerTeamIds, familiarId)
	end

	local extraObjectIds = {}
	if args.ExtraObjects ~= nil then
		for i, objectData in pairs(args.ExtraObjects) do
			local id = SpawnObstacle({
				Name = objectData.Name,
				Group = "Combat_Menu_TraitTray",
				SortById = true,
				LocationX = objectData.OffsetX,
				LocationY = objectData.OffsetY
			})
			table.insert(extraObjectIds, id)
			if objectData.Model ~= nil then
				SetThingProperty({ Property = "GrannyModel", Value = objectData.Model, DestinationId = id })
			end
			if objectData.Animation ~= nil then
				SetAnimation({ Name = objectData.Animation, DestinationId = id })
			end
			if objectData.Angle ~= nil then
				SetAngle({ Angle = objectData.Angle, Id = id })
			end
		end
	end

	local melAngle = math.atan2(-args.HeroMoveOffsetY, args.HeroMoveOffsetX)
	SetAngle({ Ids = playerTeamIds, Angle = math.deg(melAngle) })

	local cameraDestinationId = SpawnObstacle({
		Name = "InvisibleTarget",
		Group = groupName,
		SortById = true,
		LocationX = 0,
		LocationY = args.HeroStartOffsetY + 1.5 * args.HeroMoveOffsetY
	})

	PanCamera({ Id = cameraDestinationId, Duration = 8 + args.HeroMoveDuration, EaseIn = 0.0, EaseOut = 0.5 })

	-- presentation starts
	game.FullScreenFadeInAnimation()
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.RegionClearedVoiceLines, true)

	-- show completed bounties from previous region
	for bountyName, v in pairs(game.CurrentRun.BountiesCompleted) do
		local bountyData = game.BountyData[bountyName]
		if bountyData ~= nil then
			local prevRoom = game.GetPreviousRoom(CurrentRun)
			if game.CurrentRun.CurrentRoom.Encounter.Name == bountyData.Encounter or
					prevRoom.Encounter.Name == bountyData.Encounter then
				-- Original - Alternative not implemented/checked if needed
				game.BiomeMapShowBounty(source, args, bountyData)

				SetAlpha({ Id = args.TargetItemId, Fraction = 1.0 })
				SetAlpha({ Id = args.BountyBackingId, Fraction = 1.0 })
				SetAlpha({ Id = args.ShrinePointItemId, Fraction = 1.0 })
				SetAlpha({ Id = args.WeaponItemId, Fraction = 1.0 })

				game.wait(1.1)
				CreateAnimation({
					Name = "ExorcismCorrectFlash",
					DestinationId = args.TargetItemId,
					Group = "Combat_Menu_TraitTray_Overlay",
					Scale = 0.9,
					OffsetY = -45,
					OffsetX = 10
				})
				PlaySound({ Name = "/SFX/Menu Sounds/BiomeMapRewardIcon", Id = args.TargetItemId })
				game.wait(0.05)
				SetColor({ Id = args.TargetItemId, Color = Color.Black, Duration = 0.25 })
				SetColor({ Id = args.BountyBackingId, Color = Color.Black, Duration = 0.25 })
				SetColor({ Id = args.ShrinePointItemId, Color = Color.Black, Duration = 0.25 })
				SetColor({ Id = args.WeaponItemId, Color = Color.Black, Duration = 0.25 })
				ModifyTextBox({ Id = args.ShrinePointItemId, Color = Color.Black })
				SetAlpha({ Id = args.ShrinePointItemId, Fraction = 0, Duration = 0.25 })
				game.wait(0.05)
			end
		end
	end

	if args.ShrinePointItemId then
		game.wait(0.35)
		SetScale({ Id = args.TargetItemId, Fraction = 0, Duration = 0.2 })
		SetScale({ Id = args.BountyBackingId, Fraction = 0, Duration = 0.2 })
		SetScale({ Id = args.ShrinePointItemId, Fraction = 0, Duration = 0.2 })
		SetScale({ Id = args.WeaponItemId, Fraction = 0, Duration = 0.2 })
		StopAnimation({ Name = "StaffReloadTimerReady", DestinationId = args.TargetItemId })
	else
		game.wait(1.05)
	end

	game.wait(1.5)

	-- move pieces
	SetAnimation({ Name = "MelMarkerMove", DestinationId = melId })
	local moveSound = PlaySound({ Name = "/SFX/Player Sounds/HermesRushSpeedTrailSFX", Id = melId })
	SetVolume({ Id = moveSound, Value = 0.8, Duration = 0.0 })
	Move({
		Id = melId,
		OffsetX = args.HeroMoveOffsetX,
		OffsetY = args.HeroMoveOffsetY,
		Duration = args.HeroMoveDuration,
		EaseIn = args.MoveEaseIn,
		EaseOut = args.MoveEaseOut,
		ShiftThingsByOffset = true
	})
	game.thread(game.BiomeMapPresentationFamiliar, source, args, familiarId)

	game.wait(args.HeroMoveDuration)

	-- marker land
	SetAnimation({ Name = "MelMarkerIdle", DestinationId = melId })
	CreateAnimation({ Name = "BiomeMapDustRingShadow", DestinationId = melId, GroupName = "Combat_UI", Scale = 0.31, OffsetY = 80, OffsetX = 10 })
	CreateAnimation({ Name = "BiomeMapDustRing", DestinationId = melId, GroupName = "Combat_UI", Scale = 0.62, OffsetY = 80, OffsetX = 10 })
	PlaySound({ Name = "/Leftovers/SFX/PlayerSkid", Id = melId })
	StopSound({ Id = moveSound, Duration = 0.3 })

	-- jump any banners
	if not game.IsEmpty(extraObjectIds) then
		SetAnimation({ Name = "BannerMarkerJump", DestinationIds = extraObjectIds })
		Move({ Id = extraObjectIds, OffsetX = -200, OffsetY = -100, Duration = 10, EaseIn = 0.1, EaseOut = 2.0, ShiftThingsByOffset = true })
		PlaySound({ Name = "/SFX/CharonOarImpact", Id = melId })
	end

	-- show any bounties on the current region
	if args.ShrineBounty ~= nil and game.GameState.ActiveShrineBounty ~= nil and (game.CurrentRun.ActiveBounty == nil or game.CurrentHubRoom ~= nil) then
		local bountyData = game.BountyData[game.GameState.ActiveShrineBounty]
		if bountyData ~= nil and bountyData.Encounter == args.ShrineBounty then
			-- Original - Alternative not implemented/checked if needed
			game.BiomeMapShowBounty(source, args, bountyData)

			game.wait(0.65)
			CreateAnimation({ Name = "ShoutFlare", DestinationId = args.TargetItemId, Group = "Combat_Menu_TraitTray", Scale = 1.5, OffsetY = 120 })
			CreateAnimation({ Name = "TraitUpdate", DestinationId = args.TargetItemId, Group = "Combat_Menu_TraitTray", Scale = 2.0 })
			PlaySound({ Name = "/SFX/Menu Sounds/MirrorFlash2" })

			game.wait(0.10)

			SetAlpha({ Id = args.TargetItemId, Fraction = 1.0 })
			SetAlpha({ Id = args.BountyBackingId, Fraction = 1.0 })
			SetAlpha({ Id = args.ShrinePointItemId, Fraction = 1.0 })
			SetAlpha({ Id = args.WeaponItemId, Fraction = 1.0 })

			game.wait(0.88)

			if not game.IsEmpty(extraObjectIds) then
				SetAnimation({ Name = "BannerMarkerIdle", DestinationIds = extraObjectIds })
				PlaySound({ Name = "/SFX/CharonOarImpact", Id = melId })
				Stop({ Ids = extraObjectIds })
			end
		end
	end

	game.wait(4.25)

	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
	game.FullScreenFadeOutAnimation()
	RemoveInputBlock({ Name = "BiomeMapPresentation" })
end
