modutil.mod.Path.Wrap("DestroyDoorRewardPresenation", function(base, door)
	if door.AdditionalAttractIds ~= nil then
		Destroy({ Ids = GetAllValues(door.RewardPreviewBackingIds) })
	end
	if door.DoorIconFront ~= nil then
		Destroy({ Id = door.DoorIconFront })
	end
	base(door)
end)

modutil.mod.Path.Wrap("StartRoomPresentation", function(base, currentRun, currentRoom)
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun and currentRoom.StartRoomPresentationOnReload and currentRoom.ModsNikkelMHadesBiomesPostCombatReloadThreadedEventsDHub then
		game.RunThreadedEvents(game.RoomData[currentRoom.Name].ModsNikkelMHadesBiomesPostCombatReloadThreadedEventsDHub,
			currentRoom)
	end

	base(currentRun, currentRoom)
end)

-- Always force using the original Hades room transition animation in modded runs
modutil.mod.Path.Wrap("FullScreenFadeInAnimation", function(base, animationName, colorGradeName)
	if game.CurrentHubRoom == nil and game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		animationName = "ModsNikkelMHadesBiomesRoomTransitionOut"
	end
	base(animationName, colorGradeName)
end)

-- The animation on the run start Chaos gate is defined on a custom function
modutil.mod.Path.Wrap("FullScreenFadeOutAnimation", function(base, animationName, colorGradeName)
	if game.CurrentHubRoom == nil and game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		animationName = "ModsNikkelMHadesBiomesRoomTransitionIn"
	end
	base(animationName, colorGradeName)
end)

modutil.mod.Path.Context.Wrap('DeathPresentation', function(currentRun, killer, deathArgs)
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
		modutil.mod.Path.Wrap('DisplayInfoBanner', function(base, source, infoArgs)
			if infoArgs.Text == "DeathMessage" then
				-- Normal death during a run
				infoArgs.Text = "ModsNikkelMHadesBiomes_DeathMessage"
			elseif infoArgs.Text == "OutroDeathMessageAlt" or infoArgs.Text == "OutroDeathMessageTrueEnding" then
				if currentRun.CurrentRoom.Name == "E_Story01" then
					-- True ending death in Persephone's cottage
					infoArgs.Text = "OutroDeathMessage"
				else
				-- The run was cleared
				infoArgs.Text = "PostEndingDeathMessage"
				end
			end
			base(source, infoArgs)
		end)
	end
end)

