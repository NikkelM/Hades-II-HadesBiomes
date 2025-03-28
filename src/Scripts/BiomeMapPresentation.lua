function game.ModsNikkelMHadesBiomesBiomeMapPresentation(source, args)
	print("BiomeMapPresentation: Start")
	-- TODO: Update labels
	local labelData =
	{
		{
			Text = "Hub",
			OffsetX = 20,
			OffsetY = -440,
			Glow = nil,
			GlowOffsetX = nil,
			GlowOffsetY = nil,
		},
		{
			Text = "BiomeF",
			OffsetX = -680,
			OffsetY = 263,
			Glow = "GUI\\BiomeMap\\BiomeMap_Glow_F",
			GlowOffsetX = -690,
			GlowOffsetY = 270 + 355,
			SelectedLoopScale = 1.0,
			SelectedLoopOffsetX = -680,
			SelectedLoopOffsetY = 270 + 340,
			Fog = "GUI\\BiomeMap\\BiomeMap_Fog_F",
			FogOffsetX = -680,
			FogOffsetY = 270 + 340,
		},
		{
			Text = "BiomeG",
			OffsetX = 20,
			OffsetY = 480,
			Glow = "GUI\\BiomeMap\\BiomeMap_Glow_G",
			GlowOffsetX = 20,
			GlowOffsetY = 480 + 340,
			SelectedLoopScale = 0.5,
			SelectedLoopOffsetX = 20,
			SelectedLoopOffsetY = 480 + 340,
			Fog = "GUI\\BiomeMap\\BiomeMap_Fog_G",
			FogOffsetX = 20,
			FogOffsetY = 480 + 340,
			--SpotlightScale = 1.5,
		},
		{
			Text = "BiomeH",
			OffsetX = 633,
			OffsetY = 1335,
			Glow = "GUI\\BiomeMap\\BiomeMap_Glow_H",
			GlowOffsetX = 643,
			GlowOffsetY = 750 + 320,
			SelectedLoopScale = 0.55,
			SelectedLoopOffsetX = 629,
			SelectedLoopOffsetY = 728 + 340,
			Fog = "GUI\\BiomeMap\\BiomeMap_Fog_H",
			FogOffsetX = 661,
			FogOffsetY = 750 + 340,
		},
		{
			Text = "BiomeI",
			OffsetX = 33,
			OffsetY = 1935,
			Glow = "GUI\\BiomeMap\\BiomeMap_Glow_I",
			GlowOffsetX = 11,
			GlowOffsetY = 1260 + 290,
			SelectedLoopScale = 0.60,
			SelectedLoopOffsetX = 10,
			SelectedLoopOffsetY = 1160 + 340,
			Fog = "GUI\\BiomeMap\\BiomeMap_Fog_I",
			FogOffsetX = 30,
			FogOffsetY = 1260 + 340,
		},

		{
			Text = "BiomeN",
			OffsetX = 626,
			OffsetY = -250,
			Glow = "GUI\\BiomeMap\\BiomeMap_Glow_N",
			GlowOffsetX = 613,
			GlowOffsetY = -610,
			SelectedLoopScale = 0.5,
			SelectedLoopOffsetX = 604,
			SelectedLoopOffsetY = -614,
			Fog = "GUI\\BiomeMap\\BiomeMap_Fog_N",
			FogOffsetX = 604,
			FogOffsetY = -614,
		},

		{
			Text = "BiomeO",
			OffsetX = -460,
			OffsetY = -885,
			Glow = "GUI\\BiomeMap\\BiomeMap_Glow_O",
			GlowOffsetX = 15,
			GlowOffsetY = -910,
			SelectedLoopScale = 0.65,
			SelectedLoopOffsetX = 12,
			SelectedLoopOffsetY = -905,
			Fog = "GUI\\BiomeMap\\BiomeMap_Fog_O",
			FogOffsetX = 15,
			FogOffsetY = -910,
		},

		{
			Text = "BiomeP",
			OffsetX = 16,
			OffsetY = -1875,
			Glow = "GUI\\BiomeMap\\BiomeMap_Glow_P",
			GlowOffsetX = 16,
			GlowOffsetY = -1540,
			SelectedLoopScale = 0.5,
			SelectedLoopOffsetX = 16,
			SelectedLoopOffsetY = -1560,
			Fog = "GUI\\BiomeMap\\BiomeMap_Fog_P",
			FogOffsetX = 16,
			FogOffsetY = -1560,
		},
	}

	game.killTaggedThreads("MetaUpgradePresentation")
	for _, id in pairs(game.SessionMapState.ShownMetaUpgradeCardIds) do
		StopAnimation({ Names = { "MetaUpgradeCardFlip", "CardFlipGlowA", "CardFlipGlowB" }, DestinationId = id })
	end
	Destroy({ Ids = game.CollapseTable(game.SessionMapState.ShownMetaUpgradeCardIds) })

	print("BiomeMapPresentation: Loading BiomeMap package")
	AddInputBlock({ Name = "BiomeMapPresentation" })
	-- TODO: Load H1 package
	LoadPackages({ Name = "BiomeMap", IgnoreAssert = true })
	print("BiomeMapPresentation: BiomeMap package loaded successfully")

	-- How often this biome has been shown on the map (Longer wait time for first time)
	game.GameState.BiomeMapRecord[args.BiomeStart] = (game.GameState.BiomeMapRecord[args.BiomeStart] or 0) + 1

	-- setup biome map
	print("BiomeMapPresentation: Setup BiomeMap")
	local groupName = "Combat_UI"
	local backgroundId = SpawnObstacle({ Name = "rectangle01", Group = groupName, LocationX = 0.0, LocationY = 0.0, SortById = true })
	SetColor({ Id = backgroundId, Color = game.Color.Black, Duration = 0 })
	SetScale({ Id = backgroundId, Fraction = 10.0 })
	local biomeMapId = SpawnObstacle({ Name = "BlankObstacle", Group = groupName, LocationX = 0.0, LocationY = 0.0, SortById = true })
	-- TODO: Use own animation
	SetAnimation({ DestinationId = biomeMapId, Name = "GUI\\BiomeMap\\BiomeMap" }) -- nopkg
	-- TODO: Use own animation
	CreateAnimation({ Name = "BiomeMapAnimations", DestinationId = biomeMapId })  -- nopkg
	ClearCameraClamp({ LerpTime = 0 })
	PanCamera({ Id = biomeMapId, Duration = 0.0 })
	LockCamera({ Id = biomeMapId, Duration = 0.0 })
	local mapIds = {}
	table.insert(mapIds, biomeMapId)
	local startingGlowId = nil
	local endingGlowId = nil
	local selectedCircleId = nil
	local selectedCircleEndScale = nil
	local endingFogId = nil
	local endingSpotlightId = nil

	print("BiomeMapPresentation: Setup vignette")
	-- setup vignette
	local vignetteId = game.CreateScreenObstacle({
		Name = "BlankObstacle",
		Group = "Combat_Menu_TraitTray_Overlay",
		X = game.ScreenCenterX,
		Y = game.ScreenCenterY,
		ScaleX = game.ScreenScaleX,
		ScaleY = game.ScreenScaleY,
		Animation = "BiomeMapVignetteLoop"
	})

	-- setup map glows & labels
	for k, label in pairs(labelData) do
		-- TODO: Is this from H1?
		--ShowBiomeMapLabel( label, biomeMapId ) -- don't show label in Biome Map version

		if label.Glow ~= nil then
			local startingAlpha = 0.0
			if label.Text == args.BiomeStart then
				startingAlpha = 1.0
			end
			local glowId = SpawnObstacle({
				Name = "BlankObstacle",
				Group = "Combat_UI_Additive",
				LocationX = label.GlowOffsetX,
				LocationY = label.GlowOffsetY
			})
			SetAnimation({ DestinationId = glowId, Name = label.Glow })
			SetAlpha({ Id = glowId, Fraction = startingAlpha, Duration = 0 })
			if label.Text == args.BiomeStart then
				startingGlowId = glowId
			elseif label.Text == args.BiomeEnd then
				endingGlowId = glowId
			end
			table.insert(mapIds, glowId)
		end

		if label.Text == args.BiomeEnd then
			local startingAlpha = 0.0
			-- TODO: Witch circle animation - remove or update?
			selectedCircleId = SpawnObstacle({
				Name = "BlankObstacle",
				Group = "Combat_Menu_TraitTray_Overlay_Additive",
				LocationX = label.SelectedLoopOffsetX,
				LocationY = label.SelectedLoopOffsetY
			})
			--SetAnimation({ DestinationId = selectedCircleId, Name = "BiomeMapSelectedLoop" }) -- nopkg
			SetAlpha({ Id = selectedCircleId, Fraction = startingAlpha, Duration = 0 })
			selectedCircleEndScale = label.SelectedLoopScale
			SetScale({ Id = selectedCircleId, Fraction = label.SelectedLoopScale * 1.12, Duration = 0 })
			table.insert(mapIds, selectedCircleId)
		end

		-- TODO: Fog on not reached biomes - remove?
		if label.Text ~= args.BiomeStart and label.Text ~= args.BiomeEnd and label.Fog ~= nil and not game.Contains(args.PreviousBiomes, label.Text) then
			local fogId = SpawnObstacle({
				Name = "BlankObstacle",
				Group = "Combat_Menu_TraitTray",
				LocationX = label.FogOffsetX,
				LocationY = label.FogOffsetY
			})
			SetAnimation({ DestinationId = fogId, Name = label.Fog })
			SetAlpha({ Id = fogId, Fraction = 1.0, Duration = 0 })
			SetScale({ Id = fogId, Duration = 12, Fraction = 1.25 })
			table.insert(mapIds, fogId)
		end
		if label.Text == args.BiomeEnd and label.Fog ~= nil then
			endingFogId = SpawnObstacle({
				Name = "BlankObstacle",
				Group = "Combat_Menu_TraitTray",
				LocationX = label.FogOffsetX,
				LocationY = label.FogOffsetY
			})
			SetAnimation({ DestinationId = endingFogId, Name = label.Fog })
			SetAlpha({ Id = endingFogId, Fraction = 1.0, Duration = 0 })
			table.insert(mapIds, endingFogId)

			endingSpotlightId = SpawnObstacle({
				Name = "BlankObstacle",
				Group = "Combat_Menu_TraitTray_Overlay_Text",
				LocationX = label.FogOffsetX,
				LocationY = label.FogOffsetY
			})
			SetAnimation({ DestinationId = endingSpotlightId, Name = "GUI\\BiomeMap\\Spotlight_01" }) --nopkg
			SetAlpha({ Id = endingSpotlightId, Fraction = 0, Duration = 0 })
			SetScale({ Id = endingSpotlightId, Fraction = label.SpotlightScale or 1.0 })
			table.insert(mapIds, endingSpotlightId)
		end
	end

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

	-- adjust scale of Mel based on Circe's spells
	if game.HeroHasTrait("CirceEnlargeTrait") then
		SetScale({ Id = melId, Fraction = 1.70 })
	elseif game.HeroHasTrait("CirceShrinkTrait") then
		SetScale({ Id = melId, Fraction = 0.65 })
	end

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
			DestinationId =
					familiarId
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

	-- setup visual effects
	CreateAnimation({ Name = "BiomeMapDustEmitter", DestinationId = startingGlowId })
	CreateAnimation({ Name = "BiomeMapDustEmitter", DestinationId = endingGlowId })
	SetScale({ Id = vignetteId, Duration = 10, Fraction = 1.2 })

	-- camera start
	game.wait(0.02)
	if args.CrossroadsStart then
		AdjustZoom({ Fraction = 0.785, LerpTime = 0 })
	else
		LockCamera({ Id = melId, Duration = 0 })
		AdjustZoom({ Fraction = 0.950, LerpTime = 0 })
	end

	-- presentation starts
	game.FullScreenFadeInAnimation()
	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFadeLOCATION" })
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.RegionClearedVoiceLines, true)

	-- camera setup
	local destinationId = SpawnObstacle({
		Name = "InvisibleTarget",
		Group = groupName,
		SortById = true,
		LocationX = args.HeroStartOffsetX + args.HeroMoveOffsetX,
		LocationY = args.HeroStartOffsetY + args.HeroMoveOffsetY
	})

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

	local cameraDuration = 1.0
	local cameraEndOffsetY = 0
	if args.CameraEndOffsetY then
		cameraEndOffsetY = args.CameraEndOffsetY
	end
	if args.CrossroadsStart then
		game.wait(1.5)
		PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
		PanCamera({ Id = destinationId, Duration = cameraDuration, EaseIn = 0, EaseOut = 0.5 })
		FocusCamera({ Fraction = 0.90, Duration = cameraDuration, ZoomType = "Ease" })
	else
		cameraDuration = 1.95
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

		if game.GameState.BiomeMapRecord[args.BiomeStart] <= 1 then
			game.wait(args.AdditionalFirstTimeWait)
		end

		PanCamera({ Id = destinationId, OffsetY = cameraEndOffsetY, Duration = cameraDuration, EaseIn = 0, EaseOut = 0.5 })
		FocusCamera({ Fraction = 0.85, Duration = cameraDuration, ZoomType = "Ease" })
		SetAlpha({ Id = endingFogId, Fraction = 0.0, Duration = 1.5 })
		local currentScale = GetThingDataValue({ Id = endingFogId, Property = "Scale" })
		SetScale({ Id = endingFogId, Fraction = currentScale * 1.5, Duration = 1.5 })
		PlaySound({ Name = "/SFX/Menu Sounds/HadesMainMenuWhoosh" })
		SetAlpha({ Id = startingGlowId, Fraction = 0.0, Duration = 0.3 })
		SetAlpha({ Id = endingGlowId, Fraction = 1.0, Duration = 0.3 })
		SetAlpha({ Id = endingSpotlightId, Fraction = 0.55, Duration = 1.0 })
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
	-- TODO: Does original work?
	game.thread(game.BiomeMapPresentationFamiliar, source, args, familiarId)

	game.wait(1.0)

	-- punctuation VFX
	if selectedCircleId ~= nil then
		SetAnimation({ DestinationId = selectedCircleId, Name = "BiomeHilightSummoningCircleAnim" }) -- nopkg
		--SetAlpha({ Id = selectedCircleId, Fraction = 1.0, Duration = 0.3 })
		SetScale({ Id = selectedCircleId, Fraction = selectedCircleEndScale, Duration = 0.3 })
	end
	PlaySound({ Name = "/SFX/Menu Sounds/MenuMagicFlashLong", Id = selectedCircleId })

	game.wait(0.1)

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
	if args.CrossroadsStart then
		game.wait(2.2)
	else
		game.wait(1.6)
	end
	if game.GameState.BiomeMapRecord[args.BiomeStart] <= 1 then
		game.wait(args.AdditionalFirstTimeWait)
	end
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
	game.FullScreenFadeOutAnimation()
	RemoveInputBlock({ Name = "BiomeMapPresentation" })
	print("BiomeMapPresentation: End")
end
