-- #region Survival encounter/Survive 45 seconds
function mod.ModsNikkelMHadesBiomesBeginSurvivalEncounter(encounter)
	game.StartEncounterEffects(encounter)
end

function mod.ModsNikkelMHadesBiomesSurvivalEncounterStartPresentation(eventSource, tollTimes, colorGrade, colorFx,
																																			playerGlobalVoiceLines, opponentGlobalVoiceLines)
	-- Custom, as ActiveSpawns is not initialized in TimedSpawns
	eventSource.ActiveSpawns = eventSource.ActiveSpawns or {}
	-- Custom, as EncounterResolvedGlobalVoiceLines is not used in Hades II
	game.CurrentRun.CurrentRoom.CombatResolvedVoiceLines = game.CurrentRun.CurrentRoom.CombatResolvedVoiceLines or
			eventSource.EncounterResolvedGlobalVoiceLines

	AdjustColorGrading({ Name = colorGrade or "Alert", Duration = 0 })
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

	local fullscreenAlertColorFx = SpawnObstacle({
		Name = colorFx or "FullscreenAlertColor",
		Group = "FX_Standing_Top",
		DestinationId = game.ScreenAnchors.FullscreenAlertFxAnchor
	})
	DrawScreenRelative({ Id = fullscreenAlertColorFx })

	AdjustFullscreenBloom({ Name = "AlertBloom", Duration = 0.25 })

	PlaySound({ Name = "/Leftovers/World Sounds/ThunderHuge" })
	ShakeScreen({ Speed = 600, Distance = 6, FalloffSpeed = 2000, Duration = 0.3 })

	local hadesOverlay = CreateScreenObstacle({
		Name = "rectangle01",
		X = game.ScreenCenterX - 420,
		Y = game.ScreenCenterY,
		Group = "Events"
	})
	SetScale({ Id = hadesOverlay, Fraction = 1 })
	SetAlpha({ Id = hadesOverlay, Fraction = 0.0, Duration = 0 })
	Move({ Id = hadesOverlay, Angle = 270, Speed = 5 })

	SetAnimation({ Name = "ModsNikkelMHadesBiomesHadesOverlay", DestinationId = hadesOverlay })

	if not game.CurrentRun.CurrentRoom.BlockHadesOverlay then
		SetAlpha({ Id = hadesOverlay, Fraction = 1.0, Duration = 0 })
	end

	game.wait(0.4, game.RoomThreadName)

	if playerGlobalVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[playerGlobalVoiceLines], true)
	else
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.SurvivalAboutToStartVoiceLines, true)
	end

	game.wait(1.4, game.RoomThreadName)
	local source = {} -- Dummy source for disembodied voice
	source.SubtitleColor = game.Color.HadesVoice
	source.LineHistoryName = "Hades"
	if opponentGlobalVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[opponentGlobalVoiceLines], false, source)
	else
		game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.SurvivalEncounterStartVoiceLines, false, source)
	end

	game.thread(game.HadesVoicelineBlur)
	for index = 1, tollTimes or 3, 1 do
		mod.SurvivalTollPulse()
	end
	AdjustFullscreenBloom({ Name = "NewType10", Duration = 1.4 })
	PlaySound({ Name = "/SFX/SurvivalChallengeStart" })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.17, Duration = 0.4 }, })
	if tollTimes == 0 then
		game.wait(2.4, game.RoomThreadName)
	else
		game.wait(1.4, game.RoomThreadName)
	end

	local activeStemTable = { "Guitar", "Bass", "Drums" }
	SetSoundCueValue({ Names = activeStemTable, Id = game.AudioState.MusicId, Value = 1, Duration = 0.75 })

	AdjustColorGrading({ Name = "Off", Duration = 0.45 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 0.45 })
	SetAlpha({ Id = fullscreenAlertColorFx, Fraction = 0, Duration = 0.45 })
	SetAlpha({ Id = fullscreenAlertDisplacementFx, Fraction = 0, Duration = 0.45 })
	SetAlpha({ Id = hadesOverlay, Fraction = 0.0, Duration = 1 })
	game.wait(1.0, game.RoomThreadName)
	Destroy({ Id = hadesOverlay })
	Destroy({ Ids = { fullscreenAlertColorFx, fullscreenAlertDisplacementFx } })
end

