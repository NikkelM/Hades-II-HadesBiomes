function mod.DoAssistPresentation(assistData, args)
	local currentRun = game.CurrentRun
	local heroId = currentRun.Hero.ObjectId
	local presentationState = {
		InvulnerabilityName = args.InvulnerabilityName or "ModsNikkelMHadesBiomesAssist",
		SimSpeedName = args.SimSpeedName or "ModsNikkelMHadesBiomesAssist",
		InputBlockName = args.InputBlockName or "ModsNikkelMHadesBiomesAssistPreSummon",
		CombatUIHideKey = args.CombatUIHideKey or "ModsNikkelMHadesBiomesAssistPresentationPortrait",
		EffectAnchorCleanupDelay = args.EffectAnchorCleanupDelay or 0.5,
		UseShoutPresentationCleanup = args.UseShoutPresentationCleanup,
	}

	game.SetPlayerInvulnerable(presentationState.InvulnerabilityName)
	AddInputBlock({ Name = presentationState.InputBlockName })

	PlaySound({ Name = assistData.ProcSound or "/Leftovers/SFX/AuraThrowLarge" })
	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteSparklySFX" })
	if args.UsePlayerRumble then
		game.thread(game.DoRumble,
			{ { LeftTriggerStart = 2, LeftTriggerStrengthFraction = 0.4, LeftTriggerFrequencyFraction = 0.15, LeftTriggerTimeout = 0.3, }, })
	end
	if args.PlayAssistActivatedVoiceLines then
		game.thread(game.PlayVoiceLines, game.HeroVoiceLines.AssistActivatedVoiceLines, true)
	end

	AdjustFullscreenBloom({ Name = "LastKillBloom", Duration = 0 })

	local assistDimmer = SpawnObstacle({
		Name = "rectangle01",
		Group = "Combat_UI",
		DestinationId = args.SourceId or heroId,
	})
	Teleport({ Id = assistDimmer, OffsetX = game.ScreenCenterX, OffsetY = game.ScreenCenterY })
	DrawScreenRelative({ Id = assistDimmer })
	SetScale({ Id = assistDimmer, Fraction = 10 })
	SetColor({ Id = assistDimmer, Color = { 20, 20, 20, 255 } })
	SetAlpha({ Id = assistDimmer, Fraction = 0.8, Duration = 0 })

	if args.SetHeroAnimation then
		SetAnimation({ Name = "MelinoeSpellFire", DestinationId = heroId })
		CreateAnimation({
			Name = "SuperStartFlare",
			DestinationId = heroId,
			Color = assistData.AssistPresentationColor or game.Color.Red,
		})
	end

	game.wait(0.06)

	ExpireProjectiles({ ExcludeNames = game.WeaponSets.ExpireProjectileExcludeProjectileNames })
	game.AddSimSpeedChange(presentationState.SimSpeedName, { Fraction = 0.005, LerpTime = 0 })

	game.waitUnmodified(0.32)

	game.HideCombatUI(presentationState.CombatUIHideKey)
	if args.ApplyPlayerSlow then
		ApplyEffect({
			DestinationId = heroId,
			Id = heroId,
			EffectName = "ShoutSelfSlow",
			DataProperties = game.EffectData.ShoutSelfSlow.DataProperties,
		})
	end
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
		Group = "Combat_UI",
		DestinationId = heroId,
	})
	Teleport({ Id = wrathStreak, OffsetX = 1920 / 2, OffsetY = 800 + wrathPresentationOffsetY })
	DrawScreenRelative({ Id = wrathStreak })
	CreateAnimation({
		Name = "WrathPresentationStreak",
		DestinationId = wrathStreak,
		Color = assistData.AssistPresentationColor or game.Color.Red,
	})

	local portrait = SpawnObstacle({
		Name = "BlankObstacle",
		Group = "Combat_Menu",
		DestinationId = heroId,
	})
	Teleport({
		Id = portrait,
		OffsetX = -300 + (assistData.AssistPresentationPortraitOffsetX or 0),
		OffsetY = (1080 / 2) + 80 + wrathPresentationOffsetY + (assistData.AssistPresentationPortraitOffsetY or 0),
	})
	DrawScreenRelative({ Id = portrait })
	CreateAnimation({ Name = assistData.AssistPresentationPortrait, DestinationId = portrait, Scale = 1 })

	local secondPortrait = nil
	if assistData.AssistPresentationPortrait2 ~= nil then
		secondPortrait = SpawnObstacle({
			Name = "BlankObstacle",
			Group = "Combat_Menu",
			DestinationId = heroId,
		})
		Teleport({
			Id = secondPortrait,
			OffsetX = 60,
			OffsetY = (1080 / 2) + 80 + wrathPresentationOffsetY + (args.SecondPortraitOffsetY or 0),
		})
		DrawScreenRelative({ Id = secondPortrait })
		CreateAnimation({ Name = assistData.AssistPresentationPortrait2, DestinationId = secondPortrait, Scale = 1 })
	end

	local wrathStreakFront = SpawnObstacle({
		Name = "BlankObstacle",
		Group = "Combat_Menu_Overlay",
		DestinationId = heroId,
	})
	Teleport({ Id = wrathStreakFront, OffsetX = 900, OffsetY = 1150 + wrathPresentationOffsetY })
	DrawScreenRelative({ Id = wrathStreakFront })
	CreateAnimation({
		Name = "WrathPresentationBottomDivider",
		DestinationId = wrathStreakFront,
		Scale = 1.25,
		Color = assistData.AssistPresentationColor or game.Color.Red,
	})

	local wrathVignette = CreateScreenObstacle({
		Name = "BlankObstacle",
		Group = "FX_Standing_Top",
		X = game.ScreenCenterX,
		Y = game.ScreenCenterY,
		ScaleX = game.ScreenScaleX,
		ScaleY = game.ScreenScaleY,
	})
	CreateAnimation({ Name = "WrathVignette", DestinationId = wrathVignette, Color = game.Color.Red })

	presentationState.EffectAnchorId = CreateScreenObstacle({
		Name = "BlankObstacle",
		Group = "Scripting",
		X = game.ScreenCenterX,
		Y = game.ScreenCenterY,
	})
	local fullscreenAlertDisplacementFx = SpawnObstacle({
		Name = "FullscreenAlertDisplace",
		Group = "FX_Displacement",
		DestinationId = presentationState.EffectAnchorId,
	})
	presentationState.DisplacementFxId = fullscreenAlertDisplacementFx
	DrawScreenRelative({ Id = fullscreenAlertDisplacementFx })

	game.AddSimSpeedChange(presentationState.SimSpeedName, { Fraction = 0.1, LerpTime = 0.06 })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 3, ValueChangeType = "Multiply", DataValue = false, DestinationNames = { "HeroTeam" } })

	Move({ Id = portrait, Angle = 8, Distance = 800, Duration = 0.2, EaseIn = 0.2, EaseOut = 1, TimeModifierFraction = 0 })
	if secondPortrait ~= nil then
		Move({ Id = secondPortrait, Angle = 8, Distance = 800, Duration = 0.2, EaseIn = 0.2, EaseOut = 1, TimeModifierFraction = 0 })
	end
	Move({ Id = wrathStreakFront, Angle = 8, Distance = 200, Duration = 0.5, EaseIn = 0.9, EaseOut = 1, TimeModifierFraction = 0 })
	SetColor({ Id = wrathVignette, Color = { 0, 0, 0, 0.4 }, Duration = 0.05, TimeModifierFraction = 0 })

	game.waitUnmodified(0.25)

	PlaySound({ Name = "/SFX/Menu Sounds/PortraitEmoteSurpriseSFX" })
	AdjustFullscreenBloom({ Name = "Off", Duration = 0.1, Delay = 0 })
	Move({ Id = portrait, Angle = 8, Distance = 100, Duration = 1, EaseIn = 0.5, EaseOut = 0.5, TimeModifierFraction = 0 })
	if secondPortrait ~= nil then
		Move({ Id = secondPortrait, Angle = 8, Distance = 100, Duration = 1, EaseIn = 0.5, EaseOut = 0.5, TimeModifierFraction = 0 })
	end
	Move({ Id = wrathStreakFront, Angle = 8, Distance = 25, Duration = 1, EaseIn = 0.5, EaseOut = 1, TimeModifierFraction = 0 })

	game.waitUnmodified(0.55)

	AdjustZoom({ Fraction = currentRun.CurrentRoom.ZoomFraction or 0.9, LerpTime = 0.25 })
	PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal3" })

	RemoveInputBlock({ Name = presentationState.InputBlockName })

	if args.PlayAssistReactionVoiceLines then
		for _, enemy in pairs(game.ActiveEnemies) do
			if enemy.AssistReactionVoiceLines ~= nil then
				game.thread(game.PlayVoiceLines, enemy.AssistReactionVoiceLines, nil, enemy)
			end
		end
	end
	if args.PlayCrowdReaction then
		game.thread(game.CrowdReactionPresentation, {
			AnimationNames = { "StatusIconSmile", "StatusIconOhBoy", "StatusIconEmbarrassed" },
			Sound = "/SFX/TheseusCrowdCheer",
			ReactionChance = 0.05,
			Requirements = {
				{
					Path = { "CurrentRun", "CurrentRoom", "Name" },
					IsAny = { "Y_Boss01" },
				},
			},
			Delay = 1,
			Shake = true,
			RadialBlur = true,
		})
	end

	SetAlpha({ Id = portrait, Fraction = 0, Duration = 0.12, TimeModifierFraction = 0 })
	if secondPortrait ~= nil then
		SetAlpha({ Id = secondPortrait, Fraction = 0, Duration = 0.12, TimeModifierFraction = 0 })
	end
	SetAlpha({ Id = wrathVignette, Fraction = 0, Duration = 0.06 })
	SetColor({ Id = assistDimmer, Color = { 0, 0, 0, 0 }, Duration = 0.06 })
	SetAlpha({ Id = fullscreenAlertDisplacementFx, Fraction = 0, Duration = 0.06 })

	game.waitUnmodified(0.06)
	return presentationState
