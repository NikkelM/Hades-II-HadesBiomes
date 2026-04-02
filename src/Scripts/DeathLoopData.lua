-- #region Ending sequence portrait event
local endingPortraitOnLoadEvent = {
	FunctionName = "StartDeathLoop",
	Args = {
		PresentationFunctionName = _PLUGIN.guid .. "." .. "HubPostModdedCreditsStartPresentation",
		PresentationFunctionArgs = {
			PortraitArgs = {
				PauseMusic = true,
				SecretMusic = "/Music/MusicExploration1_MC",
				PortraitAnimationName = "PortraitFamily",
				FadeInTime = 1.5,
				FadeOutWait = 51,
				PanDuration = 48,
				PortraitGlobalVoiceLines = "StorytellerEndingVoiceLines",
			},
			EndVoiceLines = {
				PreLineWait = 0.6,
				UsePlayerSource = true,
				{ Cue = "/VO/Melinoe_2936", Text = "They were all so happy together, weren't they? And oblivious to the Titan's threat..." },
			}
		},
	},
	GameStateRequirements = {
		{
			PathTrue = { "CurrentRun", "RoomsEntered", "Return06" },
		},
		{
			PathFalse = { "CurrentRun", "UsedStoryReset" },
		},
		{
			PathFalse = { "CurrentHubRoom", },
		},
	},
	BreakIfPlayed = true,
}
table.insert(game.HubRoomData.Hub_Main.OnLoadEvents, 1, endingPortraitOnLoadEvent)
-- #endregion

-- #region Chaos Gate/Run start
table.insert(game.HubRoomData.Hub_PreRun.StartUnthreadedEvents, {
	FunctionName = _PLUGIN.guid .. "." .. "SpawnHadesRunStartDoor",
})

function mod.SpawnHadesRunStartDoor(source, args)
	if not mod.HiddenConfig.IsValidInstallation then
		mod.DebugPrint(
			"The mod installation is invalid due to: " ..
			(mod.HiddenConfig.InstallationFailReason or "UnknownReason") .. ", not spawning the Hades run start door.", 2)
		return false
	end

	-- Run start door for the underworld
	local spawnId = 420947

	local chaosGate = game.DeepCopyTable(game.ObstacleData.SecretDoor) or {}

	chaosGate.ObjectId = SpawnObstacle({
		Name = "ModsNikkelMHadesBiomes_HadesRunStartDoor",
		Group = "FX_Terrain",
		DestinationId = spawnId,
		AttachedTable = chaosGate,
		OffsetX = 800,
		OffsetY = 10,
	})
	chaosGate.ActivateIds = { chaosGate.ObjectId }

	chaosGate.SetupEvents = {
		{
			FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesUpdateEscapeDoorForLimitGraspShrineUpgrade",
		},
	}
	chaosGate.SpeakerName = nil
	chaosGate.DistanceTrigger = {
		GameStateRequirements = {
			NamedRequirementsFalse = { "SurfaceRouteLockedByTyphonKill" },
		},
		WithinDistance = 800,
		VoiceLines = {
			Queue = "Always",
			PlayOnce = true,
			PlayOnceContext = "ModsNikkelMHadesBiomes_HadesRunStartDoorApproach",
			UsePlayerSource = true,
			{ Cue = "/VO/MelinoeField_2868", Text = "A Chaos Gate, up here?", },
		},
	}
	chaosGate.UnlockedSound = nil
	chaosGate.HealthCost = nil
	chaosGate.ExitBlockedVoiceLines = nil
	chaosGate.ExitDoorOpenAnimation = nil
	chaosGate.ModsNikkelMHadesBiomesIsRunStartDoor = true

	chaosGate.UseText = "ModsNikkelMHadesBiomes_HadesRunStartDoorUseText"
	-- Normally this would check if the exit door for a room can be used - we always allow it
	-- Might add a requirement here if we ever put Hades runs behind a requirement/enchantment
	chaosGate.OnUseEvents = {}
	chaosGate.OnUsedFunctionName = _PLUGIN.guid .. "." .. "StartHadesRun"
	chaosGate.OnUsedFunctionArgs = {
		-- TODO: For debugging, change to currently worked on biome
		StartingBiome = "Tartarus",
		-- Don't play a voiceline - we do this when entering the Chaos gate
		-- We have to do it then, as otherwise MelinoeField needs to be loaded in PreThingCreation
		GlobalVoiceLines = "EmptyStartNewHadesRunVoiceLines",
		-- For the DirectionHintPresentation if LimitGraspShrineUpgradeEscapeDoorClosed is active
		AltarId = 589766,
	}
	-- Used by LeaveRoomSecretDoorPresentation to determine the fade animation
	chaosGate.Room = {}

	game.SetupObstacle(chaosGate)
	AddToGroup({ Id = chaosGate.ObjectId, Name = "ModsNikkelMHadesBiomes.RunStartDoor" })
	-- Enable MelinoeField voicelines when entering the Chaos gate
	game.LoadVoiceBanks({ Name = "MelinoeField" })
