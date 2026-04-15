modutil.mod.Path.Wrap("DisplayTextLine", function(base, screen, source, line, parentLine, nextLine, args)
	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if line.Speaker and (line.Speaker == "NPC_Zagreus_Past_01" or line.Speaker == "CharProtag") then
			mod.ModsNikkelMHadesBiomesToggleNarrativeFadeInColorForZagreus(source, { ToggleOn = true })
		end
	end

	local returnValue = base(screen, source, line, parentLine, nextLine, args)

	if game.CurrentRun and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		if line.Speaker and (line.Speaker == "NPC_Zagreus_Past_01" or line.Speaker == "CharProtag") then
			mod.ModsNikkelMHadesBiomesToggleNarrativeFadeInColorForZagreus(source, { ToggleOn = false })
		end
	end
	return returnValue
end)

-- Change the player's NarrativeFadeInColor to ZagreusVoice when speaking as Zagreus_Past_01
mod.OriginalPlayerNarrativeFadeInColor = nil
function mod.ModsNikkelMHadesBiomesToggleNarrativeFadeInColorForZagreus(source, args)
	if args.ToggleOn then
		mod.OriginalPlayerNarrativeFadeInColor = source.NarrativeFadeInColor
		source.NarrativeFadeInColor = game.Color.ZagreusVoice
	elseif mod.OriginalPlayerNarrativeFadeInColor ~= nil then
		source.NarrativeFadeInColor = mod.OriginalPlayerNarrativeFadeInColor
		mod.OriginalPlayerNarrativeFadeInColor = nil
	end
end

modutil.mod.Path.Wrap("GetRandomEligibleTextLines", function(base, source, textLineSets, priorities, args)
	-- Custom logic to respect SuperPriority and Priority flags in modded runs
	if game.CurrentRun ~= nil and game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun and source and source.ModsNikkelMHadesBiomesIsModdedEnemy then
		if textLineSets == nil then
			return nil
		end

		local superPriorityConversations = {}
		local priorityConversations = {}
		local eligibleConversations = {}
		local eligibleUnplayedConversations = {}
		local eligibleOneTimeConversations = {}
		local eligiblePlayFirstConversations = {}

		args = args or {}

		for conversationName, conversationData in pairs(textLineSets) do
			args.PartnerName = conversationData.Partner
			local eligibilityConversationData = game.CheckPartnerConversationData(conversationData)

			if game.IsTextLineEligible(game.CurrentRun, source, eligibilityConversationData, nil, nil, args) then
				eligibleConversations[conversationData.Name] = true
				if not game.GameState.PlayedRandomTextLines[conversationData.Name] then
					table.insert(eligibleUnplayedConversations, conversationData)
					if conversationData.PlayFirst and not game.GameState.TextLinesRecord[conversationData.Name] then
						table.insert(eligiblePlayFirstConversations, conversationData)
					end
				end
				-- Custom logic start
				if conversationData.SuperPriority then
					table.insert(superPriorityConversations, conversationData)
				elseif conversationData.Priority then
					table.insert(priorityConversations, conversationData)
				end
				-- Custom logic end
				if conversationData.PlayOnce then
					table.insert(eligibleOneTimeConversations, conversationData)
				end
			end
		end

		-- This should always be nil for modded conversations, since H1 enemies don't have the NarrativeData entries
		if priorities ~= nil then
			for k, priority in ipairs(priorities) do
				if type(priority) == "table" then
					local eligiblePriorityConversations = {}
					for j, conversationName in ipairs(priority) do
						if eligibleConversations[conversationName] then
							table.insert(eligiblePriorityConversations, conversationName)
						end
					end
					if not game.IsEmpty(eligiblePriorityConversations) then
						local randomPriorityConversation = game.GetRandomValue(eligiblePriorityConversations)
						return textLineSets[randomPriorityConversation]
					end
				elseif eligibleConversations[priority] then
					return textLineSets[priority]
				end
			end
		end

		-- Custom logic start
		if not game.IsEmpty(superPriorityConversations) then
			return game.GetRandomValue(superPriorityConversations)
		end

		if not game.IsEmpty(priorityConversations) then
			return game.GetRandomValue(priorityConversations)
		end
		-- Custom logic end

		if not game.IsEmpty(eligibleOneTimeConversations) then
			return game.GetRandomValue(eligibleOneTimeConversations)
		end

		local randomConversation = nil
		if game.IsEmpty(eligibleUnplayedConversations) then
			-- All lines played, start the record over
			for conversationName, conversationData in pairs(textLineSets) do
				game.GameState.PlayedRandomTextLines[conversationName] = nil
			end
			local randomConversationName = game.GetRandomKey(eligibleConversations)
			randomConversation = textLineSets[randomConversationName]
		else
			if not game.IsEmpty(eligiblePlayFirstConversations) then
				randomConversation = game.GetRandomValue(eligiblePlayFirstConversations)
			else
				randomConversation = game.GetRandomValue(eligibleUnplayedConversations)
			end
		end
		if randomConversation ~= nil then
			game.GameState.PlayedRandomTextLines[randomConversation.Name] = true
		end
		return randomConversation
	else
		return base(source, textLineSets, priorities, args)
	end
end)

