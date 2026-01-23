modutil.mod.Path.Wrap("StartedTextLinesPresentation", function(base, source, textLines)
	if source ~= nil and source.ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 0 })
	end

	return base(source, textLines)
end)

modutil.mod.Path.Wrap("FinishedTextLinesPresentation", function(base, source, textLines)
	if source ~= nil and source.ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
	end
	-- Custom, for Eurydice we currently use SecretMusicId instead of AmbientMusicId
	if textLines ~= nil and source.TextLinesPauseSingingFx and game.AudioState.SecretMusicId ~= nil then
		CreateAnimation({
			Name = source.SingingFx,
			DestinationId = source.ObjectId,
			OffsetX = source.SingingAnimOffsetX or source.AnimOffsetX,
			OffsetZ = source.AnimOffsetZ,
			Group = "Combat_UI_World"
		})
	end

	return base(source, textLines)
end)

modutil.mod.Path.Wrap("HadesPreDamagePresentation", function(base, enemy, damageAmount, damageData)
	if enemy ~= nil and enemy.Name == "Hades" then
		damageData.VoiceLines = game.GlobalVoiceLines.ModsNikkelMHadesBiomesHadesPreDamageHimselfVoiceLines
	end

	return base(enemy, damageAmount, damageData)
end)

modutil.mod.Path.Wrap("GodLootPickupPresentation", function(base, loot, args)
	args = args or {}

	-- We want to play a custom pickup sound and visual effects if the next text line on this loot is modded
	-- Getting the text line to play comes from LootPickupPresentation()
	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if loot.RecheckConversationOnLootPickup and loot.NextInteractLines ~= nil and not game.IsTextLineEligible(game.CurrentRun, loot, loot.NextInteractLines) then
			loot.NextInteractLines = nil
		end

		if loot.NextInteractLines ~= nil then
			-- Already has textlines assigned, we don't need to do anything
		elseif loot.HasDuoBoon and loot.DuoPickupTextLines ~= nil and (loot.DuoPickupTextLinesRequirements == nil or game.IsGameStateEligible(loot, loot.DuoPickupTextLinesRequirements)) then
			loot.NextInteractLines = game.GetRandomEligibleTextLines(loot, loot.DuoPickupTextLines, {})
			if loot.NextInteractLines ~= nil then
				game.CurrentRun.HadDuoConversation = true
				local speakerNames = {}
				for _, line in ipairs(loot.NextInteractLines) do
					table.insert(speakerNames, string.match(line.Cue, "/VO/(%a+)_"))
				end
				LoadVoiceBank({ Names = speakerNames, IgnoreAssert = true })
				LoadPackages({ Names = speakerNames, IgnoreAssert = true })
			end
		elseif loot.BoughtFromShop and loot.BoughtTextLines ~= nil then
			if loot.BoughtTextLinesRequirements == nil or game.IsGameStateEligible(loot, loot.BoughtTextLinesRequirements) then
				loot.NextInteractLines = game.GetRandomEligibleTextLines(loot, loot.BoughtTextLines,
					game.GetNarrativeDataValue(loot, "BoughtTextLinePriorities"))
				if loot.NextInteractLines ~= nil then
					CurrentRun.HadBoughtLootConversation = true
				end
			end
		elseif game.MapState.RejectedLoot ~= nil and game.MapState.RejectedLoot.Name == loot.Name and loot.MakeUpTextLines ~= nil then
			loot.NextInteractLines = game.GetRandomEligibleTextLines(loot, loot.MakeUpTextLines, {})
		else
			loot.NextInteractLines = game.GetRandomEligibleTextLines(loot, loot.InteractTextLineSets,
				game.GetNarrativeDataValue(loot, "InteractTextLinePriorities"))
		end

		-- The effects come from ChaosInteractPresentation() (slightly adjusted for no colour grading and ChaosBassStart() call)
		if loot.NextInteractLines and loot.NextInteractLines.ModsNikkelMHadesBiomesIsModdedTextLine then
			-- To not play the default sound from the base function
			loot.PickupSound = "/EmptyCue"

			AdjustFullscreenBloom({ Name = "FullscreenFlash", Duration = 0.6 })
			AdjustRadialBlurDistance({ Fraction = 8, Duration = 0.2 })
			AdjustRadialBlurStrength({ Fraction = 2, Duration = 0.2 })

			game.ScreenAnchors.FullscreenAlertFxAnchor = CreateScreenObstacle({
				Name = "BlankObstacle",
				Group = "Events",
				X = game.ScreenCenterX,
				Y = game.ScreenCenterY
			})

			local fullscreenAlertDisplacementFx = SpawnObstacle({
				Name = "FullscreenChaosDisplace",
				Group = "FX_Displacement",
				DestinationId = game.ScreenAnchors.FullscreenAlertFxAnchor
			})
			DrawScreenRelative({ Id = fullscreenAlertDisplacementFx })

			local fullscreenAlertColorFx = SpawnObstacle({
				Name = "FullscreenAlertColorDark",
				Group = "FX_Standing_Top",
				DestinationId = game.ScreenAnchors.FullscreenAlertFxAnchor
			})
			DrawScreenRelative({ Id = fullscreenAlertColorFx })

			local boonSound = PlaySound({ Name = "/SFX/Menu Sounds/ChaosBoonConfirm" })
			ShakeScreen({ Speed = 600, Distance = 6, FalloffSpeed = 2000, Duration = 0.3 })

			game.thread(game.DoRumble, { { ScreenPreWait = 0.02, RightFraction = 0.17, Duration = 0.5 }, })
			game.wait(0.5)
			game.thread(game.DoRumble, { { ScreenPreWait = 0.02, LeftFraction = 0.17, Duration = 0.5 }, })
			game.wait(0.06)

			AdjustRadialBlurDistance({ Fraction = 8, Duration = 2 })
			AdjustRadialBlurStrength({ Fraction = 0, Duration = 4 })
			AdjustFullscreenBloom({ Name = "Off", Duration = 3.0 })
			SetAlpha({ Id = fullscreenAlertColorFx, Fraction = 0, Duration = 0.45 })
			game.thread(game.DestroyOnDelay, { fullscreenAlertColorFx, fullscreenAlertDisplacementFx }, 5.0)

			PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteThoughtful" })
		end
	end

	return base(loot, args)
end)