end

function mod.StartHadesRun(source, args)
	args = args or {}
	-- Don't allow rain in modded runs
	game.GameState.NextBiomeStateName = "VanillaState"

	local useAltDiveAnimation = false
	if (game.GameState.ModsNikkelMHadesBiomesCompletedRunsCache or 0) > 2 and game.RandomChance(0.25) then
		useAltDiveAnimation = true
	end
	mod.StartHadesRunSecretDoorPresentation(source, useAltDiveAnimation)

	game.UseEscapeDoor(source, args)
end

function mod.StartHadesRunSecretDoorPresentation(secretDoor, useAltDiveAnimation)
	game.HideCombatUI("StartHadesRunSecretDoorPresentation")
	AddInputBlock({ Name = "StartHadesRunSecretDoorPresentation" })
	game.ToggleCombatControl({ "AdvancedTooltip" }, false, "LeaveRoom")

	-- preserve audio/VO presentation
	game.CleanupCustomRoomSounds()
	PlaySound({ Name = "/SFX/Menu Sounds/ChaosRoomEnterExit" })
	game.thread(game.PlayVoiceLines, mod.StartNewHadesRunVoiceLines)
	Stop({ Id = game.CurrentRun.Hero.ObjectId })

	local unequipAnimation = game.GetEquippedWeaponValue("UnequipAnimation") or "MelinoeIdleWeaponless"
	SetAnimation({ Name = unequipAnimation, DestinationId = game.CurrentRun.Hero.ObjectId, SpeedMultiplier = 2 })
	game.wait(0.5)
	SetAnimation({ Name = "Melinoe_Witchcraft_Start", DestinationId = game.CurrentRun.Hero.ObjectId, })

	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.7 }, })
	Flash({ Id = game.CurrentRun.Hero.ObjectId, Speed = 0.5, MinFraction = 0, MaxFraction = 1.0, Color = game.Color.White, Duration = 1.0, ExpireAfterCycle = false })
	AdjustColorGrading({ Name = "WeatherSnowCinders", Duration = 0.7 })

	game.wait(0.6)
	AdjustFullscreenBloom({ Name = "NewType09", Duration = 0.1 })
	game.wait(0.2)

	SetAnimation({ Name = "Melinoe_Witchcraft_End", DestinationId = game.CurrentRun.Hero.ObjectId, })
	AdjustFullscreenBloom({ Name = "Off", Duration = 0.3 })
	PlaySound({ Name = "/Leftovers/SFX/PlayerRespawn" })

	-- She goes through the Oceanus-style sequence of jumping up and in
	PanCamera({ Id = secretDoor.ObjectId, Duration = 1.1, OffsetY = -50, EaseOut = 0 })
	game.wait(0.5)
	if useAltDiveAnimation then
		SetAnimation({ Name = "Melinoe_DiveExit_Portal_Start", DestinationId = game.CurrentRun.Hero.ObjectId, SpeedMultiplier = 0.75 })
	else
		SetAnimation({ Name = "Melinoe_Drop_Exit_Start", DestinationId = game.CurrentRun.Hero.ObjectId, SpeedMultiplier = 0.5 })
	end
	AdjustColorGrading({ Name = "RainSubtle", Duration = 0.4 })
	if useAltDiveAnimation then
		game.wait(0.53)
		PlaySound({ Name = "/Leftovers/SFX/PlayerJumpMedium" })
	else
		game.wait(0.35)
	end

	PlaySound({ Name = "/VO/MelinoeEmotes/EmoteEvading" })
	local args = {}
	args.SuccessDistance = 20
	args.DisableCollision = true
	local exitPath = {}
	table.insert(exitPath, secretDoor.ObjectId)
	game.thread(game.MoveHeroAlongPath, exitPath, args)

	game.wait(0.2)
	PanCamera({ Id = secretDoor.ObjectId, Duration = 1.2, OffsetY = 85, Retarget = true })
	game.thread(game.DoRumble, { { ScreenPreWait = 0.02, Fraction = 0.15, Duration = 0.25 }, })
	if not useAltDiveAnimation then
		game.thread(game.SlightDescent)
	end

	-- Custom wait amount
	game.wait(0.2)
	game.FullScreenFadeOutAnimation("ModsNikkelMHadesBiomesRoomTransitionIn")

	game.WaitForSpeechFinished()

	RemoveInputBlock({ Name = "StartHadesRunSecretDoorPresentation" })
	game.ToggleCombatControl({ "AdvancedTooltip" }, true, "LeaveRoom")