function mod.SurvivalTollPulse()
	PlaySound({ Name = "/Leftovers/SFX/TeamWipedPulse" })
	ShakeScreen({ Speed = 300, Distance = 3, FalloffSpeed = 2000, Duration = 0.3 })
	AdjustColorGrading({ Name = "Alert", Duration = 0.02 })
	AdjustFullscreenBloom({ Name = "AlertBloom", Duration = 0.02 })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.2 }, })
	game.wait(0.02, game.RoomThreadName)
	AdjustColorGrading({ Name = "Alert", Duration = 1.0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 1.0 })
	game.wait(1.0, game.RoomThreadName)
end

function mod.ModsNikkelMHadesBiomesHandleTimedSpawns(eventSource, args)
	local currentRun = game.CurrentRun
	local currentRoom = game.CurrentRun.CurrentRoom
	local currentEncounter = eventSource

	local newSpawns = currentEncounter.SpawnWaves
	local nextLayerIndex = 1

	local timeLimit = currentEncounter.TimeLimit
	local startingTime = game._worldTime
	currentEncounter.RemainingTime = timeLimit
	currentEncounter.TimeModifier = currentEncounter.TimeModifier or 0

	game.CheckObjectiveSet(currentEncounter.EncounterType)
	game.CheckObjectiveSet(game.EncounterData[currentEncounter.Name].ObjectiveSets)

	game.UpdateObjective(currentEncounter.EncounterType, "RemainingSeconds", math.ceil(currentEncounter.RemainingTime))
	game.thread(mod.SurvivalObjectivePresentation, currentEncounter)

	currentEncounter.ActiveEnemyCap = game.CalculateActiveEnemyCap(currentRun, currentRoom, currentEncounter)

	if currentEncounter.SpawnHazards then
		game.thread(game.HandleHazardSpawns, currentRoom, currentEncounter)
	end

	if game.SessionState.BlockSpawns then
		game.waitUntil("BlockSpawnsOff")
	end
	game.wait(1.0, game.RoomThreadName)

	local spawnIntervalStart = 0
	local nextSpawnInterval = 0

	local lastTrapActivateTime = 0
	local trapType = game.GetRandomValue(currentEncounter.TrapTypes)
	currentEncounter.DisabledTrapIds = GetIds({ Name = "Traps" })
	currentEncounter.EnabledTrapIds = {}

	-- While there is still time
	currentEncounter.TimeIsUp = false
	while currentEncounter.RemainingTime > 0 do
		-- Check if there are new spawn layers to add
		if newSpawns ~= nil and newSpawns[nextLayerIndex] ~= nil and currentEncounter.RemainingTime <= newSpawns[nextLayerIndex].AddAtTime then
			game.AddEncounterLayer(currentRun, currentRoom, currentEncounter, newSpawns[nextLayerIndex])
			nextLayerIndex = nextLayerIndex + 1
		end

		-- Spawn a new unit
		if game._worldTime > spawnIntervalStart + nextSpawnInterval then
			if currentEncounter.ActiveEnemyCap == nil or game.GetActiveEnemyCount(currentEncounter) < currentEncounter.ActiveEnemyCap then
				game.HandleNextSpawn(currentEncounter)
			elseif game.GetActiveEnemyCount(currentEncounter) >= currentEncounter.ActiveEnemyCap then
				if currentEncounter.SpawnIntervalMin == 0 and currentEncounter.SpawnIntervalMax == 0 then
					nextSpawnInterval = 0.2
				end
			end

			nextSpawnInterval = game.RandomFloat(currentEncounter.SpawnIntervalMin, currentEncounter.SpawnIntervalMax) or 0
			spawnIntervalStart = game._worldTime
		end

		if currentRoom.ElapsedTimeMultiplier then
			startingTime = startingTime + (1 - currentRoom.ElapsedTimeMultiplier) * 0.25
		end
		if game.SessionState.BlockSpawns then
			game.waitUntil("BlockSpawnsOff")
		end
		game.wait(0.25, game.RoomThreadName)
		currentEncounter.RemainingTime = timeLimit - (game._worldTime - startingTime) + currentEncounter.TimeModifier
	end
	currentEncounter.TimeIsUp = true
	game.thread(game.HadesSpeakingPresentation, eventSource,
		{
			VoiceLines = game.GlobalVoiceLines.SurvivalEncounterSurvivedVoiceLines,
			SubtitleColor = game.Color.HadesVoice,
			LineHistoryName = "Hades"
		})

	if currentEncounter.EncounterType == "SurvivalChallenge" then
		game.thread(game.DestroyRequiredKills,
			({ BlockLoot = true, DestroyInterval = currentEncounter.DestroyEnemyInterval or 0.05, BlockDeathWeapons = true }))
	end

	game.thread(game.MarkObjectiveComplete, currentEncounter.EncounterType)
