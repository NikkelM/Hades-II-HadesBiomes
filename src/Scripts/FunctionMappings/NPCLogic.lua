function mod.ModsNikkelMHadesBiomesBenefitChoice(source, args, screen)
	RemoveInputBlock({ Name = "PlayTextLines" })
	source = source or {}
	args = args or {}

	-- Change the portrait if requested
	if args.PortraitName ~= nil and screen.CurrentPortrait ~= args.PortraitName then
		SetAnimation({ DestinationId = screen.PortraitId, Name = screen.CurrentPortrait .. "_Exit" })
		game.waitUnmodified(source.PortraitExitWait or 0.3)
		SetAnimation({ DestinationId = screen.PortraitId, Name = args.PortraitName })
	end

	-- Play EndVoiceLines or EndCues if requested
	if args.ModsNikkelMHadesBiomes_TextLineSetEndVoiceLines ~= nil then
		game.thread(game.PlayEndVoiceLines, args.ModsNikkelMHadesBiomes_TextLineSetEndVoiceLines, source, args)
	end
	if args.ModsNikkelMHadesBiomes_TextLineSetEndCue ~= nil then
		game.thread(
			game.PlayVoiceLines, { Cue = args.ModsNikkelMHadesBiomes_TextLineSetEndCue }, nil, game.CurrentRun.Hero, args
		)
	end

	-- Check if Orpheus should start singing
	if args.CheckOrpheusSinging == true and game.IsGameStateEligible(source, source.OrpheusSingsAgainRequirements) then
		if source.ModsNikkelMHadesBiomes_OrpheusEndTextLinesAnimation then
			SetAnimation({ DestinationId = source.ObjectId, Name = source.ModsNikkelMHadesBiomes_OrpheusEndTextLinesAnimation })
		end
	end

	-- Restart Eurydice's and Orpheus' singing if we are talking to her
	if source ~= nil and source.ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
	end
	if source ~= nil and source.ModsNikkelMHadesBiomesPauseMusicVocals2OnTextLines then
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
	end
	if textLines ~= nil and textLines.ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.SecretMusicId, Value = 1 })
	end
	if textLines ~= nil and textLines.ModsNikkelMHadesBiomesPauseMusicVocals2OnTextLines then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1 })
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
	end

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

	if args.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionName then
		screen.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionName = args
				.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionName
		screen.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionArgs = args
				.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionArgs
	end

	game.OpenUpgradeChoiceMenu(source, args)
	if args.OnCloseFinishedFunctionName then
		screen.OnCloseFinishedFunctionName = args.OnCloseFinishedFunctionName
	end

	AddInputBlock({ Name = "PlayTextLines" })
end

function mod.ModsNikkelMHadesBiomesNPCPostChoicePresentation(screen, args)
	args = args or {}
	local heroId = game.CurrentRun.Hero.ObjectId
	local npcId = screen.Source.ObjectId
	game.FreezePlayerUnit("ModsNikkelMHadesBiomesNPCPostChoicePresentation")

	if screen.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionName ~= nil then
		game.thread(game.CallFunctionName,
			screen.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionName, screen,
			screen.ModsNikkelMHadesBiomesNPCPostChoicePresentation_PostLineThreadedFunctionArgs)
	end

	AngleTowardTarget({ Id = heroId, DestinationId = npcId })
	game.wait(0.25)
	SetAnimation({ Name = "MelinoeSaluteToEquip", DestinationId = heroId })
	game.wait(0.25)
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ThankingCharacterVoiceLines, true)
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })

	game.wait(0.1)
	game.UnfreezePlayerUnit("ModsNikkelMHadesBiomesNPCPostChoicePresentation")

	-- Check if a new entry for this NPC should be added to the Codex
	for chapterName, chapterData in pairs(game.CodexData) do
		for entryName, entryData in pairs(chapterData.Entries) do
			game.CheckCodexUnlock(chapterName, entryName)
		end
	end
end