modutil.mod.Path.Wrap("DeathPresentation", function(base, currentRun, killer, args)
	if currentRun.ModsNikkelMHadesBiomesIsModdedRun then
		-- Destroy any IDs that we marked as such. E.g. Alecto rage meter or Asphodel door reward front animation
		local destroyIdsOnDeath = currentRun.CurrentRoom.ModsNikkelMHadesBiomesDestroyIdsOnDeath or {}
		if not game.IsEmpty(destroyIdsOnDeath) then
			Destroy({ Ids = destroyIdsOnDeath })
		end

		-- #region Modified Hades/Hades II DeathPresentation - Comment in the base() call at the end to revert to normal behaviour
		-- -- When enabling this, also add in the ZagreusDeathFullscreen animation in RequiredFileData.lua and in Hero_Melinoe_Animation_Personality.sjson.lua
		-- rom.audio.load_bank(rom.path.combine(_PLUGIN.plugins_data_mod_folder_path,
		-- 	"Content\\Audio\\Desktop\\ModsNikkelMHadesBiomesMusicModded.bank"))
		-- -- Overwrite the DeathStinger for this room - we always want to play the custom event if it is a modded run
		-- currentRun.CurrentRoom.Encounter.DeathStinger = "{84435f74-4111-43c5-8246-8b3e2736794d}"
		-- AddInputBlock({ Name = "DeathPresentation" })
		-- ClearCameraClamp({ LerpTime = 0.4 })
		-- ZeroMouseTether("DeathPresentation")
		-- LockCameraMotion("DeathPresentation")
		-- ToggleCombatControl(CombatControlsDefaults, false, "DeathPresentation")
		-- HideCombatUI("Death", { FadeDuration = 0.0 })
		-- -- Would be better to move the layers of the death sequence up but avoiding changing the many fragile layers it has
		-- RemoveRoomRewardPreviews()
		-- RemoveScreenEdgeIndicators()
		-- RemoveInspectPoints()
		-- SetConfigOption({ Name = "UseOcclusion", Value = false })

		-- if IsScreenOpen("Codex") then
		-- 	CloseCodexScreen()
		-- end

		-- StopAnimation({ Id = killer.ObjectId, Names = { "HealthBarArmorShatter", "ArmorBreak" } })
		-- CleanupEnemies({ Destroy = true, DestroyIgnoreId = killer.ObjectId })
		-- ExpireProjectiles({ Silent = true, BlockSpawns = true, IncludeToAdd = true })
		-- ClearEffect({ Id = killer.ObjectId, All = true, BlockAll = true })
		-- EffectPostClearAll(killer)
		-- RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = "All", Method = "cancelCharge" })
		-- RunWeaponMethod({ Id = CurrentRun.Hero.ObjectId, Weapon = "All", Method = "ForceControlRelease" })
		-- SetThingProperty({ Property = "AllowAnyFire", Value = false, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })
		-- if MapState.ManaChargeIndicatorIds then
		-- 	Destroy({ Ids = { MapState.ManaChargeIndicatorIds.BackingId, } })
		-- end
		-- for k, encounter in ipairs(currentRun.CurrentRoom.ActiveEncounters) do
		-- 	if encounter.UseGroupHealthBar then
		-- 		notifyExistingWaiters(encounter.Name .. "GroupHealthBarDead")
		-- 	end
		-- end
		-- StopAmbientSound({ All = true })
		-- StopSound({ Id = AudioState.SecretMusicId, Duration = 0.25 })
		-- AudioState.SecretMusicId = nil
		-- AudioState.SecretMusicName = nil
		-- if AudioState.RainSoundId ~= nil then
		-- 	StopSound({ Id = AudioState.RainSoundId, Duration = 0.2 })
		-- 	AudioState.RainSoundId = nil
		-- end
		-- if AudioState.ChronosTimeSlowSoundId ~= nil then
		-- 	StopSound({ Id = AudioState.ChronosTimeSlowSoundId, Duration = 0.2 })
		-- 	AudioState.ChronosTimeSlowSoundId = nil
		-- end
		-- if AudioState.EliteEncounterMusicId ~= nil then
		-- 	StopSound({ Id = AudioState.EliteEncounterMusicId, Duration = 0.2 })
		-- 	AudioState.EliteEncounterMusicId = nil
		-- end
		-- if AudioState.SkipEncounterMusicId ~= nil then
		-- 	StopSound({ Id = AudioState.SkipEncounterMusicId, Duration = 0.2 })
		-- 	AudioState.SkipEncounterMusicId = nil
		-- end

		-- SetAudioEffectState({ Name = "SpellCharge", Value = 0 })
		-- SetAudioEffectState({ Name = "GlobalEcho", Value = 0 })

		-- SetThingProperty({ Property = "Graphic", Value = "MelinoeGetHitActionPose", DestinationId = CurrentRun.Hero.ObjectId })
		-- ShakeScreen({ Speed = 300, Distance = 3, Duration = 0.27, FalloffSpeed = 1000 })
		-- FocusCamera({ Fraction = 1.0, Duration = 0.27, ZoomType = "Ease" })

		-- Stop({ Id = currentRun.Hero.ObjectId })
		-- Halt({ Id = currentRun.Hero.ObjectId })
		-- SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 0.0, DataValue = false, DestinationNames = { "GroundEnemies", "FlyingEnemies" } })

		-- if killer.DamagedFxStyles ~= nil then
		-- 	for _, animName in pairs(killer.DamagedFxStyles) do
		-- 		StopAnimation({ DestinationId = killer.ObjectId, Name = animName, PreventChain = true, IncludeCreatedAnimations = true })
		-- 	end
		-- end
		-- if killer.StopAnimationsOnHeroKill ~= nil then
		-- 	StopAnimation({ DestinationId = killer.ObjectId, Names = killer.StopAnimationsOnHeroKill, PreventChain = true, IncludeCreatedAnimations = true })
		-- end
		-- RemoveFromGroup({ Id = killer.ObjectId, Names = { "Standing", "GroundEnemies", "FlyingEnemies" } })
		-- AddToGroup({ Id = killer.ObjectId, Name = "Combat_UI", DrawGroup = true })

		-- if currentRun.Hero.AttachedAnimationName ~= nil then
		-- 	StopAnimation({ Name = currentRun.Hero.AttachedAnimationName, DestinationId = currentRun.Hero.ObjectId })
		-- end

		-- if MapState.BossShieldTriggers <= 0 and MapState.BossShieldFx then
		-- 	StopAnimation({ Name = MapState.BossShieldFx, DestinationId = CurrentRun.Hero.ObjectId, IncludeCreatedAnimations = true })
		-- end
		-- currentRun.Hero.Mute = false
		-- currentRun.Hero.CurrentlyPoisoned = nil
		-- SetPlayerInvulnerable("PlayerDeath")

		-- thread(PlayVoiceLines, GlobalVoiceLines.DeathVoiceLines)

		-- if killer.CauseOfDeathVoiceLines ~= nil then
		-- 	thread(PlayVoiceLines, killer.CauseOfDeathVoiceLines, nil, killer)
		-- elseif currentRun.CurrentRoom.Encounter.CauseOfDeathVoiceLines ~= nil then
		-- 	thread(PlayVoiceLines, currentRun.CurrentRoom.Encounter.CauseOfDeathVoiceLines)
		-- elseif currentRun.CurrentRoom.CauseOfDeathVoiceLines ~= nil then
		-- 	thread(PlayVoiceLines, currentRun.CurrentRoom.CauseOfDeathVoiceLines)
		-- end

		-- -- black out world
		-- StopAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessVignetteHold" })
		-- StopAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessGroundFog" })
		-- AdjustFrame({ Color = Color.TransparentRed, Duration = 0.0, Fraction = 0 })

		-- ScreenAnchors.DeathBacking = CreateScreenObstacle({
		-- 	Name = "rectangle01",
		-- 	Group = "Combat_UI_World_Backing",
		-- 	X = ScreenCenterX,
		-- 	Y = ScreenCenterY,
		-- 	Scale = 10.0,
		-- 	ScaleX = ScreenScaleX,
		-- 	ScaleY = ScreenScaleY
		-- })
		-- SetColor({ Id = ScreenAnchors.DeathBacking, Color = Color.Black })
		-- SetAlpha({ Id = ScreenAnchors.DeathBacking, Fraction = 1.0, Duration = 0 })

		-- ScreenAnchors.DeathBackground = CreateScreenObstacle({
		-- 	Name = "rectangle01",
		-- 	Group = "Combat_UI_World_Backing",
		-- 	X = ScreenCenterX,
		-- 	Y = ScreenCenterY,
		-- 	Scale = 10.0,
		-- 	ScaleX = ScreenScaleX,
		-- 	ScaleY = ScreenScaleY
		-- })
		-- SetColor({ Id = ScreenAnchors.DeathBackground, Color = Color.Black })
		-- SetAlpha({ Id = ScreenAnchors.DeathBackground, Fraction = 1.0, Duration = 0 })

		-- RemoveFromGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing" })
		-- AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Combat_Menu", DrawGroup = true })
		-- thread(DoRumble, currentRun.Hero.HeroFinalHitRumbleParameters)

		-- Flash({ Id = CurrentRun.Hero.ObjectId, Speed = 0.02, MinFraction = 1.0, MaxFraction = 0.0, Color = Color.Red, Duration = 1.51, ExpireAfterCycle = true })
		-- ShakeScreen({ Speed = 0, Distance = 0, Duration = 10.0 })

		-- wait(0.02)
		-- SetThingProperty({
		-- 	Property = "ElapsedTimeMultiplier",
		-- 	Value = 0.0,
		-- 	DataValue = false,
		-- 	DestinationId = killer.ObjectId
		-- })
		-- PlaySound({ Name = "/SFX/Player Sounds/IrisDeathStartFwoosh" })
		-- PlaySound({ Name = "/SFX/Player Sounds/PlayerDeath" })

		-- wait(1.11)

		-- SetAlpha({ Id = killer.ObjectId, Fraction = 0, Duration = 0.2 })

		-- wait(0.21)
		-- PlaySound({ Name = "/SFX/Player Sounds/IrisDeathStab" })
		-- if CurrentRun.BountyCleared then
		-- 	PlaySound({ Name = "/Music/ChaosVictoryStinger" })
		-- elseif CurrentRun.Cleared and CurrentRun.CurrentRoom.RoomSetName == "I" then
		-- 	PlaySound({ Name = "/Music/IrisHadesDeathStingerOrch_MC" })
		-- elseif CurrentRun.Cleared and CurrentRun.CurrentRoom.RoomSetName == "Q" then
		-- 	PlaySound({ Name = "/Music/IrisDeathStingerOrch_MC" })
		-- else
		-- 	PlaySound({ Name = currentRun.CurrentRoom.Encounter.DeathStinger or "/Music/IrisDeathStinger" })
		-- end

		-- local sceneOffsetY = -95
		-- PanCamera({ Id = currentRun.Hero.ObjectId, Duration = 0.2, OffsetY = sceneOffsetY, Retarget = true, EaseIn = 0.0, EaseOut = 1.0 })
		-- FocusCamera({ Fraction = 1.47, Duration = 0.2, ZoomType = "Ease" })
		-- local melDeathFlash = CreateScreenComponent({
		-- 	Name = "BlankObstacle",
		-- 	Group = "Overlay",
		-- 	X = ScreenCenterX,
		-- 	Y = ScreenCenterY,
		-- 	Animation = "MelDeathFlash",
		-- 	ScaleX = ScreenScaleX,
		-- 	ScaleY = ScreenScaleY
		-- })
		-- SetGoalAngle({ Id = currentRun.Hero.ObjectId, Angle = 315, CompleteAngle = true })

		-- for i = 1, 16 do
		-- 	CreateAnimation({
		-- 		Name = "MelDeathLine",
		-- 		DestinationId = ScreenAnchors.DeathBackground,
		-- 		Group = "Combat_Menu_TraitTray_Overlay_Additive"
		-- 	})
		-- end

		-- SetThingProperty({ Property = "Grip", Value = 99999, DestinationId = CurrentRun.Hero.ObjectId })

		-- SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, DataValue = false, DestinationNames = { "HeroTeam" } })
		-- SetGoalAngle({ Id = currentRun.Hero.ObjectId, Angle = 315, CompleteAngle = true })

		-- if CurrentRun.ActiveBounty ~= nil then
		-- 	LoadVoiceBanks("Chaos", nil, true)
		-- 	if CurrentRun.BountyCleared then
		-- 		local subtitleText = nil
		-- 		local subtitleTimeData = nil
		-- 		if GameState.PackagedBountyClears[CurrentRun.ActiveBounty] > 1 and GameState.PackagedBountyClearRecordTime[CurrentRun.ActiveBounty] == CurrentRun.GameplayTime then
		-- 			subtitleText = "PackagedBountyComplete_Subtitle"
		-- 			subtitleTimeData = { LuaKey = "TempTextData", LuaValue = { ClearTime = GetTimerString(CurrentRun.GameplayTime, 2) } }
		-- 		end
		-- 		thread(DisplayInfoBanner, nil, {
		-- 			Text = "PackagedBountyEndedMessage",
		-- 			Delay = 0.75,
		-- 			TextColor = Color.White,
		-- 			FontScale = 0.85,
		-- 			AnimationName = "LocationBackingIrisChaosIn",
		-- 			AnimationOutName = "LocationBackingIrisChaosOut",
		-- 			AppearSound = "/SFX/ChaosBoonChoice",
		-- 			Duration = 4.25,
		-- 			TextOffsetY = 25,
		-- 			SubTextColor = Color.ChaosVoice,
		-- 			SubtitleTextRevealSound = "/SFX/Menu Sounds/BiomeMapRewardIcon",
		-- 			SubtitleOffsetY = -10,
		-- 			SubtitleText = subtitleText,
		-- 			SubtitleData = subtitleTimeData,
		-- 			BackingGradientAnimationName = "LocationBackingGradientThick",
		-- 		})
		-- 	else
		-- 		-- Bounty failed
		-- 		thread(DisplayInfoBanner, nil, {
		-- 			Text = "BountyFailedMessage",
		-- 			Delay = 0.75,
		-- 			TextColor = { 200, 64, 64, 255 },
		-- 			FontScale = 0.85,
		-- 			AnimationName = "LocationBackingIrisChaosIn",
		-- 			AnimationOutName = "LocationBackingIrisChaosOut",
		-- 			AppearSound = "/SFX/ChaosBoonChoice",
		-- 			Duration = 4.25,
		-- 			TextOffsetY = 25,
		-- 		})
		-- 	end
		-- elseif CurrentRun.Cleared then
		-- 	thread(DisplayInfoBanner, nil,
		-- 		{
		-- 			Text = "ModsNikkelMHadesBiomes_OutroDeathMessageAlt",
		-- 			Delay = 0.95,
		-- 			Color = Color.Red,
		-- 			Layer = "Overlay",
		-- 			AnimationName =
		-- 			"LocationTextBGDeath",
		-- 			AnimationOutName = "LocationTextBGDeathOut",
		-- 			ThreadName = "Outro",
		-- 			Duration = 4.25,
		-- 			TextOffsetY = 0
		-- 		})
		-- else
		-- 	thread(DisplayInfoBanner, nil,
		-- 		{
		-- 			Text = "ModsNikkelMHadesBiomes_DeathMessage",
		-- 			Delay = 0.95,
		-- 			Color = Color.Red,
		-- 			Layer = "Overlay",
		-- 			AnimationName =
		-- 			"LocationTextBGDeath",
		-- 			AnimationOutName = "LocationTextBGDeathOut",
		-- 			TextOffsetY = 0
		-- 		})
		-- end
		-- SetAnimation({ DestinationId = currentRun.Hero.ObjectId, Name = "ZagreusDeathFullscreen" })
		-- wait(4.23)
		-- thread(PlayVoiceLines, GlobalVoiceLines.DeathReturnVoiceLines)
		-- SetThingProperty({ Property = "Grip", Value = "Default", DestinationId = CurrentRun.Hero.ObjectId })
		-- wait(0.13)
		-- Destroy({ Id = melDeathFlash.Id })

		-- wait(0.3)
		-- Teleport({ Id = killer.ObjectId, OffsetX = 0, OffsetY = 0 })
		-- ClearLootDrops(killer)

		-- wait(0.55)

		-- if currentRun.CurrentRoom.Encounter.DeathExtraSounds ~= nil then
		-- 	local randomSound = GetRandomValue(currentRun.CurrentRoom.Encounter.DeathExtraSounds)
		-- 	PlaySound({ Name = randomSound })
		-- end

		-- if ShouldIncrementEasyMode() and (CurrentRun.EasyModeIncremented or not GameState.EasyModeHadMaxPresentation) then
		-- 	thread(EasyModeLevelUpPresentation)
		-- 	wait(3.0)
		-- end

		-- local deathTauntTime = 3.6
		-- local encounter = CurrentRun.CurrentRoom.Encounter
		-- if CurrentRun.CurrentRoom.KilledByChaosCurse or CurrentRun.ActiveBounty then
		-- 	-- Chaos Death Taunt
		-- 	LoadPackages({ Names = "Chaos", IgnoreAssert = true })
		-- 	thread(HadesSpeakingPresentation, { SubtitleColor = LootData.TrialUpgrade.SubtitleColor },
		-- 		{
		-- 			OverlayAnim = "ChaosOverlay",
		-- 			BlockScreenshake = true,
		-- 			PortraitDuration = 2,
		-- 			VoiceLines = LootData.TrialUpgrade.DeathTauntVoiceLines
		-- 		}) -- nopkg
		-- 	wait(deathTauntTime)
		-- elseif encounter ~= nil then
		-- 	local encounterData = EncounterData[encounter.Name]
		-- 	if not encounter.Completed then
		-- 		if encounterData.HeroDeathEvents ~= nil then
		-- 			RunEventsGeneric(encounterData.HeroDeathEvents, encounter, args)
		-- 		elseif CurrentRun.CurrentRoom.Encounter.SpurnedGodName ~= nil then
		-- 			-- Olympian Death Taunt
		-- 			local spurnedGodName = CurrentRun.CurrentRoom.Encounter.SpurnedGodName
		-- 			local spurnedGodData = LootData[spurnedGodName]
		-- 			thread(HadesSpeakingPresentation, { SubtitleColor = spurnedGodData.SubtitleColor },
		-- 				{
		-- 					OverlayAnim = spurnedGodData.OverlayAnim,
		-- 					BlockScreenshake = true,
		-- 					PortraitDuration = 2,
		-- 					VoiceLines =
		-- 							spurnedGodData.DeathTauntVoiceLines
		-- 				})
		-- 			wait(deathTauntTime)
		-- 		elseif CurrentRun.CurrentRoom.Encounter.TookChaosCurseDamage ~= nil or CurrentRun.ActiveBounty then
		-- 			-- Chaos Death Taunt
		-- 			LoadPackages({ Names = "Chaos", IgnoreAssert = true })
		-- 			thread(HadesSpeakingPresentation, { SubtitleColor = LootData.TrialUpgrade.SubtitleColor },
		-- 				{
		-- 					OverlayAnim = "ChaosOverlay",
		-- 					BlockScreenshake = true,
		-- 					PortraitDuration = 2,
		-- 					VoiceLines = LootData
		-- 							.TrialUpgrade.DeathTauntVoiceLines
		-- 				}) -- nopkg
		-- 			wait(deathTauntTime)
		-- 		end
		-- 	end
		-- end

		-- wait(1.75)

		-- SetAlpha({ Id = currentRun.Hero.ObjectId, Fraction = 0.0, Duration = 0.2 })

		-- SetThingProperty({ Property = "AllowAnyFire", Value = true, DestinationId = CurrentRun.Hero.ObjectId, DataValue = false })

		-- WaitForSpeechFinished()

		-- -- un-chipmunkify Mel only after all speech has finished
		-- currentRun.Hero.SpeechParams.Chipmunk = nil
		-- SetAudioEffectState({ Name = "Chipmunk", Value = 0 })

		-- UnlockCameraMotion("DeathPresentation")
		-- RemoveInputBlock({ Name = "DeathPresentation" })
		-- ToggleCombatControl(CombatControlsDefaults, true, "DeathPresentation")
		-- SetConfigOption({ Name = "UseOcclusion", Value = true })
		-- #endregion
		base(currentRun, killer, args)
	else
		base(currentRun, killer, args)
	end
