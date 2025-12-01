function mod.ThanatosPreSpawnPresentation(eventSource)
	game.HideCombatUI("ThanatosIntro")

	AdjustColorGrading({ Name = "Thanatos", Duration = 0.5 })
	AdjustFullscreenBloom({ Name = "Subtle", Duration = 0.5 })
	ShakeScreen({ Distance = 7, Speed = 400, FalloffSpeed = 2000, Duration = 0.5 })
	PlaySound({ Name = "/SFX/ThanatosEntranceSound" })

	game.wait(0.5, game.RoomThreadName)

	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ThanatosSpawningVoiceLines, true)

	game.wait(1.5, game.RoomThreadName)
	game.thread(mod.DisplayLocationText, nil, {
		Text = "ThanatosMessage",
		Delay = 0.95,
		FadeColor = { 0, 1, 0.7, 1 },
		AnimationName = "ModsNikkelMHadesBiomesInfoBannerErebusIn",
		AnimationOutName = "ModsNikkelMHadesBiomesInfoBannerErebusOut",
	})
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAscendedDark" })

	AdjustColorGrading({ Name = "Off", Duration = 3.0, Delay = 3.0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 0.5, Delay = 3.0 })

	game.wait(0.5, game.RoomThreadName)

	-- "/Music/ThanatosTheme_MC"
	game.SecretMusicPlayer("{f63fc90b-4f43-4303-959e-cae0aac1e430}")
	SetSoundCueValue({ Names = { "Keys" }, Id = game.AudioState.SecretMusicId, Value = 1 })
	SetSoundCueValue({ Names = { "Drums" }, Id = game.AudioState.SecretMusicId, Value = 0 })
end

function mod.HandleThanatosSpawn(eventSource)
	local currentRun = game.CurrentRun
	local currentRoom = game.CurrentRun.CurrentRoom
	local currentEncounter = eventSource

	local newUnit = game.DeepCopyTable(game.EnemyData.NPC_Thanatos_Field_01) or {}
	local spawnPointId = game.SelectSpawnPoint(currentRoom, newUnit,
		{ SpawnNearId = currentRun.Hero.ObjectId, SpawnRadius = 500 })
	if spawnPointId == nil then
		spawnPointId = currentRun.Hero.ObjectId
	end
	newUnit.ObjectId = SpawnUnit({ Name = "NPC_Thanatos_Field_01", Group = "Standing", DestinationId = spawnPointId })
	currentEncounter.ThanatosId = newUnit.ObjectId
	game.SetupUnit(newUnit, game.CurrentRun, { IgnoreAI = true, PreLoadBinks = true, IgnoreAssert = true, })
	game.MapState.RoomRequiredObjects[newUnit.ObjectId] = newUnit
	UseableOff({ Id = newUnit.ObjectId })
	game.ActivatedObjects = game.ActivatedObjects or {}
	game.ActivatedObjects[newUnit.ObjectId] = newUnit
	mod.ThanatosSpawnPresentation(newUnit)
	game.SetupAI(game.CurrentRun, newUnit)

	currentRun.ThanatosSpawns = currentRun.ThanatosSpawns + 1
end

