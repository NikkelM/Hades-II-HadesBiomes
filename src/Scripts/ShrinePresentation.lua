-- Same as base game, but we have additional logic for modded flips, and how to flip back to a vanilla state from them
modutil.mod.Path.Override("UpdateShrineRunDoorArrow", function(source, args)
	args = args or {}

	game.GameState.ActiveShrineBounty = nil
	local fadeDuration = 0.4
	local activeShrinePoints = game.GetTotalSpentShrinePoints()
	for i, bountyName in ipairs(game.ScreenData.Shrine.BountyOrder) do
		local bountyData = game.BountyData[bountyName]
		local weaponName = nil
		local matchedWeapon = false
		local shrinePoints = nil
		if bountyData.CompleteGameStateRequirements ~= nil then
			for j, completeRequirement in ipairs(bountyData.CompleteGameStateRequirements) do
				if completeRequirement.HasAny ~= nil then
					weaponName = completeRequirement.HasAny[1]
					if game.CurrentRun.Hero.Weapons[weaponName] then
						matchedWeapon = true
					end
				end
				if completeRequirement.Value ~= nil then
					shrinePoints = completeRequirement.Value
				end
			end
			if matchedWeapon and activeShrinePoints >= shrinePoints and not game.GameState.ShrineBountiesCompleted[bountyName] then
				if bountyData.UnlockGameStateRequirements == nil or game.IsGameStateEligible(bountyData, bountyData.UnlockGameStateRequirements) then
					game.GameState.ActiveShrineBounty = bountyData.Name
					game.UpdateShrineAnimation(bountyData.Name)
					-- Determine which door
					DebugAssert({
						Condition = game.ScreenData.Shrine.BountyEncounterDoorFlipMap[bountyData.Encounters[1]] ~= nil,
						Text = "Encounter is missing from BountyEncounterDoorFlipMap: " .. bountyData.Encounters[1],
						Owner = "James"
					})
					local oldBountyLocation = game.SessionMapState.ShrineRunDoorIndicatorPosition or "Underworld"
					-- Modded bounties set this to true as well, though we don't use it anymore
					local shouldFlip = game.ScreenData.Shrine.BountyEncounterDoorFlipMap[bountyData.Encounters[1]]
					local newBountyIsModded = game.Contains(mod.ModdedShrineBountyNames, bountyData.Name)
					local newBountyLocation = nil
					if newBountyIsModded then
						newBountyLocation = "Modded"
					elseif shouldFlip then
						newBountyLocation = "Surface"
					else
						newBountyLocation = "Underworld"
					end

					if oldBountyLocation ~= newBountyLocation then
						if not args.SkipPresentation then
							SetAlpha({ Id = game.ScreenData.Shrine.ShrineRunDoorArrowId, Fraction = 0.0, Duration = fadeDuration })
							game.wait(fadeDuration + 0.1)
						end

						-- Run the state checks to determine which flips are needed
						if (oldBountyLocation == "Underworld" and (newBountyLocation == "Surface" or newBountyLocation == "Modded")
									or (oldBountyLocation == "Surface" and newBountyLocation == "Underworld")
									or (oldBountyLocation == "Modded" and newBountyLocation == "Underworld")) then
							FlipHorizontal({ Id = game.ScreenData.Shrine.ShrineRunDoorArrowId })
						end
						if (oldBountyLocation == "Underworld" and newBountyLocation == "Surface")
								or (oldBountyLocation == "Surface" and (newBountyLocation == "Modded" or newBountyLocation == "Underworld"))
								or (oldBountyLocation == "Modded" and newBountyLocation == "Surface") then
							FlipVertical({ Id = game.ScreenData.Shrine.ShrineRunDoorArrowId })
						end
					end
					SetAlpha({ Id = game.ScreenData.Shrine.ShrineRunDoorArrowId, Fraction = 1.0, Duration = fadeDuration })
					game.SessionMapState.ShrineRunDoorIndicatorPosition = newBountyLocation
					return
				end
			end
		end
	end

	-- None eligible, fade out
	SetAlpha({ Id = game.ScreenData.Shrine.ShrineRunDoorArrowId, Fraction = 0.0, Duration = fadeDuration })
	game.UpdateShrineAnimation()
end)