end

function mod.AssistCompletePresentation(assistData)
	game.wait(1.35, game.RoomThreadName)
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.AssistCompletedVoiceLines, true)
end

function mod.DoAssistPresentationPostWeapon(assistData, presentationState)
	game.AddSimSpeedChange(presentationState.SimSpeedName, { Fraction = 0.3, LerpTime = 0.3 })
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	game.waitUnmodified(assistData.AssistPostWeaponSlowDuration or 0)
	SetThingProperty({ Property = "ElapsedTimeMultiplier", Value = 1.0, ValueChangeType = "Absolute", DataValue = false, DestinationNames = { "HeroTeam" } })
	game.RemoveSimSpeedChange(presentationState.SimSpeedName, { LerpTime = 0.3 })
	game.ShowCombatUI(presentationState.CombatUIHideKey)

	if presentationState.UseShoutPresentationCleanup then
		game.thread(game.CleanUpShoutPresentation, nil, nil, { presentationState.DisplacementFxId })
	else
		game.thread(game.DestroyOnDelay, { presentationState.DisplacementFxId }, 0.5)
	end
	game.thread(game.DestroyOnDelay, { presentationState.EffectAnchorId }, presentationState.EffectAnchorCleanupDelay)

	game.thread(function()
		game.waitUnmodified(0.4)
		game.SetPlayerVulnerable(presentationState.InvulnerabilityName)
	end)