end

-- #endregion

-- #region Skelly Statues
mod.StatueDefinitions = {
	{
		-- Bronze/GoalShrinePointClear = 8
		DrapedName = "ModsNikkelMHadesBiomes_HouseStatueDraped01",
		UnveiledName = "ModsNikkelMHadesBiomes_HouseStatueSkelly01",
		OffsetX = -240,
		OffsetY = -2050,
		FlipHorizontal = false,
		HSV = { 0.55, 0, 0.15 },
		UnveiledScale = 0.44,
		ConversationName = "ModsNikkelMHadesBiomes_HadesStatueUnveil01",
	},
	{
		-- Silver/GoalShrinePointClear = 16
		DrapedName = "ModsNikkelMHadesBiomes_HouseStatueDraped01",
		UnveiledName = "ModsNikkelMHadesBiomes_HouseStatueSkelly02",
		OffsetX = -70,
		OffsetY = -2160,
		FlipHorizontal = true,
		HSV = { 0.7, 0, 0 },
		UnveiledScale = 0.44,
		ConversationName = "ModsNikkelMHadesBiomes_HadesStatueUnveil02",
	},
	{
		-- Gold/GoalShrinePointClear = 32
		DrapedName = "ModsNikkelMHadesBiomes_HouseStatueDraped01",
		UnveiledName = "ModsNikkelMHadesBiomes_HouseStatueSkelly04",
		OffsetX = 150,
		OffsetY = -2130,
		FlipHorizontal = false,
		HSV = nil,
		UnveiledScale = 0.44,
		ConversationName = "ModsNikkelMHadesBiomes_HadesStatueUnveil03",
	},
}

function mod.GetNumUnlockedHadesStatues()
	if game.GameState.TextLinesRecord["ModsNikkelMHadesBiomes_HadesStatueUnveil03"] then
		return 3
	elseif game.GameState.TextLinesRecord["ModsNikkelMHadesBiomes_HadesStatueUnveil02"] then
		return 2
	elseif game.GameState.TextLinesRecord["ModsNikkelMHadesBiomes_HadesStatueUnveil01"] then
		return 1
	end
	return 0
end

function mod.ShouldShowHadesStatues()
	-- Already introduced - always show
	if game.GameState.TextLinesRecord["ModsNikkelMHadesBiomes_HadesStatueIntro01"] then
		return true
	end
	-- Vanilla trophy quest must already be unlocked (player knows the concept)
	if not game.GameState.TextLinesRecord["SkellyAboutTrophyQuest01"] then
		return false
	end
	-- Player must have completed enough modded runs
	if (game.GameState.ModsNikkelMHadesBiomesClearedRunsCache or 0) < 3 then
		return false
	end
	return true
end

-- Force spawning Skelly if one of the Statue conversations would be queued
for _, event in ipairs(game.HubRoomData.Hub_PreRun.StartUnthreadedEvents) do
	if event.FunctionName == "CheckPriorityConversations" and event.Args and event.Args.Conversations then
		local conversations = event.Args.Conversations
		for i, conversationName in ipairs(conversations) do
			if conversationName == "TrophyQuestComplete03" then
				table.insert(conversations, i + 1, "ModsNikkelMHadesBiomes_HadesStatueUnveil03")
				table.insert(conversations, i + 1, "ModsNikkelMHadesBiomes_HadesStatueUnveil02")
				table.insert(conversations, i + 1, "ModsNikkelMHadesBiomes_HadesStatueUnveil01")
				table.insert(conversations, i + 1, "ModsNikkelMHadesBiomes_HadesStatueIntro01")
				break
			end
		end
		break
	end
end

table.insert(game.HubRoomData.Hub_PreRun.StartUnthreadedEvents, {
	FunctionName = _PLUGIN.guid .. "." .. "SpawnHadesSkellyStatues",
})

