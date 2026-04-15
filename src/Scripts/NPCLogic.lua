function mod.ModsNikkelMHadesBiomesBenefitChoice(source, args, screen)
	RemoveInputBlock({ Name = "PlayTextLines" })
	source = source or {}
	args = args or {}

	-- Change the portrait if requested
	if args.PortraitName ~= nil and screen.CurrentPortrait ~= args.PortraitName then
		SetAnimation({ DestinationId = screen.PortraitId, Name = screen.CurrentPortrait .. "_Exit" })
		game.waitUnmodified(source.PortraitExitWait or 0.3)
		SetAnimation({ DestinationId = screen.PortraitId, Name = args.PortraitName })
		screen.CurrentPortrait = args.PortraitName
	end

	-- Play EndVoiceLines or EndCues if requested
	if args.ModsNikkelMHadesBiomes_TextLineSetEndVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, args.ModsNikkelMHadesBiomes_TextLineSetEndVoiceLines, nil, source, args)
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

	-- Restart Eurydice's and Orpheus' singing if we are talking to one of them
	if source ~= nil and source.ModsNikkelMHadesBiomesPauseMusicVocalsOnTextLines then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
	end
	if source ~= nil and source.ModsNikkelMHadesBiomesPauseMusicVocals2OnTextLines then
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
	end

	RandomSynchronize(9)

	source.UpgradeOptions = args.ModsNikkelMHadesBiomes_ForcedRewards or {}
	source.BlockReroll = true
	local options = ShallowCopyTable(args.UpgradeOptions) or {}
	local eligibleOptions = {}
	local priorityOptions = {}

	if not args.ModsNikkelMHadesBiomes_ForcedRewards then
		for _, option in pairs(options) do
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

		for _ = 1, 3 do
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
	else
		-- Make sure we use any potential prioritySlotEntranceAnimations for the forced rewards
		for _, option in pairs(source.UpgradeOptions) do
			if option.PriorityRequirements ~= nil and game.IsGameStateEligible(source, option.PriorityRequirements) and option.PrioritySlotEntranceAnimation then
				option.SlotEntranceAnimation = option.PrioritySlotEntranceAnimation
			end
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

	if args.ModsNikkelMHadesBiomesFlavorTextIds ~= nil then
		source.FlavorTextIds = args.ModsNikkelMHadesBiomesFlavorTextIds
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
	game.FreezePlayerUnit("ModsNikkelMHadesBiomesNPCPostChoicePresentation")

	local heroId = game.CurrentRun.Hero.ObjectId
	local npcId = screen.Source.ObjectId
	local npc = game.ActiveEnemies[npcId]

	PlaySound({ Name = screen.Source.ConfirmSound or "/SFX/Menu Sounds/GodBoonChoiceConfirm" })
	if npc and npc.CharacterInteractions and npc.CharacterInteractions.Rescue and npc.CharacterInteractions.Rescue.VoiceLines then
		game.thread(game.PlayVoiceLines, npc.CharacterInteractions.Rescue.VoiceLines, nil, screen.OpenedFrom, args)
	end

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
		for entryName, _ in pairs(chapterData.Entries) do
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
	-- NPC_Orpheus_Story_01 or NPC_Eurydice_01 or NPC_Orpheus_01
	source = source or game.ActiveEnemies[554419] or game.ActiveEnemies[514436] or game.ActiveEnemies[390000]

	mod.ModsNikkelMHadesBiomesSingingPresentation(source, args)

	if game.AudioState.SecretMusicName ~= args.TrackName then
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
		})

		-- Wait so we don't set the volume for the old SecretMusicId
		if args.StartDelay ~= nil then
			-- Small buffer to make sure the music has actually started playing
			game.wait(args.StartDelay + 0.02)
		end
		SetVolume({ Id = game.AudioState.SecretMusicId, Value = 0.0, Duration = 0.0 })
		SetVolume({ Id = game.AudioState.SecretMusicId, Value = 1.0, Duration = args.Duration or 0.0 })

		game.SetDefaultMusicParams(game.AudioState.SecretMusicName, game.AudioState.SecretMusicId, args)
		if args.TrackOffsetMin ~= nil then
			SetSoundPosition({
				Id = game.AudioState.SecretMusicId,
				Position = game.RandomFloat(args.TrackOffsetMin, args.TrackOffsetMax)
			})
		end
	end

	if source.ModsNikkelMHadesBiomesPlayVocals then
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
	else
		SetSoundCueValue({ Names = { "Vocals", }, Id = game.AudioState.SecretMusicId, Value = 0 })
	end

	if source.ModsNikkelMHadesBiomesPlayVocals2 then
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.SecretMusicId, Value = 1, Duration = 0.25 })
	else
		SetSoundCueValue({ Names = { "Vocals2", }, Id = game.AudioState.SecretMusicId, Value = 0 })
	end
