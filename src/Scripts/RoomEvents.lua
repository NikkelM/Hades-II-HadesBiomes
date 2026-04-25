function mod.ModsNikkelMHadesBiomesBossIntro(eventSource, args)
	args = args or {}

	game.HideCombatUI("BossIntro")
	AddInputBlock({ Name = "BossIntro" })
	game.AddTimerBlock(game.CurrentRun, "BossIntro")
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	if not game.CurrentRun.IsDreamRun then
		game.PlayVoiceLines(args.VoiceLines)
	end
	local didPan = false
	local panDuration = args.DurationIn or 1.5

	if args.ProcessTextLinesIds ~= nil then
		for k, id in ipairs(args.ProcessTextLinesIds) do
			if game.ActiveEnemies[id] ~= nil then
				local enemy = game.ActiveEnemies[id]
				if not args.SkipAngleTowardTarget then
					AngleTowardTarget({ Id = id, DestinationId = game.CurrentRun.Hero.ObjectId })
				end
				panDuration = args.DurationIn or 1.5
				PanCamera({ Ids = id, Duration = panDuration, EaseIn = 0.05, EaseOut = 0.3 })
				didPan = true
				if args.UsePanSound then
					PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })
				end
				if game.CurrentRun.IsDreamRun and args.DreamRunIntroFunctionName ~= nil then
					game.CallFunctionName(args.DreamRunIntroFunctionName, enemy, args)
				else
					game.ProcessTextLines(enemy, enemy.BossPresentationSuperPriorityIntroTextLineSets)
					-- BossPresentationHighPriorityIntroTextLineSets is custom for Hades EM
					game.ProcessTextLines(enemy, enemy.BossPresentationHighPriorityIntroTextLineSets)
					game.ProcessTextLines(enemy, enemy.BossPresentationPriorityIntroTextLineSets)
					game.ProcessTextLines(enemy, enemy.BossPresentationIntroTextLineSets)
					game.ProcessTextLines(enemy, enemy.BossPresentationTextLineSets)
					game.ProcessTextLines(enemy, enemy.BossPresentationRepeatableTextLineSets)
					if not mod.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationSuperPriorityIntroTextLineSets, args) then
						if not mod.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationHighPriorityIntroTextLineSets, args) then
							if not mod.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationPriorityIntroTextLineSets, args) then
								if not mod.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationIntroTextLineSets, args) then
									if not mod.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationTextLineSets, args) then
										mod.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationRepeatableTextLineSets, args)
									end
								end
							end
						end
					end
				end
				if not args.SkipBossMusic then
					game.StartBossRoomMusic()
				end
			end
		end
	end
	if args.ResetRoomZoom then
		FocusCamera({ Fraction = game.CurrentRun.CurrentRoom.ZoomFraction or 1.0, Duration = 6.0, ZoomType = "Ease" })
	end

	if args.SetupBossIds ~= nil then
		for k, id in ipairs(args.SetupBossIds) do
			if game.ActiveEnemies[id] ~= nil then
				game.thread(game.SetupBoss, game.ActiveEnemies[id])
				-- used for Final Boss EM4
				game.CurrentRun.CurrentRoom.BossId = id
			end
		end
	end

	if args.UnlockDelay ~= nil then
		game.wait(args.UnlockDelay)
	end
	if didPan then
		-- Wait for the camera pan to the boss to finish before locking the camera to the player, in case dialogue was skipped before the pan completed
		local remainingPanTime = panDuration - (args.TotalElapsedTime or 0)
		if remainingPanTime > 0 then
			game.wait(remainingPanTime)
		end
		LockCamera({ Id = game.CurrentRun.Hero.ObjectId, Duration = args.DurationOut or 1.25, EaseIn = 0.04, EaseOut = 0.275 })
	end

	SetAnimation({ Name = "MelinoeEquip", DestinationId = game.CurrentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "BossIntro" })
	game.RemoveTimerBlock(game.CurrentRun, "BossIntro")
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	game.ShowCombatUI("BossIntro")
	if args.DelayedStart then
		game.StartEncounterEffects()
	end
end

function mod.ActivatePrePlacedByShrineLevel(eventSource, args)
	-- Use maximum if EM is active for the current depth (needed for DreamRuns), otherwise use 0 (non-EM)
	local shrineLevel = game.IsBossDifficultyShrineUpgradeActive() and 4 or 0
	game.ActivatePrePlaced(eventSource, args[shrineLevel])
end

function mod.ActivatePrePlacedAndFlipTypes(eventSource, args)
	game.ActivatePrePlaced(eventSource, args)

	if args.FlipTypes ~= nil then
		for _, type in pairs(args.FlipTypes) do
			local typeIds = GetIdsByType({ Name = type }) or {}
			FlipHorizontal({ Ids = typeIds })
		end
	end
end
