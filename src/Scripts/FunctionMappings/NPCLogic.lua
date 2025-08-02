-- #region Sisyphus
modutil.mod.Path.Wrap("BouldyHitPresentation", function(base, victim)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		local source = game.ActiveEnemies
				[GetClosestUnitOfType({ Id = victim.ObjectId, DestinationName = "NPC_Sisyphus_01", Distance = 9999 })]
		if source ~= nil then
			game.thread(game.PlayVoiceLines, source.BouldyAttackReactionVoiceLines, true, source)
		end
	else
		base(victim)
	end
end)

function game.SisyphusBenefitChoice(source, args, screen)
	RemoveInputBlock({ Name = "PlayTextLines" })

	RandomSynchronize(9)

	-- We only have three options anyways
	source.UpgradeOptions = args.UpgradeOptions
	source.BlockReroll = true
	-- local options = ShallowCopyTable( args.UpgradeOptions )
	-- local eligibleOptions = {}
	-- local priorityOptions = {}

	-- for i, option in pairs( options ) do
	-- 	if option.GameStateRequirements == nil or IsGameStateEligible( source, option.GameStateRequirements ) then
	-- 		if option.PriorityRequirements ~= nil and IsGameStateEligible( source, option.PriorityRequirements ) then
	-- 			table.insert( priorityOptions, option )
	-- 		else
	-- 			table.insert( eligibleOptions, option )
	-- 		end
	-- 	end
	-- end
	-- for i = 1, 3 do
	-- 	if not IsEmpty( priorityOptions ) then
	-- 		local option = RemoveRandomValue( priorityOptions )
	-- 		table.insert( source.UpgradeOptions, option )
	-- 		option.SlotEntranceAnimation = option.PrioritySlotEntranceAnimation
	-- 	elseif not IsEmpty( eligibleOptions ) then
	-- 		local option = RemoveRandomValue( eligibleOptions )
	-- 		if option.Rarity and TableLength( eligibleOptions ) > 0 and not PassRarityCheck( option.Rarity ) then
	-- 			option = RemoveRandomValue( eligibleOptions )
	-- 		end
	-- 		table.insert( source.UpgradeOptions, option )
	-- 	end
	-- end
	if args.PortraitShift ~= nil then
		args.PortraitShift.Id = screen.PortraitId
		Move(args.PortraitShift)
	end
	OpenUpgradeChoiceMenu(source, args)
	-- TODO
	screen.OnCloseFinishedFunctionName = "NarcissusPostChoicePresentation"

	AddInputBlock({ Name = "PlayTextLines" })
end

function game.SisyphusDropPresentation(consumable, args)
	local source = game.ActiveEnemies
			[GetClosestUnitOfType({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = "NPC_Sisyphus_01", Distance = 9999 })]
	SetAnimation({ DestinationId = source.ObjectId, Name = "SisyphusElbowing" })
end

-- #endregion
