modutil.mod.Path.Context.Wrap.Static("DeathPresentation", function(currentRun, killer, deathArgs)
	-- The text and animation shown on the top
	modutil.mod.Path.Wrap("DisplayInfoBanner", function(base, source, infoArgs)
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			if infoArgs.Text == "DeathMessage" then
				-- Normal death during a run
				infoArgs.Text = "ModsNikkelMHadesBiomes_DeathMessage"
				infoArgs.TextColor = Color.Red
				infoArgs.FontScale = 0.85
				infoArgs.TextOffsetY = -20
				infoArgs.AnimationName = "LocationTextBGDeath"
				infoArgs.AnimationOutName = "LocationTextBGDeathOut"
			elseif infoArgs.Text == "OutroDeathMessageAlt" or infoArgs.Text == "OutroDeathMessageTrueEnding" then
				-- Post Ending01, run cleared
				infoArgs.Text = "ModsNikkelMHadesBiomes_PostEndingDeathMessage"
				infoArgs.TextColor = game.Color.Red
				infoArgs.FontScale = 0.85
				infoArgs.TextOffsetY = -20
				infoArgs.AnimationName = "LocationTextBGDeath"
				infoArgs.AnimationOutName = "LocationTextBGDeathOut"
			end
		end

		return base(source, infoArgs)
	end)

	-- The animation Mel herself does
	modutil.mod.Path.Wrap("SetAnimation", function(base, args)
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.Cleared and game.GameState.TextLinesRecord.Ending01 then
			-- This is only played if the original deathAnimation was MelinoeDeathEscape, which we override in the next clause, but that isn't propagated to the original function, so we just skip this call
			if args.Name == "MelinoeDeathEscape2" then
				return
			end
			-- If we have reached the mod's true ending, play the TrueEnding animation, even if we haven't reached the vanilla Hades II true ending
			if args.Name == "MelinoeDeathEscape" then
				args.Name = "MelinoeDeathSuccess"
			end
			-- If we just changed it to this animation, or the animation would have played anyways (as the player reached vanillar Hades II's true ending)
			if args.Name == "MelinoeDeathSuccess" then
				-- Hacky: Also play the Victory stinger here, since if the player has reached the True ending, but isn't in I or Q, no stinger is played at all
				-- Which in the case of modded runs, means that on each victory after the mod's ending, no stinger is played
				PlaySound({ Name = "/Music/IrisDeathStingerOrch_MC" })
			end
		end

		return base(args)
	end)
end)

-- For modded run outro remembrances
modutil.mod.Path.Context.Wrap.Static("EndEarlyAccessPresentation", function()
	-- Instead of returning a usual random outro, return a custom modded one
	modutil.mod.Path.Wrap("GetRandomEligiblePrioritizedItem",
		function(base, items, priorities, playedStore, randomRemainingStore, args)
			if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
				game.GameState.ModsNikkelMHadesBiomes_PlayedRunOutros = game.GameState.ModsNikkelMHadesBiomes_PlayedRunOutros or
						{}
				local eligibleOutroData = {}
				local eligibleUnplayedOutroData = {}
				for k, outroData in pairs(mod.ModsNikkelMHadesBiomes_GameOutroData) do
					if outroData.Header ~= nil and game.IsGameStateEligible(game.CurrentRun, outroData) then
						table.insert(eligibleOutroData, outroData)
						if not game.GameState.ModsNikkelMHadesBiomes_PlayedRunOutros[outroData.Header] then
							table.insert(eligibleUnplayedOutroData, outroData)
						end
					end
				end
				local gameOutroData = nil
				if game.IsEmpty(eligibleUnplayedOutroData) then
					-- All played, start the record over
					for index, outroData in pairs(game.GameOutroData) do
						if outroData.Header ~= nil then
							game.GameState.ModsNikkelMHadesBiomes_PlayedRunOutros[outroData.Header] = nil
						end
					end
					gameOutroData = game.GetRandomValue(eligibleOutroData)
				else
					gameOutroData = game.GetRandomValue(eligibleUnplayedOutroData)
				end

				return gameOutroData
			end

			return base(items, priorities, playedStore, randomRemainingStore, args)
		end)
end)

modutil.mod.Path.Context.Wrap.Static("DestroyDoorRewardPresenation", function(originalDoor)
	modutil.mod.Path.Wrap("CreateAnimation", function(base, args)
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and game.CurrentRun.CurrentRoom and game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesExitDoors ~= nil then
			if args.Name == "RoomRewardShatter" then
				local door = modutil.mod.Locals.Stacked(3).door
				for _, moddedExitDoor in ipairs(game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesExitDoors) do
					if moddedExitDoor.ObjectId == door.ObjectId then
						-- Create a new blank obstacle at the same location as the door
						local flipDummyHorizontal = IsHorizontallyFlipped({ Id = args.DestinationId })
						local shatterSourceId = SpawnObstacle({ Name = "InvisibleTarget", DestinationId = args.DestinationId, OffsetY = -165 })
						if flipDummyHorizontal then
							FlipHorizontal({ Id = shatterSourceId })
						end
						args.DestinationId = shatterSourceId
						game.thread(game.DestroyOnDelay, { shatterSourceId }, 2.0)

						if door.Room ~= nil and door.Room.RewardStoreName == "MetaProgress" then
							args.Name = "ModsNikkelMHadesBiomes_RoomRewardShatter_MetaReward"
						else
							args.Name = "ModsNikkelMHadesBiomes_RoomRewardShatter"
						end
						break
					end
				end
			end
		end
		return base(args)
	end)
end)