function mod.SpawnHadesSkellyStatues(source, args)
	if not mod.HiddenConfig.IsValidInstallation then
		mod.DebugPrint(
			"The mod installation is invalid due to: " ..
			(mod.HiddenConfig.InstallationFailReason or "UnknownReason") .. ", not spawning the Skelly statues.", 2)
		return false
	end

	-- Move the Mana Fountain to make space for the statues
	-- Always do this, even if the statues aren't unlocked yet, to prevent confusion when it would suddenly move otherwise
	local manaFountainId = GetIdsByType({ Name = "ManaFountain" })[1]
	if manaFountainId ~= nil and manaFountainId ~= 0 then
		Teleport({ Id = manaFountainId, DestinationId = manaFountainId, OffsetX = 840, OffsetY = -50 })
	end

	if not mod.ShouldShowHadesStatues() then
		return
	end

	-- Check if the Sisyphus and ZagreusField voicebanks should be loaded
	local skellyId = GetIdsByType({ Name = "NPC_Skelly_01" })[1]
	if skellyId ~= nil then
		local skelly = game.ActiveEnemies[skellyId]
		if skelly and skelly.NextInteractLines and game.Contains(mod.SkellyStatueConversations, skelly.NextInteractLines.Name) then
			game.LoadVoiceBanks({ "Sisyphus", "ZagreusField" })
		end
	end

	-- Run start door for the underworld
	local spawnId = 420947
	local numUnlocked = mod.GetNumUnlockedHadesStatues()

	-- Store references for interaction and unveil presentation
	mod.HadesStatueObstacles = {}

	for i, statueDefinition in ipairs(mod.StatueDefinitions) do
		local isUnlocked = (i <= numUnlocked)
		local obstacleName = isUnlocked and statueDefinition.UnveiledName or statueDefinition.DrapedName
		local obstacle = {}

		obstacle.ObjectId = SpawnObstacle({
			Name = obstacleName,
			Group = "Standing",
			AttachedTable = statueDefinition,
			DestinationId = spawnId,
			OffsetX = statueDefinition.OffsetX,
			OffsetY = statueDefinition.OffsetY,
		})
		obstacle.ActivateIds = { obstacle.ObjectId }

		if isUnlocked then
			SetScale({ Id = obstacle.ObjectId, Fraction = statueDefinition.UnveiledScale })
			obstacle.UseText = "UseSkellyStatue"
		else
			if statueDefinition.HSV ~= nil then
				SetHSV({ Id = obstacle.ObjectId, HSV = statueDefinition.HSV, ValueChangeType = "Absolute" })
			end
			obstacle.UseText = "UseLockedSkellyStatue"
		end

		obstacle.InteractDistance = 300
		obstacle.OnUsedFunctionName = _PLUGIN.guid .. "." .. "SkellyStatueAdmire"
		obstacle.ExclusiveOnHitFunctionName = "StatueHitPresentation"
		obstacle.ExclusiveOnHitFunctionArgs = {}

		if statueDefinition.FlipHorizontal then
			FlipHorizontal({ Id = obstacle.ObjectId })
		end

		game.SetupObstacle(obstacle)
		mod.HadesStatueObstacles[i] = obstacle
	end
end

function mod.SkellyStatueAdmire(source, args)
	-- Disable interaction on all modded statues during admire
	local allStatueIds = {}
	for _, obstacle in ipairs(mod.HadesStatueObstacles) do
		table.insert(allStatueIds, obstacle.ObjectId)
	end

	UseableOff({ Ids = allStatueIds })
	AddInputBlock({ Name = "AdmiringStatue" })
	game.FreezePlayerUnit("AdmiringStatue")
	AngleTowardTarget({ Id = game.CurrentRun.Hero.ObjectId, DestinationId = source.ObjectId })

	if source.UseText == "UseSkellyStatue" then
		game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ModsNikkelMHadesBiomes_TrophyAdmirationVoiceLines, true)
	else
		game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ModsNikkelMHadesBiomes_TrophyLockedVoiceLines, true)
	end

	local unequipAnimation = game.GetEquippedWeaponValue("UnequipAnimation") or "MelinoeIdleWeaponless"
	SetAnimation({ Name = unequipAnimation, DestinationId = game.CurrentRun.Hero.ObjectId })
	game.wait(0.6)
	SetAnimation({ Name = "MelTalkPensive01", DestinationId = game.CurrentRun.Hero.ObjectId })
	game.wait(2.0)
	SetAnimation({ Name = "MelTalkPensive01ReturnToIdle", DestinationId = game.CurrentRun.Hero.ObjectId })

	game.UnfreezePlayerUnit("AdmiringStatue")
	RemoveInputBlock({ Name = "AdmiringStatue" })

	game.wait(8.0, game.RoomThreadName)
	UseableOn({ Ids = allStatueIds })
