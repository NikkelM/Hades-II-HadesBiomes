function mod.ModsNikkelMHadesBiomesBiomeMapPresentation(source, args)
	local dataTable = {
		Tartarus = {
			FillGraphic = "GUI\\BiomeMap\\MapFill_Tartarus",
			OffsetX = -62,
			OffsetY = 235,
		},
		Asphodel = {
			FillGraphic = "GUI\\BiomeMap\\MapFill_Asphodel",
			OffsetX = 108,
			OffsetY = -453,
		},
		Elysium = {
			FillGraphic = "GUI\\BiomeMap\\MapFill_Elysium",
			OffsetX = 111,
			OffsetY = -1305,
		},
		Styx = {
			FillGraphic = "GUI\\BiomeMap\\MapFill_Styx",
			OffsetX = 80,
			OffsetY = -2040,
		},
	}

	game.killTaggedThreads("MetaUpgradePresentation")
	game.killTaggedThreads("RespawningCoverManager")
	game.killWaitUntilThreads("RespawningCoverDeath")
	if source.RespawningCoverActiveIds ~= nil then
		Destroy({ Ids = game.GetAllValues(source.RespawningCoverActiveIds) }) -- Need to remove before they interally chain back to another animation
		game.wait(0.03)
	end
	local destroyIds = GetIdsByType({ Name = "ShipsFishFlap" })
	if not game.IsEmpty(destroyIds) then
		Destroy({ Ids = destroyIds })
		game.wait(0.2) -- Need to wait for the sounds to finish before unloading them
	end
	for enemyId, enemy in pairs(game.ShallowCopyTable(game.ActiveEnemies) or {}) do
		-- Should maybe call the full CleanupEnemy() but starting leaner
		game.killTaggedThreads("EnemyHealthBarFalloff" .. enemy.ObjectId)
		game.killTaggedThreads("Activating" .. enemy.ObjectId)
		game.killTaggedThreads(enemy.AIThreadName)
		game.killWaitUntilThreads(enemy.AINotifyName)
		BlockVfx({ DestinationId = enemyId })
		Destroy({ Id = enemyId })
	end
	if source.FootstepAnimationL ~= nil then
		SwapAnimation({ Name = "FireFootstepL-Spawner", DestinationName = source.FootstepAnimationL, Reverse = true })
	end
	if source.FootstepAnimationR ~= nil then
		SwapAnimation({ Name = "FireFootstepR-Spawner", DestinationName = source.FootstepAnimationR, Reverse = true })
	end
	for _, id in pairs(game.SessionMapState.ShownMetaUpgradeCardIds) do
		StopAnimation({ Names = { "MetaUpgradeCardFlip", "CardFlipGlowA", "CardFlipGlowB" }, DestinationId = id })
	end
	StopUnattachedAnimation({ Names = { "ErisBombardmentCrater", "ErisBombardmentCraterFade", }, PreventChain = true })
	Destroy({ Ids = game.CollapseTable(game.SessionMapState.ShownMetaUpgradeCardIds) })

	AddInputBlock({ Name = "BiomeMapPresentation" })
	BlockVfx({ DestinationNames = { "Standing_FX", "Standing_FX_02", } })
	UnloadPackageGroup({ Group = "Biome" })
	LoadPackages({ Name = "BiomeMap", IgnoreAssert = true })

	game.GameState.BiomeMapRecord[args.BiomeStart] = (game.GameState.BiomeMapRecord[args.BiomeStart] or 0) + 1

	-- setup biome map
	local groupName = "Combat_UI"
	local backgroundId = SpawnObstacle({ Name = "rectangle01", Group = groupName, LocationX = 0.0, LocationY = 0.0, SortById = true })
	SetColor({ Id = backgroundId, Color = game.Color.Black, Duration = 0 })
	SetScale({ Id = backgroundId, Fraction = 10.0 })

	-- Top must be first so it is sorted behind the bottom for the better fade
	local biomeMapTopId = SpawnObstacle({ Name = "BlankObstacle", Group = groupName, LocationX = 0.0, LocationY = -1874.0, SortById = true })
	local biomeMapBottomId = SpawnObstacle({ Name = "BlankObstacle", Group = groupName, LocationX = 0.0, LocationY = 0.0, SortById = true })
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
	SetAnimation({ Name = dataTable[args.BiomeStart].FillGraphic, DestinationId = previousFillGraphic })
	SetThingProperty({ DestinationId = previousFillGraphic, Property = "Ambient", Value = 0.0 })

	ClearCameraClamp({ LerpTime = 0 })
	FocusCamera({ Fraction = 1.0, Duration = 0.0 })
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
		LocationY = args.HeroStartOffsetY + args.CameraMoveOffsetY
	})

	-- presentation starts
	game.FullScreenFadeInAnimation()
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.RegionClearedVoiceLines, true)

	-- show completed bounties from previous region
	for bountyName, v in pairs(game.CurrentRun.ShrineBountiesCompleted) do
		local bountyData = game.BountyData[bountyName]
		if bountyData ~= nil then
			local prevRoom = game.GetPreviousRoom(game.CurrentRun) or {}
			if game.ContainsAny(bountyData.Encounters, { game.CurrentRun.CurrentRoom.Encounter.Name, prevRoom.Encounter.Name }) then
				-- Custom implementation with new offsets
				mod.BiomeMapShowBounty(source, args, bountyData)

				SetAlpha({ Id = args.TargetItemId, Fraction = 1.0 })
				SetAlpha({ Id = args.BountyBackingId, Fraction = 1.0 })
				SetAlpha({ Id = args.ShrinePointItemId, Fraction = 1.0 })
				SetAlpha({ Id = args.WeaponItemId, Fraction = 1.0 })

				game.wait(1)
				CreateAnimation({
					Name = "BiomeMapBountyComplete",
					DestinationId = args.TargetItemId,
					Group = "Combat_Menu_TraitTray_Overlay",
					Scale = 1.0,
					OffsetY = 0,
					OffsetX = 0
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

	PanCamera({ Id = cameraDestinationId, Duration = 6 + args.HeroMoveDuration, EaseIn = 0.0, EaseOut = 0.5 })

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

	game.wait(1.3)

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

	-- Next biome fill graphic
	local nextFillGraphic = SpawnObstacle({
		Name = "BlankObstacle",
		Group = groupName,
		OffsetX = dataTable[args.BiomeEnd].OffsetX,
		OffsetY = dataTable[args.BiomeEnd].OffsetY,
		SortById = true
	})
	SetThingProperty({ DestinationId = nextFillGraphic, Property = "Ambient", Value = 0.0 })
	SetAlpha({ Id = nextFillGraphic, Fraction = 0.0, Duration = 0.0 })
	SetAnimation({ Name = dataTable[args.BiomeEnd].FillGraphic, DestinationId = nextFillGraphic })

	game.wait(args.HeroMoveDuration / 2)
	SetAlpha({ Id = nextFillGraphic, Fraction = 1.0, Duration = 1.0 })
	SetAlpha({ Id = previousFillGraphic, Fraction = 0.0, Duration = 1.5 })
	game.wait(args.HeroMoveDuration / 2)

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
		if bountyData ~= nil and game.Contains(bountyData.Encounters, args.ShrineBounty) then
			-- Custom implementation with new offsets
			mod.BiomeMapShowBounty(source, args, bountyData)

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

	game.wait(3.5 + (args.AdditionalEndTimeWait or 0))

	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
	game.FullScreenFadeOutAnimation()
	RemoveInputBlock({ Name = "BiomeMapPresentation" })
end

-- Same as original game, but we need different offsets
function mod.BiomeMapShowBounty(source, args, bountyData)
	local screen = game.ScreenData.Shrine
	local bountyGroupName = "Combat_Menu_TraitTray"

	local shrineBountyOffsets = {
		BossHarpy1 = {
			X = -100,
			Y = 250,
		},
		BossHydra = {
			X = 15,
			Y = -180,
		},
		BossTheseusAndMinotaur = {
			X = 100,
			Y = -1300,
		},
		BossHades = {
			X = -170,
			Y = -2050,
		},
	}
	local offset = shrineBountyOffsets[bountyData.Encounters[1]]

	args.TargetItemId = SpawnObstacle({
		Name = "BlankObstacle",
		Group = bountyGroupName,
		SortById = true,
		LocationX = offset.X + screen.BountyTargetOffsetY,
		LocationY = offset.Y + screen.BountyTargetOffsetY
	})
	SetAnimation({ Name = screen.BountyTargetIcons[bountyData.Encounters[1]], DestinationId = args.TargetItemId })
	SetScale({ Id = args.TargetItemId, Fraction = screen.BountyBossIconScale })
	SetAlpha({ Id = args.TargetItemId, Fraction = 0 })

	args.BountyBackingId = SpawnObstacle({
		Name = "BlankObstacle",
		Group = bountyGroupName,
		SortById = true,
		LocationX = offset.X,
		LocationY = offset.Y
	})
	SetAnimation({ Name = "GUI\\Screens\\Shrine\\Testament", DestinationId = args.BountyBackingId })
	SetScale({ Id = args.BountyBackingId, Fraction = screen.BountyBossIconScale })
	SetAlpha({ Id = args.BountyBackingId, Fraction = 0 })

	local shrinePoints = 0
	local weaponName = nil
	if bountyData.CompleteGameStateRequirements ~= nil then
		for j, completeRequirement in ipairs(bountyData.CompleteGameStateRequirements) do
			if completeRequirement.HasAny ~= nil then
				weaponName = completeRequirement.HasAny[1]
			end
			if completeRequirement.Value ~= nil then
				shrinePoints = completeRequirement.Value
			end
		end
	end

	args.ShrinePointItemId = SpawnObstacle({
		Name = "BlankObstacle",
		Group = bountyGroupName,
		SortById = true,
		LocationX = offset.X + screen.BountyShrinePointsOffsetX,
		LocationY = offset.Y + screen.BountyShrinePointsOffsetY
	})
	local bountyShrinePointsFormat = game.ShallowCopyTable(screen.BountyShrinePointsFormat) or {}
	bountyShrinePointsFormat.Id = args.ShrinePointItemId
	bountyShrinePointsFormat.Text = "ShrineScreen_BountyShrinePoints"
	bountyShrinePointsFormat.LuaKey = "TempTextData"
	bountyShrinePointsFormat.LuaValue = { RequiredShrinePoints = shrinePoints }
	bountyShrinePointsFormat.DataProperties = {
		OpacityWithOwner = true,
	}
	CreateTextBox(bountyShrinePointsFormat)
	SetAlpha({ Id = args.ShrinePointItemId, Fraction = 0 })

	args.WeaponItemId = SpawnObstacle({
		Name = "BlankObstacle",
		Group = bountyGroupName,
		SortById = true,
		LocationX = offset.X + screen.BountyWeaponOffsetX,
		LocationY = offset.Y + screen.BountyWeaponOffsetY
	})
	SetAnimation({ Name = screen.BountyWeaponIcons[weaponName], DestinationId = args.WeaponItemId })
	SetScale({ Id = args.WeaponItemId, Fraction = screen.BountyWeaponIconScale })
	SetAlpha({ Id = args.WeaponItemId, Fraction = 0 })
end
