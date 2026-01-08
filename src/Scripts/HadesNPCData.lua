-- For these, make the modifications directly here, as larger changes are often needed
mod.PresetEventArgs = mod.PresetEventArgs or {
	-- #region Patroclus
	PatroclusMuttering = {
		StatusAnimation = "StatusIconWantsToTalk",
		DistanceTrigger = {
			WithinDistance = 450,
			VoiceLines = { GlobalVoiceLines = "PatroclusGreetingLines" }, --game.GlobalVoiceLines.PatroclusGreetingLines,
		},
		VoiceLines = {
			[1] = { GlobalVoiceLines = "PatroclusMutteringLines" }, --game.GlobalVoiceLines.PatroclusMutteringLines,
		},
	},
	PatroclusMutteringRepeatable = {
		DistanceTrigger = {
			WithinDistance = 450,
			VoiceLines = game.GlobalVoiceLines.PatroclusGreetingLines,
		},
		VoiceLines = {
			[1] = game.GlobalVoiceLines.PatroclusMutteringLines,
		},
	},
	PatroclusGreetings = {
		DistanceTrigger = {
			WithinDistance = 350,
			VoiceLines = {
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
	-- #endregion
	-- #region Thanatos
	-- Brooding = {
	-- 	ChanceToTrigger = 0.5,
	-- 	PostTriggerAnimation = "ThanatosIdleInhouseFidget_HairFlick",
	-- 	StatusAnimation = "StatusIconWantsToTalk",
	-- 	WithinDistance = 620,
	-- 	VoiceLines =		{
	-- 		[1] = game.GlobalVoiceLines.ThanatosGreetingVoiceLines,
	-- 	}
	-- },
	-- BroodingRepeatable = {
	-- 	ChanceToTrigger = 0.5,
	-- 	PostTriggerAnimation = "ThanatosIdleInhouseFidget_HairFlick",
	-- 	WithinDistance = 420,
	-- 	VoiceLines =		{
	-- 		[1] = game.GlobalVoiceLines.ThanatosGreetingVoiceLines,
	-- 	}
	-- },
	ThanatosFarewells = {
		PostTriggerFunctionName = _PLUGIN.guid .. "." .. "ThanatosExit",
		PostTriggerFunctionArgs = { WaitTime = 4 },
		WithinDistance = 750,
		PreTriggerAnimation = "ThanatosTalkDismissal_Start",
		VoiceLines =
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			SuccessiveChanceToPlay = 0.9,
			PreLineWait = 0.75,
			Queue = "Always",

			-- It's clear. Go.
			{ Cue = "/VO/Thanatos_0051" },
			-- I have to get back.
			{ Cue = "/VO/Thanatos_0052" },
			-- Go on.
			{ Cue = "/VO/Thanatos_0053" },
			-- Keep going.
			{ Cue = "/VO/Thanatos_0054",      RequiredTextLines = { "ThanatosFieldBuildingTrust01" } },
			-- Keep fighting.
			{ Cue = "/VO/Thanatos_0055",      RequiredTextLines = { "ThanatosFieldBuildingTrust01" } },
			-- Nice running into you.
			{ Cue = "/VO/Thanatos_0056",      RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" } },
			-- Take care, Zagreus.
			-- { Cue = "/VO/Thanatos_0057",      RequiredTextLines = { "ThanatosGift08" } },
			-- I'm going.
			{ Cue = "/VO/Thanatos_0058" },
			-- That's that.
			{ Cue = "/VO/Thanatos_0059" },
			-- Be seeing you.
			{ Cue = "/VO/Thanatos_0060",      RequiredTextLines = { "ThanatosGift05" } },
			-- I've got to go.
			{ Cue = "/VO/Thanatos_0061",      RequiredTextLines = { "ThanatosGift05" } },
			-- See you.
			{ Cue = "/VO/Thanatos_0062",      RequiredTextLines = { "ThanatosGift06" } },
			-- Not a word of this.
			{ Cue = "/VO/Thanatos_0063" },
			-- Let's keep this between us.
			{ Cue = "/VO/Thanatos_0064",      RequiredTextLines = { "ThanatosGift06" } },
			-- You had your hands full.
			{ Cue = "/VO/Thanatos_0065" },
			-- You're welcome. Go.
			{ Cue = "/VO/Thanatos_0066",      RequiredFalseTextLines = { "ThanatosGift10" } },
			-- Should be clear.
			{ Cue = "/VO/Thanatos_0067",      RequiredTextLines = { "ThanatosGift01" } },
			-- You never saw me.
			{ Cue = "/VO/Thanatos_0068" },
			-- Don't die, Zag.
			-- { Cue = "/VO/Thanatos_0069",      RequiredTextLines = { "ThanatosGift08" } },
			-- Stay alive.
			{ Cue = "/VO/Thanatos_0070",      RequiredTextLines = { "ThanatosGift07_A" } },
			-- Bye, Zag.
			-- { Cue = "/VO/ThanatosField_0236", RequiredTextLines = { "ThanatosGift10" }, },
			-- I'm off.
			{ Cue = "/VO/ThanatosField_0237", RequiredTextLines = { "ThanatosGift06" }, },
			-- Well, I'm off.
			{ Cue = "/VO/ThanatosField_0238" },
			-- Pleasure doing business.
			{ Cue = "/VO/ThanatosField_0239", RequiredTextLines = { "ThanatosGift10" }, },
			-- I should be getting back.
			{ Cue = "/VO/ThanatosField_0240", RequiredTextLines = { "ThanatosGift08" }, },
			-- You have this.
			{ Cue = "/VO/ThanatosField_0241", RequiredTextLines = { "ThanatosGift09" }, },
			-- See you at home.
			-- { Cue = "/VO/ThanatosField_0242", RequiredTextLines = { "ThanatosGift10" }, },
			-- On to my next one.
			{ Cue = "/VO/ThanatosField_0243", RequiredAnyTextLines = { "ThanatosGift04", "ThanatosGift04_B" }, },
			-- Ungh, I'm late.
			{ Cue = "/VO/ThanatosField_0244", RequiredTextLines = { "ThanatosGift03" }, },
			-- I'm gone.
			{ Cue = "/VO/ThanatosField_0245" },
			-- Till next time.
			{ Cue = "/VO/ThanatosField_0180", RequiredAnyTextLines = { "ThanatosGift09" } },
			-- We should do this again.
			{ Cue = "/VO/ThanatosField_0181", RequiredTextLines = { "ThanatosGift10" } },
			-- You have this.
			{ Cue = "/VO/ThanatosField_0182", RequiredAnyTextLines = { "ThanatosGift10" } },
			-- Till we meet again.
			{ Cue = "/VO/ThanatosField_0183", RequiredAnyTextLines = { "ThanatosGift09" } },
			-- That takes care of that, I guess. See you.
			{ Cue = "/VO/ThanatosField_0184", RequiredAnyTextLines = { "ThanatosGift10" } },
		},
	},
	-- #endregion
	-- #region Persephone
	-- Manually replaced /VO/Persephone_xxxx with /VO/Megaera_2xxxx
	PersephoneGardenFirstGreeting = {
		WithinDistance = 1200,
		-- StatusAnimation = "StatusIconWantsToTalk",
		VoiceLines = {
			{
				-- Who's there?
				{ Cue = "/VO/Megaera_20019" },
			},
			{
				PreLineWait = 0.5,
				UsePlayerSource = true,

				-- Um... hello...?
				{ Cue = "/VO/ZagreusField_3600" },
			},
			{
				PreLineWait = 0.5,
				BreakIfPlayed = true,

				-- Hello, indeed!
				{ Cue = "/VO/Megaera_20327" },
			},
			{
				PreLineWait = 0.3,
				UsePlayerSource = true,

				-- Wait, can, can we just...?
				{ Cue = "/VO/ZagreusField_3601" },
			},
		},
	},
	-- Manually replaced /VO/Persephone_xxxx with /VO/Megaera_2xxxx
	PersephoneGardenGreeting = {
		WithinDistance = 1250,
		-- PostTriggerAngleTowardTarget = true,
		VoiceLines = {
			RequiredTextLines = { "PersephoneFirstMeeting" },
			{
				RequiredQueuedTextLines = "PersephoneMeeting07",
				PreLineAnim = "PersephoneGarden_Vulnerable",
				ObjectType = "ModsNikkelMHadesBiomes_NPC_Persephone_01",

				-- Zagreus...
				{ Cue = "/VO/Megaera_20031" },
			},
			{
				{
					RequiredQueuedTextLines = "PersephoneMeeting08",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					ObjectType = "ModsNikkelMHadesBiomes_NPC_Persephone_01",

					-- You're back...?
					{ Cue = "/VO/Megaera_20034" },
				},
				{
					RequiredQueuedTextLines = "PersephoneMeeting08",
					PreLineWait = 0.5,
					UsePlayerSource = true,
					BreakIfPlayed = true,

					-- Mother!
					{ Cue = "/VO/ZagreusField_3612" },
				},
			},
			{
				RequiredFalseQueuedTextLines = { "PersephoneMeeting07", "PersephoneMeeting08" },
				PreLineAnim = "PersephoneGarden_Greeting",
				ObjectType = "ModsNikkelMHadesBiomes_NPC_Persephone_01",
				RandomRemaining = true,

				-- Zagreus!
				{ Cue = "/VO/Megaera_20030", RequiredFalseQueuedTextLines = { "PersephoneMeeting06", "PersephoneMeeting07" } },
				-- Zagreus?
				{ Cue = "/VO/Megaera_20032", RequiredFalseQueuedTextLines = { "PersephoneMeeting06", "PersephoneMeeting07" } },
				-- You're back!
				{ Cue = "/VO/Megaera_20033" },
				-- Ah, you're back.
				{ Cue = "/VO/Megaera_20035" },
				-- My son!
				{ Cue = "/VO/Megaera_20036" },
				-- Is that you, Zagreus?
				{ Cue = "/VO/Megaera_20037", RequiredFalseQueuedTextLines = { "PersephoneMeeting06", "PersephoneMeeting07" } },
				-- Oh, it's you!
				{ Cue = "/VO/Megaera_20038" },
				-- Is that you?
				{ Cue = "/VO/Megaera_20039" },
				-- Zagreus, you're back!
				{ Cue = "/VO/Megaera_20040", RequiredFalseQueuedTextLines = { "PersephoneMeeting06", "PersephoneMeeting07" } },
				-- Welcome back, my son.
				{ Cue = "/VO/Megaera_20041" },
			},
			{
				PreLineWait = 0.5,
				UsePlayerSource = true,
				BreakIfPlayed = true,
				RandomRemaining = true,
				RequiredQueuedTextLines = "PersephoneReturnsHome01",

				-- Mother...?
				{ Cue = "/VO/ZagreusField_3619" },
			},
			{
				PreLineWait = 0.5,
				UsePlayerSource = true,
				BreakIfPlayed = true,
				RandomRemaining = true,
				RequiredFalseQueuedTextLines = { "PersephoneReturnsHome01", "PersephoneMeeting08" },

				-- It's me.
				{ Cue = "/VO/ZagreusField_3613" },
				-- I'm back.
				{ Cue = "/VO/ZagreusField_3614" },
				-- I'm back, Mother!
				{ Cue = "/VO/ZagreusField_3615" },
				-- It's only me.
				{ Cue = "/VO/ZagreusField_3616" },
				-- I made it, Mother.
				{ Cue = "/VO/ZagreusField_3617" },
				-- Hello, Mother!
				{ Cue = "/VO/ZagreusField_3618" },
				-- Mother...?
				{ Cue = "/VO/ZagreusField_3619", RequiredFalseQueuedTextLines = { "PersephoneMeeting09" }, },
				-- I'm here, Mother.
				{ Cue = "/VO/ZagreusField_3620" },
			},
		},
	},
	-- #endregion
	-- #region Eurydice
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
	-- #endregion
	-- #region NPC Benefit choices
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
	-- #endregion
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

		InteractTextLineSets = {
			SisyphusFirstMeeting = {
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
			SisyphusMeeting02_A = {
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
			SisyphusMeeting02 = {
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
			SisyphusMeeting03 = {
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
			SisyphusMeeting04 = {
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
			SisyphusMeeting_AboutFury01 = {
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
			SisyphusMeeting05 = {
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
			SisyphusMeeting06 = {
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
			SisyphusMeeting07 = {
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
			SisyphusAboutBouldy01 = {
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
			SisyphusAboutBouldy02 = {
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
			SisyphusAboutBouldy03 = {
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
			SisyphusAboutBouldy04 = {
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

			SisyphusAboutAlecto01 = {
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
			SisyphusAboutTisiphone01 = {
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

			SisyphusMeeting08 = {
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
			SisyphusBackstory01 = {
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
			SisyphusBackstory02 = {
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
			SisyphusBackstory03 = {
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
			SisyphusBackstory04 = {
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
			SisyphusBackstory05 = {
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
			SisyphusBackstory06 = {
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

			SisyphusLiberationQuest_Beginning_01 = {
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

			SisyphusLiberationQuestComplete = {
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

			SisyphusLiberationQuestAftermath01 = {
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
			SisyphusLiberationQuestAftermath02 = {
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
			SisyphusLiberationQuestAftermath03 = {
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
			SisyphusHighRelationship01 = {
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

			SisyphusMeeting_FuryVictorious01 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting" },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },
				ConsecutiveDeathsInRoom = {
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
			SisyphusMeeting_FuryDefeated01 = {
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
			SisyphusMeeting_FuryDefeated02 = {
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

			SisyphusMeeting_AboutMegAndThanatos01 = {
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
			SisyphusMeeting_AboutMegAndThanatos02 = {
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
			SisyphusAboutThanatosRelationship01 = {
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

			SisyphusRunProgress01 = {
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

			SisyphusRunCleared01 = {
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

			SisyphusRunCleared02 = {
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

			SisyphusPostEnding01 = {
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

			SisyphusPostEpilogue01 = {
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
			SisyphusPostEpilogue02 = {
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
			SisyphusPostEpilogue03 = {
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

			SisyphusAboutKeepsake01 = {
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
			SisyphusAboutKeepsake02 = {
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

			SisyphusAboutAboutSingersReunionQuest01 = {
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

			SisyphusAboutLegendary01 = {
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
			SisyphusAboutLegendary02 = {
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

			MegaeraWithSisyphus01_FollowUp = {
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

			MegaeraWithSisyphus02_FollowUp = {
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

			MegaeraWithSisyphus03_FollowUp = {
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

			ThanatosWithSisyphus01_FollowUp = {
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

			ThanatosWithSisyphus02_FollowUp = {
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

			ThanatosWithSisyphus03_FollowUp = {
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

		RepeatableTextLineSets = {
			SisyphusChat01 = {
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
			SisyphusChat02 = {
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
			SisyphusChat03 = {
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
			SisyphusChat04 = {
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
			SisyphusChat05 = {
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
			SisyphusChat06 = {
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
			SisyphusChat07 = {
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
			SisyphusChat08 = {
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
			SisyphusChat09 = {
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
			SisyphusChat10 = {
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
			SisyphusChat11 = {
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
			SisyphusChat12 = {
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
			SisyphusChat13 = {
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
			SisyphusChat14 = {
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
			SisyphusChat15 = {
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
			SisyphusChat16 = {
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
			SisyphusChat17 = {
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
			SisyphusChat18 = {
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
			SisyphusChat19 = {
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
			SisyphusChat20 = {
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
			SisyphusChat21 = {
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
			SisyphusChat22 = {
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
			SisyphusChat23 = {
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
			SisyphusChat24 = {
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
			SisyphusChat25 = {
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
			SisyphusChat26 = {
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
			SisyphusChat27 = {
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
			SisyphusChat28 = {
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
			SisyphusChat29 = {
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
			SisyphusChat30 = {
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
			SisyphusChat31 = {
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
			SisyphusChat32 = {
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
			SisyphusChat33 = {
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
			SisyphusChat34 = {
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
			SisyphusChat35 = {
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
			SisyphusChat36 = {
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
			SisyphusChat37 = {
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
			SisyphusChat38 = {
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
			SisyphusChat39 = {
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
			SisyphusChat40 = {
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
			SisyphusChat41 = {
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
			SisyphusChat42 = {
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
			SisyphusChat43 = {
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
			SisyphusChat44 = {
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
			SisyphusChat45 = {
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
			SisyphusChat46 = {
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
			SisyphusMaxChat01 = {
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
			SisyphusMaxChat02 = {
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
			SisyphusMaxChat03 = {
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
			SisyphusMaxChat04 = {
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
			SisyphusMaxChat05 = {
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
			SisyphusMaxChat06 = {
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
			SisyphusMaxChat07 = {
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
			SisyphusMaxChat08 = {
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
			SisyphusMaxChat09 = {
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
			SisyphusMaxChat10 = {
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
			SisyphusMaxChat11 = {
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

		GiftTextLineSets = {
			SisyphusGift01 = {
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
			SisyphusGift02 = {
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
			SisyphusGift03 = {
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
			SisyphusGift04 = {
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
			SisyphusGift05 = {
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
			SisyphusGift06 = {
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
			SisyphusGift07_A = {
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
			SisyphusGift08_A = {
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift07_A", },
				RequiredFalseTextLines = { "SisyphusGift08_B", "MegaeraGift10", "OlympianReunionQuestComplete" },
				EndVoiceLines = {
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
			SisyphusGift08_B = {
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift07_A" },
				RequiredAnyTextLines = { "MegaeraGift10", "OlympianReunionQuestComplete" },
				RequiredFalseTextLines = { "SisyphusGift08_A" },
				EndVoiceLines = {
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
			SisyphusGift09_A = {
				PlayOnce = true,
				RequiredAnyTextLines = { "SisyphusGift08_A", "SisyphusGift08_B" },
				EndVoiceLines = {
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
			SisyphusGift07 = {
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
			SisyphusGift08 = {
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

		GiftGivenVoiceLines = {
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

		CharacterInteractions = {
			Rescue = {
				VoiceLines = {
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
						-- { Cue = "/VO/Sisyphus_0222", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Certainly, Highness!
						{ Cue = "/VO/Sisyphus_0223" },
						-- Sure thing, Prince Z.!
						-- { Cue = "/VO/Sisyphus_0224", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- My pleasure, Prince!
						-- { Cue = "/VO/Sisyphus_0225", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- No worries whatsoever!
						{ Cue = "/VO/Sisyphus_0226" },
						-- Think I can do that, Prince!
						-- { Cue = "/VO/Sisyphus_0227", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Got that right here, Prince Z.!
						-- { Cue = "/VO/Sisyphus_0228", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Then here you go!
						{ Cue = "/VO/Sisyphus_0229" },
						-- Ah, certainly, Prince Z.!
						-- { Cue = "/VO/Sisyphus_0230", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
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
		OnHitVoiceLines = {
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.45,
			PlayFromTarget = true,
			Cooldowns = {
				{ Name = "SisyphusAnyQuipSpeech", Time = 11 },
			},

			-- Uh, Prince?
			-- { Cue = "/VO/Sisyphus_0064", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Nice try, there!
			{ Cue = "/VO/Sisyphus_0065" },
			-- No use in that.
			{ Cue = "/VO/Sisyphus_0066" },
			-- Already dead here, Prince.
			-- { Cue = "/VO/Sisyphus_0067", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Don't bother, Prince.
			-- { Cue = "/VO/Sisyphus_0068", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Come on, now.
			{ Cue = "/VO/Sisyphus_0069" },
			-- Oh come now.
			{ Cue = "/VO/Sisyphus_0070" },
			-- Why bother.
			{ Cue = "/VO/Sisyphus_0071" },
			-- Try all you like!
			{ Cue = "/VO/Sisyphus_0072" },
			-- Very funny, Prince.
			-- { Cue = "/VO/Sisyphus_0073", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Oof, got me good there!
			{ Cue = "/VO/Sisyphus_0074" },
			-- Nope, can't feel a thing.
			{ Cue = "/VO/Sisyphus_0075" },
			-- That's it, let all out.
			{ Cue = "/VO/Sisyphus_0076" },
			-- Hah, good one, Prince!
			-- { Cue = "/VO/Sisyphus_0232", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Augh, you got me, Highness!
			{ Cue = "/VO/Sisyphus_0233" },
			-- Oh, please, have mercy and all that!
			{ Cue = "/VO/Sisyphus_0234" },
			-- That your best shot, Prince Z.?
			-- { Cue = "/VO/Sisyphus_0235", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Now don't get frustrated all right?
			{ Cue = "/VO/Sisyphus_0236" },
			-- You getting ready for the road ahead?
			{ Cue = "/VO/Sisyphus_0237" },
			-- Nice shot there, Prince!
			-- { Cue = "/VO/Sisyphus_0238", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Augh, I'm hit!
			{ Cue = "/VO/Sisyphus_0239" },
			-- Wow you are strong Prince Z.!
			-- { Cue = "/VO/Sisyphus_0240", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Whew, most impressive, Prince!
			-- { Cue = "/VO/Sisyphus_0241", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
		},

		BouldyAttackReactionVoiceLines = {
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.55,
			PlayFromTarget = true,
			RequiredTextLines = { "SisyphusFirstMeeting" },
			Cooldowns = {
				{ Name = "SisyphusAnyQuipSpeech", Time = 7 },
			},

			-- No use in that.
			{ Cue = "/VO/Sisyphus_0066", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0066" } },
			-- Don't bother, Prince.
			-- { Cue = "/VO/Sisyphus_0068", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0068" },               Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Come on, now.
			{ Cue = "/VO/Sisyphus_0069", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0069" } },
			-- Oh come now.
			{ Cue = "/VO/Sisyphus_0070", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0070" } },
			-- Why bother.
			{ Cue = "/VO/Sisyphus_0071", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0071" } },
			-- Very funny, Prince.
			-- { Cue = "/VO/Sisyphus_0073", RequiredTextLines = { "SisyphusMeeting06" },                         Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Pick on somebody your own size, Prince!
			-- { Cue = "/VO/Sisyphus_0254", RequiredTextLines = { "SisyphusGift03" },                            Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- That's one fight you aren't going to win!
			{ Cue = "/VO/Sisyphus_0255" },
			-- Takes more than that to budge old Bouldy, Prince!
			-- { Cue = "/VO/Sisyphus_0256", RequiredTextLines = { "SisyphusMeeting06" },                         Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Sure is heavy, isn't he!
			{ Cue = "/VO/Sisyphus_0257", RequiredTextLines = { "SisyphusMeeting06" } },
			-- Bouldy can take whatever you dish out!
			{ Cue = "/VO/Sisyphus_0258", RequiredTextLines = { "SisyphusMeeting06" } },
			-- Now there's no need for that here, Prince.
			-- { Cue = "/VO/Sisyphus_0259", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Try all you like, there, Prince!
			-- { Cue = "/VO/Sisyphus_0260", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Hey that's my friend, Prince Z.
			-- { Cue = "/VO/Sisyphus_0261", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- No hurting Bouldy, Prince.
			-- { Cue = "/VO/Sisyphus_0262", RequiredTextLines = { "SisyphusMeeting06" },                         Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
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

		InteractTextLineSets = {
			BouldyFirstMeeting = {
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				RequiredTextLines = { "SisyphusAboutBouldy01" },
				EndVoiceLines = {
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
			BouldyMiscMeeting01 = {
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
			BouldyMiscMeeting02 = {
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
			BouldyMiscMeeting03 = {
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

		RepeatableTextLineSets = {
			BouldyChat01 = {
				UseableOffSource = true,
				RequiredTextLines = { "BouldyFirstMeeting" },
				{
					Cue = "",
					SpeakerLabelOffsetY = 18,
					Text = ".   .   .   ."
				},
			},
		},

		GiftTextLineSets = {
			BouldyGiftRepeatable01 = {
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
			BouldyGiftRepeatable02 = {
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
			BouldyGiftRepeatable03 = {
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
			BouldyGiftRepeatable04 = {
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
			BouldyGiftRepeatable05 = {
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
			BouldyGiftRepeatable06 = {
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
			BouldyGiftRepeatable07 = {
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
			BouldyGiftRepeatable08 = {
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
			BouldyGiftRepeatable09 = {
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
			BouldyGiftRepeatable10 = {
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
			BouldyGiftRepeatable11 = {
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
			BouldyGiftRepeatable12 = {
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
			BouldyGiftRepeatable13 = {
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
			BouldyGiftRepeatable14 = {
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
			BouldyGiftRepeatable15 = {
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
			BouldyGiftRepeatable16 = {
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
			BouldyGiftRepeatable17 = {
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
			BouldyGiftRepeatable18 = {
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
			BouldyGiftRepeatable19 = {
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
			BouldyGiftRepeatable20 = {
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
			BouldyGiftRepeatable21 = {
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
			BouldyGiftRepeatable22 = {
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
			BouldyGiftRepeatable23 = {
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
			BouldyGiftRepeatable24 = {
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
			BouldyGiftRepeatable25 = {
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
			BouldyGiftRepeatable26 = {
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
			BouldyGiftRepeatable27 = {
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
			BouldyGiftRepeatable28 = {
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
			BouldyGiftRepeatable29 = {
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

		GiftGivenVoiceLines = {
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,
		},

		OnHitFunctionName = "BouldyHitPresentation",
		OnHitVoiceLines = {
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.25,
			ObjectType = "NPC_Sisyphus_01",
			Cooldowns = {
				{ Name = "SisyphusAnyQuipSpeech", Time = 7 },
			},

			-- No use in that.
			{ Cue = "/VO/Sisyphus_0066" },
			-- Don't bother, Prince.
			-- { Cue = "/VO/Sisyphus_0068" },
			-- Come on, now.
			{ Cue = "/VO/Sisyphus_0069" },
			-- Oh come now.
			{ Cue = "/VO/Sisyphus_0070" },
			-- Why bother.
			{ Cue = "/VO/Sisyphus_0071" },
			-- Very funny, Prince.
			-- { Cue = "/VO/Sisyphus_0073" },
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

		InteractTextLineSets = {
			-- not learned of her through orpheus, not met hydra
			EurydiceFirstMeeting01_A = {
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
			EurydiceFirstMeeting01_B = {
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
			EurydiceFirstMeeting01_C = {
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
			EurydiceAboutOrpheus01 = {
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
			EurydiceAboutOrpheus01_B = {
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
			EurydiceAboutOrpheus02 = {
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

			EurydiceAboutOrpheus03 = {
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
			EurydiceAboutOrpheus04 = {
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

			EurydiceProgressWithOrpheus01 = {
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
			EurydiceProgressWithOrpheus02 = {
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

			EurydiceProgressWithOrpheus_SongReaction01 = {
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
			EurydiceProgressWithOrpheus03 = {
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

			EurydiceAboutSingersReunionQuestComplete01 = {
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
			EurydiceAboutSingersReunionQuestComplete02 = {
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
			EurydiceAboutSingersReunionQuestComplete03 = {
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
			EurydiceAboutSingersReunionQuestComplete04 = {
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
			EurydiceAboutSingersReunionQuestComplete05 = {
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
			EurydiceMentionsOrpheus01 = {
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
			EurydiceMentionsOrpheus01_B = {
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

			EurydiceAboutHermes01 = {
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
			EurydiceAboutNymphs01 = {
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
			EurydiceAboutPersephone01 = {
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
			EurydiceAboutPersephone01_B = {
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

			EurydicePostEpilogue01 = {
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
			EurydicePostEpilogue02 = {
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

			EurydiceAboutMusic01 = {
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

			EurydiceAboutOnions01 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "EurydiceGift04" },
				RequiredConsumablesThisRun = {
					Count = 1,
					Names = {
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

			EurydiceAboutLove01 = {
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

			EurydiceMiscMeeting01 = {
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
			EurydiceMiscMeeting02 = {
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
			EurydiceMiscMeeting03 = {
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
			EurydiceMiscMeeting04 = {
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
			EurydiceMiscMeeting05 = {
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
			EurydiceMiscMeeting06 = {
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

			EurydiceAboutAcorn01 = {
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
			EurydiceAboutAcorn02 = {
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
			EurydiceAboutDistantMemory01 = {
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

			EurydiceLowHealth01 = {
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
			EurydiceLowHealth02 = {
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
			EurydiceLowHealth03 = {
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
			EurydiceLowHealth04 = {
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

			OrpheusWithEurydice01 = {
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydice02 = {
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydice03 = {
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceEndTheme01 = {
				PlayOnce = true,
				SuperPriority = true,
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat01 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat02 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat03 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat04 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat05 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat06 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat07 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat08 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat09 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat10 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat11 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat12 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat13 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat14 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat15 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat16 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat17 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat18 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat19 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat20 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat21 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat22 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat23 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat24 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat25 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat01 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat02 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat03 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat04 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat05 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat06 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceInTheBloodChat07 = {
				Skip = true,
				UseableOffSource = true,
				StatusAnimation = false,
			},
		},

		RepeatableTextLineSets = {
			EurydiceChat01 = {
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
			EurydiceChat02 = {
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
			EurydiceChat03 = {
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
			EurydiceChat04 = {
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
			EurydiceChat05 = {
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
			EurydiceChat06 = {
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
			EurydiceChat07 = {
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
			EurydiceChat08 = {
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
			EurydiceChat09 = {
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
			EurydiceChat11 = {
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
			EurydiceChat12 = {
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
			EurydiceChat13 = {
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
			EurydiceChat14 = {
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
			EurydiceChat15 = {
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

			EurydiceChatExtra01 = {
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
			EurydiceChatExtra02 = {
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
			EurydiceChatExtra03 = {
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
			EurydiceChatExtra04 = {
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
			EurydiceChatExtra05 = {
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
			EurydiceChatExtra06 = {
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
			EurydiceChatExtra07 = {
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
			EurydiceChatExtra08 = {
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
			EurydiceChatExtra09 = {
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
			EurydiceChatExtra10 = {
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
			EurydiceChatExtra11 = {
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
			EurydiceChatExtra12 = {
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
			EurydiceChatExtra13 = {
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
			EurydiceMadChat01 = {
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
			EurydiceMadChat02 = {
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
			EurydiceMadChat03 = {
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
			EurydiceMadChat05 = {
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
			EurydiceMadChat06 = {
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
			EurydiceMadChat07 = {
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
			EurydiceMadChat09 = {
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
			EurydiceMadChat10 = {
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
			EurydiceAintEvenMadChat01 = {
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
			EurydiceAintEvenMadChat02 = {
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
			EurydiceAintEvenMadChat03 = {
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

			EurydiceAintEvenMadChat04 = {
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

			EurydiceAintEvenMadChat05 = {
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
			EurydiceAintEvenMadChat06 = {
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
			EurydiceAintEvenMadChat07 = {
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
			EurydiceAintEvenMadChat08 = {
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
			EurydiceAintEvenMadChat09 = {
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
			-- Custom: Renamed from EurydiceAintEvenMadChat10 as it was a duplicate
			EurydiceAintEvenMadChat10_A = {
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
			EurydiceAintEvenMadChat10 = {
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
			EurydiceAintEvenMadChat11 = {
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

			OrpheusWithEurydiceMiscChat01 = {
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat02 = {
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat03 = {
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat04 = {
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat05 = {
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat06 = {
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat07 = {
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat08 = {
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},
			OrpheusWithEurydiceMiscChat09 = {
				UseableOffSource = true,
				Skip = true,
				StatusAnimation = false,
			},

		},

		GiftTextLineSets = {
			EurydiceGift01 = {
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
			EurydiceGift02 = {
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
			EurydiceGift03 = {
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
			EurydiceGift04 = {
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
			EurydiceGift05 = {
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

			EurydiceGift06 = {
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
			EurydiceGift07 = {
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
			EurydiceGift08 = {
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

		GiftGivenVoiceLines = {
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- Thanks so much!
			{ Cue = "/VO/ZagreusField_2514" },
		},

		CharacterInteractions = {
			Rescue = {
				VoiceLines = {

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
		OnHitVoiceLines = {
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

		SpawnUnthreadedEvents = {
			{
				-- Standup after question completion
				FunctionName = "GenericPresentation",
				Args = {
					SetAnimation = "PatroclusIdleStanding",
					OverwriteSourceKeys = {
						AnimOffsetZ = 205,
						Portrait = "Portrait_Patroclus_Neutral_01",
					},
					ActivateIds = { 563040 },
				},
				GameStateRequirements = {
					RequiredTextLines = { "MyrmidonReunionQuestComplete" },
				},
			},
		},

		InteractTextLineSets = {
			PatroclusFirstMeeting = {
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
			PatroclusMeeting02 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusMeeting02B" },
				RequiredCodexEntry = {
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
			PatroclusMeeting02B = {
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
			PatroclusMeeting03 = {
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
			PatroclusMeeting04 = {
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
			PatroclusMeeting05 = {
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
			PatroclusMeeting06 = {
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
			PatroclusMeeting06B = {
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
			PatroclusMeeting07 = {
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
			PatroclusMeeting07B = {
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
			PatroclusMeeting08 = {
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
			PatroclusMeeting09 = {
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
			PatroclusMeeting10 = {
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
			PatroclusMeeting11 = {
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
			PatroclusAboutBracer01A = {
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PatroclusFirstMeeting" },
				RequiredFalseTextLines = { "AchillesGift08", "AchillesGift06_A", "PatroclusAboutBracer01B", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D", "PatroclusAboutBracer01E", "PatroclusAboutAchilles02", "MyrmidonReunionQuestComplete" },
				RequiredTrait = "DirectionalArmorTrait",
				RequiredCodexEntry = {
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
			PatroclusAboutBracer01B = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PatroclusFirstMeeting", "AchillesGift08", "AchillesGift06_A" },
				RequiredFalseTextLines = { "PatroclusAboutAchilles01B", "PatroclusAboutBracer01A", "PatroclusAboutBracer01C", "PatroclusAboutBracer01D", "PatroclusAboutBracer01E", "MyrmidonReunionQuestComplete" },
				RequiredTrait = "DirectionalArmorTrait",
				RequiredCodexEntry = {
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
			PatroclusAboutBracer01C = {
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
			PatroclusAboutBracer01D = {
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
			PatroclusAboutBracer01E = {
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
			PatroclusAboutAchillesAspect01 = {
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
			PatroclusAboutAchillesAspect02 = {
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
			PatroclusAboutAchilles01A = {
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
			PatroclusAboutAchilles01B = {
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
			PatroclusAboutAchilles01C_01 = {
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
			PatroclusAboutAchilles01C_02 = {
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

			PatroclusAboutAchilles02 = {
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
			PatroclusAboutAchilles03A = {
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
			PatroclusAboutAchilles03B = {
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

			PatroclusAboutAchilles04 = {
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
			PatroclusAboutAchilles05 = {
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
			PatroclusAboutAchilles06 = {
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
			PatroclusAboutMyrmidonReunionQuest01 = {
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

			PatroclusWithAchilles01 = {
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
			PatroclusWithAchilles02 = {
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
			PatroclusWithAchilles03 = {
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

			PatroclusAfterMyrmidonReunionQuest01 = {
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
			PatroclusAfterMyrmidonReunionQuest02 = {
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

			PatroclusPostEnding01 = {
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

			PatroclusPostEpilogue01 = {
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

			PatroclusAboutKeepsake01 = {
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
			PatroclusAboutKeepsake02 = {
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
			PatroclusAboutWar01 = {
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
			PatroclusAboutYoungAchilles01 = {
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
			PatroclusAboutTheseus01 = {
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
			PatroclusAboutTheseus02 = {
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
			PatroclusAboutTheseus03 = {
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
			PatroclusAboutMinotaur01 = {
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

			PatroclusAboutHeroes01 = {
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
			PatroclusAboutGods01 = {
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
			PatroclusAboutLove01_A = {
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
			PatroclusAboutLove01_B = {
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

			PatroclusAboutTrinkets01 = {
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
			PatroclusAboutFishing01 = {
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
			PatroclusAboutLegendary01 = {
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
			PatroclusLowHealth01 = {
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
			PatroclusLowHealth02 = {
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

		RepeatableTextLineSets = {
			PatroclusChat01 = {
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
			PatroclusChat02 = {
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
			PatroclusChat03 = {
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
			PatroclusChat04 = {
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
			PatroclusChat05 = {
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
			PatroclusChat06 = {
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
			PatroclusChat07 = {
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
			PatroclusChat08 = {
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
			PatroclusChat09 = {
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
			PatroclusChat10 = {
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
			PatroclusChat11 = {
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
			PatroclusChat12 = {
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
			PatroclusChat13 = {
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
			PatroclusChat14 = {
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
			PatroclusChat15 = {
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
			PatroclusChat16 = {
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
			PatroclusChat17 = {
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
			PatroclusChat18 = {
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
			-- Custom: Renamed from PatroclusChat19 as it was a duplicate
			PatroclusChat19_A = {
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
			PatroclusChat19 = {
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
			PatroclusChat20 = {
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
			PatroclusChat21 = {
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
			PatroclusChat22 = {
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
			PatroclusChat23 = {
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
			PatroclusChat24 = {
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
			PatroclusChat25 = {
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
			PatroclusChat26 = {
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
			-- Custom: Renamed from PatroclusChat27 as it was a duplicate
			PatroclusChat27_A = {
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
			PatroclusChat27 = {
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
			PatroclusChat28 = {
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
			PatroclusChat29 = {
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
			PatroclusChat30 = {
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
			PatroclusChat31 = {
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
			PatroclusChat32 = {
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
			PatroclusChat33 = {
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
			PatroclusChat34 = {
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
			PatroclusChat35 = {
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
			PatroclusChat36 = {
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
			PatroclusChat37 = {
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
			PatroclusChat38 = {
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
			PatroclusChat39 = {
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
			PatroclusChat40 = {
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
			PatroclusChat41 = {
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
			PatroclusStandoffish01 = {
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
			PatroclusStandoffish02 = {
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
			PatroclusStandoffish03 = {
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
			PatroclusStandoffish04 = {
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
			PatroclusStandoffish05 = {
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
			PatroclusStandoffish06 = {
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
			PatroclusStandoffish07 = {
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
			PatroclusStandoffish08 = {
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
			PatroclusStandoffish09 = {
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
			PatroclusStandoffish10 = {
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

			PatroclusReunionChat01 = {
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
			PatroclusReunionChat02 = {
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
			PatroclusReunionChat03 = {
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
			PatroclusReunionChat04 = {
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
			PatroclusReunionChat05A = {
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
			PatroclusReunionChat05 = {
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
			PatroclusReunionChat06 = {
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
			PatroclusReunionChat07 = {
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
			PatroclusReunionChat08 = {
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
			PatroclusReunionChat09 = {
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
			PatroclusReunionChat10 = {
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
			PatroclusReunionChat11 = {
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
			PatroclusReunionChat12 = {
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
			PatroclusReunionChat13 = {
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
			PatroclusReunionChat14 = {
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
			PatroclusReunionChat15A = {
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
			PatroclusReunionChat15B = {
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
			PatroclusReunionChat15 = {
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
			PatroclusReunionChat16 = {
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
			PatroclusReunionChat17A = {
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
			PatroclusReunionChat17 = {
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

		GiftTextLineSets = {
			PatroclusGift01 = {
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
			PatroclusGift02 = {
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
			PatroclusGift03 = {
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
			PatroclusGift04 = {
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
			PatroclusGift05 = {
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
			PatroclusGift06 = {
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
			PatroclusGift07_A = {
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
			PatroclusGift08_A = {
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
			PatroclusGift07 = {
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
			PatroclusGift08 = {
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

		GiftGivenVoiceLines = {
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayFromTarget = true,

			-- I am most grateful to you, sir.
			{ Cue = "/VO/ZagreusField_1732" },
		},

		CharacterInteractions = {
			Rescue = {
				VoiceLines = {
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
		OnHitVoiceLines = {
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

		BossPresentationIntroTextLineSets = {
			CerberusStyxMeeting01 = {
				PlayOnce = true,
				EndVoiceLines = {
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
					PreLineFunctionName = "ResumeStyxMusic",
					IsNarration = true,
					PreLineWait = 1.0,
					StartSound = "/VO/CerberusWhineSad",
					Text =
					"{#DialogueItalicFormat}After a moment's hesitation and deliberation, the voracious hound of hell barks once, affirmatively, toward the Prince, who sets off in search of something that can sate the monster's appetites.",
				},
			},
		},

		InteractTextLineSets = {
			-- key item delivered / boss door unlock events
			CerberusBossDoorUnlock01 = {
				PlayOnce = true,
				UseableOff = true,
				RequiredRoomThisRun = "D_Reprieve01",
				Priority = true,
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

			CerberusBossDoorUnlockRepeatable01 = {
				PlayOnce = true,
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable01_Alt = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02", "CerberusBossDoorUnlockRepeatable03", "CerberusBossDoorUnlockRepeatable04", "CerberusBossDoorUnlockRepeatable05", "CerberusBossDoorUnlockRepeatable06", "CerberusBossDoorUnlockRepeatable07" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable02 = {
				PlayOnce = true,
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable02_Alt = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02", "CerberusBossDoorUnlockRepeatable03", "CerberusBossDoorUnlockRepeatable04", "CerberusBossDoorUnlockRepeatable05", "CerberusBossDoorUnlockRepeatable06", "CerberusBossDoorUnlockRepeatable07" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable03 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
						UseAdditionalFootstepSounds = true,
						FootstepSound = "/Leftovers/SFX/FootstepsHuge",
						MoveSound = "/Leftovers/SFX/BallImpact",
						HeroVoiceLines = "ClearedCerberusVoiceLines"
					},
					Text = "{#DialogueItalicFormat}The fearsome Cerberus accepts the Satyr sack."
				},
			},
			CerberusBossDoorUnlockRepeatable04 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable05 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable06 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable07 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable08 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable09 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable10 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable11 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable12 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable13 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable14 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
			CerberusBossDoorUnlockRepeatable15 = {
				UseableOff = true,
				RequiredTextLines = { "CerberusBossDoorUnlock01", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02" },
				RequiredRoomThisRun = "D_Reprieve01",
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
		OnHitVoiceLines = {
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

	-- Persephone, Id = 559274
	-- Alt Spawn Points: { 555708 [garden], 391561 [with hades], 555710 [with cerberus] }
	ModsNikkelMHadesBiomes_NPC_Persephone_01 = {
		InheritFrom = { "NPC_Neutral" },

		UseText = "UseTalkToFemaleGhost",
		Portrait = "Portrait_Persephone_Default_01",
		AnimOffsetZ = 200,
		StartTextLinesAngleTowardHero = true,
		Groups = { "NPCs" },

		Binks = {
			"NPC_PersephoneGardenIdleHip_Bink",
			"NPC_PersephoneGardenGreeting_Bink",
			"NPC_PersephoneGardenWalk_Bink",
			"NPC_PersephoneGardenWalkStop_Bink",
			"NPC_PersephoneGardenDismiss_Bink",
			"NPC_PersephoneGardenVulnerable_Bink",
		},

		InteractTextLineSets = {
			PersephoneFirstMeeting = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredRoom = "E_Story01",
				EndVoiceLines = {
					PreLineWait = 1.8,
					Queue = "Interrupt",
					NoTarget = true,
					-- However long... it takes...
					{ Cue = "/VO/ZagreusField_3611" },
					-- Urgh... can't... hold... on...
					{ Cue = "/VO/ZagreusField_4646", PreLineWait = 2.5 },
				},
				{
					Cue = "/VO/Persephone_0021",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Mom = true },
					Speaker = "NPC_Persephone_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text =
					"Pray, who might you be, wandering all the way out here? You're trespassing on private property, you know. Speak up!"
				},
				{
					Cue = "/VO/ZagreusField_3602",

					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Erm{#PreviousFormat}, you must be... Persephone. My name is Zagreus, and... I think I might be your son."
				},

				{
					Cue = "/VO/Persephone_0022",

					MusicActiveStems = { "Percussion", "Room" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					PreLineWait = 0.15,
					Emote = "PortraitEmoteSurprise",
					Speaker = "NPC_Persephone_Unnamed_01",
					SpeakerLabelOffsetY = 18,
					Portrait = "Portrait_Persephone_FiredUp_01",
					PreLineAnim = "PersephoneGarden_Dismiss",
					Text =
					"{#DialogueItalicFormat}What{#PreviousFormat}?! How dare...! Get out of here! Get out, or I shall make you!! {#DialogueItalicFormat}Out {#PreviousFormat}with you!"
				},
				{
					Cue = "/VO/ZagreusField_3603",

					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					Emote = "PortraitEmoteFiredUp",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"No!! So then you {#DialogueItalicFormat}are {#PreviousFormat}her. I, I don't care if you hate me, but I'm not leaving until I get some answers! I never even knew you existed. Why did you leave me?"
				},
				{
					Cue = "/VO/Persephone_0023",

					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Persephone_Joyful_01",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "PersephoneGarden_Shocked",
					Text =
					"You died! You, you {#DialogueItalicFormat}died{#PreviousFormat}...! Those burning feet, they... sputtered out, when you were born. But... now you're standing here before me. How...?"
				},
				{
					Cue = "/VO/ZagreusField_3604",

					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I died? I died... what, you mean {#DialogueItalicFormat}permanently {#PreviousFormat}died, but, I'm alive! Oh, gods... you never even knew I existed, either."
				},
				{
					Cue = "/VO/Persephone_0024",

					MusicActiveStems = { "Percussion", "Room" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Persephone_Joyful_01",
					PortraitExitAnimation = "Portrait_Persephone_Joyful_01_Exit",
					PostLineAnim = "ZagreusInteractionComeHither_Start",
					PostLineAnimTarget = "Hero",
					PostLineThreadedFunctionName = "TimePassesPresentation",
					PostLineFunctionArgs = { PreTextWait = 1.5, HeroAnim = "ZagreusTalkDenialStart", GlobalVoiceLines = "PersephoneFirstMeetingIntermissionVoiceLines", PersephoneMusicFullBlast = true },
					EndSound = "/Leftovers/Menu Sounds/EmoteThoughtful",
					Text =
					"Alive! Zagreus, he... even kept your name! You live, how can this be, you live? {#DialogueItalicFormat}You live{#PreviousFormat}...! Oh, the cruel Fates! My son!"
				},
				-- time passes
				{
					Cue = "/VO/ZagreusField_3606",

					-- MusicActiveStems = { "WoodWinds" },
					-- MusicMutedStems = { "Percussion", "Room" },

					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					FadeOutTime = 0.6,
					FullFadeTime = 6.5,
					FadeInTime = 1.8,
					PreLineWait = 0.2,
					FadeInSound = "/Leftovers/Menu Sounds/EmoteExcitement",
					InterSceneWaitTime = 0.2,
					MusicSection = 3,
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",

					TeleportToId = 571466,
					TeleportOffsetY = 80,
					TeleportOffsetX = 90,
					TeleportHeroToId = 571466,
					TeleportHeroOffsetX = -30,
					TeleportHeroOffsetY = 120,
					AngleHeroTowardTargetId = 571468,
					AngleTowardHero = true,

					Text =
					"...In short, I beat him, finally, though he did everything he could to prevent our meeting here like this. But there's something he wanted me to tell you, in the end. He said to tell you Cerberus is doing very well."
				},
				{
					Cue = "/VO/Persephone_0025",

					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds", "Room", "Trombones" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					PreLineAnim = "PersephoneGarden_Vulnerable_ShockToThoughtful",
					Text =
					"{#DialogueItalicFormat}Ah{#PreviousFormat}. He told you that, did he. That's good. That's good! Though, tell me something, Zagreus. How... is it that you found me? To have journeyed all this way, I scarce believe it.... Zagreus?"
				},
				{
					Cue = "/VO/ZagreusField_3607",

					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion", "Strings" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Emote = "PortraitEmoteDepressed",
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Ugh{#PreviousFormat}... Oh, it's... guess I'm just a little tired, that's all. Not accustomed to the weather, as I think you call it."
				},
				{
					Cue = "/VO/Persephone_0026",

					MusicActiveStems = { "Percussion", "Strings" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Persephone_Apprehensive_01",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					PreLineWait = 0.35,
					Text = "No... no, that isn't it, it's that... you cannot stay here. You can't stay here."
				},
				{
					Cue = "/VO/ZagreusField_3608",

					MusicActiveStems = { "WoodWinds", "Room" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Text = "Really, you're... {#DialogueItalicFormat}heh{#PreviousFormat}... kicking me out? Why?"
				},
				{
					Cue = "/VO/Persephone_0027",

					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Persephone_Calculating_01",
					Text =
					"The Fates are cruel, Zagreus. You're bound to that place... same as your father. So they would have us say good-bye, for now. My heart soars, knowing you live. Then it breaks, that our time together was so brief."
				},
				{
					Cue = "/VO/ZagreusField_3609",

					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Text =
					"No... I can... come back... I can come back, now that I found you, he... maybe he'll just let me come back."
				},
				{
					Cue = "/VO/Persephone_0028",

					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Persephone_FiredUp_01",
					PreLineAnim = "PersephoneGarden_Dismiss",
					Text =
					"You tell him I demand it. And I demand he also tell me how come he, or for that matter Nyx, never sent notice that you lived! Olympus is all rife with schemers, but I was so naive to think that they were different."
				},
				{
					Cue = "/VO/ZagreusField_3610",

					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,

					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Text = "I'll tell him... I'll tell him, I... feel awful. I... I have to go."
				},

				{
					Cue = "/VO/Persephone_0029",

					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					Portrait = "Portrait_Persephone_Apprehensive_01",
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					Text =
					"The Styx shall take you, then. Oh, Zagreus. Farewell, my son. Won't you come back to me? When you are able, please. Come back. I shall be waiting here. However long it takes."
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenFirstGreeting,
			},

			PersephoneMeeting02 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PersephoneFirstMeeting" },
				RequiredRoom = "E_Story01",
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 1.8,
					Queue = "Interrupt",
					NoTarget = true,
					-- Until we... ungh.
					{ Cue = "/VO/ZagreusField_3628" },
					-- No... not... yet...
					-- { Cue = "/VO/ZagreusField_4649", PreLineWait = 2.5 },
				},
				{
					Cue = "/VO/Persephone_0042",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Mom = true },
					Portrait = "Portrait_Persephone_Joyful_01",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					Text =
					"I begged the Fates that you'd return to me. Perhaps I ought to be more careful how I speak of them. Tell me, how was your journey? What happened?"
				},

				{
					Cue = "/VO/ZagreusField_3622",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Father didn't make it any easier for me. Nor would he tell me why he never sent for you, after you left. So, I don't know, what's going on, still, but... I wanted to see you, again."
				},

				{
					Cue = "/VO/Persephone_0043",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Text =
					"I wanted to see you, too. Come, speak quickly with me, that our time together here may be as full as possible, all right?"
				},

				{
					Cue = "/VO/ZagreusField_3623",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "I just... I need to know what happened, between you and Father. Why are you here, and not with us?"
				},

				{
					Cue = "/VO/Persephone_0044",
					MusicActiveStems = { "Percussion", "Room" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Calculating_01",
					Text =
					"I couldn't live with myself anymore, down there. After I left Olympus, a long story in itself, I came to be with your father, in the Underworld. It was a shock, to say the least. The others in your father's house were welcoming enough, but... I never felt that I belonged."
				},

				{
					Cue = "/VO/ZagreusField_3624",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I know the feeling, I think. But you stayed. Long enough to have me. Those whom I've spoken to about you, it's as you said, they have fond memories of you. And then, you even had a child. Did Father... did he mistreat you?"
				},

				{
					Cue = "/VO/Persephone_0045",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					PreLineAnim = "PersephoneGarden_Greeting",
					Text =
					"No, no. Your father could be very difficult. Though, he was gentle, with me. Soon enough, we got on fine, better than fine, at times, but... when I was with child... why, I struggled terribly. Because... a child born of surface-dwellers could not live, down there."
				},

				{
					Cue = "/VO/ZagreusField_3625",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Could not live down there, according to whom, exactly? The Fates?"
				},

				{
					Cue = "/VO/Persephone_0046",
					MusicSection = 3,
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Calculating_01",
					Text =
					"According to them, yes. According to your father, and to Nyx. Even having heard... I took my chances, anyway. But when you emerged stillborn... it was too much. I fled. I fled, and came to reside here. Above the notice of the Underworld. Beneath the notice of Olympus."
				},

				{
					Cue = "/VO/ZagreusField_3626",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Emote = "PortraitEmoteDepressed",
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Urgh{#PreviousFormat}... but... why would Father lie to you? If he never wanted you... or never wanted me... surely he had the means."
				},

				{
					Cue = "/VO/Persephone_0047",
					MusicActiveStems = { "Percussion", "Room" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					Text =
					"I don't know. I'm wondering the same. But, oh, look at you, Zagreus! We're running out of time. It's happening again! Stay with me, please?"
				},

				{
					Cue = "/VO/ZagreusField_3627",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					PreLineWait = 0.35,
					Text = "...I'm trying... but I can't... stay that much longer... I don't think."
				},

				{
					Cue = "/VO/Persephone_0048",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text =
					"Oh, my dear son! Then please... ask Hades what you asked of me! Why he would lie? Tell him I must know, the same as you. And you farewell. Until we meet again!"
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},

			PersephoneMeeting03 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PersephoneMeeting02" },
				RequiredRoom = "E_Story01",
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 1.8,
					Queue = "Interrupt",
					NoTarget = true,
					-- It's just... a hunch... of mine...
					{ Cue = "/VO/ZagreusField_3634" },
					-- I'll... be... back...
					{ Cue = "/VO/ZagreusField_4650", PreLineWait = 2.5 },
				},
				{
					Cue = "/VO/ZagreusField_3629",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Son = true },
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Mother, I... discovered how come Father led you to believe that I could not survive past birth. He didn't lie to you, exactly. So he says."
				},

				{
					Cue = "/VO/Persephone_0049",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_FiredUp_01",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "PersephoneGarden_Dismiss",
					Text =
					"Wait, slow down, Zagreus, what do you mean? He told me you would not survive your birth, yet here you are. How wasn't that a lie?"
				},

				{
					Cue = "/VO/ZagreusField_3630",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Because... he thought it was the truth. The Fates appointed him dominion over the entire Underworld. But he would never have an heir, so he was led to understand. He never expected me to be born, much less survive."
				},

				{
					Cue = "/VO/Persephone_0050",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_FiredUp_01",
					Text =
					"He never expected you to survive? Then, forgive my asking, but... why did you? {#DialogueItalicFormat}How {#PreviousFormat}did you? The Fates are not known for making mistakes when it comes to such things."
				},

				{
					Cue = "/VO/ZagreusField_3631",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Nyx saved my life. Or gave me life, I guess. Then raised me in your absence. The Fates are her daughters, right? Maybe she persuaded them to go easier on me. She cannot say more. In any case, apparently it took her quite a while to revive me, and... by then, you were gone."
				},

				{
					Cue = "/VO/Persephone_0051",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Calculating_01",
					Text =
					"Nyx... of course she was involved. I only managed to escape because of her. Then, she restored my stillborn son to life, and nurtured him? And, I never would have known, unless that child, fully grown and having learned the truth, defied his father, and then found me here?"
				},

				{
					Cue = "/VO/ZagreusField_3632",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
					PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteDepressed", Anim = "ZagreusInjured_IdleToSick", AnimTarget = "Hero", DoShake = true, Portrait = "Portrait_Zag_Unwell_01", WaitTime = 5.2 },
					Text =
					"Yes. Although, we still don't know how come Father and Nyx never sent for you. Though, {#DialogueItalicFormat}ungh{#PreviousFormat}, let me ask you something, Mother, if you please. If you had found out... that I was born, and very much alive... would you have come back?"
				},

				{
					Cue = "/VO/Persephone_0052",
					MusicActiveStems = { "Percussion", "Room" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Joyful_01",
					PreLineAnim = "PersephoneGarden_Shocked",
					PostLineAnim = "PersephoneGarden_Vulnerable_ReturnToIdle",
					MusicSection = 3,
					Text =
					"Would I have come back... to see my only child? Had I but known you lived... I would have gladly gone through hell again to see you, Zagreus. Of course I would have."
				},

				{
					Cue = "/VO/ZagreusField_3633",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Text =
					"Well then... what if... {#DialogueItalicFormat}urgh{#PreviousFormat}... what if Father... didn't want you... doing that?"
				},

				{
					Cue = "/VO/Persephone_0053",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					Portrait = "Portrait_Persephone_Apprehensive_01",
					PreLineAnim = "PersephoneGarden_Greeting",
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					Text =
					"What if he didn't want me coming back to him? Or seeing you? Oh no, you're fading again, Zagreus. You've pushed yourself too hard! But what is it you meant, by what you said?"
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},

			PersephoneMeeting04 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PersephoneMeeting03" },
				RequiredRoom = "E_Story01",
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 1.8,
					Queue = "Interrupt",
					NoTarget = true,
					-- I... I won't be long...
					{ Cue = "/VO/ZagreusField_3639" },
					-- Urgh... mmm... ungh...
					{ Cue = "/VO/ZagreusField_4651", PreLineWait = 2.5 },
				},
				{
					Cue = "/VO/Persephone_0054",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Mom = true },
					Text =
					"So good to see you, again, Zagreus. Since last you left, I couldn't help but think the worst, about what happened after I had left... or soon before. You mentioned Nyx... you don't suppose that she and Hades... wanted me out of the way?"
				},

				{
					Cue = "/VO/ZagreusField_3635",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I just... don't think that can be. Though, let me ask you. How long did you know Father? And Nyx, for that matter? Did they seem trustworthy?"
				},

				{
					Cue = "/VO/Persephone_0055",
					Portrait = "Portrait_Persephone_Calculating_01",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Text =
					"Yes. I knew them long enough to have decided yes, that they were trustworthy. As much as anyone I've ever met. But I also know never to be trusting to a fault. I have to consider the possibility I was deceived."
				},

				{
					Cue = "/VO/ZagreusField_3636",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Especially since neither of them is being forthcoming with me even now, right? And yet, I have this feeling something else is going on, Mother. The way that Father speaks of you, the way Nyx speaks of you... I think... they care for you."
				},

				{
					Cue = "/VO/Persephone_0056",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Default_01",
					MusicSection = 3,
					Emote = "PortraitEmoteCheerful",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					Text =
					"{#DialogueItalicFormat}Ah, hahaha{#PreviousFormat}! Well, they have a funny way of showing it, I think. Your father, so... you have to get through {#DialogueItalicFormat}him {#PreviousFormat}each time you visit {#DialogueItalicFormat}me{#PreviousFormat}?"
				},

				{
					Cue = "/VO/ZagreusField_3637",
					MusicActiveStems = { "WoodWinds", "Room" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenial_Full",
					PreLineAnimTarget = "Hero",
					Text = "I do. Mother, what if... what if Father thinks that he's protecting you? Have you... considered that?"
				},

				{
					Cue = "/VO/Persephone_0057",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_FiredUp_01",
					PreLineAnim = "PersephoneGarden_Greeting",
					Text = "Protecting me? Why Zagreus, what do you mean by that? As you can see, I can fend for myself."
				},

				{
					Cue = "/VO/ZagreusField_3638",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Emote = "PortraitEmoteDepressed",
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Text =
					"Well... {#DialogueItalicFormat}urgh{#PreviousFormat}... you're from Olympus, aren't you? But... the gods, none of them seem to know... you're here... so..."
				},

				{
					Cue = "/VO/Persephone_0058",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					Portrait = "Portrait_Persephone_FiredUp_01",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					Text = "What, how would you know something like that? Zagreus? Ah, curse the Fates, you're leaving me again..."
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},

			-- assuming you've met the gods a bunch, alt below
			PersephoneMeeting05_A = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PersephoneMeeting04" },
				RequiredFalseTextLines = { "PersephoneMeeting05_B" },
				RequiredMinCompletedRuns = 15,
				RequiredRoom = "E_Story01",
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 1.8,
					Queue = "Interrupt",
					NoTarget = true,
					-- When I... return...
					{ Cue = "/VO/ZagreusField_3646" },
					-- Khh... uhhh... urgh...
					{ Cue = "/VO/ZagreusField_4652", PreLineWait = 2.5 },
				},
				{
					Cue = "/VO/Persephone_0059",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Mom = true },
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text = "Son, I have to ask you, how much do you know about your relatives upon Olympus?"
				},

				{
					Cue = "/VO/ZagreusField_3640",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I think I know quite a bit by now. I've been in steady contact with Athena, Zeus, and other members of the family ever since I first left Father's House... they've been assisting me in getting here."
				},

				{
					Cue = "/VO/Persephone_0060",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_FiredUp_01",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					Text = "No... Zagreus, what have you done? You've led them {#DialogueItalicFormat}here{#PreviousFormat}?"
				},

				{
					Cue = "/VO/ZagreusField_3642",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"No, no, they think... they think I'm trying to escape from Father so that I can join them on their mountaintop. At least I {#DialogueItalicFormat}think {#PreviousFormat}that's what they think. Most of them, anyway."
				},

				{
					Cue = "/VO/Persephone_0061",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text = "But then... does Hades know of this? That Olympus is involved?"
				},

				{
					Cue = "/VO/ZagreusField_3643",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"He does. Both he and Nyx. In fact, it's Nyx who put me and Olympus into contact. I could never have broken free of the Underworld if not for their help."
				},

				{
					Cue = "/VO/Persephone_0062",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text =
					"So Nyx and Hades are against each other, then. And Olympus is helping you... but they don't know I'm here, as far as you're aware?"
				},

				{
					Cue = "/VO/ZagreusField_3644",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					MusicSection = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"That's right. More or less. Nyx and Father seem to put up with each other. Don't seem to have much of a choice. Though, ever since I learned of you, Nyx has been helping me to find you... while Father's tried to stop me."
				},

				{
					Cue = "/VO/Persephone_0063",
					MusicActiveStems = { "Percussion", "Room" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_FiredUp_01",
					PreLineAnim = "PersephoneGarden_Dismiss",
					Text =
					"That fool... what was he thinking? What {#DialogueItalicFormat}is {#PreviousFormat}he thinking...? Do you suppose... he thinks that he's protecting me from {#DialogueItalicFormat}them{#PreviousFormat}? Oh, no..."
				},

				{
					Cue = "/VO/ZagreusField_3645",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Emote = "PortraitEmoteDepressed",
					Text =
					"I... {#DialogueItalicFormat}urgh{#PreviousFormat}... I think maybe he does think so, indeed... because, now having met my relatives upon Olympus, I... can definitely see that they can be a bit... vindictive about things."
				},

				{
					Cue = "/VO/Persephone_0064",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					Portrait = "Portrait_Persephone_Calculating_01",
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					Text =
					"Vindictiveness runs in the family, my son. Then, if Olympus is involved, that would explain a lot. I'm here, not there with them, as you can see. But, oh, it seems we'll have to speak some more, when next you return..."
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},
			-- assuming you haven't met the gods much
			PersephoneMeeting05_B = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PersephoneMeeting04" },
				RequiredFalseTextLines = { "PersephoneMeeting05_A" },
				RequiredMaxCompletedRuns = 14,
				RequiredRoom = "E_Story01",
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 1.8,
					Queue = "Interrupt",
					NoTarget = true,
					-- When I... return...
					{ Cue = "/VO/ZagreusField_3646" },
					-- Khh... uhhh... urgh...
					{ Cue = "/VO/ZagreusField_4652", PreLineWait = 2.5 },
				},
				{
					Cue = "/VO/Persephone_0059",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Mom = true },
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text = "Son, I have to ask you, how much do you know about your relatives upon Olympus?"
				},

				{
					Cue = "/VO/ZagreusField_3641",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"A little. I've been in contact with Athena, Zeus, and other members of the family ever since I first left Father's House... they've been assisting me in getting here."
				},

				{
					Cue = "/VO/Persephone_0060",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_FiredUp_01",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					Text = "No... Zagreus, what have you done? You've led them {#DialogueItalicFormat}here{#PreviousFormat}?"
				},

				{
					Cue = "/VO/ZagreusField_3642",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"No, no, they think... they think I'm trying to escape from Father so that I can join them on their mountaintop. At least I {#DialogueItalicFormat}think {#PreviousFormat}that's what they think. Most of them, anyway."
				},

				{
					Cue = "/VO/Persephone_0061",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text = "But then... does Hades know of this? That Olympus is involved?"
				},

				{
					Cue = "/VO/ZagreusField_3643",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"He does. Both he and Nyx. In fact, it's Nyx who put me and Olympus into contact. I could never have broken free of the Underworld if not for their help."
				},

				{
					Cue = "/VO/Persephone_0062",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text =
					"So Nyx and Hades are against each other, then. And Olympus is helping you... but they don't know I'm here, as far as you're aware?"
				},

				{
					Cue = "/VO/ZagreusField_3644",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					MusicSection = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"That's right. More or less. Nyx and Father seem to put up with each other. Don't seem to have much of a choice. Though, ever since I learned of you, Nyx has been helping me to find you... while Father's tried to stop me."
				},

				{
					Cue = "/VO/Persephone_0063",
					MusicActiveStems = { "Percussion", "Room" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_FiredUp_01",
					PreLineAnim = "PersephoneGarden_Dismiss",
					Text =
					"That fool... what was he thinking? What {#DialogueItalicFormat}is {#PreviousFormat}he thinking...? Do you suppose... he thinks that he's protecting me from {#DialogueItalicFormat}them{#PreviousFormat}? Oh, no..."
				},

				{
					Cue = "/VO/ZagreusField_3645",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Emote = "PortraitEmoteDepressed",
					Text =
					"I... {#DialogueItalicFormat}urgh{#PreviousFormat}... I think maybe he does think so, indeed... because, now having met my relatives upon Olympus, I... can definitely see that they can be a bit... vindictive about things."
				},

				{
					Cue = "/VO/Persephone_0064",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					Portrait = "Portrait_Persephone_Calculating_01",
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					Text =
					"Vindictiveness runs in the family, my son. Then, if Olympus is involved, that would explain a lot. I'm here, not there with them, as you can see. But, oh, it seems we'll have to speak some more, when next you return..."
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},

			PersephoneMeeting06 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "PersephoneMeeting05_A", "PersephoneMeeting05_B" },
				RequiredRoom = "E_Story01",
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 1.5,
					Queue = "Interrupt",
					NoTarget = true,
					-- No... what have I done...
					{ Cue = "/VO/ZagreusField_3651" },
					-- Grr... I... can't...
					{ Cue = "/VO/ZagreusField_4647", PreLineWait = 2.5 },
				},
				{
					Cue = "/VO/Persephone_0065",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Son = true },
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text =
					"I could not stand it on Olympus, Zagreus. The blustering, the posturing... my overbearing mother... none of it. I would have left the mountain voluntarily, except..."
				},

				{
					Cue = "/VO/ZagreusField_3647",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					PreLineWait = 0.35,
					Text =
					"...Except Father absconded with you, didn't he? Dragged you down with him into the Underworld. So if Olympus were to find that out... I shudder to think of the consequences."
				},

				{
					Cue = "/VO/Persephone_0066",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_FiredUp_01",
					PreLineAnim = "PersephoneGarden_Greeting",
					Text =
					"That fool is trying to protect me even now. It wasn't he who absconded with me, my son. And it's more complicated even than that. I was content to leave. Willing to make my life within the Underworld. With your father."
				},

				{
					Cue = "/VO/ZagreusField_3648",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I dare not ask who {#DialogueItalicFormat}did {#PreviousFormat}bring you to Father, then. So, essentially, you ran away from home, to live with {#DialogueItalicFormat}him{#PreviousFormat}? I mean no disrespect, but... did you realize what you were getting yourself into?"
				},

				{
					Cue = "/VO/Persephone_0067",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Calculating_01",
					MusicSection = 3,
					Text =
					"We have a tendency to be impetuous when we are younger, Zagreus. I'd heard all about your father before we met. Admired paintings of him. It was very awkward, at first. But he had a bluntness I fancied. A sense of principle. I much preferred him to his brothers, I can tell you that."
				},

				{
					Cue = "/VO/ZagreusField_3649",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Emote = "PortraitEmoteDepressed",
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Text =
					"So, {#DialogueItalicFormat}urgh{#PreviousFormat}... then you secretly left Mount Olympus to be with the god of the dead in the Underworld. And Olympus never found out. What do you suppose would happen... if they did?"
				},

				{
					Cue = "/VO/Persephone_0068",
					MusicActiveStems = { "Percussion", "Room", "Trombones" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Calculating_01",
					PreLineWait = 0.35,
					PreLineAnim = "PersephoneGarden_Vulnerable",
					Text =
					"...I think... there would be war between Olympus and your father, Zagreus, if they found out. Especially now. After all this. And after all this time. They slew their parents once. If the Titans could be wiped from this world, so can we all."
				},

				{
					Cue = "/VO/ZagreusField_3650",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion", "Trombones" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Text =
					"So it makes sense... if Father, he agrees with you, and thinks... that leaving you in hiding here, that it's the only way... he can prevent that war..."
				},

				{
					Cue = "/VO/Persephone_0069",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					Portrait = "Portrait_Persephone_Apprehensive_01",
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					PreLineWait = 0.35,
					Text =
					"I can see how your father, shrewd but also single-minded as he was, might have followed such a line of reasoning as that. Oh, Zagreus... what have I done?"
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},

			PersephoneMeeting07 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PersephoneMeeting06" },
				RequiredRoom = "E_Story01",
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					{
						PreLineWait = 1.5,
						Queue = "Interrupt",
						NoTarget = true,
						-- Mother... I... blast...!
						{ Cue = "/VO/ZagreusField_3656" },
					},
					{
						PreLineWait = 1.8,
						Queue = "Always",
						NoTarget = true,
						Source = { SubtitleColor = Color.PersephoneVoice },
						-- Goodbye...!
						{ Cue = "/VO/Persephone_0075" },
					},
				},
				{
					Cue = "/VO/Persephone_0070",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Mom = true },
					Portrait = "Portrait_Persephone_Calculating_01",
					Text =
					"Zagreus... it's wonderful to see you, but... I need to ask something of you. That you not visit me again, here in this place. Both for your safety, and for mine."
				},

				{
					Cue = "/VO/ZagreusField_3652",
					MusicActiveStems = { "WoodWinds", "Room" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Wait, what? Because of what would happen if the Olympians found out? So, after everything, you're taking {#DialogueItalicFormat}Father{#PreviousFormat}'s side in all of this?!"
				},

				{
					Cue = "/VO/Persephone_0071",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					PreLineAnim = "PersephoneGarden_Greeting",
					Text =
					"I am. Your father is no fool when it comes to matters such as this. Besides... all that has happened... it's my fault. I was selfish! And now both sides of our family threaten to be torn apart."
				},

				{
					Cue = "/VO/ZagreusField_3653",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					Emote = "PortraitEmoteFiredUp",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Your fault? So let's say you never left Olympus! Then it'd be just like you thought, until quite recently, I think. That I'd never existed! Besides, they haven't found out any of this. What makes you so sure they will, all the sudden?"
				},

				{
					Cue = "/VO/Persephone_0072",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text =
					"Nyx may be veiling you from them as she veiled me when I fled here myself. But even her own powers aren't infallible. Each time you visit me, you are incurring risk. One small slip, and they shall find me. Discover your deception. Go home, Zagreus. Please."
				},

				{
					Cue = "/VO/ZagreusField_3654",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					MusicSection = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Emote = "PortraitEmoteFiredUp",
					Text =
					"Go home {#DialogueItalicFormat}with {#PreviousFormat}me, Mother! You came here under false pretenses. I haven't fought all this way, over and over again, only to turn back now. I need you in my life! How can you just... turn me away like this?"
				},

				{
					Cue = "/VO/Persephone_0073",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Calculating_01",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					PreLineWait = 0.5,
					Text =
					"Oh, Zagreus... I cannot return. After all that happened between Hades and me, and everyone, I just cannot fathom the idea. Besides... the risks we're taking would be even greater if Olympus were to find me there, with him. And you."
				},

				{
					Cue = "/VO/ZagreusField_3655",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Emote = "PortraitEmoteDepressed",
					Text =
					"Then... {#DialogueItalicFormat}ungh{#PreviousFormat}... you're just... going to stay here? Alone, in the middle of nowhere, in this little garden... forever? After we part ways, just like that?"
				},

				{
					Cue = "/VO/Persephone_0074",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					Portrait = "Portrait_Persephone_Apprehensive_01",
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					Text =
					"My son... I know you've made hard choices and sacrifices to be here with me. And I'm forever grateful to have finally met you. But this is my home, now, yes. While your home is below. Please, if not for your sake, then for mine... do not return. I love you, Zagreus. Good-bye."
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},

			PersephoneMeeting08 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PersephoneMeeting07" },
				RequiredRoom = "E_Story01",
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 1.5,
					Queue = "Interrupt",
					NoTarget = true,
					-- We... have to...
					{ Cue = "/VO/ZagreusField_3662" },
					-- No... not... yet...
					{ Cue = "/VO/ZagreusField_4649", PreLineWait = 2.5 },
				},
				{
					Cue = "/VO/ZagreusField_3657",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Son = true },
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					Emote = "PortraitEmoteFiredUp",
					PreLineAnim = "ZagreusTalkDenial_Full",
					PreLineAnimTarget = "Hero",
					Text =
					"You can't do this to me, Mother. You said Father is no fool, and neither are you. There has to be a way to fix this. Not just with you and Father, but with everyone. There has to be a way!"
				},

				{
					Cue = "/VO/Persephone_0076",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					PreLineWait = 0.35,
					Portrait = "Portrait_Persephone_FiredUp_01",
					PreLineAnim = "PersephoneGarden_Dismiss",
					Text =
					"...You have your father's stubbornness. Listen to me. You're endangering everything you care about by coming here. Don't you understand? Besides..."
				},

				{
					Cue = "/VO/ZagreusField_3658",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "What? Besides what? Tell me, please."
				},

				{
					Cue = "/VO/Persephone_0077",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					PreLineWait = 0.35,
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text =
					"...The truth is that I like it here, Zagreus. I have done well for myself on my own. And your father, he has his domain to look after. The feelings he once had for me... feelings we shared... they fade, with time. You'll understand, someday."
				},

				{
					Cue = "/VO/ZagreusField_3659",
					MusicActiveStems = { "WoodWinds", "Room" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					Emote = "PortraitEmoteFiredUp",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}No{#PreviousFormat}! I won't be understanding anything of the sort. Father still loves you. I'm sure of it! And, he owes you an apology, damn it! I cannot make amends with you on his behalf. It's something only you can do together."
				},

				{
					Cue = "/VO/Persephone_0078",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					MusicSection = 3,
					PreLineAnim = "PersephoneGarden_Greeting",
					Portrait = "Portrait_Persephone_FiredUp_01",
					Text = "What do you mean he still loves me, Zagreus...? How would you know?"
				},

				{
					Cue = "/VO/ZagreusField_3660",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Emote = "PortraitEmoteDepressed",
					Text =
					"Because... {#DialogueItalicFormat}ungh{#PreviousFormat}... I'm his blasted son, that's how I know! But {#DialogueItalicFormat}trust me {#PreviousFormat}isn't ever good enough, I know that, too. I'll prove it to you, Mother! Just you wait and see."
				},

				{
					Cue = "/VO/Persephone_0079",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					PreLineAnim = "PersephoneGarden_Shocked",
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text =
					"You're fading, Son... you don't need to prove anything to me. Please don't do anything rash. All of us made our choices. Now we have to live with them. Isn't it enough, to know that I am safe? That I'm content to be alone?"
				},

				{
					Cue = "/VO/ZagreusField_3661",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					Text =
					"No... {#DialogueItalicFormat}urgh{#PreviousFormat}... it's not... it's not enough, for me, because... this blasted family... it cannot just keep hiding from its problems! Running from them! We're stuck with one another, we... we have to do everything we can... for one another!"
				},

				{
					Cue = "/VO/Persephone_0080",
					SetFlagTrue = "ZagSpecialEventInProgress",
					Portrait = "Portrait_Persephone_Joyful_01",
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					PreLineWait = 0.35,
					Text = "I... oh, my dear boy..."
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},

			PersephoneMeeting09 = {
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PersephoneMeeting08" },
				RequiredRoom = "E_Story01",
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 1.8,
					Queue = "Interrupt",
					NoTarget = true,
					-- But... you are... the Queen...!
					{ Cue = "/VO/ZagreusField_3667" },
					-- Mmph... rrkh... ungh...
					{ Cue = "/VO/ZagreusField_4653", PreLineWait = 2.5 },
				},
				{
					Cue = "/VO/Persephone_0081",
					PreLineWait = 0.35,
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Mom = true },
					Portrait = "Portrait_Persephone_Calculating_01",
					Text =
					"...Of everything down in that gloomy House, I miss old Cerberus the most, I think. But, I miss other things as well. The lack of light was gentler on my skin. Not being as cold. And Nyx, and her young sons. It was all very odd, but..."
				},

				{
					Cue = "/VO/ZagreusField_3663",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Mother... in Father's bedchambers... mind you, there's almost nothing there, just neatly sorted rows of all his samey capes... but on his nightstand... is a portrait of {#DialogueItalicFormat}you{#PreviousFormat}. Wearing a regal crown of red laurels. A Queen. {#DialogueItalicFormat}His {#PreviousFormat}Queen."
				},

				{
					Cue = "/VO/Persephone_0082",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					PreLineWait = 0.35,
					PreLineAnim = "PersephoneGarden_Greeting",
					Portrait = "Portrait_Persephone_Apprehensive_01",
					Text =
					"I was fitted for those garments when I first arrived. They... were not my customary style. So Hades has a portrait of me, still. Why would he put it back on display, now?"
				},

				{
					Cue = "/VO/ZagreusField_3664",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"No, no, he's never let anybody in his bedchambers! I broke in. Don't you see? He didn't put your portrait back on display. It's always been there! Ever since you left. So, Mother, why do you suppose he would do that?"
				},

				{
					Cue = "/VO/Persephone_0083",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					MusicSection = 3,
					Portrait = "Portrait_Persephone_Calculating_01",
					Text = "Because he... because he loves me still. Is that what you want me to say?"
				},

				{
					Cue = "/VO/ZagreusField_3665",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Have you ever loved him, yourself?"
				},

				{
					Cue = "/VO/Persephone_0084",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Persephone_Calculating_01",
					Text =
					"All I really wanted was to leave Olympus. I didn't exactly abscond. I doubt I had much of a choice, but I went willingly. Perhaps Zeus knew how I felt, and thought he was doing me a favor. As for Hades... I grew to love him, yes. He always gave me my space."
				},

				{
					Cue = "/VO/ZagreusField_3666",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Unwell_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInjured_IdleToSick",
					PreLineAnimTarget = "Hero",
					Emote = "PortraitEmoteDepressed",
					Text =
					"Won't you... {#DialogueItalicFormat}urgh{#PreviousFormat}... won't you please talk to him? Or visit Cerberus again, or Nyx? As for Olympus... surely all of you... can figure something out...?"
				},

				{
					Cue = "/VO/Persephone_0085",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					SetFlagTrue = "HadesEndingFlag",
					PreLineAnim = "PersephoneGarden_Vulnerable",
					Portrait = "Portrait_Persephone_Calculating_01",
					PostLineThreadedFunctionName = "SurfaceKillHero",
					PostLineFunctionArgs = { WaitTime = 0, MusicEndTime = 60 },
					PreLineWait = 0.6,
					Text =
					"...I just don't know, my son. Olympus is behind me. And the Underworld... I cannot imagine I would be very welcome there after all this time."
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},

			PersephoneReturnsHome01 = {
				PlayOnce = true,
				UseableOffSource = true,
				-- placed so that boat is not visible
				TeleportToId = 560320,
				RequiredTextLines = { "PersephoneMeeting09" },
				InitialGiftableOffSource = true,
				{
					Cue = "/VO/ZagreusField_3668",
					PreLineFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { Son = true },
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineWait = 0.35,
					AngleTowardHero = true,
					PreLineAnim = "ZagreusTalkDenial_Full",
					PreLineAnimTarget = "Hero",
					Text = "Mother, wait, what is all this?"
				},

				{
					Cue = "/VO/Persephone_0086",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					PreLineAnim = "PersephoneGarden_Vulnerable",
					Text = "Oh, Zagreus, I almost missed you. Truthfully, I hoped that I could make it a surprise..."
				},

				{
					Cue = "/VO/ZagreusField_3669",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Make what a surprise?"
				},

				{
					Cue = "/VO/Persephone_0087",
					MusicActiveStems = { "Percussion", "Room" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Text = "My arrival. I'm going. To your home. To Cerberus. Nyx. Your father."
				},

				{
					Cue = "/VO/ZagreusField_3670",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Speaker = "CharProtag",
					Emote = "PortraitEmoteSurprise",
					Portrait = "Portrait_Zag_Defiant_01",
					PreLineAnim = "ZagreusTalkDenial_Full",
					PreLineAnimTarget = "Hero",
					Text = "You're... {#DialogueItalicFormat}really{#PreviousFormat}?! Mother, you, you're serious?"
				},

				{
					Cue = "/VO/Persephone_0088",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Text =
					"I am. Now if you could just help me pack up my remaining things? Only a few loose odds I'm bringing, just in case. If we hurry, maybe you could join me, rather than return the customary way. Not something a mother ever wants to see."
				},

				{
					Cue = "/VO/ZagreusField_3671",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Join you, but... wait, how are you going to get back? I... hadn't thought that far ahead."
				},

				-- Pan to Charon
				{
					Cue = "/VO/Persephone_0089",
					MusicActiveStems = { "Percussion", "Trombones" },
					MusicMutedStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					MusicSection = 3,
					PostLineFunctionName = "SurfaceBoatScenePan",
					PortraitExitAnimation = "Portrait_Persephone_Default_01_Exit",
					ActivateIds = { 571470 },
					PreLineAnim = "PersephoneGarden_Dismiss",
					Text = "Just so happens I know somebody who can give us a ride."
				},

				{
					Cue = "/VO/Persephone_0090",
					MusicActiveStems = { "Percussion" },
					MusicMutedStems = { "WoodWinds", "Trombones" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					EndSound = "/Leftovers/Menu Sounds/EmoteAffection",
					PortraitExitAnimation = "Portrait_Persephone_Default_01_Exit",
					Text =
					"Doubtless he has pressing matters to attend to. So let's not keep him waiting any longer, Son. Come on, then!",
					ClearPortraitId = true,
					PostLineFunctionName = "LeaveRoomWithNoDoor",
					PostLineFunctionArgs = { NextMap = "Return01", ExitSound = "/SFX/Menu Sounds/HadesTextDisappearFadeLOCATION" },
				},
				-- Load Return01

				{
					Cue = "/VO/ZagreusField_3673",
					PreLineFunctionName = "CreateDialogueBackground",
					MusicActiveStems = { "WoodWinds" },
					MusicMutedStems = { "Percussion", "Harp", "Strings", "Percussion", "Room" },
					MusicActiveStemsDuration = 2,
					MusicMutedStemsDuration = 3,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineWait = 1.35,
					Text = "{#DialogueItalicFormat}<Sigh> {#PreviousFormat}...I'm still alive... but, how?"
				},

				{
					Cue = "/VO/Persephone_0091",
					Portrait = "Portrait_Persephone_Calculating_01",
					Text = "You're on the River Styx. No longer in the mortal realm, entirely."
				},

				{
					Cue = "/VO/ZagreusField_3674",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "I can't believe that this is happening."
				},

				{
					Cue = "/VO/Persephone_0092",
					Text =
					"I know. My heart is racing. Nothing like a river journey to remind oneself that there's no turning back."
				},

				{
					Cue = "/VO/ZagreusField_3675",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text =
					"Seriously. Though, even after all of this... it's like we only just met. I have so many questions for you still."
				},

				{
					Cue = "/VO/Persephone_0093",
					PreLineThreadedFunctionName = "SetupPersephoneMusic",
					PreLineThreadedFunctionArgs = { FullBlast = true },
					MusicSection = 10,
					Text =
					"We'll have plenty of time for them, I think! For now, best we keep quiet. Pretend we're just a couple of dead souls on their final voyage.",
					PortraitExitAnimation = "Portrait_Persephone_Default_01_Exit",
					PostLineThreadedFunctionName = "HandleReturnBoatRideIntro",
				},
				OnQueuedFunctionName = "CheckDistanceTriggerThread",
				OnQueuedFunctionArgs = mod.PresetEventArgs.PersephoneGardenGreeting,
			},

			PersephoneBoatRide02 = {
				SuperPriority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "PersephoneReturnsHome01" },
				RequiredRoom = "Return06",
				{
					Cue = "/VO/ZagreusField_3679",
					MusicActiveStems = { "WoodWinds" },
					MusicActiveStemsDuration = 2,
					-- MusicMutedStems = { "Percussion" },
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineWait = 1.35,
					Text = "This is embarrassing, but... I don't know the way to get back in. Except, you know, the customary way."
				},

				{
					Cue = "/VO/Persephone_0100",
					Portrait = "Portrait_Persephone_FiredUp_01",
					PreLineThreadedFunctionName = "PowerWordPresentation",
					PreLineThreadedFunctionArgs = { WaitTime = 4.5 },
					-- PostLineThreadedFunctionName = "RoomOpeningEntrancePresentation"
					-- PreLineAnim = "PersephoneGarden_Dismiss",
					Text =
					"That's quite all right; I do. {#DialogueItalicFormat}In the name of Persephone, the Queen{#PreviousFormat}!! Open the gates!"
				},
			},
			-- Ending01 scene in DeathLoopData
		},
	},

	-- Manually replaced PresetEventArgs.Brooding/BroodingRepeatable with mod.PresetEventArgs.___ to make it easier
	-- Thanatos, Id = 423052 (DeathArea Version; Field Version below)
	NPC_Thanatos_01 = {
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },
		DamageType = "Ally",
		UseText = "UseTalkToThanatos",
		Portrait = "Portrait_Thanatos_Default_01",
		AnimOffsetZ = 225,
		Groups = { "NPCs" },

		Binks = {
			"ThanatosIdle_Bink",
			"ThanatosIdleInhouse_Bink",
			"ThanatosIdleInhouseFidgetHairFlick__Bink",
		},

		SubtitleColor = game.Color.ThanatosVoice,

		ActivateRequirements = {
			RequiredTextLines = { "ThanatosFieldFirstMeeting", },
			RequiredFalseTextLinesThisRun = { "PersephoneFirstMeeting" },
			RequiredAnyEncountersThisRun = { "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro" },
		},

		-- #region InteractTextLineSets
		-- InteractTextLineSets = {
		-- 	ThanatosHomeFirstMeeting = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		InitialGiftableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiresRunNotCleared = true,
		-- 		RequiredFalseTextLines = { "ThanatosHomeFirstMeetingAlt", "Ending01" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0207",
		-- 			Text =
		-- 			"Go about your business, Zag. What if Lord Hades saw us chatting like this, now...? I risked everything by helping you out there, and still you failed."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0220",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Turns out there's quite a lot of dead to fight down in the Underworld. Though I probably got farther than I would have, thanks to you."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0208",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3, },
		-- 			Text =
		-- 			"Always happy to oblige. Especially when it causes me to risk my station. To risk everything I've worked for."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosHomeFirstMeetingAlt = {
		-- 		SuperPriority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		InitialGiftableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiresRunCleared = true,
		-- 		RequiredTextLinesThisRun = "ThanatosFieldFirstMeeting",
		-- 		RequiredFalseTextLines = { "ThanatosHomeFirstMeeting" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0583",
		-- 			Text =
		-- 			"What are you doing back here, Zagreus? I risked everything by helping you out there. So that was all for nothing, then?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2500",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Far from it, Than. I got where I needed to go, and if not for your help, maybe I wouldn't have. As for why I'm back... as Father would say, I have some business to attend to, here."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0584",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
		-- 			Text =
		-- 			"Well! Don't let me stop you, then. Always happy to risk my station for your sake. To risk everything I've worked for."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosHomeMiscMeeting01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredMinNPCInteractions = { NPC_Thanatos_01 = 1 },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0209",
		-- 			Text =
		-- 			"Be on your way, Zagreus. I have an audience with Lord Hades in a moment. An inquiry into my recent absences."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0221",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "What are you worried about, Than? You've never given him a reason not to trust you."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0210",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Recently, I'm not so sure. Whatever you're doing, it had better be worth it."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosHomeRunProgress01 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosHomeMiscMeeting01", "ThanatosGift02" },
		-- 		RequiredFalseTextLines = { "PersephoneFirstMeeting" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.45,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- Don't be ridiculous, Than.
		-- 			{ Cue = "/VO/ZagreusHome_0812" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0365",
		-- 			Text = "I still cannot entirely believe you really think there's any way you're getting out of here."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0810",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Why? You've been out. It's thanks to you the mortals end up down here maybe half the time."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0366",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"That's different, that's my job. I can't stay there, and frankly I can barely stand it. Do you have any idea how bright it gets, up there?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0811",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "No. But I look forward to finding out for myself."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0367",
		-- 			Text =
		-- 			"{#DialogueItalicFormat}Tsch{#PreviousFormat}, well. We'll see what the Fates have to say about that. Maybe the shade of Daedalus can make you some protective eyewear or something."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosHomeRunProgress02 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "PersephoneMeeting06" },
		-- 		RequiresRunCleared = true,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- Couldn't if I tried!
		-- 			{ Cue = "/VO/ZagreusHome_3434" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3433",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Thanatos, the world outside... didn't you say that it would make you sick, being out there for very long at all? I understand now what you meant by that. Beautiful place and all, but... it's good to be back."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0553",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"See what I mean, now, Zag? Nice place to visit on occasion, sure. But I definitely wouldn't want to live there."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	-- alt below
		-- 	ThanatosBackstory01 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosFieldBackstory01", "ThanatosGift03" },
		-- 		RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
		-- 		RequiredFalseTextLines = { "PersephoneFirstMeeting" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0211",
		-- 			Text =
		-- 			"I met her, you know. Persephone, I mean. You look more like your father, but... you have her eyes. One of them, anyway."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0222",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text = "You never spoke of her to me. You must have known... you kept the truth from me, the same as Nyx?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0212",
		-- 			PreLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"It's not like that. I didn't know any more than you. Besides, Lord Hades ordered all of us to never speak of her again. I thought it just a bad relationship. I didn't realize she left her son."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0223",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text = "Something tells me Father wouldn't let her take me even if she wanted."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0213",
		-- 			Text =
		-- 			"Maybe so. But even still, she did abandon you. Your family's here, if you ask me. But I can understand that... you need answers."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosBackstory01_B = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosFieldBackstory01", "ThanatosGift03", "PersephoneFirstMeeting" },
		-- 		RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
		-- 		RequiredFalseTextLines = { "ThanatosBackstory01", "PersephoneMeeting08" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.45,
		-- 			ObjectType = "NPC_Thanatos_01",
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- Hm.
		-- 			{ Cue = "/VO/Thanatos_0179" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0211",
		-- 			Text =
		-- 			"I met her, you know. Persephone, I mean. You look more like your father, but, you have her eyes. One of them, anyway."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0222",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text = "You never spoke of her to me. You must have known... you kept the truth from me, the same as Nyx?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0212",
		-- 			PreLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"It's not like that. I didn't know any more than you. Besides, Lord Hades ordered all of us to never speak of her again. I thought it just a bad relationship. I didn't realize she left her son."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0223",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text = "Something tells me Father wouldn't let her take me even if she wanted."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosBackstory02 = {
		-- 		-- cutaway scene
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		RequiredTextLines = { "ThanatosGift06" },
		-- 		RequiredAnyTextLines = { "ThanatosBackstory01", "ThanatosBackstory01_B" },
		-- 		RequiredFalseTextLines = { "Ending01", "ThanatosAboutStaying01" },
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		-- See you, Than.
		-- 		EndCue = "/VO/ZagreusHome_0822",
		-- 		EndWait = 0.9,
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0821",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Hey, Than. Come join me in the lounge for old time's sake. The coast is clear. The work can wait."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0172",
		-- 			PortraitExitAnimation = "Portrait_Thanatos_Default_01_Exit",
		-- 			PostLineThreadedFunctionName = "LoungeRevelryPresentation",
		-- 			PostLineFunctionArgs = { Sound2 = "/EmptyCue", Sound3 = "/EmptyCue" },
		-- 			Text = "You're really asking me to join you for a drink...? I mean... you know what, sure. The work can wait."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0582",
		-- 			FadeOutTime = 0.5,
		-- 			FullFadeTime = 7.8,
		-- 			FadeInTime = 2.0,
		-- 			InterSceneWaitTime = 0.5,
		-- 			TeleportToId = 556834,
		-- 			AngleTowardTargetId = 556835,
		-- 			TeleportHeroToId = 556835,
		-- 			AngleHeroTowardTargetId = 556834,
		-- 			PreLineWait = 0.35,
		-- 			AttachedDim = "Lounge",
		-- 			FadeInSound = "/Leftovers/World Sounds/MapZoomInShortHigh",
		-- 			Text =
		-- 			"...I somehow knew, you know. I always knew you weren't going to stay. You were... so restless here. You just needed a reason to leave! And I hoped you wouldn't find one this quickly. {#DialogueItalicFormat}Eugh{#PreviousFormat}. What am I saying? You have no idea."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0784",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"No, I know exactly what you're saying, Than. I'm sorry that I'm putting you through all of this, it's just... it's something that I have to do. But, I'm glad we know the truth about me, now. Maybe we can move on from there."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0174",
		-- 			PortraitExitAnimation = "Portrait_Thanatos_Default_01_Exit",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"{#DialogueItalicFormat}Tsk{#PreviousFormat}... I've always lacked your optimism, Zag. Anyway... the work has waited long enough, I need to get back to it. Thanks for the drink."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0175",
		-- 			FadeOutTime = 0.5,
		-- 			FullFadeTime = 0.5,
		-- 			TeleportToId = 423055,
		-- 			AngleTowardTargetId = 421122,
		-- 			TeleportHeroToId = 423056,
		-- 			AngleHeroTowardTargetId = 423055,
		-- 			FadeInSound = "/Leftovers/World Sounds/MapZoomInShortHigh",
		-- 			FadeInTime = 0.5,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3, SkipExitReaction = true },
		-- 			Text = "...Watch yourself out there, Zagreus. I have to go."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutDeath01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredAnyTextLines = { "ThanatosBackstory02", "ThanatosGift07_A", },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.65,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- Yeah, seriously.
		-- 			{ Cue = "/VO/ZagreusHome_1452" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1450",
		-- 			Portrait = "Portrait_Zag_Empathetic_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Thanatos, I've meant to ask... is it really the case that many mortals have a crippling fear of death?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0398",
		-- 			Text =
		-- 			"It is, I'm quite feared, up there. Most of them cannot distinguish between me, and, say, Lord Ares, or your father, even. We fill them with despair. No helping it."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1451",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Why not? I mean, isn't it kind of a big problem that they have such negative associations, here? Can't we... I don't know, do something to educate them all?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0399",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"We've all the time to educate them, here. Their ignorance of death is solved almost as soon as they experience their first. Though I suppose they might be better off knowing before the fact."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutDeath02 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosAboutDeath01" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.65,
		-- 			UsePlayerSource = true,
		-- 			-- Didn't know you saw it that way.
		-- 			{ Cue = "/VO/ZagreusHome_1455" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1453",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Than? I had another question about death. So... why is it mortals grieve so much about the thing, I mean... it definitely hurts there for a little while, but... it's not that bad."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0400",
		-- 			Text =
		-- 			"They see it as their one and only chance. Imagine if, after you perished, that was it. Back to the infinite Chaos. Everything about you. Returned to how it was before you were even there."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1454",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"But that's absurd. One life? Though... {#DialogueItalicFormat}eugh{#PreviousFormat}. That's horrible, even to think about."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0401",
		-- 			Text =
		-- 			"I know, right? Some of them know that isn't how it is, and try to tell their kind about what it is we do here, but... it's slow going, getting the information out. Either way! I get to be the bearer of good news."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutDeath03 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosAboutDeath02" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.65,
		-- 			UsePlayerSource = true,
		-- 			-- It really is.
		-- 			{ Cue = "/VO/ZagreusHome_1459" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1456",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Hey Than? Something's been troubling me still, with what you said, about how mortals look at death. If most of them believe their life is all they have... how do they live? I mean, I can't even imagine what that's like. I'd be a lot more careful, at the very least!"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0402",
		-- 			Text =
		-- 			"They live with all their hearts, or at least try. I think there's something to it, truthfully. Though, some of them, they fall apart. They get here without me. On their own, gripped with despair. If only they knew what your father always says about all this."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1457",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			Text =
		-- 			"What, you mean that {#DialogueItalicFormat}'there is no escape'{#PreviousFormat}? From what? The mortals are up there, not here. Not while they're technically alive in their sense, anyway."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0403",
		-- 			Text =
		-- 			"I mean, you can't escape your problems, Zagreus. You can run from your family, but you can't run from everything. You have no choice but to confront it, and work through it, sooner or later, one way or another. You, and all of us."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1458",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineWait = 0.35,
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"...I'm starting to notice that, yes. Though, to a mortal who has yet to die... don't they think of death as some sort of release? You come to end their misery, something like that?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0404",
		-- 			Text =
		-- 			"I can release them from their decaying bodies. Sometimes, the Fates demand I bring them in sooner. That's about as much as I can do. Some of them get it early on, how to live. It's quite impressive, really, that they learn so quick."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutShifting01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift06", },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- I can see that.
		-- 			{ Cue = "/VO/ZagreusHome_2502" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2501",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Hey, just how far are you able to shift, anyway, Than? I never could go more than a blade's length in front of me, while you're out there skipping across the entire world probably."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0585",
		-- 			Text =
		-- 			"Most of it, yes. Don't beat yourself up, though, Zagreus. It's a practiced skill but I've apparently been able to do it since birth. Mother Nyx says I was a real handful."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutBalcony01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift05", },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.65,
		-- 			UsePlayerSource = true,
		-- 			-- Go get them.
		-- 			{ Cue = "/VO/ZagreusHome_2807" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2805",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Hey, what is it you're always staring at out there, anyway, Than? I don't see anything."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0612",
		-- 			Text =
		-- 			"The River Styx is right in front of you, and you don't see anything, Zag? I can watch it endlessly. Studying the competition, you might say. Most mortals expect to get here by river, with Charon. Not with me."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2806",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"So you're locked in ruthless battle with a river, searching it for any signs of weakness, that sort of thing? That sounds stressful."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0613",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.5, SkipExitReaction = true },
		-- 			Text =
		-- 			"I find it rather soothing as a matter of fact. A break from having to deal constantly with mortal souls. Speaking of which... I have to pick somebody up right now."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutNemesisAspect01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift05" },
		-- 		RequiredTraitsTaken = { "SwordCriticalParryTrait" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- I'm sure she's lovely, then.
		-- 			{ Cue = "/VO/ZagreusHome_2504" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2503",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Than, my blade, the one I'm borrowing from Father anyway, it... revealed to me an older aspect of itself, of Nemesis. Nyx never mentions her. Have you two ever met?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0586",
		-- 			Text =
		-- 			"In case you haven't noticed, most of us who sprang from Nyx, we're not exactly close. Nemesis is fully occupied meting out justice on the surface. Our paths are not designed to cross. And based on everything I know, that's fine with me."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutErisAspect01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift05" },
		-- 		RequiredMinRunsWithWeapons = { GunWeapon = 5 },
		-- 		RequiredTraitsTaken = { "GunGrenadeSelfEmpowerTrait" },
		-- 		RequiredWeapon = "GunWeapon",
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- All right, then!
		-- 			{ Cue = "/VO/ZagreusHome_2506" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0587",
		-- 			Text =
		-- 			"How's that Rail of Adamant been working out for you lately? Always figured the direct approach was more your style. Though, I happened to have a look at your permanent record lately, and turns out you're doing a lot of work with that thing."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2505",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Why, Thanatos, you're learning to pry in others' business! The Rail's been working out just fine, thanks. Though, now that you mention it, how well do you know Eris, one of Nyx's daughters, right? Seems she wielded the Rail before me."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0588",
		-- 			Text =
		-- 			"The mortals call her Strife. She and her children... it's thanks partly to their dedicated efforts I'm so busy all the time. Though, it is best we didn't speak of her, I think."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	-- alt below
		-- 	ThanatosAboutSurface01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift03" },
		-- 		RequiredFalseTextLines = { "ThanatosAboutSurface01_B", "PersephoneFirstMeeting" },
		-- 		RequiredMaxRunsCleared = 0,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.65,
		-- 			UsePlayerSource = true,
		-- 			-- Huh. Maybe. I hope.
		-- 			{ Cue = "/VO/ZagreusHome_1462" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1460",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Thanatos, I ought have asked by now, but... what's it like? Up there I mean, outside. You never talk about it, I... almost forget that's where you go, for work."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0405",
		-- 			Text =
		-- 			"What can I say? It's... different. I never stay up there for very long, don't think I could, starts making me feel ill. Too many sensations all at once. And when the chariot of Helios is in the sky, it gets so bright that I can barely see."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1461",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			Text = "That sounds awful. If it's that bad, why would all the Olympians chat it up so much?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0406",
		-- 			Text =
		-- 			"There's no accounting for their taste, I guess. But, I'm discounting certain aspects that are not so bad. You know what? I'll not spoil the surprise. I have a feeling you're going to see for yourself soon enough."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutSurface01_B = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift03", "PersephoneFirstMeeting" },
		-- 		RequiredFalseTextLines = { "ThanatosAboutSurface01" },
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1460",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Thanatos, I ought have asked by now, but... what's it like? Up there I mean, outside. You never talk about it, I... almost forget that's where you go, for work."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0405",
		-- 			Text =
		-- 			"What can I say? It's... different. I never stay up there for very long, don't think I could, starts making me feel ill. Too many sensations all at once. And when the chariot of Helios is in the sky, it gets so bright that I can barely see."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1461",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			Text = "That sounds awful. If it's that bad, why would all the Olympians chat it up so much?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0663",
		-- 			Text = "There's no accounting for their taste, I guess."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutCharon01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "CharonGift03", "ThanatosGift05" },
		-- 		RequiredSeenRooms = { "D_Hub" },
		-- 		-- I never thought of it like that.
		-- 		EndCue = "/VO/ZagreusHome_1449",
		-- 		EndWait = 0.4,
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1447",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"What's going on with Charon, by the way, if you can tell me, Than? He's... never been particularly talkative, but he really seems to know the inner workings of this place."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0396",
		-- 			Text =
		-- 			"I correspond with Charon all the time, but even I don't know the full extent of his responsibilities. He's an independent contractor of sorts, been here forever. Your father gives him plenty of space to work."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1448",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			Text =
		-- 			"He must be compensated pretty well for having done this for so long. Tending the influx of new souls and all of that."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0397",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"I doubt he's in it for the compensation, Zagreus. There is no Underworld without Charon. I think he knows that, and your father knows it, too."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	-- rename, was a 2 below
		-- 	ThanatosAboutCharon02A = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "CharonGift04", "ThanatosAboutCharon01" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosAboutCharon01" }, Count = 2 },
		-- 		-- Fair enough.
		-- 		EndCue = "/VO/ZagreusHome_2508",
		-- 		EndWait = 0.4,
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2507",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Hey, were you ever close with Charon, Than? Seems like no matter how much I try, I can't quite get through to him."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0589",
		-- 			Text =
		-- 			"Wouldn't be surprised if you were closer to him than I am. Not all of Nyx's sons and daughters keep in steady touch. Though at least we're not always at each others' throats, like the other side of your family."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutCharon02 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "SkellyAboutSources04" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- Did he really think that far ahead...?
		-- 			{ Cue = "/VO/ZagreusHome_2515" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2513",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Than, you're not going to believe this, but... Charon's been helping me. All on his own, apparently! I was so sure that Nyx or someone put him up to it. That Skelly character I mentioned, Charon hired him!"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0592",
		-- 			AngleTowardHero = true,
		-- 			Text =
		-- 			"What are you talking about, Zagreus? Just because Charon's selling you things doesn't mean he's helping you. Wait, are you sure?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2514",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"I'm sure! His helper, Skelly, he's a lot more talkative, and finally let on. Although, he couldn't tell me how come Charon did a thing like this, I mean... we weren't ever close..."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0593",
		-- 			Text =
		-- 			"{#DialogueItalicFormat}Hmm{#PreviousFormat}. All I can think of is... Charon's very dedicated to this House. Like some of us. Maybe he thought... he could help settle things, between you and your father. One way or another."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutCharonFight01 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredEncounterThisRun = "BossCharon",
		-- 		RequiredFalseDeathRoom = "CharonFight01",
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- Don't think you will.
		-- 			{ Cue = "/VO/ZagreusHome_2510" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2509",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Hey, Than, now hypothetically, if I were to have vanquished Charon in single combat after having, I don't know, say, helped myself to one of his wares at no charge, how long would you say he'd hold it over me?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0590",
		-- 			Text =
		-- 			"Everything is an exchange with Charon, Zag. If there was something you refused to pay for, then I'm going to assume that's why you're back here, now. The debt is paid in obols, or in blood. Or their closest counterparts, I guess."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutSkelly01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "SkellyGift01", "ThanatosGift03", "SkellyGift01", "NyxGift01" },
		-- 		-- Didn't think so.
		-- 		EndCue = "/VO/ZagreusHome_2512",
		-- 		EndWait = 0.4,
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2511",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Than, level with me on this. You didn't happen to hire a shifty character called Skelly to assist me here and there, did you?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0591",
		-- 			Emote = "PortraitEmoteSurprise",
		-- 			Text = "Who, what? No. Why would you even ask?"
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutPersephone01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift03", "ThanatosFieldBackstory01" },
		-- 		RequiredAnyTextLines = { "ThanatosBackstory01", "ThanatosBackstory01_B", "PersephoneFirstMeeting" },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- Radiance, huh... doesn't sound like Father at all.
		-- 			{ Cue = "/VO/ZagreusHome_2518" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2516",
		-- 			Portrait = "Portrait_Zag_Empathetic_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Do you remember anything else about my mother, Than? Just, anything. You weren't close, I guess?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0614",
		-- 			Text =
		-- 			"We weren't. She kept to herself as I recall, and I would do the same. Unlike my present company, I do not ask too many questions. It was quite clear to me she wasn't from this place."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2517",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			Text = "Father isn't from this place, either. How was she any different?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0615",
		-- 			Text =
		-- 			"Sometimes I have to be reminded that Lord Hades wasn't born here, like the rest of us. But Persephone, she... she had a radiance about her, I suppose. Reminded me of the outside, but... I don't mean that in a negative respect."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutSisyphus01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift08", "SisyphusMeeting_AboutMegAndThanatos01", "SisyphusGift06" },
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1463",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Than, you don't hold a grudge against old Sisyphus, do you? He seems rather apprehensive about you. I understand you met not on the best of terms."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0407",
		-- 			Text =
		-- 			"He is a brazen one, I have to give him that. I hadn't realized that you were close. Despite some questionable choices on your part, I don't think you're the poorest judge of character, and so... maybe I have him wrong."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1464",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			Text =
		-- 			"I only have a faint impression of the man he used to be, although it seems he's changed a lot, since then. Thank you for understanding, anyway."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutSisyphusLiberationQuestComplete01 = {
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "SisyphusLiberationQuestComplete" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- Don't think you will.
		-- 			{ Cue = "/VO/ZagreusHome_2525" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0621",
		-- 			Text =
		-- 			"I heard you stayed the knave-king's sentence. I should be angry with you. Sisyphus must be the only mortal {#DialogueItalicFormat}ever {#PreviousFormat}to have humiliated me. But Mother Nyx, she... must have backed you, didn't she..."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2524",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"We did what needed to be done. As much as Father likes making examples out of wretched shades, an eternal sentence felt a little excessive in this case. Besides... Sisyphus isn't leaving, anyway. Seems to have found his niche."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0622",
		-- 			Text =
		-- 			"Oh? Well, he's an odd one through and through, I guess. As long as I don't have to deal with him again."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutAchilles01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift05" },
		-- 		RequiredAnyTextLines = { "AchillesGift05_A", "AchillesGift05_B" },
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2526",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			Text = "You and Achilles ever get to talk much, Than?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0623",
		-- 			Text =
		-- 			"I have my orders, he has his. What do you think? Even back when he was still alive, there was no real chance I was going to be the one to take him here, given his line of work."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2527",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			Text = "Because he was a warrior. When mortals die a violent death, they're no longer your case, are they?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0624",
		-- 			Text = "No. I tend to those in less of a hurry to come here."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutMyrmidonReunionQuestComplete01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredMinNPCInteractions = { NPC_Thanatos_01 = 1 },
		-- 		RequiredTextLines = { "MyrmidonReunionQuestComplete", "ThanatosGift01" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "MyrmidonReunionQuestComplete" }, Count = 4 },
		-- 		RequiredFalseTextLinesLastRun = { "MyrmidonReunionQuestComplete" },
		-- 		AreIdsNotAlive = { 370009 },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- It is. I think it is.
		-- 			{ Cue = "/VO/ZagreusHome_2529" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0625",
		-- 			Text =
		-- 			"Your trainer's been absent from his post, more so than usual. You voided his pact with Lord Hades, didn't you? I don't know how you did it."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2528",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			Text =
		-- 			"You know he's more than my trainer, Than. As for how I did it, turns out being the first and only son of Hades has its privileges. Now Achilles gets to be with someone he loves. Who loves him back."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0626",
		-- 			Text =
		-- 			"Love is common among mortals. Is theirs really so special as to be worth the trouble? Not just on your part, but theirs?"
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutMegaera01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift05", "MegaeraGift05", "MegaeraBedroom01", "Fury2FirstAppearance", "Fury3FirstAppearance" },
		-- 		RequiredFalseTextLines = { "MegaeraGift09" },
		-- 		RequiredKillsThisRun = { "Harpy" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.85,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 2,
		-- 			-- ...Oh.
		-- 			{ Cue = "/VO/ZagreusHome_0818" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0370",
		-- 			Text = "You've seen a lot of Megaera lately, haven't you, Zag?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0816",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "It's not like that, Than. She's there to slow me down. Get in my way."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0371",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text = "If you insist. Although I think it's much more complicated than you say."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0817",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			Text =
		-- 			"Yeah... her sisters are back. They're... hard to deal with. I don't think Meg is on good terms with either one."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0372",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.35, SkipExitReaction = true },
		-- 			Text = "That's not what I meant. But fine, you've told me all I need to know, for now."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutMegaera02 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosGift08", "MegaeraGift08", "SisyphusBackstory03" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.85,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 2,
		-- 			-- I know what you mean.
		-- 			{ Cue = "/VO/ZagreusHome_2540" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2538",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "You and Meg go back a long way, don't you? I forget sometimes you two are pretty close."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0638",
		-- 			Text =
		-- 			"Our responsibilities must have us cross paths often, yes. But I didn't really get to know her until after the whole humiliating affair with Sisyphus."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2539",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Oh, right. He got stuck in Tartarus after that, under Meg's personal supervision. So you bonded over your shared disdain for Sisyphus?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0639",
		-- 			Text =
		-- 			"We each had to blow off some steam, yes. That was some of the hardest I ever worked, back then, and her, too, I think. When you go through something like that with someone, it brings you closer, I suppose."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutBeingCloseWithMegaera01 = {
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithMegaera01_BMeg_GoToHer" },
		-- 		RequiredFalseTextLines = { "MegaeraWithThanatosBedroom01" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.65,
		-- 			UsePlayerSource = true,
		-- 			-- ...Sure. Sounds good.
		-- 			{ Cue = "/VO/ZagreusHome_1486" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1483",
		-- 			Portrait = "Portrait_Zag_Empathetic_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Than, there's something that I meant to tell you. Ask you, rather. You're close with Megaera, so, what I mean is... you know about {#DialogueItalicFormat}us{#PreviousFormat}, right?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0421",
		-- 			Text = "Yes, of course. Why do you ask?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1484",
		-- 			Portrait = "Portrait_Zag_Empathetic_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Well, it's just... I figured since you deal with mortals all the time, I know that some of them, they choose a single suitor. It's a valid custom, if it's yours...!"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0422",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"The mortals have their customs, yes, indeed. Quite a variety, in point of fact. However, none as yet have stuck with me, I think. So don't concern yourself with things like that."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1485",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "You're saying you're not angry with me? Or Meg, for that matter?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0423",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "Not any more than usual. Tell her that I said hello when next you meet."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutBeingCloseWithDusa01 = {
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "BecameCloseWithDusa01" },
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01Than_BackOff" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- ...Yeah, well... thanks, Than.
		-- 			{ Cue = "/VO/ZagreusHome_2494" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2493",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Than, you don't take issue with me being close with Dusa, do you? She brings such warmth to this place... I really appreciate having her here."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0577",
		-- 			Text = "You don't need to ask me such things, Zagreus. They're your feelings."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutAres01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "AresAboutThanatos02", },
		-- 		-- Disturbingly all right!
		-- 		EndCue = "/VO/ZagreusHome_1446",
		-- 		EndWait = 0.4,
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1444",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Than, what's your relationship with Ares on Olympus? I know he deals in death himself, but... his approach seems rather different from your own."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0394",
		-- 			Text =
		-- 			"I do not care for his approach at all. But he has been professionally courteous with me. More than I can say for most of your Olympian relatives, I suppose."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1445",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			Text = "You mean the rest of the Olympians don't treat you well?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0395",
		-- 			Text =
		-- 			"Discounting Hermes, I should say, the rest of them have nothing much to do with me at all. I can imagine why, I know it's complicated with your father here. But as for Ares... I think he's all right."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutNyxAndAres01 = {
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredAnyTextLines = { "AresAboutNyx01", "AresAboutNyx01_B" },
		-- 		RequiredAnyOtherTextLines = { "ThanatosGift04", "ThanatosGift04_B" },
		-- 		RequiredFalseTextLines = { "NyxAboutAres05", "NyxAboutAres05_B" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- ...Eh, you're probably right...
		-- 			{ Cue = "/VO/ZagreusHome_2497" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2495",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Than? I thought you ought to know that Ares, he... I think he's taken quite an interest in Nyx. Keeps asking me to talk to her on his behalf."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0578",
		-- 			Text = "Finally. It's about time Olympus took notice of Mother and all her accomplishments."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2496",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Finally? You don't think Ares has untoward intentions or anything like that?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0579",
		-- 			Text =
		-- 			"He'd be a hollow fool if he did. Why do you think they fear us on Olympus, Zagreus? Because of Hypnos? I don't think Mother Nyx requires your concern. Though, by all means, talk to her about it, if you like."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutNyxAndChaos01 = {
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "NyxChaosReunionQuestComplete", "ThanatosGift06" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- Least I could do for all she's done for me.
		-- 			{ Cue = "/VO/ZagreusHome_2499" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0580",
		-- 			Text =
		-- 			"Mother Nyx told me you restored the Eldest Sigil, Zagreus. I couldn't believe that was your doing. What you did... it meant a lot to her."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2498",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text = "It was my pleasure. Say, did Nyx ever let on to you of her relationship with Chaos, at any point?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0581",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"No, not everyone is quite as sharing as you are, Zag. Nor as inclined to pry. But still... in this case, sounds like it worked out. So, thank you. If she hasn't said as much."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutNyxAndDusa01 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "NyxAboutDusa01", "ThanatosGift03" },
		-- 		RequiredFalseTextLines = { "DusaWithNyx03" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.6,
		-- 			UsePlayerSource = true,
		-- 			-- ...Tsch.
		-- 			{ Cue = "/VO/ZagreusHome_2485" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0569",
		-- 			Text =
		-- 			"I can tell when Mother Nyx is upset, Zagreus. And I know better than to ask her, so I'm going to ask you. What happened?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2483",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Probably because Nyx took issue with me chatting with Dusa from time to time. Is that really so unbecoming of me? Not even Father seems to care."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0570",
		-- 			Emote = "PortraitEmoteFiredUp",
		-- 			AngleTowardHero = true,
		-- 			Text =
		-- 			"Well, Mother cares! And I, for one, know better than to question it. None of us would be here were it not for her. If she has a request for you, you honor it."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2484",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "You're telling me I should just start ignoring Dusa from now on, like you do?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0571",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3, SkipExitReaction = true },
		-- 			Text = "You're a god. I'm telling you to learn to act like one."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutNyxAndDusa02 = {
		-- 		SuperPriority = true,
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		InitialGiftableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredFalseTextLinesThisRun = { "PersephoneFirstMeeting", "Ending01", "OlympianReunionQuestComplete" },
		-- 		RequiredTextLines = { "ThanatosAboutNyxAndDusa01" },
		-- 		MaxRunsSinceAnyTextLines = { TextLines = { "ThanatosAboutNyxAndDusa01" }, Count = 6 },
		-- 		RequiredFalseTextLines = { "DusaWithNyx03" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- Thanks...
		-- 			{ Cue = "/VO/ZagreusHome_2487" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2486",
		-- 			Portrait = "Portrait_Zag_Empathetic_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"I'm sorry I raised my voice with you last time, Than. I know Nyx puts so much into this place, and has nurtured so many of us here."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0572",
		-- 			Text =
		-- 			"It's not me you should be apologizing to, Zag. Although, with Mother Nyx, sometimes it's best to leave her be. As for Dusa... I didn't mean to suggest you should abandon your friend."
		-- 		},
		-- 	},
		-- 	ThanatosAboutNyxAndDusa03 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "DusaVsNyx04", "ThanatosGift03" },
		-- 		RequiredFalseTextLines = { "DusaWithNyx03", "MegaeraAboutDusaVsNyx02" },
		-- 		GiftableOffSource = true,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.6,
		-- 			UsePlayerSource = true,
		-- 			-- Maybe you should.
		-- 			{ Cue = "/VO/ZagreusHome_2490" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2488",
		-- 			Portrait = "Portrait_Zag_Empathetic_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text = "Nyx let her go, Than. Dusa, I mean, she's gone. What do I do?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0573",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"If I were you, I would start getting over it as soon as possible. But, I don't see you doing that. Just remember... maybe this isn't about you. Dusa's job may have been far too much for her. Mother Nyx is strict, but she is fair."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2489",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Then she should give Dusa another chance. Has Meg heard? She'll be furious."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0574",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 3, SkipExitReaction = true },
		-- 			Text =
		-- 			"Megaera will be no such thing. Some of us don't default to questioning every decision from our superiors."
		-- 		},
		-- 	},
		-- 	ThanatosAboutNyxAndDusa04 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "DusaWithNyx03", "ThanatosGift03" },
		-- 		MaxRunsSinceAnyTextLines = { TextLines = { "DusaWithNyx03" }, Count = 15 },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- I don't think we have to worry about that.
		-- 			{ Cue = "/VO/ZagreusHome_2492" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0575",
		-- 			Text =
		-- 			"I saw that Dusa's back. You must have worked your ways on Mother Nyx. Don't know how you do it. Can't remember the last time I saw her budge on anything."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2491",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Nyx genuinely cares about this House and all of us. She had to come around on something like this. Dusa's one of the hardest workers here. Even if she has room to improve."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0576",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"Incessant hard work can lead to trouble, Zagreus. I think maybe that's why Mother was concerned. We all know how your father can get. She doesn't need someone like Dusa taking after him."
		-- 		},
		-- 	},

		-- 	ThanatosAboutHypnos01 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosWithHypnos01", "HypnosGift03" },
		-- 		RequiredAnyTextLines = { "ThanatosGift04", "ThanatosGift04_B" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- He's like an annoying little brother to me.
		-- 			{ Cue = "/VO/ZagreusHome_0815" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0813",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Than, you know, Hypnos, he adores you. Besides just driving you to madness, now and then."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0368",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text = "I'm rather used to the relationship, thanks, Zagreus. Seems like you got to know him pretty well."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_0814",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Well, dying repeatedly can end up bringing people closer, I suppose."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0369",
		-- 			Text =
		-- 			"I don't know what's worse, dying repeatedly or Hypnos. Although, I guess I'm grateful for your patience with him, Zag."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	-- brothers quest
		-- 	ThanatosAboutHypnos02 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosAboutHypnos01", "HypnosAboutThanatos03" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- Probably!
		-- 			{ Cue = "/VO/ZagreusHome_2534" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2532",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Got to tell you something, Than. You can be pretty mean to Hypnos! And that's coming from someone who's mean to Hypnos a lot. Believe me, I completely understand, but... still."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0628",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"He's utterly incompetent, Zag. He wouldn't even be here if Mother Nyx wasn't trying to whip him into some sort of shape."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2533",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Yeah, but... pretty much none of this would be here, were it not for Nyx, right? Anyway my point is not that you should go easy on him, but... there must be some way not to get as frustrated. You'll both be better off."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0629",
		-- 			Emote = "PortraitEmoteFiredUp",
		-- 			Text =
		-- 			"I know, it's just...! You're right. I catch myself feeling particularly horrid after talking to him. He can be very frustrating, and self-absorbed... though, I know he means well. Probably."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	-- brothers quest
		-- 	ThanatosAboutHypnos03 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "ThanatosWithHypnos07" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- ...Who doesn't have room for improvement, though, right?
		-- 			{ Cue = "/VO/ZagreusHome_2537" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2535",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"I can hardly believe it. Hypnos finally came out on top, huh? Even Father seemed pleased with him. That's more than I get."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0630",
		-- 			Text =
		-- 			"I can hardly believe it either, Zagreus. But then again, he's one of Mother Nyx's offspring, so we shouldn't be so surprised. Though, I have to thank you for talking to me about him a while back..."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2536",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Oh, that? I noticed you two getting along better recently. So what's your secret?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0631",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"He loves lists. Doesn't do well with subtlety, so much, but spell things out for him, and he will get right on it. Long as he's awake, at least. He's still working on that part."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutSingersReunionQuestComplete01 = {
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "ThanatosGift01", "OrpheusAboutSingersReunionQuest01" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- ...Than, wait...!
		-- 			{ Cue = "/VO/ZagreusHome_2523" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0618",
		-- 			Text =
		-- 			"I saw you voided the old pact between Orpheus and your father. So now he gets to see his wife from time to time?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2521",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"He does, and I did, Than. I think we can stand to see a little less of him if it means he can be happier for the remainder of eternity."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0619",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"You really need to learn to stop meddling in others' affairs. Did either of them even ask your help? I can't imagine Orpheus did, and I'm guessing his wife's feelings were complicated, too, from what I know of the circumstances of their final meeting."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2522",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Emote = "PortraitEmoteSurprise",
		-- 			Text =
		-- 			"What? Orpheus is my mate, Than. And I came to know his muse, Eurydice, as well. They still had feelings for each other, but with no way to communicate."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0620",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3, SkipExitReaction = true },
		-- 			Text =
		-- 			"So you decided to step in. {#DialogueItalicFormat}Tsch{#PreviousFormat}. I think my instincts on the subject are just not the same as yours. I know your intentions were in the right place, but... you know what, forget it."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutQuestLog01 = {
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredMinNPCInteractions = { NPC_Thanatos_01 = 1 },
		-- 		RequiredCosmetics = { "QuestLog", },
		-- 		RequiredFalseFlags = { "InFlashback" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 2,
		-- 			-- I can hazard a guess...
		-- 			{ Cue = "/VO/ZagreusHome_2520" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0616",
		-- 			Text =
		-- 			"I saw the Fated List of Minor Prophecies was requisitioned through the House Contractor, Zagreus. Didn't take you for an agent of the Fates."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2519",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Turns out I'm full of surprises, Thanatos. Though, the Three Fates are your sisters, aren't they? Surprised you didn't requisition the List yourself."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0617",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"Guess it just wasn't meant to be. Though, I don't know them at all. Keep only to themselves, somewhere. Sometimes I wonder whether everything really is preordained, or whether they're making all this up as they go."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosRunCleared01 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiresRunCleared = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "PersephoneFirstMeeting" },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		-- I'm planning to.
		-- 		EndCue = "/VO/ZagreusHome_1550",
		-- 		EndWait = 0.45,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0544",
		-- 			AngleTowardHero = true,
		-- 			Text =
		-- 			"You took Lord Hades down... you really did. I've never seen him quite like this before. I could scarce believe it when he came up through the Pool of Styx, himself..."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_1549",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Seemed only fair in the grand scheme of things. He slew his own parents at some point, right? I think the Fates enjoy this sort of thing."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0545",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 3, SkipExitReaction = true, },
		-- 			Text =
		-- 			"Come on, Zag, take some credit where it's due. Though... you'll forgive me if I keep my distance for a little while, as I think you have some issues to resolve. You watch yourself."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutStaying01 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "ThanatosFieldAboutPersephoneFirstMeeting01", "ThanatosGift05" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			-- I'll hold you to that.
		-- 			{ Cue = "/VO/ZagreusHome_3432" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0551",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"...You're really staying, Zagreus? I mean... between the generally ill-conceived attempts to reach the surface every so often."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3431",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"I am. I figured it's the only way I could continue interrupting you while you try to do your job. You work too hard, Than, live a little, right?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0552",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.85, SkipExitReaction = true },
		-- 			Text =
		-- 			"{#DialogueItalicFormat}Heh{#PreviousFormat}. Well then, I'll see what I can do about that. You'll have to show me what you mean by {#DialogueItalicFormat}'live a little'{#PreviousFormat}, though."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	-- misnomer; event moved later
		-- 	ThanatosAboutPersephoneMeeting02 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		RequiredTextLines = { "PersephoneMeeting04" },
		-- 		RequiredAnyTextLines = { "ThanatosBackstory01", "ThanatosBackstory01_B" },
		-- 		RequiredAnyOtherTextLines = { "ThanatosFieldAboutPersephoneFirstMeeting01", "ThanatosGift05" },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.45,
		-- 			UsePlayerSource = true,
		-- 			-- Yeah.
		-- 			{ Cue = "/VO/ZagreusHome_3231" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3228",
		-- 			Portrait = "Portrait_Zag_Empathetic_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Have to tell you something, Than. My birthmother... she didn't abandon me. Or at least... she didn't think she did."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0647",
		-- 			Text =
		-- 			"She didn't {#DialogueItalicFormat}think {#PreviousFormat}she did? What are you talking about, Zag? She left when you were born. Was never seen or spoken of again, until all this with you."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3229",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Well, it turns out... she never knew I was alive, at all. Complications when I was born. She had been struggling already here, and it was all too much, I guess. By the time Nyx brought me back... my mother was long gone."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0648",
		-- 			Emote = "PortraitEmoteSurprise",
		-- 			AngleTowardHero = true,
		-- 			Text =
		-- 			"{#DialogueItalicFormat}What{#PreviousFormat}? But, Mother Nyx, and your father, they... could have sent for her, let her know... they must have known where she went!"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3230",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Nyx knew. But, Father must have convinced her that my mother... that it would be for the best if she never found out. About me. So she could live in peace. Away from all of this. And away from Olympus."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0649",
		-- 			PreLineWait = 0.5,
		-- 			Text = "That's... a lot to take in."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutRelationship01 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "ThanatosGift06" },
		-- 		RequiredAnyTextLines = { "Ending01", "ThanatosBackstory02" },
		-- 		RequiredFalseTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
		-- 		-- Wait! Ugh.
		-- 		EndCue = "/VO/ZagreusHome_2542",
		-- 		EndWait = 0.4,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0640",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"...Answer me something, Zagreus. What am I to you, exactly, as of late? Because, sometimes, with you, I..."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2541",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"I'm sometimes at a loss myself, Thanatos. Though one thing I know is it's always really good running into you out there, it's... well, exciting. Sparring with you and all that! And then, I know it means that I might get to see you here."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0641",
		-- 			AngleTowardHero = true,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.2, SkipExitReaction = true },
		-- 			Text =
		-- 			"Well, here I am. But you didn't answer my question. Though, you know something? Forget I asked. I've got to go."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},
		-- 	ThanatosAboutRelationship02 = {
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" }, Count = 8 },
		-- 		-- ...Good.
		-- 		EndCue = "/VO/ZagreusHome_2545",
		-- 		EndWait = 0.4,
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2543",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Hey, Than, tell me something, and forgive the awkward question here, but... are we good? I mean... between us. Any infuriating habits I should know about, that sort of thing?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0642",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"You know I don't have time to list all your infuriating habits, Zagreus. Though... if any of them were outside my usual tolerance threshold, I promise to let you know, all right?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2544",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			Text = "So then, we're good. Because I think we're good, but I just wanted to make sure."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0643",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.2, SkipExitReaction = true },
		-- 			Text = "We're good. See you, all right?"
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosAboutRelationship03 = {
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "ThanatosAboutRelationship02", "Ending01" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosAboutRelationship02" }, Count = 8 },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.5,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- Definitely.
		-- 			{ Cue = "/VO/ZagreusHome_2548" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0644",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"...It just struck me how much you've changed, Zag. I still remember when you kept trying to singe Cerberus' tail with your feet. Haven't seen you do that in a while."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2546",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Oh, I definitely learned my lesson there. But, thanks, I guess. You've opened up a lot, yourself, by the way. Talking to you lately, it's a world apart from the first time. You looked like you were going to slice my head off."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0645",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"It sure must have taken a lot of courage for you to come right up and tell me you thought I looked better before I cut my hair. I still ask myself how come I didn't keep ignoring you after that. Or slice your head off."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_2547",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "Well, the option is always available, I guess. Hey, you ever think of growing it out again?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0646",
		-- 			Portrait = "Portrait_Thanatos_Default_01",
		-- 			Text =
		-- 			"No. It kept getting in my way. Sliced it right off and never looked back. So... plenty of personal growth all around, then?"
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	-- ending
		-- 	ThanatosAfterPersephoneMeeting03 = {
		-- 		Priority = true,
		-- 		PlayOnce = true,
		-- 		UseableOffSource = true,
		-- 		UseInitialInteractSetup = true,
		-- 		RequiredTextLines = { "ThanatosGift06" },
		-- 		RequiredAnyTextLines = { "ThanatosFieldAboutPersephoneFirstMeeting01", "ThanatosAboutPersephoneMeeting02" },
		-- 		RequiredFalseTextLinesLastRun = { "ThanatosAboutPersephoneMeeting02" },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		RequiresLastRunCleared = true,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.5,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- I hope so.
		-- 			{ Cue = "/VO/ZagreusHome_3233" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0650",
		-- 			Text =
		-- 			"How's everything been going with your mother, Zagreus? You've been pretty quiet about the whole thing, is everything all right? You can tell me."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3232",
		-- 			Portrait = "Portrait_Zag_Serious_01",
		-- 			Speaker = "CharProtag",
		-- 			Text =
		-- 			"Thank you for asking, Than. I don't know how much more I can say right now, given everything. I'm still figuring it out myself. I'm thankful you've been there to help me get to see her from time to time."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0651",
		-- 			Text =
		-- 			"Well, if there's something more that I can do to support you in this, let me know, all right? Sounds like you're making progress, at least."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosPostEnding01 = {
		-- 		SuperPriority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredTextLines = { "Ending01" },
		-- 		MaxRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 20 },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.5,
		-- 			UsePlayerSource = true,
		-- 			-- Bye, Than.
		-- 			{ Cue = "/VO/ZagreusHome_3240" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0660",
		-- 			Text =
		-- 			"So, between us... all your attempting to break out of here, over and over... you're now authorized to keep that up? Exposing weaknesses in Underworld security, huh."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3238",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Something like that. I guess I've gotten pretty decent about escaping from a place that's known for being inescapable. Lets me keep in touch with the other side of the family. Work with you from time to time."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0661",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"I have to say I never thought I'd hear you talking about looking forward to working, Zag. You feeling all right? Spending too much time on the surface, maybe?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3239",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"Oh I'm feeling fine. I never thought I was much good at anything, but... if my fated purpose is to be a master of frustrating Father's efforts to make everything strictly perfect, I think I'm OK with that."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0662",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.0, SkipExitReaction = true },
		-- 			Text =
		-- 			"Well, then, I'll be looking forward to working with you in a more official capacity. Even if we're still supposed to keep it all under wraps, for sake of appearances. See you out there."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosPostEnding02 = {
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredTextLines = { "Ending01", "ThanatosGift05" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "Ending01", "ThanatosPostEnding01" }, Count = 4 },
		-- 		AreIdsAlive = { 555714 },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 2,
		-- 			-- Oh I entirely agree with that.
		-- 			{ Cue = "/VO/ZagreusHome_3235" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0652",
		-- 			Text =
		-- 			"Have to tell you, Zag. It's different, with your mother around here. Don't mean to be so obvious, but... it's something about your father, I suppose."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3234",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"I think they have a lot of work ahead of them. As long as they're trying... he's trying... I think I'm good with that, for now. Though, I am glad she's here."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0653",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.8, SkipExitReaction = true },
		-- 			Text =
		-- 			"I'm beginning to think we all are. And, please don't take this the wrong way, but... I think you and your father have a lot of work ahead of you, as well."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosPostEpilogue01 = {
		-- 		SuperPriority = true,
		-- 		PlayOnce = true,
		-- 		UseInitialInteractSetup = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredTextLines = { "OlympianReunionQuestComplete", "ThanatosGift03" },
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.45,
		-- 			UsePlayerSource = true,
		-- 			-- Bye, Than.
		-- 			{ Cue = "/VO/ZagreusHome_3240" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0658",
		-- 			Text =
		-- 			"Your mother's very clever, Zagreus. I always thought you got that from your father, now I'm not so sure. So all is well with the Olympians, again?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3236",
		-- 			Portrait = "Portrait_Zag_Default_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkDenialStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text = "For now, I think it is. But, you know how they are. How we all are, I guess."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0659",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.7, SkipExitReaction = true },
		-- 			Text =
		-- 			"{#DialogueItalicFormat}Hah{#PreviousFormat}! Yes, indeed. Well, then! I guess enjoy it while it lasts, as mortals sometimes say. I'll see you out there."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.Brooding,
		-- 	},

		-- 	ThanatosWithHades01 = {
		-- 		Priority = true,
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosHomeMiscMeeting01" },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		RequiredFalseValues = { CurrentEmployeeOfTheMonth = "Thanatos" },
		-- 		PlayOnce = true,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		StatusAnimation = false,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.5,
		-- 			UsePlayerSource = true,
		-- 			RequiredMinElapsedTime = 3,
		-- 			-- <Sigh>
		-- 			{ Cue = "/VO/ZagreusHome_0788" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hades_0354",
		-- 			Portrait = "Portrait_Hades_Default_01",
		-- 			Speaker = "NPC_Hades_01",
		-- 			Text =
		-- 			"Such tardiness is oft to be expected from your brother, but from you, Thanatos? You're practically the god of punctuality."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0373",
		-- 			Text =
		-- 			"My lord, I apologize sincerely for the lapse in my performance as of late. I think my duties following the recent war above took more of a toll from me than I expected."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hades_0355",
		-- 			Portrait = "Portrait_Hades_Default_01",
		-- 			Speaker = "NPC_Hades_01",
		-- 			Text =
		-- 			"Thanatos, even we gods require rest from time to time. Someday we might get it around here, once this accursed House is well in order, finally. Until then, I appreciate your diligence. Do not overextend yourself."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0374",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3, SkipExitReaction = true },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text = "Thank you, my lord. I am at your service. I'll be getting back to my assignment now."
		-- 		},
		-- 	},

		-- 	ThanatosWithHades02 = {
		-- 		PlayOnce = true,
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosWithHades01", "ThanatosGift03" },
		-- 		RequiredEncounterThisRun = "ThanatosTartarus",
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		RequiredFalseValues = { CurrentEmployeeOfTheMonth = "Thanatos" },
		-- 		StatusAnimation = false,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		-- <Sigh>
		-- 		EndCue = "/VO/ZagreusField_1637",
		-- 		EndWait = 0.3,
		-- 		{
		-- 			Cue = "/VO/Hades_0095",
		-- 			Portrait = "Portrait_Hades_Default_01",
		-- 			Speaker = "NPC_Hades_01",
		-- 			PreLineWait = 0.4,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.4, SkipExitReaction = true },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text =
		-- 			"...You have been rather slow about your duties, lately, Thanatos. And I'm receiving incident reports from Tartarus involving {#DialogueItalicFormat}you{#PreviousFormat}. Remember your responsibilities. And, remember, {#DialogueItalicFormat}I am watching you{#PreviousFormat}. Now, get out of my sight."
		-- 		},
		-- 	},

		-- 	ThanatosWithHades03 = {
		-- 		Priority = true,
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosGift06" },
		-- 		RequiredFalseTextLinesLastRun = { "ThanatosGift06" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithHades02" }, Count = 1 },
		-- 		RequiredFalseTextLines = { "Ending01", "ThanatosWithHades04" },
		-- 		RequiredFalseValues = { CurrentEmployeeOfTheMonth = "Thanatos" },
		-- 		PlayOnce = true,
		-- 		StatusAnimation = false,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		-- <Sigh>
		-- 		EndCue = "/VO/ZagreusHome_0788",
		-- 		EndWait = 0.8,
		-- 		{
		-- 			Cue = "/VO/Hades_0625",
		-- 			Portrait = "Portrait_Hades_Default_01",
		-- 			Speaker = "NPC_Hades_01",
		-- 			PreLineAnim = "Hades_HouseFistSlam",
		-- 			PreLineAnimTarget = 370006,
		-- 			Emote = "PortraitEmoteAnger",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"You've been abetting him, Thanatos. Behind my back! Betrayal. I would ask you {#DialogueItalicFormat}why{#PreviousFormat}. Well?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0473",
		-- 			PreLineWait = 0.5,
		-- 			Text =
		-- 			"My lord, he and I... please. Go lock me up in Tartarus, or deal whichever justice you see fit, but... my loyalty is not subject to change. And I cannot stand by and watch you fight. The matter between you and Zagreus... there has to be some resolution, here."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hades_0626",
		-- 			Portrait = "Portrait_Hades_Default_01",
		-- 			Speaker = "NPC_Hades_01",
		-- 			PreLineWait = 0.4,
		-- 			Text =
		-- 			"You dare to lecture me? {#DialogueItalicFormat}Tsch{#PreviousFormat}. My loyal subjects are too few of late, I think. This is {#DialogueItalicFormat}your {#PreviousFormat}realm, not mine; I'll not cast you into that wretched pit. It's not like I have someone to replace you here, besides. Now then, begone."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0474",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text = "I'm deeply sorry, lord..."
		-- 		},
		-- 	},

		-- 	ThanatosWithHades04 = {
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosGift06", "Ending01", "LordHadesPostEnding01" },
		-- 		RequiredFalseTextLinesLastRun = { "ThanatosGift06", "Ending01" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithHades01", "ThanatosWithHades02", "ThanatosWithHades03" }, Count = 10 },
		-- 		PlayOnce = true,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0546",
		-- 			PreLineWait = 0.5,
		-- 			Text = "You wished to see me once again, my lord? It's been... a while since I had an audience with you."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hades_1186",
		-- 			Portrait = "Portrait_Hades_Default_01",
		-- 			Speaker = "NPC_Hades_01",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"It has. The last time, what was it you said? That there must be some resolution to the {#DialogueItalicFormat}matter{#PreviousFormat}, as you called it, with my son? Well it is settled, now. Isn't it, boy?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/ZagreusHome_3429",
		-- 			Portrait = "Portrait_Zag_Defiant_01",
		-- 			Speaker = "CharProtag",
		-- 			PreLineAnim = "ZagreusTalkEmpathyStart",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineAnim = "ZagreusTalkEmpathy_Return",
		-- 			PostLineAnimTarget = "Hero",
		-- 			Text =
		-- 			"I mean, you're still trying just as hard as ever to prevent me from escaping past the threshold of your realm, so, I don't know if I'd exactly call the matter {#DialogueItalicFormat}settled{#PreviousFormat}. But... it does feel different, now."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hades_1187",
		-- 			Portrait = "Portrait_Hades_Default_01",
		-- 			Speaker = "NPC_Hades_01",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"And so you see... I would continue in our mutual good graces, if you please. This House can only function if the upper management is in accord. What do you say?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0547",
		-- 			PreLineWait = 0.4,
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"I say, you honor me, my lord. I appreciate you telling me, yourself. And I concur that, for the good of all the Underworld, it is imperative that each of us continue to perform at our full strength."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hades_1188",
		-- 			Portrait = "Portrait_Hades_Default_01",
		-- 			Speaker = "NPC_Hades_01",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.4, SkipExitReaction = true },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text = "Then, as you were. Dismissed."
		-- 		},
		-- 	},

		-- 	ThanatosWithHypnos01 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		PlayOnce = true,
		-- 		RequiredMinNPCInteractions = { NPC_Thanatos_01 = 1 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.8,
		-- 			UsePlayerSource = true,
		-- 			-- Oh...
		-- 			{ Cue = "/VO/ZagreusHome_0561" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0218",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"Hypnos, really, that is the worst idea I think I've ever heard. Do you understand how little sense that makes?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0086",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			PreLineAnim = "HypnosIdleGreeting",
		-- 			PreLineAnimTarget = 370024,
		-- 			Emote = "PortraitEmoteCheerful",
		-- 			Text =
		-- 			"I'm just saying, maybe if you just, I don't know, had all the mortals die at the same time, it'd save you a bunch of trips, and then we'd have more time to spend together, huh?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0219",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", SkipExitReaction = true },
		-- 			Text = "I don't know why I bother with you, honestly. Get back to work, and let me do the same."
		-- 		},
		-- 	},
		-- 	ThanatosWithHypnos02 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredTextLines = { "ThanatosWithHades01", "ThanatosWithHypnos01" },
		-- 		PlayOnce = true,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.9,
		-- 			UsePlayerSource = true,
		-- 			-- Oof.
		-- 			{ Cue = "/VO/ZagreusField_1146" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0220",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text = "You cannot keep falling asleep on the job like this, Hypnos. This is completely unacceptable."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0087",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			Text =
		-- 			"Oh I just nodded off a little while, Thanatos! I rest easy knowing that you're here! But if I goofed, why, I guess you could kill me dead, or something, huh?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0221",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", SkipExitReaction = true },
		-- 			Text =
		-- 			"Don't give me any ideas. Pull yourself together, and quit slacking off. The House needs help, and you've got a job to do. Now get to it!"
		-- 		},
		-- 	},
		-- 	-- brothers quest
		-- 	ThanatosWithHypnos03 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredAnyTextLines = { "Ending01", "ThanatosAboutHypnos02" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosAboutHypnos02" }, Count = 1 },
		-- 		PlayOnce = true,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.7,
		-- 			UsePlayerSource = true,
		-- 			-- Oof, sorry Hypnos.
		-- 			{ Cue = "/VO/ZagreusHome_2774" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0632",
		-- 			PreLineWait = 0.3,
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Emote = "PortraitEmoteDepressed",
		-- 			Text =
		-- 			"...Hypnos, this list has a bunch of tasks from I don't know how long ago, I mean... I took several of these last year! And you've already submitted this week's registrations, why isn't that marked complete?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0193",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			Emote = "PortraitEmoteCheerful",
		-- 			Text =
		-- 			"Don't you know it, I was just about to get to that! Then you showed up, and I got so distracted, it just kind of slipped my mind! It happens, right?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0633",
		-- 			Text =
		-- 			"You need to focus, Brother. Or it'll be Lord Hades reprimanding you again, and that is not something you want."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0194",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			PreLineAnim = "HypnosIdleGreeting",
		-- 			PreLineAnimTarget = 370024,
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", SkipExitReaction = true, WaitTime = 0.3 },
		-- 			Text =
		-- 			"Oh, I don't know about that, last time I talked to Master he made {#DialogueItalicFormat}pretty clear {#PreviousFormat}he never wanted to speak to me again!"
		-- 		},
		-- 	},
		-- 	-- brothers quest
		-- 	ThanatosWithHypnos04 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredTextLines = { "ThanatosWithHypnos03" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithHypnos03" }, Count = 2 },
		-- 		PlayOnce = true,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.35,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- Don't worry, I won't!
		-- 			{ Cue = "/VO/Hypnos_0198" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0536",
		-- 			PreLineWait = 0.3,
		-- 			Text =
		-- 			"Hypnos, you're not irreplaceable, you understand? If you don't shape up, quickly, someone else is going to have your job."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0197",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			Emote = "PortraitEmoteCheerful",
		-- 			PreLineAnim = "HypnosIdleGreeting",
		-- 			PreLineAnimTarget = 370024,
		-- 			Text =
		-- 			"Oh I hear you loud and clear, Thanatos! And, let me tell you, they will have the {#DialogueItalicFormat}greatest job in all the Underworld{#PreviousFormat}!"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0537",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.2, SkipExitReaction = true },
		-- 			Text =
		-- 			"I feel like I'm not getting through to you, Brother. Well, after the inevitable happens, don't come telling me I didn't try."
		-- 		},
		-- 	},
		-- 	-- brothers quest
		-- 	ThanatosWithHypnos05 = {
		-- 		Priority = true,
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredTextLines = { "ThanatosWithHypnos04", "HypnosGift04" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithHypnos04" }, Count = 2 },
		-- 		PlayOnce = true,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			ObjectType = "NPC_Thanatos_01",
		-- 			-- If that'll be all?
		-- 			{ Cue = "/VO/Thanatos_0155" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0634",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"...Well, how often do you consult these lists you make? If you're spending too much time just making lists, you're not leaving time to get anything done."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0195",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			Emote = "PortraitEmoteAffection",
		-- 			PreLineAnim = "HypnosIdleGreeting",
		-- 			PreLineAnimTarget = 370024,
		-- 			Text =
		-- 			"Oh, I {#DialogueItalicFormat}love {#PreviousFormat}making my lists... I always illustrate the edges, each one is {#DialogueItalicFormat}unique{#PreviousFormat}! That way anyone who gets to review the work, it's a whole {#DialogueItalicFormat}experience{#PreviousFormat}, you know? But... I guess it does take up a lot of time."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0635",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Text =
		-- 			"You'll have to work around the constraints of your responsibilities. You do take breaks, don't you? Before and after each break, maybe that's a time to make sure your own list of priorities is up-to-date."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0196",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.1, SkipExitReaction = true },
		-- 			Text =
		-- 			"Wait, my own list of priorities...? But, you're saying I can just go and make a list... for me? Huh. Whoa. {#DialogueItalicFormat}Whoa{#PreviousFormat}...."
		-- 		},
		-- 	},
		-- 	-- brothers quest
		-- 	ThanatosWithHypnos06 = {
		-- 		Priority = true,
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredTextLines = { "ThanatosWithHypnos05", "HypnosGift05", "ThanatosGift05" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithHypnos05" }, Count = 3 },
		-- 		PlayOnce = true,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			{
		-- 				PreLineWait = 0.4,
		-- 				UsePlayerSource = true,
		-- 				ObjectType = "NPC_Hypnos_01",
		-- 				-- Aww, thanks!
		-- 				{ Cue = "/VO/Hypnos_0200", PreLineAnim = "HypnosIdleGreeting" },
		-- 			},
		-- 			{
		-- 				PreLineWait = 0.15,
		-- 				UsePlayerSource = true,
		-- 				-- Good work, Hypnos!
		-- 				{ Cue = "/VO/ZagreusHome_2777" },
		-- 			},
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0538",
		-- 			PreLineWait = 0.3,
		-- 			Text =
		-- 			"I've heard that your reports have been immaculate of late, Hypnos. I have to know, who's helping you with them? It can't be Zagreus."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0199",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			Emote = "PortraitEmoteAffection",
		-- 			PreLineAnim = "HypnosIdleGreeting",
		-- 			PreLineAnimTarget = 370024,
		-- 			Text =
		-- 			"Oh, {#DialogueItalicFormat}haha{#PreviousFormat}, no, he doesn't help. It's just I took to listing only the important stuff up top, and spending just a bit more time on the priority reports, and... guess it's working out!"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0539",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.1, SkipExitReaction = true },
		-- 			Text = "Look, whatever the case... the work's improved. It's been observed. You ought to keep it up."
		-- 		},
		-- 	},
		-- 	-- brothers quest
		-- 	ThanatosWithHypnos07 = {
		-- 		Priority = true,
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredTextLines = { "ThanatosWithHypnos06", "HypnosGift06" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithHypnos06" }, Count = 2 },
		-- 		PlayOnce = true,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.4,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- Huh, that is right!
		-- 			{ Cue = "/VO/Hypnos_0202" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0540",
		-- 			PreLineWait = 0.3,
		-- 			Text =
		-- 			"...Though, what I mean to say is, that... I'm sorry, Hypnos. You're my brother, but I haven't always treated you that way. Would you be willing to forgive me?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0201",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			Emote = "PortraitEmoteAffection",
		-- 			PreLineAnim = "HypnosIdleGreeting",
		-- 			PreLineAnimTarget = 370024,
		-- 			Text =
		-- 			"Aww, come on, Thanatos, are you kidding me, right here? We're like two skeletons in a crypt! You're the best, and you're always looking out for me. Even when you're not around for what can seem like aeons at a time!"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0541",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.4, SkipExitReaction = true },
		-- 			Text =
		-- 			"Well let's not get ahead of ourselves, here. We each have got important jobs to do. Isn't that right, Brother?"
		-- 		},
		-- 	},
		-- 	-- brothers quest
		-- 	ThanatosWithHypnos08 = {
		-- 		Priority = true,
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredTextLines = { "ThanatosWithHypnos07", "ThanatosAboutHypnos03" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithHypnos07" }, Count = 2 },
		-- 		RequiredValues = { CurrentEmployeeOfTheMonth = "Hypnos" },
		-- 		PlayOnce = true,
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			{
		-- 				PreLineWait = 0.4,
		-- 				UsePlayerSource = true,
		-- 				ObjectType = "NPC_Hypnos_01",
		-- 				-- Will do!
		-- 				{ Cue = "/VO/Hypnos_0204" },
		-- 			},
		-- 			{
		-- 				PreLineWait = 0.15,
		-- 				UsePlayerSource = true,
		-- 				-- Hey, he did it.
		-- 				{ Cue = "/VO/ZagreusHome_2776" },
		-- 			},
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0636",
		-- 			PreLineWait = 0.35,
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "...Congratulations, Brother! I saw you finally made the board. You made us proud."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Hypnos_0203",
		-- 			Portrait = "Portrait_ChildGhost_Default_01",
		-- 			Speaker = "NPC_Hypnos_01",
		-- 			Emote = "PortraitEmoteCheerful",
		-- 			Text =
		-- 			"Sure did! That's something, huh? Though, sorry Thanatos, can't really chat right now, the shades are stacking up, there's greetings to be done, and sign-ins... lots of work to do, you know?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0637",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.1, SkipExitReaction = true },
		-- 			Text = "I definitely know the feeling. Well then, let's keep it up, the both of us, all right?"
		-- 		},
		-- 	},

		-- 	ThanatosWithNyx01 = {
		-- 		PlayOnce = true,
		-- 		Partner = "NPC_Nyx_01",
		-- 		RequiredAnyTextLines = { "ThanatosGift01", "NyxGift02" },
		-- 		RequiredFalseTextLinesThisRun = { "PersephoneFirstMeeting", "Ending01", "OlympianReunionQuestComplete" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "NyxAboutDusa04" }, Count = 4 },
		-- 		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 370010,
		-- 		TeleportOffsetX = -120,
		-- 		TeleportOffsetY = 30,
		-- 		AngleTowardTargetId = 370010,
		-- 		InteractDistance = 375,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.35,
		-- 			ObjectType = "NPC_Nyx_01",
		-- 			-- Farewell.
		-- 			{ Cue = "/VO/Nyx_0137" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0542",
		-- 			Text =
		-- 			"Mother, is there something I can do to help, with all of this? I spend too much time away from the House. Please, let me know."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Nyx_0136",
		-- 			Portrait = "Portrait_Nyx_Default_01",
		-- 			Speaker = "NPC_Nyx_01",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"You are already doing what you can to help, my son. Continue doing so. Matters are at stake here concerning you and all of us. Your support and choices in this shape the outcome that shall come to pass."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0543",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.1, SkipExitReaction = true },
		-- 			Text =
		-- 			"I understand, and I will do my best. Thank you for taking care of everything. I've every faith in you, Mother. And in this House. Farewell."
		-- 		},
		-- 	},
		-- 	ThanatosWithNyx02 = {
		-- 		PlayOnce = true,
		-- 		Partner = "NPC_Nyx_01",
		-- 		RequiredTextLines = { "OlympianReunionQuestComplete", "ThanatosGift10", "NyxGift09" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete", "NyxAboutDusa04" }, Count = 5 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 370010,
		-- 		TeleportOffsetX = -120,
		-- 		TeleportOffsetY = 30,
		-- 		AngleTowardTargetId = 370010,
		-- 		InteractDistance = 375,
		-- 		EndVoiceLines = {
		-- 			{
		-- 				PreLineWait = 0.45,
		-- 				ObjectType = "NPC_Nyx_01",
		-- 				-- Thank you, my son.
		-- 				{ Cue = "/VO/Nyx_0298" },
		-- 			},
		-- 			{
		-- 				PreLineWait = 0.15,
		-- 				UsePlayerSource = true,
		-- 				-- Heh.
		-- 				{ Cue = "/VO/ZagreusHome_3190" },
		-- 			},
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0554",
		-- 			Text =
		-- 			"Am I imagining it, Mother, or has this House been running relatively smoothly as of late? Although I know I must be tempting the Three Fates by putting it like this."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Nyx_0297",
		-- 			Portrait = "Portrait_Nyx_Default_01",
		-- 			Speaker = "NPC_Nyx_01",
		-- 			Text =
		-- 			"It is through a concerted effort that the House thus thrives, for now. Though, it shall do so only through continued diligence on your behalf, and that of many others here. It is a good occasion to take brief reprieve. But we need you working to the best of your ability, here, Thanatos."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0555",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.1, SkipExitReaction = true },
		-- 			Text =
		-- 			"Well... know that I am ever-grateful, Mother. And I love you very much. Where would we be right now if not for you? I don't take what you've done for us for granted, nor does anybody here. You rest assured."
		-- 		},
		-- 	},

		-- 	ThanatosWithMegaera01 = {
		-- 		PlayOnce = true,
		-- 		Partner = "NPC_FurySister_01",
		-- 		RequiredAnyTextLines = { "MegaeraMeeting01", "MegaeraMeeting01_B", "MegaeraMeeting01_Alt", "MegaeraMeeting01_Alt_B", "ThanatosGift01" },
		-- 		RequiredMinNPCInteractions = { NPC_Thanatos_01 = 1 },
		-- 		RequiredFalseTextLines = { "MegaeraGift08" },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		StatusAnimation = false,
		-- 		TeleportToId = 390082,
		-- 		TeleportOffsetX = -185,
		-- 		TeleportOffsetY = 50,
		-- 		AngleTowardTargetId = 390082,
		-- 		InteractDistance = 300,
		-- 		{
		-- 			Cue = "/VO/MegaeraHome_0017",
		-- 			Portrait = "Portrait_FurySister01_Standoffish_01",
		-- 			Speaker = "NPC_FurySister_01",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"...But that was then and this is now, and we have work to do.... {#DialogueItalicFormat}Uh{#PreviousFormat}, anyway, Than, I think we'd best continue this discussion at some other time."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0393",
		-- 			Text = "You're interrupting private conversation, Zagreus. Leave us."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/MegaeraHome_0018",
		-- 			Portrait = "Portrait_FurySister01_Standoffish_01",
		-- 			Speaker = "NPC_FurySister_01",
		-- 			Text =
		-- 			"No, let him stay, if that's what he wants. What does it matter? He's technically allowed within these halls, but he must know he isn't welcome anymore."
		-- 		},
		-- 	},

		-- 	ThanatosWithPersephone01 = {
		-- 		PlayOnce = true,
		-- 		Partner = "NPC_Persephone_Home_01",
		-- 		RequiredTextLines = { "Ending01", "PersephoneHomeMeeting01" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 4 },
		-- 		MaxRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 40 },
		-- 		RequiredFalseFlags = { "PersephoneGoingAway" },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 555714,
		-- 		TeleportOffsetX = -65,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 555714,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.35,
		-- 			ObjectType = "NPC_Persephone_Home_01",
		-- 			-- I know how mortals hate waiting around!
		-- 			{ Cue = "/VO/Persephone_0181" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0654",
		-- 			Text =
		-- 			"Queen Persephone. All of us, we are most pleased you're back. If there is anything that I can do to ease your acclimation to this House, you need but ask."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Persephone_0180",
		-- 			Portrait = "Portrait_Persephone_Queen_01",
		-- 			Speaker = "NPC_Persephone_Home_01",
		-- 			PreLineAnim = "PersephoneUnderworld_Vulnerable",
		-- 			PreLineAnimTarget = 555714,
		-- 			Text =
		-- 			"Why, thank you, Thanatos! I'll take you up on that if I can think of anything anytime soon. But my, you've grown! I understand you've been looking after my son, in the meantime?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0655",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 3.5, SkipExitReaction = true },
		-- 			Text =
		-- 			"Your son, he... is very capable of looking after himself, it turns out. Although I try to be there, just in case. Though, I must beg your pardon, Queen. Someone awaits me on the surface now."
		-- 		},
		-- 	},
		-- 	ThanatosWithPersephone02 = {
		-- 		PlayOnce = true,
		-- 		Partner = "NPC_Persephone_Home_01",
		-- 		RequiredTextLines = { "ThanatosWithPersephone01", "ThanatosWithHypnos07" },
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithPersephone01" }, Count = 15 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 555714,
		-- 		TeleportOffsetX = -65,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 555714,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.35,
		-- 			ObjectType = "NPC_Persephone_Home_01",
		-- 			-- All right!
		-- 			{ Cue = "/VO/Persephone_0131" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0656",
		-- 			PreLineWait = 0.35,
		-- 			Text =
		-- 			"...I thank you for your blessings, Queen Persephone. Your son and I... we always were quite close, but through all this ordeal, we've become rather inseparable, I think."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Persephone_0182",
		-- 			Portrait = "Portrait_Persephone_Queen_01",
		-- 			Speaker = "NPC_Persephone_Home_01",
		-- 			PreLineAnim = "PersephoneUnderworld_Greeting",
		-- 			PreLineAnimTarget = 555714,
		-- 			Text =
		-- 			"Well, I can see that he has better taste than I do, Thanatos! I have a sense of how industrious you are. You just take care of yourself, please. And take care of each other, too, all right?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0657",
		-- 			PreLineAnim = "ThanatosIdleInhouseFidget_HairFlick",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.5, SkipExitReaction = true },
		-- 			Text = "As you will, Queen. I mean, all right."
		-- 		},
		-- 	},
		-- },
		-- RepeatableTextLineSets = {
		-- 	ThanatosHomeChat01 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0002",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Sorry, Zagreus, I have to go. Lots of assignments as of late. Too bad I can't be everywhere at once."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat02 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift06", },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0003",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "No use in making idle chat, right, Zagreus?"
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat03 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift06", "PersephoneMeeting06", "ThanatosAboutStaying01" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0004",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "I have a job to do, and you've no interest in remaining here. See you around out there."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat04 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift06", },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0005",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Don't bother, Zagreus. I was just leaving."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat05 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "Ending01", "ThanatosGift07_A", "ThanatosGift07", },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0006",
		-- 			Text = "I hope you've thought through all of this. For both our sakes."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat06 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseDeathEncounters = { "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro" },
		-- 		RequiredFalseTextLines = { "Ending01", "ThanatosGift06" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0007",
		-- 			Text = "I can't keep bailing you out each time you get in over your head."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat07 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0008",
		-- 			Text = "I have to say it's quite a mess you've gotten yourself into, Zagreus."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat08 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift03" },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0009",
		-- 			Text = "You better know what you're doing."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat09 = {
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift06", },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0010",
		-- 			Text = "You're wasting your time. Just go."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat10 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift06", },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0011",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.35 },
		-- 			Text = "Shouldn't you be back out there by now, getting yourself killed?"
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat11 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredFalseDeathEncounters = { "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro" },
		-- 		RequiredFalseTextLines = { "Ending01", "ThanatosGift06" },
		-- 		RequiredRoom = "DeathArea",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0012",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "You know how much trouble I am getting myself into here?"
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat12 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift04", "ThanatosGift04_B" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0013",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "There's nothing left for us to talk about."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat13 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift03", },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0014",
		-- 			Text = "Don't talk to me. Just go."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat14 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift06", },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0015",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Excuse me, I've got work to do."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat15 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0016",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Not now, I have to go."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat16 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift010", },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0017",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "I don't know what you want from me."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat17 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift07", "ThanatosGift07_A" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0018",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "I have to get back to my responsibilities."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat18 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0019",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "You are in so much trouble."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat19 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "ThanatosGift08", },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0020",
		-- 			Text = "You watch yourself out there."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	-- relationship improved
		-- 	ThanatosHomeChat20 = {
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift06", },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0021",
		-- 			Text = "Take care of yourself."
		-- 		},
		-- 	},
		-- 	ThanatosHomeChat21 = {
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift06", },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0022",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "I'll see you out there, I guess."
		-- 		},
		-- 	},
		-- 	ThanatosHomeChat22 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift03", },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0023",
		-- 			Text = "I hope all this is worth it."
		-- 		},
		-- 	},
		-- 	ThanatosHomeChat23 = {
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift06", },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0024",
		-- 			Text = "We'll meet again out there."
		-- 		},
		-- 	},
		-- 	ThanatosHomeChat24 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift03", },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0025",
		-- 			Text = "I hope you know what you're doing."
		-- 		},
		-- 	},
		-- 	ThanatosHomeChat25 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredAnyTextLines = { "ThanatosGift04", "ThanatosGift04_B" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0026",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Can't talk right now, I have to get to work."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat26 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredAnyTextLines = { "ThanatosGift04", "ThanatosGift04_B" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0027",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "I need to get to work. I'll see you later."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat27 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		RequiredTextLines = { "ThanatosGift01" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0028",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Your father's going to have my hide."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat28 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		RequiredAnyTextLines = { "ThanatosGift04", "ThanatosGift04_B" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0029",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "I am in so much trouble, you have no idea..."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeChat29 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		RequiredTextLines = { "ThanatosGift03" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0030",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "What have I gotten myself into, Zag..."
		-- 		},
		-- 	},

		-- 	-- max relationship
		-- 	ThanatosHomeMaxChat01 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift05" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0439",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Much as I would like to stay and chat, I'd better go."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat02 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift08" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0440",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Zag, I've got so many mortals on my plate right now..."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat03 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift07_A" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0441",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "See you out there soon enough, all right?"
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat04 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift10" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0442",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "If you stay out too long, I'm going to track you down."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat05 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift06" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0443",
		-- 			Text = "Sounds like we've both been keeping plenty busy as of late."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat06 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift06" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0444",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5 },
		-- 			Text = "Now that you're here, I can finally head out."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat07 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift06" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0445",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "We'll have to catch up more some other time."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat08 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift09" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0446",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Sorry Zag, I'm due to get a bunch of mortals now."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat09 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift06" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0447",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited" },
		-- 			Text = "Excuse me, Zag, just got word that I'm needed back up top."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat10 = {
		-- 		-- Priority = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift08" },
		-- 		RequiredFalseTextLines = { "Ending01" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0448",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "Hope your father's going to be all right with all of this."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat11 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift06" },
		-- 		RequiredFalseDeathEncounters = { "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro" },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0449",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "We showed those wretches last time, didn't we."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat12 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift10" },
		-- 		RequiresRunCleared = true,
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0450",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "Good running into you out there, and glad you made it out."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat13 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiresRunCleared = true,
		-- 		RequiredTextLines = { "PersephoneMeeting02" },
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0451",
		-- 			Text = "Impressive that you went the distance once again."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat14 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift08" },
		-- 		RequiresRunCleared = true,
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0452",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "Was good having an opportunity to back you up out there."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat15 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift08" },
		-- 		RequiresRunCleared = true,
		-- 		EndGlobalVoiceLines = "MiscEndVoiceLines_Thanatos",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0453",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "I heard you did good work out there last time."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat16 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift10" },
		-- 		RequiresRunCleared = true,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0454",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "The shades are murmuring about your latest exploits, Zag."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},
		-- 	ThanatosHomeMaxChat17 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredTextLines = { "ThanatosGift05" },
		-- 		RequiredRoomThisRun = "D_Hub",
		-- 		{
		-- 			Cue = "/VO/Thanatos_0455",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.6 },
		-- 			Text = "Don't have a lot of time for catching up right now, here, Zag."
		-- 		},
		-- 		OnQueuedFunctionName = "CheckDistanceTriggerThread",
		-- 		OnQueuedFunctionArgs = mod.PresetEventArgs.BroodingRepeatable,
		-- 	},

		-- 	-- intermission scenes
		-- 	-- alt ids: { 422142 (m), 422255 (t), }
		-- 	ThanatosHomeIntermissionChat01 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		StatusAnimation = "StatusIconWantsToSmooch",
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		-- 		RequiredFalseQueuedTextLines = { "MegIntermissionChat01", "MegIntermissionChat02", "MegIntermissionChat03", "MegIntermissionChat04", "MegIntermissionChat05", "MegIntermissionChat06" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanIntermissionTextLines, Count = 11 },
		-- 		-- prevent a progstop
		-- 		RequiredFalseTextLinesThisRun = { "PersephoneMeeting08" },
		-- 		AreIdsAlive = { 390082 },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0456",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit",
		-- 			AngleTowardHero = true,
		-- 			PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
		-- 			PostLineFunctionArgs = { Partner = "Thanatos", UseRandomSounds = true },
		-- 			Text = "You're not in too much of a hurry, are you, Zag?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0457",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			FadeOutTime = 0.5,
		-- 			FadeOutEndSound = "/SFX/Menu Sounds/WeaponUnlockPoof",
		-- 			FullFadeTime = 7.5,
		-- 			LoadMap = "DeathAreaBedroom",
		-- 			SpawnOnId = 422253,
		-- 			AngleTowardHero = true,
		-- 			TeleportHeroToId = 422254,
		-- 			AngleHeroTowardTargetId = 422253,
		-- 			FadeInTime = 2.5,
		-- 			FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
		-- 			PostLineGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
		-- 			Text = "Well then... some mortal up there's lived a good, long life."
		-- 		},
		-- 	},
		-- 	ThanatosHomeIntermissionChat02 = {
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		StatusAnimation = "StatusIconWantsToSmooch",
		-- 		RequiredRoom = "DeathArea",
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanIntermissionTextLines, Count = 11 },
		-- 		RequiredFalseQueuedTextLines = { "MegIntermissionChat01", "MegIntermissionChat02", "MegIntermissionChat03", "MegIntermissionChat04", "MegIntermissionChat05", "MegIntermissionChat06" },
		-- 		-- prevent a progstop
		-- 		RequiredFalseTextLinesThisRun = { "PersephoneMeeting08" },
		-- 		AreIdsAlive = { 390082 },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0458",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit",
		-- 			AngleTowardHero = true,
		-- 			PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
		-- 			PostLineFunctionArgs = { Partner = "Thanatos", UseRandomSounds = true },
		-- 			Text = "Mind if I practice my ability to shift short distances with someone else?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0459",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			FadeOutTime = 0.5,
		-- 			FadeOutEndSound = "/SFX/Menu Sounds/WeaponUnlockPoof",
		-- 			FullFadeTime = 7.5,
		-- 			LoadMap = "DeathAreaBedroom",
		-- 			SpawnOnId = 422253,
		-- 			AngleTowardHero = true,
		-- 			TeleportHeroToId = 422254,
		-- 			AngleHeroTowardTargetId = 422253,
		-- 			FadeInTime = 2.5,
		-- 			FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
		-- 			PostLineGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
		-- 			Text = "Well... I'd say that test was a success, wouldn't you?"
		-- 		},
		-- 	},
		-- 	ThanatosHomeIntermissionChat03 = {
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		StatusAnimation = "StatusIconWantsToSmooch",
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanIntermissionTextLines, Count = 11 },
		-- 		RequiredFalseQueuedTextLines = { "MegIntermissionChat01", "MegIntermissionChat02", "MegIntermissionChat03", "MegIntermissionChat04", "MegIntermissionChat05", "MegIntermissionChat06" },
		-- 		-- prevent a progstop
		-- 		RequiredFalseTextLinesThisRun = { "PersephoneMeeting08" },
		-- 		AreIdsAlive = { 390082 },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0460",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit",
		-- 			AngleTowardHero = true,
		-- 			PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
		-- 			PostLineFunctionArgs = { Partner = "Thanatos", UseRandomSounds = true },
		-- 			Text = "I have to shift away from here, though if you'd care to join me..."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0461",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			FadeOutTime = 0.5,
		-- 			FadeOutEndSound = "/SFX/Menu Sounds/WeaponUnlockPoof",
		-- 			FullFadeTime = 7.5,
		-- 			LoadMap = "DeathAreaBedroom",
		-- 			SpawnOnId = 422253,
		-- 			AngleTowardHero = true,
		-- 			TeleportHeroToId = 422254,
		-- 			AngleHeroTowardTargetId = 422253,
		-- 			FadeInTime = 2.5,
		-- 			FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
		-- 			PostLineGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
		-- 			Text = "Too bad I can't just shift you to the top, though this wasn't so bad."
		-- 		},
		-- 	},
		-- 	ThanatosHomeIntermissionChat04 = {
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		StatusAnimation = "StatusIconWantsToSmooch",
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanIntermissionTextLines, Count = 11 },
		-- 		RequiredFalseQueuedTextLines = { "MegIntermissionChat01", "MegIntermissionChat02", "MegIntermissionChat03", "MegIntermissionChat04", "MegIntermissionChat05", "MegIntermissionChat06" },
		-- 		-- prevent a progstop
		-- 		RequiredFalseTextLinesThisRun = { "PersephoneMeeting08" },
		-- 		AreIdsAlive = { 390082 },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0462",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit",
		-- 			AngleTowardHero = true,
		-- 			PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
		-- 			PostLineFunctionArgs = { Partner = "Thanatos", UseRandomSounds = true },
		-- 			Text = "Hey let's get out of here for just a bit, all right?"
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0463",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			FadeOutTime = 0.5,
		-- 			FadeOutEndSound = "/SFX/Menu Sounds/WeaponUnlockPoof",
		-- 			FullFadeTime = 7.5,
		-- 			LoadMap = "DeathAreaBedroom",
		-- 			SpawnOnId = 422253,
		-- 			AngleTowardHero = true,
		-- 			TeleportHeroToId = 422254,
		-- 			AngleHeroTowardTargetId = 422253,
		-- 			FadeInTime = 2.5,
		-- 			FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
		-- 			PostLineGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
		-- 			Text = "Whew. Thanks for the break, now back to it, I guess."
		-- 		},
		-- 	},
		-- 	ThanatosHomeIntermissionChat05 = {
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		StatusAnimation = "StatusIconWantsToSmooch",
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanIntermissionTextLines, Count = 11 },
		-- 		RequiredFalseQueuedTextLines = { "MegIntermissionChat01", "MegIntermissionChat02", "MegIntermissionChat03", "MegIntermissionChat04", "MegIntermissionChat05", "MegIntermissionChat06" },
		-- 		-- prevent a progstop
		-- 		RequiredFalseTextLinesThisRun = { "PersephoneMeeting08" },
		-- 		AreIdsAlive = { 390082 },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0464",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit",
		-- 			AngleTowardHero = true,
		-- 			PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
		-- 			PostLineFunctionArgs = { Partner = "Thanatos", UseRandomSounds = true },
		-- 			Text = "Was just about to go on break, if you would care to join me."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0465",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			FadeOutTime = 0.5,
		-- 			FadeOutEndSound = "/SFX/Menu Sounds/WeaponUnlockPoof",
		-- 			FullFadeTime = 7.5,
		-- 			LoadMap = "DeathAreaBedroom",
		-- 			SpawnOnId = 422253,
		-- 			AngleTowardHero = true,
		-- 			TeleportHeroToId = 422254,
		-- 			AngleHeroTowardTargetId = 422253,
		-- 			FadeInTime = 2.5,
		-- 			FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
		-- 			PostLineGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
		-- 			Text = "Good catching up. Take care of yourself, Zag."
		-- 		},
		-- 	},
		-- 	ThanatosHomeIntermissionChat06 = {
		-- 		UseableOffSource = true,
		-- 		RequiredRoom = "DeathArea",
		-- 		StatusAnimation = "StatusIconWantsToSmooch",
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanIntermissionTextLines, Count = 11 },
		-- 		RequiredFalseQueuedTextLines = { "MegIntermissionChat01", "MegIntermissionChat02", "MegIntermissionChat03", "MegIntermissionChat04", "MegIntermissionChat05", "MegIntermissionChat06" },
		-- 		-- prevent a progstop
		-- 		RequiredFalseTextLinesThisRun = { "PersephoneMeeting08" },
		-- 		AreIdsAlive = { 390082 },
		-- 		{
		-- 			Cue = "/VO/Thanatos_0466",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			PortraitExitAnimation = "Portrait_Thanatos_Pleased_01_Exit",
		-- 			AngleTowardHero = true,
		-- 			PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
		-- 			PostLineFunctionArgs = { Partner = "Thanatos", UseRandomSounds = true },
		-- 			Text = "I think you'd better head back to your quarters, Zagreus."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0467",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			FadeOutTime = 0.5,
		-- 			FadeOutEndSound = "/SFX/Menu Sounds/WeaponUnlockPoof",
		-- 			FullFadeTime = 7.5,
		-- 			LoadMap = "DeathAreaBedroom",
		-- 			SpawnOnId = 422253,
		-- 			AngleTowardHero = true,
		-- 			TeleportHeroToId = 422254,
		-- 			AngleHeroTowardTargetId = 422253,
		-- 			FadeInTime = 2.5,
		-- 			FadeInSound = "/Leftovers/Menu Sounds/EmoteAffection",
		-- 			PreLineAnim = "ZagreusInteractionThoughtful",
		-- 			PreLineAnimTarget = "Hero",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3 },
		-- 			PostLineGlobalVoiceLines = "PostBedroomIntermissionVoiceLines",
		-- 			Text = "Mm. I'd best get back to my responsibilities for now."
		-- 		},
		-- 	},

		-- 	-- max relationship w/ Meg
		-- 	ThanatosChatWithMegaera01 = {
		-- 		Partner = "NPC_FurySister_01",
		-- 		RequiredFalseTextLinesThisRun = { "Ending01" },
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
		-- 		RequiredAnyOtherTextLines = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanPartnerRepeatableTextLines, Count = 16 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 390082,
		-- 		TeleportOffsetX = -185,
		-- 		TeleportOffsetY = 50,
		-- 		AngleTowardTargetId = 390082,
		-- 		{
		-- 			Cue = "/VO/MegaeraHome_0249",
		-- 			Portrait = "Portrait_FurySister01_Pleased_01",
		-- 			Speaker = "NPC_FurySister_01",
		-- 			Text = "This is a private chat, if you'll excuse us, Zag."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0475",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "We'll see you later out there, Zagreus."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithMegaera02 = {
		-- 		Partner = "NPC_FurySister_01",
		-- 		RequiredFalseTextLinesThisRun = { "Ending01" },
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
		-- 		RequiredAnyOtherTextLines = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanPartnerRepeatableTextLines, Count = 18 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 390082,
		-- 		TeleportOffsetX = -185,
		-- 		TeleportOffsetY = 50,
		-- 		AngleTowardTargetId = 390082,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0476",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "Just catching up on things with Megaera here, Zag."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/MegaeraHome_0245",
		-- 			Portrait = "Portrait_FurySister01_Pleased_01",
		-- 			Speaker = "NPC_FurySister_01",
		-- 			Text = "We were just talking about you, Zagreus."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithMegaera03 = {
		-- 		Partner = "NPC_FurySister_01",
		-- 		RequiredFalseTextLinesThisRun = { "Ending01" },
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
		-- 		RequiredAnyOtherTextLines = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanPartnerRepeatableTextLines, Count = 16 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 390082,
		-- 		TeleportOffsetX = -185,
		-- 		TeleportOffsetY = 50,
		-- 		AngleTowardTargetId = 390082,
		-- 		{
		-- 			Cue = "/VO/MegaeraHome_0247",
		-- 			Portrait = "Portrait_FurySister01_Pleased_01",
		-- 			Speaker = "NPC_FurySister_01",
		-- 			Text = "Well if it isn't our mutual friend."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0477",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "Enjoy the peace and quiet with us, Zag."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithMegaera04 = {
		-- 		Partner = "NPC_FurySister_01",
		-- 		RequiredFalseTextLinesThisRun = { "Ending01" },
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
		-- 		RequiredAnyOtherTextLines = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanPartnerRepeatableTextLines, Count = 16 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 390082,
		-- 		TeleportOffsetX = -185,
		-- 		TeleportOffsetY = 50,
		-- 		AngleTowardTargetId = 390082,
		-- 		{
		-- 			Cue = "/VO/MegaeraHome_0248",
		-- 			Portrait = "Portrait_FurySister01_Pleased_01",
		-- 			Speaker = "NPC_FurySister_01",
		-- 			Text = "Just catching up with Thanatos, if you don't mind."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0478",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "Discussing work-related matters, Zagreus."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithMegaera05 = {
		-- 		Partner = "NPC_FurySister_01",
		-- 		RequiredFalseTextLinesThisRun = { "Ending01" },
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
		-- 		RequiredAnyOtherTextLines = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanPartnerRepeatableTextLines, Count = 16 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 390082,
		-- 		TeleportOffsetX = -185,
		-- 		TeleportOffsetY = 50,
		-- 		AngleTowardTargetId = 390082,
		-- 		{
		-- 			Cue = "/VO/MegaeraHome_0246",
		-- 			Portrait = "Portrait_FurySister01_Pleased_01",
		-- 			Speaker = "NPC_FurySister_01",
		-- 			Text = "Look who it is, Than. Zagreus."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0479",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "We've been comparing notes about our latest tasks."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithMegaera06 = {
		-- 		Partner = "NPC_FurySister_01",
		-- 		RequiredAnyTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
		-- 		RequiredAnyOtherTextLines = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B" },
		-- 		RequiredFalseTextLines = { "MegaeraWithThanatosBedroom01MegThan_BackOff" },
		-- 		RequiredFalseTextLinesThisRun = { "Ending01" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.MegThanPartnerRepeatableTextLines, Count = 16 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		TeleportToId = 390082,
		-- 		TeleportOffsetX = -185,
		-- 		TeleportOffsetY = 50,
		-- 		AngleTowardTargetId = 390082,
		-- 		{
		-- 			Cue = "/VO/MegaeraHome_0250",
		-- 			Portrait = "Portrait_FurySister01_Standoffish_01",
		-- 			Speaker = "NPC_FurySister_01",
		-- 			Text = "We're in the middle of a conversation, Zag."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0480",
		-- 			Portrait = "Portrait_Thanatos_Pleased_01",
		-- 			Text = "Catch up with you some other time, all right?"
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHypnos01 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredAnyTextLines = { "HypnosGift08", "ThanatosGift10" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.HypnosThanPartnerRepeatableTextLines, Count = 14 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.8,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- Bye!!
		-- 			{ Cue = "/VO/Hypnos_0270", PreLineAnim = "HypnosIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0606",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			Text = "...Looks like you have everything under control. Nice work, Hypnos."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHypnos02 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredAnyTextLines = { "HypnosGift08", "ThanatosGift10" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.HypnosThanPartnerRepeatableTextLines, Count = 14 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.8,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- Bye now!
		-- 			{ Cue = "/VO/Hypnos_0271", PreLineAnim = "HypnosIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0607",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			Text = "...Plenty of time for sleeping once your shift is over, right, Brother?"
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHypnos03 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredAnyTextLines = { "HypnosGift08", "ThanatosGift10" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.HypnosThanPartnerRepeatableTextLines, Count = 14 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.8,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- See you!
		-- 			{ Cue = "/VO/Hypnos_0272", PreLineAnim = "HypnosIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0608",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			Text = "...Heard your latest reports were looking good, Hypnos. You keep it up."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHypnos04 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredAnyTextLines = { "HypnosGift08", "ThanatosGift10" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.HypnosThanPartnerRepeatableTextLines, Count = 14 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.8,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- So long!
		-- 			{ Cue = "/VO/Hypnos_0273", PreLineAnim = "HypnosIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0609",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			Text = "...Anyway, good catching up, Hypnos."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHypnos05 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredAnyTextLines = { "HypnosGift08", "ThanatosGift10" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.HypnosThanPartnerRepeatableTextLines, Count = 14 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.8,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- OK!
		-- 			{ Cue = "/VO/Hypnos_0274", PreLineAnim = "HypnosIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0610",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			Text = "...That's the last of the new registrations, but I should have more soon."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHypnos06 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredAnyTextLines = { "HypnosGift08", "ThanatosGift10" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.HypnosThanPartnerRepeatableTextLines, Count = 14 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.8,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- Great!!
		-- 			{ Cue = "/VO/Hypnos_0275", PreLineAnim = "HypnosIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0611",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			Text = "...All right, I'd better get going. Take care, Brother."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHypnos07 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredAnyTextLines = { "HypnosGift08", "ThanatosGift10" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.HypnosThanPartnerRepeatableTextLines, Count = 14 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.8,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- Yep!
		-- 			{ Cue = "/VO/Hypnos_0276", PreLineAnim = "HypnosIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0606",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			Text = "...Looks like you have everything under control. Nice work, Hypnos."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHypnos08 = {
		-- 		Partner = "NPC_Hypnos_01",
		-- 		RequiredAnyTextLines = { "HypnosGift08", "ThanatosGift10" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.HypnosThanPartnerRepeatableTextLines, Count = 14 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370024,
		-- 		TeleportOffsetX = 110,
		-- 		TeleportOffsetY = 100,
		-- 		AngleTowardTargetId = 370024,
		-- 		InteractDistance = 400,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.8,
		-- 			ObjectType = "NPC_Hypnos_01",
		-- 			-- Haha, yeah!
		-- 			{ Cue = "/VO/Hypnos_0277", PreLineAnim = "HypnosIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0606",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			Text = "...Looks like you have everything under control. Nice work, Hypnos."
		-- 		},
		-- 	},

		-- 	ThanatosChatWithNyx01 = {
		-- 		Partner = "NPC_Nyx_01",
		-- 		RequiredTextLines = { "ThanatosGift10", "NyxGift09", "Ending01", "OlympianReunionQuestComplete", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 12 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370010,
		-- 		TeleportOffsetX = -120,
		-- 		TeleportOffsetY = 30,
		-- 		AngleTowardTargetId = 370010,
		-- 		InteractDistance = 375,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.35,
		-- 			ObjectType = "NPC_Nyx_01",
		-- 			-- Farewell.
		-- 			{ Cue = "/VO/Nyx_0137", PreLineAnim = "NyxIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Nyx_0454",
		-- 			Portrait = "Portrait_Nyx_Default_01",
		-- 			Speaker = "NPC_Nyx_01",
		-- 			PreLineWait = 0.35,
		-- 			Text = "...We have another task for you."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0594",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.5, SkipExitReaction = true },
		-- 			Text = "As you will, Mother. It will be done immediately, then."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithNyx02 = {
		-- 		Partner = "NPC_Nyx_01",
		-- 		RequiredTextLines = { "ThanatosGift10", "NyxGift09", "Ending01", "OlympianReunionQuestComplete", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 12 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370010,
		-- 		TeleportOffsetX = -120,
		-- 		TeleportOffsetY = 30,
		-- 		AngleTowardTargetId = 370010,
		-- 		InteractDistance = 375,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.35,
		-- 			ObjectType = "NPC_Nyx_01",
		-- 			-- Very well.
		-- 			{ Cue = "/VO/Nyx_0234" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0595",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.6, SkipExitReaction = true },
		-- 			Text = "...Understood, Mother. Commencing the assignment now."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithNyx03 = {
		-- 		Partner = "NPC_Nyx_01",
		-- 		RequiredTextLines = { "ThanatosGift10", "NyxGift09", "Ending01", "OlympianReunionQuestComplete", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 12 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370010,
		-- 		TeleportOffsetX = -120,
		-- 		TeleportOffsetY = 30,
		-- 		AngleTowardTargetId = 370010,
		-- 		InteractDistance = 375,
		-- 		{
		-- 			Cue = "/VO/Nyx_0455",
		-- 			Portrait = "Portrait_Nyx_Default_01",
		-- 			Speaker = "NPC_Nyx_01",
		-- 			PreLineWait = 0.35,
		-- 			Text = "...Your expertise is needed once again."
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0596",
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.5, SkipExitReaction = true },
		-- 			Text = "Then, very well, Mother. I'll begin right away, and be back soon."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithNyx04 = {
		-- 		Partner = "NPC_Nyx_01",
		-- 		RequiredTextLines = { "ThanatosGift10", "NyxGift09", "Ending01", "OlympianReunionQuestComplete", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 12 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370010,
		-- 		TeleportOffsetX = -120,
		-- 		TeleportOffsetY = 30,
		-- 		AngleTowardTargetId = 370010,
		-- 		InteractDistance = 375,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.35,
		-- 			ObjectType = "NPC_Nyx_01",
		-- 			-- Indeed.
		-- 			{ Cue = "/VO/Nyx_0316", PreLineAnim = "NyxIdleGreeting" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0597",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.0, SkipExitReaction = true },
		-- 			Text = "...I hear you, Mother, and obey. I will return when the task is complete."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithNyx05 = {
		-- 		Partner = "NPC_Nyx_01",
		-- 		RequiredTextLines = { "ThanatosGift10", "NyxGift09", "Ending01", "OlympianReunionQuestComplete", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 12 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370010,
		-- 		TeleportOffsetX = -120,
		-- 		TeleportOffsetY = 30,
		-- 		AngleTowardTargetId = 370010,
		-- 		InteractDistance = 375,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.35,
		-- 			ObjectType = "NPC_Nyx_01",
		-- 			-- Then, go.
		-- 			{ Cue = "/VO/Nyx_0384" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0598",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.7, SkipExitReaction = true },
		-- 			Text = "Thank you for thinking of me for this task. I'll make it happen shortly."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithNyx06 = {
		-- 		Partner = "NPC_Nyx_01",
		-- 		RequiredTextLines = { "ThanatosGift10", "NyxGift09", "Ending01", "OlympianReunionQuestComplete", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 12 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370010,
		-- 		TeleportOffsetX = -120,
		-- 		TeleportOffsetY = 30,
		-- 		AngleTowardTargetId = 370010,
		-- 		InteractDistance = 375,
		-- 		EndVoiceLines = {
		-- 			PreLineWait = 0.35,
		-- 			ObjectType = "NPC_Nyx_01",
		-- 			-- Thank you, my son.
		-- 			{ Cue = "/VO/Nyx_0298" },
		-- 		},
		-- 		{
		-- 			Cue = "/VO/Thanatos_0599",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.7, SkipExitReaction = true },
		-- 			Text = "...The task is clear to me, Mother. I go. Your will be done."
		-- 		},
		-- 	},

		-- 	ThanatosChatWithHades01 = {
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosWithHades04", "ThanatosGift10", "HadesGift05", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 13 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0600",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.35, SkipExitReaction = true, },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text = "...It shall be as you say, my lord. I will report back soon."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHades02 = {
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosWithHades04", "ThanatosGift10", "HadesGift05", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 13 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0601",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.35, SkipExitReaction = true, },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text = "...Yes, my lord. I will begin, and not return until the deed is done."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHades03 = {
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosWithHades04", "ThanatosGift10", "HadesGift05", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 13 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0602",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.35, SkipExitReaction = true, },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text = "...If that is all, my lord, then I will make way for the surface now."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHades04 = {
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosWithHades04", "ThanatosGift10", "HadesGift05", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 13 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0603",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.35, SkipExitReaction = true, },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text = "...I understand, my lord. I know where they are and soon shall bring them here."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHades05 = {
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosWithHades04", "ThanatosGift10", "HadesGift05", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 13 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0604",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.35, SkipExitReaction = true, },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text = "...I do appreciate your faith in me, my lord. Begging your pardon, please."
		-- 		},
		-- 	},
		-- 	ThanatosChatWithHades06 = {
		-- 		Partner = "NPC_Hades_01",
		-- 		RequiredTextLines = { "ThanatosWithHades04", "ThanatosGift10", "HadesGift05", "ThanatosWithHypnos07" },
		-- 		MinRunsSinceAnyTextLines = { TextLines = GameData.NyxHadesThanPartnerRepeatableTextLines, Count = 13 },
		-- 		UseText = "UseListenNPC",
		-- 		BlockDistanceTriggers = true,
		-- 		UseableOffSource = true,
		-- 		GiftableOffSource = true,
		-- 		TeleportToId = 370006,
		-- 		TeleportOffsetX = -485,
		-- 		TeleportOffsetY = 350,
		-- 		AngleTowardTargetId = 370006,
		-- 		InteractDistance = 400,
		-- 		{
		-- 			Cue = "/VO/Thanatos_0605",
		-- 			PreLineWait = 0.35,
		-- 			PostLineThreadedFunctionName = "ThanatosExit",
		-- 			PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.35, SkipExitReaction = true, },
		-- 			PostLineAnim = "Hades_HouseWritingLoop_IdleLoop_Start",
		-- 			PostLineAnimTarget = 370006,
		-- 			Text = "...This matter will be dealt with promptly, lord. I expect to return shortly."
		-- 		},
		-- 	},
		-- },
		-- #endregion

		GiftTextLineSets = {
			ThanatosGift01 = {
				PlayOnce = true,
				{
					Cue = "/VO/ZagreusHome_0116",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "It isn't much, Than, but I got you something."
				},
				{
					Cue = "/VO/Thanatos_0177",
					Text =
					"You want me to take that off your hands, fine. But you are taking this from me, and if anybody asks, we're even. Or, scratch that, don't tell anyone about this, understand?"
				},
			},
			ThanatosGift02 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosGift01" },
				{
					Cue = "/VO/Thanatos_0166",
					Text =
					"What, really...? Come on, what is this, Zagreus. You think handing this to me makes up for everything you've put us through?"
				},
				{
					Cue = "/VO/ZagreusHome_0224",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "It's just something I found out there that I thought you might like, Than. Don't think anything of it."
				},
			},
			ThanatosGift03 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosGift02" },
				{
					Cue = "/VO/Thanatos_0167",
					Text =
					"Why bother with such empty gestures, Zag. You've said you're getting out of here; best focus on that and leave me be."
				},
				{
					Cue = "/VO/ZagreusHome_0779",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"It's not an empty gesture, Than. Besides, if I wasn't trying to stay focused, I'd be drinking it myself."
				},
			},
			ThanatosGift04 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosGift03" },
				RequiredFalseTextLines = { "Ending01", "ThanatosGift04_B" },
				{
					Cue = "/VO/Thanatos_0168",
					Text =
					"You shouldn't be doing this, Zag. You picked sides, and things are not the same. A momentary stab at thoughtfulness can't fix something like that."
				},
				{
					Cue = "/VO/ZagreusHome_0225",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"We've been through a lot, Than, and I think we'll be going through a lot more yet. Consider it a token of our kinship."
				},
			},
			ThanatosGift04_B = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosGift03", "Ending01" },
				RequiredFalseTextLines = { "ThanatosGift04" },
				{
					Cue = "/VO/Thanatos_0664",
					Text = "Don't know what you're expecting, giving this to me. If there's a catch here, I don't want to know."
				},
				{
					Cue = "/VO/ZagreusHome_0225",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"We've been through a lot, Than, and I think we'll be going through a lot more yet. Consider it a token of our kinship."
				},
			},

			ThanatosGift05 = {
				PlayOnce = true,
				RequiredAnyTextLines = { "ThanatosGift04", "ThanatosGift04_B" },
				{
					Cue = "/VO/Thanatos_0169",
					Text =
					"What is it with the generosity lately...? Look I'll just stash this with the rest if you really don't have a better thing to do with it than dump it off on me."
				},
				{
					Cue = "/VO/ZagreusHome_0780",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Hey, that's an idea. One of these days or nights, we'll have enough of this stuff to throw a feast to make all of Olympus jealous."
				},
			},
			ThanatosGift06 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosGift05" },
				{
					Cue = "/VO/Thanatos_0170",
					Text =
					"You can't be serious. You're serious...? {#DialogueItalicFormat}Eh{#PreviousFormat}, you know what, fine. I'll take this and we'll go about our business. Though I don't see why you bother."
				},
				{
					Cue = "/VO/ZagreusHome_0781",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Why I bother? Why, how else can I show you how I feel except by handing you these bottles from time to time?"
				},
			},

			-- high relationship / locked gifts
			ThanatosGift07_A = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosGift06" },
				{
					Cue = "/VO/ZagreusHome_1465",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Hey Than. For all the times you've bailed me out, and just, all the times you've been around for me... I thought I'd get you this. The real thing."
				},
				{
					Cue = "/VO/Thanatos_0556",
					Emote = "PortraitEmoteSurprise",
					AngleTowardHero = true,
					Text = "Ambrosia...! Zagreus, where did you even... don't you think this is a bit excessive?"
				},
				{
					Cue = "/VO/ZagreusHome_2479",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "You say that like it's a bad thing. Little bit of excess from time to time never hurt anyone I'm sure."
				},
				{
					Cue = "/VO/Thanatos_0557",
					Text =
					"{#DialogueItalicFormat}Oh{#PreviousFormat}, you would be surprised. Though if you're going to embarrass me, you know what, I am going to reciprocate. {#DialogueItalicFormat}Behold{#PreviousFormat}!"
				},
			},

			ThanatosGift08 = {
				PlayOnce = true,
				UseInitialInteractSetup = true,
				RequiredTextLines = { "ThanatosGift07_A" },
				EndVoiceLines = {
					PreLineWait = 0.35,
					UsePlayerSource = true,
					-- Yeah, but I wanted to!
					{ Cue = "/VO/ZagreusHome_2482" },
				},
				{
					Cue = "/VO/ZagreusHome_2480",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"For you, Thanatos. The Olympians might be accustomed to this stuff but I think we should have our share of it down here. At least you should."
				},
				{
					Cue = "/VO/Thanatos_0558",
					Text =
					"You know... the Olympians do have good taste in certain things. The last bottle you gave me... it was... better than expected. Though, I almost decided not to try it at all."
				},
				{
					Cue = "/VO/ZagreusHome_2481",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"But try it you did! And now, you'll get to try this one for comparison's sake. Each one's supposed to be different you know."
				},
				{
					Cue = "/VO/Thanatos_0559",
					PreLineWait = 0.3,
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text =
					"Different, huh. Well, then, I guess I'll have to see what you mean by that. Thank you, Zag. You didn't have to do this."
				},
			},

			ThanatosGift09 = {
				PlayOnce = true,
				UseInitialInteractSetup = true,
				RequiredTextLines = { "ThanatosGift08" },
				EndVoiceLines = {
					PreLineWait = 0.4,
					UsePlayerSource = true,
					-- Than, wait...!
					{ Cue = "/VO/ZagreusHome_1470" },
				},
				{
					Cue = "/VO/ZagreusHome_1467",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I hope you're ready for some more of the real thing, there, Than, because I got you some, and I won't be taking {#DialogueItalicFormat}'Tsch, what is this, Zag' {#PreviousFormat}for an answer."
				},
				{
					Cue = "/VO/Thanatos_0409",
					AngleTowardHero = true,
					Emote = "PortraitEmoteDepressed",
					Text =
					"Ugh, what is this? Come on, already, Zagreus, are you just messing with me, now? How did you even manage to get more of this, much less decide to hand it off to me?"
				},
				{
					Cue = "/VO/ZagreusHome_1468",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"In order: no, I'm not; by ransacking my father's realm repeatedly; and it's because I like you, Thanatos. In case you still have some misgivings about that."
				},
				{
					Cue = "/VO/Thanatos_0411",
					Text =
					"You {#DialogueItalicFormat}like {#PreviousFormat}me, Zagreus...? I never thought, I... don't know why that sounds so strange, coming from you. Given everything that's happened as of late."
				},
				{
					Cue = "/VO/ZagreusHome_1469",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Yeah. Look, if you don't feel the same way about me at this point, I would rather know. Cease all these coy gift exchanges, and all that."
				},
				{
					Cue = "/VO/Thanatos_0412",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3, SkipExitReaction = true },
					Emote = "PortraitEmoteFiredUp",
					Text =
					"I never said anything like that! You know what, there's... a bunch of mortals I have to go fetch. Good-bye."
				},
			},

			ThanatosGift10 = {
				PlayOnce = true,
				UseInitialInteractSetup = true,
				RequiredTextLines = { "ThanatosGift09" },
				EndVoiceLines = {
					PreLineWait = 0.75,
					UsePlayerSource = true,
					-- You too.
					{ Cue = "/VO/ZagreusHome_1475" },
				},
				{
					Cue = "/VO/ZagreusHome_1471",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Thanatos, I wanted to apologize for the last time I approached you with a bottle of the real thing, and give the whole exchange another shot. Would that be all right?"
				},
				{
					Cue = "/VO/Thanatos_0413",
					Text =
					"{#DialogueItalicFormat}Hmph{#PreviousFormat}! You're asking my consent to give me yet another lavish gift? Sure! Permission granted. Though, what makes you think that your approach this time is going to be any more successful than the last?"
				},
				{
					Cue = "/VO/ZagreusHome_1472",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I don't know that it will. I never really know exactly where I stand with you. But I know how I feel. And I'd rather be up front with you, even if it means risking our relationship, such as it is."
				},
				{
					Cue = "/VO/Thanatos_0414",
					Text =
					"Our relationship? It wasn't long ago you were prepared to throw it all away while making for the surface, if you don't recall. But now you're saying that you care for me, and... what, exactly, Zagreus?"
				},
				{
					Cue = "/VO/ZagreusHome_1473",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Yes, that's what I'm saying, Than. I should not have left the way I did, without letting you know. But when you found me, I... think that's when... that's when I knew. Or started to realize, you know?"
				},
				{
					Cue = "/VO/Thanatos_0415",
					Text =
					"I... yes. I know, I think, because... when I heard you took off, the anger that I felt, it was... it wasn't something I expected. So... {#DialogueItalicFormat}ungh{#PreviousFormat}. What do we do now?"
				},
				{
					Cue = "/VO/ZagreusHome_1474",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Maybe we ought to take our time? Unlike the real thing there, that's a commodity we have in good supply. Just know that, if you feel the way I do... you know where to find me. And if not... I'm grateful, anyway."
				},
				{
					Cue = "/VO/Thanatos_0416",
					AngleTowardHero = true,
					PreLineWait = 0.3,
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 0.3, UseMaxedPresentation = true, SkipExitReaction = true },
					Text =
					"...I see. Well, then. The best that I can say for now is that... I'm grateful, too, for this. Take care of yourself, Zag."
				},
			},

			-- below: old conversations from before the Welcome to Hell update
			ThanatosGift07 = {
				Skip = true,
				PlayOnce = true,
				RequiredTextLines = { "ThanatosGift06", },
				{
					Cue = "/VO/Thanatos_0171",
					Text =
					"I have to hand it to you, Zag, you're really putting in the work to get me to forgive you after all you've done. I'm honestly surprised."
				},
				{
					Cue = "/VO/ZagreusHome_0782",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Don't be. That feast of ours is really going to be something, Than."
				},
			},

		},

		MissingDistanceTrigger = {
			WithinDistance = 180,
			RequiredFalseFlags = { "InFlashback", },
			RequiredFalseTextLinesThisRun = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
			VoiceLines = {
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlayAll = 0.1,
				AreIdsNotAlive = { 423052 },
				Cooldowns = {
					{ Name = "ZagreusAnyQuipSpeech", Time = 30 },
				},

				-- Thanatos is on assignment huh.
				{ Cue = "/VO/ZagreusHome_0776" },
				-- Guess Than must be at work.
				{ Cue = "/VO/ZagreusHome_0777", RequiredPlayed = { "/VO/ZagreusHome_0776" } },
				-- Where's Thanatos I wonder.
				{ Cue = "/VO/ZagreusHome_0778", RequiredPlayed = { "/VO/ZagreusHome_0776" } },
			},
		},

		GiftGivenVoiceLines = {
			{
				BreakIfPlayed = true,
				PreLineWait = 1.0,
				PlayFromTarget = true,
				RequiredTextLines = { "ThanatosGift07_A" },

				-- What, Thanatos, is this... you're really giving Mort to me? I... I'm deeply honored!
				{ Cue = "/VO/ZagreusHome_1466" },
			},
			{
				BreakIfPlayed = true,
				PreLineWait = 1.0,
				PlayFromTarget = true,

				-- Thank you, Than.
				{ Cue = "/VO/ZagreusHome_0318" },
				-- I do indeed.
				-- { Cue = "/VO/ZagreusHome_0753" },
			},
		},
	},

	-- ThanatosField / Thanatos Field Version
	NPC_Thanatos_Field_01 = {
		InheritFrom = { "NPC_Thanatos_01" },
		GenusName = "NPC_Thanatos_01",
		AnimOffsetZ = 255,
		PreAttackEndShake = true,
		PreAttackFlashSound = "/Leftovers/SFX/AuraOnLoud",
		SpawnAnimation = "ThanatosTalkDismissal",
		AlwaysShowInvulnerabubbleOnInvulnerableHit = true,
		InvincibubbleScale = 1.33,

		ActivateRequirements = {
			RequiredCompletedRuns = 0,
		},

		Binks = {
			"ThanatosIdleInhouse_Bink",
			"ThanatosIdle_Bink",
			"ThanatosAttack_Bink",
			"ThanatosAttackHold_Bink",
			"ThanatosEmoteDismissal_Bink",
		},

		DefaultAIData = {
			PreAttackEndShake = true,

			AIAttackDistance = 1200,
			AIBufferDistance = 900,

			TargetFriends = true,
			IngoreCursedByThanatos = true,
			IgnoreInvulnerable = true,
			AIWanderDistance = 200,

			AIRequireProjectileLineOfSight = false,
			MoveSuccessDistance = 50,
		},
		AIOptions = { AttackerAI },
		PostCombatAI = "ThanatosPostCombat",
		PostCombatTeleportIfPastDistance = 800,

		WeaponOptions = { "ThanatosDeathCurse", "ThanatosDeathCurseAoE" },
		DisarmedWeapon = "ThanatosDeathCurse",
		OutgoingDamageModifiers = {
			{
				PlayerMultiplier = 0,
			}
		},

		EntranceVoiceLines = {
			{
				RequiredFalseTextLines = { "ThanatosFirstAppearance" },
				BreakIfPlayed = true,
				PreLineWait = 0.5,

				-- Death approaches.
				{ Cue = "/VO/Thanatos_0031" },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.25,
				RequiredTextLines = { "ThanatosFirstAppearance" },

				-- Death approaches.
				{ Cue = "/VO/Thanatos_0031",      PreLineWait = 0.75 },
				-- It's time.
				{ Cue = "/VO/Thanatos_0034" },
				-- Blood and darkness.
				{ Cue = "/VO/Thanatos_0036" },
				-- In the name of Hades.
				{ Cue = "/VO/Thanatos_0037" },
				-- Death has come.
				{ Cue = "/VO/Thanatos_0039" },
				-- You called?
				{ Cue = "/VO/Thanatos_0041" },
				-- Life and death, one and the same.
				{ Cue = "/VO/Thanatos_0042" },
				-- I got you.
				{ Cue = "/VO/Thanatos_0046" },
				-- Quite a mess you've made here, Zagreus.
				-- { Cue = "/VO/Thanatos_0050" },
				-- Death is inescapable.
				{ Cue = "/VO/Thanatos_0224" },
				-- Thought I'd find you here.
				{ Cue = "/VO/Thanatos_0225" },
				-- Thought I'd drop in.
				{ Cue = "/VO/Thanatos_0226",      RequiredTextLines = { "ThanatosGift01" } },
				-- I have returned.
				{ Cue = "/VO/Thanatos_0227" },
				-- I have arrived.
				{ Cue = "/VO/Thanatos_0228" },
				-- I am here.
				{ Cue = "/VO/Thanatos_0229" },
				-- Pardon the interruption.
				{ Cue = "/VO/Thanatos_0230" },
				-- Hello again.
				{ Cue = "/VO/Thanatos_0232" },
				-- I sensed your presence here.
				{ Cue = "/VO/Thanatos_0233" },
				-- Did you miss me, Zagreus...?
				-- { Cue = "/VO/Thanatos_0234",      RequiredTextLines = { "ThanatosGift06" } },
				-- How goes it, Zagreus?
				-- { Cue = "/VO/Thanatos_0235",      RequiredTextLines = { "ThanatosGift05" } },
				-- The time has come.
				{ Cue = "/VO/ThanatosField_0116" },
				-- Death has arrived.
				{ Cue = "/VO/ThanatosField_0117" },
				-- Death is inevitable.
				{ Cue = "/VO/ThanatosField_0118" },
				-- I found you, Zagreus.
				-- { Cue = "/VO/ThanatosField_0119", RequiredTextLines = { "ThanatosGift08" } },
				-- Looks like I got here just in time.
				{ Cue = "/VO/ThanatosField_0120", RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" } },
				-- I have returned.
				{ Cue = "/VO/ThanatosField_0121" },
				-- I thought I'd find you here.
				{ Cue = "/VO/ThanatosField_0122", RequiredTextLines = { "ThanatosGift08" } },
				-- It's been a little while, hasn't it?
				{ Cue = "/VO/ThanatosField_0123", RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" } },
				-- I happened to be in the area.
				{ Cue = "/VO/ThanatosField_0124", RequiredTextLines = { "ThanatosGift10" } },
				-- Why hello, Zagreus.
				-- { Cue = "/VO/ThanatosField_0125", RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" } },
				-- I have returned.
				{ Cue = "/VO/ThanatosField_0126" },
			},
		},

		EncounterStartVoiceLines = {
			{
				RandomRemaining = true,
				PreLineWait = 0.7,

				-- Back, you wretches.
				{ Cue = "/VO/Thanatos_0049",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Stand down.
				{ Cue = "/VO/Thanatos_0047",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- You wretches are coming with me.
				{ Cue = "/VO/Thanatos_0038",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- This ends now.
				{ Cue = "/VO/Thanatos_0035",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Time to die.
				-- { Cue = "/VO/Thanatos_0032" },
				-- Time is up.
				-- { Cue = "/VO/Thanatos_0033" },
				-- I'll take care of it.
				-- { Cue = "/VO/Thanatos_0156" },
				-- Good as done.
				-- { Cue = "/VO/Thanatos_0159" },
				-- So be it.
				-- { Cue = "/VO/Thanatos_0165" },

				-- You might want to stand back, there, Zag.
				-- { Cue = "/VO/Thanatos_0237",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Think you can beat me, Zag?
				-- { Cue = "/VO/Thanatos_0238",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Let's slay these wretches quickly.
				{ Cue = "/VO/Thanatos_0239",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Can you deal death faster than I?
				{ Cue = "/VO/Thanatos_0240",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- What say we get things started.
				{ Cue = "/VO/Thanatos_0241",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Let's get to it, then.
				{ Cue = "/VO/Thanatos_0242",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Here come your Father's forces.
				{ Cue = "/VO/Thanatos_0243" },
				-- I'll handle this.
				{ Cue = "/VO/Thanatos_0244",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- I'll make this quick.
				{ Cue = "/VO/Thanatos_0245",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Think you can beat me?
				{ Cue = "/VO/Thanatos_0246",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Who dies first?
				{ Cue = "/VO/Thanatos_0247",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- This won't take long.
				{ Cue = "/VO/Thanatos_0248",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- All of you; it's over.
				{ Cue = "/VO/Thanatos_0249",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- I'll send you to the lowest depths.
				{ Cue = "/VO/Thanatos_0250",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Prepare yourselves.
				{ Cue = "/VO/Thanatos_0251",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- This one's on me, Zag.
				-- { Cue = "/VO/Thanatos_0252",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- All of you, prepare to die again.
				{ Cue = "/VO/Thanatos_0253",      RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Together we bring death.
				{ Cue = "/VO/Thanatos_0254",      RequiredTextLines = { "ThanatosGift06" }, RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Together, like last time.
				{ Cue = "/VO/ThanatosField_0139", RequiredPlayed = { "/VO/Thanatos_0243" }, RequiredTextLines = { "ThanatosGift10" } },
				-- You brazen wretches ought to have turned back!
				{ Cue = "/VO/ThanatosField_0140", RequiredPlayed = { "/VO/Thanatos_0243" }, RequiredFalseBiome = "Elysium" },
				-- Come, wretches, and be returned to dust!
				{ Cue = "/VO/ThanatosField_0141", RequiredPlayed = { "/VO/Thanatos_0243" }, RequiredFalseBiome = "Elysium" },
				-- Who wants to be the first to die again?
				{ Cue = "/VO/ThanatosField_0142", RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- You so-called champions could use a lesson in humility.
				{ Cue = "/VO/ThanatosField_0143", RequiredPlayed = { "/VO/Thanatos_0243" }, RequiredTextLines = { "ThanatosGift08" },                        RequiredBiome = "Elysium" },
				-- All in Elysium should know of us by now.
				{ Cue = "/VO/ThanatosField_0144", RequiredPlayed = { "/VO/Thanatos_0243" }, RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" }, RequiredBiome = "Elysium" },
				-- Let's see how quickly we can wrap this up.
				{ Cue = "/VO/ThanatosField_0145", RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Let get things started, then.
				{ Cue = "/VO/ThanatosField_0146", RequiredPlayed = { "/VO/Thanatos_0243" }, RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" } },
				-- I doubt this will take very long at all.
				{ Cue = "/VO/ThanatosField_0147", RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- And here they come.
				{ Cue = "/VO/ThanatosField_0148", RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- They're coming, Zagreus. Be on your guard.
				-- { Cue = "/VO/ThanatosField_0227", RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Think you can beat me again, Zag?
				-- { Cue = "/VO/ThanatosField_0228", RequiredPlayed = { "/VO/Thanatos_0243" }, RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" } },
				-- What do you say we end this quickly, Zag?
				-- { Cue = "/VO/ThanatosField_0229", RequiredPlayed = { "/VO/Thanatos_0243" }, RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" } },
				-- Scared I'll take more of them than you this time?
				{ Cue = "/VO/ThanatosField_0230", RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- All of you, prepare to die again.
				{ Cue = "/VO/ThanatosField_0231", RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- Here they come, fresh for the taking, Zag.
				-- { Cue = "/VO/ThanatosField_0232", RequiredPlayed = { "/VO/Thanatos_0243" }, RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" } },
				-- Don't be too reckless to outpace me, Zagreus.
				-- { Cue = "/VO/ThanatosField_0233", RequiredPlayed = { "/VO/Thanatos_0243" } },
				-- You wretches never seem to learn, do you.
				{ Cue = "/VO/ThanatosField_0234", RequiredPlayed = { "/VO/Thanatos_0243" } },
			},
			{
				RandomRemaining = true,
				PreLineWait = 0.15,
				UsePlayerSource = true,

				-- No you don't.
				-- { Cue = "/VO/ZagreusField_0951" },

				-- That's not my style, Than.
				{ Cue = "/VO/ZagreusField_1478", RequiredPlayedThisRoom = { "/VO/Thanatos_0237" }, },
				-- One way to find out.
				{ Cue = "/VO/ZagreusField_1479", RequiredPlayedThisRoom = { "/VO/Thanatos_0238" }, },
				-- Let's, by all means.
				{ Cue = "/VO/ZagreusField_1480", RequiredPlayedThisRoom = { "/VO/Thanatos_0239" }, },
				-- Let's find out.
				{ Cue = "/VO/ZagreusField_1481", RequiredPlayedThisRoom = { "/VO/Thanatos_0240" }, },
				-- Sounds good.
				{ Cue = "/VO/ZagreusField_1482", RequiredPlayedThisRoom = { "/VO/Thanatos_0241" }, },
				-- Absolutely.
				{ Cue = "/VO/ZagreusField_1483", RequiredPlayedThisRoom = { "/VO/Thanatos_0242" }, },
				-- Let them come.
				{ Cue = "/VO/ZagreusField_1484", RequiredPlayedThisRoom = { "/VO/Thanatos_0243" }, },
				-- Got it under control, thanks.
				{ Cue = "/VO/ZagreusField_1485", RequiredPlayedThisRoom = { "/VO/Thanatos_0244" }, },
				-- That was my plan.
				{ Cue = "/VO/ZagreusField_1486", RequiredPlayedThisRoom = { "/VO/Thanatos_0245" }, },
				-- Occasionally, yes.
				{ Cue = "/VO/ZagreusField_1487", RequiredPlayedThisRoom = { "/VO/Thanatos_0246" }, },
				-- Hopefully not me.
				{ Cue = "/VO/ZagreusField_1488", RequiredPlayedThisRoom = { "/VO/Thanatos_0247" }, },
				-- No, it will not.
				{ Cue = "/VO/ZagreusField_1489", RequiredPlayedThisRoom = { "/VO/Thanatos_0248" }, },
				-- He's not kidding.
				{ Cue = "/VO/ZagreusField_1490", RequiredPlayedThisRoom = { "/VO/Thanatos_0249" }, },
				-- I'll also do that!
				{ Cue = "/VO/ZagreusField_1491", RequiredPlayedThisRoom = { "/VO/Thanatos_0250" }, },
				-- You better!
				{ Cue = "/VO/ZagreusField_1492", RequiredPlayedThisRoom = { "/VO/Thanatos_0251" }, },
				-- You're too kind.
				{ Cue = "/VO/ZagreusField_1493", RequiredPlayedThisRoom = { "/VO/Thanatos_0252" }, },
				-- Excluding me I hope.
				{ Cue = "/VO/ZagreusField_1494", RequiredPlayedThisRoom = { "/VO/Thanatos_0253" }, },
				-- Yeah.
				{ Cue = "/VO/ZagreusField_1495", RequiredPlayedThisRoom = { "/VO/Thanatos_0254" }, },
				-- We have this!
				{ Cue = "/VO/ZagreusField_2903", RequiredPlayedThisRoom = { "/VO/ThanatosField_0139" }, },
				-- You definitely ought!
				{ Cue = "/VO/ZagreusField_2904", RequiredPlayedThisRoom = { "/VO/ThanatosField_0140" }, },
				-- Or I'll slay you instead if you prefer!
				{ Cue = "/VO/ZagreusField_2905", RequiredPlayedThisRoom = { "/VO/ThanatosField_0141" }, },
				-- Not me.
				{ Cue = "/VO/ZagreusField_2906", RequiredPlayedThisRoom = { "/VO/ThanatosField_0142" }, },
				-- Lesson one: Don't mess with either one of us!
				{ Cue = "/VO/ZagreusField_2907", RequiredPlayedThisRoom = { "/VO/ThanatosField_0143" }, },
				-- I know, right?
				{ Cue = "/VO/ZagreusField_2908", RequiredPlayedThisRoom = { "/VO/ThanatosField_0144" }, },
				-- Let's see, indeed!
				{ Cue = "/VO/ZagreusField_2909", RequiredPlayedThisRoom = { "/VO/ThanatosField_0145" }, },
				-- Race you, Than!
				{ Cue = "/VO/ZagreusField_2910", RequiredPlayedThisRoom = { "/VO/ThanatosField_0146" }, },
				-- No doubt at all from me.
				{ Cue = "/VO/ZagreusField_2911", RequiredPlayedThisRoom = { "/VO/ThanatosField_0147" }, },
				-- And here they fall!
				{ Cue = "/VO/ZagreusField_2912", RequiredPlayedThisRoom = { "/VO/ThanatosField_0148" }, },
				-- I'll get right on it, Than!
				{ Cue = "/VO/ZagreusField_3571", RequiredPlayedThisRoom = { "/VO/ThanatosField_0227" }, },
				-- What do you think, Than?
				{ Cue = "/VO/ZagreusField_3572", RequiredPlayedThisRoom = { "/VO/ThanatosField_0228" }, },
				-- I say: Sure, Than, sounds good to me.
				{ Cue = "/VO/ZagreusField_3573", RequiredPlayedThisRoom = { "/VO/ThanatosField_0229" }, },
				-- Oh, absolutely terrified.
				{ Cue = "/VO/ZagreusField_3574", RequiredPlayedThisRoom = { "/VO/ThanatosField_0230" }, },
				-- Hope you don't mean me.
				{ Cue = "/VO/ZagreusField_3575", RequiredPlayedThisRoom = { "/VO/ThanatosField_0231" }, },
				-- Well, then, have at it!
				{ Cue = "/VO/ZagreusField_3576", RequiredPlayedThisRoom = { "/VO/ThanatosField_0232" }, },
				-- I'll be as reckless as I want!
				{ Cue = "/VO/ZagreusField_3577", RequiredPlayedThisRoom = { "/VO/ThanatosField_0233" }, },
				-- They really don't.
				{ Cue = "/VO/ZagreusField_3578", RequiredPlayedThisRoom = { "/VO/ThanatosField_0234" }, },
			},
		},
		LastStandReactionVoiceLines = {
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.7,
			CooldownTime = 12,
			Queue = "Always",

			-- No you don't...!
			{ Cue = "/VO/Thanatos_0089" },
			-- No you don't.
			{ Cue = "/VO/Thanatos_0090" },
			-- I got you...!
			{ Cue = "/VO/Thanatos_0091" },
			-- I got you.
			{ Cue = "/VO/Thanatos_0092" },
			-- Not yet...!
			{ Cue = "/VO/Thanatos_0093" },
			-- Not. Yet...!
			{ Cue = "/VO/Thanatos_0094" },
			-- I don't think so.
			{ Cue = "/VO/Thanatos_0095" },
			-- It's not your time.
			{ Cue = "/VO/Thanatos_0096" },
			-- Not so fast.
			{ Cue = "/VO/Thanatos_0097" },
			-- Not a chance.
			{ Cue = "/VO/Thanatos_0098" },
			-- No way.
			{ Cue = "/VO/Thanatos_0099" },
			-- Not if I can help it.
			{ Cue = "/VO/Thanatos_0100" },
			-- Live. Go.
			{ Cue = "/VO/Thanatos_0101" },
			-- Be more careful.
			{ Cue = "/VO/Thanatos_0102" },
			-- Wake up.
			{ Cue = "/VO/Thanatos_0103" },
			-- Watch it, damn you.
			{ Cue = "/VO/Thanatos_0104" },
			-- On your feet.
			{ Cue = "/VO/Thanatos_0105" },
			-- Focus, Zag.
			-- { Cue = "/VO/Thanatos_0106" },
			-- Keep fighting.
			{ Cue = "/VO/Thanatos_0107" },
			-- Keep going.
			{ Cue = "/VO/Thanatos_0108" },
			-- Get back in there.
			{ Cue = "/VO/Thanatos_0109" },
			-- You're not dying yet.
			{ Cue = "/VO/Thanatos_0110" },
			-- You're still alive, go!
			{ Cue = "/VO/Thanatos_0111" },
			-- It's not your time.
			{ Cue = "/VO/Thanatos_0112" },
			-- You're not finished.
			{ Cue = "/VO/Thanatos_0113" },
			-- You're still in this.
			{ Cue = "/VO/Thanatos_0114" },
			-- Snap out of it...!
			{ Cue = "/VO/Thanatos_0115" },
		},

		AssistReactionVoiceLines = {
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.8,
				SuccessiveChanceToPlay = 0.8,
				Queue = "Interrupt",
				RequiredTrait = "FuryAssistTrait",

				-- Megaera, here?!
				{ Cue = "/VO/ThanatosField_0085" },
				-- What is this, Megaera?
				{ Cue = "/VO/ThanatosField_0086" },
				-- We have this, Megaera.
				{ Cue = "/VO/ThanatosField_0087" },
				-- Unnecessary, Megaera!
				{ Cue = "/VO/ThanatosField_0088" },
				-- Megaera, again?
				{ Cue = "/VO/ThanatosField_0089" },
				-- Megaera!
				{ Cue = "/VO/ThanatosField_0090" },
				-- Megaera?!
				{ Cue = "/VO/ThanatosField_0091" },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.8,
				SuccessiveChanceToPlay = 0.8,
				Queue = "Interrupt",
				RequiredTrait = "SkellyAssistTrait",

				-- Do I know him?
				{ Cue = "/VO/ThanatosField_0092" },
				-- What is he doing here?
				{ Cue = "/VO/ThanatosField_0093" },
				-- Who is that?
				{ Cue = "/VO/ThanatosField_0094" },
				-- Is he supposed to help?
				{ Cue = "/VO/ThanatosField_0095" },
				-- One of your friends, there, Zag?
				-- { Cue = "/VO/ThanatosField_0096" },
				-- That skeleton.
				{ Cue = "/VO/ThanatosField_0097" },
				-- The skeleton, again.
				{ Cue = "/VO/ThanatosField_0098", RequiredPlayed = { "/VO/ThanatosField_0097" }, },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.8,
				SuccessiveChanceToPlay = 0.8,
				Queue = "Interrupt",
				RequiredTrait = "SisyphusAssistTrait",

				-- Sisyphus!!
				{ Cue = "/VO/ThanatosField_0099" },
				-- Sisyphus?
				{ Cue = "/VO/ThanatosField_0100" },
				-- Sisyphus, you dare?
				{ Cue = "/VO/ThanatosField_0101" },
				-- That Sisyphus!
				{ Cue = "/VO/ThanatosField_0102" },
				-- Him again?
				{ Cue = "/VO/ThanatosField_0103" },
				-- Why ask for help from him?
				{ Cue = "/VO/ThanatosField_0104" },
				-- Unnecessary, Zag!
				-- { Cue = "/VO/ThanatosField_0105" },
				-- Some help he was!
				{ Cue = "/VO/ThanatosField_0106" },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.8,
				SuccessiveChanceToPlay = 0.8,
				Queue = "Interrupt",
				RequiredTrait = "DusaAssistTrait",

				-- Dusa?!
				{ Cue = "/VO/ThanatosField_0189" },
				-- Dusa!
				{ Cue = "/VO/ThanatosField_0190" },
				-- Dusa, here?
				{ Cue = "/VO/ThanatosField_0191" },
				-- Dusa, how?
				{ Cue = "/VO/ThanatosField_0192" },
				-- What are you doing, Dusa?!
				{ Cue = "/VO/ThanatosField_0193" },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.8,
				SuccessiveChanceToPlay = 0.8,
				Queue = "Interrupt",
				RequiredTrait = "AchillesPatroclusAssistTrait",

				-- Achilles?!
				{ Cue = "/VO/ThanatosField_0194" },
				-- Achilles!
				{ Cue = "/VO/ThanatosField_0195" },
				-- Achilles, here?
				{ Cue = "/VO/ThanatosField_0196" },
				-- Achilles, how?
				{ Cue = "/VO/ThanatosField_0197" },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.8,
				Queue = "Interrupt",
				RequiredOneOfTraits = { "FuryAssistTrait", "SkellyAssistTrait", "SisyphusAssistTrait", "DusaAssistTrait" },

				-- What is this, Zagreus?
				-- { Cue = "/VO/ThanatosField_0107" },
				-- You again?
				{ Cue = "/VO/ThanatosField_0108" },
				-- You again!
				{ Cue = "/VO/ThanatosField_0109" },
				-- I told you to get out!
				{ Cue = "/VO/ThanatosField_0110" },
				-- Stay out of this!
				{ Cue = "/VO/ThanatosField_0111" },
				-- Begone!
				{ Cue = "/VO/ThanatosField_0112" },
				-- Don't interfere!
				{ Cue = "/VO/ThanatosField_0113" },
				-- You're not authorized!
				{ Cue = "/VO/ThanatosField_0114" },
				-- Get out while you still can.
				{ Cue = "/VO/ThanatosField_0115" },
			},
		},
		KillStolenVoiceLines = {
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.4,
			CooldownTime = 16,
			SuccessiveChanceToPlay = 0.5,

			-- Really?
			{ Cue = "/VO/Thanatos_0076" },
			-- Back off.
			{ Cue = "/VO/Thanatos_0078" },
			-- Oh come on.
			{ Cue = "/VO/Thanatos_0075" },
			-- Cut it out.
			{ Cue = "/VO/Thanatos_0079" },
			-- Don't do that again.
			{ Cue = "/VO/Thanatos_0080" },
			-- Stop that.
			{ Cue = "/VO/Thanatos_0082" },
			-- That one was mine.
			{ Cue = "/VO/Thanatos_0381" },
			-- That was my kill.
			{ Cue = "/VO/Thanatos_0382" },
			-- I see how it is.
			{ Cue = "/VO/Thanatos_0383" },
			-- You took my kill.
			{ Cue = "/VO/Thanatos_0384" },
			-- Find your own targets.
			{ Cue = "/VO/Thanatos_0385" },
			-- Oh really.
			{ Cue = "/VO/Thanatos_0386" },
			-- Think you can beat me?
			{ Cue = "/VO/Thanatos_0387" },
			-- Dirty move.
			{ Cue = "/VO/Thanatos_0388" },
			-- Oh hoh.
			-- { Cue = "/VO/Thanatos_0389" },
			-- So it's like that.
			{ Cue = "/VO/Thanatos_0390" },
			-- Get your own kills.
			{ Cue = "/VO/Thanatos_0391" },
			-- I had that one.
			{ Cue = "/VO/Thanatos_0392" },
		},
		EncounterEndVoiceLines = {
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.25,

				-- Life is short.
				{ Cue = "/VO/Thanatos_0048" },
				-- That's enough.
				{ Cue = "/VO/Thanatos_0044" },
				-- Enough.
				{ Cue = "/VO/Thanatos_0045" },
				-- Hmph.
				{ Cue = "/VO/Thanatos_0161" },
				-- All right.
				{ Cue = "/VO/Thanatos_0163" },
				-- That's settled.
				{ Cue = "/VO/Thanatos_0323" },
				-- That's settled, then.
				{ Cue = "/VO/Thanatos_0324" },
				-- That was the last of them.
				{ Cue = "/VO/Thanatos_0325" },
				-- That's quite enough of that.
				{ Cue = "/VO/Thanatos_0326" },
				-- Drove them back.
				{ Cue = "/VO/Thanatos_0327" },
				-- That's all of them.
				{ Cue = "/VO/Thanatos_0328" },
				-- I'll write this one off.
				{ Cue = "/VO/Thanatos_0329" },
				-- This won't go on the record.
				{ Cue = "/VO/Thanatos_0330" },
				-- That settles that.
				{ Cue = "/VO/Thanatos_0331" },
				-- Hm. You still alive?
				{ Cue = "/VO/Thanatos_0332" },
				-- ...You're welcome.
				{ Cue = "/VO/Thanatos_0333",      PreLineWait = 1 },
				-- Situation is under control.
				{ Cue = "/VO/ThanatosField_0170" },
				-- You're clear of them for now.
				{ Cue = "/VO/ThanatosField_0171" },
				-- We'll leave no trace of this.
				{ Cue = "/VO/ThanatosField_0172" },
				-- What chance did they have?
				{ Cue = "/VO/ThanatosField_0173" },
				-- Chamber secured.
				{ Cue = "/VO/ThanatosField_0174" },
				-- And that's the end of that.
				{ Cue = "/VO/ThanatosField_0175" },
				-- We make a decent team.
				{ Cue = "/VO/ThanatosField_0176", RequiredTextLines = { "ThanatosGift10" } },
				-- Good working with you, there.
				{ Cue = "/VO/ThanatosField_0177", RequiredTextLines = { "ThanatosGift10" } },
				-- Short work, there, wasn't it.
				{ Cue = "/VO/ThanatosField_0178", RequiredAnyTextLines = { "ThanatosGift09" } },
				-- Been a pleasure.
				{ Cue = "/VO/ThanatosField_0179", RequiredTextLines = { "ThanatosGift10" } },
			},
		},
		EncounterTiedVoiceLines = {
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.5,

			-- Let's call this one a draw.
			{ Cue = "/VO/Thanatos_0346", RequiredPlayed = { "/VO/Thanatos_0347" } },
			-- Huh, it's a tie.
			{ Cue = "/VO/Thanatos_0347" },
			-- You got as many as I did.
			{ Cue = "/VO/Thanatos_0348", RequiredPlayed = { "/VO/Thanatos_0347" } },
			-- It's a draw.
			{ Cue = "/VO/Thanatos_0349", RequiredPlayed = { "/VO/Thanatos_0347" } },
			-- Looks like we tied.
			{ Cue = "/VO/Thanatos_0350", RequiredPlayed = { "/VO/Thanatos_0347" } },
			-- Another tie, huh.
			{ Cue = "/VO/Thanatos_0351", RequiredPlayed = { "/VO/Thanatos_0347" } },
		},
		EncounterLostVoiceLines = {
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				RequiredMaxThanatosKillsThisRun = 0,
				PreLineWait = 0.5,

				-- All right, all right, you got me.
				{ Cue = "/VO/ThanatosField_0202" },
				-- You made short work there.
				{ Cue = "/VO/ThanatosField_0203" },
				-- Here, since you did all the work.
				{ Cue = "/VO/ThanatosField_0204" },
				-- Guess you had this well in hand.
				{ Cue = "/VO/ThanatosField_0205" },
				-- How did you get so fast?
				{ Cue = "/VO/ThanatosField_0206" },
				-- Wow, Zag.
				-- { Cue = "/VO/ThanatosField_0207" },
				-- I can't believe this.
				{ Cue = "/VO/ThanatosField_0208" },
				-- That was embarrassing for me I have to say.
				{ Cue = "/VO/ThanatosField_0209" },
			},
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 0.5,

				-- Not bad, Zag. Here.
				-- { Cue = "/VO/Thanatos_0334",      RequiredPlayed = { "/VO/Thanatos_0337" }, RequiredTextLines = { "ThanatosGift02" } },
				-- Save some for me next time.
				{ Cue = "/VO/Thanatos_0335",      RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- You took more down than I did.
				{ Cue = "/VO/Thanatos_0336",      RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- Got more of them than I did, huh.
				{ Cue = "/VO/Thanatos_0337" },
				-- You held your own out there.
				{ Cue = "/VO/Thanatos_0338",      RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- You held your own I guess.
				{ Cue = "/VO/Thanatos_0339",      RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- You're not too bad at this.
				{ Cue = "/VO/Thanatos_0340",      RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- You're reckless, but you're quick.
				{ Cue = "/VO/Thanatos_0341",      RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- You're fast, I'll give you that.
				{ Cue = "/VO/Thanatos_0342",      RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- Here's something for the show.
				{ Cue = "/VO/Thanatos_0343",      RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- You've gotten stronger, Zag.
				-- { Cue = "/VO/Thanatos_0344",      RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- Good work, my friend.
				{ Cue = "/VO/Thanatos_0345",      RequiredPlayed = { "/VO/Thanatos_0337" }, RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" }, },
				-- You earned this fair and square.
				{ Cue = "/VO/ThanatosField_0185", RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- You beat me once again.
				{ Cue = "/VO/ThanatosField_0186", RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- You got a lot of them.
				{ Cue = "/VO/ThanatosField_0187", RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- I'll take more down next time.
				{ Cue = "/VO/ThanatosField_0188", RequiredPlayed = { "/VO/Thanatos_0337" } },
				-- Hang on to this for me.
				{ Cue = "/VO/Thanatos_0498",      RequiredPlayed = { "/VO/Thanatos_0337" }, RequiredTextLines = { "ThanatosGift02" } },
			},
		},

		BossPresentationIntroTextLineSets = {
			ThanatosFirstAppearance = {
				PlayOnce = true,
				{
					Cue = "/VO/ThanatosField_0007",
					Text = "...Thought you could just get away from me, did you?"
				},
				{
					Cue = "/VO/ZagreusField_1515",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Thanatos. I figured it was only a matter of time before Father sent you after me to do his dirty work."
				},
				{
					Cue = "/VO/ThanatosField_0225",
					Text =
					"Zagreus. Is that really why you think I'm here? Let's see how many of these exalted champions you can send back to their dooms, unless you'd rather I would send you back to yours."
				},
			},

			ThanatosFieldAboutHermes01 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosFirstAppearance", "ThanatosGift03", "HermesGift01" },
				RequiredLootThisRun = "HermesUpgrade",
				{
					Cue = "/VO/ThanatosField_0149",
					Text = "Barely caught up with you, here, Zag. You must have had a little help from Hermes, I suppose."
				},
			},

			ThanatosFieldAboutKeepsake01 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosFirstAppearance" },
				RequiredTrait = "PerfectClearDamageBonusTrait",
				{
					Cue = "/VO/ThanatosField_0226",
					Text =
					"You have the butterfly I gave to you. Stay back, then, and it'll make you stronger once I'm finished here."
				},
			},

			ThanatosFieldAboutLegendary02 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosFirstAppearance", "ThanatosFieldAboutLegendary01" },
				RequiredTrait = "ThanatosAssistTrait",
				{
					Cue = "/VO/ThanatosField_0222",
					Text = "Got little Mort with you, there, huh. Well, there's no need to summon me this time."
				},
			},

			ThanatosFieldRunCleared01 = {
				PlayOnce = true,
				RequiresLastRunCleared = true,
				RequiredTextLines = { "ThanatosFirstAppearance" },
				RequiredFalseTextLinesLastRun = { "ThanatosRunCleared01" },
				{
					Cue = "/VO/ThanatosField_0235",
					Text = "You're back. I thought you made it out. No matter."
				},
			},

			ThanatosFieldPostEnding01 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosFirstAppearance", "Ending01", "ThanatosGift03" },
				MaxRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 20 },
				{
					Cue = "/VO/ThanatosField_0246",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text = "Good to be working with you in a more official capacity, Zag. Shall we get started?"
				},
			},

		},

		BossPresentationTextLineSets = {
			ThanatosMiscIntro01 = {
				PlayOnce = true,
				{
					Cue = "/VO/Thanatos_0352",
					Text =
					"Thought I might find you all the way out here. Although, quite frankly, I'm surprised you're still alive."
				},
				{
					Cue = "/VO/ZagreusField_1523",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "I can hold my own in case you haven't noticed, Than."
				},
				{
					Cue = "/VO/Thanatos_0353",
					Text = "I haven't, Zag! Now, stand back, and let me show you how it's done."
				},
			},
			ThanatosMiscIntro02 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosMiscIntro01" },
				{
					Cue = "/VO/Thanatos_0354",
					Text =
					"Still at it, I see. You're stubborn. And you are going to get me in a heap of trouble before all is said and done."
				},
			},
		},

		BossPresentationRepeatableTextLineSets = {
			ThanatosMiscStartRepeatable01 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift05" },
				{
					Cue = "/VO/ThanatosField_0127",
					Text = "How about another of our little contests, Zagreus?"
				},
			},
			ThanatosMiscStartRepeatable02 = {
				RequiredTextLines = { "ThanatosGift10" },
				{
					Cue = "/VO/ThanatosField_0128",
					Text = "We'll have to catch up at some other time. Though good to see you anyway."
				},
			},
			ThanatosMiscStartRepeatable03 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift05" },
				{
					Cue = "/VO/ThanatosField_0129",
					Text = "I have a feeling this is not going to take much time at all."
				},
			},
			ThanatosMiscStartRepeatable04 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift08" },
				{
					Cue = "/VO/ThanatosField_0130",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text = "I only have a little time until my next assignment, but this shouldn't take too long."
				},
			},
			ThanatosMiscStartRepeatable05 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift10" },
				{
					Cue = "/VO/ThanatosField_0131",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text = "Thought I might stop by and check up on this corner of the Underworld, Zag."
				},
			},
			ThanatosMiscStartRepeatable06 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift10" },
				RequiredBiome = "Elysium",
				{
					Cue = "/VO/ThanatosField_0132",
					Text = "You've come this far, now let's make sure you go the distance, Zag."
				},
			},
			ThanatosMiscStartRepeatable07 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift08" },
				{
					Cue = "/VO/ThanatosField_0133",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text = "I heard there was a matter that required my attention here."
				},
			},
			ThanatosMiscStartRepeatable08 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift09" },
				{
					Cue = "/VO/ThanatosField_0134",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text = "Had a feeling I would find you all alone out here."
				},
			},
			ThanatosMiscStartRepeatable09 = {
				RequiredTextLines = { "ThanatosMiscIntro02" },
				RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
				{
					Cue = "/VO/ThanatosField_0135",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text = "Want to stand back and watch me work, here, Zag?"
				},
			},
			ThanatosMiscStartRepeatable10 = {
				RequiredTextLines = { "ThanatosMiscIntro02" },
				RequiredAnyTextLines = { "ThanatosGift04", "ThanatosGift04_B" },
				{
					Cue = "/VO/ThanatosField_0136",
					Text = "This one is off the record, Zagreus. Come on!"
				},
			},
			ThanatosMiscStartRepeatable11 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift05" },
				RequiredFalsePlayedThisRoom = { "/VO/ThanatosField_0120" },
				{
					Cue = "/VO/ThanatosField_0137",
					Text = "Looks like we've got an urgent work-related matter to attend to."
				},
			},
			ThanatosMiscStartRepeatable12 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift09" },
				{
					Cue = "/VO/ThanatosField_0138",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text = "Your father's forces making trouble for you, Zag?"
				},
			},

			ThanatosMiscStartRepeatable13 = {
				-- Priority = true,
				RequiredTextLines = { "ThanatosMiscStartRepeatable02", "ThanatosGift01" },
				RequiredFalseTextLines = { "Ending01" },
				{
					Cue = "/VO/Thanatos_0355",
					Text = "Not a word of this to anyone back home, you hear me, Zagreus?"
				},
			},
			ThanatosMiscStartRepeatable14 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift06" },
				{
					Cue = "/VO/Thanatos_0356",
					Text = "I heard you got yourself into another mess that needed cleaning up."
				},
			},
			ThanatosMiscStartRepeatable15 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift06" },
				RequiredFalseBiome = "Elysium",
				{
					Cue = "/VO/Thanatos_0357",
					Text = "We'll catch up later, now let's deal with these wretches and be done."
				},
			},
			ThanatosMiscStartRepeatable16 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift06" },
				{
					Cue = "/VO/Thanatos_0358",
					Text = "Hope you don't mind if I cut in, here, Zagreus."
				},
			},
			ThanatosMiscStartRepeatable17 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift10" },
				{
					Cue = "/VO/Thanatos_0359",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text = "What say we go take care of business here just like we used to, Zag?"
				},
			},
			ThanatosMiscStartRepeatable18 = {
				RequiredTextLines = { "ThanatosMiscIntro02" },
				{
					Cue = "/VO/Thanatos_0360",
					Text = "I can't stay long, so how about we get this business over with."
				},
			},
			ThanatosMiscStartRepeatable19 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift03" },
				{
					Cue = "/VO/Thanatos_0361",
					Text = "Figured you'd be up to have another of our little contests. Now let's go."
				},
			},
			ThanatosMiscStartRepeatable20 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift03" },
				{
					Cue = "/VO/Thanatos_0362",
					Text = "What do you say we deal some death together, Zagreus?"
				},
			},
			ThanatosMiscStartRepeatable21 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift03" },
				{
					Cue = "/VO/Thanatos_0363",
					Text = "Don't have much time, but let me see if I can pitch in."
				},
			},
			ThanatosMiscStartRepeatable22 = {
				-- Priority = true,
				RequiredTextLines = { "ThanatosMiscIntro02" },
				RequiredFalseTextLines = { "ThanatosWithHades02", "Ending01" },
				{
					Cue = "/VO/Thanatos_0364",
					Text = "Remember, not a word of this, to anyone. Let's go."
				},
			},
			ThanatosMiscStartRepeatable23 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift09" },
				{
					Cue = "/VO/Thanatos_0231",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text = "You look like you could use a hand."
				},
			},
			ThanatosMiscStartRepeatable24 = {
				RequiredTextLines = { "ThanatosMiscIntro02" },
				{
					Cue = "/VO/Thanatos_0236",
					Text = "Let's see who's better at this, Zagreus."
				},
			},
			ThanatosMiscStartRepeatable25 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift05" },
				{
					Cue = "/VO/Thanatos_0379",
					Text = "I got the feeling you could use some backup here."
				},
			},
			ThanatosMiscStartRepeatable26 = {
				RequiredTextLines = { "ThanatosMiscIntro02" },
				{
					Cue = "/VO/Thanatos_0665",
					Text = "Let's get this done."
				},
			},
			-- moved from the previous table
			ThanatosMiscStart14 = {
				RequiredTextLines = { "ThanatosMiscIntro02", "ThanatosGift06" },
				{
					Cue = "/VO/Thanatos_0380",
					Text = "Good, I'm not too late. Got here as quickly as I could."
				},
			},
			ThanatosMiscStart15 = {
				RequiredTextLines = { "ThanatosMiscIntro02" },
				{
					Cue = "/VO/Thanatos_0377",
					Text = "I got the message that you need assistance, Zagreus?"
				},
			},

		},

		InteractTextLineSets = {
			ThanatosFieldFirstMeeting = {
				PlayOnce = true,
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 0.9,
					UsePlayerSource = true,
					-- <Sigh>
					{ Cue = "/VO/ZagreusField_3444" },
				},
				{
					Cue = "/VO/Thanatos_0195",
					AngleTowardHero = true,
					Text =
					"You left, without so much as telling me good-bye. I suppose you knew I'd catch up with you sooner or later, is that it? No escaping death, and all?"
				},
				{
					Cue = "/VO/ZagreusField_0514",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "I left when it was necessary, Than. I thought of you and hoped you'd understand. I have to do this."
				},
				{
					Cue = "/VO/Thanatos_0196",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { WaitTime = 0.4, SkipExitReaction = true },
					Text =
					"That's more motivation than I've ever heard from you. Well, if you won't say it, I'll say it. Good-bye, Zagreus."
				},
			},
			ThanatosFieldMiscMeeting01 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosFieldFirstMeeting", },
				{
					Cue = "/VO/Thanatos_0197",
					Text =
					"I've got to hand it to you, Zag. You're easy to track down. The shades of Tartarus are beginning to fear you even more than your Lord Father."
				},
				{
					Cue = "/VO/ZagreusField_0515",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Oh they won't fear me once they get to know me."
				},
				{
					Cue = "/VO/Thanatos_0198",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { WaitTime = 0.35, SkipExitReaction = true },
					Text =
					"I'm not so sure about that. Even I'm beginning to fear you, I think. Seems I don't know you as well as I thought."
				},
			},
			ThanatosFieldMiscMeeting02 = {
				PlayOnce = true,
				InitialGiftableOffSource = true,
				RequiredTextLines = { "ThanatosFieldFirstMeeting", },
				EndVoiceLines = {
					PreLineWait = 0.4,
					UsePlayerSource = true,
					-- I don't know what I'm supposed to say when he gets like this...
					{ Cue = "/VO/ZagreusField_0516" },
				},
				{
					Cue = "/VO/Thanatos_0199",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { WaitTime = 0.35, SkipExitReaction = true },
					Text =
					"What's with the look? You had your hands full, now you don't thanks to me... {#DialogueItalicFormat}Tsch{#PreviousFormat}, seems I'm left to thanking myself, since you're too proud to do it."
				},
			},
			ThanatosFieldMiscMeeting03 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosFieldFirstMeeting", },
				RequiredFalseBiome = "Elysium",
				{
					Cue = "/VO/Thanatos_0200",
					Text = "You seemed a little winded, there, no? Not even close to the surface, yet, either."
				},
				{
					Cue = "/VO/ZagreusField_0517",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Thanks for the vote of confidence there, Than."
				},
				{
					Cue = "/VO/Thanatos_0201",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { WaitTime = 0.35 },
					Text = "You're very welcome. Now, I'd better get back, before Lord Hades catches on to this."
				},
			},
			ThanatosFieldMiscMeeting05 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosFieldFirstMeeting" },
				{
					Cue = "/VO/ZagreusField_0520",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenial_Full",
					PreLineAnimTarget = "Hero",
					Text = "I told you I don't need your help here, Thanatos."
				},
				{
					Cue = "/VO/Thanatos_0204",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { WaitTime = 0.35 },
					Text = "It wasn't being offered. Just happened to be in the area is all. Carry on, Zagreus."
				},
			},
			ThanatosFieldBackstory01 = {
				SuperPriority = true,
				PlayOnce = true,
				RequiredTextLines = { "ThanatosGift01" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				RequiredFalseTextLines = { "Ending01", "ThanatosGift06", "ThanatosAboutPersephoneMeeting02", "ThanatosFieldAboutPersephoneFirstMeeting01" },
				{
					Cue = "/VO/Thanatos_0205",
					Text = "Still running from yourself, I see. How's that been working out for you thus far?"
				},
				{
					Cue = "/VO/ZagreusField_0519",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "I'm searching for my mother. You still live at home with yours. You don't know what it's like."
				},
				{
					Cue = "/VO/Thanatos_0206",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { WaitTime = 0.35 },
					PreLineAnim = "ThanatosTalkDismissal_Start",
					PostLineAnim = "ThanatosTalkDismissal_Return",
					Text =
					"Mother Nyx was like a mother to you, too. And this is how you repay her. You should be ashamed of yourself, and learn your place."
				},
			},
			ThanatosFieldBackstory02 = {
				PlayOnce = true,
				RequiredTextLines = { "ThanatosFieldBackstory01", "ThanatosGift02" },
				RequiredFalseTextLines = { "Ending01", "ThanatosAboutPersephone01", "ThanatosFieldAboutPersephoneFirstMeeting01" },
				{
					Cue = "/VO/Thanatos_0202",
					Text =
					"Listen to me. I don't know how else to put this, but, I want you to come home. Voluntarily. It's not just you swept up in all this nonsense now. And, I know you didn't ask for me to get involved, but, what did you expect?"
				},
				{
					Cue = "/VO/ZagreusField_0518",
					PreLineWait = 0.35,
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "...Than. Home is never going to be the same for me. There's no use trying to pretend. I have to go."
				},
				{
					Cue = "/VO/Thanatos_0203",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { WaitTime = 0.35 },
					PreLineAnim = "ThanatosTalkDismissal_Start",
					PostLineAnim = "ThanatosTalkDismissal_Return",
					Text =
					"You don't {#DialogueItalicFormat}have {#PreviousFormat}to do anything of the sort. You have no idea how good you've had it here. Maybe someday you'll come to understand."
				},
			},

			ThanatosFieldBuildingTrust01 = {
				Priority = true,
				PlayOnce = true,
				InitialGiftableOffSource = true,
				ObjectivesCompleted = { Name = "PlayerKills", Min = 8, },
				ObjectiveCompletedLastOffer = "PlayerKills",
				RequiredTextLines = { "ThanatosFieldAboutRelationship01" },
				EndVoiceLines = {
					PreLineWait = 0.65,
					UsePlayerSource = true,
					-- It is all right. Thanks, Than.
					{ Cue = "/VO/ZagreusField_2864" },
				},
				{
					Cue = "/VO/ThanatosField_0002",
					AngleTowardHero = true,
					Text =
					"Outdid me once again, there, huh. {#DialogueItalicFormat}Tsch{#PreviousFormat}. I have to admit, you're not as bad at all of this as I expected. First I found you, I was certain that you had no chance at all."
				},
				{
					Cue = "/VO/ZagreusField_2862",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I seem to have this whole easy-to-underestimate thing about me, based on a decent sum of my relationships. In any case, I always welcome your appearances out here. I know it's not been easy for you, Than."
				},
				{
					Cue = "/VO/ThanatosField_0003",
					Text =
					"That's fair as an assessment, I would say. But then again, it's never been an easy time for me. I know I have to do my job. But I don't have to keep on helping you, like this."
				},
				{
					Cue = "/VO/ZagreusField_2863",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					PreLineWait = 0.35,
					Text =
					"...What, you're telling me this is it? You're just going to leave me to my own devices, then, I've proved myself to you, something like that?"
				},
				{
					Cue = "/VO/ThanatosField_0004",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { WaitTime = 2.4, SkipExitReaction = true },
					PreLineAnim = "ThanatosTalkDismissal",
					Emote = "PortraitEmoteFiredUp",
					Text =
					"No, you deadbeat, I am telling you the opposite! Why do you think I keep on showing up? You may not really need me, Zagreus, but I will take these opportunities to help. I take it that's all right."
				},
			},

			ThanatosFieldAboutLegendary01 = {
				PlayOnce = true,
				RequiredTrait = "ThanatosAssistTrait",
				EndVoiceLines = {
					PreLineWait = 0.5,
					UsePlayerSource = true,
					-- Accurate.
					{ Cue = "/VO/ZagreusField_2866" },
				},
				{
					Cue = "/VO/ThanatosField_0005",
					Portrait = "Portrait_Thanatos_Pleased_01",
					Text =
					"Good to see you taking little Mort there on one of your strolls. Means I can better keep an eye on you out there."
				},
				{
					Cue = "/VO/ZagreusField_2865",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"He's been great to have around, for sure. Still can't believe you found him after all this time! You used to always carry him around, I was so sad for you when he got lost."
				},
				{
					Cue = "/VO/ThanatosField_0006",
					Portrait = "Portrait_Thanatos_Pleased_01",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2, SkipExitReaction = true },
					Text =
					"And I cannot believe you still remember that. Regardless, he will not be getting lost again under your supervision, accurate?"
				},
			},

			ThanatosFieldAboutRelationship01 = {
				SuperPriority = true,
				PlayOnce = true,
				RequiredTextLines = { "ThanatosAboutRelationship01" },
				InitialGiftableOffSource = true,
				EndVoiceLines = {
					PreLineWait = 0.4,
					UsePlayerSource = true,
					-- You too.
					{ Cue = "/VO/ZagreusField_3517" },
				},
				{
					Cue = "/VO/ZagreusField_3515",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"About when we last spoke. I care about you, Thanatos. A lot. Though, you asked what you are to me... how am I supposed to even answer that?"
				},
				{
					Cue = "/VO/ThanatosField_0223",
					Text =
					"{#DialogueItalicFormat}Ugh{#PreviousFormat}, I don't know. Sometimes I miss not feeling anything. Can't always trust what feelings say. I get to thinking, are we only friends, or... look, this is embarrassing."
				},
				{
					Cue = "/VO/ZagreusField_3516",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"To think discussing feelings would be even harder than annihilating Father's forces. But... I've been asking myself the same thing, Than. If it's any reassurance."
				},
				{
					Cue = "/VO/ThanatosField_0224",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.8, SkipExitReaction = true },
					Text = "Well, if you come up with any answers, I guess let me know. Good running into you."
				},
			},

			ThanatosFieldAboutSingersReunionQuestComplete01 = {
				SuperPriority = true,
				PlayOnce = true,
				RequiredTextLines = { "ThanatosAboutSingersReunionQuestComplete01" },
				EndVoiceLines = {
					PreLineWait = 0.4,
					UsePlayerSource = true,
					-- I'm glad you did, though, Than.
					{ Cue = "/VO/ZagreusField_3512" },
				},
				{
					Cue = "/VO/ThanatosField_0219",
					Text =
					"Hey. I didn't mean to lay the guilt on you for what you did for Orpheus, Zag. I just worry when we get involved... we can make matters worse."
				},
				{
					Cue = "/VO/ZagreusField_3511",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"You haven't ever made anything worse, Than. But as for me, I realized what you meant. I was so eager to do something for Orpheus when I first met Eurydice, I... never asked them if it was OK."
				},
				{
					Cue = "/VO/ThanatosField_0220",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 2.2, SkipExitReaction = true },
					Text =
					"At least things turned out well for them. But that was fortunate. Family troubles, personal relations, and the like... it's sensitive business. Though, who am I to talk. You didn't ask me to show up, like this."
				},
			},

			ThanatosFieldBecameCloseBackOffAftermath01 = {
				PlayOnce = true,
				RequiredTextLines = { "BecameCloseWithThanatos01Than_BackOff" },
				EndVoiceLines = {
					PreLineWait = 0.4,
					UsePlayerSource = true,
					TriggerCooldowns = { "ThanatosEncounterStartVoiceLines" },
					-- All right.
					{ Cue = "/VO/ZagreusField_3514" },
				},
				{
					Cue = "/VO/ZagreusField_3513",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Hey, Than, are you OK? I mean, with everything, lately?"
				},
				{
					Cue = "/VO/ThanatosField_0221",
					Portrait = "Portrait_Thanatos_Pleased_01",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.8, SkipExitReaction = true },
					Text =
					"I am. Though, thanks for asking, Zag. The risk of being close with anyone is sometimes things get complicated, fast. Admittedly it's not a risk I often take, but... in your case, it's been worth it, all in all. We're good, all right?"
				},
			},

			ThanatosFieldAboutPersephoneFirstMeeting01 = {
				SuperPriority = true,
				PlayOnce = true,
				RequiredTextLines = { "ThanatosGift03", "ThanatosFieldBackstory02", "PersephoneMeeting03" },
				RequiredFalseTextLines = { "Ending01", "ThanatosAboutPersephoneMeeting02" },
				RequiresLastRunCleared = true,
				EndVoiceLines = {
					PreLineWait = 0.4,
					UsePlayerSource = true,
					TriggerCooldowns = { "ThanatosEncounterStartVoiceLines" },
					-- I know what you mean.
					{ Cue = "/VO/ZagreusField_4660" },
				},
				{
					Cue = "/VO/Thanatos_0548",
					Emote = "PortraitEmoteSurprise",
					Text = "What are you doing back here, Zag? You made it out."
				},
				{
					Cue = "/VO/ZagreusField_4658",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I did... but I had to come back. And, not exactly voluntarily. I'll be visiting up there from time to time, though... it looks like I'll be staying here."
				},
				{
					Cue = "/VO/Thanatos_0549",
					Text = "Visiting from time to time...? I don't understand."
				},
				{
					Cue = "/VO/ZagreusField_4659",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"It's my mother. She's alive and well! It's just that I can't stay with her up there for very long! So we'll have to catch up... one visit at a time."
				},
				{
					Cue = "/VO/Thanatos_0550",
					PostLineThreadedFunctionName = "ThanatosExit",
					PostLineFunctionArgs = { AnimationState = "NPCThanatosExited", WaitTime = 1.8, SkipExitReaction = true },
					Text =
					"I see. Well then... that's good. That's good, because... it means that I won't have to track you down up top. Because, between us, I can only take so much of it up there."
				},
			},

		},

		DistanceTriggers = {
			{
				WithinDistance = 500,
				-- LockToCharacter = true,
				TriggerOnceThisRun = true,
				VoiceLines = {
					-- Back again, hm?
					-- { Cue = "/VO/Hades_0082", PreLineWait = 0.35, PlayOnceThisRun = true, },
				},
			},
		},

		OnHitVoiceLinesRequireAttackerName = "_PlayerUnit",
		OnHitVoiceLines = {
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.25,
			PlayFromTarget = true,
			CooldownTime = 180,
			ChanceToPlay = 0.05,
			RequiredFalseTextLines = { "ThanatosGift10" },

			-- Not me, idiot.
			{ Cue = "/VO/Thanatos_0309",      RequiredKillEnemiesFound = true,    RequiredFalseTextLines = { "ThanatosGift03" }, },
			-- Not helpful, Zagreus.
			-- { Cue = "/VO/Thanatos_0310",      RequiredKillEnemiesFound = true,    RequiredFalseTextLines = { "ThanatosGift03" }, },
			-- I'm on your side.
			{ Cue = "/VO/Thanatos_0311",      RequiredKillEnemiesFound = true,    RequiredFalseTextLines = { "ThanatosGift04", "ThanatosGift04_B" }, },
			-- You can't hurt me.
			{ Cue = "/VO/Thanatos_0312",      RequiredKillEnemiesFound = true },
			-- Seriously, Zag?
			-- { Cue = "/VO/Thanatos_0313",      RequiredKillEnemiesFound = true },
			-- Fight them not me.
			{ Cue = "/VO/Thanatos_0314",      RequiredKillEnemiesFound = true },
			-- You aren't helping, Zag.
			-- { Cue = "/VO/Thanatos_0315",      RequiredKillEnemiesFound = true },
			-- You going to help or what?
			{ Cue = "/VO/Thanatos_0316",      RequiredKillEnemiesFound = true,    RequiredFalseTextLines = { "ThanatosGift05" }, },
			-- Counterproductive, Zag.
			-- { Cue = "/VO/Thanatos_0317",      RequiredKillEnemiesFound = true },
			-- Why bother.
			{ Cue = "/VO/Thanatos_0318",      RequiredKillEnemiesFound = true },
			-- I'm not your foe here, Zag.
			-- { Cue = "/VO/Thanatos_0319",      RequiredKillEnemiesFound = true,    RequiredFalseTextLines = { "ThanatosGift03" }, },
			-- Don't test me, Zagreus.
			{ Cue = "/VO/Thanatos_0320",      RequiredKillEnemiesFound = true },
			-- Not going to fight you, Zag.
			-- { Cue = "/VO/Thanatos_0321",      RequiredKillEnemiesFound = true },
			-- Watch your fire.
			{ Cue = "/VO/Thanatos_0322",      RequiredKillEnemiesFound = true,    RequiredWeapon = "GunWeapon" },
			-- Idiot.
			{ Cue = "/VO/Thanatos_0073",      RequiredKillEnemiesNotFound = true, RequiredFalseTextLines = { "ThanatosGift06" }, },
			-- Come off it.
			{ Cue = "/VO/Thanatos_0074",      RequiredKillEnemiesNotFound = true },
			-- Oh come on.
			{ Cue = "/VO/Thanatos_0075",      RequiredKillEnemiesNotFound = true },
			-- Really?
			{ Cue = "/VO/Thanatos_0076",      RequiredKillEnemiesNotFound = true },
			-- Should've let you die.
			{ Cue = "/VO/Thanatos_0077",      RequiredKillEnemiesNotFound = true, RequiredFalseTextLines = { "ThanatosGift06" }, },
			-- Back off.
			{ Cue = "/VO/Thanatos_0078",      RequiredKillEnemiesNotFound = true },
			-- Cut it out.
			{ Cue = "/VO/Thanatos_0079",      RequiredKillEnemiesNotFound = true },
			-- Don't do that again.
			{ Cue = "/VO/Thanatos_0080",      RequiredKillEnemiesNotFound = true },
			-- Watch it.
			{ Cue = "/VO/Thanatos_0081",      RequiredKillEnemiesNotFound = true },
			-- Stop that.
			{ Cue = "/VO/Thanatos_0082",      RequiredKillEnemiesNotFound = true },
			-- Stop.
			{ Cue = "/VO/Thanatos_0083",      RequiredKillEnemiesNotFound = true },
			-- Why do I bother.
			{ Cue = "/VO/Thanatos_0086",      RequiredKillEnemiesNotFound = true },
			-- You finished?
			{ Cue = "/VO/Thanatos_0087",      RequiredKillEnemiesNotFound = true },
			-- Enough.
			{ Cue = "/VO/Thanatos_0088",      RequiredKillEnemiesNotFound = true },
			-- Watch it.
			{ Cue = "/VO/ThanatosField_0166", RequiredKillEnemiesNotFound = true, RequiredFalseTextLines = { "ThanatosGift06" }, },
			-- You've no control at all.
			{ Cue = "/VO/ThanatosField_0167", RequiredKillEnemiesNotFound = true, RequiredFalseTextLines = { "ThanatosGift06" }, },
			-- Focus on them, damn it.
			{ Cue = "/VO/ThanatosField_0168", RequiredKillEnemiesNotFound = true, RequiredFalseTextLines = { "ThanatosGift06" }, },
			-- Give me some room to work!
			{ Cue = "/VO/ThanatosField_0169", RequiredKillEnemiesNotFound = true },

		},
		PlayerInjuredReactionVoiceLines = {
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.25,
			PlayFromTarget = true,
			CooldownTime = 40,

			-- I got you...!
			{ Cue = "/VO/Thanatos_0091",     RequiredKillEnemiesFound = true, },
			-- Be more careful.
			{ Cue = "/VO/Thanatos_0102" },
			-- Wake up.
			{ Cue = "/VO/Thanatos_0103" },
			-- Focus, Zag.
			-- { Cue = "/VO/Thanatos_0106",     RequiredKillEnemiesFound = true, },
			-- Keep fighting.
			{ Cue = "/VO/Thanatos_0107",     RequiredKillEnemiesFound = true, },
			-- Careful, damn it.
			{ Cue = "/VO/Thanatos_0301" },
			-- Watch yourself.
			{ Cue = "/VO/Thanatos_0302" },
			-- Watch out...!
			{ Cue = "/VO/Thanatos_0303" },
			-- Stay out of the way.
			{ Cue = "/VO/Thanatos_0304" },
			-- Zagreus!
			-- { Cue = "/VO/Thanatos_0305",     RequiredAnyTextLines = { "ThanatosGift04", "ThanatosGift04_B" }, },
			-- Not on my watch.
			{ Cue = "/VO/Thanatos_0306",     RequiredKillEnemiesFound = true, },
			-- Don't die here, Zagreus.
			-- { Cue = "/VO/Thanatos_0307",     RequiredTextLines = { "ThanatosGift01" } },
			-- Hold on, Zag.
			-- { Cue = "/VO/Thanatos_0308",     RequiredTextLines = { "ThanatosGift05" },                        RequiredKillEnemiesFound = true, },
			-- Careful!
			{ Cue = "/VO/ThanatosField_0162" },
			-- Let me take care of this.
			{ Cue = "/VO/ThanatosField_0163" },
			-- Don't waste this chance you have!
			{ Cue = "/VO/ThanatosField_0164" },
			-- Left yourself open!
			{ Cue = "/VO/ThanatosField_0165" },
		},

		KillingEnemyVoiceLines = {
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.35,
			PlayFromTarget = true,
			CooldownTime = 7,

			-- Tsch.
			-- { Cue = "/VO/Thanatos_0071" },
			-- Pathetic.
			{ Cue = "/VO/Thanatos_0072" },
			-- Waste of time.
			{ Cue = "/VO/Thanatos_0084" },
			-- Useless.
			{ Cue = "/VO/Thanatos_0085" },
			-- Life is short.
			{ Cue = "/VO/Thanatos_0048" },
			-- Time's up.
			{ Cue = "/VO/Thanatos_0269" },
			-- Farewell.
			{ Cue = "/VO/Thanatos_0270" },
			-- Farewell...!
			{ Cue = "/VO/Thanatos_0271" },
			-- Rest in peace.
			{ Cue = "/VO/Thanatos_0272" },
			-- Good-bye.
			{ Cue = "/VO/Thanatos_0273" },
			-- Bye now.
			{ Cue = "/VO/Thanatos_0274" },
			-- Easy.
			{ Cue = "/VO/Thanatos_0275" },
			-- Simple.
			{ Cue = "/VO/Thanatos_0276" },
			-- Dead.
			{ Cue = "/VO/Thanatos_0277" },
			-- Dead...!
			{ Cue = "/VO/Thanatos_0278" },
			-- Gone.
			{ Cue = "/VO/Thanatos_0279" },
			-- One less.
			{ Cue = "/VO/Thanatos_0280" },
			-- Another gone.
			{ Cue = "/VO/Thanatos_0281" },
			-- That's one less.
			{ Cue = "/VO/Thanatos_0282" },
			-- There.
			{ Cue = "/VO/Thanatos_0283" },
			-- <Scoff>
			-- { Cue = "/VO/Thanatos_0284" },
			-- <Chuckle>
			{ Cue = "/VO/Thanatos_0285" },
			-- <Chuckle>
			{ Cue = "/VO/Thanatos_0286" },
			-- Dust.
			{ Cue = "/VO/ThanatosField_0154" },
			-- Wretch.
			{ Cue = "/VO/ThanatosField_0155" },
			-- Gone.
			{ Cue = "/VO/ThanatosField_0156" },
			-- Next?
			{ Cue = "/VO/ThanatosField_0157" },
		},
	},
}
