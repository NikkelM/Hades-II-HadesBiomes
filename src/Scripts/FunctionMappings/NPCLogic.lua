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

function game.ModsNikkelMHadesBiomesBenefitChoice(source, args, screen)
	RemoveInputBlock({ Name = "PlayTextLines" })

	RandomSynchronize(9)

	source.UpgradeOptions = {}
	source.BlockReroll = true
	local options = ShallowCopyTable(args.UpgradeOptions) or {}
	local eligibleOptions = {}
	local priorityOptions = {}
	for i, option in pairs(options) do
		if option.GameStateRequirements == nil or game.IsGameStateEligible(source, option.GameStateRequirements) then
			if option.PriorityRequirements ~= nil and game.IsGameStateEligible(source, option.PriorityRequirements) then
				table.insert(priorityOptions, option)
			else
				table.insert(eligibleOptions, option)
			end
		end
	end
	for i = 1, 3 do
		if not game.IsEmpty(priorityOptions) then
			local option = game.RemoveRandomValue(priorityOptions) or {}
			table.insert(source.UpgradeOptions, option)
			option.SlotEntranceAnimation = option.PrioritySlotEntranceAnimation
		elseif not game.IsEmpty(eligibleOptions) then
			local option = game.RemoveRandomValue(eligibleOptions) or {}
			if option.Rarity and game.TableLength(eligibleOptions) > 0 and not game.PassRarityCheck(option.Rarity) then
				option = game.RemoveRandomValue(eligibleOptions)
			end
			table.insert(source.UpgradeOptions, option)
		end
	end
	if args.PortraitShift ~= nil then
		args.PortraitShift.Id = screen.PortraitId
		Move(args.PortraitShift)
	end

	game.OpenUpgradeChoiceMenu(source, args)
	if args.OnCloseFinishedFunctionName then
		screen.OnCloseFinishedFunctionName = args.OnCloseFinishedFunctionName
	end

	AddInputBlock({ Name = "PlayTextLines" })
end

function game.SisyphusPostChoicePresentation(screen, args)
	args = args or {}
	local heroId = game.CurrentRun.Hero.ObjectId
	local npcId = screen.Source.ObjectId
	game.FreezePlayerUnit("SisyphusPostChoicePresentation")
	AngleTowardTarget({ Id = heroId, DestinationId = npcId })
	game.wait(0.25)
	SetAnimation({ Name = "MelinoeSaluteToEquip", DestinationId = heroId })
	game.wait(0.25)
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ThankingCharacterVoiceLines, true)
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })

	game.wait(0.1)
	game.UnfreezePlayerUnit("SisyphusPostChoicePresentation")
end

function game.SisyphusDropPresentation(consumable, args)
	local source = game.ActiveEnemies
			[GetClosestUnitOfType({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = "NPC_Sisyphus_01", Distance = 9999 })]
	SetAnimation({ DestinationId = source.ObjectId, Name = "SisyphusElbowing" })
end

-- #endregion
-- #region Eurydice
function game.ModsNikkelMHadesBiomesSingingPresentation(source, ars)
	if source.SingingFx ~= nil then
		CreateAnimation({
			Name = source.SingingFx,
			DestinationId = source.ObjectId,
			OffsetX = source.SingingAnimOffsetX or source.AnimOffsetX,
			OffsetZ = source.AnimOffsetZ,
			Group = "Combat_UI_World"
		})
	end
	if source.SingingAnimation ~= nil then
		SetAnimation({ Name = source.SingingAnimation, DestinationId = source.ObjectId })
	end
	if source.PartnerSingingAnimation ~= nil and source.PartnerObjectId ~= nil then
		SetAnimation({ Name = source.PartnerSingingAnimation, DestinationId = source.PartnerObjectId })
	end
end

function game.ModsNikkelMHadesBiomesMusicianMusic(source, args)
	game.CurrentRun.EventState[source.ObjectId] = { FunctionName = "ModsNikkelMHadesBiomesSingingPresentation", Args = args }
	game.ModsNikkelMHadesBiomesSingingPresentation(source, args)

	if game.AudioState.AmbientMusicId ~= nil then
		-- Quick cut the previously playing id
		StopSound({ Id = game.AudioState.AmbientMusicId, Duration = 0.25 })
		game.AudioState.AmbientMusicId = nil
	end

	game.AudioState.AmbientMusicId = PlaySound({ Name = args.TrackName, Id = source.ObjectId })
	SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.AmbientMusicId, Value = 1 })
	game.AudioState.AmbientTrackName = args.TrackName
	SetVolume({ Id = game.AudioState.AmbientMusicId, Value = 1 })
	if args.TrackOffsetMin ~= nil then
		SetSoundPosition({
			Id = game.AudioState.AmbientMusicId,
			Position = game.RandomFloat(args.TrackOffsetMin, args.TrackOffsetMax)
		})
	end
	game.thread(game.ModsNikkelMHadesBiomesPauseUnpauseSoundWorkaround, game.AudioState.AmbientMusicId)
end

-- Workaround for FMOD bug, after a long play-session VO played in 2D can become inaudible. Pausing and unpausing the sound fixes it.
function game.ModsNikkelMHadesBiomesPauseUnpauseSoundWorkaround(soundId)
	game.wait(0.03)
	PauseSound({ Id = soundId, Duration = 0 })
	ResumeSound({ Id = soundId, Duration = 0 })
end

-- #endregion