function mod.ThanatosSpawnPresentation(thanatos)
	AddInputBlock({ Name = "ThanatosSpawnPresentation" })
	game.SetPlayerInvulnerable("ThanatosSpawnPresentation")

	CreateAnimation({ Name = "ThanatosTeleport", DestinationId = thanatos.ObjectId })

	game.thread(game.PlayVoiceLines, thanatos.EntranceVoiceLines, nil, thanatos)
	wait(0.5, game.RoomThreadName)

	PanCamera({ Ids = thanatos.ObjectId, Duration = 1.5, EaseIn = 0.05, EaseOut = 0.3 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })

	AngleTowardTarget({ Id = thanatos.ObjectId, DestinationId = game.CurrentRun.Hero.ObjectId })

	game.wait(0.35, game.RoomThreadName)

	AngleTowardTarget({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = thanatos.ObjectId })

	game.wait(2.0, game.RoomThreadName)

	game.ProcessTextLines(thanatos.BossPresentationIntroTextLineSets)
	game.ProcessTextLines(thanatos.BossPresentationTextLineSets)
	game.ProcessTextLines(thanatos.BossPresentationRepeatableTextLineSets)

	-- if game.GameState.TextLinesRecord["ThanatosFirstAppearance"] then
	game.wait(0.5, game.RoomThreadName)
	-- else
	-- 	game.wait(2.0, game.RoomThreadName)
	-- end

	if not game.PlayRandomRemainingTextLines(thanatos, thanatos.BossPresentationIntroTextLineSets) then
		if not game.PlayRandomRemainingTextLines(thanatos, thanatos.BossPresentationTextLineSets) then
			game.PlayRandomRemainingTextLines(thanatos, thanatos.BossPresentationRepeatableTextLineSets)
		end
	end

	game.ShowCombatUI("ThanatosIntro")

	LockCamera({ Id = game.CurrentRun.Hero.ObjectId, Duration = 1.25 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })

	game.wait(0.8, game.RoomThreadName)
	-- Custom
	game.SetupAI(thanatos)

	RemoveInputBlock({ Name = "ThanatosSpawnPresentation" })
	SetPlayerVulnerable("ThanatosSpawnPresentation")
end

function mod.ThanatosEncounterStartPresentation(eventSource)
	for k, unit in pairs(game.ActiveEnemies) do
		if unit.EncounterStartVoiceLines ~= nil then
			game.thread(game.PlayVoiceLines, unit.EncounterStartVoiceLines, nil, unit)
		end
	end

	game.wait(0.5, game.RoomThreadName)

	SetSoundCueValue({ Names = { "Drums" }, Id = game.AudioState.SecretMusicId, Value = 1 })
end

function mod.BeginThanatosEncounter()
	game.StartEncounterEffects(game.CurrentRun)
end

function mod.ThanatosPostCombat(enemy)
	local currentRun = game.CurrentRun

	enemy.PostCombatTravel = true
	local moveToId = game.SelectLootSpawnPoint(game.CurrentRun.CurrentRoom) or currentRun.Hero.ObjectId
	local distanceToTarget = GetDistance({ Id = enemy.ObjectId, DestinationId = moveToId })

	if distanceToTarget > enemy.PostCombatTeleportIfPastDistance then
		mod.ThanatosTeleportToExit(enemy, moveToId)
	else
		Move({ Id = enemy.ObjectId, DestinationId = moveToId, Mode = "Precise" })
		enemy.AINotifyName = "WithinDistance" .. enemy.ObjectId
		NotifyWithinDistance({ Id = enemy.ObjectId, DestinationId = moveToId, Distance = 100, Notify = enemy.AINotifyName, Timeout = 10.0 })
		game.waitUntil(enemy.AINotifyName, enemy.AIThreadName)
	end

	Stop({ Id = enemy.ObjectId })
	AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = currentRun.Hero.ObjectId })

	-- Thanatos challenge bonus reward
	enemy.AINotifyName = "WithinDistance" .. enemy.ObjectId
	NotifyWithinDistance({
		Id = enemy.ObjectId,
		DestinationId = currentRun.Hero.ObjectId,
		Distance = 400,
		Notify = enemy.AINotifyName,
		Timeout = 10.0
	})
	game.waitUntil(enemy.AINotifyName, enemy.AIThreadName)
	enemy.PostCombatTravel = false
	mod.HandleThanatosEncounterReward(enemy)
end

function mod.ThanatosTeleportToExit(enemy, exitId)
	game.wait(4.0, enemy.AIThreadName)
	CreateAnimation({ Name = "ThanatosTeleport", DestinationId = enemy.ObjectId })
	game.wait(0.05, enemy.AIThreadName)
	Teleport({ Id = enemy.ObjectId, DestinationId = exitId })
	game.wait(0.05, enemy.AIThreadName)
	CreateAnimation({ Name = "ThanatosTeleport", DestinationId = enemy.ObjectId })
	game.wait(0.5, enemy.AIThreadName)
	game.thread(game.DirectionHintPresentation, enemy)