end

-- Insert after last vanilla trophy quest voiceline so they always play first
local skellyPriorities = game.NarrativeData.NPC_Skelly_01.InteractTextLinePriorities
for i, entry in ipairs(skellyPriorities) do
	if entry == "SkellyAboutTrophyQuest03" then
		-- Insert in reverse order so they end up: Intro → Unveil01 → Unveil02 → Unveil03
		table.insert(skellyPriorities, i + 1, "ModsNikkelMHadesBiomes_HadesStatueUnveil03")
		table.insert(skellyPriorities, i + 1, "ModsNikkelMHadesBiomes_HadesStatueUnveil02")
		table.insert(skellyPriorities, i + 1, "ModsNikkelMHadesBiomes_HadesStatueUnveil01")
		table.insert(skellyPriorities, i + 1, "ModsNikkelMHadesBiomes_HadesStatueIntro01")
		break
	end
end

game.EnemyData.NPC_Skelly_01.InteractTextLineSets = game.EnemyData.NPC_Skelly_01.InteractTextLineSets or {}
-- Manually renamed ZagreusHome_ to ZagreusField_0 and Skelly_ to Sisyphus_0
game.EnemyData.NPC_Skelly_01.InteractTextLineSets.ModsNikkelMHadesBiomes_HadesStatueIntro01 = {
	Name = "ModsNikkelMHadesBiomes_HadesStatueIntro01",
	PlayOnce = true,
	UseableOffSource = true,
	StatusAnimation = "StatusIconWantsToTalkImportant_Skelly",
	GameStateRequirements = {
		-- Vanilla trophy quest must already be unlocked
		{
			PathTrue = { "GameState", "TextLinesRecord", "SkellyAboutTrophyQuest01" },
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
			Comparison = ">=",
			Value = 3,
		},
	},
	{
		Cue = "/VO/Sisyphus_00178",
		PreLineAnim = "Skelly_Explaining",
		Text =
		"I'll level with you, pal. You have impressed somebody well above my pay grade here, and so... they have a little proposition for you, you listening?"
	},
	{
		Cue = "/VO/ZagreusField_01054",
		Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Defiant_01",
		Speaker = "CharProtag",
		UsePlayerSource = true,
		PreLineAnim = "MelTalkExplaining01",
		PreLineAnimTarget = "Hero",
		PostLineAnim = "MelinoeIdleWeaponless",
		PostLineAnimTarget = "Hero",
		Text =
		"Let me guess... they want me to fight all the way through the Underworld, having used the Pact of Punishment over there to make the going even more treacherous than it already is, and if I succeed, they'll reward me with some sort of useless trinket?"
	},
	{
		Cue = "/VO/Sisyphus_00179",
		PreLineAnim = "Skelly_Babbling",
		Text =
		"Wrong! We're talking something really big, here, pal, you see that thing back there? Trinket. Come on, what are you, scared?"
	},
}

game.EnemyData.NPC_Skelly_01.InteractTextLineSets.ModsNikkelMHadesBiomes_HadesStatueUnveil01 = {
	Name = "ModsNikkelMHadesBiomes_HadesStatueUnveil01",
	PlayOnce = true,
	UseableOffSource = true,
	StatusAnimation = "StatusIconWantsToTalkImportant_Skelly",
	GameStateRequirements = {
		{
			PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueIntro01" },
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
			Comparison = ">=",
			-- Threshold value must match game.ScreenData.Shrine.ModsNikkelMHadesBiomesShrinePointThresholds[1]
			Value = 8,
		},
	},
	{
		Cue = "/VO/Sisyphus_00183",
		PreLineAnim = "Skelly_Explaining",
		PreLineFunctionName = _PLUGIN.guid .. "." .. "HadesStatueUnveilPresentation",
		PreLineFunctionArgs = {
			StatueIndex = 1,
			Subtitle = "ModsNikkelMHadesBiomes_HadesStatue_Unlocked_Subtitle_01",
			AnimationNames = { "StatusIconOhBoy", "StatusIconEmbarrassed" },
			ReactionChance = 0.25,
			Delay = 1.01,
		},
		Text =
		"I just knew you had it in you, pal, enjoying your new prize? Pact of Punishment, {#DialogueItalicFormat}Shmact {#Prev}of Punishment, no problem, know what I mean? 'Course, that was just the easy one you got there, pretty sure I could've got that one, myself."
	},
	{
		Cue = "/VO/ZagreusField_00678",
		Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Defiant_01",
		PreLineAnim = "MelTalkExplaining01",
		PreLineAnimTarget = "Hero",
		PostLineAnim = "MelinoeIdleWeaponless",
		PostLineAnimTarget = "Hero",
		Speaker = "CharProtag",
		UsePlayerSource = true,
		Text =
		"Wait, just so I understand. I literally toiled through hell and back, and my reward is just... a statue of you? Don't get me wrong, it's lovely, it's just... I don't know what I expected."
	},
	{
		Cue = "/VO/Sisyphus_00184",
		PreLineAnim = "Skelly_Babbling",
		Text =
		"Look, boyo, there was a little mix-up when we put in the request for that thing, see? I told 'em to make something that'll make me look good with my sources, and anyway that's how it all turned out. The other ones turned out much better, though, you'll see!"
	},
}

