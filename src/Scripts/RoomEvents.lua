function mod.ModsNikkelMHadesBiomesBossIntro(eventSource, args)
	game.HideCombatUI("BossIntro")
	AddInputBlock({ Name = "BossIntro" })
	game.AddTimerBlock(game.CurrentRun, "BossIntro")
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	game.PlayVoiceLines(args.VoiceLines)
	local didPan = false

	if args.ProcessTextLinesIds ~= nil then
		for k, id in ipairs(args.ProcessTextLinesIds) do
			if game.ActiveEnemies[id] ~= nil then
				local enemy = game.ActiveEnemies[id]
				if not args.SkipAngleTowardTarget then
					AngleTowardTarget({ Id = id, DestinationId = game.CurrentRun.Hero.ObjectId })
				end
				PanCamera({ Ids = id, Duration = args.DurationIn or 1.5, EaseIn = 0.05, EaseOut = 0.3 })
				didPan = true
				if args.UsePanSound then
					PlaySound({ Name = "/Leftovers/World Sounds/MapZoomSlow" })
				end
				game.ProcessTextLines(enemy, enemy.BossPresentationSuperPriorityIntroTextLineSets)
				-- Custom for Hades EM
				game.ProcessTextLines(enemy, enemy.BossPresentationHighPriorityIntroTextLineSets)
				game.ProcessTextLines(enemy, enemy.BossPresentationPriorityIntroTextLineSets)
				game.ProcessTextLines(enemy, enemy.BossPresentationIntroTextLineSets)
				game.ProcessTextLines(enemy, enemy.BossPresentationTextLineSets)
				game.ProcessTextLines(enemy, enemy.BossPresentationRepeatableTextLineSets)
				if not game.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationSuperPriorityIntroTextLineSets) then
					if not game.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationHighPriorityIntroTextLineSets) then
						if not game.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationPriorityIntroTextLineSets) then
							if not game.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationIntroTextLineSets) then
								if not game.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationTextLineSets) then
									game.PlayRandomRemainingTextLines(enemy, enemy.BossPresentationRepeatableTextLineSets)
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
				game.thread(SetupBoss, game.ActiveEnemies[id])
				-- used for Final Boss EM4
				game.CurrentRun.CurrentRoom.BossId = id
			end
		end
	end

	if args.UnlockDelay ~= nil then
		game.wait(args.UnlockDelay)
	end
	if didPan then
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
	local shrineLevel = game.GetNumShrineUpgrades(eventSource.ShrineMetaUpgradeName)
	game.ActivatePrePlaced(eventSource, args[shrineLevel])
end