end

function mod.ThanatosExit(source, args)
	args = args or {}
	if args.UseMaxedPresentation then
		AddInputBlock({ Name = "ThanatosExit" })
	end
	UseableOff({ Id = source.ObjectId })
	source.CanReceiveGift = false
	source.InteractTextLineSets = nil
	game.wait(args.WaitTime or 0)

	SetAnimation({ Name = "NPCThanatosExit", DestinationId = source.ObjectId })
	CreateAnimation({ Name = "ThanatosTeleport", DestinationId = source.ObjectId })
	SetAlpha({ Id = source.ObjectId, Fraction = 0.0, Duration = 0.35 })
	AdjustColorGrading({ Name = "Thanatos", Duration = 0.25 })

	if not args.IgnoreMusic then
		game.StopSecretMusic(true)
	end

	source.NextInteractLines = nil
	game.RefreshUseButton(source.ObjectId, source)
	game.StopStatusAnimation(source)

	if not args.SkipExitReaction then
		game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ThanatosExitReactionVoiceLines, true)
	end

	game.wait(0.5, game.RoomThreadName)
	AdjustColorGrading({ Name = "Off", Duration = 1.35 })

	if args.UseMaxedPresentation then
		game.MaxedRelationshipPresentation(source, { Text = "NPC_Thanatos_01", Icon = "Keepsake_ThanatosSticker_Max" })
	end

	source.Mute = true
	game.CurrentRun.EventState[source.ObjectId] = { FunctionName = _PLUGIN.guid .. "." .. "ThanatosExitSilent", Args = args }

	if args.UseMaxedPresentation then
		RemoveInputBlock({ Name = "ThanatosExit" })
	end

	game.wait(1.0, game.RoomThreadName)

	if game.ActivatedObjects ~= nil and game.ActivatedObjects[source.ObjectId] ~= nil and not game.CurrentRun.Hero.IsDead then
		game.ActivatedObjects[source.ObjectId] = nil
		game.wait(0.2, game.RoomThreadName)
		if game.CheckRoomExitsReady(game.CurrentRun.CurrentRoom) then
			game.UnlockRoomExits(game.CurrentRun, game.CurrentRun.CurrentRoom)
		end
	end

	game.CheckCodexUnlock("ModsNikkelMHadesBiomesCodexEntry", "NPC_Thanatos_01")
end

function mod.ThanatosExitSilent(source, args)
	source.Mute = true
	source.InteractTextLineSets = nil
	source.CanReceiveGift = false
	SetAnimation({ Name = "NPCThanatosExited", DestinationId = source.ObjectId })
end

