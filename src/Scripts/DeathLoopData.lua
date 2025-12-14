-- Add the setup function to the Hub room
table.insert(game.HubRoomData.Hub_PreRun.StartUnthreadedEvents, {
	FunctionName = _PLUGIN.guid .. "." .. "SpawnHadesRunStartDoor",
})

-- Add the ending portrait function to the Hub_Main
local endingPortraitOnLoadEvent = {
	FunctionName = "StartDeathLoop",
	Args = {
		PresentationFunctionName = _PLUGIN.guid .. "." .. "HubPostModdedCreditsStartPresentation",
		PresentationFunctionArgs = {
			PortraitArgs = {
				PauseMusic = true,
				SecretMusic = "/Music/MusicExploration1_MC",
				PortraitAnimationName = "PortraitFamily",
				FadeInTime = 1.5,
				FadeOutWait = 51,
				PanDuration = 48,
				PortraitGlobalVoiceLines = "StorytellerEndingVoiceLines",
			},
			EndVoiceLines = {
				PreLineWait = 0.6,
				UsePlayerSource = true,
				{ Cue = "/VO/Melinoe_2936", Text = "They were all so happy together, weren't they? And oblivious to the Titan's threat..." },
			}
		},
	},
	GameStateRequirements = {
		{
			PathTrue = { "CurrentRun", "RoomsEntered", "Return06" },
		},
		{
			PathFalse = { "CurrentRun", "UsedStoryReset" },
		},
		{
			PathFalse = { "CurrentHubRoom", },
		},
	},
	BreakIfPlayed = true,
}
table.insert(game.HubRoomData.Hub_Main.OnLoadEvents, 1, endingPortraitOnLoadEvent)

function mod.SpawnHadesRunStartDoor(source, args)
	-- Vow shrine would be: 589694
	-- Run start door for the underworld
	local spawnId = 420947

	local chaosGate = game.DeepCopyTable(game.ObstacleData.SecretDoor) or {}

	chaosGate.ObjectId = SpawnObstacle({
		Name = "ModsNikkelMHadesBiomes_HadesRunStartDoor",
		Group = "FX_Terrain",
		DestinationId = spawnId,
		AttachedTable = chaosGate,
		OffsetX = 800,
		OffsetY = 10,
	})
	chaosGate.ActivateIds = { chaosGate.ObjectId }

	chaosGate.SetupEvents = {
		{
			FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUpdateEscapeDoorForLimitGraspShrineUpgrade",
		},
	}
	chaosGate.SpeakerName = nil
	chaosGate.DistanceTrigger = {
		GameStateRequirements = {
			NamedRequirementsFalse = { "SurfaceRouteLockedByTyphonKill" },
		},
		WithinDistance = 800,
		VoiceLines = {
			Queue = "Always",
			PlayOnce = true,
			PlayOnceContext = "ModsNikkelMHadesBiomes_HadesRunStartDoorApproach",
			UsePlayerSource = true,
			{ Cue = "/VO/MelinoeField_2868", Text = "A Chaos Gate, up here?", },
			{ Cue = "/VO/Melinoe_5753",      Text = "Through dreams and time, the past reveals itself...", PreLineWait = 0.4, },
			{ Cue = "/VO/MelinoeField_3424", Text = "Brother...",                                          PreLineWait = 0.4, },
		}
	}
	chaosGate.UnlockedSound = nil
	chaosGate.HealthCost = nil
	chaosGate.ExitBlockedVoiceLines = nil
	chaosGate.ExitDoorOpenAnimation = nil
	chaosGate.ModsNikkelMHadesBiomesIsRunStartDoor = true

	chaosGate.UseText = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText"
	-- Normally this would check if the exit door for a room can be used - we always allow it
	-- Might add a requirement here if we ever put Hades runs behind a requirement/enchantment
	chaosGate.OnUseEvents = {}
	chaosGate.OnUsedFunctionName = _PLUGIN.guid .. "." .. "StartHadesRun"
	chaosGate.OnUsedFunctionArgs = {
		-- TODO: For debugging, change to currently worked on biome
		StartingBiome = "Tartarus",
		-- Don't play a voiceline - we do this when entering the Chaos gate
		-- We have to do it then, as otherwise MelinoeField needs to be loaded in PreThingCreation
		GlobalVoiceLines = "EmptyStartNewHadesRunVoiceLines",
		-- For the DirectionHintPresentation if LimitGraspShrineUpgradeEscapeDoorClosed is active
		AltarId = 589766,
	}
	-- Used by LeaveRoomSecretDoorPresentation to determine the fade animation
	chaosGate.Room = {}

	game.SetupObstacle(chaosGate)
	AddToGroup({ Id = chaosGate.ObjectId, Name = "ModsNikkelMHadesBiomes.RunStartDoor" })
	-- Enable MelinoeField voicelines when entering the Chaos gate
	game.LoadVoiceBanks({ Name = "MelinoeField" })
