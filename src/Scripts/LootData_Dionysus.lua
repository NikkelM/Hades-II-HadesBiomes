-- #region Hermes-delivered dialogues
local newHermesDeliveredDialogues = {
	-- #region Opener
	{
		Name = "DionysusFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaFirstPickUp",
		},
		PlayOnce = true,
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/ZagreusField_0792",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 6.1 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"That was... revelry? People having a good time? Well, sure, then! In the name of Hades! Olympus, I'll accept this message."
		},
		{
			Cue = "/VO/Dionysus_0002",
			PortraitExitWait = 1.25,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Heeey, there, Zag, man, how's it going? Look, you have got to get here with the rest of us already, we've been saving you a spot! Let me see what I can do, make life a little sweeter for you in the meantime!"
		},
	},
	-- #endregion
	-- #region Super-priority story and quests
	{
		Name = "DionysusAboutOrpheus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AthenaFirstPickUp",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp", "DionysusGift01", "OrpheusTallTale03" },
		{
			Cue = "/VO/Dionysus_0042",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"Hey Zag, ever see a fellow by the name of Orpheus down there, you ever heard of him? I bet you have, and I have had a funny thought, a little jest that maybe we could try, if you'd be up to have a little harmless fun?"
		},
		{
			Cue = "/VO/ZagreusField_1218",
			Speaker = "CharProtag",
			Portrait = "Portrait_Zag_Default_01",
			PreLineAnim = "ZagreusTalkEmpathyStart",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "ZagreusTalkEmpathy_Return",
			PostLineAnimTarget = "Hero",
			Text =
			"Harmless fun at the expense of Orpheus? You have my full and complete attention, Dionysus mate."
		},
		{
			Cue = "/VO/Dionysus_0043",
			PreLineWait = 0.35,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"...That chap comes up with the most smashing songs, so I was thinking, maybe we could spin him a tall tale, something like how maybe you and I, like, we're connected or something? He'll buy it, tell him, tell him for me, yeah?!"
		},
	},
	-- #endregion
	-- #region Priority story and relationships
	{
		Name = "DionysusAboutOrpheus02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutDemeter01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusAboutOrpheus01", "OrpheusTallTale04" },
		RequiredFalseTextLinesLastRun = { "OrpheusTallTale04" },
		{
			Cue = "/VO/Dionysus_0044",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Hahaha{#PreviousFormat}, Zag! I heard you got to Orpheus, he's got this whole entire ballad now, about how you are really me, or maybe it's the other way around, I've no idea, {#DialogueItalicFormat}hahahaha{#PreviousFormat}! Here!"
		},
	},
	{
		Name = "DionysusAboutSingersReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutDemeter01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusAboutOrpheus02", "OrpheusWithEurydice01" },
		{
			Cue = "/VO/Dionysus_0151",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteCheerful",
			Text =
			"Zag, I heard that Orpheus, he found his missing bride, why, isn't that the sweetest thing, isn't it, man? I'll drink to that, and I think so should you!"
		},
	},
	{
		Name = "DionysusAboutMegRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutDemeter01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		-- Removed DionysusVsMeg01 from this as most players will never die twice in a row to her with the mod
		RequiredTextLines = { "DionysusFirstPickUp", "MegaeraGift08" },
		RequiredFalseTextLines = { "DionysusAboutMegRelationship02" },
		{
			Cue = "/VO/Dionysus_0121",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Whoa, Zag, heard you're hanging with the Fury Megaera of late, well cheers to that, man, bet she's something else, but you just watch for that whip of hers, OK?"
		},
	},
	{
		Name = "DionysusAboutMegRelationship02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutDemeter01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusAboutMegRelationship01" },
		RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
		RequiredFalseTextLinesLastRun = { "DionysusAboutMegRelationship01" },
		MinRunsSinceAnyTextLines = { TextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" }, Count = 5 },
		{
			Cue = "/VO/Dionysus_0191",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey man, I'm hearing up here that you got in good with Megaera, the Fury, is that right, I mean, I hope it is, because, {#DialogueItalicFormat}hahaha, yeow{#PreviousFormat}, know what I mean? They say she's something else!"
		},
	},
	{
		Name = "DionysusAboutThanRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutDemeter01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp", "ThanatosGift08" },
		{
			Cue = "/VO/Dionysus_0192",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, you're in good with Thanatos, isn't that right? A real broody sort, sometimes I think maybe I ought to just invite him to a feast, but then, what if he cools the whole thing down, makes everybody kind of {#DialogueItalicFormat}ehhhhh{#PreviousFormat}, you know?"
		},
	},
	{
		Name = "DionysusAboutYarn01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutDemeter01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredTrait = "TemporaryBoonRarityTrait",
		{
			Cue = "/VO/Dionysus_0119",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Why, you've a Yarn of Ariadne, right there, Zag, I know the lass for whom that yarn is named! She was a right attractive one, we had our little time, long story, though, will save it till you get here!"
		},
	},
	-- #endregion
	-- #region Contextual
	{
		Name = "DionysusPostGiftPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AthenaAboutDemeter01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusGift01", },
		{
			Cue = "/VO/Dionysus_0029",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Now how's my favorite Underworld god surviving, Zag, you holding up or what? Right better momentarily, I bet!"
		},
	},
	{
		Name = "DionysusPostGiftPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusGift02" },
		{
			Cue = "/VO/Dionysus_0030",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Man oh man, Zag, someday you will be the guest of honor at the {#DialogueItalicFormat}biggest {#PreviousFormat}feast that you have {#DialogueItalicFormat}ever {#PreviousFormat}seen! Though I know you have got your hands full for the time, so, first things first!"
		},
	},
	{
		Name = "DionysusHighRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusGift05" },
		{
			Cue = "/VO/Dionysus_0193",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I've got a feeling this time, man, like things are really going to take a turn for you, and I mean for the better, almost certainly, I think!"
		},
	},
	{
		Name = "DionysusHighRelationship02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusGift06" },
		{
			Cue = "/VO/Dionysus_0194",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The key to any halfway decent feast is lots and lots of preparation, man. Or maybe just having to improvise, you know?"
		},
	},
	{
		Name = "DionysusRunProgress03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp", "DionysusGift02" },
		RequiredKills = { SatyrRanged = 6, SatyrRangedMiniboss = 1 },
		RequiredRoomLastRun = "D_Hub",
		{
			Cue = "/VO/Dionysus_0120",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Heard you wrestled with some Satyrs near the surface, Zag! Nice work making it that far, and I just want to let you know that they are definitely not my crew, man! Satyrs I know aren't like that at all!"
		},
	},
	{
		Name = "DionysusAboutNectar02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredResourcesMin = { GiftPoints = 25 },
		RequiredTextLines = { "DionysusGift02" },
		{
			Cue = "/VO/Dionysus_0187",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Say, let me just point out you've got a lot of Nectar on you, man! Oh, I can tell, I like the stuff a lot, myself, but even I don't pack {#DialogueItalicFormat}that {#PreviousFormat}much, and I mean, {#DialogueItalicFormat}wow{#PreviousFormat}!"
		},
	},
	{
		Name = "DionysusAboutAmbrosia01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		RequiredTextLines = { "DionysusFirstPickUp", "DionysusGift01" },
		RequiredFalseTextLines = { "DionysusAboutAmbrosia02" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredResourcesMin = { SuperGiftPoints = 1 },
		{
			Cue = "/VO/Dionysus_0183",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Say, man, if I'm not mistaken, I think you got yourself a bottle of Ambrosia, there? I'd no idea you could get that stuff downstairs! Do me a solid, though, hang on to any more you find, or better yet, give it away! I'd hate to think even a drop has gone to waste!"
		},
	},
	{
		Name = "DionysusAboutAmbrosia02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		RequiredTextLines = { "DionysusGift03", "DionysusAboutAmbrosia04" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		MinRunsSinceAnyTextLines = { TextLines = { "DionysusAboutAmbrosia01", "DionysusAboutAmbrosia02", "DionysusAboutAmbrosia03", "DionysusAboutAmbrosia04" }, Count = 3 },
		RequiredResourcesMin = { SuperGiftPoints = 5 },
		{
			Cue = "/VO/Dionysus_0184",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Well, would you just look at yourself, Zag! You are like a walking stockpile of Ambrosia, aren't you? Taking the best care of it, at that. I knew I could count on you, but... {#DialogueItalicFormat}<Sniff> {#PreviousFormat}I didn't know I could be just so proud of you, you know, man?"
		},
	},
	{
		Name = "DionysusAboutAmbrosia03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		RequiredAnyTextLines = { "DionysusAboutAmbrosia01", "DionysusAboutAmbrosia02", "DionysusAboutAmbrosia04" },
		RequiredTextLines = { "DionysusGift06" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredLifetimeResourcesSpentMin = { SuperGiftPoints = 10 },
		RequiredMinAnyTextLines = { TextLines = { "CerberusGift07", "ZeusGift07", "PoseidonGift07", "AthenaGift07", "AphroditeGift07", "AresGift07", "ArtemisGift07", "HermesGift07", "DemeterGift07", "MegaeraGift07", "ThanatosGift07_A", "AchillesGift07_A", "NyxGift07", "SkellyGift07", "SisyphusGift07_A", "PatroclusGift07_A", "EurydiceGift07", "DusaGift07", "HypnosGift07" }, Count = 6 },
		MinRunsSinceAnyTextLines = { TextLines = { "DionysusAboutAmbrosia01", "DionysusAboutAmbrosia02", "DionysusAboutAmbrosia03", "DionysusAboutAmbrosia04" }, Count = 3 },
		{
			Cue = "/VO/Dionysus_0188",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Zag, turns out I am quite the judge of character, and you, man, have an {#DialogueItalicFormat}awful {#PreviousFormat}lot of it, I mean, you've given out how much Ambrosia now? To {#DialogueItalicFormat}all {#PreviousFormat}your mates, and {#DialogueItalicFormat}more{#PreviousFormat}?!"
		},
	},
	{
		Name = "DionysusAboutAmbrosia04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredLifetimeResourcesGainedMin = { SuperGiftPoints = 15 },
		MinRunsSinceAnyTextLines = { TextLines = { "DionysusAboutAmbrosia01", "DionysusAboutAmbrosia02", "DionysusAboutAmbrosia03", "DionysusAboutAmbrosia04" }, Count = 3 },
		RequiredTextLines = { "DionysusGift03" },
		{
			Cue = "/VO/Dionysus_0189",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You got to let me in on something, Zag, how did you gather up so much Ambrosia, there? I mean, sometimes I think the stuff is plentiful up here, but you are positively swimming in it, man!"
		},
	},
	{
		Name = "DionysusVsMeg01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		ConsecutiveDeathsInRoom = {
			Name = "A_Boss01",
			Count = 2,
		},
		{
			Cue = "/VO/Dionysus_0041",
			Emote = "PortraitEmoteDepressed",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Erm{#PreviousFormat}, hey, man, you been having some bad run-ins with that Fury, Megaera, is that her name? Now isn't she a real firebrand! Maybe this'll help you out next time you meet!"
		},
	},
	{
		Name = "DionysusVsTheseus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredRoomLastRun = "D_Hub",
		RequiredKills = { Theseus = 3 },
		{
			Cue = "/VO/Dionysus_0118",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Heard that you took care of Theseus down in Elysium of late, there, Zag! Nice work, never liked that one, between us. There's this nice lass helped him out one time, and he just dumped her rotten, I don't like that, man!"
		},
	},
	-- #endregion
}

mod.AddHermesDeliveredDialogues(newHermesDeliveredDialogues,
	{ Hermes = { "Modsnikkelmhadesbiomesdionysus", "ZagreusField" } }, { Dionysus_ = "Modsnikkelmhadesbiomesdionysus_" },
	{ Dionysus_ = "ModsNikkelMHadesBiomes_Portrait_Dionysus_Default_01" }, "/SFX/DionysusBoonWineLaugh",
	{ Dionysus = { Speaker = "NPC_Dionysus_01", NarrativeContextArt = "DialogueBackground_Olympus" } })
-- #endregion

mod.PrintTable(game.NarrativeData.HermesUpgrade.InteractTextLinePriorities)