end)

function mod.AsphodelEnterRoomPresentation(currentRun, currentRoom, endLookAtId, skipCameraLockOnEnd)
	local roomIntroSequenceDuration = currentRoom.IntroSequenceDuration or game.RoomData.BaseRoom.IntroSequenceDuration or
			0.8

	AddInputBlock({ Name = "EnterRoomPresentation" })
	game.SetPlayerInvulnerable("EnterRoomPresentation")
	FadeIn({ Duration = 0.0 })
	game.FullScreenFadeInAnimation()

	if currentRoom.HeroStartPoint ~= nil then
		Teleport({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroStartPoint })
	end

	local heroStartPointId = currentRoom.HeroStartPoint or
			GetClosest({ Id = currentRun.Hero.ObjectId, DestinationIds = GetIdsByType({ Name = "HeroStart" }) })
	local boatId = GetClosest({ Id = heroStartPointId, DestinationIds = GetIdsByType({ Name = "AsphodelBoat01" }) })
	local boatMovePoint = GetClosest({ Id = boatId, DestinationIds = GetIdsByType({ Name = "BoatMovePoint" }) })
	local boatMovePointExit = SpawnObstacle({ Name = "BlankObstacle", DestinationId = boatId, Group = "Scripting" })
	LockCamera({ Id = boatId, Duration = 1.0 })

	for k, unusedBoatId in pairs(GetIdsByType({ Name = "AsphodelBoat01" }) or {}) do
		if boatId ~= unusedBoatId then
			Destroy({ Id = unusedBoatId })
		end
	end

	local offset = game.CalcOffset(math.rad(GetAngleBetween({ Id = boatId, DestinationId = heroStartPointId }) or 0),
		GetDistance({ Id = boatId, DestinationId = heroStartPointId })) or { X = 0, Y = 0 }
	Attach({ Id = currentRun.Hero.ObjectId, DestinationId = boatId, OffsetX = offset.X, OffsetY = offset.Y })
	AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = boatMovePoint })
	AdjustZLocation({ Id = boatId, Distance = 10, Duration = 0.0 })
	Move({ Id = boatId, DestinationId = boatMovePoint, Duration = 1.0, EaseOut = 1.0 })
	-- Shake({ Id = raftMovePoint, Distance = 2, Speed = 100, Duration = 0.3 })
	game.wait(0.9)

	AdjustZLocation({ Id = boatId, Distance = -10, Duration = 0.5 })
	SetAnimation({ DestinationId = boatId, Name = "AsphodelBoatSink" })

	game.wait(0.35)

	StopSound({ Id = game.AsphodelBoatSoundId, Duration = 0.2 })
	game.AsphodelBoatSoundId = nil
	-- PlaySound({ Name = "/Leftovers/World Sounds/CaravanWaterBuck2", Id = raftMovePoint })
	local rumbleParams = { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.3 }, }
	game.thread(game.DoRumble, rumbleParams)

	game.wait(0.15)
	AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = currentRoom.HeroEndPoint })
	game.wait(0.03)

	if currentRoom.CameraEndPoint ~= nil then
		PanCamera({ Id = currentRoom.CameraEndPoint, Duration = roomIntroSequenceDuration, EaseIn = 0.0, EaseOut = 0.0 })
	end
	if currentRoom.HeroEndPoint ~= nil then
		CreateGroup({ Name = "Standing_Front" })
		InsertGroupInFront({ Name = "Standing_Front", DestinationName = "Standing" })
		AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing_Front", DrawGroup = true })
		game.thread(game.MoveHeroToRoomPosition,
			{
				DestinationId = currentRoom.HeroEndPoint,
				DisableCollision = true,
				UseDefaultSpeed = true,
				AngleTowardsIdOnEnd = endLookAtId
			})
	end
	game.wait(0.03)

	RemoveFromGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing_Front" })
	AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing", DrawGroup = true })
	Unattach({ Id = currentRun.Hero.ObjectId, DestinationId = boatId })
	game.thread(game.PlayVoiceLines, currentRoom.EnterVoiceLines, true)
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[currentRoom.EnterGlobalVoiceLines], true)
	game.wait(roomIntroSequenceDuration - 0.03)

	if not skipCameraLockOnEnd then
		LockCamera({ Id = currentRun.Hero.ObjectId, Duration = 0.5 })
	end

	RemoveInputBlock({ Name = "EnterRoomPresentation" })
	game.SetPlayerVulnerable("EnterRoomPresentation")
	game.ShowCombatUI("LeaveRoomPresentation")