end

function mod.StartHadesRun(source, args)
	args = args or {}
	-- Don't allow rain in underworld/modded runs
	game.GameState.NextBiomeStateName = "VanillaState"

	local useAltDiveAnimation = false
	if (game.GameState.ModsNikkelMHadesBiomesCompletedRunsCache or 0) > 2 and game.RandomChance(0.25) then
		useAltDiveAnimation = true
	end
	mod.StartHadesRunSecretDoorPresentation(source, useAltDiveAnimation)

	game.UseEscapeDoor(source, args)
end

function mod.StartHadesRunSecretDoorPresentation(secretDoor, useAltDiveAnimation)
	game.HideCombatUI("StartHadesRunSecretDoorPresentation")
	AddInputBlock({ Name = "StartHadesRunSecretDoorPresentation" })
	game.ToggleCombatControl({ "AdvancedTooltip" }, false, "LeaveRoom")

	-- preserve audio/VO presentation
	game.CleanupCustomRoomSounds()
	PlaySound({ Name = "/SFX/Menu Sounds/ChaosRoomEnterExit" })
	game.thread(game.PlayVoiceLines, mod.StartNewHadesRunVoiceLines)
	-- game.thread(game.InCombatText, secretDoor.ObjectId, "SecretPassageOpened", 1)
	Stop({ Id = game.CurrentRun.Hero.ObjectId })

	local unequipAnimation = game.GetEquippedWeaponValue("UnequipAnimation") or "MelinoeIdleWeaponless"
	SetAnimation({ Name = unequipAnimation, DestinationId = game.CurrentRun.Hero.ObjectId, SpeedMultiplier = 2 })
	game.wait(0.5)
	SetAnimation({ Name = "Melinoe_Witchcraft_Start", DestinationId = game.CurrentRun.Hero.ObjectId, })

	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.7 }, })
	Flash({ Id = game.CurrentRun.Hero.ObjectId, Speed = 0.5, MinFraction = 0, MaxFraction = 1.0, Color = Color.White, Duration = 1.0, ExpireAfterCycle = false })
	AdjustColorGrading({ Name = "WeatherSnowCinders", Duration = 0.7 })

	game.wait(0.6)
	AdjustFullscreenBloom({ Name = "NewType09", Duration = 0.1 })
	game.wait(0.2)

	SetAnimation({ Name = "Melinoe_Witchcraft_End", DestinationId = game.CurrentRun.Hero.ObjectId, })
	AdjustFullscreenBloom({ Name = "Off", Duration = 0.3 })
	PlaySound({ Name = "/Leftovers/SFX/PlayerRespawn" })

	-- She goes through the Oceanus-style sequence of jumping up and in
	PanCamera({ Id = secretDoor.ObjectId, Duration = 1.1, OffsetY = -50, EaseOut = 0 })
	game.wait(0.5)
	if useAltDiveAnimation then
		SetAnimation({ Name = "Melinoe_DiveExit_Portal_Start", DestinationId = CurrentRun.Hero.ObjectId, SpeedMultiplier = 0.75 })
	else
		SetAnimation({ Name = "Melinoe_Drop_Exit_Start", DestinationId = game.CurrentRun.Hero.ObjectId, SpeedMultiplier = 0.5 })
	end
	AdjustColorGrading({ Name = "RainSubtle", Duration = 0.4 })
	if useAltDiveAnimation then
		game.wait(0.53)
		PlaySound({ Name = "/Leftovers/SFX/PlayerJumpMedium" })
	else
		game.wait(0.35)
	end

	PlaySound({ Name = "/VO/MelinoeEmotes/EmoteEvading" })
	local args = {}
	args.SuccessDistance = 20
	args.DisableCollision = true
	local exitPath = {}
	table.insert(exitPath, secretDoor.ObjectId)
	game.thread(game.MoveHeroAlongPath, exitPath, args)

	game.wait(0.2)
	PanCamera({ Id = secretDoor.ObjectId, Duration = 1.2, OffsetY = 85, Retarget = true })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.25 }, })
	if not useAltDiveAnimation then
		game.thread(game.SlightDescent)
	end

	-- Custom wait amount
	game.wait(0.2)
	game.FullScreenFadeOutAnimation("ModsNikkelMHadesBiomesRoomTransitionIn")

	game.WaitForSpeechFinished()

	RemoveInputBlock({ Name = "StartHadesRunSecretDoorPresentation" })
	game.ToggleCombatControl({ "AdvancedTooltip" }, true, "LeaveRoom")
end