-- #region Sisyphus
modutil.mod.Path.Wrap("BouldyHitPresentation", function(base, victim)
	if game.CurrentRun.ModsNikkelMHadesBiomesIsModdedRun then
		local source = game.ActiveEnemies
				[GetClosestUnitOfType({ Id = victim.ObjectId, DestinationName = "NPC_Sisyphus_01", Distance = 9999 })]
		if source ~= nil then
			game.thread(game.PlayVoiceLines, source.BouldyAttackReactionVoiceLines, true, source)
		end
	else
		return base(victim)
	end
end)

function mod.SetUpBouldyConversation()
	local source = game.ActiveEnemies
			[GetClosestUnitOfType({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = "ModsNikkelMHadesBiomes_NPC_Bouldy_01", Distance = 3000 })]
	game.CheckAvailableTextLines(source)
	game.SetAvailableUseText(source)
end

function mod.ModsNikkelMHadesBiomesSisyphusBuff(args, source)
	args = args or {}
	if args.FunctionName == "GiveRandomConsumables" then
		if args.Currency ~= nil then
			args.LootOptions = {
				{
					Name = "Currency",
					Amount = args.Currency,
				},
			}
		end
		game.CallFunctionName(args.FunctionName, args)
	end
end

function mod.ModsNikkelMHadesBiomesSisyphusDropPresentation(consumable, args)
	local source = game.ActiveEnemies[370001] or game.ActiveEnemies
			[GetClosestUnitOfType({ Id = game.CurrentRun.Hero.ObjectId, DestinationName = "NPC_Sisyphus_01", Distance = 9999 })]
	SetAnimation({ DestinationId = source.ObjectId, Name = "SisyphusElbowing" })
end

-- #endregion

-- #region Eurydice
function mod.ModsNikkelMHadesBiomesSingingPresentation(source, ars)
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

function mod.ModsNikkelMHadesBiomesEurydiceMusic(source, args)
	source = source or game.ActiveEnemies[514436]

	game.CurrentRun.EventState[source.ObjectId] = {
		FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesSingingPresentation",
		Args = args
	}
	mod.ModsNikkelMHadesBiomesSingingPresentation(source, args)

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
	game.AudioState.SecretMusicId = PlaySound({
		Name = game.AudioState.SecretMusicName,
		AddCallbacks = true,
		Delay = args.StartDelay or 0,
		Duration = args.Duration or 0
	})
	game.SetDefaultMusicParams(game.AudioState.SecretMusicName, game.AudioState.SecretMusicId, args)
	if args.TrackOffsetMin ~= nil then
		SetSoundPosition({
			Id = game.AudioState.SecretMusicId,
			Position = game.RandomFloat(args.TrackOffsetMin, args.TrackOffsetMax)
		})
	end

	SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
end

function mod.ModsNikkelMHadesBiomesEurydiceBuff(args, source)
	args = args or {}
	mod.ModsNikkelMHadesBiomesEurydicePreBuffPresentation(source, args)
	if args.FunctionName then
		game.CallFunctionName(args.FunctionName, source, args)
	end
	mod.ModsNikkelMHadesBiomesEurydicePostBuffPresentation(source, args)
end

function mod.ModsNikkelMHadesBiomesEurydicePreBuffPresentation(source, args)
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })
	game.wait(1.6)
end

function mod.ModsNikkelMHadesBiomesEurydicePostBuffPresentation(source, args)
	PlaySound({ Name = "/SFX/GyroHealthPickupMunch", Id = game.CurrentRun.Hero.ObjectId })
	CreateAnimation({ Name = "HealthSparkleBurst", DestinationId = game.CurrentRun.Hero.ObjectId, OffsetZ = 50 })
end

-- #endregion

-- #region Patroclus
function mod.ModsNikkelMHadesBiomesPatroclusBuff(args, source)
	args = args or {}
	if args.FunctionName then
		game.CallFunctionName(args.FunctionName, source, args)
	end
	game.wait(1.0)
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })
end

-- For some reason, if the player is too fast exiting this room, the game crashes
function mod.ModsNikkelMHadesBiomesPatroclusExitFunctionName(currentRun, exitDoor, args)
	SetUnitProperty({ Property = "Speed", Value = args.Speed, DestinationId = game.CurrentRun.Hero.ObjectId })
	game.LeaveRoomPresentation(currentRun, exitDoor)
end