end

function mod.ModsNikkelMHadesBiomesEurydiceBuff(args, source)
	args = args or {}
	mod.ModsNikkelMHadesBiomesEurydicePreBuffPresentation(source, args)
	if args.FunctionName then
		game.CallFunctionName(args.FunctionName, source, args.FunctionArgs or args)
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
		game.CallFunctionName(args.FunctionName, source, args.FunctionArgs or args)
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
		game.CallFunctionName(args.FunctionName, source, args.FunctionArgs or args)
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

-- Adding to game namespace as the mapping order of operations would make it difficult to change this beforehand
function game.OrpheusExit(source, args)
	args = args or {}
	source = game.ActiveEnemies[390000]

	mod.ModsNikkelMHadesBiomesSetFlag(source, { FlagName = "OrpheusReunionInProgress", Value = true })

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
			Text = "ModsNikkelMHadesBiomes_OrpheusEurydiceQuestItem",
			TextRevealSound = "/Leftovers/Menu Sounds/TextReveal3",
			AnimationName = "LocationTextBG",
			AnimationOutName = "LocationTextBGOut"
		})
end

function mod.MusicPracticePresentation(source, args)
	FadeOut({ Color = game.Color.Black, Duration = 0.5 })

	game.wait(0.75)
	PlaySound({ Name = "/SFX/LyreGood" })
	game.wait(0.5)

	game.thread(game.DisplayInfoBanner, nil, {
		TitleText = "LoungeIntermissionMessage",
		TitleTextOffsetX = 81,
		LangTitleTextOffsetX = {
			{ Code = "el", Value = 0 },
			{ Code = "ja", Value = 0 },
			{ Code = "ko", Value = 0 },
			{ Code = "ru", Value = 0 },
			{ Code = "uk", Value = 0 },
		},
		TextRevealSound = "/Leftovers/Menu Sounds/EmoteExcitement",
		Color = game.Color.Gold,
		TextColor = game.Color.White,
		TextOffsetY = 20,
		TitleFont = "SpectralSCLightTitling",
		SubtitleFont = "SpectralSCLightTitling",
		Layer = "ScreenOverlay",
		AnimationName = game.CurrentRun.CurrentRoom.LocationAnimName or "LocationBackingIrisSmallIn",
		AnimationOutName = game.CurrentRun.CurrentRoom.LocationAnimOutName or "LocationBackingIrisSmallOut",
	})

	game.wait(2)
	AdjustFullscreenBloom({ Name = "Menu", Duration = 0.3 })
	AdjustColorGrading({ Name = "Ascension", Duration = 0.3 })
	AdjustColorGrading({ Name = "Off", Duration = 5.0 })
	AdjustFullscreenBloom({ Name = "Off", Duration = 5.0 })
	game.wait(2)

	FadeIn({ Color = game.Color.Black, Duration = 0.5 })
end

function mod.SpawnOrpheusLyre(source, args)
	-- Exit door
	local spawnId = 485517
	local houseLyre = {
		Name = "HouseLyre01",
		InteractDistance = 130,
		InteractOffsetX = -20,
		InteractOffsetY = 70,
		UseText = "UseLute01",
		OnUsedFunctionName = _PLUGIN.guid .. "." .. "UseLyre",
	}

	houseLyre.ObjectId = SpawnObstacle({
		Name = "HouseLyre01",
		Group = "Standing",
		DestinationId = spawnId,
		AttachedTable = houseLyre,
		OffsetX = 690,
		OffsetY = -160,
	})
	houseLyre.ActivateIds = { houseLyre.ObjectId }

	SetScale({ Id = houseLyre.ObjectId, Fraction = 0.2 })
	game.SetupObstacle(houseLyre)
end

