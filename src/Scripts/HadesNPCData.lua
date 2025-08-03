-- For these, make the modifications directly here, as larger changes are often needed
mod.PresetEventArgs = mod.PresetEventArgs or {
	-- PatroclusMuttering = {
	-- 	StatusAnimation = "StatusIconWantsToTalk",
	-- 	DistanceTrigger =
	-- 	{
	-- 		WithinDistance = 450,
	-- 		VoiceLines = GlobalVoiceLines.PatroclusGreetingLines,
	-- 	},
	-- 	VoiceLines =
	-- 	{
	-- 		[1] = GlobalVoiceLines.PatroclusMutteringLines,
	-- 	},
	-- },
	-- PatroclusMutteringRepeatable = {
	-- 	DistanceTrigger =
	-- 	{
	-- 		WithinDistance = 450,
	-- 		VoiceLines = GlobalVoiceLines.PatroclusGreetingLines,
	-- 	},
	-- 	VoiceLines =
	-- 	{
	-- 		[1] = GlobalVoiceLines.PatroclusMutteringLines,
	-- 	},
	-- },
	-- PatroclusGreetings = {
	-- 	DistanceTrigger =
	-- 	{
	-- 		WithinDistance = 350,
	-- 		VoiceLines =
	-- 		{
	-- 			RandomRemaining = true,
	-- 			Queue = "Interrupt",
	-- 			CooldownTime = "30",
	-- 			CooldownName = "PatroclusGreetedRecently",
	-- 			SuccessiveChanceToPlay = 0.5,

	-- 			-- What is it?
	-- 			{ Cue = "/VO/Patroclus_0043" },
	-- 			-- What is it, stranger.
	-- 			{ Cue = "/VO/Patroclus_0044" },
	-- 			-- Stranger...
	-- 			{ Cue = "/VO/Patroclus_0080", RequiredTextLines = { "PatroclusGift03" }, },
	-- 			-- You.
	-- 			{ Cue = "/VO/Patroclus_0082", RequiredTextLines = { "PatroclusGift03" }, },
	-- 			-- You again.
	-- 			{ Cue = "/VO/Patroclus_0083", RequiredTextLines = { "PatroclusGift03" }, },
	-- 			-- You're back.
	-- 			{ Cue = "/VO/Patroclus_0085" },
	-- 			-- Oh.
	-- 			{ Cue = "/VO/Patroclus_0087", RequiredFalseTextLines = { "PatroclusGift03" }, },
	-- 		},
	-- 	},
	-- },
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
	-- 		[1] = GlobalVoiceLines.PersephoneHomeGreetingVoiceLines,
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
	-- 		[1] = GlobalVoiceLines.PersephoneHomeGreetingVoiceLines,
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
		OnCloseFinishedFunctionName = "SisyphusPostChoicePresentation",
		UpgradeOptions = {
			{
				Type = "Trait",
				ItemName = "SisyphusHealing",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "SisyphusMoney",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "SisyphusMetapoints",
				Rarity = "Common",
			},
		},
	},
	-- BouldyRandomBlessings = {
	-- 	"BouldyBlessing_Armor",
	-- 	"BouldyBlessing_Attack",
	-- 	"BouldyBlessing_Special",
	-- 	"BouldyBlessing_Ranged",
	-- 	"BouldyBlessing_Speed",
	-- 	"BouldyBlessing_Money",
	-- 	"BouldyBlessing_None",
	-- },
	-- PatroclusBenefitChoices = {
	-- 	{
	-- 		RequiredActiveMetaUpgrade = "ExtraChanceMetaUpgrade",
	-- 		ChoiceText = "ChoiceText_BuffExtraChance",
	-- 		{
	-- 			PostLineThreadedFunctionName = "PatroclusBuff",
	-- 			PostLineFunctionArgs = {
	-- 				LastStand = {
	-- 					Count = 100,
	-- 					Icon = "ExtraLifeStyx",
	-- 					WeaponName = "LastStandMetaUpgradeShield",
	-- 					HealFraction = 0.5
	-- 				}
	-- 			}
	-- 		},
	-- 	},
	-- 	{
	-- 		RequiredActiveMetaUpgrade = "ExtraChanceReplenishMetaUpgrade",
	-- 		ChoiceText = "ChoiceText_BuffExtraChanceReplenish",
	-- 		{
	-- 			PostLineThreadedFunctionName = "PatroclusBuff",
	-- 			PostLineFunctionArgs =
	-- 			{
	-- 				TraitName = "UpgradedTemporaryLastStandHealTrait",
	-- 			}
	-- 		},
	-- 	},
	-- 	{
	-- 		ChoiceText = "ChoiceText_BuffHealing",
	-- 		{ PostLineThreadedFunctionName = "PatroclusBuff", PostLineFunctionArgs = { TraitName = "TemporaryDoorHealTrait_Patroclus", } },
	-- 	},
	-- 	{
	-- 		ChoiceText = "ChoiceText_BuffWeapon",
	-- 		{ PostLineThreadedFunctionName = "PatroclusBuff", PostLineFunctionArgs = { TraitName = "TemporaryImprovedWeaponTrait_Patroclus", } },
	-- 	},
	-- },
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
		-- OnCloseFinishedFunctionName = "EurydicePostChoicePresentation",
		UpgradeOptions = {
			{
				Type = "Trait",
				ItemName = "SisyphusHealing",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "SisyphusMoney",
				Rarity = "Common",
			},
			{
				Type = "Trait",
				ItemName = "SisyphusMetapoints",
				Rarity = "Common",
			},
		},
		-- {
		-- 	ChoiceText = "ChoiceText_BuffSlottedBoonRarity",
		-- 	{ PostLineThreadedFunctionName = "EurydiceBuff", PostLineFunctionArgs = { BoonRarity = true } },
		-- },
		-- {
		-- 	ChoiceText = "ChoiceText_BuffMegaPom",
		-- 	{ PostLineThreadedFunctionName = "EurydiceBuff", PostLineFunctionArgs = { StackTraits = true } },
		-- },
		-- {
		-- 	ChoiceText = "ChoiceText_BuffFutureBoonRarity",
		-- 	{ PostLineThreadedFunctionName = "EurydiceBuff", PostLineFunctionArgs = { BuffFutureRarity = true } },
		-- },
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

		ActivateRequirements =
		{
			RequiredMinCompletedRuns = 1,
		},

		MetaPointMin = 50,
		MetaPointMax = 60,

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
	-- Manually replace PresetEventArgs.SingingEurydiceSong01_Eurydice[_SongFromStart] with mod.PresetEventArgs.SingingEurydiceSong01_Eurydice[_SongFromStart] to make it easier
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

		ActivateRequirements =
		{
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
}