function mod.ModsNikkelMHadesBiomesPatroclusRefillLastStands(args)
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

function mod.ModsNikkelMHadesBiomesPatroclusAddMaxHealthMana(source, args)
	local healthGained = args.AddMaxHealth or 30
	local manaGained = args.AddMaxMana or 30
	game.AddMaxHealth(healthGained, "ResourceMaxHealth", { Silent = true })
	game.AddMaxMana(manaGained, "ResourceMaxMana", { Silent = true })
	game.thread(game.BonusHealthAndManaPresentation, healthGained, manaGained, 0.5)
end

-- #endregion

-- #region Orpheus
function mod.ModsNikkelMHadesBiomesOrpheusBuff(args, source)
	args = args or {}
	local orpheus = game.ActiveEnemies[390000]

	if args.FunctionName then
		game.CallFunctionName(args.FunctionName, source, args)
	end
	if args.AddAdditionalTraits then
		for _, trait in pairs(args.AddAdditionalTraits) do
			game.AddTraitToHero({ TraitName = trait })
		end
	end

	-- If Orpheus sings again, start playing the selected boon's song
	if game.IsGameStateEligible(orpheus, orpheus.OrpheusSingsAgainRequirements) then
		mod.ModsNikkelMHadesBiomesEurydiceMusic(orpheus,
			{ TrackName = args.TrackName, StartDelay = 1.5, Duration = 2 })
		game.GameState.ModsNikkelMHadesBiomesLastPlayedOrpheusTrack = args.TrackName
	end
end

-- TODO: Test
-- Adding to game namespace as the mapping order of operations would make it difficult to change this beforehand
function game.OrpheusExit(source, args)
	args = args or {}
	game.wait(args.WaitTime or 0)

	SetAnimation({ Name = "NPCOrpheusExit", DestinationId = source.ObjectId })

	source.NextInteractLines = nil
	UseableOff({ Id = source.ObjectId })
	game.RefreshUseButton(source.ObjectId, source)
	game.StopStatusAnimation(source)

	source.Mute = true
	if args.AnimationState ~= nil then
		game.CurrentRun.AnimationState[source.ObjectId] = args.AnimationState
	end

	game.wait(1.0, game.RoomThreadName)

	game.thread(game.MaxedRelationshipPresentation, source,
		{
			Delay = 1,
			Title = "MainSubPlotComplete",
			Text = "OrpheusEurydiceQuestItem",
			TextRevealSound = "/Leftovers/Menu Sounds/TextReveal3",
			AnimationName = "LocationTextBG",
			AnimationOutName = "LocationTextBGOut"
		})

	-- TODO: Test if needed
	-- if game.ActivatedObjects[source.ObjectId] ~= nil and not game.CurrentRun.Hero.IsDead then
	-- 	game.ActivatedObjects[source.ObjectId] = nil
	-- 	game.wait(0.2, game.RoomThreadName)
	-- 	if game.CheckRoomExitsReady(game.CurrentRun.CurrentRoom) then
	-- 		game.UnlockRoomExits(game.CurrentRun, game.CurrentRun.CurrentRoom)
	-- 	end
	-- end
end

-- TODO: Test - the voiceline using this won't be able to play yet anyways
function MusicPracticePresentation()
	game.wait(1)
	PlaySound({ Name = "/SFX/LyreGood" })
	game.wait(2)

	game.thread(game.DisplayInfoBanner, nil, {
		TitleText = "LoungeIntermissionMessage",
		TextRevealSound = "/Leftovers/Menu Sounds/EmoteExcitement",
		Color = game.Color.Gold,
		TextColor = game.Color.White,
		TextOffsetY = 20,
		TitleFont = "SpectralSCLightTitling",
		SubtitleFont = "SpectralSCLightTitling",
		Layer = "ScreenOverlay",
		AdditionalAnimation = "GodHoodRays",
	})

	game.wait(2)
	AdjustFullscreenBloom({ Name = "Menu", Duration = 0.3 })
	AdjustColorGrading({ Name = "Ascension", Duration = 0.3 })
	AdjustColorGrading({ Name = "Off", Duration = 5.0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 5.0 })
	game.wait(1.0)
end

-- #endregion