game.EnemyData.NPC_Skelly_01.InteractTextLineSets.ModsNikkelMHadesBiomes_HadesStatueUnveil02 = {
	Name = "ModsNikkelMHadesBiomes_HadesStatueUnveil02",
	PlayOnce = true,
	UseableOffSource = true,
	StatusAnimation = "StatusIconWantsToTalkImportant_Skelly",
	GameStateRequirements = {
		{
			PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueUnveil01" },
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
			Comparison = ">=",
			-- Threshold value must match game.ScreenData.Shrine.ModsNikkelMHadesBiomesShrinePointThresholds[2]
			Value = 16,
		},
	},
	{
		Cue = "/VO/ZagreusField_00681",
		Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Defiant_01",
		Speaker = "CharProtag",
		PreLineAnim = "MelTalkBrooding01",
		PreLineAnimTarget = "Hero",
		PostLineAnim = "MelinoeIdleWeaponless",
		PostLineAnimTarget = "Hero",
		UsePlayerSource = true,
		PreLineFunctionName = _PLUGIN.guid .. "." .. "HadesStatueUnveilPresentation",
		PreLineFunctionArgs = {
			StatueIndex = 2,
			Subtitle = "ModsNikkelMHadesBiomes_HadesStatue_Unlocked_Subtitle_02",
			AnimationNames = { "StatusIconOhBoy", "StatusIconFiredUp" },
			ReactionChance = 0.30,
			Delay = 1.01
		},
		Text =
		"Skelly, let me ask you something. Did you really commission three nearly-identical statues of yourself to goad me into using the Pact of Punishment?"
	},
	{
		Cue = "/VO/Sisyphus_00188",
		PreLineAnim = "Skelly_Babbling",
		Emote = "PortraitEmoteFiredUp",
		Text =
		"I am offended, pal! You haven't even seen the third one yet, so how can you insinuate a thing like that?! Maybe I was wrong about you. I thought you really were the one!"
	},
	{
		Cue = "/VO/ZagreusField_00682",
		Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Defiant_01",
		Speaker = "CharProtag",
		UsePlayerSource = true,
		PreLineAnim = "MelTalkPensive01",
		PreLineAnimTarget = "Hero",
		PostLineAnim = "MelinoeIdleWeaponless",
		PostLineAnimTarget = "Hero",
		Text =
		"You're only saying that to get me to apologize and try and unlock the last of your three identical statues, aren't you."
	},
	{
		Cue = "/VO/Sisyphus_00189",
		PreLineAnim = "Skelly_Explaining",
		Emote = "PortraitEmoteFiredUp",
		Text =
		"{#DialogueItalicFormat}How could you{#Prev}--? I would return those statues for a full refund right here and now, if I could move! And if there was a refund policy on them."
	},
}