end

function mod.AssistHintPresentation()
	local traitData = game.GetHeroTrait(game.GameState.LastAssistTrait)
	game.thread(game.InCombatTextArgs, {
		TargetId = game.CurrentRun.Hero.ObjectId,
		Text = "ModsNikkelMHadesBiomes_AssistAvailableHint",
		Duration = 1.25,
		ShadowScale = 0.66,
		ShadowScaleX = 0.9,
	})
	PlaySound({
		Name = traitData.EquipSound or "/Leftovers/SFX/PositiveTalismanProc_1",
		Id = game.CurrentRun.Hero.ObjectId,
	})
end

function mod.AssistFailedPresentation(attacker)
	if (attacker.IsDead and game.CurrentHubRoom ~= nil and not game.CurrentHubRoom.AllowAssistFailedPresentation) or not game.IsInputAllowed({}) then
		return
	end

	game.thread(game.InCombatTextArgs, {
		TargetId = attacker.ObjectId,
		Text = "AssistNotAvailable",
		Duration = 0.75,
		Cooldown = 2,
		ShadowScale = 0.66,
		ShadowScaleX = 0.9,
	})
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.AssistUnavailableVoiceLines)
	PlaySound({ Name = "/Leftovers/SFX/OutOfAmmo2", Id = attacker.ObjectId })
	CreateAnimation({
		Name = "SuperNotChargedFlare",
		DestinationId = attacker.ObjectId,
		Scale = 0.5,
		OffsetZ = 160,
	})

	for _, enemy in pairs(game.ActiveEnemies) do
		if enemy.AssistFailedReactionVoiceLines ~= nil then
			game.thread(game.PlayVoiceLines, enemy.AssistFailedReactionVoiceLines, nil, enemy)
		end
	end
end