function mod.HandleThanatosEncounterReward(thanatos, args)
	local encounter = game.CurrentRun.CurrentRoom.Encounter

	if (encounter.ThanatosKills or 0) > (encounter.PlayerKills or 0) then
		-- Player loss
		game.thread(game.MarkObjectiveComplete, "ThanatosKills")
		game.thread(game.MarkObjectiveFailed, "PlayerKills")

		thanatos.KillChallengeArgs.Consumables = thanatos.KillChallengeArgs.FailConsumables
	else
		-- Player win
		game.thread(game.MarkObjectiveFailed, "ThanatosKills")
		game.thread(game.MarkObjectiveComplete, "PlayerKills")

		thanatos.KillChallengeArgs.Consumables = thanatos.KillChallengeArgs.SuccessConsumables

		if encounter.ThanatosKills == encounter.PlayerKills then
			game.thread(game.PlayVoiceLines, thanatos.EncounterTiedVoiceLines, nil, thanatos)
		else
			game.thread(game.PlayVoiceLines, thanatos.EncounterLostVoiceLines, nil, thanatos)
		end
	end

	-- Need to move his kills into CurrentRun as otherwise they are not kept in the save
	game.CurrentRun.ModsNikkelMHadesBiomesTotalThanatosKills = (game.CurrentRun.ModsNikkelMHadesBiomesTotalThanatosKills or 0) + (encounter.ThanatosKills or 0)

	game.NPCRewardDropPreProcessArgs(thanatos.KillChallengeArgs)
	game.NPCRewardDrop(thanatos, thanatos.KillChallengeArgs)

	game.CheckAvailableTextLines(thanatos)
	AngleTowardTarget({ Id = thanatos.ObjectId, DestinationId = game.CurrentRun.Hero.ObjectId })
	if thanatos.NextInteractLines ~= nil then
		UseableOn({ Id = thanatos.ObjectId })
	else
		game.CheckDistanceTrigger(mod.PresetEventArgs.ThanatosFarewells, thanatos)
		game.ActivatedObjects[thanatos.ObjectId] = nil
		game.wait(0.2, game.RoomThreadName)
		if game.CheckRoomExitsReady(game.CurrentRun.CurrentRoom) then
			game.UnlockRoomExits(game.CurrentRun, game.CurrentRun.CurrentRoom)
		end
	end
end

function mod.ThanatosDropPresentation(source, args)
	SetAnimation({ DestinationId = source.ObjectId, Name = "ThanatosTalkDismissal_Start" })
	game.wait(0.3)
	SetAnimation({ DestinationId = source.ObjectId, Name = "ThanatosTalkDismissal_Return" })
end

-- #region COMBAT
function mod.CurseHealthBar(victim)
	-- if not game.HeroData.DefaultHero.HeroAlliedUnits[victim.Name] then
	if not game.UnitSets.PlayerSummons[victim.Name] then
		victim.CursedHealthBarEffect = true
		game.UpdateHealthBar(victim, 0, { Force = true })

		-- Custom, for the challenge tracking
		victim.ModsNikkelMHadesBiomesIsThanatosCursed = true
	end
end

function mod.TrackThanatosChallengeProgress(encounter, victim, killer)
	if victim.IgnoreThanatosChallengeTracker then
		return
	end

	if killer ~= nil and killer.KillOwner ~= nil then
		if killer.KillOwner == game.CurrentRun.Hero.ObjectId then
			killer = game.CurrentRun.Hero
		else
			killer = game.ActiveEnemies[killer.KillOwner]
		end
	end

	local maxTimeSincePlayerDamage = encounter.MaxTimeSincePlayerDamage or 5
	if killer ~= nil and killer.ObjectId == encounter.ThanatosId then
		encounter.ThanatosKills = encounter.ThanatosKills + 1
		game.UpdateObjectiveDescription("ThanatosKills", "Objective_ThanatosKills", "ThanatosKills", encounter.ThanatosKills)
	elseif killer ~= nil and killer == CurrentRun.Hero then
		encounter.PlayerKills = encounter.PlayerKills + 1
		game.UpdateObjectiveDescription("PlayerKills", "Objective_PlayerKills", "PlayerKills", encounter.PlayerKills)
	elseif victim ~= nil and (victim.ModsNikkelMHadesBiomesIsThanatosCursed or game.Contains(victim.ActiveEffectsAtDamageStart, "ThanatosCurse")) then
		-- Custom case added
		encounter.ThanatosKills = encounter.ThanatosKills + 1
		game.UpdateObjectiveDescription("ThanatosKills", "Objective_ThanatosKills", "ThanatosKills", encounter.ThanatosKills)
	elseif victim ~= nil and victim.TimeOfLastPlayerDamage ~= nil and _worldTime - victim.TimeOfLastPlayerDamage < maxTimeSincePlayerDamage then
		encounter.PlayerKills = encounter.PlayerKills + 1
		game.UpdateObjectiveDescription("PlayerKills", "Objective_PlayerKills", "PlayerKills", encounter.PlayerKills)
	end
end

-- #endregion