function mod.UseLyre(usee, args)
	local coolDown = 1.5

	UseableOff({ Id = usee.ObjectId })
	HideUseButton(usee.ObjectId, usee)
	AddInputBlock({ Name = "ZagreusUsingLyre" })
	CreateAnimation({ DestinationId = usee.ObjectId, Name = "HouseMusicNotesShower" })

	game.IncrementTableValue(game.GameState.ItemInteractions, "ModsNikkelMHadesBiomes_HouseLyre01", 1)
	game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesNumLyreUses = (game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesNumLyreUses or 0) +
			1

	AngleTowardTarget({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = usee.ObjectId })
	SetAnimation({ Name = "Melinoe_InteractToEquip", DestinationId = game.CurrentRun.Hero.ObjectId })
	Shake({ Id = usee.ObjectId, Distance = 1.5, Speed = 150, Duration = 0.15 })

	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ModsNikkelMHadesBiomes_UsedLyreVoiceLines, true)

	if game.GameState.TextLinesRecord.OrpheusMusicProgress03 and game.GameState.ItemInteractions.ModsNikkelMHadesBiomes_HouseLyre01 >= 140 then
		coolDown = 11.5
		PlaySound({ Name = "/SFX/LyreGood", Id = usee.ObjectId })
		Shake({ Id = usee.ObjectId, Distance = 0.5, Speed = 30, Duration = 5, FalloffSpeed = 30 })
	elseif game.GameState.TextLinesRecord.OrpheusMusicProgress02 and game.GameState.ItemInteractions.ModsNikkelMHadesBiomes_HouseLyre01 >= 70 then
		coolDown = 4.5
		PlaySound({ Name = "/SFX/LyreMedium", Id = usee.ObjectId })
	else
		PlaySound({ Name = "/SFX/LyreSuck", Id = usee.ObjectId })
	end

	game.wait(0.5, game.RoomThreadName)
	RemoveInputBlock({ Name = "ZagreusUsingLyre" })

	game.wait(coolDown, game.RoomThreadName)

	if not usee.UseableToggleBlocked and not (game.CurrentRun.CurrentRoom.ModsNikkelMHadesBiomesNumLyreUses > 5) then
		UseableOn({ Id = usee.ObjectId })
	end
end

-- #region Orpheus Traits
-- #region ModsNikkelMHadesBiomesOrpheusBossFightMusicBoon
function mod.OrpheusRaiseKilledEnemy(enemy, args)
	if game.MapState.OrpheusRaiseDeadCount then
		return
	end
	if not game.RandomChance(args.SummonChance * game.GetTotalHeroTraitValue("LuckMultiplier", { IsMultiplier = true })) then
		return
	end
	if enemy.UniqueRaise and not game.IsEmpty(game.MapState.SpellSummons) then
		for i, unit in pairs(game.MapState.SpellSummons) do
			if unit.Name == enemy.Name then
				return
			end
		end
	end

	local enemyName = enemy.Name
	local enemyData = game.EnemyData[enemyName]
	if enemyData and ((not enemyData.IsBoss and not enemyData.BlockRaiseDead) or enemyData.ForceAllowRaiseDead) then
		game.IncrementTableValue(MapState, "OrpheusRaiseDeadCount")
		local tempObstacle = SpawnObstacle({ Name = "BlankObstacle", DestinationId = enemy.ObjectId })
		local summonArgs = game.ShallowCopyTable(game.WeaponData.WeaponSpellSummon.SummonMultipliers) or {}
		if args.MaxHealthMultiplier then
			summonArgs.MaxHealthMultiplier = args.MaxHealthMultiplier
		end
		if args.SpeedMultiplier then
			summonArgs.SpeedMultiplier = args.SpeedMultiplier
		end
		if args.ScaleMultiplier then
			summonArgs.ScaleMultiplier = args.ScaleMultiplier
		end
		if args.DamageMultiplier then
			summonArgs.DamageMultiplier = args.DamageMultiplier
		end
		summonArgs.SpawnPointId = tempObstacle
		local newEnemy = game.CreateAlliedEnemy(enemyName, summonArgs) or {}
		game.DestroyOnDelay({ tempObstacle }, 0.1)
		game.CurrentRun.CurrentRoom.DestroyAssistUnitOnEncounterEndId = newEnemy.ObjectId
		game.CurrentRun.CurrentRoom.AssistUnitName = enemyName
		mod.OrpheusRaiseDeadPresentation(newEnemy)

		if game.CurrentRun.CurrentRoom.Encounter ~= nil and game.CurrentRun.CurrentRoom.Encounter.ActiveEnemyCap ~= nil then
			local activeCapWeight = newEnemy.ActiveCapWeight or 1
			game.CurrentRun.CurrentRoom.Encounter.ActiveEnemyCap = math.min(ConstantsData.MaxActiveEnemyCount,
				game.CurrentRun.CurrentRoom.Encounter.ActiveEnemyCap + activeCapWeight)
		end
	end