-- Reimplementation of Hades II's PlayRandomRemainingTextLines before it was removed in Post-Launch Patch 2
-- Also adds custom logic to respect SuperPriority and Priority flags in modded runs
function mod.PlayRandomRemainingTextLines(source, textLineSets)
	if textLineSets == nil then
		return false
	end

	local superPriorityTextLines = {}
	local priorityTextLines = {}
	local eligibleUnplayedLines = {}
	local allEligibleLines = {}
	for textLinesName, textLines in pairs(textLineSets) do
		if game.IsTextLineEligible(game.CurrentRun, source, textLines) then
			table.insert(allEligibleLines, textLines)
			if not game.GameState.PlayedRandomTextLines[textLinesName] then
				table.insert(eligibleUnplayedLines, textLines)
				-- Custom logic start
				if textLines.SuperPriority then
					table.insert(superPriorityTextLines, textLines)
				elseif textLines.Priority then
					table.insert(priorityTextLines, textLines)
				end
				-- Custom logic end
			end
		end
	end

	if game.IsEmpty(allEligibleLines) then
		return false
	end

	local randomLines = {}
	-- Custom logic start
	if not game.IsEmpty(superPriorityTextLines) then
		randomLines = game.GetRandomValue(superPriorityTextLines) or {}
	elseif not game.IsEmpty(priorityTextLines) then
		randomLines = game.GetRandomValue(priorityTextLines) or {}
		-- Custom logic end
	elseif game.IsEmpty(eligibleUnplayedLines) then
		-- All lines played, start the record over
		for textLinesName, textLines in pairs(textLineSets) do
			game.GameState.PlayedRandomTextLines[textLinesName] = nil
		end
		randomLines = game.GetRandomValue(allEligibleLines) or {}
	else
		randomLines = game.GetRandomValue(eligibleUnplayedLines) or {}
	end
	game.GameState.PlayedRandomTextLines[randomLines.Name] = true
	game.PlayTextLines(source, randomLines)
	return true
end

function mod.AddTextLineToTextLineRecord(source, args)
	if args.TextLine ~= nil then
		game.GameState.TextLinesRecord[args.TextLine] = true
		game.CurrentRun.TextLinesRecord[args.TextLine] = true
		if game.CurrentHubRoom ~= nil then
			game.CurrentRun.HubTextLinesRecord[args.TextLine] = true
		elseif game.CurrentRun.CurrentRoom ~= nil then
			game.CurrentRun.CurrentRoom.TextLinesRecord[args.TextLine] = true
		end

		if args.AddToGiftTextLinesOrderRecord then
			table.insert(game.GameState.GiftTextLinesOrderRecord[game.GetGenusName(source)], args.TextLine)
		end
	end
end
