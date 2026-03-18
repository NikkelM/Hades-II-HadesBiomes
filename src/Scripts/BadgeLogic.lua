-- Add another action for gifting/upgrading modded badges
modutil.mod.Path.Wrap("BadgeSellerSetupUseText", function(base, source, args)
	-- This sets up the basic use text
	-- If no vanilla badge is available anymore, returns early and sets source.OnUsedFunctionName = nil
	base(source, args)

	-- If the player hasn't performed the Hades badge incantation yet, don't do anything (the ReceiveGiftFunctionName will not be set and not useable)
	if not game.GameState.WorldUpgrades.ModsNikkelMHadesBiomes_WorldUpgradeBadgeSeller then
		return
	end

	-- Check if a next modded badge is available
	local nextModdedRank = (game.GameState.ModsNikkelMHadesBiomesBadgeRank or 0) + 1
	local nextModdedBadgeData = game.ModsNikkelMHadesBiomesBadgeData
			[game.ModsNikkelMHadesBiomesBadgeOrderData[nextModdedRank]]
	if nextModdedBadgeData == nil then
		-- Maxed out on modded badges
		source.CanReceiveGift = false
		source.ReceiveGiftFunctionName = nil
		return
	end

	-- Depending on if we can afford the new modded badge or not, and the existing use texts, set the new use text
	-- Modded badge upgrades use the "Gift" button
	if nextModdedBadgeData ~= nil then
		local resourceIndex = 1
		for i, resourceName in ipairs(game.ResourceDisplayOrderData) do
			if nextModdedBadgeData.ResourceCost[resourceName] then
				source["ModsNikkelMHadesBiomesResourceAmount" .. resourceIndex] = nextModdedBadgeData.ResourceCost[resourceName]
				source["ModsNikkelMHadesBiomesResourceIconPath" .. resourceIndex] = game.ResourceData[resourceName].TextIconPath
				resourceIndex = resourceIndex + 1
			end
		end

		-- Otherwise CanReceiveGift() early returns
		source.CanReceiveGift = true
		source.ReceiveGiftFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBadgeSellerUse"
		if game.HasResources(nextModdedBadgeData.ResourceCost) then
			if source.OnUsedFunctionName == nil then
				-- Vanilla has been maxed, modded is available
				source.UseTextGift = "BadgeSeller_UseTextGift_VanillaMaxed_ModdedAvailable"
				source.UseTextGiftAndSpecial = "BadgeSeller_UseTextGiftAndSpecial_VanillaMaxed_ModdedAvailable"
			elseif source.UseText == "BadgeSeller_Use" then
				-- Can afford both
				source.UseTextTalkGiftAndSpecial = "BadgeSeller_UseTextTalkGiftAndSpecial_Both"
				source.UseTextTalkAndGift = "BadgeSeller_UseTextTalkAndGift_Both"
			elseif source.UseText == "BadgeSeller_Use_CantAfford" then
				-- Can afford only modded
				source.UseTextTalkGiftAndSpecial = "BadgeSeller_UseTextTalkGiftAndSpecial_ModdedOnly"
				source.UseTextTalkAndGift = "BadgeSeller_UseTextTalkAndGift_ModdedOnly"
			end
		else
			if source.OnUsedFunctionName == nil then
				-- Vanilla has been maxed, modded is not available
				source.UseTextGift = "BadgeSeller_UseTextGift_VanillaMaxed_ModdedNotAvailable"
				source.UseTextGiftAndSpecial = "BadgeSeller_UseTextGiftAndSpecial_VanillaMaxed_ModdedNotAvailable"
			elseif source.UseText == "BadgeSeller_Use" then
				-- Can afford only vanilla
				source.UseTextTalkGiftAndSpecial = "BadgeSeller_UseTextTalkGiftAndSpecial_VanillaOnly"
				source.UseTextTalkAndGift = "BadgeSeller_UseTextTalkAndGift_VanillaOnly"
			elseif source.UseText == "BadgeSeller_Use_CantAfford" then
				-- Cannot afford any of the two
				source.UseTextTalkGiftAndSpecial = "BadgeSeller_UseTextTalkGiftAndSpecial_None"
				source.UseTextTalkAndGift = "BadgeSeller_UseTextTalkAndGift_None"
			end
		end
	end
end)

function mod.ModsNikkelMHadesBiomesBadgeSellerUse(usee, args)
	local nextRank = (game.GameState.ModsNikkelMHadesBiomesBadgeRank or 0) + 1
	local nextBadgeData = game.ModsNikkelMHadesBiomesBadgeData[game.ModsNikkelMHadesBiomesBadgeOrderData[nextRank]]
	if nextBadgeData == nil then
		-- Maxed out
		return
	end

	game.StopStatusAnimation(usee)

	if nextBadgeData.ResourceCost ~= nil then
		if not game.HasResources(nextBadgeData.ResourceCost) then
			game.BadgeCannotAffordPresentation(usee, nextBadgeData)
			return
		end

		AddInputBlock({ Name = "BadgeResourceSpend" })
		game.BadgeResourceSpendPresentation(usee)

		for i, resourceName in ipairs(game.ResourceDisplayOrderData) do
			if nextBadgeData.ResourceCost[resourceName] then
				game.SpendResource(resourceName, nextBadgeData.ResourceCost[resourceName], nextBadgeData.Name,
					{ TextOffsetY = game.ScreenData.MusicPlayer.ResourceSpendTextOffsetY })
				game.wait(0.75)
			end
		end
		RemoveInputBlock({ Name = "BadgeResourceSpend" })
	end

	game.GameState.ModsNikkelMHadesBiomesBadgeRank = nextRank
	game.CurrentRun.ModsNikkelMHadesBiomesBadgePurchased = nextRank

	game.BadgePurchasePresentation(usee, nextBadgeData)
end