end

function mod.OrpheusRaiseDeadPresentation(newEnemy)
	PlaySound({ Name = newEnemy.IsAggroedSound, Id = newEnemy.ObjectId })
	game.thread(game.InCombatText, newEnemy.ObjectId, "ModsNikkelMHadesBiomesOrpheusChaosThemeBoonRaiseDeadActivated", 1.2,
		{ PreDelay = 0.25, ShadowScaleX = 1.0, SkipFlash = true })
end

-- #endregion

-- #region ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon
function mod.OrpheusApplyRoot(victim, functionArgs, triggerArgs)
	if not game.CurrentRun.CurrentRoom or not game.CurrentRun.CurrentRoom.Encounter or not victim then
		return
	end

	local retaliateRootedEnemyAlive = false
	for _, enemy in pairs(game.ShallowCopyTable(game.ActiveEnemies) or {}) do
		if enemy.ModsNikkelMHadesBiomesRetaliateRooted then
			retaliateRootedEnemyAlive = true
			break
		end
	end
	if retaliateRootedEnemyAlive then
		return
	end

	if not victim or victim.SkipModifiers or not game.CheckCooldown("ModsNikkelMHadesBiomesOrpheusRetaliateRoot", functionArgs.Cooldown) then
		return
	end

	victim.ModsNikkelMHadesBiomesRetaliateRooted = true

	local traitData = game.GetHeroTrait("ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon") or {}
	if traitData then
		game.TraitUIActivateTrait(traitData, { FlashOnActive = true, Duration = functionArgs.Cooldown })
	end

	-- Apply Root to all enemies in the room
	for _, enemy in pairs(game.ActiveEnemies) do
		if not enemy.IsDead and not enemy.SkipModifiers then
			game.ApplyRoot(enemy, functionArgs, triggerArgs)
		end
	end
end

function mod.OrpheusRetaliateRootSetup(hero, args)
	game.ResetCooldown("ModsNikkelMHadesBiomesOrpheusRetaliateRoot")
	local attackTrait = game.GetExistingUITraitName("ModsNikkelMHadesBiomesOrpheusOrpheusSong1Boon")
	if attackTrait then
		game.TraitUIActivateTrait(attackTrait)
	end
end

-- #endregion

-- #regionModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon
modutil.mod.Path.Wrap("CheckLastStand", function(base, victim, triggerArgs)
	local hasLastStand = base(victim, triggerArgs)

	-- If false is returned, it means the player died without any Death Defiance effects remaining
	-- If the player has the Orpheus boon, quickly add a Death Defiance and use it immediately
	if not hasLastStand and game.HeroHasTrait("ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon") then
		game.AddLastStand({
			Name = "ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon",
			Icon = "ExtraLifeMel",
			InsertAtEnd = true,
			HealFraction = GetTotalHeroTraitValue("ModsNikkelMHadesBiomesOrpheusLastStandHealFraction"),
			ManaFraction = GetTotalHeroTraitValue("ModsNikkelMHadesBiomesOrpheusLastStandHealFraction"),
			Silent = true
		})

		-- Remove all core boons as well as the ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon
		local traitsToRemove = {}
		for _, traitData in pairs(game.CurrentRun.Hero.Traits) do
			if game.Contains({ "Melee", "Secondary", "Ranged", "Rush", "Mana" }, traitData.Slot) then
				table.insert(traitsToRemove, traitData)
			end
		end
		for _, traitData in pairs(traitsToRemove) do
			game.RemoveTraitData(game.CurrentRun.Hero, traitData, { Silent = true })
		end
		game.UseTrait(game.CurrentRun.Hero, "ModsNikkelMHadesBiomesOrpheusOrpheusSong2Boon")

		hasLastStand = game.CheckLastStand(victim, triggerArgs)
	end

	return hasLastStand
end)