game.EnemyData.NPC_Skelly_01.InteractTextLineSets.ModsNikkelMHadesBiomes_HadesStatueUnveil03 = {
	Name = "ModsNikkelMHadesBiomes_HadesStatueUnveil03",
	PlayOnce = true,
	UseableOffSource = true,
	StatusAnimation = "StatusIconWantsToTalkImportant_Skelly",
	GameStateRequirements = {
		{
			PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueUnveil02" },
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
			Comparison = ">=",
			-- Threshold value must match game.ScreenData.Shrine.ModsNikkelMHadesBiomesShrinePointThresholds[3]
			Value = 32,
		},
	},
	{
		Cue = "/VO/Sisyphus_00193",
		PreLineAnim = "Skelly_Babbling",
		PreLineFunctionName = _PLUGIN.guid .. "." .. "HadesStatueUnveilPresentation",
		PreLineFunctionArgs = {
			StatueIndex = 3,
			Subtitle = "ModsNikkelMHadesBiomes_HadesStatue_Unlocked_Subtitle_03",
			AnimationNames = { "StatusIconFiredUp", "StatusIconFear", "StatusIconEmbarrassed" },
			ReactionChance = 0.35,
			Delay = 1.01
		},
		Text =
		"Look I'm sorry I messed up your statues, boyo. Really. When I saw them, I just kind of freaked. But then I figured there's no way he's going to see how they turned out, so, I just rolled with it, you know?"
	},
	{
		Cue = "/VO/ZagreusField_00686",
		Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
		PreLineAnim = "MelTalkPensive01",
		PreLineAnimTarget = "Hero",
		PostLineAnim = "MelinoeIdleWeaponless",
		PostLineAnimTarget = "Hero",
		Speaker = "CharProtag",
		UsePlayerSource = true,
		Text =
		"You shouldn't have underestimated me, mate. But... I shouldn't have said such awful things about your statues. You must have really gone out of your way to get them here."
	},
	{
		Cue = "/VO/Sisyphus_00194",
		PreLineAnim = "Skelly_Explaining",
		Text =
		"Oh you better believe it, pal! So how about we call it even. We've been through a lot. Both of us! Really learned from this experience, and now, we share a deeper understanding, yeah?"
	},
}

