modutil.mod.Path.Context.Wrap.Static("CannotUseDoorPresentation", function(contextWrapDoor)
	modutil.mod.Path.Wrap("CheckSpecialDoorRequirement", function(base, door)
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			local text = modutil.mod.Locals.Stacked(3).text
			local voiceLines = modutil.mod.Locals.Stacked(3).voiceLines
			local failedRequirement = base(door)
			if failedRequirement ~= nil then
				text = failedRequirement
				if failedRequirement == "ExitBlockedByShrinePointReq" then
					voiceLines = door.ExitBlockedByShrinePointsVoiceLines
				elseif failedRequirement == "ExitBlockedByHealthReq" then
					voiceLines = game.HeroVoiceLines.ExitBlockedByHealthVoiceLines
				end
			end
			modutil.mod.Locals.Stacked(3).text = text
			modutil.mod.Locals.Stacked(3).voiceLines = voiceLines

			-- So the vanilla function doesn't overwrite this again
			return nil
		end

		return base(door)
	end)
end)


modutil.mod.Path.Context.Wrap.Static("PartnersChattingPresentation", function(origNpc, origArgs, origContextArgs)
	modutil.mod.Path.Wrap("SpawnObstacle", function(base, obstacleArgs)
		if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
			local npc = modutil.mod.Locals.Stacked(3).npc
			local partner = modutil.mod.Locals.Stacked(3).partner
			if npc.ObjectId == obstacleArgs.DestinationId and npc.ModsNikkelMHadesBiomesIsModdedEnemy then
				obstacleArgs.Attach = nil
				obstacleArgs.AttachToMarkerName = nil
			end
			if partner.ObjectId == obstacleArgs.DestinationId and partner.ModsNikkelMHadesBiomesIsModdedEnemy then
				obstacleArgs.Attach = nil
				obstacleArgs.AttachToMarkerName = nil
			end
		end

		return base(obstacleArgs)
	end)
end)