-- #endregion

-- #endregion

-- #endregion

-- #region Megaera/Thanatos Relationship/Romance
function mod.SurpriseNPCPresentation(source, args)
	if args.SourceId ~= nil then
		source = game.ActiveEnemies[args.SourceId]
	end

	AddInputBlock({ Name = "SurpriseNPCPresentation" })

	game.EndAutoSprint()
	CancelWeaponFireRequests({ Id = game.CurrentRun.Hero.ObjectId })
	Stop({ Id = game.CurrentRun.Hero.ObjectId })
	Halt({ Id = game.CurrentRun.Hero.ObjectId })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	game.killWaitUntilThreads("ReattachCameraOnInput")

	game.wait(args.IntroWait or 0.4, game.RoomThreadName)

	AngleTowardTarget({ Id = source.ObjectId, DestinationId = game.CurrentRun.Hero.ObjectId })
	if not args.SkipPan then
		PanCamera({ Ids = args.PanIds or { source.ObjectId, game.CurrentRun.Hero.ObjectId }, Duration = 1.5, EaseIn = 0.05, EaseOut = 0.3 })
	end

	game.PlayVoiceLines(args.VoiceLines, false, source)

	RemoveInputBlock({ Name = "SurpriseNPCPresentation" })

	if args.TextLineSet ~= nil then
		game.ProcessTextLines(args.TextLineSet)
		mod.PlayRandomRemainingTextLines(source, args.TextLineSet)
	end

	LockCamera({ Id = game.CurrentRun.Hero.ObjectId, Duration = 1.25 })

	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
end

function mod.BedroomIntermissionApproach(source, args)
	wait(0.35)

	AddInputBlock({ Name = "MoveHeroToRoomPosition" })
	local initialSpeed = GetUnitDataValue({ Id = game.CurrentRun.Hero.ObjectId, Property = "Speed" })
	SetUnitProperty({ DestinationId = game.CurrentRun.Hero.ObjectId, Property = "CollideWithObstacles", Value = false })
	SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = game.CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "MelinoeWalk", DestinationId = game.CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = 90, DestinationId = game.CurrentRun.Hero.ObjectId })

	Move({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId, Mode = "Precise" })

	local notifyName = "WithinDistance" .. source.ObjectId
	NotifyWithinDistance({
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationId = source.ObjectId,
		Distance = 100,
		Notify = notifyName
	})
	waitUntil(notifyName)
	Stop({ Id = game.CurrentRun.Hero.ObjectId })
	Halt({ Id = game.CurrentRun.Hero.ObjectId })

	SetUnitProperty({ Property = "StartGraphic", Value = "MelinoeStart", DestinationId = game.CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = "MelinoeRun", DestinationId = game.CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = initialSpeed, DestinationId = game.CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "CollideWithObstacles", Value = true, DestinationId = game.CurrentRun.Hero.ObjectId })
	RemoveInputBlock({ Name = "MoveHeroToRoomPosition" })

	wait(0.1)

	SetAnimation({ DestinationId = game.CurrentRun.Hero.ObjectId, Name = "MelinoeIdleWeaponless" })
	AngleTowardTarget({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })
end