end

function mod.AsphodelLeaveRoomPresentation(currentRun, exitDoor)
	local exitDoorId = exitDoor.ObjectId
	AddInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })
	game.SetPlayerInvulnerable("LeaveRoomPresentation")
	game.HideCombatUI("LeaveRoomPresentation")

	-- Custom: Prevent the invulnerable hit presentation from playing when leaving the room and not being centered on the boat
	local originalExclusiveOnHitFunctionName = currentRun.Hero.ExclusiveOnHitFunctionName
	currentRun.Hero.ExclusiveOnHitFunctionName = mod.AsphodelLeaveRoomPresentationDummyOnHitFunction

	local door = game.MapState.OfferedExitDoors[exitDoorId]
	local boatId = exitDoorId

	if door ~= nil then
		if door.AdditionalIcons ~= nil and not game.IsEmpty(door.AdditionalIcons) then
			Destroy({ Ids = GetAllValues(door.AdditionalIcons) })
			door.AdditionalIcons = nil
		end
		game.DestroyDoorRewardPresenation(door)
		if door.ExitDoorOpenAnimation ~= nil then
			SetAnimation({ DestinationId = exitDoorId, Name = door.ExitDoorOpenAnimation })
			game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.4 }, })
			game.wait(0.5)
		end
	end

	if currentRun.CurrentRoom.ExitVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, currentRun.CurrentRoom.ExitVoiceLines, true)
	else
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.ExitedAsphodelRoomVoiceLines, true)
	end

	local heroExitPointId = GetClosest({ Id = exitDoorId, DestinationIds = GetIdsByType({ Name = "HeroExit" }), Distance = 600 })

	local boatMovePoint = GetClosest({ Id = boatId, DestinationIds = GetIdsByType({ Name = "BoatMovePoint" }), Distance = 500 })
	if heroExitPointId > 0 then
		local angleToExit = game.GetAngleBetween({ Id = exitDoorId, DestinationId = boatMovePoint })
		if angleToExit < 90 or angleToExit > 270 then
			currentRun.CurrentRoom.ExitDirection = "Right"
		else
			currentRun.CurrentRoom.ExitDirection = "Left"
		end

		PanCamera({ Id = heroExitPointId, Duration = 10.0 })
		SetUnitProperty({ DestinationId = currentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })

		CreateGroup({ Name = "Standing_Front" })
		InsertGroupInFront({ Name = "Standing_Front", DestinationName = "Standing" })
		AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing_Front", DrawGroup = true })

		game.thread(game.MoveHeroToRoomPosition,
			{ DestinationId = heroExitPointId, DisableCollision = false, UseDefaultSpeed = true })
	end
	SetAnimation({ DestinationId = boatId, Name = "AsphodelBoatRise" })

	game.wait(1.0)

	AdjustZLocation({ Id = boatId, Distance = 10, Duration = 0.5 })

	--AngleTowardTarget({ Id = currentRun.Hero.ObjectId, DestinationId = boatMovePoint })
	Move({ Id = boatId, DestinationId = boatMovePoint, Duration = 2.0, EaseIn = 0.4 })
	Shake({ Id = boatMovePoint, Distance = 4, Speed = 100, Duration = 3 })
	PlaySound({ Name = "/SFX/AsphodelIslandTransitionStart", Id = currentRun.Hero.ObjectId })
	game.AsphodelBoatSoundId = PlaySound({ Name = "/SFX/AsphodelIslandTransitionLoop" })

	RemoveFromGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing_Front" })
	AddToGroup({ Id = currentRun.Hero.ObjectId, Name = "Standing", DrawGroup = true })
	local offset = game.CalcOffset(
		math.rad(GetAngleBetween({ Id = boatId, DestinationId = currentRun.Hero.ObjectId }) or 0),
		GetDistance({ Id = boatId, DestinationId = currentRun.Hero.ObjectId })) or { X = 0, Y = 0 }
	Attach({ Id = currentRun.Hero.ObjectId, DestinationId = boatId, OffsetX = offset.X, OffsetY = offset.Y })
	SetThingProperty({ Property = "SortMode", Value = "FromParent", DestinationId = currentRun.Hero.ObjectId })

	game.LeaveRoomAudio(currentRun, exitDoor)

	game.wait(0.2)

	if door ~= nil and door.ExitDoorCloseAnimation ~= nil then
		SetAnimation({ DestinationId = exitDoorId, Name = door.ExitDoorCloseAnimation })
		game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.2 }, })
	end

	game.wait(1.0)

	game.FullScreenFadeOutAnimation()
	AllowShout = false

	currentRun.Hero.ExclusiveOnHitFunctionName = originalExclusiveOnHitFunctionName

	RemoveInputBlock({ Name = "LeaveRoomPresentation" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	SetPlayerVulnerable("LeaveRoomPresentation")
end

-- Doesn't do anything, used to not play the invulnerable hit presentation when leaving the room and not being centered on the boat
function mod.AsphodelLeaveRoomPresentationDummyOnHitFunction(victim, triggerArgs, args)
end

function mod.AngleIdsTowardPlayer(eventSource, args)
	AngleTowardTarget({ Ids = args.Ids, DestinationId = game.CurrentRun.Hero.ObjectId })
end

function mod.AngleIds(eventSource, args)
	AngleTowardTarget({ Ids = args.Ids, DestinationId = args.DestinationId })
end

-- For D_Intro, to allow the cog wheels to place themselves correctly before the fade in
function mod.ModsNikkelMHadesBiomesDelayedRoomEntranceStandard(currentRun, currentRoom)
	game.wait(2.0)
	game.RoomEntranceStandard(currentRun, currentRoom)
end
