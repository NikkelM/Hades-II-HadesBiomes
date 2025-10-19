-- For these, make the modifications directly here, as larger changes are often needed
mod.PresetEventArgs = mod.PresetEventArgs or {
	PatroclusMuttering = {
		StatusAnimation = "StatusIconWantsToTalk",
		DistanceTrigger =
		{
			WithinDistance = 450,
			VoiceLines = { GlobalVoiceLines = "PatroclusGreetingLines" }, --game.GlobalVoiceLines.PatroclusGreetingLines,
		},
		VoiceLines =
		{
			[1] = { GlobalVoiceLines = "PatroclusMutteringLines" }, --game.GlobalVoiceLines.PatroclusMutteringLines,
		},
	},
	PatroclusMutteringRepeatable = {
		DistanceTrigger =
		{
			WithinDistance = 450,
			VoiceLines = game.GlobalVoiceLines.PatroclusGreetingLines,
		},
		VoiceLines =
		{
			[1] = game.GlobalVoiceLines.PatroclusMutteringLines,
		},
	},
	PatroclusGreetings = {
		DistanceTrigger =
		{
			WithinDistance = 350,
			VoiceLines =
			{
				RandomRemaining = true,
				Queue = "Interrupt",
				CooldownTime = "30",
				CooldownName = "PatroclusGreetedRecently",
				SuccessiveChanceToPlay = 0.5,

				-- What is it?
				{ Cue = "/VO/Patroclus_0043" },
				-- What is it, stranger.
				{ Cue = "/VO/Patroclus_0044" },
				-- Stranger...
				{ Cue = "/VO/Patroclus_0080", RequiredTextLines = { "PatroclusGift03" }, },
				-- You.
				{ Cue = "/VO/Patroclus_0082", RequiredTextLines = { "PatroclusGift03" }, },
				-- You again.
				{ Cue = "/VO/Patroclus_0083", RequiredTextLines = { "PatroclusGift03" }, },
				-- You're back.
				{ Cue = "/VO/Patroclus_0085" },
				-- Oh.
				{ Cue = "/VO/Patroclus_0087", RequiredFalseTextLines = { "PatroclusGift03" }, },
			},
		},
	},
	-- ThanatosFarewells = {
	-- 	PostTriggerFunctionName = "ThanatosExit",
	-- 	PostTriggerFunctionArgs = { WaitTime = 4 },
	-- 	WithinDistance = 750,
	-- 	PreTriggerAnimation = "ThanatosTalkDismissal_Start",
	-- 	VoiceLines =
	-- 	{
	-- 		BreakIfPlayed = true,
	-- 		RandomRemaining = true,
	-- 		SuccessiveChanceToPlay = 0.9,
	-- 		PreLineWait = 0.75,
	-- 		Queue = "Always",

	-- 		-- It's clear. Go.
	-- 		{ Cue = "/VO/Thanatos_0051" },
	-- 		-- I have to get back.
	-- 		{ Cue = "/VO/Thanatos_0052" },
	-- 		-- Go on.
	-- 		{ Cue = "/VO/Thanatos_0053" },
	-- 		-- Keep going.
	-- 		{ Cue = "/VO/Thanatos_0054",      RequiredTextLines = { "ThanatosFieldBuildingTrust01" } },
	-- 		-- Keep fighting.
	-- 		{ Cue = "/VO/Thanatos_0055",      RequiredTextLines = { "ThanatosFieldBuildingTrust01" } },
	-- 		-- Nice running into you.
	-- 		{ Cue = "/VO/Thanatos_0056",      RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" } },
	-- 		-- Take care, Zagreus.
	-- 		{ Cue = "/VO/Thanatos_0057",      RequiredTextLines = { "ThanatosGift08" } },
	-- 		-- I'm going.
	-- 		{ Cue = "/VO/Thanatos_0058" },
	-- 		-- That's that.
	-- 		{ Cue = "/VO/Thanatos_0059" },
	-- 		-- Be seeing you.
	-- 		{ Cue = "/VO/Thanatos_0060",      RequiredTextLines = { "ThanatosGift05" } },
	-- 		-- I've got to go.
	-- 		{ Cue = "/VO/Thanatos_0061",      RequiredTextLines = { "ThanatosGift05" } },
	-- 		-- See you.
	-- 		{ Cue = "/VO/Thanatos_0062",      RequiredTextLines = { "ThanatosGift06" } },
	-- 		-- Not a word of this.
	-- 		{ Cue = "/VO/Thanatos_0063" },
	-- 		-- Let's keep this between us.
	-- 		{ Cue = "/VO/Thanatos_0064",      RequiredTextLines = { "ThanatosGift06" } },
	-- 		-- You had your hands full.
	-- 		{ Cue = "/VO/Thanatos_0065" },
	-- 		-- You're welcome. Go.
	-- 		{ Cue = "/VO/Thanatos_0066",      RequiredFalseTextLines = { "ThanatosGift10" } },
	-- 		-- Should be clear.
	-- 		{ Cue = "/VO/Thanatos_0067",      RequiredTextLines = { "ThanatosGift01" } },
	-- 		-- You never saw me.
	-- 		{ Cue = "/VO/Thanatos_0068" },
	-- 		-- Don't die, Zag.
	-- 		{ Cue = "/VO/Thanatos_0069",      RequiredTextLines = { "ThanatosGift08" } },
	-- 		-- Stay alive.
	-- 		{ Cue = "/VO/Thanatos_0070",      RequiredTextLines = { "ThanatosGift07_A" } },
	-- 		-- Bye, Zag.
	-- 		{ Cue = "/VO/ThanatosField_0236", RequiredTextLines = { "ThanatosGift10" }, },
	-- 		-- I'm off.
	-- 		{ Cue = "/VO/ThanatosField_0237", RequiredTextLines = { "ThanatosGift06" }, },
	-- 		-- Well, I'm off.
	-- 		{ Cue = "/VO/ThanatosField_0238" },
	-- 		-- Pleasure doing business.
	-- 		{ Cue = "/VO/ThanatosField_0239", RequiredTextLines = { "ThanatosGift10" }, },
	-- 		-- I should be getting back.
	-- 		{ Cue = "/VO/ThanatosField_0240", RequiredTextLines = { "ThanatosGift08" }, },
	-- 		-- You have this.
	-- 		{ Cue = "/VO/ThanatosField_0241", RequiredTextLines = { "ThanatosGift09" }, },
	-- 		-- See you at home.
	-- 		{ Cue = "/VO/ThanatosField_0242", RequiredTextLines = { "ThanatosGift10" }, },
	-- 		-- On to my next one.
	-- 		{ Cue = "/VO/ThanatosField_0243", RequiredAnyTextLines = { "ThanatosGift04", "ThanatosGift04_B" }, },
	-- 		-- Ungh, I'm late.
	-- 		{ Cue = "/VO/ThanatosField_0244", RequiredTextLines = { "ThanatosGift03" }, },
	-- 		-- I'm gone.
	-- 		{ Cue = "/VO/ThanatosField_0245" },
	-- 		-- Till next time.
	-- 		{ Cue = "/VO/ThanatosField_0180", RequiredAnyTextLines = { "ThanatosGift09" } },
	-- 		-- We should do this again.
	-- 		{ Cue = "/VO/ThanatosField_0181", RequiredTextLines = { "ThanatosGift10" } },
	-- 		-- You have this.
	-- 		{ Cue = "/VO/ThanatosField_0182", RequiredAnyTextLines = { "ThanatosGift10" } },
	-- 		-- Till we meet again.
	-- 		{ Cue = "/VO/ThanatosField_0183", RequiredAnyTextLines = { "ThanatosGift09" } },
	-- 		-- That takes care of that, I guess. See you.
	-- 		{ Cue = "/VO/ThanatosField_0184", RequiredAnyTextLines = { "ThanatosGift10" } },
	-- 	},
	-- },
	-- PersephoneGardenFirstGreeting = {
	-- 	WithinDistance = 1200,
	-- 	StatusAnimation = "StatusIconWantsToTalk",
	-- 	-- PostTriggerAngleTowardTarget = true,
	-- 	VoiceLines =
	-- 	{
	-- 		{
	-- 			-- PreLineAnim = "SisyphusIdleGreeting",

	-- 			-- Who's there?
	-- 			{ Cue = "/VO/Persephone_0019" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.5,
	-- 			UsePlayerSource = true,

	-- 			-- Um... hello...?
	-- 			{ Cue = "/VO/ZagreusField_3600" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.5,
	-- 			BreakIfPlayed = true,

	-- 			-- Hello, indeed!
	-- 			{ Cue = "/VO/Persephone_0327" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.3,
	-- 			UsePlayerSource = true,

	-- 			-- Wait, can, can we just...?
	-- 			{ Cue = "/VO/ZagreusField_3601" },
	-- 		},
	-- 	},
	-- },
	-- PersephoneGardenGreeting = {
	-- 	WithinDistance = 1250,
	-- 	-- PostTriggerAngleTowardTarget = true,
	-- 	VoiceLines =
	-- 	{
	-- 		RequiredTextLines = { "PersephoneFirstMeeting" },
	-- 		{
	-- 			RequiredQueuedTextLines = "PersephoneMeeting07",
	-- 			PreLineAnim = "PersephoneGarden_Vulnerable",
	-- 			ObjectType = "NPC_Persephone_01",

	-- 			-- Zagreus...
	-- 			{ Cue = "/VO/Persephone_0031" },
	-- 		},
	-- 		{
	-- 			{
	-- 				RequiredQueuedTextLines = "PersephoneMeeting08",
	-- 				PreLineAnim = "PersephoneGarden_Vulnerable",
	-- 				ObjectType = "NPC_Persephone_01",

	-- 				-- You're back...?
	-- 				{ Cue = "/VO/Persephone_0034" },
	-- 			},
	-- 			{
	-- 				RequiredQueuedTextLines = "PersephoneMeeting08",
	-- 				PreLineWait = 0.5,
	-- 				UsePlayerSource = true,
	-- 				BreakIfPlayed = true,

	-- 				-- Mother!
	-- 				{ Cue = "/VO/ZagreusField_3612" },
	-- 			},
	-- 		},
	-- 		{
	-- 			RequiredFalseQueuedTextLines = { "PersephoneMeeting07", "PersephoneMeeting08" },
	-- 			PreLineAnim = "PersephoneGarden_Greeting",
	-- 			ObjectType = "NPC_Persephone_01",
	-- 			RandomRemaining = true,

	-- 			-- Zagreus!
	-- 			{ Cue = "/VO/Persephone_0030", RequiredFalseQueuedTextLines = { "PersephoneMeeting06", "PersephoneMeeting07" } },
	-- 			-- Zagreus?
	-- 			{ Cue = "/VO/Persephone_0032", RequiredFalseQueuedTextLines = { "PersephoneMeeting06", "PersephoneMeeting07" } },
	-- 			-- You're back!
	-- 			{ Cue = "/VO/Persephone_0033" },
	-- 			-- Ah, you're back.
	-- 			{ Cue = "/VO/Persephone_0035" },
	-- 			-- My son!
	-- 			{ Cue = "/VO/Persephone_0036" },
	-- 			-- Is that you, Zagreus?
	-- 			{ Cue = "/VO/Persephone_0037", RequiredFalseQueuedTextLines = { "PersephoneMeeting06", "PersephoneMeeting07" } },
	-- 			-- Oh, it's you!
	-- 			{ Cue = "/VO/Persephone_0038" },
	-- 			-- Is that you?
	-- 			{ Cue = "/VO/Persephone_0039" },
	-- 			-- Zagreus, you're back!
	-- 			{ Cue = "/VO/Persephone_0040", RequiredFalseQueuedTextLines = { "PersephoneMeeting06", "PersephoneMeeting07" } },
	-- 			-- Welcome back, my son.
	-- 			{ Cue = "/VO/Persephone_0041" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.5,
	-- 			UsePlayerSource = true,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			RequiredQueuedTextLines = "PersephoneReturnsHome01",

	-- 			-- Mother...?
	-- 			{ Cue = "/VO/ZagreusField_3619" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.5,
	-- 			UsePlayerSource = true,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			RequiredFalseQueuedTextLines = { "PersephoneReturnsHome01", "PersephoneMeeting08" },

	-- 			-- It's me.
	-- 			{ Cue = "/VO/ZagreusField_3613" },
	-- 			-- I'm back.
	-- 			{ Cue = "/VO/ZagreusField_3614" },
	-- 			-- I'm back, Mother!
	-- 			{ Cue = "/VO/ZagreusField_3615" },
	-- 			-- It's only me.
	-- 			{ Cue = "/VO/ZagreusField_3616" },
	-- 			-- I made it, Mother.
	-- 			{ Cue = "/VO/ZagreusField_3617" },
	-- 			-- Hello, Mother!
	-- 			{ Cue = "/VO/ZagreusField_3618" },
	-- 			-- Mother...?
	-- 			{ Cue = "/VO/ZagreusField_3619", RequiredFalseQueuedTextLines = { "PersephoneMeeting09" }, },
	-- 			-- I'm here, Mother.
	-- 			{ Cue = "/VO/ZagreusField_3620" },
	-- 		},
	-- 	},
	-- },
	-- PersephoneGuaranteedGreeting = {
	-- 	WithinDistance = 580,
	-- 	PostTriggerAnimation = "PersephoneUnderworld_Greeting",
	-- 	VoiceLines =
	-- 	{
	-- 		[1] = { GlobalVoiceLines = "PersephoneHomeGreetingVoiceLines" }, --GlobalVoiceLines.PersephoneHomeGreetingVoiceLines,
	-- 	},
	-- },
	-- PersephoneGreeting = {
	-- 	ChanceToTrigger = 0.75,
	-- 	WithinDistance = 580,
	-- 	PostTriggerAnimation = "PersephoneUnderworld_Greeting",
	-- 	GameStateRequirements =
	-- 	{
	-- 		RequiredFalsePrevRooms = { "DeathAreaBedroom", "DeathAreaOffice", "DeathAreaBedroomHades" },
	-- 		RequiresFalseHadesProcession = true,
	-- 	},
	-- 	VoiceLines =
	-- 	{
	-- 		[1] = { GlobalVoiceLines = "PersephoneHomeGreetingVoiceLines" }, --GlobalVoiceLines.PersephoneHomeGreetingVoiceLines,
	-- 	},
	-- },
	SingingEurydiceSong01_Eurydice_SongFromStart = {
		TrackName = "{5d99eb67-025b-4ae2-a8fa-bc9a1f52e5ec}",
		Restore = true,
	},
	SingingEurydiceSong01_Eurydice = {
		TrackName = "{5d99eb67-025b-4ae2-a8fa-bc9a1f52e5ec}",
		Restore = true,
		TrackOffsetMin = 10.0,
		TrackOffsetMax = 120.0,
	},
	SisyphusBenefitChoices = {
		SkipComponents = {
			"OlympusBackground",
			"ShopBackground",
			"ShopLighting",
		},
		DefaultGroup = "Combat_Menu_Overlay_Backing",
		ButtonGroupName = "Combat_Menu_Overlay_Backing",
		PurchaseAnimationGroupName = "Combat_Menu_Overlay_Additive",
		PortraitShift = { Distance = 250, Angle = 180, Duration = 0.3, EaseIn = 0.5, EaseOut = 1.0, },
		OverwriteTableKeys = { SkipUpgradePresentationAndExitUnlock = true, },
		OnCloseFinishedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesNPCPostChoicePresentation",
		UpgradeOptions = {
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesSisyphusHealing",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesSisyphusMoney",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesSisyphusMetapoints",
				Rarity = "Common",
			},
		},
	},
	BouldyRandomBlessings = {
		"BouldyBlessing_Armor",
		"BouldyBlessing_Attack",
		"BouldyBlessing_Special",
		"BouldyBlessing_Ranged",
		"BouldyBlessing_Speed",
		"BouldyBlessing_Money",
		"BouldyBlessing_None",
	},
	EurydiceBenefitChoices = {
		SkipComponents = {
			"OlympusBackground",
			"ShopBackground",
			"ShopLighting",
		},
		DefaultGroup = "Combat_Menu_Overlay_Backing",
		ButtonGroupName = "Combat_Menu_Overlay_Backing",
		PurchaseAnimationGroupName = "Combat_Menu_Overlay_Additive",
		PortraitShift = { Distance = 250, Angle = 180, Duration = 0.3, EaseIn = 0.5, EaseOut = 1.0, },
		OverwriteTableKeys = { SkipUpgradePresentationAndExitUnlock = true, },
		OnCloseFinishedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesNPCPostChoicePresentation",
		UpgradeOptions = {
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesBuffSlottedBoonRarity",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesBuffMegaPom",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesBuffFutureBoonRarity",
				Rarity = "Common",
			},
		},
	},
	PatroclusBenefitChoices = {
		SkipComponents = {
			"OlympusBackground",
			"ShopBackground",
			"ShopLighting",
		},
		DefaultGroup = "Combat_Menu_Overlay_Backing",
		ButtonGroupName = "Combat_Menu_Overlay_Backing",
		PurchaseAnimationGroupName = "Combat_Menu_Overlay_Additive",
		PortraitShift = { Distance = 250, Angle = 180, Duration = 0.3, EaseIn = 0.5, EaseOut = 1.0, },
		OverwriteTableKeys = { SkipUpgradePresentationAndExitUnlock = true, },
		OnCloseFinishedFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesNPCPostChoicePresentation",
		UpgradeOptions = {
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesBuffExtraChance",
				Rarity = "Common",
				PrioritySlotEntranceAnimation = "BoonEntranceLegendary",
				PriorityRequirements = {
					{
						PathFalse = { "GameState", "TraitsTaken", "ModsNikkelMHadesBiomesBuffExtraChance" },
					},
				},
			},
			-- Gain more health if MaxMana is currently higher than MaxHealth, or vice versa
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesGainMaxHealthMinMana",
				Rarity = "Common",
				GameStateRequirements = {
					{
						Path = { "CurrentRun", "Hero", "MaxHealth" },
						Comparison = "<=",
						ValuePath = { "CurrentRun", "Hero", "MaxMana" },
					},
				},
			},
			{
				Type = "Trait",
				ItemName = "ModsNikkelMHadesBiomesGainMinHealthMaxMana",
				Rarity = "Common",
				GameStateRequirements = {
					{
						Path = { "CurrentRun", "Hero", "MaxHealth" },
						Comparison = ">",
						ValuePath = { "CurrentRun", "Hero", "MaxMana" },
					},
				},
			},
		},
	},
}

-- Selected NPC data from Hades, loaded alongside other enemies in EnemyData.lua
-- Make modifications in EnemyData.lua, not here!
mod.NPCData = mod.NPCData or {
	-- Id 370001
	NPC_Sisyphus_01 = {
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },

		UseText = "UseTalkToSisyphus",
		AnimOffsetZ = 235,
		Portrait = "Portrait_Sisyphus_Default_01",
		Groups = { "NPCs" },

		ActivateRequirements = {
			RequiredMinCompletedRuns = 1,
		},

		MetaPointMin = 50,
		MetaPointMax = 60,

		-- Moved to Trait
		MoneyMin = 101,
		MoneyMax = 115,

		InteractTextLineSets =
		{
			SisyphusFirstMeeting =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0129",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Hey, Prince Z. Must look like I'm slacking off with the old boulder, here, but... I was just getting back on my feet. The Fury Sisters don't often leave me be. Where'd they go, anyway? And... what are you doing here?"
				},
				{
					Cue = "/VO/ZagreusField_0522",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, you know, just out on a little stroll is all. Do me a favor, though, you see the Fury Sisters, let them know I was headed down the way I came from, will you...?"
				},
				{
					Cue = "/VO/Sisyphus_0130",
					Text =
					"Oh I'll let them know, all right, I hear you loud and clear, Your Highness. I'll just go about my business now, and you take care."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting02_A =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting" },
				-- for backward compatibility
				RequiredFalseTextLines = { "SisyphusMeeting02" },
				{
					Cue = "/VO/Sisyphus_0179",
					Text =
					"You know, Prince Z., I'd not expected to run into you again, not after all this time. Something amiss down in the House, or what? Not had much company of late, is all."
				},
				{
					Cue = "/VO/ZagreusField_4346",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, something's just about always amiss back home, sir. Figured it couldn't hurt to check up on things in Tartarus a bit more frequently."
				},
				{
					Cue = "/VO/Sisyphus_0180",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well I am grateful for it, I and the old boulder there, in turn. I'm used to going lengthy stretches on my own, but having visitors from time to time would do me well!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting02_A", "SisyphusFirstMeeting" },
				RequiredFalseTextLines = { "Ending01" },
				{
					Cue = "/VO/Sisyphus_0131",
					Text =
					"If I may be so bold, Your Highness, I was wondering... what brings you back around this way again? Same story as last time?"
				},
				{
					Cue = "/VO/ZagreusField_0465",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Look, I have to level with you, Sisyphus. I'm leaving the House. I've had quite enough. You understand, I'm sure. I'm going to the surface."
				},
				{
					Cue = "/VO/Sisyphus_0133",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"{#DialogueItalicFormat}Whew{#PreviousFormat}, that is quite an undertaking, Prince. If it wasn't you yourself proposing it, I'd like to call it madness, truth be told. Though you're just mad enough to pull it off! Well hey, I hope you make it. Good fortune out there!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting03 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting02", "SisyphusGift01" },
				RequiredFalseTextLines = { "Ending01" },
				{
					Cue = "/VO/Sisyphus_0134",
					Text = "Hey Prince how goes the old escape plan, any luck?"
				},
				{
					Cue = "/VO/ZagreusField_0143",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You know it's been all right, all things considered. Dying now and then, and it's been hard, but hey, what can you do."
				},
				{
					Cue = "/VO/Sisyphus_0135",
					Text =
					"Ah, well, keep your chin up. Me, why I quit trying to get out of here a while back, but, if I was a fire-stepping youngster like yourself, perhaps I would have stuck to it."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusMeeting03", "SisyphusGift03" },
				{
					Cue = "/VO/Sisyphus_0136",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Hey, Your Highness, anything the matter, or just passing through? Happy that we get to chat like this of late, of course."
				},
				{
					Cue = "/VO/ZagreusField_0466",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, don't take this the wrong way, but... why are you helping me? My father's stuck you here for an eternity of torment and even still, you greet me with a smile, time after time."
				},
				{
					Cue = "/VO/Sisyphus_0137",
					Text =
					"{#DialogueItalicFormat}Hah{#PreviousFormat}! Come now, Prince Z., that's just the way I am! Besides, you're not your father, thank the gods! You always seemed a decent lad to me, and if you're saying you want out of here, why, I suppose I can relate, is all."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting_AboutFury01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "A_Boss01",
				RequiredFalseRoomLastRun = "B_Intro",
				RequiredFalseTextLines = { "SisyphusMeeting05", "SisyphusMeeting_FuryVictorious01", "SisyphusMeeting_FuryDefeated02" },
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 1 },
				{
					Cue = "/VO/Sisyphus_0173",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"You know, Prince, it's been good not having to see those Fury Sisters quite as much lately. The main one, what's her name, she's on your case now, isn't she."
				},
				{
					Cue = "/VO/ZagreusField_0524",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"You mean Megaera. She's on my case all right. Under strict orders not to let me out of Tartarus. I guess that means you've got yourself a break! About damn time they gave one to you, sir."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting05 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "A_Boss01",
				RequiredMinTimesSeenRoom = { A_Boss01 = 4 },
				RequiredMaxTimesSeenRoom = { A_PostBoss01 = 18 },
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 1 },
				{
					Cue = "/VO/ZagreusField_0472",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Hey, quick question, Sisyphus, you seen the other Fury Sisters lately?"
				},
				{
					Cue = "/VO/Sisyphus_0143",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Not seen the other Fury Sisters in some time now that you mention it! Just Megaera, the kindly one, and she is quite a handful on her own. I'll keep an eye out for the other two!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			-- bouldy introduced
			SisyphusMeeting06 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift02" },
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 12 },
				-- for backward compatibility
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },
				{
					Cue = "/VO/ZagreusField_0473",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Sisyphus, how can you stand it, being here like this? You always seem in such good spirits, though."
				},
				{
					Cue = "/VO/Sisyphus_0148",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"You push old Bouldy here sufficient times, and you might get a different outlook on things, too. With the Furies all preoccupied and with my running into you from time to time, I'm positively doing great lately. I like to take what pleasures I can get!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting07 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting06", "SisyphusGift03" },
				{
					Cue = "/VO/Sisyphus_0149",
					PreLineAnim = "SisyphusElbowing",
					Text = "Look here, Bouldy, Prince Z. himself has come to visit us!"
				},
				{
					Cue = "/VO/ZagreusField_0474",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Does Bouldy really keep you company? Personally I would resent a giant boulder that keeps tumbling back down a hill after I push it all the way up there."
				},
				{
					Cue = "/VO/Sisyphus_0150",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, Bouldy's not so bad, I mean, he's a good listener, a good shoulder to lean on, doesn't wield a whip... I rightly can't complain! Good having company down here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutBouldy01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting07", },
				{
					Cue = "/VO/ZagreusField_2835",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"You know I was just thinking, sir... sometimes I am a little envious of you and Bouldy there. You seem to have things pretty figured out. I still grow frustrated with myself quite often and don't always know whom to turn to."
				},
				{
					Cue = "/VO/Sisyphus_0181",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, {#DialogueItalicFormat}hah{#PreviousFormat}! Well, I just think you're in a tough spot lately, Prince. But you'll get through! As for old Bouldy, why, by all means do not hesitate to lay your troubles on him if you like! Dumped all of mine on him a while back."
				},
				{
					Cue = "/VO/ZagreusField_2836",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "So I can just... walk up and talk to him, and chat? That's all it takes?"
				},
				{
					Cue = "/VO/Sisyphus_0182",
					PostLineThreadedFunctionName = "SetUpBouldyConversation",
					Text = "That's truly all it takes to make a friend sometimes, indeed, Highness. Now, here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutBouldy02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "BouldyFirstMeeting", },
				RequiredMinAnyTextLines = { TextLines = { "BouldyMiscMeeting01", "BouldyMiscMeeting02", "BouldyMiscMeeting03" }, Count = 2 },
				{
					Cue = "/VO/ZagreusField_2837",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I have to thank you, Sisyphus, not just for all the help you've given me time after time, but for encouraging me to have a chat with Bouldy there. I daresay I feel a little more at peace of late, and maybe it's thanks to him."
				},
				{
					Cue = "/VO/Sisyphus_0183",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"He's a good one, all right, isn't he? Though if you've come to such an understanding with old Bouldy there, why, it must mean you've done some growing on your own as well, I think."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutBouldy03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusAboutBouldy02" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusAboutBouldy02" }, Count = 3 },
				{
					Cue = "/VO/Sisyphus_0439",
					PreLineAnim = "SisyphusElbowing",
					Text = "Hey, Your Highness, good, old Bouldy there had several things he wanted to tell you."
				},
				{
					Cue = "",
					Speaker = "NPC_Bouldy_01",
					SpeakerLabelOffsetY = 18,
					Portrait = "Portrait_Bouldy_Default_01",
					Text = ".   .   .   ."
				},
				{
					Cue = "/VO/Sisyphus_0440",
					PreLineAnim = "SisyphusExplaining",
					Text = "Thank you for listening to him! With all that said, I think I've got something for you right here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutBouldy04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusAboutBouldy02" },
				RequiredMinAnyTextLines = { TextLines = GameData.BouldyRepeatableTextLines, Count = 10 },
				{
					Cue = "/VO/Sisyphus_0441",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Hey Prince, ah, so... you do know Bouldy's just a plain old rock with a few lines chiseled into him, resembling a face, don't you? Chiseled into {#DialogueItalicFormat}it{#PreviousFormat}, I mean. Just so you don't get the wrong idea..."
				},
				{
					Cue = "",
					Speaker = "NPC_Bouldy_01",
					SpeakerLabelOffsetY = 18,
					Portrait = "Portrait_Bouldy_Default_01",
					Text = ".   .   .   ."
				},
				{
					Cue = "/VO/ZagreusField_3897",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Emote = "PortraitEmoteFiredUp",
					Text =
					"Come now, sir, we both know full well Bouldy's much more than that. You really think I doubt the power of Bouldy after everything we've been through?"
				},
				{
					Cue = "/VO/Sisyphus_0442",
					PreLineAnim = "SisyphusElbowing",
					Emote = "PortraitEmoteCheerful",
					Text =
					"{#DialogueItalicFormat}Hahahaha{#PreviousFormat}, no. Was just a jest, there, at Bouldy's expense. Look at him! He gets so annoyed when I call him a plain old rock like that. But then he calls me an old lazy lump, and then we're even for a while."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusAboutAlecto01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusMeeting06", "Fury2FirstAppearance" },
				RequiredRoomLastRun = "A_Boss02",
				{
					Cue = "/VO/ZagreusField_2838",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You ever meet Alecto, Sisyphus? The Fury Megaera's nastier sister. We recently became acquainted, she and I."
				},
				{
					Cue = "/VO/Sisyphus_0184",
					Text =
					"Ah, fortunately I've not seen too much of her, myself, Prince Z. And based on everything that I have seen and heard, I'd like to keep it that way for a while! I hope she doesn't cause you too much trouble there."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutTisiphone01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusMeeting06", "Fury3FirstAppearance" },
				RequiredRoomLastRun = "A_Boss03",
				{
					Cue = "/VO/ZagreusField_2839",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, have you had run-ins with Tisiphone the Fury here before? She isn't much for conversation, I don't think."
				},
				{
					Cue = "/VO/Sisyphus_0185",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Tisiphone. Why, yes, I have, in fact, Prince Z. She's visited on multiple occasions, truth be told. So she is back, is she?"
				},
				{
					Cue = "/VO/ZagreusField_2840",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "She is. Although, I think she's back to deal with me. I'll have to keep her plenty busy just in case."
				},
				{
					Cue = "/VO/Sisyphus_0186",
					Text =
					"Appreciate it, Prince. Of all the Fury Sisters, she's the one I would least care to see. But if she does stop by, you know, that's how it goes."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusMeeting08 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting04", "SisyphusGift01" },
				RequiredFalseTextLines = { "SisyphusBackstory03", "OlympianReunionQuestComplete" },
				{
					Cue = "/VO/Sisyphus_0147",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Look, Prince, I don't hold grudges, you know that. Push this boulder long as I have, you move past the petty stuff. So, just want you to know, in case you make it out this time, it's been a real pleasure."
				},
				{
					Cue = "/VO/ZagreusField_0521",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Feeling's mutual, sir. Someday you'll have to tell me all about how you tricked Father. I might learn a thing or two."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting06", "SisyphusGift01" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				RequiredFalseTextLines = { "Ending01" },
				-- RequiredRunsCleared = 0,
				{
					Cue = "/VO/Sisyphus_0151",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Say, tell me something, Prince, if you don't mind. How come you're so intent on getting out of here? I mean, what happens when you do?"
				},
				{
					Cue = "/VO/ZagreusField_0475",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, you ever lose somebody dear to you? There's someone out there whom I need to find. That's... all that I can say right now."
				},
				{
					Cue = "/VO/Sisyphus_0152",
					PreLineWait = 0.3,
					Text =
					"I get it, Highness, and I didn't mean to pry, it's just... I can't remember what it's like to want something so bad, you know? Whoever's out there, I hope you find them soon."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting06", "SisyphusGift04" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusMeeting06", "SisyphusGift04" }, Count = 4 },
				{
					Cue = "/VO/ZagreusField_0470",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Hey sir, I've always wondered, what were you like back when you were alive? Were you always this wise?"
				},
				{
					Cue = "/VO/Sisyphus_0141",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Might surprise you, Highness, I've a bit of royalty in me, myself. Not on your level, mind, but I was very much a king. Though I'll be honest, I... I wasn't much of a good man."
				},
				{
					Cue = "/VO/ZagreusField_0471",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Huh{#PreviousFormat}! I thought I sensed the royalty in you! Although, I can't imagine you as anything besides the gentleman I know you for, my friend."
				},
				{
					Cue = "/VO/Sisyphus_0142",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well that is awful kind of you to say. Though, I would like to think my punishment here wasn't without warrant. At least I've had a lot of time to think it through!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory03 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory02", "ThanatosFieldFirstMeeting", "SisyphusGift05" },
				{
					Cue = "/VO/ZagreusField_0467",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Erm{#PreviousFormat}, Sisyphus, you mind my asking what you did to warrant this particular arrangement you've got here? Pushing a boulder till the end of time and all. Never heard it in your own words."
				},
				{
					Cue = "/VO/Sisyphus_0138",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Well, it's a bit of a long story, Prince. My time had come, though I just wasn't ready, you might say. Your father thought he had me in his clutches, but then, {#DialogueItalicFormat}shoom{#PreviousFormat}! I gave him the slip. Your father's henchman, Thanatos, he'll back me up on that."
				},
				{
					Cue = "/VO/ZagreusField_0468",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "Outsmarted Thanatos, that's amazing... what happened then?"
				},
				{
					Cue = "/VO/Sisyphus_0139",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Turns out your father doesn't like us mortals cheating death. Eventually they found me, so, now I'm stuck here with my boulder friend. I push old Bouldy up the hill to the beat of the Furies' whips, then he tumbles down, and then we go again."
				},
				{
					Cue = "/VO/ZagreusField_0469",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"So then, you're stuck forever, no reprieve. That's terrible... wish there was something I could do to help."
				},
				{
					Cue = "/VO/Sisyphus_0140",
					Text =
					"You save those sympathies for someone else, Your Highness! I could be Prometheus, spending an eternity having my liver gobbled up, but instead I get to stay in shape, and have these chats with you. Now I'd better get back to it!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 20 },
				{
					Cue = "/VO/ZagreusField_2841",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, I've meant to ask, where are you getting all this stuff you give to me? You must be pretty well connected around here."
				},
				{
					Cue = "/VO/Sisyphus_0187",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, well, you know! I have acquaintances amongst the locals here, try to be neighborly with everyone is all. It's not just Bouldy and myself as you can see. Sometimes I come across things that'd be better off in other hands than mine."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory05 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory02", "SisyphusGift06" },
				{
					Cue = "/VO/ZagreusField_3892",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I have to tell you, Sisyphus. Sometimes I wish I knew more about your past. You must have been a great king."
				},
				{
					Cue = "/VO/Sisyphus_0431",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Well, {#DialogueItalicFormat}ah-hah{#PreviousFormat}, the thing is that I wasn't, Highness. And that's not modesty from me, all right? All behind me, now. And I'd appreciate it if we left it at that."
				},
				{
					Cue = "/VO/ZagreusField_3893",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I hear you, sir. Though, whatever you did in your mortal days... you've since more than paid for it, I'm sure.... Wait, is that why you're still here, in Tartarus? Because you think you deserve this?"
				},
				{
					Cue = "/VO/Sisyphus_0432",
					Text =
					"It's more like... this is where I belong. Where my path has taken me, you know? Here in the Underworld, you can't entirely escape your past... and yet, it's like you get another life to live. With all the wisdom that you picked up along the way."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory06 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory02", "SisyphusGift06" },
				RequiredMinRunsCleared = 5,
				{
					Cue = "/VO/Sisyphus_0437",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"You know, Prince Z., you really have a look about you that you know exactly where you're going, as of late. I used to think you weren't near as comfortable in your own skin."
				},
				{
					Cue = "/VO/ZagreusField_3896",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Oh, you were right. I was never comfortable performing Father's routine Tartarus inspections. Though those responsibilities of mine didn't last long."
				},
				{
					Cue = "/VO/Sisyphus_0438",
					Text =
					"Nor did we have much opportunity to chat back then, but hey! You always struck me as a decent sort. Wasn't accustomed to your father's henchpeople greeting me with a smile."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusLiberationQuest_Beginning_01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory03", "SisyphusMeeting06", "SisyphusGift06", "BouldyFirstMeeting" },
				{
					Cue = "/VO/ZagreusField_2849",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, I know you tend to be in remarkably good spirits, all things considered, but there must be something I can do to help with your predicament, isn't there?"
				},
				{
					Cue = "/VO/Sisyphus_0199",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Oh, come now, Prince, do Bouldy and I look like we could use your charity? We're planning to stay put within this chamber for a while. It's hardly a predicament, I'd say."
				},
				{
					Cue = "/VO/ZagreusField_2850",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					Text =
					"But, what of the Furies and their torments and all that? They might be back and make all this more difficult for you."
				},
				{
					Cue = "/VO/Sisyphus_0200",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Ah, yes, the Fury Sisters, well. I wouldn't mind seeing them more infrequently now that you mention it, but either way! So don't you even worry about me. Now, here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusLiberationQuestComplete =
			{
				SuperPriority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredCosmetics = { "SisyphusQuestItem" },
				{
					Cue = "/VO/ZagreusField_2851",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I have good news, sir! I located the contract binding you, and bought it out. It's null and void. You're free to go!"
				},
				{
					Cue = "/VO/Sisyphus_0201",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh! Indeed, then, does this mean, Prince, then... the Fury Sisters, they won't come around as often anymore?"
				},
				{
					Cue = "/VO/ZagreusField_2852",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Not just that, Sisyphus! You can make your way someplace else, where other decent shades reside! You know, somewhere with fewer chains and torture devices and such?"
				},
				{
					Cue = "/VO/Sisyphus_0202",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"You're much too kind to this old soul, Prince Z. The thing is, this is home. For me and Bouldy, it is what it is. Though, knowing that the Furies won't be visiting with quite their former regularity, that is a load off. Heavier than Bouldy, there."
				},
				{
					Cue = "/VO/ZagreusField_2853",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "You mean you're really going to stay? Even though you don't have to?"
				},
				{
					Cue = "/VO/Sisyphus_0203",
					Text =
					"Is that so odd, Highness? Don't see myself lugging old Bouldy out of here, besides! And if I were to leave, why, we would not be having these exchanges now and then. I happen to enjoy them quite a bit! Now, here you go, and thank you, very much."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",

					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Delay = 2.5, Title = "MainSubPlotComplete", Text = "SisyphusQuestItem", TextRevealSound = "/Leftovers/Menu Sounds/TextReveal3", AnimationName = "LocationTextBG", AnimationOutName = "LocationTextBGOut" },
				},
			},

			SisyphusLiberationQuestAftermath01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusLiberationQuestComplete" },
				RequiredAnyTextLines = { "SisyphusGift08_A", "SisyphusGift08_B", "SisyphusGift08" },
				{
					Cue = "/VO/Sisyphus_0425",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Must say, Prince Z., the free life sure does have its perks down here! This place really isn't as bad as it's cracked up to be."
				},
				{
					Cue = "/VO/ZagreusField_4105",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Glad to hear it, sir. But you're still here... the same as ever. Is it really all that different from the way it always was?"
				},
				{
					Cue = "/VO/Sisyphus_0426",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well, it used to be I'd have to start heaving Bouldy there at any point, if the Fury Sisters decided to show up. But now? I just get to relax, chat a bit with the other shades, and give you one of these when you're in the area!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusLiberationQuestAftermath02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusLiberationQuestComplete" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusLiberationQuestAftermath01", "SisyphusLiberationQuestAftermath02", "SisyphusLiberationQuestAftermath03" }, Count = 3 },
				RequiredAnyTextLines = { "SisyphusGift08_A", "SisyphusGift08_B", "SisyphusGift08" },
				{
					Cue = "/VO/Sisyphus_0427",
					Text =
					"Ah, there you are, Prince! I was just thinking about how grateful I am that you got me out of that contract with your father. It's been a real weight off my shoulders, truth be told."
				},
				{
					Cue = "/VO/ZagreusField_3890",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You never seemed particularly concerned even before, sir. Must say you're very good at hiding your worries."
				},
				{
					Cue = "/VO/Sisyphus_0428",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"And I could say the same to you! Look, I know you were concerned for my wellbeing. Now you don't have to be. And I'll still be around to help you out. Good feeling, isn't it?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusLiberationQuestAftermath03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusLiberationQuestAftermath02" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusLiberationQuestAftermath01", "SisyphusLiberationQuestAftermath02", "SisyphusLiberationQuestAftermath03" }, Count = 3 },
				RequiredAnyTextLines = { "SisyphusGift08_A", "SisyphusGift08_B", "SisyphusGift08" },
				RequiredMinRunsCleared = 3,
				{
					Cue = "/VO/Sisyphus_0429",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"You must have seen everything there is to see here in your father's Underworld, haven't you, Prince? I figure that there isn't any place nicer than this!"
				},
				{
					Cue = "/VO/ZagreusField_3891",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh! Well, I suppose now that you're free, you could always see for yourself? It's pretty different as soon as you reach Asphodel. Don't you have someplace or somebody you'd like to see?"
				},
				{
					Cue = "/VO/Sisyphus_0430",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"I'll take what's coming to me right here, thank you very much. You're the wayfaring sort, but my wayfaring days are over. It's hard to explain, but... this is a much-needed fresh start for me."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusHighRelationship01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusLiberationQuestAftermath01", "SisyphusLiberationQuestAftermath02", "SisyphusLiberationQuestAftermath03" }, Count = 3 },
				{
					Cue = "/VO/Sisyphus_0435",
					Text = "I will have you know, Prince, that your visits here have become a very important part of my routine!"
				},
				{
					Cue = "/VO/ZagreusField_3895",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "And what routine is that, exactly, sir? "
				},
				{
					Cue = "/VO/Sisyphus_0436",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Why, the routine of looking forward, of course! I try to appreciate the moment as much as anybody, but you know? It's always nice having something to look forward to. So, see you next time, then?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusMeeting_FuryVictorious01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting" },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },
				ConsecutiveDeathsInRoom =
				{
					Name = "A_Boss01",
					Count = 2,
				},
				{
					Cue = "/VO/Sisyphus_0146",
					Text =
					"I heard straight from the source the Fury Megaera's been giving you a time, there, hasn't she. Trust me I know the feeling, so, I'm grateful that you're here and that she's not. You give her hell for me next time, won't you?"
				},
				{
					Cue = "/VO/ZagreusField_0919",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Oh I'll get her for the both of us one of these days. Nights? Whenever."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting_FuryDefeated01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting" },
				RequiredAnyTextLines = { "MegaeraMeeting01", "MegaeraMeeting01_B", "MegaeraMeeting01_Alt", "MegaeraMeeting01_Alt_B" },
				RequiredRoomLastRun = "B_Intro",
				{
					Cue = "/VO/Sisyphus_0144",
					Text =
					"Hey Prince, I heard you showed that Fury Sister the what-for, is that the truth? Might explain why I've been left here to my own devices for a change."
				},
				{
					Cue = "/VO/ZagreusField_0523",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I don't think she'll be out of commission for very long. She'd best find you minding that boulder, though at least you managed to catch a break for now. Be seeing you, Sisyphus."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting_FuryDefeated02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "MegaeraMeeting02", "SisyphusFirstMeeting" },
				RequiredFalseTextLines = { "MegaeraGift07", "SisyphusLiberationQuestComplete" },
				{
					Cue = "/VO/Sisyphus_0145",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Now you be careful out there, Highness. The kindly Megaera is out for blood. She kept on groaning 'bout the last exchange between the two of you. You must have showed her good!"
				},
				{
					Cue = "/VO/ZagreusField_0525",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "I think I might have gotten lucky."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusMeeting_AboutMegAndThanatos01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "MegaeraGift06", "SisyphusGift03" },
				RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" },
				{
					Cue = "/VO/Sisyphus_0171",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Hey, Prince Z., I heard the strangest rumor, here's the thing, I'll give it to you straight. I have heard you've been consorting both with Megaera the Fury and with that old stiff, Thanatos, can you believe it?"
				},
				{
					Cue = "/VO/ZagreusField_0479",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, I don't know where you heard that, but... it's true. They're... they're just doing their jobs, and I... I know how it looks, but... you're my friend, as well, and I don't want you to forget that."
				},
				{
					Cue = "/VO/Sisyphus_0172",
					Text =
					"I... look, I do appreciate the sentiment, Your Highness, I'm just surprised. I thought we shared a common foe in them, is all. What can I say, I hope that someday I can see them how you see them."
				},
				{
					Cue = "/VO/ZagreusField_0480",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "Thank you for understanding, sir. Besides... maybe I can get them to cut you some slack."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting_AboutMegAndThanatos02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredFalseTextLinesLastRun = { "SisyphusMeeting_AboutMegAndThanatos01" },
				RequiredTextLines = { "MegaeraGift10", "ThanatosGift10", "SisyphusMeeting_AboutMegAndThanatos01" },
				{
					Cue = "/VO/ZagreusField_2854",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, I have to be up front with you. The Fury Megaera and Thanatos... I know you're not exactly on the best of terms with either one of them. But they're both close to me. You won't hold it against me, sir, will you?"
				},
				{
					Cue = "/VO/Sisyphus_0204",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Look, Prince, it's not for me to judge you, or your friends. The Fury Sisters, Master Thanatos... we got off on the wrong foot, you could say. My fault, entirely. I'd sooner make sure that our correspondence here doesn't make those relationships more difficult."
				},
				{
					Cue = "/VO/ZagreusField_2855",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Don't even say that, sir. I think Meg and Than know me better than that by now. Well, thanks for understanding, as always."
				},
				{
					Cue = "/VO/Sisyphus_0205",
					Text =
					"Certainly, Highness. And who knows? Perhaps as you spend more time together, some of your finer qualities will rub off on those two!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutThanatosRelationship01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory03", "SisyphusGift03", "ThanatosGift05" },
				{
					Cue = "/VO/Sisyphus_0443",
					Text =
					"How goes it with old Master Thanatos of late, Prince Z.? Is he at least less stern with you than with the poor mortals he's sent to take in here?"
				},
				{
					Cue = "/VO/ZagreusField_3898",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, Thanatos is doing all right. Much like my father, I think he feels he has some sort of fearsome reputation to uphold. Or maybe he's perpetually stressed over his work. But he's been well lately."
				},
				{
					Cue = "/VO/Sisyphus_0444",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"That's good, I guess! Always appreciated that he ultimately took me in, rather than having to show up here through much more sudden, much more painful means. Didn't stop me from trying to avoid the trip, of course."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusRunProgress01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "D_Hub",
				RequiredKills = { Theseus = 3 },
				RequiredTextLines = { "SisyphusGift01" },
				{
					Cue = "/VO/Sisyphus_0445",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Word is you've caused quite the hubbub in Elysium, Prince Z.! Making the champion up there really work for it, I hear?"
				},
				{
					Cue = "/VO/ZagreusField_4106",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You could say that, I guess! Apparently word gets around. That Theseus, though... he doesn't care for me one bit, let me tell you!"
				},
				{
					Cue = "/VO/Sisyphus_0446",
					PreLineAnim = "SisyphusElbowing",
					Text = "I bet he'd like you better if you were a regular pushover! Ah, well, he'll learn, I'm sure."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusRunCleared01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiresLastRunCleared = true,
				RequiredTextLines = { "SisyphusFirstMeeting", "PersephoneFirstMeeting" },
				RequiredFalseTextLines = { "SisyphusPostEnding01", "Ending01" },
				{
					Cue = "/VO/Sisyphus_0418",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Prince, you've been gone for quite a while, why... I heard-tell you made it all the way outside! And I believed it for a while there, yet here you are. What happened, might I ask?"
				},
				{
					Cue = "/VO/ZagreusField_2858",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I made it out of here, indeed, sir. I always said that I was leaving, but... turns out there was good reason for me to come back. Not the least of which is visiting my friends from time to time."
				},
				{
					Cue = "/VO/Sisyphus_0419",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well, I am certainly delighted to hear that! So long as you achieved what you set out to do. But, what brings you back again this way? More than a social visit I presume."
				},
				{
					Cue = "/VO/ZagreusField_2859",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"You're right. I'm back because... I'm leaving once again. Something I have to do if I get up there, though I should be back before long either way, I guess."
				},
				{
					Cue = "/VO/Sisyphus_0420",
					Text =
					"Going to try and make it out of here again and again, is it? Well they say repetition is the key to mastery, Prince Z. Now here, I'll send you on your way."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusRunCleared02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusRunCleared01", "PersephoneMeeting06" },
				{
					Cue = "/VO/Sisyphus_0469",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"So, how do you like the surface, hey, Prince Z.? Now that you've finally had a chance to see it for yourself. Not too bad, I hope?"
				},
				{
					Cue = "/VO/ZagreusField_4318",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"It takes some getting used to, that's for sure. I'm not sure I'll ever grow completely accustomed to it. Do you miss it, sir?"
				},
				{
					Cue = "/VO/Sisyphus_0470",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Oh, you know. I still have almost everything that matters, and the rest? It makes for precious memories I didn't have up there."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusPostEnding01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting", "Ending01" },
				{
					Cue = "/VO/Sisyphus_0471",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"So, all this time, Prince, when you were battling up to the surface, and all that... you were searching for {#DialogueItalicFormat}her{#PreviousFormat}, weren't you? The Queen?"
				},
				{
					Cue = "/VO/ZagreusField_4639",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I was. Although, between us, sir, it's important that you keep that one a secret, please. Did... you happen to meet her, ever?"
				},
				{
					Cue = "/VO/Sisyphus_0478",
					Text =
					"Well, just the one time, briefly, when your father decided to put me here. And, you have my word, of course. About the... surface stuff."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusPostEpilogue01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting", "OlympianReunionQuestComplete", },
				{
					Cue = "/VO/Sisyphus_0423",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Prince Z., my understanding is the Queen herself is back, is that correct? Moreover, I have heard a truly fascinating rumor about her..."
				},
				{
					Cue = "/VO/ZagreusField_2861",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"That I'm her son...? It's true, sir. And she's back with us for now, indeed. I think we're all still getting used to it, but... it feels good, having her in my life."
				},
				{
					Cue = "/VO/Sisyphus_0424",
					Text =
					"That's wonderful to hear. I'd always heard good things about that one. No wonder such a quality runs in the family."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusPostEpilogue02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusPostEpilogue01" },
				{
					Cue = "/VO/Sisyphus_0473",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Just one thing I don't understand, Prince Z., if you'll indulge me for a moment, here. If everything is all right for you at the House, then... why is it you're fighting to the surface, still?"
				},
				{
					Cue = "/VO/ZagreusField_4320",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, you know. Wouldn't want Father to get too comfortable thinking this place is foolproof. It has a terrifyingly ominous reputation to uphold! {#DialogueItalicFormat}There is no escape{#PreviousFormat}."
				},
				{
					Cue = "/VO/Sisyphus_0474",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Sure, that makes sense! Well, from a certain point of view. Escape over and over to prove it can't be done! I like that. Well, let's both of us keep at it, then!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusPostEpilogue03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusPostEpilogue02", "SisyphusLiberationQuestComplete" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusPostEpilogue02" }, Count = 3 },
				{
					Cue = "/VO/Sisyphus_0475",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Not working yourself {#DialogueItalicFormat}too {#PreviousFormat}hard of late, are you, Prince Z.? Remembering to take some breaks from time to time, and all?"
				},
				{
					Cue = "/VO/ZagreusField_4321",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I think I'm managing, thanks, sir. Though, back when you pushed Bouldy rather than talked to him... I suppose you didn't have much of a choice, did you?"
				},
				{
					Cue = "/VO/Sisyphus_0476",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well, it was work, you know? Even your Father has to work. Of course, I've since retired! But it seems you and he like to keep yourselves occupied. Whatever makes you feel content."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusAboutKeepsake01 =
			{
				-- Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTrait = "VanillaTrait",
				{
					Cue = "/VO/Sisyphus_0188",
					Text =
					"Say, that's my Shattered Shackle on your person, right, Prince Z.? I'd recognize that clunky thing from anywhere. It serving you all right?"
				},
				{
					Cue = "/VO/ZagreusField_2842",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Hey sir, certainly it's been most welcome having something from you with me at all times. Though has it always held this power? And... how did you remove it to begin with?"
				},
				{
					Cue = "/VO/Sisyphus_0189",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Bit of an odd story, that. Involved a well-timed accident with the old boulder there. Though, I'd best not get into it so that you're not accomplice to that little crime. Surely you understand?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutKeepsake02 =
			{
				-- Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusAboutKeepsake01" },
				RequiredTrait = "VanillaTrait",
				RequiresMaxKeepsake = true,
				{
					Cue = "/VO/Sisyphus_0190",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"My Shattered Shackle's practically like new, there, Prince! Minus the part where it's still broken, and all that. Nice work!"
				},
				{
					Cue = "/VO/ZagreusField_2843",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Thanks, sir. It's been of help through my repeated treks across this realm, all thanks to you. You sure you don't want it back?"
				},
				{
					Cue = "/VO/Sisyphus_0191",
					Emote = "PortraitEmoteFiredUp",
					Text =
					"{#DialogueItalicFormat}Hahahahah{#PreviousFormat}! Absolutely not, though truly I appreciate the sentiment. I'd rather have a look at the old boulder there than a symbol of the time I first got stuck here, when I wasn't doing quite as well."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusAboutAboutSingersReunionQuest01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusWithEurydice01", "SisyphusGift03" },
				MinRunsSinceAnyTextLines = { TextLines = { "OrpheusWithEurydice01" }, Count = 3 },
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 15 },
				{
					Cue = "/VO/Sisyphus_0433",
					Text =
					"Word is that the most beautiful music's been heard up in Asphodel, lately, Prince! From the sound of it, why... I think that has got to be Eurydice and Orpheus!"
				},
				{
					Cue = "/VO/ZagreusField_3894",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"You heard correctly, Sisyphus! Orpheus is reunited with his muse, at last. Or at least, he gets to visit on the regular, when he isn't busy at my father's house. So you've heard of them, have you?"
				},
				{
					Cue = "/VO/Sisyphus_0434",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, I've more than heard of them! I'm sure you know how Orpheus once ventured all the way down here, after Eurydice passed on. I'll never forget his song! Even the Fury Sisters gave me a break, they were so captivated by it, then. {#DialogueItalicFormat}Ah{#PreviousFormat}, good times. For me, at least!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusAboutLegendary01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTrait = "SisyphusAssistTrait",
				{
					Cue = "/VO/Sisyphus_0197",
					Text =
					"Prince Z., it seems you've brought my little Shady back to visit me! How very kind. And I can tell he's in good care of late."
				},
				{
					Cue = "/VO/ZagreusField_2848",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"He is, sir, and I'm grateful once again to have adopted him. You sure you don't want him back, though? Always seems like you could use a friend."
				},
				{
					Cue = "/VO/Sisyphus_0198",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"All due respect, Highness, but I've the best friend anyone can ask for to my right just there. And as for little Shady, he was more inclined than I to see the farthest reaches of the Underworld. Safe travels to you both!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutLegendary02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusAboutLegendary01" },
				RequiredTrait = "SisyphusAssistTrait",
				{
					Cue = "/VO/ZagreusField_2856",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, sir? Have you any idea how Shady works? I'm able to just whisk both you and Bouldy out of here, and to my aid? It must be awfully disorienting."
				},
				{
					Cue = "/VO/Sisyphus_0411",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Well, Prince, I told you that we'd be with you in spirit, didn't I? It's not just Shady's power, I suppose, nor is it Bouldy's or my hidden strength. It's testament to our companionship, is all. You gods are capable of anything!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			MegaeraWithSisyphus01_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "B_Intro",
				RequiredTextLines = { "SisyphusMeeting04" },
				RequiredAnyTextLines = { "MegaeraMeeting01", "MegaeraMeeting01_B", "MegaeraMeeting01_Alt", "MegaeraMeeting01_Alt_B" },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete", "MegaeraGift10" },
				RequiredKills = { Harpy = 2 },
				{
					Cue = "/VO/ZagreusField_0477",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "She's gone... You still in one piece, Sisyphus? Not hurt or anything?"
				},
				{
					Cue = "/VO/Sisyphus_0168",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh I'm just fine, thanks, Prince. That Fury Sister, she is quite a lass, I have to say, and very, very strong. Bet she could push old Bouldy here better than I!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			MegaeraWithSisyphus02_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "B_Intro",
				RequiredTextLines = { "SisyphusMeeting06", "MegaeraWithSisyphus01_FollowUp" },
				MinRunsSinceAnyTextLines = { TextLines = { "MegaeraWithSisyphus01_FollowUp" }, Count = 6 },
				RequiredKills = { Harpy = 10 },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },
				{
					Cue = "/VO/ZagreusField_0478",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "You've really never gotten Bouldy to the top before?"
				},
				{
					Cue = "/VO/Sisyphus_0170",
					Portrait = "Portrait_Sisyphus_Default_01",
					Speaker = "NPC_Sisyphus_01",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Never got the boulder to the top, not even once. Always tumbles down right at the very end. Lost count after the nineteen thousandth time or so, but you know what? One of these days, I bet it's going to stick."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			MegaeraWithSisyphus03_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "B_Intro",
				RequiredTextLines = { "SisyphusMeeting06", "MegaeraWithSisyphus02_FollowUp" },
				RequiredKills = { Harpy = 15 },
				MinRunsSinceAnyTextLines = { TextLines = { "MegaeraWithSisyphus01_FollowUp", "MegaeraWithSisyphus02_FollowUp" }, Count = 6 },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },
				{
					Cue = "/VO/ZagreusField_2832",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, did I just hear correctly that Megaera has vowed to leave you be for now? Both you and Bouldy there?"
				},
				{
					Cue = "/VO/Sisyphus_0175",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Why, I believe you heard just that, Your Highness! Seems the Fates are giving me a break. Although, the Fury Sister did declare that she'll be back to haunting me after she's through with you..."
				},
				{
					Cue = "/VO/ZagreusField_4107",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Well, I bet I can keep her busy for a while yet. I'll take it as a bit of good news, sir."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			ThanatosWithSisyphus01_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting05", "ThanatosFirstAppearance" },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete", "Ending01" },
				{
					Cue = "/VO/Sisyphus_0164",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, I'm doing very well, thanks, Prince. I'm not afraid of him, I mean, what have I got to lose? Now here, I wanted you to have this."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			ThanatosWithSisyphus02_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredTextLines = { "ThanatosWithSisyphus01_FollowUp" },
				MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithSisyphus01_FollowUp" }, Count = 5 },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete", "Ending01" },
				{
					Cue = "/VO/Sisyphus_0166",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Can you believe the nerve of that one, Prince? He's nothing but a blowhard, so, I simply tell him what he wants to hear! He can't stop me from helping you, besides. I'm dead already, what's he going to do?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			ThanatosWithSisyphus03_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "ThanatosWithSisyphus02_FollowUp", "SisyphusLiberationQuestComplete" },
				MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithSisyphus02_FollowUp", "SisyphusLiberationQuestComplete" }, Count = 5 },
				{
					Cue = "/VO/Sisyphus_0177",
					Text =
					"Prince Z.! Just missed your stern-faced colleague, feel that stillness hanging in the air? Sounds like he won't be checking up on me again anytime soon."
				},
				{
					Cue = "/VO/ZagreusField_2833",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Thanatos really isn't such a bad sort once you get to know him, sir. Though, I suppose you'll have to take my word for that."
				},
				{
					Cue = "/VO/Sisyphus_0178",
					Text =
					"Oh, I believe it, Highness. I should think that bringing death must be a lonely job. Perhaps he ought to try pushing a boulder sometime!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

		},

		RepeatableTextLineSets =
		{
			SisyphusChat01 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0002",
					PreLineAnim = "SisyphusExplaining",
					Text = "Good to see you in one piece, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat02 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0003",
					PreLineAnim = "SisyphusExplaining",
					Text = "Life treating you all right, I take it, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat03 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0004",
					Text = "Oh I'm hanging in there, thanks for asking, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat04 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0005",
					PreLineAnim = "SisyphusExplaining",
					Text = "You'll make it out of here, I've no doubt about it!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat05 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0006",
					PreLineAnim = "SisyphusExplaining",
					Text = "Nice of you to drop in for a bit!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat06 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0007",
					Text = "You are a sight for sore eyes, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat07 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0008",
					PreLineAnim = "SisyphusExplaining",
					Text = "Now you be careful out there, won't you, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat08 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0009",
					PreLineAnim = "SisyphusExplaining",
					Text = "You give them hell for me, all right, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat09 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0010",
					PreLineAnim = "SisyphusExplaining",
					Text = "Go get them for me, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat10 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0011",
					Text = "Got just the thing for you here, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat11 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0012",
					Text = "It's always good to see you, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat12 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0013",
					PreLineAnim = "SisyphusExplaining",
					Text = "You keep your chin up, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat13 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0014",
					Text = "Keep fighting the good fight, there, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat14 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0015",
					Text = "Hey you take care, you hear me, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat15 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0016",
					PreLineAnim = "SisyphusExplaining",
					Text = "Let's both of us keep going, that a deal?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat16 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0017",
					Text = "It's good of you to visit me like this!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat17 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0018",
					PreLineAnim = "SisyphusExplaining",
					Text = "Hope everything's been well enough of late."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat18 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0019",
					Text = "You watch your step out there, all right, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat19 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0020",
					PreLineAnim = "SisyphusExplaining",
					Text = "Hullo Highness, you're looking well enough!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat20 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0021",
					Text = "Hey, Your Highness, how goes it, how is everything?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat21 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0022",
					PreLineAnim = "SisyphusExplaining",
					Text = "I have to say it's good to see a friendly face!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat22 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0023",
					Text = "Always a pleasure, Highness, you take care out there."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat23 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0024",
					Text = "Here's my best friend in all the Underworld, how goes it, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat24 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0025",
					PreLineAnim = "SisyphusExplaining",
					Text = "Glad you made it all this way, Prince Z."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat25 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0334",
					Text = "Think I've got just the thing for you right here, Highness!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat26 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0335",
					Text = "A brief hello from time to time does wonders, don't you think, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat27 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", "SisyphusMeeting06" },
				{
					Cue = "/VO/Sisyphus_0336",
					PreLineAnim = "SisyphusElbowing",
					Text = "Much as I like the company of Bouldy there, you're always welcome, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat28 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0337",
					Text = "Stop by whenever you're around these parts, all right, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat29 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0338",
					Text = "I know it isn't much, Highness, but I do hope this helps!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat30 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", "SisyphusMeeting06" },
				{
					Cue = "/VO/Sisyphus_0339",
					PreLineAnim = "SisyphusExplaining",
					Text = "Here's something courtesy of me and Bouldy, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat31 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0340",
					Text = "How about a little bit of help as you keep on your journey, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat32 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0341",
					Text = "Let's see if we might make your going slightly easier, there, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat33 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0342",
					Text = "Should have something that ought to come in handy for you, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat34 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0343",
					Text = "No need for these, so take one off my hands, won't you, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat35 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", "SisyphusMeeting06" },
				{
					Cue = "/VO/Sisyphus_0344",
					PreLineAnim = "SisyphusElbowing",
					Text = "Bouldy and I have got the usual for you right here, Your Highness."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat36 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0345",
					Text = "Highness, please take one of these and go!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat37 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0351",
					Text = "All's well out here in Tartarus, Prince Z.! What will it be?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat38 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", "SisyphusMeeting06" },
				{
					Cue = "/VO/Sisyphus_0352",
					PreLineAnim = "SisyphusElbowing",
					Text = "Bouldy and I got our usual selection here, Highness!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat39 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0456",
					PreLineAnim = "SisyphusExplaining",
					Text = "Don't let me keep you, Prince, I know you've plenty of important business here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat40 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0457",
					Text = "Before you go, Prince Z., a little souvenir from your fine stay in Tartarus."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat41 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0458",
					PreLineAnim = "SisyphusElbowing",
					Text = "Don't do anything I wouldn't do out there, you hear me, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat42 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0459",
					RequiredMinHealthFraction = 0.9,
					PreLineAnim = "SisyphusExplaining",
					Text = "You're looking good and ready for whatever lies ahead up there, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat43 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0460",
					PreLineAnim = "SisyphusExplaining",
					Text = "You know approximately where to find me if you happen to be in the area again, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat44 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0461",
					PreLineAnim = "SisyphusExplaining",
					Text = "Everything's fine as ever here, Prince Z., so you go on ahead, and don't look back!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat45 =
			{
				UseableOffSource = true,
				RequiresLastRunNotCleared = true,
				{
					Cue = "/VO/Sisyphus_0462",
					PreLineAnim = "SisyphusExplaining",
					Text = "I have a feeling you are going to make it all the way topside this time, Highness!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat46 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06" },
				{
					Cue = "/VO/Sisyphus_0032",
					PreLineAnim = "SisyphusExplaining",
					Text = "Need a little pick-me-up perhaps?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			-- max relationship
			SisyphusMaxChat01 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0346",
					PreLineAnim = "SisyphusElbowing",
					Text = "Bouldy and I will always be here in your time of need, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat02 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0347",
					PreLineAnim = "SisyphusElbowing",
					Text = "Bouldy says whatever we can do to help, we'll do it, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat03 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0348",
					Text = "In case words of encouragement are not enough, have one of these here, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat04 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0349",
					Text = "Let's get you on your way, Prince Z., and in good spirits, too!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat05 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0350",
					Text = "Don't you worry, Highness, we have got you covered here!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat06 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0353",
					PreLineAnim = "SisyphusElbowing",
					Text = "Told old Bouldy here you'd probably be back if only to say hi!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat07 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0354",
					PreLineAnim = "SisyphusElbowing",
					Text = "Hey Prince, Bouldy and I will not be needing these, but maybe they can help!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat08 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0355",
					Text = "Just do the best you can, if you don't mind me saying so, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat09 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0453",
					PreLineAnim = "SisyphusElbowing",
					Text = "Speaking for myself and Bouldy there, we're always at your service, Prince."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat10 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0454",
					Text = "You get all the way up to the top and do whatever it is needs getting done, Highness!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat11 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0455",
					PreLineAnim = "SisyphusElbowing",
					Text = "I know Bouldy believes in you every bit as much as I do, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

		},

		GiftTextLineSets =
		{
			SisyphusGift01 =
			{
				PlayOnce = true,
				{
					Cue = "/VO/ZagreusHome_0120",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Hey, sir, thought this might ease your burden for a while."
				},
				{
					Cue = "/VO/Sisyphus_0160",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Now hold a moment, Highness, I cannot accept something like this... not without giving back a little something in return, that is!"
				},
			},
			SisyphusGift02 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift01", },
				{
					Cue = "/VO/Sisyphus_0153",
					Emote = "PortraitEmoteSurprise",
					Text = "Oh, my, you're really giving that to me, there, Prince? But, I'm just, why would you...?"
				},
				{
					Cue = "/VO/ZagreusField_0526",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "You better believe it, sir. Now you take care, be seeing you around."
				},
			},
			SisyphusGift03 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift02", },
				{
					Cue = "/VO/Sisyphus_0154",
					Emote = "PortraitEmoteSparkly",
					Text = "Why, Prince, you being serious right now, is that for me?"
				},
				{
					Cue = "/VO/ZagreusField_0527",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"You deserve better, Sisyphus! This really isn't much, but maybe it'll help you while away the days. Nights. Whatever time it is."
				},
			},
			SisyphusGift04 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift03", },
				{
					Cue = "/VO/Sisyphus_0155",
					Emote = "PortraitEmoteSparkly",
					Text = "Wow, Your Highness, you... you really shouldn't have. Thank you for not forgetting about me."
				},
				{
					Cue = "/VO/ZagreusField_0528",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "You're always a sight for sore eyes out here, Sisyphus. Thank you for always believing in me."
				},
			},
			SisyphusGift05 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift04", },
				{
					Cue = "/VO/Sisyphus_0156",
					Text =
					"I'm really very flattered, Highness! You didn't have to get me anything, I mean, your company's more than enough for me!"
				},
				{
					Cue = "/VO/ZagreusHome_0523",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "I figured you could do with something more than that this time around, good sir."
				},
			},
			SisyphusGift06 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift05", },
				{
					Cue = "/VO/Sisyphus_0157",
					Emote = "PortraitEmoteSparkly",
					Text =
					"Oh, but this is just too much for me, Your Highness, thank you, really. I don't know how I can ever repay you."
				},
				{
					Cue = "/VO/ZagreusHome_0524",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "How about you keep on helping me not die as quickly as I might have otherwise, deal?"
				},
			},

			-- high relationship / locked gifts
			SisyphusGift07_A =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/ZagreusField_2844",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, sir? You've helped me selflessly time after time without so much as asking anything in return. Wanted to say I'm very grateful, and thought you might like to try this. Here, for a special occasion!"
				},
				{
					Cue = "/VO/Sisyphus_0192",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Why, Prince, is this...? It is...! I've not so much as seen a bottle of it, much less sampled it, thank you so much! Although, with all respect, I cannot rightfully accept such a fine gift. Unless..."
				},
				{
					Cue = "/VO/ZagreusField_2845",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Unless...? Oh no, you're not making me take something in return, you know this was a gift not an exchange, sir, right? Wait, what is that?"
				},
				{
					Cue = "/VO/Sisyphus_0193",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"This, Highness, is a little friend of mine kept tucked away in Bouldy's care. Wherever you'll be going next, he'll make a worthy traveling companion. And when he's with you, Bouldy and I... we'll be with you in spirit, too."
				},
			},
			-- if you haven't had ambrosia with others
			SisyphusGift08_A =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift07_A", },
				RequiredFalseTextLines = { "SisyphusGift08_B", "MegaeraGift10", "OlympianReunionQuestComplete" },
				EndVoiceLines =
				{
					PreLineWait = 0.7,
					UsePlayerSource = true,
					-- Yeah I hope so too.
					{ Cue = "/VO/ZagreusHome_0501" },
				},
				{
					Cue = "/VO/Sisyphus_0412",
					Emote = "PortraitEmoteSparkly",
					Text =
					"Prince, that vintage Ambrosia bottle that you gave me, my! That was the greatest thing I ever tried, I think! Even Bouldy enjoyed the stuff!"
				},
				{
					Cue = "/VO/ZagreusField_3902",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I thought you'd like it, sir. And so, I'm pleased to offer you another! Almost a shame we seldom get such imports from Olympus around here. I hope I can appreciate it for myself sometime. Once all this is over with, I think."
				},
				{
					Cue = "/VO/Sisyphus_0413",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"What? You mean that you've never touched the stuff yourself? You've much more self control than I have, there. Perhaps someday we'll have a chance to share some between us!"
				},
			},
			-- if you have had ambrosia with others
			SisyphusGift08_B =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift07_A" },
				RequiredAnyTextLines = { "MegaeraGift10", "OlympianReunionQuestComplete" },
				RequiredFalseTextLines = { "SisyphusGift08_A" },
				EndVoiceLines =
				{
					PreLineWait = 0.7,
					UsePlayerSource = true,
					-- Yeah I hope so too.
					{ Cue = "/VO/ZagreusHome_0501" },
				},
				{
					Cue = "/VO/Sisyphus_0412",
					Emote = "PortraitEmoteSparkly",
					Text =
					"Prince, that vintage Ambrosia bottle that you gave me, my! That was the greatest thing I ever tried, I think! Even Bouldy enjoyed the stuff!"
				},
				{
					Cue = "/VO/ZagreusField_3901",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I thought you'd like it, sir. And so, I'm pleased to offer you another! Almost a shame we seldom get such imports from Olympus around here."
				},
				{
					Cue = "/VO/Sisyphus_0477",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Ah, look at what the Prince has brought for us, Bouldy! Perhaps someday we'll have a chance to share some between us!"
				},
			},
			SisyphusGift09_A =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "SisyphusGift08_A", "SisyphusGift08_B" },
				EndVoiceLines =
				{
					PreLineWait = 0.7,
					UsePlayerSource = true,
					-- You guys are great.
					{ Cue = "/VO/ZagreusField_2847" },
				},
				{
					Cue = "/VO/Sisyphus_0194",
					Text =
					"All this, for someone such as me. You know I'm down here for a reason, don't you, Prince? Not just because your father and good Thanatos don't care for me. Yet, from the very first, you showed me decency I'd not experienced since I was a king. Perhaps not even then."
				},
				{
					Cue = "/VO/ZagreusField_2846",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Whoever it was you used to be, sir, I believe you've changed. And I'm proud to say that you're my friend. And Bouldy there as well. It's odd for me to say, but I am glad you're here. I think I've learned a lot from you, about all this."
				},
				{
					Cue = "/VO/Sisyphus_0195",
					PostLineAnim = "SisyphusElbowing",
					Text =
					"Well, Your Highness, I am honored very much indeed, and having you amongst my list of friends makes it perhaps the greatest such a list a fellow such as I has ever had. Isn't that right, Bouldy?"
				},
				{
					Cue = "",
					Speaker = "NPC_Bouldy_01",
					SpeakerLabelOffsetY = 18,
					Portrait = "Portrait_Bouldy_Default_01",
					Emote = "PortraitEmoteSparkly",
					Text = ".   .   .   ."
				},
				{
					Cue = "/VO/Sisyphus_0196",
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_SisyphusAndBouldy_01", Icon = "Keepsake_SisyphusSticker_Max" },
					Text = "Take it from me, Prince Z., Bouldy concurs."
				},
			},

			-- below: old conversations from before the Welcome to Hell update
			SisyphusGift07 =
			{
				Skip = true,
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift06" },
				{
					Cue = "/VO/Sisyphus_0158",
					Text =
					"Wait, really, this, this is for me, you mean it, Prince? I mean, I won't say no, I can't say no to such a thing, so, thank you! Thank you kindly."
				},
				{
					Cue = "/VO/ZagreusHome_0525",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "You're more than welcome, sir. For all you've done for me, it's the least I could do."
				},
			},
			SisyphusGift08 =
			{
				Skip = true,
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift07", },
				{
					Cue = "/VO/Sisyphus_0159",
					PreLineWait = 0.35,
					Text =
					"...I'm really rather speechless, Your Highness. I'm just a shade doing my time. I don't deserve your generosity."
				},
				{
					Cue = "/VO/ZagreusHome_0526",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "Come on, sir, what's a priceless bottle of the drink of the gods between friends?"
				},
			},
		},

		GiftGivenVoiceLines =
		{
			{
				BreakIfPlayed = true,
				PreLineWait = 1.1,
				PlayFromTarget = true,
				RequiredTextLines = { "SisyphusGift07_A" },

				-- Sir, is this a mint-condition Shady you just gave to me?! I'm so grateful. I will keep him safe!
				{ Cue = "/VO/ZagreusHome_1488" },
			},
			{
				BreakIfPlayed = true,
				PreLineWait = 1.0,
				PlayFromTarget = true,

				-- Thanks for that, sir.
				{ Cue = "/VO/ZagreusHome_0320" },
			},
		},

		CharacterInteractions =
		{
			Rescue =
			{
				VoiceLines =
				{
					{
						RandomRemaining = true,
						PreLineWait = 0.4,

						-- Sure thing!
						{ Cue = "/VO/Sisyphus_0038" },
						-- You got it.
						{ Cue = "/VO/Sisyphus_0039" },
						-- Say no more!
						{ Cue = "/VO/Sisyphus_0040" },
						-- Easy does it!
						{ Cue = "/VO/Sisyphus_0041" },
						-- Good choice!
						{ Cue = "/VO/Sisyphus_0042" },
						-- A fine selection there!
						{ Cue = "/VO/Sisyphus_0043" },
						-- It's all yours!
						{ Cue = "/VO/Sisyphus_0044" },
						-- Sure, here you go!
						{ Cue = "/VO/Sisyphus_0045" },
						-- Good idea!
						{ Cue = "/VO/Sisyphus_0046" },
						-- Makes sense to me!
						{ Cue = "/VO/Sisyphus_0047" },
						-- Most excellent!
						{ Cue = "/VO/Sisyphus_0048" },
						-- Not to worry!
						{ Cue = "/VO/Sisyphus_0049" },
						-- That I can do!
						{ Cue = "/VO/Sisyphus_0220" },
						-- Got just the thing!
						{ Cue = "/VO/Sisyphus_0221" },
						-- I got you covered!
						{ Cue = "/VO/Sisyphus_0036" },
						-- I got you covered, Prince!
						{ Cue = "/VO/Sisyphus_0222", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Certainly, Highness!
						{ Cue = "/VO/Sisyphus_0223" },
						-- Sure thing, Prince Z.!
						{ Cue = "/VO/Sisyphus_0224", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- My pleasure, Prince!
						{ Cue = "/VO/Sisyphus_0225", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- No worries whatsoever!
						{ Cue = "/VO/Sisyphus_0226" },
						-- Think I can do that, Prince!
						{ Cue = "/VO/Sisyphus_0227", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Got that right here, Prince Z.!
						{ Cue = "/VO/Sisyphus_0228", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Then here you go!
						{ Cue = "/VO/Sisyphus_0229" },
						-- Ah, certainly, Prince Z.!
						{ Cue = "/VO/Sisyphus_0230", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Here you are!
						{ Cue = "/VO/Sisyphus_0231" },
					},
					{
						BreakIfPlayed = true,
						RandomRemaining = true,
						SuccessiveChanceToPlayAll = 0.75,
						UsePlayerSource = true,

						-- Cheers, mate.
						{ Cue = "/VO/ZagreusField_0485" },
						-- Cheers, mate.
						{ Cue = "/VO/ZagreusField_4035", RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- Thank you, mate.
						{ Cue = "/VO/ZagreusField_0179", RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- All right!
						{ Cue = "/VO/ZagreusField_2813", RequiredFalsePlayedThisRoom = { "/VO/ZagreusField_2813" }, RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- Thanks!
						{ Cue = "/VO/ZagreusField_2959", RequiredFalsePlayedThisRoom = { "/VO/ZagreusField_2959" }, RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- A pleasure!
						{ Cue = "/VO/ZagreusField_4225", RequiredFalsePlayedThisRoom = { "/VO/ZagreusField_4225" }, RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- Ooh thank you!
						{ Cue = "/VO/ZagreusField_2515", RequiredPlayed = { "/VO/ZagreusField_0485" } },
					},
				},
			},
		},

		RepulseOnMeleeInvulnerableHit = 250,
		OnHitVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.45,
			PlayFromTarget = true,
			Cooldowns =
			{
				{ Name = "SisyphusAnyQuipSpeech", Time = 11 },
			},

			-- Uh, Prince?
			{ Cue = "/VO/Sisyphus_0064", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Nice try, there!
			{ Cue = "/VO/Sisyphus_0065" },
			-- No use in that.
			{ Cue = "/VO/Sisyphus_0066" },
			-- Already dead here, Prince.
			{ Cue = "/VO/Sisyphus_0067", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Don't bother, Prince.
			{ Cue = "/VO/Sisyphus_0068", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Come on, now.
			{ Cue = "/VO/Sisyphus_0069" },
			-- Oh come now.
			{ Cue = "/VO/Sisyphus_0070" },
			-- Why bother.
			{ Cue = "/VO/Sisyphus_0071" },
			-- Try all you like!
			{ Cue = "/VO/Sisyphus_0072" },
			-- Very funny, Prince.
			{ Cue = "/VO/Sisyphus_0073", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Oof, got me good there!
			{ Cue = "/VO/Sisyphus_0074" },
			-- Nope, can't feel a thing.
			{ Cue = "/VO/Sisyphus_0075" },
			-- That's it, let all out.
			{ Cue = "/VO/Sisyphus_0076" },
			-- Hah, good one, Prince!
			{ Cue = "/VO/Sisyphus_0232", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Augh, you got me, Highness!
			{ Cue = "/VO/Sisyphus_0233" },
			-- Oh, please, have mercy and all that!
			{ Cue = "/VO/Sisyphus_0234" },
			-- That your best shot, Prince Z.?
			{ Cue = "/VO/Sisyphus_0235", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Now don't get frustrated all right?
			{ Cue = "/VO/Sisyphus_0236" },
			-- You getting ready for the road ahead?
			{ Cue = "/VO/Sisyphus_0237" },
			-- Nice shot there, Prince!
			{ Cue = "/VO/Sisyphus_0238", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Augh, I'm hit!
			{ Cue = "/VO/Sisyphus_0239" },
			-- Wow you are strong Prince Z.!
			{ Cue = "/VO/Sisyphus_0240", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Whew, most impressive, Prince!
			{ Cue = "/VO/Sisyphus_0241", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
		},

		BouldyAttackReactionVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.55,
			PlayFromTarget = true,
			RequiredTextLines = { "SisyphusFirstMeeting" },
			Cooldowns =
			{
				{ Name = "SisyphusAnyQuipSpeech", Time = 7 },
			},

			-- No use in that.
			{ Cue = "/VO/Sisyphus_0066", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0066" } },
			-- Don't bother, Prince.
			{ Cue = "/VO/Sisyphus_0068", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0068" },               Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Come on, now.
			{ Cue = "/VO/Sisyphus_0069", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0069" } },
			-- Oh come now.
			{ Cue = "/VO/Sisyphus_0070", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0070" } },
			-- Why bother.
			{ Cue = "/VO/Sisyphus_0071", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0071" } },
			-- Very funny, Prince.
			{ Cue = "/VO/Sisyphus_0073", RequiredTextLines = { "SisyphusMeeting06" },                         Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Pick on somebody your own size, Prince!
			{ Cue = "/VO/Sisyphus_0254", RequiredTextLines = { "SisyphusGift03" },                            Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- That's one fight you aren't going to win!
			{ Cue = "/VO/Sisyphus_0255" },
			-- Takes more than that to budge old Bouldy, Prince!
			{ Cue = "/VO/Sisyphus_0256", RequiredTextLines = { "SisyphusMeeting06" },                         Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Sure is heavy, isn't he!
			{ Cue = "/VO/Sisyphus_0257", RequiredTextLines = { "SisyphusMeeting06" } },
			-- Bouldy can take whatever you dish out!
			{ Cue = "/VO/Sisyphus_0258", RequiredTextLines = { "SisyphusMeeting06" } },
			-- Now there's no need for that here, Prince.
			{ Cue = "/VO/Sisyphus_0259", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Try all you like, there, Prince!
			{ Cue = "/VO/Sisyphus_0260", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Hey that's my friend, Prince Z.
			{ Cue = "/VO/Sisyphus_0261", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- No hurting Bouldy, Prince.
			{ Cue = "/VO/Sisyphus_0262", RequiredTextLines = { "SisyphusMeeting06" },                         Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- That's one tough rock you're messing with.
			{ Cue = "/VO/Sisyphus_0263" },
			-- Don't hurt yourself, all right?
			{ Cue = "/VO/Sisyphus_0264" },
			-- Come now, Highness!
			{ Cue = "/VO/Sisyphus_0265" },
			-- Why, your Highness?
			{ Cue = "/VO/Sisyphus_0266" },
			-- Oh what did Bouldy ever do to you?
			{ Cue = "/VO/Sisyphus_0267", RequiredTextLines = { "SisyphusMeeting06" } },
		},
	},

	-- Manually replaced PresetEventArgs.BouldyRandomBlessings with mod.PresetEventArgs.BouldyRandomBlessings for simplicity
	-- Bouldy, Id = 506340
	ModsNikkelMHadesBiomes_NPC_Bouldy_01 = {
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
		UseText = "UseTalkToBouldy",
		AnimOffsetZ = 235,
		Portrait = "Portrait_Bouldy_Default_01",
		BlockStatusAnimations = true,
		Groups = { "NPCs" },
		GiftText = "GiftBouldyUseText",

		ActivateRequirements = {
			RequiredMinCompletedRuns = 1,
		},

		InteractTextLineSets =
		{
			BouldyFirstMeeting =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredTextLines = { "SisyphusAboutBouldy01" },
				EndVoiceLines =
				{
					{
						RandomRemaining = true,
						PreLineWait = 0.73,
						UsePlayerSource = true,

						-- I, uh... OK!
						{ Cue = "/VO/ZagreusField_2808" },
					},
					{
						ObjectType = "NPC_Sisyphus_01",
						RequiredUnitAlive = "NPC_Sisyphus_01",
						PreLineWait = 0.45,
						-- I think he likes you!
						{ Cue = "/VO/Sisyphus_0361" },
					},
				},
				{
					Cue = "/VO/ZagreusField_2785",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Erm{#PreviousFormat}, Bouldy...? I'm Zagreus, good to make your acquaintance. I know that friends are difficult to come by here in Tartarus, and so, I'm grateful that you seem to be a trusty one."
				},
				{
					Cue = "",
					SpeakerLabelOffsetY = 18,
					Text = ".   .   .   ."
				},
			},
			BouldyMiscMeeting01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "BouldyFirstMeeting" },
				{
					Cue = "/VO/ZagreusField_2786",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Bouldy, while on one hand I know that making offerings to you won't really help get me out of here, on the other hand... maybe it will?"
				},
				{
					Cue = "",
					SpeakerLabelOffsetY = 18,
					Text = ".   .   .   ."
				},
			},
			BouldyMiscMeeting02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "BouldyFirstMeeting" },
				{
					Cue = "/VO/ZagreusField_2787",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Bouldy, how do you handle being trapped in Tartarus for all eternity, doomed to be pushed up and down a hill repeatedly for no good reason?"
				},
				{
					Cue = "",
					SpeakerLabelOffsetY = 18,
					Text = ".   .   .   ."
				},
			},
			BouldyMiscMeeting03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "BouldyFirstMeeting" },
				{
					Cue = "/VO/ZagreusField_2788",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"So, {#DialogueItalicFormat}erm{#PreviousFormat}, there something you like to do for entertainment out here, Bouldy? Or just, I don't know, take it all in, I guess?"
				},
				{
					Cue = "",
					SpeakerLabelOffsetY = 18,
					Text = ".   .   .   ."
				},
			},
		},

		RepeatableTextLineSets =
		{
			BouldyChat01 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "BouldyFirstMeeting" },
				{
					Cue = "",
					SpeakerLabelOffsetY = 18,
					Text = ".   .   .   ."
				},
			},
		},

		GiftTextLineSets =
		{
			BouldyGiftRepeatable01 =
			{
				{
					Cue = "/VO/ZagreusField_2789",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "What's the latest, Bouldy? Had any good tumbles down that hill of late?"
				},
				{
					Cue = "",
					SpeakerLabelOffsetY = 18,
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable02 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01" },
				{
					Cue = "/VO/ZagreusField_2790",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "You know, I think I'm growing more accustomed to relating to a giant stone."
				},
				{
					Cue = "",
					SpeakerLabelOffsetY = 18,
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable03 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2791",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "Don't know why I keep doing this, Bouldy, yet here we are."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable04 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2792",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "You take good care of Sisyphus, there, won't you, Bouldy?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable05 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2793",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Sometimes a conversation with a friend is its own reward, isn't that right, Bouldy?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable06 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2794",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "You're looking as stately as ever, there, Bouldy."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable07 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2795",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "A tribute to the greatest boulder of all time."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable08 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2796",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "To our most famous boulder!"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable09 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2797",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "May you roll smoothly for eternity."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable10 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2798",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Thank you for keeping my friend company."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable11 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2799",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "This is for you, Bouldy."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable12 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2800",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Bouldy, please accept this humble offering."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable13 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03" },
				{
					Cue = "/VO/ZagreusField_2801",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Bouldy, lend your favor to me, won't you?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable14 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2802",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "An offering to the finest boulder in all of Tartarus."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable15 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_2803",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Cheers, Bouldy! Thank you for brightening my day or night."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable16 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				RequiredTextLines = { "BouldyGiftRepeatable12" },
				{
					Cue = "/VO/ZagreusField_2804",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Bouldy, ever get the feeling that we've had this conversation in the past?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable17 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03", "BouldyGiftRepeatable04", "BouldyGiftRepeatable05" },
				{
					Cue = "/VO/ZagreusField_2805",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Let's be sure to do this again sometime, Bouldy my friend."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable18 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03", "BouldyGiftRepeatable04", "BouldyGiftRepeatable05" },
				{
					Cue = "/VO/ZagreusField_2806",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Any advice for me on this occasion, Bouldy?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable19 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03", "BouldyGiftRepeatable04", "BouldyGiftRepeatable05" },
				{
					Cue = "/VO/ZagreusField_2807",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Bouldy, you can speak up if there's something on your mind, you know."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable20 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02" },
				{
					Cue = "/VO/ZagreusField_4215",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "You're always here for me, Bouldy! Cheers."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable21 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03", "BouldyGiftRepeatable04", "BouldyGiftRepeatable05" },
				{
					Cue = "/VO/ZagreusField_4216",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "How's everything going lately, there, Bouldy?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable22 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03" },
				{
					Cue = "/VO/ZagreusField_4217",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Looks like you and Sisyphus are doing just fine, Bouldy."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable23 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03" },
				{
					Cue = "/VO/ZagreusField_4218",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Good seeing you as ever, there, Bouldy."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable24 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03", "BouldyGiftRepeatable04", "BouldyGiftRepeatable05" },
				{
					Cue = "/VO/ZagreusField_4219",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "You're a good friend, Bouldy. I'm glad you're here."
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable25 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03", "BouldyGiftRepeatable04", "BouldyGiftRepeatable05" },
				{
					Cue = "/VO/ZagreusField_4220",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "You'd tell me if anything was on your mind, right, Bouldy?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable26 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03", "BouldyGiftRepeatable04", "BouldyGiftRepeatable05", "BouldyGiftRepeatable06", "BouldyGiftRepeatable07", "BouldyGiftRepeatable08", "BouldyGiftRepeatable09", "BouldyGiftRepeatable10" },
				{
					Cue = "/VO/ZagreusField_4221",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Hey Bouldy, what's your favorite color?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable27 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03", "BouldyGiftRepeatable04", "BouldyGiftRepeatable05", "BouldyGiftRepeatable06", "BouldyGiftRepeatable07", "BouldyGiftRepeatable08", "BouldyGiftRepeatable09", "BouldyGiftRepeatable10" },
				{
					Cue = "/VO/ZagreusField_4222",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Hey Bouldy, what's your favorite form of sustenance?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable28 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03", "BouldyGiftRepeatable04", "BouldyGiftRepeatable05", "BouldyGiftRepeatable06", "BouldyGiftRepeatable07", "BouldyGiftRepeatable08", "BouldyGiftRepeatable09", "BouldyGiftRepeatable10" },
				{
					Cue = "/VO/ZagreusField_4223",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Hey Bouldy, what do you like to do in your spare time?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
			BouldyGiftRepeatable29 =
			{
				RequiredTextLines = { "BouldyGiftRepeatable01", "BouldyGiftRepeatable02", "BouldyGiftRepeatable03" },
				{
					Cue = "/VO/ZagreusField_4224",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Hey Bouldy, how's everything of late?"
				},
				{
					Cue = "",
					Text = ".   .   .   .",
					PostLineGlobalVoiceLines = "BlessedByBouldyVoiceLines",
					PostLineFunctionName = "AddRandomBouldyBlessing",
					PostLineFunctionArgs = mod.PresetEventArgs.BouldyRandomBlessings
				},
			},
		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- Thanks for that, sir.
			-- { Cue = "/VO/ZagreusHome_0320" },
		},

		--[[
		CharacterInteractions =
		{
			Rescue =
			{
				VoiceLines =
				{
					BreakIfPlayed = true,
					RandomRemaining = true,
					PreLineWait = 0.4,

					-- Sure thing!
					-- { Cue = "/VO/Sisyphus_0038" },
				},
			},
		},
		]] --

		OnHitFunctionName = "BouldyHitPresentation",
		OnHitVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.25,
			ObjectType = "NPC_Sisyphus_01",
			Cooldowns =
			{
				{ Name = "SisyphusAnyQuipSpeech", Time = 7 },
			},

			-- No use in that.
			{ Cue = "/VO/Sisyphus_0066" },
			-- Don't bother, Prince.
			{ Cue = "/VO/Sisyphus_0068" },
			-- Come on, now.
			{ Cue = "/VO/Sisyphus_0069" },
			-- Oh come now.
			{ Cue = "/VO/Sisyphus_0070" },
			-- Why bother.
			{ Cue = "/VO/Sisyphus_0071" },
			-- Very funny, Prince.
			{ Cue = "/VO/Sisyphus_0073" },
		},
	},

	-- Manually replaced PresetEventArgs.SingingEurydiceSong01_Eurydice[_SongFromStart] with mod.PresetEventArgs.SingingEurydiceSong01_Eurydice[_SongFromStart] to make it easier
	-- FunctionName is still replaced in NPCData.lua
	-- Eurydice, Id = 514436
	NPC_Eurydice_01 = {
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },

		UseText = "UseTalkToEurydice",
		Portrait = "Portrait_Eurydice_Default_01",
		SingingAnimation = "EurydiceIdleSinging_Start",
		SingingFx = "StatusSinging_Eurydice",
		SingingAnimOffsetX = 30,
		TextLinesPauseAmbientMusicVocals = true,
		TextLinesPauseSingingFx = true,
		AnimOffsetZ = 223,
		Groups = { "NPCs" },
		StartTextLinesAnimation = "EurydiceIdleSinging_SingingLoop_End",
		EndTextLinesAnimation = "EurydiceIdleSinging_Start",

		ActivateRequirements = {
			RequiredMinCompletedRuns = 1,
		},

		InteractTextLineSets =
		{
			-- not learned of her through orpheus, not met hydra
			EurydiceFirstMeeting01_A =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseSeenRooms = { "B_Boss01" },
				RequiredFalseTextLines = { "EurydiceFirstMeeting01_B", "EurydiceFirstMeeting01_C", },
				{
					Cue = "/VO/Eurydice_0002",
					Text =
					"Hey, you must be the Hades kid! How's it going, then, Your Royal Majesty? Nice to meet you, I'm Eurydice. What brings a big important guy like you up to a place like this?"
				},
				{
					Cue = "/VO/ZagreusField_2469",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Hi there! No need for formalities, I'm Zagreus. Just heading out on some official business! Surveying the magma situation firsthand. Don't mean to be rude, though I'm in a bit of a rush."
				},
				{
					Cue = "/VO/Eurydice_0003",
					Text =
					"Well don't you have your hands full, hon! I'll let you go, but there's one rule in my place, which is: Nobody leaves here empty-handed, you got that? So take your pick, my treat!"
				},
				{
					Text = "Eurydice_OfferText01",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			-- not learned of her through orpheus, met hydra
			EurydiceFirstMeeting01_B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredSeenRooms = { "B_Boss01" },
				RequiredFalseTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_C" },
				{
					Cue = "/VO/Eurydice_0172",
					Text =
					"Hey you must be the Hades kid! How's it going, then, Your Royal Majesty? Nice to meet you, I'm Eurydice. What brings a big important guy like you up to a place like this?"
				},
				{
					Cue = "/VO/ZagreusField_2468",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Hi there! No need for formalities, I'm Zagreus. Just heading out on some official business. Past the menacing Bone Hydra. Don't mean to be rude, though I'm in a bit of a rush."
				},
				{
					Cue = "/VO/Eurydice_0173",
					Text =
					"Well don't you have your hands full, hon! I'll let you go, but there's one rule in my place, which is: Nobody leaves here empty-handed, you got that? So take your pick, my treat!"
				},
				{
					Text = "Eurydice_OfferText01",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			-- learned of her through orpheus, met hydra
			EurydiceFirstMeeting01_C =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "OrpheusMiscMeeting06" },

				RequiredFalseTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B" },
				{
					Cue = "/VO/Eurydice_0172",
					Text =
					"Hey you must be the Hades kid! How's it going, then, Your Royal Majesty? Nice to meet you, I'm Eurydice. What brings a big important guy like you up to a place like this?"
				},
				{
					Cue = "/VO/ZagreusField_2470",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Hi there! No need for formalities, I'm Zagreus. Just heading out on some official business. Say, if your name's Eurydice, I don't suppose you know an Orpheus, do you? Quite musically inclined, a little dour, impressive hair?"
				},
				{
					Cue = "/VO/Eurydice_0174",
					Text =
					"{#DialogueItalicFormat}He {#PreviousFormat}put you up to this? Look, hon, why don't you get on with your business, then. But you can't leave empty-handed, that's the rule, so take your pick, my treat! Nothing for him, though."
				},
				{
					Text = "Eurydice_OfferText01",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},

			-- If you didn't immediately mention Orpheus
			EurydiceAboutOrpheus01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "OrpheusMiscMeeting06", "OrpheusMiscMeeting06_B" },
				RequiredAnyOtherTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B" },
				RequiredFalseTextLines = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus01_B", "EurydiceAboutOrpheus04", },
				{
					Cue = "/VO/Eurydice_0074",
					Text = "Hey, hon, what's going on, speak up! I know when something's up down to my roots, and something's up."
				},
				{
					Cue = "/VO/ZagreusField_2471",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Well it's just, I think that you may know an Orpheus, don't you? Quite musically inclined, a little dour, impressive hair? He's court musician in my father's house. Calls you his muse. Says he misses you terribly. I... thought you should know."
				},
				{
					Cue = "/VO/Eurydice_0075",
					Text =
					"Orpheus said all that, huh? Tell you what, the next time you run into him, you ask him about the time that he came all this way to try and save me, even though I was already dead. Can you guess how that turned out?"
				},
				{
					Cue = "/VO/ZagreusField_2473",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Erm{#PreviousFormat}... yes, I do believe I can. Look, I didn't mean to upset you."
				},
				{
					Cue = "/VO/Eurydice_0076",
					Text =
					"Yeah, well, neither did he! But you know what? Actions beat intentions, hon. Now, here, how about a treat and you can be on your way."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			-- If you immediately mentioned Orpheus
			EurydiceAboutOrpheus01_B =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_C", "OrpheusAboutEurydice01" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus04" },
				{
					Cue = "/VO/Eurydice_0074",
					Text = "Hey, hon, what's going on, speak up! I know when something's up down to my roots, and something's up."
				},
				{
					Cue = "/VO/ZagreusField_2472",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Well it's just, I think I wanted to tell you more of Orpheus, since... he's court musician in my father's house. Calls you his muse. Says he misses you terribly. I... thought you should know."
				},
				{
					Cue = "/VO/Eurydice_0075",
					Text =
					"Orpheus said all that, huh? Tell you what, the next time you run into him, you ask him about the time that he came all this way to try and save me, even though I was already dead. Can you guess how that turned out?"
				},
				{
					Cue = "/VO/ZagreusField_2473",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Erm{#PreviousFormat}... yes, I do believe I can. Look, I didn't mean to upset you."
				},
				{
					Cue = "/VO/Eurydice_0076",
					Text =
					"Yeah, well, neither did he! But you know what? Actions beat intentions, hon. Now, here, how about a treat and you can be on your way."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			-- this is where Eurydice gets mad / Eurydice mad
			EurydiceAboutOrpheus02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "OrpheusAboutEurydice01", "OrpheusAboutEurydice01_B" },
				RequiredAnyOtherTextLines = { "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },

				{
					Cue = "/VO/Eurydice_0079",
					Text =
					"What is it, hon? Oh no, don't tell me you've come all the way from Tartarus to ask me more about your good-for-nothing court musician friend."
				},
				{
					Cue = "/VO/ZagreusField_2475",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Certainly not! I'm merely here for your wonderful singing, cooking, or conversational ability. Though, since you mentioned it, you... seem to have a lot to say to him. Is there anything I can do?"
				},
				{
					Cue = "/VO/Eurydice_0080",
					Text =
					"So let me see if I understand. Orpheus blew it with me like an idiot, but now I'm supposed to be reaching out to {#DialogueItalicFormat}him{#PreviousFormat}? Sorry, hon, but that's not happening. The two of us are finished. And, you know what? I think we're finished here, too. If you'll excuse me!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceAboutOrpheus03 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "OrpheusAboutEurydice02", "OrpheusAboutEurydice02_B" },
				{
					Cue = "/VO/Eurydice_0081",
					Text =
					"Hey there, hon! So what do you think, pretty good tune, right? Don't know how come everybody doesn't sing. Lightens the mood, passes the time. What's not to like?"
				},
				{
					Cue = "/VO/ZagreusField_2476",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"It's a beautiful song. Even though you're angry with him... Orpheus, I mean... you're always singing, still?"
				},
				{
					Cue = "/VO/Eurydice_0082",
					Text =
					"Oh it's not Orpheus' song, you kidding me? This one's all mine. He always did like going on about how I'm his muse, well, that's 'cause I wrote half his songs for him! Bet he didn't mention that, did he."
				},
				{
					Cue = "/VO/ZagreusField_2477",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Well, not exactly in those words, but... Orpheus can be a little hard to parse."
				},
				{
					Cue = "/VO/Eurydice_0083",
					Text =
					"He can be a little hard to tolerate. A quality I hope isn't going to rub off on any of his mates. I should get back to practicing, see you."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			-- no longer mad after this
			EurydiceAboutOrpheus04 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusAboutEurydice03" },
				{
					Cue = "/VO/ZagreusField_2478",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Look, Eurydice, I promise not to bother you with this each time, but... you should know your husband's shattered by what happened with the two of you. He's genuinely sorry, and he loves you very deeply, still, I'm sure of it."
				},
				{
					Cue = "/VO/Eurydice_0084",
					Text =
					"{#DialogueItalicFormat}Tsk{#PreviousFormat}... and what am I supposed to do with that, Your Royal Majesty...?"
				},
				{
					Cue = "/VO/ZagreusField_2479",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "I... I don't know yet. Though, you know what? You shouldn't take my word for it. You should take his."
				},
				{
					Cue = "/VO/Eurydice_0085",
					Text =
					"Don't think I will be running into him anytime soon from what I understand. But you're the Hades kid! You want to pull some strings on our behalf, go right ahead, I guess. But I won't hold my breath. Even if I could."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceProgressWithOrpheus01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusProgressWithEurydice02", },
				RequiredFalseTextLines = { "OrpheusWithEurydice01" },
				RequiredAnyTextLines = { "OrpheusSingsAgain01", "OrpheusSingsAgain01_B", "OrpheusSingsAgain02", "OrpheusSingsAgain03", "OrpheusSingsAgain03_B" },
				{
					Cue = "/VO/Eurydice_0086",
					Text =
					"So, {#DialogueItalicFormat}uh{#PreviousFormat}, how's Orpheus been doing lately, anyway? Still keeping his hair in those neat little curls? I guess his tan must have faded by now."
				},
				{
					Cue = "/VO/ZagreusField_2480",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Curls? {#DialogueItalicFormat}Erm{#PreviousFormat}, not exactly, no. But he's doing all right! For him. He's started singing again, lately, which was a big step. He never used to, before. Would go on about how he'd lost his muse."
				},
				{
					Cue = "/VO/Eurydice_0087",
					Text =
					"And now he knows I'm out there, still, huh. That's... well, thank you for the update, hon. Music's his gift. Good to know he's not thrown everything away."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},

			-- song request / eurydice gives song / eurydicesong
			EurydiceProgressWithOrpheus02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusProgressWithEurydice01", },
				{
					Cue = "/VO/ZagreusField_2481",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Eurydice, can I ask you for a favor here? Not that you owe me anything, but, would you hear me out?"
				},
				{
					Cue = "/VO/Eurydice_0088",
					Text =
					"Yeah, sure, hon, what is it? Though you had better not be asking for my recipes. Closely guarded family secret! I'd say I'd take them to my grave, but... yeah."
				},
				{
					Cue = "/VO/ZagreusField_2482",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"It's not your recipes, though they are wonderful. It's your song. I'm sure it'd be a hit around the House! And, I know someone who really needs to hear it. Don't suppose you've got a parchment-copy I could have?"
				},
				{
					Cue = "/VO/Eurydice_0089",
					PostLineAnim = "ZagreusInteractEquip",
					PostLineAnimTarget = "Hero",
					Text =
					"Your Royal Majesty, you want my {#DialogueItalicFormat}song{#PreviousFormat}? You are aware it's called {#DialogueItalicFormat}'Good Riddance'{#PreviousFormat}, right? {#DialogueItalicFormat}Tsk{#PreviousFormat}, but sure, why not. If music's going to be playing in your House, it might as well be great. And let me give you something to go with it."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceProgressWithOrpheus_SongReaction01 =
			{
				SuperPriority = true,
				PlayOnce = true,
				UseableOffSource = true,

				-- [location: west hall north corner]
				TeleportToId = 514436,
				TeleportOffsetX = -60,
				TeleportOffsetY = -30,
				AngleTowardTargetId = 546960,
				RequiredAnyTextLines = { "OrpheusSingsAgain03", "OrpheusSingsAgain03_B" },
				{
					Cue = "/VO/Eurydice_0090",
					PreLineWait = 0.3,
					Text =
					"...What'd he say, hon? I mean about the song. Bet he loved it, didn't he! But, I don't know for sure. And I've been wondering, kind of a lot, I guess."
				},
				{
					Cue = "/VO/ZagreusField_2483",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"No need to wonder any longer. He sings it beautifully, around the House sometimes. It... has a sadder sound to it than when you sing, but... you've inspired him again. As you've done many times before, from what I know."
				},
				{
					Cue = "/VO/Eurydice_0091",
					Text =
					"Huh. So it's a hit, is what you're saying, then. I had a feeling about that one. Sometimes you put some words together and right then and there, you know that you've got something special."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			-- not singing; used RequiresFalseAmbientTrackName //
			EurydiceProgressWithOrpheus03 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus_SongReaction01", "EurydiceProgressWithOrpheus01" },
				IgnoreSourceStartEndAnimations = true,
				{
					Cue = "/VO/Eurydice_0092",
					Text =
					"What happens now, hon...? What I mean is... now you got me thinking about Orpheus again, so... what am I supposed to do with that?"
				},
				{
					Cue = "/VO/ZagreusField_2484",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Even if you can't be together right now, I hope it feels better knowing how much he cares for you. And I will try to pull some strings, like you said. I can't make promises where my father's concerned, but... I'll do everything I can."
				},
				{
					Cue = "/VO/Eurydice_0093",
					Text =
					"Well, what can I tell you? Thanks, Your Royal Majesty. That means a lot. No pressure, though. I've been all right without him all this time, and I will be all right, no matter what. If only he could say the same."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			EurydiceAboutSingersReunionQuestComplete01 =
			{
				SuperPriority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusWithEurydice01" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0097",
					Text =
					"Hey, listen here a moment, Hades kid. Look, I... Thank you. From the bottom of my heart. For bringing Orphy back to me again, and everything."
				},
				{
					Cue = "/VO/ZagreusField_2488",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Eurydice, you're more than welcome, really. You've helped me through the flames of hell, time after time. Least I could do is coax old Orpheus out of his private pit of despair so you and he could set things right between the two of you."
				},
				{
					Cue = "/VO/Eurydice_0098",
					Text =
					"Well, you're a real sweetheart, hon. You'll still be seeing Orphy all the time around your House, but now, I get to see him, too. Nice having something to look forward to, you know? Bet someone out there feels that about you."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceAboutSingersReunionQuestComplete02 =
			{
				SuperPriority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceAboutSingersReunionQuestComplete01", "ThanatosAboutSingersReunionQuestComplete01" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0181",
					Text =
					"Hey! What's the matter, Your Royal Majesty? You're looking kind of down. Normally you're all smiles, for whatever reason!"
				},
				{
					Cue = "/VO/ZagreusField_4279",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Oh, I... well, looking back, all this stuff between you and Orpheus, I realized... well, I hope I wasn't too pushy about the whole thing. It wasn't any of my business to pry into your personal life. I should have asked."
				},
				{
					Cue = "/VO/Eurydice_0182",
					Text =
					"Oh, that? {#DialogueItalicFormat}Pff{#PreviousFormat}, come on, don't even worry about it. If you were being too pushy, you better believe I would have put you back in your place, royalty or not. But hey, can't ever be too careful when it comes to people's past and feelings and stuff, right?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceAboutSingersReunionQuestComplete03 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusWithEurydice01" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0233",
					Text =
					"Got to tell you, hon. Orpheus sure is different since last he and I met. You know, back when he was still living and breathing and all."
				},
				{
					Cue = "/VO/ZagreusField_4287",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I think the experience of trying to rescue you, failing, dying, becoming court musician, refusing to sing, then being locked in solitary confinement, then finding out about you probably did a number on him. Why, is everything all right? You seemed to be getting along last I saw."
				},
				{
					Cue = "/VO/Eurydice_0234",
					Text =
					"Oh, we're getting along great! Better than ever. He used to be a bit more of a hotshot, but now it's like, he's a little more... what's the word... sensitive? Now I can always tell exactly what's on his mind."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceAboutSingersReunionQuestComplete04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceAboutSingersReunionQuestComplete01", "OrpheusTallTale06" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0235",
					Text =
					"Hey, Your Royal Majesty! I must say you've accomplished some truly amazing feats, according to Orphy at least! But don't worry. Your secret's safe with me."
				},
				{
					Cue = "/VO/ZagreusField_4288",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Oh, no, he's been boasting of my fabricated exploits to you? I've tried to tell him I was only joking with him but now he just thinks I'm being modest."
				},
				{
					Cue = "/VO/Eurydice_0236",
					Text =
					"That modesty won't get you anywhere with me, either, hon, Your Greatness. I'm honored to merely be in the presence of one with so many wild exploits to sing or speak of!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceAboutSingersReunionQuestComplete05 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceAboutSingersReunionQuestComplete01", "EurydiceGift08", "OrpheusGift08" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/ZagreusField_4293",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Hey did Orpheus really use to have curls, and... something called a tan? I've only ever seen him looking... well, how he does now."
				},
				{
					Cue = "/VO/Eurydice_0267",
					Text =
					"He did! And a tan is like... well, when you stay out in the hot sun up there long enough, your skin kind of starts to bake a little bit. But nicer than that sounds! Got to say, though, the years have been kind to Orphy, don't you think?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			-- if Orpheus hasn't mentioned her yet
			EurydiceMentionsOrpheus01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "OrpheusFirstMeeting", "OrpheusFirstMeeting_Alt" },
				RequiredAnyOtherTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B" },
				MinRunsSinceAnyTextLines = { TextLines = { "OrpheusFirstMeeting", "OrpheusFirstMeeting_Alt" }, Count = 8 },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus01", "EurydiceFirstMeeting01_C", "OrpheusMiscMeeting06", "OrpheusMiscMeeting06_B" },
				{
					Cue = "/VO/Eurydice_0077",
					Text =
					"Say, tell me something, there, Your Royal Majesty. You know a lot of shades. You wouldn't happen to know an Orpheus, would you? Spindly little thing, whiny voice? Heard he's officially serving in your court. Making music!"
				},
				{
					Cue = "/VO/ZagreusField_2474",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Of course I know Orpheus, we're mates! Wait, why do you ask?"
				},
				{
					Cue = "/VO/Eurydice_0078",
					Text =
					"You're mates, huh. Just as long as you don't count on him for anything. Hasn't even mentioned me, has he. Well if he ever does, you tell him I am doing great! I'm great."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMentionsOrpheus01_B =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceMentionsOrpheus01" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus02" },
				{
					Cue = "/VO/Eurydice_0179",
					Text = "What's the latest, hon, anything been happening down in your fancy House lately?"
				},
				{
					Cue = "/VO/ZagreusField_4278",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Well, you mentioned Orpheus... my father had him locked up for a little while for refusing to sing. Being court musician and all. But he's out now, and doing OK! I think."
				},
				{
					Cue = "/VO/Eurydice_0180",
					Text =
					"Not following instructions, huh. Sounds like Orpheus, all right. Well, if that's the most exciting thing you've got going on, then I haven't missed much being out here."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceAboutHermes01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift03", "HermesAboutEurydice01" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0175",
					Text = "Hey, what's up, hon? Say, you must know a lot of big shots, don't you? Other gods and all that?"
				},
				{
					Cue = "/VO/ZagreusField_4276",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I know a few. As a matter of fact, I heard recently from Hermes, wanted you to know he felt sorry for how things ended up. That something to do with when Orpheus went in here after you?"
				},
				{
					Cue = "/VO/Eurydice_0176",
					Text =
					"Oh, that's sweet of him! Nice enough guy, for an Olympian. Yeah, he was the one who dropped me off here in the first place. No hard feelings here, he was just doing his job. It was Orpheus who messed everything up."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceAboutNymphs01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceMiscMeeting04", "EurydiceGift03", "ArtemisAboutCallisto02" },
				{
					Cue = "/VO/Eurydice_0206",
					Text =
					"Sure don't see a lot of other nymphs around here, huh! We don't die too easy, most of us. Makes me feel all special!"
				},
				{
					Cue = "/VO/ZagreusField_4281",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I've never met another nymph, now that you mention it. Heard of a few! The goddess Artemis, sounds like she spends more time with nymphs than the other Olympians."
				},
				{
					Cue = "/VO/Eurydice_0207",
					Text =
					"That's what I heard! Though it's not like we all hang out, I mean, you've got the dryads, and the naiads, and the nereids, and the oceanids... pretty much every type of terrain up top, there's a kind of nymph who loves it! Maybe we need a name for Underworld nymphs, too."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			-- if you haven't discussed the SingersReunionQuest resolution w/ Persephone
			EurydiceAboutPersephone01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceAboutOrpheus02", "PersephoneMeeting02", "EurydiceGift06" },
				RequiredFalseTextLines = { "Ending01", "EurydiceAboutPersephone01_B", "EurydicePostEpilogue01" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/ZagreusField_4283",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Eurydice, did you by any chance ever meet a {#DialogueItalicFormat}Persephone {#PreviousFormat}during the whole thing when Orpheus came down to try to get you?"
				},
				{
					Cue = "/VO/Eurydice_0213",
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
					PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteSurprise", WaitTime = 4.7 },
					Text =
					"Oh, her? Yeah, she was with Hades Senior, why? Wait. {#DialogueItalicFormat}Whoa{#PreviousFormat}. Are you...? I thought..."
				},
				{
					Cue = "/VO/ZagreusField_4284",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "It's complicated. And, please keep it quiet. I was just wondering... what was she like? If you recall."
				},
				{
					Cue = "/VO/Eurydice_0214",
					Text =
					"Didn't get much of an impression, but I can tell you this: She had good taste in music! Orpheus and I, think we won her over with our little duet. Haven't seen or heard from her lately, though. Look, I hope everything's OK."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			-- if you have discussed the SingersReunionQuest resolution w/ Persephone
			EurydiceAboutPersephone01_B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PersephoneAboutSingersReunionQuest01", "Ending01" },
				MaxRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 20 },
				RequiredFalseTextLines = { "EurydiceAboutPersephone01", "EurydicePostEpilogue01" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/ZagreusField_4283",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Eurydice, did you by any chance ever meet a {#DialogueItalicFormat}Persephone {#PreviousFormat}during the whole thing when Orpheus came down to try to get you?"
				},
				{
					Cue = "/VO/Eurydice_0213",
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
					PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteSurprise", WaitTime = 4.7 },
					Text =
					"Oh, her? Yeah, she was with Hades Senior, why? Wait. {#DialogueItalicFormat}Whoa{#PreviousFormat}. Are you...? I thought..."
				},
				{
					Cue = "/VO/ZagreusField_4284",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "It's complicated. And, please keep it quiet. I was just wondering... what was she like? If you recall."
				},
				{
					Cue = "/VO/Eurydice_0268",
					Text =
					"Didn't get much of an impression, but I can tell you this: She had good taste in music! Orpheus and I, think we won her over with our little duet. Haven't seen or heard from her lately, though."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydicePostEpilogue01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OlympianReunionQuestComplete", "OrpheusWithEurydice01" },
				MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 3 },
				{
					Cue = "/VO/Eurydice_0215",
					Text =
					"Hey, everybody's saying Persephone... she's back? That sounds like a bit of good news, there, isn't that right, hon?"
				},
				{
					Cue = "/VO/ZagreusField_4285",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Hey, she is back, and yes, it is good news, thank you. She and I have a lot of making up for lost time left to do, though I think we're off to a pretty decent start."
				},
				{
					Cue = "/VO/Eurydice_0216",
					Text =
					"Well, that's a relief. And, you're still here! So I guess you've got more official business to take care of, which means I've still got somebody to taste-test for me every now and then!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydicePostEpilogue02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydicePostEpilogue01", "OrpheusWithEurydice01" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0217",
					Text =
					"Orphy tells me the Queen, she's been settling in just fine down at your House! Must be different having a lady like that around. How's Hades Senior taking it, if I may ask?"
				},
				{
					Cue = "/VO/ZagreusField_4286",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Oh, he's taking it... about as well as he's taken anything ever, now that you mention it. Still very much himself, mind you, but still... it's been a welcome change."
				},
				{
					Cue = "/VO/Eurydice_0218",
					Text =
					"Glad to hear it! Orphy always liked singing for an audience more than I did, and it sounds like she's a good one."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceAboutMusic01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusWithEurydice01", "OrpheusMusicProgress03", "EurydiceGift07" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0265",
					Text = "You ever play any music, or sing or anything yourself, Hades kid? It's good for you, you know!"
				},
				{
					Cue = "/VO/ZagreusField_4292",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I play a bit of the lyre, as a matter of fact! Orpheus himself gave me some pointers on it. Never really tried singing, though. I can't even imagine it, really."
				},
				{
					Cue = "/VO/Eurydice_0266",
					Text = "Well, might I recommend giving it a shot at some point? Who knows, you might be the next Orpheus!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceAboutOnions01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift04" },
				RequiredConsumablesThisRun =
				{
					Count = 1,
					Names =
					{
						"RoomRewardConsolationPrize",
					},
				},
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0195",
					Text =
					"You been snacking on {#DialogueItalicFormat}onions {#PreviousFormat}or something, there, hon? No offense or anything, but you smell like you ate a whole one of them raw."
				},
				{
					Cue = "/VO/ZagreusField_4280",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Erm{#PreviousFormat}, yes, but... wait. How else are you supposed to eat those things?"
				},
				{
					Cue = "/VO/Eurydice_0196",
					Emote = "PortraitEmoteSurprise",
					Text =
					"What, are you kidding me? You can grill them, sauté them, fry them, boil them, pickle them, roast them! Oh, hon. You've been missing out."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceAboutLove01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift08" },
				RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim", "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0263",
					Text =
					"You got anyone special in your life, by the way, hon? You seem like you'd be good for somebody out here."
				},
				{
					Cue = "/VO/ZagreusField_4291",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You know what, yes, I do, Eurydice. Things have moved so fast for me lately I barely stopped to think about it, though. It helps not having to go through everything alone... just knowing I'll see them again soon."
				},
				{
					Cue = "/VO/Eurydice_0264",
					Text =
					"Know what you mean. And hey, that's great! Long as you can still be yourself. I've known too many nymphs, their whole lives revolved around somebody they loved. I bet whoever it is that loves you... it's because of who you are."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceMiscMeeting01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift01" },
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B", "EurydiceFirstMeeting01_C" },
				{
					Cue = "/VO/ZagreusField_2491",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Eurydice, how long have you been down here, anyway, if you don't mind my asking? Seems like you're pretty settled in. It's quite a lovely place!"
				},
				{
					Cue = "/VO/Eurydice_0101",
					Text =
					"How long have I been down here, hon? {#DialogueItalicFormat}Huh{#PreviousFormat}! I don't have the faintest. You lose your sense of time once you're a shade, or maybe once there's not a sun or moon over your head. But yeah, I found myself a decent spot and fixed it up a bit!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMiscMeeting02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift01" },
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B", "EurydiceFirstMeeting01_C" },
				{
					Cue = "/VO/Eurydice_0102",
					Text =
					"You're just in time, Your Royal Majesty! Got something real good cooking right here that you are going to love. You hungry, yeah?"
				},
				{
					Cue = "/VO/ZagreusField_2492",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Am I ever. You're always so generous. And you're always cooking! And singing. Do you have many guests come by? Your place seems... somewhat off the beaten path."
				},
				{
					Cue = "/VO/Eurydice_0103",
					Text =
					"What, you think I get a lot of guests, here? {#DialogueItalicFormat}Haha{#PreviousFormat}, no, but I like cooking anyway! It's like singing, in a way. Keep getting better the more you try, turns out a bit different each time."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceMiscMeeting03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift01" },
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B", "EurydiceFirstMeeting01_C" },
				{
					Cue = "/VO/ZagreusField_2493",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Eurydice, how can you cook so much with all the searing heat around these parts? Has it been magma-flooded like this all the time?"
				},
				{
					Cue = "/VO/Eurydice_0104",
					Text =
					"The searing heat? {#DialogueItalicFormat}Haha{#PreviousFormat}, I am dead, Your Royal Majesty! Searing's just a cooking technique to me. Don't need to sleep, either! I can just keep cooking up a storm. It's not so bad!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMiscMeeting04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift01" },
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B", "EurydiceFirstMeeting01_C" },
				{
					Cue = "/VO/ZagreusField_2494",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "You know, I've never met a nymph before. You're closer to the gods than mortals, right?"
				},
				{
					Cue = "/VO/Eurydice_0105",
					Text =
					"Yeah, gods that can {#DialogueItalicFormat}die{#PreviousFormat}! How is that fair? Was just a stupid snake bite in my case, can you imagine something more embarrassing? You're just minding your business, and then {#DialogueItalicFormat}snap{#PreviousFormat}! You're dead, and on your way down here."
				},
				{
					Cue = "/VO/ZagreusField_2495",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "I... know the feeling better than you might expect."
				},
				{
					Cue = "/VO/Eurydice_0106",
					Text =
					"Well, I was going to end up here sooner or later. Might as well while I'm still looking good. Though, I guess you do kind of get to lock in whatever age when you register. Bet everybody dying of old age pushed that one through."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMiscMeeting05 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift01" },
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B", "EurydiceFirstMeeting01_C" },
				RequiredFalseTextLines = { "Ending01" },
				{
					Cue = "/VO/Eurydice_0107",
					Text =
					"What's your official business, anyway, Your Royal Majesty? Seems like it's bringing you through Asphodel an awful lot lately."
				},
				{
					Cue = "/VO/ZagreusField_2496",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"It's... look, the truth is, I am trying to get out of here. I've hit some stumbling blocks along the way, but, I think I will make it there, eventually."
				},
				{
					Cue = "/VO/Eurydice_0108",
					Text =
					"Oh really! Say no more, I know how that is. Hope the Fates will look the other way for you. Getting out of here, huh. Not thought of that myself in I don't know how long..."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMiscMeeting06 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift01" },
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_A", "EurydiceFirstMeeting01_B", "EurydiceFirstMeeting01_C" },
				{
					Cue = "/VO/Eurydice_0109",
					Text =
					"Of all the lava rocks in Asphodel, the Hades kid found this one once again, wouldn't you know! You got a map or something to this place, or what?"
				},
				{
					Cue = "/VO/ZagreusField_2497",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Don't know that a map would help me much since things keep shifting out here every single time. Though it is an interesting coincidence how I keep running into you."
				},
				{
					Cue = "/VO/Eurydice_0110",
					Text =
					"Coincidence? Come on, hon, you're a god. Someone out there is sending you my way. Maybe it's just the Fates. Ah well! I sure don't mind a little company. And I have lots to eat!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceAboutAcorn01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredKeepsake = "ShieldBossTrait",
				-- RequiresMaxKeepsake = true,
				{
					Cue = "/VO/ZagreusField_2489",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Eurydice, wanted to thank you once again for this enchanted acorn that you gave me. So this is what plants and things grow from, up on the surface?"
				},
				{
					Cue = "/VO/Eurydice_0099",
					Text =
					"Oh, not just any plants, hon! Trees! Big gnarled oaks and things. Some of them live hundreds of years! Way up there as mortals go. You take good care of it like that, maybe it'll grow to be something special for you, too!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceAboutAcorn02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceAboutAcorn01" },
				RequiredKeepsake = "ShieldBossTrait",
				RequiresMaxKeepsake = true,
				{
					Cue = "/VO/ZagreusField_2490",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Hey, this is sort of a weird question, but... this Evergreen Acorn, it's not... related to you, is it? Since, you know, you're... partly oak, aren't you?"
				},
				{
					Cue = "/VO/Eurydice_0100",
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
					PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteCheerful", DoShake = true, WaitTime = 8.4 },
					Text =
					"Yeah, I'm part oak, that's right. But maybe not the part you're thinking of, I mean, you think I would just hand you one of my babies or something? {#DialogueItalicFormat}Hahahaha{#PreviousFormat}, that's disgusting!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceAboutDistantMemory01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTrait = "DistanceDamageTrait",
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0177",
					Text =
					"Hold on, hon, is that... {#DialogueItalicFormat}huh{#PreviousFormat}! Almost felt like Orpheus was with you there. Would you listen to me? Must have been singing too many high notes, or something."
				},
				{
					Cue = "/VO/ZagreusField_4277",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"No, wait, you're onto something... I think you must have sensed Orpheus' Distant Memory! He gave it to me as a keepsake of our friendship. Though, something like this... I feel like it should belong to you."
				},
				{
					Cue = "/VO/Eurydice_0178",
					Text =
					"Oh, that's him in there all right! See, I never should have second-guessed myself. Well, you hang onto that, as I've got plenty memories of him already, thanks!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceLowHealth01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift03" },
				AreIdsNotAlive = { 554419 },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{
					Cue = "/VO/Eurydice_0202",
					Text =
					"Oh, hon, you look awful. What did you get yourself into? Here, one of these should make you feel a little better."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceLowHealth02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift01" },
				AreIdsNotAlive = { 554419 },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{
					Cue = "/VO/Eurydice_0203",
					Text = "Oh, you look like you've been through a lot, Hades kid. Maybe a decent bite to eat will help!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceLowHealth03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift01" },
				AreIdsNotAlive = { 554419 },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{
					Cue = "/VO/Eurydice_0204",
					Text =
					"{#DialogueItalicFormat}Oof{#PreviousFormat}, you're a mess, there, hon. You save your strength and see if this will do you any good."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceLowHealth04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift01" },
				AreIdsNotAlive = { 554419 },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{
					Cue = "/VO/Eurydice_0205",
					Text =
					"Hey, don't go bleeding on my floor, hon. I just cleaned the place! Take one of these, maybe it'll tide you over."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			OrpheusWithEurydice01 =
			{
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydice02 =
			{
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydice03 =
			{
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceEndTheme01 =
			{
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat01 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat02 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat03 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat04 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat05 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat06 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat07 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat08 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat09 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat10 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat11 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat12 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat13 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat14 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat15 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat16 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat17 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat18 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat19 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat20 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat21 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat22 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat23 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat24 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat25 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat01 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat02 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat03 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat04 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat05 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat06 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat07 =
			{
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
		},

		RepeatableTextLineSets =
		{
			EurydiceChat01 =
			{
				UseableOffSource = true,
				TeleportId = 514436,
				TeleportToId = 545534,
				TeleportOffsetX = 100,
				-- TeleportOffsetY = 50,
				AngleId = 514436,
				-- AngleTowardTargetId = 514554,
				{
					Cue = "/VO/Eurydice_0005",
					Text = "Why not have a quick bite of something to eat before you head on out, hon?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat02 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0006",
					Text = "Sing when you're happy, sing when you're not, Your Royal Majesty."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceChat03 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0007",
					Text = "Hey, it's the Hades kid! So what's it going to be this time, Your Royal Majesty?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat04 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0008",
					Text = "I'd say make yourself at home, hon, but you look like you got cooler places to be!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat05 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0009",
					Text = "You are just in time, Your Royal Majesty! Cooked up something special just for you."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat06 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0010",
					Text = "Why, Your Royal Majesty, you're back! Well, see you later!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat07 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0011",
					Text = "And here I was just thinking it's been too long since the Hades kid stopped by!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceChat08 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0012",
					Text = "So what'll it be this time, Your Royal Majesty, hmm?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat09 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0013",
					Text = "Oh you look positively famished, hon! Here let me help with that."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat11 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0014",
					Text = "You must be hungry, hon. Got something ought to keep you going!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat12 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0015",
					Text = "How nice of you to stop on by, Your Royal Highness! Here!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat13 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0016",
					Text = "How's it going lately, hon, you eating well and everything?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChat14 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0017",
					Text = "Just singing to myself and cooking up a storm. You know me, hon."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceChat15 =
			{
				UseableOffSource = true,
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0018",
					Text = "Eat up, hon! Not like I got other mouths to feed!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceChatExtra01 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift06" },
				{
					Cue = "/VO/Eurydice_0238",
					Text = "All's well in Asphodel, Your Royal Majesty! You take care of yourself. I'll be here."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra02 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift03" },
				{
					Cue = "/VO/Eurydice_0240",
					Text = "You want the best cooking in all of Asphodel, you know where to go!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra03 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0241",
					Text = "Hey, it's the Hades kid! What's it going to be this time, hm?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra04 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0242",
					Text = "Take care of yourself out there, all right, Your Royal Majesty?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra05 =
			{
				UseableOffSource = true,
				RequiresLastRunNotCleared = true,
				RequiredTextLines = { "EurydiceGift04" },
				{
					Cue = "/VO/Eurydice_0243",
					Text = "Don't let Hades Senior get you down, hon. Here."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra06 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift02" },
				{
					Cue = "/VO/Eurydice_0244",
					Text = "I know you've got important business to attend to, so thanks for checking in, Your Royal Majesty."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra07 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0245",
					Text = "You look like you're in a rush, though there's always time for a quick snack, right?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra08 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0246",
					Text = "Hey, welcome back, Your Royal Majesty, you're just in time!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra09 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0247",
					Text = "Been trying to perfect these recipes for I don't know how long!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra10 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0138",
					Text = "You look like you haven't eaten since you were here last!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra11 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0136",
					Text = "You're always welcome here Your Royal Majesty."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra12 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0135",
					Text = "I get you something for the road there, hon?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceChatExtra13 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Eurydice_0134",
					Text = "What's it going to be, Your Royal Majesty?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			-- mad at orpheus
			EurydiceMadChat01 =
			{
				Priority = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus04" },

				{
					Cue = "/VO/Eurydice_0019",
					Text = "You just be sure to tell that good-for-nothing Orpheus I'm looking good."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMadChat02 =
			{
				Priority = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus04" },

				{
					Cue = "/VO/Eurydice_0020",
					Text = "Hon, I'd ask how old what's-his-name is doing, but I don't even care!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceMadChat03 =
			{
				Priority = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus04" },

				{
					Cue = "/VO/Eurydice_0021",
					Text = "Bet you Orpheus hasn't had any strokes of musical genius lately, now, has he?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMadChat05 =
			{
				Priority = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus04" },

				{
					Cue = "/VO/Eurydice_0022",
					Text = "Better not be Orpheus putting you up to visiting here all the time like this."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMadChat06 =
			{
				Priority = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus04" },

				{
					Cue = "/VO/Eurydice_0023",
					Text = "This song's better than anything Orpheus ever came up with I can tell you that."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMadChat07 =
			{
				Priority = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus04" },

				{
					Cue = "/VO/Eurydice_0024",
					Text = "If you'll excuse me, Your Royal Majesty, I'm not exactly in the mood for an extended chat."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceMadChat09 =
			{
				Priority = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus04" },

				{
					Cue = "/VO/Eurydice_0025",
					Text = "You best have no more messages from no-good Orpheus this time."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceMadChat10 =
			{
				Priority = true,
				UseableOffSource = true,
				GiftableOffSource = true,
				RequiredAnyTextLines = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
				RequiredFalseTextLines = { "EurydiceAboutOrpheus04" },

				{
					Cue = "/VO/Eurydice_0026",
					Text = "Here, have a snack, hon, and tell Orpheus it was delicious."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			-- caring for Orpheus again
			EurydiceAintEvenMadChat01 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				{
					Cue = "/VO/Eurydice_0027",
					Text = "You keep an eye on Orpheus for me, all right, hon?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceAintEvenMadChat02 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				RequiredFalseTextLines = { "OrpheusWithEurydice01" },
				{
					Cue = "/VO/Eurydice_0028",
					Text = "Do one thing for me, hon. Make sure Orpheus knows I'll be right here."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceAintEvenMadChat03 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				RequiredFalseTextLines = { "OrpheusWithEurydice01" },
				{
					Cue = "/VO/Eurydice_0029",
					Text = "I've got to be honest with you, hon. Sometimes I kind of miss him."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceAintEvenMadChat04 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				MinRunsSinceAnyTextLines = { TextLines = { "EurydiceProgressWithOrpheus03" }, Count = 3 },
				RequiredFalseTextLines = { "OrpheusWithEurydice01" },
				{
					Cue = "/VO/Eurydice_0030",
					Text = "Sometime you'll visit me like this and Orpheus is going to be here too."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},

			EurydiceAintEvenMadChat05 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				{
					Cue = "/VO/Eurydice_0031",
					Text = "Don't let Orpheus get into too much trouble, won't you, hon?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice,
			},
			EurydiceAintEvenMadChat06 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0032",
					Text = "I'm fine here on my own, hon. But, I wouldn't mind if he was here."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceAintEvenMadChat07 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0197",
					Text = "Hope Orpheus is on the up-and-up down where you live."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceAintEvenMadChat08 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0198",
					Text = "I'd ask you to bring one of these to Orpheus, but they're no good unless they're perfectly fresh."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceAintEvenMadChat09 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusWithEurydice01" },
				{
					Cue = "/VO/Eurydice_0199",
					Text = "Orpheus tells me you've been a good friend. Thanks, hon."
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceAintEvenMadChat10 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusWithEurydice01" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0200",
					Text = "I love Orpheus and all, hon, but it's nice having a little time here to myself!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceAintEvenMadChat10 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceProgressWithOrpheus03" },
				{
					Cue = "/VO/Eurydice_0201",
					Text = "I know you can't stay long, hon, so eat up and stay safe out there, all right?"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},
			EurydiceAintEvenMadChat11 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusWithEurydice01" },
				AreIdsNotAlive = { 554419 },
				{
					Cue = "/VO/Eurydice_0239",
					Text = "I sing when Orpheus is here, I sing when he isn't. Simple!"
				},
				{
					Text = "Eurydice_OfferText02",
					Choices = PresetEventArgs.EurydiceBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedFunctionName = "MusicianMusic",
				OnQueuedFunctionArgs = mod.PresetEventArgs.SingingEurydiceSong01_Eurydice_SongFromStart,
			},

			OrpheusWithEurydiceMiscChat01 =
			{
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat02 =
			{
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat03 =
			{
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat04 =
			{
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat05 =
			{
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat06 =
			{
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat07 =
			{
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat08 =
			{
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat09 =
			{
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},

		},

		GiftTextLineSets =
		{
			EurydiceGift01 =
			{
				PlayOnce = true,
				{
					Cue = "/VO/ZagreusField_2498",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Eurydice, thank you for making me feel welcome in your pleasant home. Can't say the same for most places I've been lately. I've a small gift I wanted you to have."
				},
				{
					Cue = "/VO/Eurydice_0049",
					Text =
					"{#DialogueItalicFormat}Aw{#PreviousFormat}, that's awful sweet of you, Your Royal Majesty. Bringing me fresh ingredients like this! Know what, here's something for you, too, help keep you safe out there!"
				},
			},
			EurydiceGift02 =
			{
				PlayOnce = true,
				RequiredTextLines = { "EurydiceGift01" },
				{
					Cue = "/VO/Eurydice_0042",
					Text = "Just the ingredient I needed, hon, thank you so much! You know, you aren't near as bad as I'd heard!"
				},
				{
					Cue = "/VO/ZagreusField_2499",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, don't worry, we're still getting to know each other! Plenty of time for me to live up to my notorious reputation. Though I'm surprised you've heard of me at all."
				},
			},
			EurydiceGift03 =
			{
				PlayOnce = true,
				RequiredTextLines = { "EurydiceGift02" },
				{
					Cue = "/VO/Eurydice_0043",
					Text =
					"{#DialogueItalicFormat}Aw{#PreviousFormat}, for me, really, Your Majesty? This will be perfect for my latest recipes."
				},
				{
					Cue = "/VO/ZagreusField_2500",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "You know, of all the souls I've ever met, I feel like you put this stuff to the best possible use."
				},
			},
			EurydiceGift04 =
			{
				PlayOnce = true,
				RequiredTextLines = { "EurydiceGift03" },
				{
					Cue = "/VO/Eurydice_0044",
					Text = "You read my mind, hon! I go through this stuff awful fast sometimes."
				},
				{
					Cue = "/VO/ZagreusField_2501",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "And I, in turn, shall go through your incredible cooking awful fast, given the opportunity."
				},
			},
			EurydiceGift05 =
			{
				PlayOnce = true,
				RequiredTextLines = { "EurydiceGift04" },
				{
					Cue = "/VO/Eurydice_0045",
					Text = "Hey, mighty generous of you to keep me stocked up on this stuff, Your Royal Majesty!"
				},
				{
					Cue = "/VO/ZagreusField_2502",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"My pleasure! I'm always pleased to see you during my otherwise generally unfortunate travels in Asphodel."
				},
			},

			EurydiceGift06 =
			{
				PlayOnce = true,
				RequiredTextLines = { "EurydiceGift05" },
				{
					Cue = "/VO/Eurydice_0046",
					Text = "Thanks, Your Majesty! Though you're not going to get in trouble bringing me this stuff, are you?"
				},
				{
					Cue = "/VO/ZagreusField_2503",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Hah{#PreviousFormat}, no! I don't think I can get into more trouble at the moment. May this make your dishes that much more delectable!"
				},
			},
			EurydiceGift07 =
			{
				PlayOnce = true,
				RequiredTextLines = { "EurydiceGift06" },
				{
					Cue = "/VO/ZagreusField_4289",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Eurydice, I was thinking maybe this would benefit your culinary practice. Here, please."
				},
				{
					Cue = "/VO/Eurydice_0237",
					Emote = "PortraitEmoteSurprise",
					Text = "Whoa, this is Ambrosia! Hard to come by this stuff around here. You sure I can have this?"
				},
				{
					Cue = "/VO/ZagreusField_4290",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Absolutely! Least I could do for all your friendship and support. Always happy to hear your voice when I'm out here."
				},
			},
			EurydiceGift08 =
			{
				PlayOnce = true,
				RequiredTextLines = { "EurydiceGift07" },
				{
					Cue = "/VO/Eurydice_0048",
					Text =
					"I ever tell you you're a real sweetheart, hon? Because, if not, I'm telling you right now. Where would my culinary practice be if not for you?"
				},
				{
					Cue = "/VO/ZagreusField_2505",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I think your culinary practice would be every bit as extraordinary, though I'm pleased to have done small service to you in this great pursuit."
				},
				{
					Cue = "/VO/Eurydice_0208",
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Eurydice_01", Icon = "Keepsake_EurydiceSticker_Max" },
					Text =
					"Well, we both know you've done a lot more for me than that. I wasn't expecting to make any new friends here anytime soon, so all the more reason it's been a real treat to get to know you. If I may say? You're a hell of a guy, Your Royal Majesty."
				},
			},

		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- Thanks so much!
			{ Cue = "/VO/ZagreusField_2514" },
		},

		CharacterInteractions = {
			Rescue =
			{
				VoiceLines =
				{

					{
						RandomRemaining = true,
						PreLineWait = 0.35,
						RequiredFalseTextLinesThisRun = { "EurydiceFirstMeeting01_C", "EurydiceAboutOrpheus02" },
						-- SuccessiveChanceToPlayAll = 0.33,
						RequiredFalsePlayedThisRoom = { "/VO/Eurydice_0080" },
						RequiresAmbientMusicId = true,

						-- Enjoy!
						{ Cue = "/VO/Eurydice_0123" },
						-- That one's on me!
						{ Cue = "/VO/Eurydice_0124" },
						-- Here you go!
						{ Cue = "/VO/Eurydice_0125" },
						-- All yours!
						{ Cue = "/VO/Eurydice_0126" },
						-- Freshly made!
						{ Cue = "/VO/Eurydice_0127" },
						-- You got it!
						{ Cue = "/VO/Eurydice_0128" },
						-- Sure thing!
						{ Cue = "/VO/Eurydice_0129" },
						-- Sounds good!
						{ Cue = "/VO/Eurydice_0130" },
						-- For you!
						{ Cue = "/VO/Eurydice_0131" },
						-- You got it, hon!
						{ Cue = "/VO/Eurydice_0140" },
						-- Coming right up!
						{ Cue = "/VO/Eurydice_0141" },
						-- Sure thing, hon.
						{ Cue = "/VO/Eurydice_0142" },
						-- It'll be my pleasure.
						{ Cue = "/VO/Eurydice_0143" },
						-- Hah, I knew it!
						{ Cue = "/VO/Eurydice_0144" },
						-- Oh good choice there, hon.
						{ Cue = "/VO/Eurydice_0145" },
						-- You bet!
						{ Cue = "/VO/Eurydice_0146" },
						-- As you wish, Your Royal Majesty.
						{ Cue = "/VO/Eurydice_0147" },
						-- That can be arranged.
						{ Cue = "/VO/Eurydice_0148" },
						-- Sounds good, no problem!
						{ Cue = "/VO/Eurydice_0149" },
						-- Good choice!
						{ Cue = "/VO/Eurydice_0225" },
						-- Excellent.
						{ Cue = "/VO/Eurydice_0226" },
						-- Coming right up!
						{ Cue = "/VO/Eurydice_0227" },
						-- Try this!
						{ Cue = "/VO/Eurydice_0228" },
						-- Sure, here!
						{ Cue = "/VO/Eurydice_0229" },
						-- Careful, it's hot!
						{ Cue = "/VO/Eurydice_0230" },
						-- Here, enjoy!
						{ Cue = "/VO/Eurydice_0231" },
						-- Hope you like it!
						{ Cue = "/VO/Eurydice_0232" },
					},
					{
						RandomRemaining = true,
						UsePlayerSource = true,
						PreLineWait = 1,
						RequiresAmbientMusicId = true,
						-- SuccessiveChanceToPlay = 0.85,

						-- Why thank you!
						{ Cue = "/VO/ZagreusField_2513" },
						-- Thanks so much!
						{ Cue = "/VO/ZagreusField_2514" },
						-- Ooh thank you!
						-- { Cue = "/VO/ZagreusField_2515" },
						-- Mm really hit the spot.
						{ Cue = "/VO/ZagreusField_2516" },
						-- Feeling better already!
						{ Cue = "/VO/ZagreusField_2517" },
						-- Whew, that's good!
						{ Cue = "/VO/ZagreusField_2518" },
						-- Mmph, cheers!
						{ Cue = "/VO/ZagreusField_2519" },
						-- Ooh that's good.
						{ Cue = "/VO/ZagreusField_2520" },
						-- Wow that's good.
						{ Cue = "/VO/ZagreusField_2521" },
						-- So good.
						{ Cue = "/VO/ZagreusField_2522" },
					},
				},
			},
		},

		RepulseOnMeleeInvulnerableHit = 250,
		OnHitVoiceLines =
		{
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.25,
				PlayFromTarget = true,
				SuccessiveChanceToPlay = 0.25,
				CooldownTime = 10,
				RequiresAmbientMusicId = true,

				-- <Chuckle>
				{ Cue = "/VO/Eurydice_0166", PlayOnceThisRun = true },
				-- <Chuckle>
				{ Cue = "/VO/Eurydice_0167", PlayOnceThisRun = true },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.25,
				PlayFromTarget = true,
				SuccessiveChanceToPlay = 0.25,
				CooldownTime = 10,

				-- Come on.
				{ Cue = "/VO/Eurydice_0183", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
				-- Come on, now.
				{ Cue = "/VO/Eurydice_0184" },
				-- Not now.
				{ Cue = "/VO/Eurydice_0185", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
				-- Hey!
				{ Cue = "/VO/Eurydice_0186", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
				-- Please.
				{ Cue = "/VO/Eurydice_0187", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
				-- Let me sing.
				{ Cue = "/VO/Eurydice_0188", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
				-- Excuse me!
				{ Cue = "/VO/Eurydice_0189", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0187" }, },
				-- Eh!
				{ Cue = "/VO/Eurydice_0190", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
				-- Whatever!
				{ Cue = "/VO/Eurydice_0191", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
				-- Sorry, singing!
				{ Cue = "/VO/Eurydice_0192", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
				-- Really, hon?
				{ Cue = "/VO/Eurydice_0193", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
				-- Having fun?
				{ Cue = "/VO/Eurydice_0194", RequiredPlayedThisRoom = { "/VO/Eurydice_0166", "/VO/Eurydice_0167", "/VO/Eurydice_0183", "/VO/Eurydice_0184", "/VO/Eurydice_0189", "/VO/Eurydice_0191" }, },
			}
		},
	},
	-- Manually replaced PresetEventArgs.PatroclusGreeting/Muttering etc. with mod.PresetEventArgs.___ to make it easier
	-- Patroclus
	NPC_Patroclus_01 = {
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },

		UseText = "UseTalkToPatroclus",
		AnimOffsetZ = 160,
		EmoteOffsetX = -70,
		EmoteOffsetY = -160,
		Portrait = "Portrait_Patroclus_Default_01",
		Groups = { "NPCs" },

		ActivateRequirements = {
			RequiredMinCompletedRuns = 1,
		},

		SpawnUnthreadedEvents =
		{
			{
				-- Standup after question completion
				FunctionName = "GenericPresentation",
				Args =
				{
					SetAnimation = "PatroclusIdleStanding",
					OverwriteSourceKeys =
					{
						AnimOffsetZ = 205,
						Portrait = "Portrait_Patroclus_Neutral_01",
					},
					ActivateIds = { 563040 },
				},
				GameStateRequirements =
				{
					RequiredTextLines = { "MyrmidonReunionQuestComplete" },
				},
			},
		},

		InteractTextLineSets =
		{
			PatroclusFirstMeeting =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				{
					Cue = "/VO/Patroclus_0002",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					PreLineWait = 0.35,
					Text = "...Go on, stranger. Plenty more shades looking to fight with you out there."
				},
				{
					Cue = "/VO/ZagreusField_1704",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "I'm just passing through. You seem less warlike than the rest. May I ask your name, sir? I'm Zagreus."
				},
				{
					Cue = "/VO/Patroclus_0004",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text =
					"Names are there to be forgotten, stranger. You shouldn't be here. May the Fates favor your journey. But just in case they don't, here. Why don't you take this?"
				},
				{
					Text = "Patroclus_OfferText03",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			-- alt below
			PatroclusMeeting02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusMeeting02B" },
				RequiredCodexEntry =
				{
					EntryName = "NPC_Patroclus_01",
					EntryIndex = 1,
				},
				{
					Cue = "/VO/ZagreusField_1705",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Is something wrong, there, sir? I mean, shouldn't you be up and about, competing for eternal pride and glory and all that?"
				},
				{
					Cue = "/VO/Patroclus_0105",
					Text =
					"What's the use? Let's say we fought, if anybody asks. Now, go. I've no quarrel with you, besides. I'll just remain here, comfortably at rest, for some untold millennia, I guess. Have a nice... whatever time it is."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusMeeting02B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusMeeting02" },
				{
					Cue = "/VO/ZagreusField_1705",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Is something wrong, there, sir? I mean, shouldn't you be up and about, competing for eternal pride and glory and all that?"
				},
				{
					Cue = "/VO/Patroclus_0105",
					Text =
					"What's the use? Let's say we fought, if anybody asks, now go. I've no quarrel with you, besides. I'll just remain here, comfortably at rest, for some untold millennia, I guess. Have a nice... whatever time it is."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusMeeting03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusAboutMyrmidonReunionQuest01" },
				{
					Cue = "/VO/Patroclus_0106",
					Text = "Still toiling around within Elysium, I see. Battling my brethren, in the name of glory, is that it?"
				},
				{
					Cue = "/VO/ZagreusField_1706",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I'm heading for the surface. Though your brethren are slowing me down. Whether for glory or at my father's behest."
				},
				{
					Cue = "/VO/Patroclus_0107",
					Text =
					"Your father...? {#DialogueItalicFormat}Ah{#PreviousFormat}, that's right, but you're the Prince, aren't you. You must see plainly, then, what your birthright amounts to: You're no better off than any of us here. Now, go."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusMeeting04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting03", "PatroclusAboutAchilles01B", "PatroclusAboutAchilles01C_01", "PatroclusAboutAchilles01C_02" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01A", "PatroclusAboutAchilles06", "PatroclusMeeting06B" },
				{
					Cue = "/VO/Patroclus_0108",
					Text =
					"You again. I told you to stay clear of me. Your father's quite the big shot around here, but that means nothing to me, understand? Go, and tell him he can cast me in the pits of Tartarus, for all I care. It'd be a welcome change of pace from being put to pasture here."
				},
				{
					Text = "Patroclus_OfferText05",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusMeeting05 =
			{
				SuperPriority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusMeeting04" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles06", "PatroclusMeeting06B" },
				{
					Cue = "/VO/Patroclus_0109",
					Text = "I was unkind last time, stranger. Forgive my indiscretions there. Or don't. But I wished to apologize."
				},
				{
					Cue = "/VO/ZagreusField_1713",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Think nothing of it, sir. Though if there's something I could do to help, you'd tell me, wouldn't you?"
				},
				{
					Cue = "/VO/Patroclus_0110",
					Text =
					"You have no power to release me from this coil, I'm afraid. So just go on about your business, and leave me to mine."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			-- alt below
			PatroclusMeeting06 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusMeeting05" },
				RequiredFalseTextLines = { "PatroclusMeeting06B", "PatroclusGift08_A" },
				{
					Cue = "/VO/Patroclus_0111",
					Text =
					"Stranger, I am warning you: If you keep showing up like this, I'm going to have to find a new nickname for you."
				},
				{
					Cue = "/VO/ZagreusField_1714",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"No need to go out of your way, there, sir. We're just acquaintances. I don't know anything about you, either."
				},
				{
					Cue = "/VO/Patroclus_0112",
					Text =
					"And you are better off. This place is for the greatest of the Greeks. Do I seem like the sort to fit in, here? Go on and chat with Theseus, or someone of that sort."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusMeeting06B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusAboutAchilles03A", "PatroclusAboutAchilles03B" },
				RequiredFalseTextLines = { "PatroclusMeeting06", "PatroclusGift08_A" },
				{
					Cue = "/VO/Patroclus_0111",
					Text =
					"Stranger, I am warning you: If you keep showing up like this, I'm going to have to find a new nickname for you."
				},
				{
					Cue = "/VO/ZagreusField_1921",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"No need to go out of your way, there, sir. I rather feel like a stranger around here. I have no plans to extend my stay."
				},
				{
					Cue = "/VO/Patroclus_0112",
					Text =
					"And you are better off. This place is for the greatest of the Greeks. Do I seem like the sort to fit in, here? Go on and chat with Theseus, or someone of that sort."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			-- alt below
			PatroclusMeeting07 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting06", "PatroclusMeeting06B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete", "PatroclusMeeting07B" },
				{
					Cue = "/VO/Patroclus_0113",
					Text =
					"Tell me, stranger, if it pleases you. How is it you keep running into me...? I thought this the remotest corner of Elysium."
				},
				{
					Cue = "/VO/ZagreusField_1715",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"The ever-shifting chambers of the Underworld leave quite a bit to chance. I took our meetings merely for coincidence."
				},
				{
					Cue = "/VO/Patroclus_0114",
					Text =
					"When chance is too far-fetched to be believed, then it's the Fates at play. Or something else. I don't know whether to believe you, but I know that I want you to leave me, now."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusMeeting07B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "MyrmidonReunionQuestComplete" },
				RequiredFalseTextLines = { "PatroclusMeeting07" },
				{
					Cue = "/VO/Patroclus_0113",
					Text =
					"Tell me, stranger, if it pleases you. How is it you keep running into me...? I thought this the remotest corner of Elysium."
				},
				{
					Cue = "/VO/ZagreusField_1715",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"The ever-shifting chambers of the Underworld leave quite a bit to chance. I took our meetings merely for coincidence."
				},
				{
					Cue = "/VO/Patroclus_0422",
					Text = "When chance is too far-fetched to be believed, then it's the Fates at play. Or something else."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusMeeting08 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting06", "PatroclusMeeting06B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				{
					Cue = "/VO/Patroclus_0131",
					Text =
					"What is it this time, stranger? You're quite effective at locating me, but not so good at leaving me in peace."
				},
				{
					Cue = "/VO/ZagreusField_1729",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Just on one of my little jaunts through paradise is all, sir. Happened to be on the way toward my destination."
				},
				{
					Cue = "/VO/Patroclus_0132",
					Text =
					"You think this place a paradise? At least down in the depths, there are so many other souls with whom to share one's misery. No offense... I know that you're just passing through."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusMeeting09 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting06", "PatroclusMeeting06B" },
				{
					Cue = "/VO/Patroclus_0133",
					Text =
					"So, stranger. How goes willful disobedience of late? Would that I, too, had it within me to defy the gods."
				},
				{
					Cue = "/VO/ZagreusField_1730",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, you know, it's going. That I've been able to make it this far means I am getting somewhere, I suppose. No thanks to all your brethren in Elysium."
				},
				{
					Cue = "/VO/Patroclus_0134",
					Text =
					"No use trying to reason with my brethren here. Many of the shades whom you've encountered, why, I watched them throw away their lives when they were men. Yet still they seek to prove to one another and themselves that they are great warriors."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusMeeting10 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusAboutAchilles01A", "PatroclusAboutAchilles01B", "PatroclusAboutAchilles01C_01", "PatroclusAboutAchilles01C_02" },
				RequiredFalseTextLines = { "PatroclusAboutMyrmidonReunionQuest01" },
				{
					Cue = "/VO/ZagreusField_3504",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Say, isn't that the Lethe right nearby? You've been through so much, don't you ever... you could just drink deeply of the River of Forgetfulness, and be done with, no?"
				},
				{
					Cue = "/VO/Patroclus_0219",
					Text =
					"It has been rather tempting, yes. And I have taken sips, from time to time. But I've some memories I'm not quite ready to give up on, yet."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusMeeting11 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift04" },
				RequiredAnyTextLines = { "PatroclusMeeting06", "PatroclusMeeting06B", "PatroclusAboutMyrmidonReunionQuest01" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/ZagreusField_3510",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You ever want to travel past this glade, sir? Elysium in all its splendors... there's a lot to see. Sure you're all right?"
				},
				{
					Cue = "/VO/Patroclus_0409",
					Text =
					"I'm sure enough, stranger. I traveled far and wide whilst I drew breath. That got me rid of any wanderlust. This little corner suits me well, I think. I have the statue there, the river... it's quite nice."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			-- if you know patroclus' name but don't know his connection to achilles
			PatroclusAboutBracer01A =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting" },
				RequiredFalseTextLines = { "AchillesGift08", "AchillesGift06_A", "PatroclusAboutBracer01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D", "PatroclusAboutBracer01E", "PatroclusAboutAchilles02", "MyrmidonReunionQuestComplete" },
				RequiredTrait = "DirectionalArmorTrait",
				RequiredCodexEntry =
				{
					EntryName = "NPC_Patroclus_01",
					EntryIndex = 1,
				},
				{
					Cue = "/VO/Patroclus_0128",
					Emote = "PortraitEmoteSurprise",
					Text =
					"What is that on your wrist, there, stranger? Let me see, is that... a bracer of the myrmidons. But, then..."
				},
				{
					Cue = "/VO/ZagreusField_1727",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Wait, this? How did you know? It's just a keepsake from a friend."
				},
				{
					Cue = "/VO/Patroclus_0129",
					Text =
					"A keepsake? From a friend...? You tell your friend, then, that Patroclus waits for him, and that he holds no grudge, should he return to him."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			-- if you know patroclus' name and know his connection to achilles
			PatroclusAboutBracer01B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusFirstMeeting", "AchillesGift08", "AchillesGift06_A" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusAboutBracer01A", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D", "PatroclusAboutBracer01E", "MyrmidonReunionQuestComplete" },
				RequiredTrait = "DirectionalArmorTrait",
				RequiredCodexEntry =
				{
					EntryName = "NPC_Patroclus_01",
					EntryIndex = 1,
				},
				{
					Cue = "/VO/Patroclus_0128",
					Emote = "PortraitEmoteSurprise",
					Text =
					"What is that on your wrist, there, stranger? Let me see, is that... a bracer of the myrmidons. But, then..."
				},
				{
					Cue = "/VO/ZagreusField_1728",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "You recognize it, then. Of course. It's from Achilles, sir. He gifted it to me. He trained me."
				},
				{
					Cue = "/VO/Patroclus_0130",
					Text =
					"I see... a gift. Well, then, you let Achilles know Patroclus waits for him, and holds no grudge, should he return to him."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			-- if you don't know patroclus' name and don't know his connection to achilles
			PatroclusAboutBracer01C =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusMeeting02", "PatroclusAboutBracer01A", "PatroclusAboutBracer01B", "PatroclusAboutBracer01D", "PatroclusAboutBracer01E", "MyrmidonReunionQuestComplete" },
				RequiredTrait = "DirectionalArmorTrait",
				{
					Cue = "/VO/Patroclus_0128",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Emote = "PortraitEmoteSurprise",
					Text =
					"What is that on your wrist, there, stranger? Let me see, is that... a bracer of the myrmidons. But, then..."
				},
				{
					Cue = "/VO/ZagreusField_1727",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Wait, this? How did you know? It's just a keepsake from a friend."
				},
				{
					Cue = "/VO/Patroclus_0129",
					Text =
					"A keepsake? From a friend...? You tell your friend, then, that Patroclus waits for him, and that he holds no grudge, should he return to him."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			-- if you don't know patroclus' name but know his connection to achilles
			PatroclusAboutBracer01D =
			{
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting" },
				RequiredAnyTextLines = { "AchillesGift08", "AchillesGift06_A" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusMeeting02", "PatroclusAboutBracer01A", "PatroclusAboutBracer01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01E", "MyrmidonReunionQuestComplete" },
				RequiredTrait = "DirectionalArmorTrait",
				{
					Cue = "/VO/Patroclus_0128",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text =
					"What is that on your wrist, there, stranger? Let me see, is that... a bracer of the myrmidons. But, then..."
				},
				{
					Cue = "/VO/ZagreusField_1728",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "You recognize it, then. Of course. It's from Achilles, sir. He gifted it to me. He trained me."
				},
				{
					Cue = "/VO/Patroclus_0130",
					Text =
					"I see... a gift. Well, then, you let Achilles know Patroclus waits for him, and holds no grudge, should he return to him."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			-- if you know patroclus' name, and have discussed achilles already
			PatroclusAboutBracer01E =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusAboutAchilles01A", "PatroclusAboutAchilles01B", "PatroclusAboutAchilles01C_01", "PatroclusAboutAchilles01C_02" },
				RequiredFalseTextLines = { "PatroclusAboutBracer01A", "PatroclusAboutBracer01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D", "MyrmidonReunionQuestComplete" },
				RequiredTrait = "DirectionalArmorTrait",
				{
					Cue = "/VO/Patroclus_0171",
					Text =
					"What is that on your wrist, there, stranger? Let me see, is that... a bracer of the myrmidons. Achilles..."
				},
				{
					Cue = "/VO/ZagreusField_3472",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"This is his bracer, yes. You recognize it, then. Were you a myrmidon, yourself? I heard they were unstoppable."
				},
				{
					Cue = "/VO/Patroclus_0172",
					Text =
					"Well, now... if we were so unstoppable, we'd not be here, would we? May that bracer protect you more than its like protected our phalanxes."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutAchillesAspect01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAboutAchilles02" },
				RequiredTrait = "SpearTeleportTrait",
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0173",
					Text =
					"Must say that's an impressive spear you've got, there, stranger. Rather like the one Achilles held. He gave it to you, then? Followed him beyond the grave, only to be handed off."
				},
				{
					Cue = "/VO/ZagreusField_3473",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"It's... a bit more complicated than that, sir, though yes. This is the very same as he once wielded. I am honored to carry it now."
				},
				{
					Cue = "/VO/Patroclus_0174",
					Text =
					"I'll bet. Perhaps you'll even come to surpass the body count Achilles piled up with it back in his day, seeing as you seem to have limitless opportunity to use it."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutAchillesAspect02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAboutAchillesAspect01" },
				RequiredTrait = "SpearTeleportTrait",
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0175",
					Text =
					"You know, stranger, there was a time Achilles would have killed someone for taking up his spear. But there you are, like you own it."
				},
				{
					Cue = "/VO/ZagreusField_3474",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I don't think anybody owns this spear, sir. I'm hanging onto it for the time being. Though I don't think I'll be the last to do so."
				},
				{
					Cue = "/VO/Patroclus_0176",
					Text = "Oh, there's no need to get all philosophical about it. It's a killing weapon. Nothing more."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			-- if you don't know his connection to achilles already
			PatroclusAboutAchilles01A =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusMeeting06" },
				RequiredFalseTextLines = { "AchillesAboutPatroclus01A", "PatroclusAboutAchilles01B", "PatroclusAboutAchilles01C_01", "PatroclusAboutAchilles01C_02", "PatroclusAboutAchilles02" },
				{
					Cue = "/VO/Patroclus_0115",
					Text = "You mentioned something of your parentage, stranger. I have a question on that subject, if you please."
				},
				{
					Cue = "/VO/ZagreusField_1716",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "I please, sir. What's your question? Ask away."
				},
				{
					Cue = "/VO/Patroclus_0116",
					Text =
					"Your father must have records of the dead. So I was wondering if you might do for me a favor, and look up the whereabouts of someone I once knew."
				},
				{
					Cue = "/VO/ZagreusField_1717",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenial_Full",
					PreLineAnimTarget = "Hero",
					Text = "You've done a lot for me. The least I can do is ask around. Who is it that you're looking for?"
				},
				{
					Cue = "/VO/Patroclus_0117",
					Text =
					"I seek one called Achilles. Was rather famous once among the living, but among the dead, who knows. I thought he would be here, but he is not."
				},
				{
					Cue = "/VO/ZagreusField_1718",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineWait = 0.35,
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"...Achilles... I've heard the name before. And, {#DialogueItalicFormat}erm{#PreviousFormat}, can I ask why you wish to know of him? In case it happens to come up."
				},
				{
					Cue = "/VO/Patroclus_0118",
					Text = "It's just... I simply miss him, stranger. That is all."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			-- if you do know his connection to achilles
			PatroclusAboutAchilles01B =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting" },
				RequiredAnyTextLines = { "AchillesAboutPatroclus01A", "AchillesAboutPatroclus01B", "AchillesAboutPatroclus01C", "AchillesAboutPatroclus01D" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01C_01", "PatroclusAboutAchilles01C_02", "PatroclusAboutBracer01A", "PatroclusAboutBracer01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D", "PatroclusAboutAchilles02" },
				{
					Cue = "/VO/Patroclus_0119",
					Text = "Something the matter, there, stranger? Or have you come to torment me some more with idle chat?"
				},
				{
					Cue = "/VO/ZagreusField_1720",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You know Achilles, don't you, sir. You're Patroclus. Achilles... serves us at my home. He trained me. He sends you his regards and love. He says to tell you he is thinking of you always."
				},
				{
					Cue = "/VO/Patroclus_0120",
					Text =
					"...That name. So then you've seen him, have you. In your father's house. And want me to believe he said all that? {#DialogueItalicFormat}Tsk{#PreviousFormat}. You'll forgive me if I am a little skeptical. In life, I left Achilles. And in death, he left me. We're even. And we've nothing left to say to one another, now."
				},
				{
					Cue = "/VO/ZagreusField_1721",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"But, that can't possibly be true. There must be some misunderstanding here. You haven't spoken since you died?"
				},
				{
					Cue = "/VO/Patroclus_0121",
					Text =
					"We haven't, no. And I don't think we shall. But, you can humor him for me, I guess. Tell him I'm doing perfectly all right, won't you?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			-- if you do know his connection to achilles, specifically via the bracer conv with patroclus
			-- there is a near-copy of this below due to very similar but mutually exclusive requirements
			PatroclusAboutAchilles01C_01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting" },
				-- Bracer Requirements Here
				RequiredAnyTextLines = { "AchillesAboutPatroclus01C", "AchillesAboutPatroclus01D" },
				RequiredAnyOtherTextLines = { "PatroclusAboutBracer01A", "PatroclusAboutBracer01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				-- note: PatroclusAboutAchilles01C no longer exists but is noted here for backward compatibility
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusAboutAchilles01C_02", "PatroclusAboutAchilles01C", "PatroclusAboutAchilles02" },
				{
					Cue = "/VO/Patroclus_0119",
					Text = "Something the matter, there, stranger? Or have you come to torment me some more with idle chat?"
				},
				{
					Cue = "/VO/ZagreusField_1910",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Patroclus. I know who you are, sir. And, you know Achilles. He serves us at my home. He trained me. He sends you his regards and love. He says to tell you he is thinking of you always."
				},
				{
					Cue = "/VO/Patroclus_0159",
					PreLineWait = 0.35,
					Text =
					"...{#DialogueItalicFormat}Ah{#PreviousFormat}. So then you've seen him, have you. In your father's house. And want me to believe he said all that? {#DialogueItalicFormat}Tsk{#PreviousFormat}. You'll forgive me if I am a little skeptical. In life, I left Achilles. And in death, he left me. We're even. And we've nothing left to say to one another, now."
				},
				{
					Cue = "/VO/ZagreusField_1721",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"But, that can't possibly be true. There must be some misunderstanding here. You haven't spoken since you died?"
				},
				{
					Cue = "/VO/Patroclus_0121",
					Text =
					"We haven't, no. And I don't think we shall. But, you can humor him for me, I guess. Tell him I'm doing perfectly all right, won't you?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			-- very similar to the above but with a variant of the requirements
			PatroclusAboutAchilles01C_02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				-- Bracer Requirements Here
				RequiredTextLines = { "PatroclusFirstMeeting", "AchillesAboutPatroclus01B", },
				RequiredAnyTextLines = { "AchillesAboutPatroclus01C", "PatroclusAboutBracer01A", "PatroclusAboutBracer01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				RequiredAnyOtherTextLines = { "PatroclusAboutBracer01A", "PatroclusAboutBracer01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusAboutAchilles01C_01", "PatroclusAboutAchilles01C", "PatroclusAboutAchilles02" },
				{
					Cue = "/VO/Patroclus_0119",
					Text = "Something the matter, there, stranger? Or have you come to torment me some more with idle chat?"
				},
				{
					Cue = "/VO/ZagreusField_1910",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Patroclus. I know who you are, sir. And, you know Achilles. He serves us at my home. He trained me. He sends you his regards and love. He says to tell you he is thinking of you always."
				},
				{
					Cue = "/VO/Patroclus_0159",
					PreLineWait = 0.35,
					Text =
					"...{#DialogueItalicFormat}Ah{#PreviousFormat}. So then you've seen him, have you. In your father's house. And want me to believe he said all that? {#DialogueItalicFormat}Tsk{#PreviousFormat}. You'll forgive me if I am a little skeptical. In life, I left Achilles. And in death, he left me. We're even. And we've nothing left to say to one another, now."
				},
				{
					Cue = "/VO/ZagreusField_1721",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"But, that can't possibly be true. There must be some misunderstanding here. You haven't spoken since you died?"
				},
				{
					Cue = "/VO/Patroclus_0121",
					Text =
					"We haven't, no. And I don't think we shall. But, you can humor him for me, I guess. Tell him I'm doing perfectly all right, won't you?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			PatroclusAboutAchilles02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "AchillesAboutPatroclus02", "AchillesAboutPatroclus02B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				{
					Cue = "/VO/Patroclus_0122",
					Text =
					"So, how's Achilles doing lately, stranger? I figured you could tell me since you've all this access to him, and I don't."
				},
				{
					Cue = "/VO/ZagreusField_1722",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"He's forced to do my father's bidding. And sworn to secrecy, apparently. I don't pretend to fully understand. But, all in all, I think he's doing well. I hope... you'll see him for yourself."
				},
				{
					Cue = "/VO/Patroclus_0123",
					Text =
					"You don't fully understand, but hope. I see. Well, if you do get to the bottom of this little mystery at some point, you'll indulge me, won't you?"
				},
				{
					Cue = "/VO/ZagreusField_1723",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					Text = "I'll... see what I can do about it, sir."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			-- alt below
			PatroclusAboutAchilles03A =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "AchillesAboutPatroclus03" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles03B", "PatroclusGift04" },
				{
					Cue = "/VO/Patroclus_0124",
					Text =
					"He's never going to return to me, is he. He's in your father's service now. He's never getting out. Neither are you."
				},
				{
					Cue = "/VO/ZagreusField_1724",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "No. That's not acceptable to me. None of it."
				},
				{
					Cue = "/VO/Patroclus_0125",
					Text = "How bold. So what do you intend to do? You're leaving, anyway."
				},
				{
					Cue = "/VO/ZagreusField_1725",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					Text =
					"I'll figure something out. But you do something for me, in the mean time: Don't give in to what you're feeling now, all right? Achilles loves you still, like you don't know."
				},
				{
					Cue = "/VO/Patroclus_0126",
					Text =
					"Does he? I'm past the point of making promises, but... I pray the Fates help you in your endeavors, there."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutAchilles03B =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "AchillesAboutPatroclus03", "PatroclusGift04" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles03A" },
				{
					Cue = "/VO/Patroclus_0124",
					Text =
					"He's never going to return to me, is he. He's in your father's service now. He's never getting out. Neither are you."
				},
				{
					Cue = "/VO/ZagreusField_1724",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "No. That's not acceptable to me. None of it."
				},
				{
					Cue = "/VO/Patroclus_0125",
					Text = "How bold. So what do you intend to do? You're leaving, anyway."
				},
				{
					Cue = "/VO/ZagreusField_1725",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					Text =
					"I'll figure something out. But you do something for me, in the meantime: Don't give in to what you're feeling now, all right? Achilles loves you still, like you don't know."
				},
				{
					Cue = "/VO/Patroclus_0127",
					Text =
					"I'm past the point of making promises, but... thank you for your words. I love him still, in turn. I pray the Fates help you in your endeavors, there."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			PatroclusAboutAchilles04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "AchillesAboutPatroclus04" },
				{
					Cue = "/VO/Patroclus_0177",
					Text =
					"He's just as obstinate as ever, isn't he? Always refused to budge. He ever tell you of the war in which we fought? {#DialogueItalicFormat}I {#PreviousFormat}fought, I should say. He could have ended it. But he refused to take up arms."
				},
				{
					Cue = "/VO/ZagreusField_3475",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Achilles hasn't been particularly forthcoming about his mortal days, no. So he wouldn't fight? I've heard that mortals sometimes frown on that, but... why should he have fought if he didn't believe in the cause?"
				},
				{
					Cue = "/VO/Patroclus_0178",
					Text =
					"He {#DialogueItalicFormat}shared {#PreviousFormat}our cause! So what if it was not completely his? If not for his stubbornness, I... well... I would have come here just a bit later, I think."
				},
				{
					Cue = "/VO/ZagreusField_3476",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"He blames himself for what happened to you, you know. I figured he failed to defend you or something, not that... he didn't fight at all. Although, he said something about how, once you died, he shortly followed in a rage..."
				},
				{
					Cue = "/VO/Patroclus_0179",
					Text =
					"I wouldn't know a thing about that, stranger, for you see... I was already dead. Getting my place here in the afterlife all sorted out. Took quite some time, getting accustomed to all this."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutAchilles05 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "AchillesAboutPatroclusBackstory01", "PatroclusGift04" },
				{
					Cue = "/VO/Patroclus_0180",
					Text =
					"A question, if you don't mind, stranger? Because, I've had one nagging at me since we last discussed the subject. What, exactly, happened to Achilles, can you say? After I died, that is. I've heard the rumors, but... I don't trust any of this boastful lot."
				},
				{
					Cue = "/VO/ZagreusField_3477",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Well, from what I gathered, sir... after you fell, he was overcome with grief. And anger. He joined the war, just like you urged. And, single-handedly, he almost ended it."
				},
				{
					Cue = "/VO/Patroclus_0181",
					Text =
					"So then, he threw away his life. Soon enough after I lost mine. Yet, despite vanquishing an army on his own, he wound up in the lowest pits of Tartarus? Instead of here, among the great?"
				},
				{
					Cue = "/VO/ZagreusField_3478",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"You should know, sir. You were buried together. Your ashes, that is. It was his final request. As for how he came to be at my father's house, that's something I think he can best explain. And I will do everything I can to make sure that he has the opportunity."
				},
				{
					Cue = "/VO/Patroclus_0182",
					PreLineWait = 0.35,
					Text =
					"...Our ashes, you say. Together? {#DialogueItalicFormat}Tsk. {#PreviousFormat}The fool. We could have lived! Not been reduced to meal for the worms. But... I appreciate the information, stranger. Now... please, go."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutAchilles06 =
			{
				SuperPriority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAboutAchilles05" },
				{
					Cue = "/VO/Patroclus_0183",
					PreLineWait = 0.35,
					Text =
					"...Forgive me, stranger. For, in retrospect, I was too terse after you told me what became of my Achilles. Tales of his climactic battle, I had heard. The stuff about... his ashes, and my own... that was all new."
				},
				{
					Cue = "/VO/ZagreusField_3479",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"No need to even ask forgiveness, sir. Achilles is one of my closest friends, but.. he doesn't care to talk about himself. About those times. It must be very painful. For the both of you."
				},
				{
					Cue = "/VO/Patroclus_0184",
					Text =
					"Oh, we've all seen our share of pain, by now. But... knowing that he cared for me, in the end... {#DialogueItalicFormat}after {#PreviousFormat}the end... it dulls the feeling of it, for a bit. As do these conversations, I guess."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutMyrmidonReunionQuest01 =
			{
				SuperPriority = true,
				PlayOnce = true,
				UseableOffSource = true,
				StatusAnimation = "StatusIconWantsToTalkImportant",
				RequiredTextLines = { "AchillesAboutPatroclus05", "PatroclusAboutAchilles06", "PatroclusGift06" },
				{
					Cue = "/VO/Patroclus_0185",
					PreLineWait = 0.35,
					Text =
					"I've meant to ask you something, stranger. Would you mind doing me a favor, please? If it happens to come up along your path. Suppose I ought to tell it to you first, prior to asking a response."
				},
				{
					Cue = "/VO/ZagreusField_3480",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "No, of course, sir, what is it? What's on your mind?"
				},
				{
					Cue = "/VO/Patroclus_0186",
					Text =
					"If I know my Achilles, then he's being rather guarded, when it comes to this predicament we're in. How can somebody be so brash yet hate to take unnecessary risks? Just let him know I said to risk it all."
				},
				{
					Cue = "/VO/ZagreusField_3481",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Risk it all? Risk {#DialogueItalicFormat}what {#PreviousFormat}all? He wants what's best for you. He wouldn't want anything to happen."
				},
				{
					Cue = "/VO/Patroclus_0187",
					Text =
					"It's already long since happened. I daresay that, right now, provided what you've said is true, then... it appears we've more to gain than lose. Isn't fear for the weak?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			PatroclusWithAchilles01 =
			{
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredTextLines = { "MyrmidonReunionQuestComplete" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Achilles_0219",
					Speaker = "NPC_Achilles_Story_01",
					Portrait = "Portrait_MaleGhost_Default_01",
					SetFlagFalse = "AchillesReunionInProgress",
					Text =
					"I thought we might run into you, but... how strange to see you face-to-face out here, lad. To see this place myself. I still can't quite believe any of this..."
				},
				{
					Cue = "/VO/Patroclus_0188",
					Text =
					"He really can't. Though I keep telling him, it's true. Nothing's accomplished without risk, isn't that so? But, we of course have you to thank, stranger. Our troubles needn't have been your concern."
				},
				{
					Cue = "/VO/ZagreusField_3482",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Nonsense, sir. You're my friend. And Achilles... I don't know where I would even be, if not for you."
				},
				{
					Cue = "/VO/Patroclus_0189",
					Text =
					"Well, no need to get emotional, is there? We myrmidons, we're not the sentimental type. Achilles is simply on break, is all. From a demanding job. You've a demanding job as well, so here! My customary gift."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusWithAchilles02 =
			{
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0190",
					Text =
					"Well if it isn't the ward of Achilles, come to visit us. I don't know how I can ever repay you, stranger. I'm quite sure that it isn't possible."
				},
				{
					Cue = "/VO/Achilles_0220",
					Speaker = "NPC_Achilles_Story_01",
					Portrait = "Portrait_MaleGhost_Default_01",
					Text = "I reached more or less the same conclusion, Pat."
				},
				{
					Cue = "/VO/ZagreusField_3483",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"How about you just keep offering me those premium goods you have no interest in when I pass through, and we can call it even, sir?"
				},
				{
					Cue = "/VO/Patroclus_0191",
					Text =
					"That I had plans to do, regardless, though... if you should think of something else at any point, please do let either of us know."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusWithAchilles03 =
			{
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles02" },
				RequiredSeenRooms = { "C_Boss01" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0192",
					Text =
					"Good, there you are, stranger. Settle something for us quickly, hm? Would Achilles not make for the perfect Champion of Elysium? For I think almost anybody would be better than the current one."
				},
				{
					Cue = "/VO/Achilles_0221",
					Speaker = "NPC_Achilles_Story_01",
					Portrait = "Portrait_MaleGhost_Default_01",
					Text =
					"I think I'd rather maintain watch over a nearly empty hall than battle all the shades around here, Pat."
				},
				{
					Cue = "/VO/ZagreusField_3484",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I, too, would vastly prefer having to contend with Theseus rather than yourself, Achilles. Although, that's not to say I disagree that almost anybody would be better in the role than him."
				},
				{
					Cue = "/VO/Patroclus_0193",
					Text = "It seems, then, I am overruled. But I know Champion material when I see it, and I see it now."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			PatroclusAfterMyrmidonReunionQuest01 =
			{
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0194",
					Text =
					"Achilles is returned to work for now... but, waiting for him, knowing he'll return... rather than waiting for the sake of it, for nothing... such a different feeling, stranger. I'd forgotten it entirely, I think."
				},
				{
					Cue = "/VO/ZagreusField_3485",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I'm happy for the both of you. So, is everything all right, then? The circumstances under which you were separated in life... it's unimaginable, really. How does one move on from a thing like that?"
				},
				{
					Cue = "/VO/Patroclus_0195",
					Text =
					"Anger fades, I guess, stranger. Even the famous anger of Achilles. Anger burns hot, then burns out. What's left is a dull ache, but... underneath it, there was something else. It felt as though... well, I was still alive. That feeling... it's worth holding onto."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAfterMyrmidonReunionQuest02 =
			{
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAfterMyrmidonReunionQuest01" },
				RequiredAnyTextLines = { "PatroclusMeeting06", "PatroclusMeeting06B" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0196",
					Text =
					"It's good to see you again, stranger. You don't mind if I keep calling you that, no? Couldn't find a better nickname for you, after all. Besides... I don't want to cause you any trouble."
				},
				{
					Cue = "/VO/ZagreusField_3486",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Don't mind at all, Patroclus, sir. Coming from you I consider it a term of endearment."
				},
				{
					Cue = "/VO/Patroclus_0393",
					Text = "You have my thanks for that..."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			PatroclusPostEnding01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAfterMyrmidonReunionQuest01", "Ending01" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0413",
					Text =
					"Achilles tells me that you're here to stay, at least for now, stranger. A welcome bit of news. Assuming, of course, that it's for the best, for you?"
				},
				{
					Cue = "/VO/ZagreusField_4294",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I think so, sir. I'll still be passing through, and visiting the surface every opportunity I get. But it seems my place really is here. Besides, it means getting to see you every now and then, like this."
				},
				{
					Cue = "/VO/Patroclus_0414",
					Text = "That sounds agreeable to me. Then, you take care."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			PatroclusPostEpilogue01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OlympianReunionQuestComplete" },
				RequiredAnyTextLines = { "PatroclusAboutMyrmidonReunionQuest01", "PatroclusGift05" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0415",
					Text =
					"There's been considerable talk of late about the Queen Persephone, stranger. Your mother, it would seem? Sounds to me your tale's almost as complicated as my own."
				},
				{
					Cue = "/VO/ZagreusField_4295",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"It's a long story, at this point, indeed. But yes. The Queen... my mother... she's returned. And, it's been really good, having her back."
				},
				{
					Cue = "/VO/Patroclus_0416",
					Text = "I can only begin to imagine. May she help govern all of this with wisdom and with grace."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			PatroclusAboutKeepsake01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift01" },
				RequiredTrait = "ShieldAfterHitTrait",
				{
					Cue = "/VO/ZagreusField_3499",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"This spearpoint that you gave me, sir. It's been quite useful, though I have to ask you... is there any particular significance to it? Most spearpoints aren't imbued with power such as this."
				},
				{
					Cue = "/VO/Patroclus_0213",
					Text =
					"Oh, that. Just something I'd been meaning to get rid of, but... it can be difficult, discarding trifles from the past. Knowing it's provided you some benefit is welcome news."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutKeepsake02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAboutKeepsake01" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				{
					Cue = "/VO/ZagreusField_3500",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Did you once wield a spear yourself, sir? In your fighting days?"
				},
				{
					Cue = "/VO/Patroclus_0214",
					Text =
					"Did I once wield a spear? You could say that I did. I had my moments with it, anyway. Even once slew a demigod! He's probably somewhere about. Quite awkward, running into those you killed. But in Elysium it's all taken in stride."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutWar01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAboutAchilles04" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/ZagreusField_3494",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Whatever happened with that war you mentioned, sir? If you don't mind my asking."
				},
				{
					Cue = "/VO/Patroclus_0205",
					Text =
					"Well, truth be told, here, stranger... I do mind. You speak as one who's not experienced a war. Those of us who survived... or, you know what I mean... we do bear some responsibility to history. But, all the same, it's not a time and place to which I would return. I trust you'll understand."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutYoungAchilles01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAboutMyrmidonReunionQuest01" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/ZagreusField_3495",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "I always wondered, sir. What was Achilles like...? During his youth, I mean. If you can say."
				},
				{
					Cue = "/VO/Patroclus_0206",
					FontSize = 24,
					Text =
					"{#DialogueItalicFormat}Hah{#PreviousFormat}. How to describe what somebody was like? Everyone who saw him on the battlefield agreed he was magnificent, stranger. His allies and his enemies alike. But, there was more to him, I think. A certain outlook. A sense of justice. I knew him before he was a warrior. Only reason I suppose I liked him."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutTheseus01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift03" },
				RequiredKillsLastRun = { "Theseus" },
				RequiredKills = { Theseus = 15, Theseus2 = 1 },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0207",
					Text =
					"I heard you've vanquished Theseus however many times of late. Or... someone matching your description has, stranger. Almost had to laugh when I heard that. Though, I suspect he hasn't learnt a thing."
				},
				{
					Cue = "/VO/ZagreusField_3496",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"What, you know him? Though, yes, he does seem rather set in his ways. Convinced himself that I'm some sort of demon from the lowest depths. Which... well, it's partly true, I guess."
				},
				{
					Cue = "/VO/Patroclus_0208",
					Text =
					"You're quite notorious, around these parts. The tales of your father's monstrous son, kept under lock and key within his House. Fear and ignorance make for great stories, no?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusAboutTheseus02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift01", "TheseusExtremeMeasures01" },
				RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 3 },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0209",
					Text =
					"Couldn't help but hear the rattling of battle chariots of late. Raucous laughter and the like. You've really riled up the locals this time, stranger."
				},
				{
					Cue = "/VO/ZagreusField_3497",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "Must be Theseus and his fancy Macedonian. So he's been joyriding about in that thing? Showing it off?"
				},
				{
					Cue = "/VO/Patroclus_0210",
					Text =
					"Your arrivals are becoming a bit of an event, I'd say. And, yes, the Champion and his bull friend are likely at the center of it. You'll have to forgive me that I've no intent on attending your contests, but... well, here."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusAboutTheseus03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAboutTheseus01", "PatroclusAboutMinotaur01" },
				MinRunsSinceAnyTextLines = { TextLines = { "PatroclusAboutTheseus01", "PatroclusAboutTheseus02" }, Count = 2 },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/ZagreusField_3506",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You know, for such a loudmouth obnoxious braggart, Theseus does seem to have formed a strong kinship with the Bull of Minos, hasn't he. Are they truly as inseparable as they seem? I feel bad for the Bull."
				},
				{
					Cue = "/VO/Patroclus_0403",
					Text =
					"Sometimes it's our differences that make us drawn to one another, no? And, at other times, there's no accounting for taste. I often don't know which is which, and they can have each other, far as I'm concerned."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutMinotaur01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift03" },
				RequiredKillsThisRun = { "Minotaur" },
				RequiredKills = { Minotaur = 5 },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0211",
					Text =
					"Even the Bull of Minos couldn't stop you, huh. That's one whose way I would stay out of if I could, but... well, you'd not be here if you couldn't handle yourself, I guess."
				},
				{
					Cue = "/VO/ZagreusField_3498",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You heard I battled with Asterius, here, sir? I thought you kept more to your own devices. Weren't much for conversation with the other shades."
				},
				{
					Cue = "/VO/Patroclus_0212",
					Text =
					"Oh, you're correct in that assessment, stranger. But, as you've seen, I've no ability to stop others from coming and going as they please. So I do tend to hear a thing or two from passersby."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},

			PatroclusAboutHeroes01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusAboutAchilles01A", "PatroclusAboutAchilles01B", "PatroclusAboutAchilles01C_01", "PatroclusAboutAchilles01C_02" },
				RequiredTextLines = { "PatroclusGift05" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/ZagreusField_3505",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You must have met so many great heroes in your day, having fought alongside Achilles... do you still keep in touch with any of them, here?"
				},
				{
					Cue = "/VO/Patroclus_0402",
					Text =
					"Great heroes... haven't you seen, by now, what they are like, stranger? Not all entirely what they're cracked up to be. But, there were good ones, yes. Suppose they're mostly keeping to themselves. Like I am here. Perhaps we'll run into each other, down the line."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutGods01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift06" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0404",
					Text =
					"Never quite considered... you're related to the gods upon Olympus, aren't you, stranger...? I should be far more careful around you."
				},
				{
					Cue = "/VO/ZagreusField_3507",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"What do you mean by that, sir? Though, yes, my father being who he is, it means I have a lot of uncles, cousins, and the like, up on the surface, there."
				},
				{
					Cue = "/VO/Patroclus_0405",
					Text =
					"Well... you would be wise to watch yourself, with some of them, I think. Don't get on anyone's bad side, if you can help it. Which, when I yet lived, none of us could."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			-- alt below
			PatroclusAboutLove01_A =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim", "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
				RequiredAnyOtherTextLines = { "PatroclusGift08", "PatroclusGift08_A" },
				RequiredFalseTextLines = { "PatroclusAboutLove01_B" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0406",
					Text =
					"You ever been in love with someone, stranger? Might be a mortals-only thing, for all I know. You gods have strange relationships, I hear."
				},
				{
					Cue = "/VO/ZagreusField_3508",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "I have been, sir. Or, I should say, I am."
				},
				{
					Cue = "/VO/Patroclus_0407",
					Text =
					"Ah, that's good. Cling to the feeling, then. And if you lose it... reach for it. Search for it, no matter what, all right? Because, without it... well, there isn't much of a comparison, I think."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutLove01_B =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				RequiredAnyOtherTextLines = { "PatroclusGift08", "PatroclusGift08_A" },
				RequiredFalseTextLines = { "PatroclusAboutLove01_A", "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim", "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0406",
					Text =
					"You ever been in love with someone, stranger? Might be a mortals-only thing, for all I know. You gods have strange relationships, I hear."
				},
				{
					Cue = "/VO/ZagreusField_3509",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Not sure that I have been, sir. I understand it's one of those things where, you'll know it when it happens."
				},
				{
					Cue = "/VO/Patroclus_0408",
					Text =
					"Perhaps you shall, someday or night down here. The feeling comes with pain, and plenty of it, but... the pain is worth it, in my limited experience. And once you find that feeling, cling to it. As tightly as you can. If you don't mind my saying."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},

			PatroclusAboutTrinkets01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift05" },
				RequiredInactiveMetaUpgrade = "ExtraChanceReplenishMetaUpgrade",
				{
					Cue = "/VO/Patroclus_0215",
					Text = "Well, what's it going to be this time, stranger? The HydraLite? Maybe the Kiss of Styx?"
				},
				{
					Cue = "/VO/ZagreusField_3501",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You sure you don't need any of this stuff, sir? I really appreciate it, but... I don't want to take it for granted."
				},
				{
					Cue = "/VO/Patroclus_0216",
					Text =
					"Oh, come, this is Elysium. Taking such things for granted is the point. We gloried shades receive our stipend of the finest goods, so we can battle till we've had our fill. But I've already had my fill, I think."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutFishing01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting", "PatroclusGift04" },
				RequiredHasFish = true,
				RequiresFishingPointInRoom = true,
				{
					Cue = "/VO/Patroclus_0203",
					Text =
					"You've ample time for fishing, have you, stranger? And here I thought you'd more important business to attend to, though it's not for me to judge, I guess."
				},
				{
					Cue = "/VO/ZagreusField_3493",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I'll have you know some of us take matters of fishing very seriously, sir! Besides... helps take my mind off having to fight your Elysian brethren nonstop."
				},
				{
					Cue = "/VO/Patroclus_0204",
					Text =
					"Oh I'd not take your mind off this fight if it's one that you hope to win, stranger. I once took my mind off a fight, and, well... I wound up here."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMuttering,
			},
			PatroclusAboutLegendary01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "AchillesGift07_A" },
				RequiredPlayed = { "/VO/ZagreusField_3584" },
				RequiredTrait = "AchillesPatroclusAssistTrait",
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/ZagreusField_3502",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I have to tell you, sir, it was a real sight to see you fighting alongside Achilles. You two were amazing!"
				},
				{
					Cue = "/VO/Patroclus_0217",
					Text =
					"Oh, I'm a little rusty. But he's not. Still very much in tiptop shape, except more able to control his temper, I should think."
				},
				{
					Cue = "/VO/ZagreusField_3503",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Don't sell yourself so short! Though, I thought you laid down your spear forever. Why choose to fight again?"
				},
				{
					Cue = "/VO/Patroclus_0218",
					Text =
					"Achilles swayed me into realizing some activity may be quite good for me. And besides... if we can aid you in a pinch, that's worth my while."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusLowHealth01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting", "PatroclusGift01" },
				RequiredFalseTextLines = { "PatroclusWithAchilles01" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{
					Cue = "/VO/Patroclus_0410",
					Text =
					"You look positively beaten, there, stranger. Let's see if we can't get you on your feet. For I can do the listless sitting for the both of us."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusLowHealth02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting", "PatroclusGift01" },
				RequiredMaxHealthFraction = 0.25,
				RequiredMaxLastStands = 1,
				{
					Cue = "/VO/Patroclus_0411",
					Text =
					"Oh, you look terrible, if I may say, stranger. Perhaps one of these trinkets can be of some small help."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},

		},

		RepeatableTextLineSets =
		{
			PatroclusChat01 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0005",
					Text = "You again? Then, here. Fates know I'll not be needing this."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat02 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0006",
					Text = "Move right along, stranger. Let's skip the pleasantries."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusChat03 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0007",
					Text = "And here I thought you must have given up already."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat04 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				{
					Cue = "/VO/Patroclus_0008",
					Text = "Enjoying the splendors of Elysium, yet, stranger?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat05 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0009",
					Text = "Don't let me interrupt your stay in paradise, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusChat06 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				{
					Cue = "/VO/Patroclus_0010",
					Text = "Returned to take more of these trinkets off my hands, have you?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat07 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				{
					Cue = "/VO/Patroclus_0011",
					Text = "Oh, it's only you again, stranger. It's only me, as well."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat08 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0012",
					Text = "Take one of these and then just leave me be, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusChat09 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0013",
					Text = "I'd like to be alone again, stranger, so you go on ahead."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusChat10 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0014",
					Text = "No need to linger with me, stranger. Go."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusChat11 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				{
					Cue = "/VO/Patroclus_0015",
					Text = "Why your path keeps on crossing mine, I've not the slightest clue."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat12 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0016",
					Text = "Some other time, stranger. Right now I'm preoccupied with sitting here."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat13 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "PatroclusAboutMyrmidonReunionQuest01" },
				{
					Cue = "/VO/Patroclus_0017",
					Text = "There's nothing you can do to help me, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusChat14 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0018",
					Text = "Can't you see I'm busy whiling away for all eternity?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusChat15 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				{
					Cue = "/VO/Patroclus_0019",
					Text = "A fine whatever time it is to you, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat16 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0020",
					Text = "You haven't lost your will just yet, I see."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusChat17 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0021",
					Text = "Expecting I'll still be right here next time, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat18 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0022",
					Text = "Just go, already, towards your next death or whatever else awaits."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusChat19 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0023",
					Text = "You're back again, I see. And just in time to take one of these blasted things from me."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			-- relationship improved
			PatroclusChat19 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift03" },
				RequiredAnyTextLines = { "PatroclusAboutAchilles03A", "PatroclusAboutAchilles03B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0038",
					Text = "I'll wait for him, however long it takes. You tell him that."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat20 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift04", "PatroclusAboutAchilles02" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0039",
					Text = "I pray Achilles is surviving well. And same for you."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat21 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift03" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0040",
					Text = "It's good of you to visit, though there's little I can offer in return."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat22 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift02" },
				{
					Cue = "/VO/Patroclus_0041",
					Text = "Please make yourself at home here in this corner of eternal paradise."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat23 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusAboutMyrmidonReunionQuest01" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0042",
					Text = "Do let Achilles know I'm doing well, and I'll be ever patient, here."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			-- additional chat
			PatroclusChat24 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0048",
					Text = "I doubt there's much that I can do for you."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat25 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0051",
					Text = "You're interfering with my quiet time, you know."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat26 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0052",
					Text = "Yes, what is it, this time?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat27 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0053",
					Text = "Here's what I have that I can spare right now."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat27 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				{
					Cue = "/VO/Patroclus_0054",
					Text = "Might I somehow assist you, then?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat28 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting05", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles06" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0003",
					Text = "Oh good, somebody's here to save me from myself."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat29 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting05", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles06" },
				{
					Cue = "/VO/Patroclus_0055",
					Text = "How can I be of use to you, stranger?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat30 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting05", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles06" },
				{
					Cue = "/VO/Patroclus_0050",
					Text = "I've no shortage of time to spare, I guess."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat31 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				{
					Cue = "/VO/Patroclus_0160",
					Text = "Ah, just a stranger passing through, I see."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat32 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0161",
					Text = "Not in the mood for conversation now, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat33 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0162",
					Text = "Go on about your business, there, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat34 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				{
					Cue = "/VO/Patroclus_0163",
					Text = "Good fortune getting out of here, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat35 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting03", "PatroclusGift04" },
				{
					Cue = "/VO/Patroclus_0164",
					Text = "Here's something for the journey still to come."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat36 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting03", "PatroclusAboutTheseus01" },
				RequiredSeenRooms = { "C_Boss01" },
				{
					Cue = "/VO/Patroclus_0165",
					Text = "Prepared to face the champion, soon, stranger?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat37 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting03", "PatroclusAboutTheseus01" },
				RequiredSeenRooms = { "C_Boss01" },
				{
					Cue = "/VO/Patroclus_0166",
					Text = "May this aid you against the champion, out there."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat38 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift04" },
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredSeenRooms = { "C_Boss01" },
				{
					Cue = "/VO/Patroclus_0167",
					Text = "Be careful with my brethren out there, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat39 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredSeenRooms = { "C_Boss01" },
				{
					Cue = "/VO/Patroclus_0168",
					Text = "Battle with glory and all that, all right, stranger?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat40 =
			{
				-- Priority = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredSeenRooms = { "C_Boss01" },
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },
				{
					Cue = "/VO/Patroclus_0169",
					Text = "I would prefer to be alone for now, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusChat41 =
			{
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutAchilles01B" },
				RequiredSeenRooms = { "C_Boss01" },
				{
					Cue = "/VO/Patroclus_0170",
					Text = "Just don't go starting any wars you don't intend to finish, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},

			-- lines that play if you haven't revealed
			PatroclusStandoffish01 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0024",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "Leave me be to my eternal paradise, damn you."
				},
				{
					Text = "Patroclus_OfferText03",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusStandoffish02 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0025",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "I shall not take up arms again, stranger, not even against you."
				},
				{
					Text = "Patroclus_OfferText03",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusStandoffish03 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0026",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "Begone from here, we've nothing to discuss."
				},
				{
					Text = "Patroclus_OfferText03",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusStandoffish04 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0027",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "Go haunt some other corner of this realm; this one is mine."
				},
				{
					Text = "Patroclus_OfferText03",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusStandoffish05 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0028",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "I thought I told you to leave me alone?"
				},
				{
					Text = "Patroclus_OfferText04",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusStandoffish06 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0029",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "Do I look like I want to talk to you?"
				},
				{
					Text = "Patroclus_OfferText04",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusStandoffish07 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0045",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "What is it that you want from me this time?"
				},
				{
					Text = "Patroclus_OfferText04",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusStandoffish08 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0046",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "What would it take for you to leave me be?"
				},
				{
					Text = "Patroclus_OfferText04",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusStandoffish09 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0052",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "Yes, what is it this time?"
				},
				{
					Text = "Patroclus_OfferText04",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},
			PatroclusStandoffish10 =
			{
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredFalseTextLines = { "PatroclusMeeting02", "PatroclusMeeting02B", "AchillesAboutPatroclus01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D" },
				{
					Cue = "/VO/Patroclus_0049",
					Speaker = "NPC_Patroclus_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Text = "What would you have me do?"
				},
				{
					Text = "Patroclus_OfferText04",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusGreetings,
			},

			PatroclusReunionChat01 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0315",
					Text = "It's good to see you once again, stranger. Now, here."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat02 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0316",
					Text = "We're faring well enough, and may you fare the same."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat03 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0317",
					Text = "You've come to be a welcome sight, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat04 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0318",
					Text = "May you prevail in your battles still to come, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			-- renamed, was 5
			PatroclusReunionChat05A =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0319",
					Text = "We were just wondering when you'd arrive, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat05 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0320",
					Text = "Achilles and I were just passing the time I guess."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat06 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0321",
					Text = "I and Achilles here still have a lot of catching up to do."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat07 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0322",
					Text = "Fight like my friend here used to fight, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat08 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0323",
					Text = "May all your fears leave you behind once you walk past that door."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat09 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				RequiredAnyTextLines = { "PatroclusMeeting03", "PatroclusAboutTheseus01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0324",
					Text = "You'll show that champion of ours, won't you, stranger?"
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat10 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift06" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0325",
					Text = "I'm pleased to be of any help at all."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat11 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0326",
					Text = "First a visit from Achilles, and now you."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat12 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0327",
					Text = "Please stay as long as you would like here in our little glade."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat13 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0328",
					Text = "Take caution with our battle-loving brethren around here."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat14 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift05" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0329",
					Text = "If you can make yourself at home in such a place, please do, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			-- renamed, was 15
			PatroclusReunionChat15A =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift05" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0330",
					Text = "Just restocked on these battle-trinkets, if you'd like one, stranger."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			-- renamed, was 15
			PatroclusReunionChat15B =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift05" },
				RequiredAnyTextLines = { "PatroclusMeeting03", "PatroclusAboutTheseus01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0331",
					Text = "You've become quite the talk of all Elysium of late."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat15 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusGift07_A" },
				RequiredAnyTextLines = { "PatroclusMeeting03", "PatroclusAboutTheseus01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0332",
					Text = "Our so-called champion isn't as popular around here as he used to be."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat16 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0419",
					Text = "I'm grateful for everything you've done."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			-- renamed, was 17
			PatroclusReunionChat17A =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0420",
					Text = "For all your patience and your kindness."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
			PatroclusReunionChat17 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusWithAchilles01" },
				-- IsIdAlive = 563036,
				{
					Cue = "/VO/Patroclus_0421",
					Text = "I want you to have this."
				},
				{
					Text = "Patroclus_OfferText02",
					Choices = PresetEventArgs.PatroclusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
				OnQueuedThreadedFunctionName = "AmbientChatting",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PatroclusMutteringRepeatable,
			},
		},

		GiftTextLineSets =
		{
			PatroclusGift01 =
			{
				PlayOnce = true,
				{
					Cue = "/VO/ZagreusField_1731",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Hey, look, I can tell you're struggling right now, and... maybe this isn't the way to help you through it all, but... I want you to have this."
				},
				{
					Cue = "/VO/Patroclus_0142",
					Text =
					"{#DialogueItalicFormat}Ahh{#PreviousFormat}, so you are taking pity on me, then? Well, I've no pride like many others here, so I shall take it. Though, let's make it a fair exchange, shall we?"
				},
			},
			PatroclusGift02 =
			{
				PlayOnce = true,
				RequiredTextLines = { "PatroclusGift01" },
				{
					Cue = "/VO/Patroclus_0135",
					Text =
					"Why would you waste a proper vintage on the likes of me? Questions that are better left unanswered, I would guess."
				},
				{
					Cue = "/VO/ZagreusField_1733",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "If this eases your burden even for a little while, then it's in good hands, as far as I'm concerned."
				},
			},
			PatroclusGift03 =
			{
				PlayOnce = true,
				RequiredTextLines = { "PatroclusGift02" },
				{
					Cue = "/VO/Patroclus_0136",
					Text =
					"{#DialogueItalicFormat}Ah{#PreviousFormat}, a means to drown my sorrows temporarily. That's good. And rather kind of you, I have to say."
				},
				{
					Cue = "/VO/ZagreusField_1734",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"It's nothing. Thank you for not trying to slay me where I stand and boast about it, like seemingly everyone else around here."
				},
			},
			PatroclusGift04 =
			{
				PlayOnce = true,
				RequiredTextLines = { "PatroclusGift03" },
				{
					Cue = "/VO/Patroclus_0137",
					Text = "Oh. Here in Elysium you have to win this stuff, so I have rarely had occasion to enjoy it. Thanks."
				},
				{
					Cue = "/VO/ZagreusField_1735",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I'd say you earned it more than anybody else I've seen around here, lately. Though I don't make the rules."
				},
			},
			PatroclusGift05 =
			{
				PlayOnce = true,
				RequiredTextLines = { "PatroclusGift04" },
				{
					Cue = "/VO/Patroclus_0140",
					Text =
					"You owe me neither time nor generosity, and certainly not this. But if you truly have no better use for it..."
				},
				{
					Cue = "/VO/ZagreusField_1738",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"It's not a matter of owe, sir. Please open your mind to the possibility, nay the fact, that there are those who care about your wellbeing."
				},
			},
			PatroclusGift06 =
			{
				PlayOnce = true,
				RequiredTextLines = { "PatroclusGift05" },
				{
					Cue = "/VO/Patroclus_0139",
					Text =
					"Just the relief from misery that I was looking for. A fleeting feeling, really, but I'll take a fleeting feeling over none."
				},
				{
					Cue = "/VO/ZagreusField_1737",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "That's both very dejected and very astute of you to say. Take care of yourself, will you?"
				},
			},
			PatroclusGift07_A =
			{
				PlayOnce = true,
				RequiredTextLines = { "PatroclusGift06" },
				{
					Cue = "/VO/ZagreusField_3487",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Here, sir. The drink of the gods, themselves. Thought maybe you would like to try it! Just a small token of my appreciation for your selflessness with me, time after time."
				},
				{
					Cue = "/VO/Patroclus_0197",
					Text =
					"You'd give the precious gift of Ambrosia to someone like me, stranger? A gloried thing like that. Why bother...? I should be just another shade to you."
				},
				{
					Cue = "/VO/ZagreusField_3488",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Well, you're not. You're someone I look forward to seeing here in Elysium, which is more than I can say for just about anybody else around here, so... please, enjoy it. Perhaps with Achilles."
				},
				{
					Cue = "/VO/Patroclus_0199",
					Text =
					"Well... perhaps I'll try. You're not so bad, you know that, stranger? Careful with that, or you'll undermine the ruthless reputation that you have."
				},
			},
			PatroclusGift08_A =
			{
				PlayOnce = true,
				RequiredTextLines = { "PatroclusGift07_A" },
				{
					Cue = "/VO/ZagreusField_3489",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I don't see that last bottle of Ambrosia anywhere, which I can only take to mean... you need another. Here, sir. Thanks for seeing me through all of this, time after time."
				},
				{
					Cue = "/VO/Patroclus_0200",
					Text =
					"You're thanking {#DialogueItalicFormat}me{#PreviousFormat}, stranger? I've been here for some time, I think, and yet... some of your customs I'll admit remain quite strange to me. You've done more for me than I've any right to expect, from anyone."
				},
				{
					Cue = "/VO/ZagreusField_3490",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"It's just a bottle of Ambrosia, sir, it's really no big deal. OK, fine, it's rather difficult to come by, but still!"
				},
				{
					Cue = "/VO/Patroclus_0201",
					Text = "You jest, but I do not. I'd offer you my lifelong gratitude, but... well, you know."
				},
				{
					Cue = "/VO/ZagreusField_3492",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"You've got the rest of your life ahead of you, as far as I'm concerned. Here's to starting anew, right? You can call me Zagreus, or stranger, whatever suits you."
				},
				{
					Cue = "/VO/Patroclus_0202",
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_Patroclus_01", Icon = "Keepsake_PatroclusSticker_Max" },
					Text =
					"And... I'm Patroclus, by the way. I'm realizing now... we've not officially met. It's good to know you, Zagreus. Stranger."
				},
			},

			-- below: old conversations from before the Welcome to Hell update
			PatroclusGift07 =
			{
				Skip = true,
				PlayOnce = true,
				RequiredTextLines = { "PatroclusGift06" },
				{
					Cue = "/VO/Patroclus_0138",
					Text = "You're much too kind to such a wretched shade, you know. But I'll not turn away this type of thing."
				},
				{
					Cue = "/VO/ZagreusField_2867",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "You don't attack me indiscriminately, I give you Nectar. I don't think I'm being over-generous!"
				},
			},
			PatroclusGift08 =
			{
				Skip = true,
				PlayOnce = true,
				RequiredTextLines = { "PatroclusGift07" },
				{
					Cue = "/VO/Patroclus_0141",
					Text = "Forgive my bluntness, but, why go out of your way for me like this...?"
				},
				{
					Cue = "/VO/ZagreusField_1739",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I'm not going out of my way, sir. Look, I don't pretend to know the depths of your despair. But when I look at you, I'm reminded of how I've often felt. When I was in that dark place, someone said to me: Don't give up. If nothing else... it gives you something to do."
				},
			},
		},

		GiftGivenVoiceLines =
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- I am most grateful to you, sir.
			{ Cue = "/VO/ZagreusField_1732" },
		},

		CharacterInteractions =
		{
			Rescue =
			{
				VoiceLines =
				{
					{
						RandomRemaining = true,
						PreLineWait = 0.65,
						SuccessiveChanceToPlay = 0.5,
						RequiredTextLines = { "MyrmidonReunionQuestComplete" },

						-- Help yourself.
						{ Cue = "/VO/Patroclus_0279" },
						-- Here.
						{ Cue = "/VO/Patroclus_0280" },
						-- Here, then.
						{ Cue = "/VO/Patroclus_0281" },
						-- Take it.
						{ Cue = "/VO/Patroclus_0282" },
						-- It's yours.
						{ Cue = "/VO/Patroclus_0283" },
						-- All yours.
						{ Cue = "/VO/Patroclus_0284" },
						-- Certainly.
						{ Cue = "/VO/Patroclus_0285" },
						-- Of course.
						{ Cue = "/VO/Patroclus_0286" },
						-- Very well.
						{ Cue = "/VO/Patroclus_0287" },
						-- Don't need it anyway.
						{ Cue = "/VO/Patroclus_0288" },
					},
					{
						RandomRemaining = true,
						SuccessiveChanceToPlay = 0.85,
						UsePlayerSource = true,
						RequiredFalseTextLinesThisRun = { "PatroclusMeeting04", "PatroclusAboutAchilles01A", "PatroclusAboutAchilles01B", "PatroclusAboutAchilles01C_01", "PatroclusAboutAchilles01C_02" },
						-- Thank you.
						{ Cue = "/VO/ZagreusField_1740" },
						-- Thanks.
						{ Cue = "/VO/ZagreusField_1741" },
						-- Thanks a lot.
						{ Cue = "/VO/ZagreusField_1742" },
						-- Thank you sir.
						{ Cue = "/VO/ZagreusField_1743" },
						-- Thanks for this.
						{ Cue = "/VO/ZagreusField_1744" },
						-- Thanks, sir.
						{ Cue = "/VO/ZagreusField_1745" },
						-- Just checking up on you, sir.
						{ Cue = "/VO/ZagreusField_1707", RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" }, },
						-- Take care, then.
						{ Cue = "/VO/ZagreusField_1709" },
					},
					{
						{
							RandomRemaining = true,
							PreLineWait = 0.65,
							SuccessiveChanceToPlay = 0.33,
							RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },

							-- Makes little difference I should think.
							{ Cue = "/VO/Patroclus_0056" },
							-- If that's your choice, then.
							{ Cue = "/VO/Patroclus_0057" },
							-- Certainly, stranger.
							{ Cue = "/VO/Patroclus_0058" },
							-- So be it.
							{ Cue = "/VO/Patroclus_0059" },
							-- It's all the same to me.
							{ Cue = "/VO/Patroclus_0060" },
							-- Whatever suits you.
							{ Cue = "/VO/Patroclus_0061" },
							-- Well then, it's yours.
							{ Cue = "/VO/Patroclus_0062" },
							-- Then, very well.
							{ Cue = "/VO/Patroclus_0063" },
							-- There, now leave me be.
							{ Cue = "/VO/Patroclus_0064" },
							-- Now go.
							{ Cue = "/VO/Patroclus_0065" },
							-- I won't be needing that.
							{ Cue = "/VO/Patroclus_0066" },
							-- All yours.
							{ Cue = "/VO/Patroclus_0067" },
							-- I doubt it'll be of much help.
							{ Cue = "/VO/Patroclus_0068" },
							-- It's something, right?
							{ Cue = "/VO/Patroclus_0069" },
						},
					},
				},
			},
		},

		RepulseOnMeleeInvulnerableHit = 250,
		OnHitVoiceLines =
		{
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.25,
				PlayFromTarget = true,
				CooldownTime = 7,
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },

				-- It's no use...
				{ Cue = "/VO/Patroclus_0088" },
				-- Nice try.
				{ Cue = "/VO/Patroclus_0089" },
				-- I only wish.
				{ Cue = "/VO/Patroclus_0090" },
				-- I'm already dead.
				{ Cue = "/VO/Patroclus_0091" },
				-- Doesn't work like that.
				{ Cue = "/VO/Patroclus_0092" },
				-- I'm beyond that.
				{ Cue = "/VO/Patroclus_0093" },
				-- Happens every time.
				{ Cue = "/VO/Patroclus_0094" },
				-- I'm afraid not.
				{ Cue = "/VO/Patroclus_0095" },
				-- See?
				{ Cue = "/VO/Patroclus_0096" },
				-- Nothing.
				{ Cue = "/VO/Patroclus_0097" },
				-- I felt nothing.
				{ Cue = "/VO/Patroclus_0098" },
				-- I've died already, thanks.
				{ Cue = "/VO/Patroclus_0099" },
				-- Don't waste your time.
				{ Cue = "/VO/Patroclus_0100" },
				-- Leave me.
				{ Cue = "/VO/Patroclus_0101" },
				-- Come off it.
				{ Cue = "/VO/Patroclus_0102" },
				-- If only.
				{ Cue = "/VO/Patroclus_0103" },
				-- You're hopeless.
				{ Cue = "/VO/Patroclus_0104" },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.25,
				PlayFromTarget = true,
				CooldownTime = 7,
				RequiredTextLines = { "MyrmidonReunionQuestComplete" },

				-- <Chuckle>
				{ Cue = "/VO/Patroclus_0234" },
				-- Come, now.
				{ Cue = "/VO/Patroclus_0235" },
				-- Not in the mood, stranger.
				{ Cue = "/VO/Patroclus_0236" },
				-- Oh, come now.
				{ Cue = "/VO/Patroclus_0237" },
				-- Do as you like, then.
				{ Cue = "/VO/Patroclus_0238" },
				-- Not in a fighting mood.
				{ Cue = "/VO/Patroclus_0239" },
				-- Oh please have mercy, stranger.
				{ Cue = "/VO/Patroclus_0240" },
				-- Spare me, stranger, please.
				{ Cue = "/VO/Patroclus_0241" },
				-- I won't be fighting here.
				{ Cue = "/VO/Patroclus_0242" },
			},
		},
	},

	-- Cerberus in D_Hub, Id = 547487
	ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01 = {
		InheritFrom = { "NPC_Neutral" },
		GenusName = "NPC_Cerberus_01",
		UseText = "UseTalkToCerberus",
		Portrait = "Portrait_Cerberus_Default_01",
		AnimOffsetZ = 525,
		Groups = { "NPCs" },

		Binks = {
			"Cerberus_HubIdle_Bink",
			"Cerberus_HappyGreeting_Bink",
		},

		BossPresentationIntroTextLineSets =
		{
			CerberusStyxMeeting01 =
			{
				PlayOnce = true,
				EndVoiceLines =
				{
					PreLineWait = 0.6,
					UsePlayerSource = true,
					TriggerCooldowns = { "ZagreusForkingPathVoiceLinesPlayed" },
					-- Good! Now I just need to head off the beaten path here and see what I can find.
					{ Cue = "/VO/ZagreusField_2065" },
				},
				{
					Cue = "/VO/Storyteller_0242",
					PortraitExitAnimation = "Portrait_Cerberus_Default_01_Exit",
					IsNarration = true,
					PreLineWait = 1.8,
					StartSound = "/VO/CerberusLongGrowl",
					Text =
					"{#DialogueItalicFormat}The multi-headed Cerberus stands vigilant before the Underworld's entryway; the tales of what happens to those foolish enough to attempt to pass are far too graphic to describe.",
				},
				{
					Cue = "/VO/ZagreusField_2063",
					Portrait = "Portrait_Zag_Serious_01",
					PortraitExitAnimation = "Portrait_Zag_Serious_01_Exit",
					Speaker = "CharProtag",
					StartSound = "/VO/CerberusGrowl",
					PreLineWait = 1.0,
					PreLineAnim = "ZagreusTalkDenial_Full",
					PreLineAnimTarget = "Hero",
					PreContentSound = "/Leftovers/Menu Sounds/TextReveal3",
					Text =
					"So it's really come to this, boy? After everything we've been through. Well then, if this is how it has to be, there's nothing left to say. Except for: {#DialogueItalicFormat}On your guard{#PreviousFormat}!!"
				},
				{
					Cue = "/VO/ZagreusField_2064",
					Portrait = "Portrait_Zag_Default_01",
					PortraitExitAnimation = "Portrait_Zag_Default_01_Exit",
					Speaker = "CharProtag",
					PreLineWait = 2.0,
					StartSound = "/VO/CerberusBarks",
					EndSecretMusic = true,
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Hahaha{#PreviousFormat}, no, but seriously, boy. I know why you're here. There has to be a way to make you look the other way. What if I help you with the Satyr problem, would you let me go? Please. I have to find Persephone... my mother. You know what this means to me."
				},
				{
					Cue = "/VO/Storyteller_0243",
					-- TODO
					PreLineFunctionName = "ResumeStyxMusic",
					IsNarration = true,
					PreLineWait = 1.0,
					StartSound = "/VO/CerberusWhineSad",
					Text =
					"{#DialogueItalicFormat}After a moment's hesitation and deliberation, the voracious hound of hell barks once, affirmatively, toward the Prince, who sets off in search of something that can sate the monster's appetites.",
				},
			},
		},

		InteractTextLineSets =
		{
			-- key item delivered / boss door unlock events
			CerberusBossDoorUnlock01 =
			{
				PlayOnce = true,
				UseableOff = true,
				RequiredRoomThisRun = "D_Reprieve01",
				Priority = true,
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/ZagreusField_2066",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PostLineFunctionName = "UnlockDoor",
					PostLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					Text =
					"All right, boy, I got your favorite treat. But you have to promise to let me pass if I hand it over, OK?"
				},
				{
					Cue = "/VO/Storyteller_0244",
					PreLineWait = 1.0,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockText = "ClearedCerberus",
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text =
					"{#DialogueItalicFormat}Terrifying Cerberus accepts the fetid sack, and scans the darkened hall for where best to consume the stomach-turning contents."
				},
			},

			CerberusBossDoorUnlockRepeatable01 =
			{
				PlayOnce = true,
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0245",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						UseAdditionalFootstepSounds = true,
						EndUnlockText = "ClearedCerberus_Alt1",
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Cerberus again accepts the sack."
				},
			},
			CerberusBossDoorUnlockRepeatable01_Alt =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02", "CerberusBossDoorUnlockRepeatable03", "CerberusBossDoorUnlockRepeatable04", "CerberusBossDoorUnlockRepeatable05", "CerberusBossDoorUnlockRepeatable06", "CerberusBossDoorUnlockRepeatable07" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0245",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						UseAdditionalFootstepSounds = true,
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Cerberus again accepts the sack."
				},
			},
			CerberusBossDoorUnlockRepeatable02 =
			{
				PlayOnce = true,
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0253",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockText = "ClearedCerberus_Alt2",
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Gigantic Cerberus accepts the Prince's foul offering."
				},
			},
			CerberusBossDoorUnlockRepeatable02_Alt =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02", "CerberusBossDoorUnlockRepeatable03", "CerberusBossDoorUnlockRepeatable04", "CerberusBossDoorUnlockRepeatable05", "CerberusBossDoorUnlockRepeatable06", "CerberusBossDoorUnlockRepeatable07" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0253",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt2", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Gigantic Cerberus accepts the Prince's foul offering."
				},
			},
			CerberusBossDoorUnlockRepeatable03 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0254",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt2", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						EndUnlockTextTable = { "ClearedCerberus_Alt2" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}The fearsome Cerberus accepts the Satyr sack."
				},
			},
			CerberusBossDoorUnlockRepeatable04 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0255",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}The Prince persuades the Underworld's ferocious guardian to move aside."
				},
			},
			CerberusBossDoorUnlockRepeatable05 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0256",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}The Prince compels the multi-headed hound to let him pass."
				},
			},
			CerberusBossDoorUnlockRepeatable06 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0257",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Thus has the Prince again persuaded fearsome Cerberus to get out of his way."
				},
			},
			CerberusBossDoorUnlockRepeatable07 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0258",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Joyfully the hound of hell accepts another Satyr sack."
				},
			},
			CerberusBossDoorUnlockRepeatable08 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0396",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text =
					"{#DialogueItalicFormat}The monster's solitary weakness, Satyr sacks, prove terribly effective, once again."
				},
			},
			CerberusBossDoorUnlockRepeatable09 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0397",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text =
					"{#DialogueItalicFormat}Fang-bearing Cerberus directs all three of his attentions toward the Satyr sack."
				},
			},
			CerberusBossDoorUnlockRepeatable10 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0398",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text =
					"{#DialogueItalicFormat}The guardian of hell itself decides the time has come for a short break and snack."
				},
			},
			CerberusBossDoorUnlockRepeatable11 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0399",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Prince Zagreus once more offers to Cerberus one of his favored sacks."
				},
			},
			CerberusBossDoorUnlockRepeatable12 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0400",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Cerberus moves for no one, but for Satyr sacks, he can make an exception."
				},
			},
			CerberusBossDoorUnlockRepeatable13 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0401",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus_Alt1", "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Vigilant Cerberus decides to look the other way, this once."
				},
			},
			CerberusBossDoorUnlockRepeatable14 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0402",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}Each violent countenance of Cerberus agrees the Satyr sack must be destroyed."
				},
			},
			CerberusBossDoorUnlockRepeatable15 =
			{
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
				-- PreEventFunctionName = "PetCerberus",
				{
					Cue = "/VO/Storyteller_0403",
					PreLineWait = 0.75,
					StartSound = "/VO/CerberusSnarls",
					IsNarration = true,
					PreLineFunctionName = "UnlockDoor",
					PreLineFunctionArgs = { DoorId = 547460, RelockAllDoors = true, },
					PreLineAnim = "ZagreusInteractEquip",
					PreLineAnimTarget = "Hero",
					PostLineFunctionName = "ExitNPCPresentation",
					PostLineFunctionArgs = {
						InitialWaitTime = 0.2,
						ObjectId = 547487,
						TeleportToId = 551568,
						DeleteId = 551569,
						InitialExitSound = "/VO/CerberusGrowl",
						FullFadeTime = 1.8,
						EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
						EndUnlockTextTable = { "ClearedCerberus", "ClearedCerberus_A", "ClearedCerberus_B", "ClearedCerberus_C", "ClearedCerberus_D", "ClearedCerberus_E", "ClearedCerberus_F", "ClearedCerberus_G", "ClearedCerberus_H", "ClearedCerberus_I", "ClearedCerberus_J", "ClearedCerberus_K", "ClearedCerberus_L", "ClearedCerberus_M", "ClearedCerberus_N", "ClearedCerberus_O", "ClearedCerberus_P", "ClearedCerberus_Q" },
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text =
					"{#DialogueItalicFormat}After deliberating briefly, Cerberus concludes that, yes, he shall accept the sack."
				},
			},
		},

		RepulseOnMeleeInvulnerableHit = 250,
		InvincibubbleScale = 2.5,
		InvulnerableHitSound = "/VO/CerberusBarks",
		OnHitVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.35,
			UsePlayerSource = true,
			CooldownTime = 8,

			-- Just playing with you, boy.
			{ Cue = "/VO/ZagreusField_2157" },
			-- There's a good boy.
			{ Cue = "/VO/ZagreusField_2158" },
			-- No time for play, huh?
			{ Cue = "/VO/ZagreusField_2159" },
			-- So serious on guard duty.
			{ Cue = "/VO/ZagreusField_2160" },
			-- Not going to budge, are you?
			{ Cue = "/VO/ZagreusField_2161" },
			-- Cerberus puts up with so much.
			{ Cue = "/VO/ZagreusField_2162" },
			-- Just playing!
			{ Cue = "/VO/ZagreusField_2163" },
			-- You wouldn't fight me, would you?
			{ Cue = "/VO/ZagreusField_2164" },
			-- Won't even lift a paw, will you.
			{ Cue = "/VO/ZagreusField_2165" },
			-- I ought to be ashamed of myself.
			{ Cue = "/VO/ZagreusField_2166" },
		},
	},
}