end

function mod.SurvivalObjectivePresentation(survivalEncounter)
	local playedHurryLines = false

	while survivalEncounter.RemainingTime > 0 and not survivalEncounter.TimeIsUp and not survivalEncounter.Completed do
		if survivalEncounter.RemainingTime <= 10 then
			if not playedHurryLines and survivalEncounter.TimeExpiringGlobalVoiceLines ~= nil then
				game.thread(game.PlayVoiceLines, game.GlobalVoiceLines[survivalEncounter.TimeExpiringGlobalVoiceLines], true)
				playedHurryLines = true
			end

			game.UpdateObjective(survivalEncounter.EncounterType, "RemainingSeconds",
				math.ceil(survivalEncounter.RemainingTime), { Pulse = true })
			PlaySound({ Name = "/Leftovers/SFX/FieldReviveSFX" })
			game.wait(1.0, game.RoomThreadName)
		else
			game.UpdateObjective(survivalEncounter.EncounterType, "RemainingSeconds",
				math.ceil(survivalEncounter.RemainingTime))
			PlaySound({ Name = "/Leftovers/SFX/PowerToggleNew" })
			game.wait(1.0, game.RoomThreadName)
		end
	end
	game.UpdateObjective(survivalEncounter.EncounterType, "RemainingSeconds", 1)
end

-- #endregion

-- #region ShrineChallenge/PerfectClear/Erebus Gates
function mod.ModsNikkelMHadesBiomesPerfectClearEncounterStartPresentation(eventSource)
	local encounter = eventSource

	game.PauseMusic()

	game.SecretMusicPlayer("/Music/ErebusChallengeMusic_MC")
	SetSoundCueValue({ Names = { "Guitar", "Bass", "Drums" }, Id = game.AudioState.SecretMusicId, Value = 1 })

	mod.ModsNikkelMHadesBiomesSurvivalEncounterStartPresentation(encounter, 0, "PerfectClear", "FullscreenAlertColorDark",
		"PerfectClearEncounterInitiatedLines", "PerfectClearEncounterStartVoiceLines")
end

modutil.mod.Path.Wrap("PerfectClearObjectiveFailedPresentation", function(base, run)
	base(run)

	if run and run.ModsNikkelMHadesBiomesIsModdedRun and run.CurrentRoom and run.CurrentRoom.Encounter and run.CurrentRoom.Encounter.ModsNikkelMHadesBiomesPostEncounterPlayHadesTaunt then
		local source = {} -- Dummy source for disembodied voice
		source.SubtitleColor = game.Color.HadesVoice
		source.LineHistoryName = "Hades"

		-- This used to be 11, but that was way too low to ever trigger, probably due to a change in when the encounter start time is recorded
		if run.CurrentRoom.Encounter.StartTime ~= nil and game._worldTime - run.CurrentRoom.Encounter.StartTime < 35 then
			if game.CheckCooldown("PerfectClearEncounterFailed", 60.0) then
				game.thread(game.HadesSpeakingPresentation, source,
					{ VoiceLines = game.GlobalVoiceLines.PerfectClearEncounterQuicklyFailedVoiceLines, ColorGrade = "PerfectClear", StartDelay = 1.0 })
			end
		else
			if game.CheckCooldown("PerfectClearEncounterFailed", 60.0) then
				game.thread(game.HadesSpeakingPresentation, source,
					{ VoiceLines = game.GlobalVoiceLines.PerfectClearEncounterFailedVoiceLines, ColorGrade = "PerfectClear", StartDelay = 1.0 })
			end
		end
	end
end)

function mod.PerfectClearEncounterEndPresentation(eventSource)
	if game.AudioState.SecretMusicId ~= nil then
		game.EndMusic(game.AudioState.SecretMusicId, game.AudioState.SecretMusicName)
		game.AudioState.SecretMusicId = nil
		game.AudioState.SecretMusicName = nil
	end

	-- For the Quest tracking
	game.GameState.ModsNikkelMHadesBiomes_SuccessiveErebusEncounterClears = game.GameState
			.ModsNikkelMHadesBiomes_SuccessiveErebusEncounterClears or 0
	if eventSource.PlayerTookDamage then
		game.GameState.ModsNikkelMHadesBiomes_SuccessiveErebusEncounterClears = 0
	else
		game.GameState.ModsNikkelMHadesBiomes_SuccessiveErebusEncounterClears =
				game.GameState.ModsNikkelMHadesBiomes_SuccessiveErebusEncounterClears + 1
	end
end

-- #endregion