function mod.BedroomIntermissionPresentation(source, args)
	args = args or {}

	FadeOut({ Color = game.Color.Black, Duration = 0.5 })
	game.PauseMusic()

	local megaeraFlirtVoiceLines = {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.55,
		ObjectType = "NPC_FurySister_01",
		-- Let's see, now...
		{ Cue = "/VO/Megaera_30232" },
		-- What are we going to do.
		{ Cue = "/VO/Megaera_30233" },
		-- What am I going to do with you.
		{ Cue = "/VO/Megaera_30234" },
		-- Get over here, right now.
		{ Cue = "/VO/Megaera_30235" },
		-- Oh I have an idea.
		{ Cue = "/VO/Megaera_30236" },
		-- Ah, I know just the thing.
		{ Cue = "/VO/Megaera_30237" },
	}

	local megSound1 = nil
	local megSound2 = nil
	local thanSound1 = nil
	local thanSound2 = nil
	local melSound1 = nil
	local melSound2 = nil
	local melSound3 = nil
	if args.UseRandomSounds then
		local megLaughSounds = {
			"/VO/Megaera_30228",
			"/VO/Megaera_30229",
			"/VO/Megaera_30230",
			"/VO/Megaera_30231",
		}
		megSound1 = game.RemoveRandomValue(megLaughSounds)
		megSound2 = game.RemoveRandomValue(megLaughSounds)
		local thanLaughSounds = {
			"/VO/Thanatos_0468",
			"/VO/Thanatos_0469",
			"/VO/Thanatos_0470",
			"/VO/Thanatos_0471",
			"/VO/Thanatos_0472",
		}
		thanSound1 = game.RemoveRandomValue(thanLaughSounds)
		thanSound2 = game.RemoveRandomValue(thanLaughSounds)
	end
	local melLaughSounds = {
		"/VO/Melinoe_0350",
		"/VO/Melinoe_0351",
		"/VO/Melinoe_0352",
		"/VO/Melinoe_0353",
		"/VO/Melinoe_4412",
		"/VO/Melinoe_4413",
		"/VO/Melinoe_4414",

		"/VO/Melinoe_4416",
		"/VO/Melinoe_4418",
		"/VO/Melinoe_1963",
		"/VO/Melinoe_1964",
		"/VO/Melinoe_1965",
	}
	melSound1 = game.RemoveRandomValue(melLaughSounds)
	melSound2 = game.RemoveRandomValue(melLaughSounds)
	melSound3 = game.RemoveRandomValue(melLaughSounds)

	if args ~= nil and args.ExtraWaitTime ~= nil then
		game.wait(args.ExtraWaitTime)
	end

	if args ~= nil and args.Partner == "Thanatos" then
		game.wait(1)
		PlaySound({ Name = "/Leftovers/SFX/RobeFlutter" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		PlaySound({ Name = melSound1 })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		PlaySound({ Name = thanSound1 or "/VO/Thanatos_0469" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		PlaySound({ Name = melSound2 })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = thanSound2 or "/VO/Thanatos_0468" })
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(1.5)
	elseif args ~= nil and args.Partner == "MegThan" then
		game.thread(game.PlayVoiceLines, megaeraFlirtVoiceLines, true)
		game.wait(2)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		PlaySound({ Name = "/VO/Megaera_30228" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/VO/Thanatos_0472" })
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = melSound1 })
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/SFX/Enemy Sounds/Megaera/MegaeraWhipFlurryAttack" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		PlaySound({ Name = melSound2 })
		game.wait(0.3)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/VO/Megaera_30231" })
		game.wait(1.5)
		PlaySound({ Name = melSound3 })
		game.wait(1.5)
	else
		game.thread(game.PlayVoiceLines, megaeraFlirtVoiceLines, true)
		-- Megaera
		game.wait(2)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		PlaySound({ Name = megSound1 or "/VO/Megaera_30228" })
		game.wait(0.5)
		PlaySound({ Name = "/SFX/Enemy Sounds/Megaera/MegaeraWhipFlurryAttack" })
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.6)
		PlaySound({ Name = "/VO/MelinoeEmotes/EmoteHurt" })
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		game.wait(0.5)
		PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
		PlaySound({ Name = megSound2 or "/VO/Megaera_30227" })
		game.wait(0.8)
		PlaySound({ Name = melSound1 })
		game.wait(1.5)
	end

	if args ~= nil and args.ExtraWaitTime ~= nil then
		game.wait(args.ExtraWaitTime)
	end

	FadeIn({ Color = game.Color.Black, Duration = 0.5 })

	game.DisplayInfoBanner(nil, {
		TitleText = "BedroomIntermissionMessage",
		TextRevealSound = "/Leftovers/Menu Sounds/EmoteExcitement",
		Color = game.Color.Pink,
		TextColor = game.Color.White,
		TextOffsetY = 25,
		TitleFont = "SpectralSCLightTitling",
		SubtitleFont = "SpectralSCLightTitling",
		Layer = "Overlay",
		AnimationName = game.CurrentRun.CurrentRoom.LocationAnimName or "LocationBackingIrisSmallIn",
		AnimationOutName = game.CurrentRun.CurrentRoom.LocationAnimOutName or "LocationBackingIrisSmallOut",
	})

	game.ResumeMusic()
end

-- #endregion