function mod.HadesStatueUnveilPresentation(source, args)
	AddInputBlock({ Name = "HadesStatueUnveil" })

	local statueIndex = args.StatueIndex
	local obstacle = mod.HadesStatueObstacles[statueIndex]
	if obstacle == nil then
		RemoveInputBlock({ Name = "HadesStatueUnveil" })
		return
	end

	local statueDefinition = mod.StatueDefinitions[statueIndex]
	if statueDefinition == nil then
		RemoveInputBlock({ Name = "HadesStatueUnveil" })
		return
	end

	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ModsNikkelMHadesBiomes_TrophyUnlockedVoiceLines, true, source)
	game.wait(1.0)
	LockCamera({ Id = obstacle.ObjectId, OffsetY = -300, Duration = 1.0, EaseIn = 1.0 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
	game.wait(1.7)

	-- Fade out, swap draped for unveiled behind the fade
	game.FullScreenFadeOutAnimation()
	game.wait(0.5)
	SetAnimation({ DestinationId = game.ScreenAnchors.DialogueBackgroundId, Name = "DialogueBackgroundOut" })

	SetAlpha({ Id = obstacle.ObjectId, Fraction = 0.0, Duration = 1.0 })
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement" })
	PlaySound({ Name = "/Leftovers/Menu Sounds/RobesInteract", Id = obstacle.ObjectId })
	game.wait(0.3)
	Destroy({ Id = game.ScreenAnchors.DialogueBackgroundId })

	-- Destroy the draped obstacle and spawn the unveiled version
	Destroy({ Id = obstacle.ObjectId })

	local spawnId = 420947
	local newObstacle = {}
	newObstacle.ObjectId = SpawnObstacle({
		Name = statueDefinition.UnveiledName,
		Group = "Standing",
		DestinationId = spawnId,
		OffsetX = statueDefinition.OffsetX,
		OffsetY = statueDefinition.OffsetY,
	})
	newObstacle.ActivateIds = { newObstacle.ObjectId }
	SetScale({ Id = newObstacle.ObjectId, Fraction = statueDefinition.UnveiledScale })
	if statueDefinition.FlipHorizontal then
		FlipHorizontal({ Id = newObstacle.ObjectId })
	end

	newObstacle.UseText = "UseSkellyStatue"
	newObstacle.InteractDistance = 300
	newObstacle.OnUsedFunctionName = _PLUGIN.guid .. "." .. "SkellyStatueAdmire"
	newObstacle.ExclusiveOnHitFunctionName = "StatueHitPresentation"
	newObstacle.ExclusiveOnHitFunctionArgs = {}
	game.SetupObstacle(newObstacle)
	mod.HadesStatueObstacles[statueIndex] = newObstacle

	PlaySound({ Name = "/Leftovers/SFX/RobeFlutter", Id = newObstacle.ObjectId })
	game.wait(0.2)
	PlaySound({ Name = "/Leftovers/SFX/RobeFlutter", Id = newObstacle.ObjectId })
	game.wait(3.0)
	PlaySound({ Name = "/SFX/Menu Sounds/HadesTextDisappearFade" })
	game.FullScreenFadeInAnimation()
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAffection" })

	game.thread(game.CrowdReactionPresentationEventSource, source, args)

	game.wait(0.5)

	-- Subtitle banner (matches vanilla SkellyStatueUnveil pattern)
	game.DisplayInfoBanner(nil, {
		Text = "SkellyStatue_Unlocked",
		SubtitleText = args.Subtitle,
		Delay = 0.75,
		TextColor = game.Color.Turquoise,
		Layer = "Overlay",
		FontScale = 0.9,
		AnimationName = "LocationBackingIrisGenericIn",
		AnimationOutName = "LocationBackingIrisGenericOut",
		Duration = 3.95
	})
	game.CreateDialogueBackground()

	-- Return camera to hero
	LockCamera({ Id = game.CurrentRun.Hero.ObjectId, Duration = 1.0, EaseIn = 1.0 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
	game.wait(1.0)
	RemoveInputBlock({ Name = "HadesStatueUnveil" })
end

local hubPreRunThreadedEvents = game.HubRoomData.Hub_PreRun.ThreadedEvents
table.insert(hubPreRunThreadedEvents, #hubPreRunThreadedEvents, {
	BreakIfPlayed = true,
	FunctionName = _PLUGIN.guid .. "." .. "HadesTrophyQuestUnlockedFirstPresentation",
	Args = {},
	GameStateRequirements = {
		{
			PathTrue = { "GameState", "TextLinesRecord", "SkellyAboutTrophyQuest01" },
		},
		{
			Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
			Comparison = ">=",
			Value = 3,
		},
		{
			PathFalse = { "GameState", "ModsNikkelMHadesBiomesCustomFlags", "ModsNikkelMHadesBiomes_HadesTrophyQuestFirstUnlockedPresentation" },
		},
	},
})

function mod.HadesTrophyQuestUnlockedFirstPresentation(room, args)
	game.wait(1.0)
	local trophyId = GetIdsByType({ Name = "ModsNikkelMHadesBiomes_HouseStatueDraped01" })[1]
	AddInputBlock({ Name = "HadesTrophyQuestUnlockedFirstPresentation" })
	game.HideCombatUI("HadesTrophyQuestUnlockedFirstPresentation")
	ClearCameraClamp({ LerpTime = 1.35 })
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ModsNikkelMHadesBiomes_TrophyQuestUnlockedVoiceLines, true)

	game.CutsceneAddLetterbox()

	game.wait(1.35)

	PanCamera({ Id = trophyId, Duration = 2.8, EaseIn = 0, EaseOut = 0.5 })
	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
	PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitement", Delay = 2.4 })

	game.wait(4.6)

	PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh" })
	PanCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 2.2 })

	game.wait(0.5)

	RemoveInputBlock({ Name = "HadesTrophyQuestUnlockedFirstPresentation" })
	game.ShowCombatUI("HadesTrophyQuestUnlockedFirstPresentation")

	Move({ Id = game.ScreenAnchors.LetterBoxTop, Angle = 90, Distance = 150, EaseIn = 0.99, EaseOut = 1.0, Duration = 1.15 })
	Move({ Id = game.ScreenAnchors.LetterBoxBottom, Angle = 270, Distance = 150, EaseIn = 0.99, EaseOut = 1.0, Duration = 1.15 })

	game.GameState.ModsNikkelMHadesBiomesCustomFlags.ModsNikkelMHadesBiomes_HadesTrophyQuestFirstUnlockedPresentation = true

	game.thread(mod.HadesTrophyQuestReturnPresentationEnd)
end

function mod.HadesTrophyQuestReturnPresentationEnd()
	game.wait(0.85)
	local cameraClamps = game.CurrentHubRoom.CameraClamps or game.GetDefaultClampIds()
	SetCameraClamp({ Ids = cameraClamps, SoftClamp = game.CurrentHubRoom.SoftClamp })
	SetAlpha({ Ids = { game.ScreenAnchors.LetterBoxTop, game.ScreenAnchors.LetterBoxBottom }, Fraction = 0, Duration = 0.4 })
	game.ShowCombatUI()
end

-- #endregion
