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
		-- Is the UpgradeOption itself eligible?
		if option.GameStateRequirements == nil or game.IsGameStateEligible(source, option.GameStateRequirements) then
			-- Does this UpgradeOption have a TraitData entry, and if so, is it eligible?
			if game.TraitData[option.ItemName] and game.IsTraitEligible(game.TraitData[option.ItemName]) then
				-- Should this UpgradeOption be prioritized?
				if option.PriorityRequirements ~= nil and game.IsGameStateEligible(source, option.PriorityRequirements) then
					table.insert(priorityOptions, option)
				else
					table.insert(eligibleOptions, option)
				end
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

	-- Custom: Sort the source.UpgradeOptions by their order in source.Traits
	if source.Traits then
		table.sort(source.UpgradeOptions, function(a, b)
			return game.GetIndex(source.Traits, a.ItemName) < game.GetIndex(source.Traits, b.ItemName)
		end)
	end

	if args.PortraitShift ~= nil then
		args.PortraitShift.Id = screen.PortraitId
		Move(args.PortraitShift)
	end

	-- In some special cases, show a different menu title above the boon selection
	-- E.g. for when you don't yet know Patroclus name
	local offerTextMenuTitleMappings = {
		Patroclus_OfferText03 = "NPC_Patroclus_Unnamed_01",
		Patroclus_OfferText04 = "NPC_Patroclus_Unnamed_01",
	}
	if source.NextInteractLines ~= nil and source.NextInteractLines.ModsNikkelMHadesBiomesPreviousOfferText ~= nil and offerTextMenuTitleMappings[source.NextInteractLines.ModsNikkelMHadesBiomesPreviousOfferText] then
		source.MenuTitle = offerTextMenuTitleMappings[source.NextInteractLines.ModsNikkelMHadesBiomesPreviousOfferText]
	end

	game.OpenUpgradeChoiceMenu(source, args)
	if args.OnCloseFinishedFunctionName then
		screen.OnCloseFinishedFunctionName = args.OnCloseFinishedFunctionName
	end

	AddInputBlock({ Name = "PlayTextLines" })
end

function game.ModsNikkelMHadesBiomesNPCPostChoicePresentation(screen, args)
	args = args or {}
	local heroId = game.CurrentRun.Hero.ObjectId
	local npcId = screen.Source.ObjectId
	game.FreezePlayerUnit("ModsNikkelMHadesBiomesNPCPostChoicePresentation")
	AngleTowardTarget({ Id = heroId, DestinationId = npcId })
	game.wait(0.25)
	SetAnimation({ Name = "MelinoeSaluteToEquip", DestinationId = heroId })
	game.wait(0.25)
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ThankingCharacterVoiceLines, true)
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })

	game.wait(0.1)
	game.UnfreezePlayerUnit("ModsNikkelMHadesBiomesNPCPostChoicePresentation")
end

function game.SisyphusDropPresentation(consumable, args)
	local source = game.ActiveEnemies[370001] or game.ActiveEnemies
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

function game.ModsNikkelMHadesBiomesEurydiceMusic(source, args)
	source = source or game.ActiveEnemies[514436]

	game.CurrentRun.EventState[source.ObjectId] = { FunctionName = "ModsNikkelMHadesBiomesSingingPresentation", Args = args }
	game.ModsNikkelMHadesBiomesSingingPresentation(source, args)

	-- Taken from game.SecretMusicPlayer
	-- Only thing this doesn't do is having Eurydice be the source of the music
	if game.AudioState.SecretMusicName == args.TrackName then
		return
	end

	if game.AudioState.MusicId ~= nil then
		game.PauseMusic()
	end
	if game.AudioState.SecretMusicId ~= nil then
		StopSound({ Id = game.AudioState.SecretMusicId, Duration = 0.25 })
	end

	game.AudioState.SecretMusicName = args.TrackName
	game.AudioState.SecretMusicId = PlaySound({ Name = game.AudioState.SecretMusicName, AddCallbacks = true })
	game.SetDefaultMusicParams(game.AudioState.SecretMusicName, game.AudioState.SecretMusicId, args)
	if args.TrackOffsetMin ~= nil then
		SetSoundPosition({
			Id = game.AudioState.SecretMusicId,
			Position = game.RandomFloat(args.TrackOffsetMin, args.TrackOffsetMax)
		})
	end

	SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
end

function game.EurydiceBuff(args, source)
	game.EurydicePreBuffPresentation(source, args)
	if args.FunctionName == "AddRarityToTraits" then
		game.AddRarityToTraits(source, { NumTraits = args.NumTraits })
	end
	if args.FunctionName == "AddStackToTraits" then
		game.AddStackToTraits(source, { NumTraits = args.NumTraits, NumStacks = args.NumStacks })
	end
end

function game.EurydicePreBuffPresentation(source, args)
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })
	game.wait(1.6)
	PlaySound({ Name = "/SFX/GyroHealthPickupMunch", Id = game.CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "HealthSparkleBurst", DestinationId = game.CurrentRun.Hero.ObjectId, OffsetZ = 50 })
end

-- #endregion

-- #region Patroclus
function game.PatroclusBuff(source, args)
	game.wait(1.0)
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })
	if args.TraitName ~= nil then
		local traitData = TraitData[args.TraitName]
		if traitData.LastStandWeapon ~= nil then
			game.GainLastStandPresentation()
			game.thread(game.InCombatText, game.CurrentRun.Hero.ObjectId, "GainedExtraChance")
		end
	end
end

-- For some reason, if the player is too fast exiting this room, the game crashes
function game.ModsNikkelMHadesBiomesPatroclusExitFunctionName(currentRun, exitDoor, args)
	SetUnitProperty({ Property = "Speed", Value = args.Speed, DestinationId = game.CurrentRun.Hero.ObjectId })
	game.LeaveRoomPresentation(currentRun, exitDoor)
end

function game.PatroclusRefillLastStands(args)
	if not game.CurrentRun.Hero.MaxLastStands then
		return
	end
	args = args or {}
	local numLastStands = game.CurrentRun.Hero.MaxLastStands - game.TableLength(game.CurrentRun.Hero.LastStands)
	local hadLastStands = game.HasLastStand(game.CurrentRun.Hero)
	if numLastStands > 0 then
		local healFraction = args.HealFraction or 0.4
		while numLastStands > 0 do
			game.AddLastStand({
				Name = "Patroclus",
				Icon = "ExtraLifeStyx",
				ManaFraction = healFraction,
				HealFraction = healFraction,
				Silent = true,
			})
			numLastStands = numLastStands - 1
		end
		if not hadLastStands then
			game.thread(game.LowHealthBonusBuffStatePresentation, 0.5)
		end
		game.RecreateLifePips()
	end
end

-- #endregion
