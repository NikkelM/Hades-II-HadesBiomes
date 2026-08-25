local newPortedInteractTextLines = {
	-- #region First pickup
	{
		Name = "AphroditeFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		-- Always allow, to not block this if Hermes wasn't met in a modded run yet
		-- RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/ZagreusField_0782",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 4.23 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text = "I must be a mess, let's see here. Hi there! In the name of Hades! Olympus, I accept this message.",
		},
		{
			Cue = "/VO/Aphrodite_0010",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"Why hello, hello, there, little godling. I have to say you're quite the specimen, and so, I've decided I shall aid you for the moment. You interested?",
		},
	},
	-- #endregion
	-- #region Super-priority story and quests
	{
		Name = "AphroditeAboutOlympianReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AphroditeFirstPickUp",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		RequiredTextLines = { "AphroditeFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
		{
			Cue = "/VO/ZagreusField_4339",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 2.33 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"OK, I think I'm ready. In the name of Hades! Olympus, this is an official message! And I hope it finds you well, Lady Aphrodite!",
		},
		{
			Cue = "/VO/Aphrodite_0207",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"Why, {#DialogueItalicFormat}this {#PreviousFormat}is something, dearest! Such an enigmatic message you have sent. How positively captivating; I must know what it says. It bears the marks of others on Olympus, so... perhaps we ought to share some common knowledge on the subject, hm?",
		},
	},
	{
		Name = "AphroditePostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutOlympianReunionQuest01",
		},
		PlayOnce = true,
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0208",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"Oh, dearest, you've no idea what a delightful time I had while visiting you recently! So many new sights and sounds and smells, why, it was wonderful! And you are burdened with a big responsibility, aren't you? Mind if I lend my graces to you still from time to time...?",
		},
	},
	-- #endregion
	-- #region Storylines
	{
		Name = "AphroditeAboutZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AphroditeAboutOlympianReunionQuest01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete", "AphroditeWithZeus01" },
		RequiredGodLoot = "ZeusUpgrade",
		{
			Cue = "/VO/Aphrodite_0044",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Lord Zeus has made acquaintances with you? Oh I sometimes forget that he's your uncle! His favor's well worth having, I assure you.",
		},
	},
	{
		Name = "AphroditeAboutPoseidon01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "PoseidonUpgrade",
		{
			Cue = "/VO/Aphrodite_0045",
			Emote = "PortraitEmoteDepressed",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"That oaf Poseidon spoke to you already, didn't he? All bluster, muscles, and bravado, that one. I'm glad you're not the type.",
		},
	},
	{
		Name = "AphroditeAboutAthena01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AthenaUpgrade",
		{
			Cue = "/VO/Aphrodite_0042",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've met Athena, dearest, so you know not all the ladies on Olympus are alike. And I, for one, am grateful to our forebears for {#DialogueItalicFormat}that{#PreviousFormat}!",
		},
	},
	{
		Name = "AphroditeAboutAres01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "AphroditeGift01" },
		RequiredGodLoot = "AresUpgrade",
		{
			Cue = "/VO/Aphrodite_0046",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I sense the mark of my Lord Ares on you, love. He's poorly understood among the gods, yet surely you can see fair qualities in him, and me?",
		},
	},
	{
		Name = "AphroditeAboutArtemis01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "ArtemisUpgrade",
		{
			Cue = "/VO/Aphrodite_0047",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The sullen Artemis reached out to you, did she? Oh, that's adorable, dearest! Just don't make any sudden movements with her, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeAboutDionysus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "DionysusUpgrade",
		{
			Cue = "/VO/Aphrodite_0048",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You are so fortunate to have received the Boon of Dionysus prior to my own! He, the most noble and important of us all, the god of wine, himself!",
		},
	},
	{
		Name = "AphroditeAboutDemeter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredFalseTextLines = { "DemeterLiftsWinterCurse01" },
		RequiredGodLoot = "DemeterUpgrade",
		{
			Cue = "/VO/Aphrodite_0181",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Why, did sorrowful old Demeter get all the way to you before I did? She stubbornly refuses me when I offer to help! Unlike you, little godling!",
		},
	},
	{
		Name = "AphroditePostGiftPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeGift01", },
		{
			Cue = "/VO/Aphrodite_0040",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How I {#DialogueItalicFormat}love {#PreviousFormat}to have these unexpected little run-ins with you, love! You are just so spontaneous, and I've a liking for that sort of thing!",
		},
	},
	{
		Name = "AphroditePostGiftPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeGift02", },
		{
			Cue = "/VO/Aphrodite_0041",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Keep following that heart of yours, dearest! It's good enough a guide, believe you me. Mine tells me you are going to succeed!",
		},
	},
	{
		Name = "AphroditePostGiftPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeGift04", },
		{
			Cue = "/VO/Aphrodite_0058",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You {#DialogueItalicFormat}do {#PreviousFormat}know that I'm married, don't you, love...? I'd forgive you if you didn't, for my husband, he's always... busy with his work. I'm grateful that you're there for me to talk to.",
		},
	},
	{
		Name = "AphroditePostFlashback01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Aphrodite_0059",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're going to love it on Olympus, little godling. The air is beautiful and brisk, the gardens lush, the feasting plentiful...! Why, it must be the opposite of everything to which you are accustomed!",
		},
	},
	{
		Name = "AphroditePostFlashback02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditePostFlashback01", },
		RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Aphrodite_0060",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
			PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteAffection", WaitTime = 4.5 },
			Text =
			"What shall we do here once you finally arrive? Perhaps we could go out and meet some {#DialogueItalicFormat}mortals{#PreviousFormat}! I know all too many maidens and/or noble gentlemen who'd absolutely love to get to know you.",
		},
	},
	{
		Name = "AphroditeVsAchilles01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeGift01", "AchillesGift01", },
		RequiredFalseTextLinesLastRun = { "AphroditeGift01", "AchillesGift01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Aphrodite_0056",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"A little bird once told me that the shade of the great hero called Achilles now resides within your father's residence, dearest? I always wished to meet with him someday...",
		},
	},
	{
		Name = "AphroditeVsAchilles02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeVsAchilles01", "AchillesPostFlashback01" },
		{
			Cue = "/VO/Aphrodite_0057",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You met Achilles after all, godling. He was quite instrumental in a war of my design. Still, he resisted my attempts to sway his actions. You tell him, simply, I admire him.",
		},
	},
	{
		Name = "AphroditeVsAchilles03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeVsAchilles02", "AchillesAboutPatroclus04" },
		{
			Cue = "/VO/Aphrodite_0179",
			Emote = "PortraitEmoteDepressed",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The great hero Achilles, he continues to ignore my polite outreach, doesn't he? Why, I've attempted to reach out at least several times! Your father's realm is really quite a lot. How terribly frustrating it must be!",
		},
	},
	{
		Name = "AphroditeVsMeg01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp", "FuryFirstAppearance" },
		RequiredRoomLastRun = "A_Boss01",
		RequiredFalseTextLines = { "OlympianReunionQuestComplete", "AphroditeAboutMegRelationship01" },
		{
			Cue = "/VO/Aphrodite_0054",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've had a brush with Megaera, the Fury, haven't you? Oh I know a thing or two about that one. Though, lately we Olympians no longer mingle with those living in the Underworld. You're the only exception!",
		},
	},
	{
		Name = "AphroditeVsMeg02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp", "MegaeraGift07" },
		RequiredFalseTextLinesLastRun = { "MegaeraGift07" },
		RequiredFalseTextLines = { "AphroditeAboutMegRelationship01" },
		{
			Cue = "/VO/Aphrodite_0055",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"A little birdy told me recently that you and Megaera the Fury, why, you've grown quite close! Now {#DialogueItalicFormat}do {#PreviousFormat}be careful around her, and, try not to get attached, there, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp", "AphroditeAboutPersephoneMeeting01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiresLastRunCleared = true,
		{
			Cue = "/VO/Aphrodite_0180",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Oh what is going {#DialogueItalicFormat}on {#PreviousFormat}down there, dearest? I thought for certain you would make it out, but seems that nasty place has kept you grounded, hasn't it. But don't despair, and you take heart, won't you?",
		},
	},
	{
		Name = "AphroditeAboutPersephoneMeeting01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp", "PersephoneFirstMeeting" },
		{
			Cue = "/VO/Aphrodite_0218",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"Something has stirred within your heart, dearest! Oh, I can always tell! A certain kind of love, for family? Yes, that must be it, I think! What could have transpired with you, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditePostEpilogue02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "AphroditePostEpilogue01" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0219",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"To think your father and that sweet Persephone, they were together down there, all along! I was so certain that your father's heart was cold. That's just the thing with love, dearest! That, sometimes, it surprises even me!",
		},
	},
	{
		Name = "AphroditeHighAffinity01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeGift07" },
		RequiredFalseTextLinesLastRun = { "AphroditeGift07" },
		{
			Cue = "/VO/Aphrodite_0206",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My dearest little godling, how fares everything with you of late? I love to have these little interactions with you, simple as they are, for they have brightened many of my evenings here.",
		},
	},
	{
		Name = "AphroditeAboutLove01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		RequiredTextLines = { "AphroditeFirstPickUp", "AphroditeGift03" },
		{
			Cue = "/VO/Aphrodite_0198",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Little godling, you must know the seven types of love by now, don't you? It's quite a complicated field, though several types intrigue me most of all. In fact, why, I have several types of love for you, right here!",
		},
	},
	{
		Name = "AphroditeAboutLove02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeAboutLove01" },
		-- this is for backward compatibility
		RequiredAnyTextLines = { "AphroditeGift06", "AphroditeGift07" },
		RequiredMinAnyTextLines = { TextLines = { "BecameCloseWithMegaera01", "BecameCloseWithMegaera01_B", "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B", "BecameCloseWithDusa01" }, Count = 3 },
		{
			Cue = "/VO/Aphrodite_0199",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"Dearest, why... I sense your heart is very full, indeed! You positively emanate with love. You must have grown quite close to many dear to you. Perhaps so you may do the same with me...? I'm so delighted to have seen your spirit shine.",
		},
	},
	{
		Name = "AphroditeAboutLove03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeAboutLove02", "CerberusGift09", "AchillesGift09_A", "PatroclusGift08_A", "ThanatosGift10", "MegaeraGift10", "BecameCloseWithDusa01", "NyxGift09", "HypnosGift08", "CharonGift07", "SkellyGift09", "SisyphusGift09_A", "PersephoneGift09", "EurydiceGift08", "OrpheusGift08", "HadesGift05", "ZeusGift07", "DemeterGift07", "ArtemisGift07", "AphroditeGift07", "AresGift07", "AthenaGift07", "DionysusGift07", "PoseidonGift07", "ChaosGift08" },
		RequiredAnyTextLines = { "HermesGift08", "HermesGift08B" },
		{
			Cue = "/VO/Aphrodite_0220",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"Oh, my, dearest! I have to say, your heart is positively bursting with such love for so many you have come to care about! Your dearest friends, your burning passions, family, {#DialogueItalicFormat}everyone{#PreviousFormat}! Why, you're like a living testament to my entire body of work!",
		},
	},
	{
		Name = "AphroditeBackstory01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
		{
			Cue = "/VO/Aphrodite_0053",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I cannot help but wonder, dearest, why Lord Hades would have kept your mere existence hidden from us all this time. Perhaps he knew that, once you met us, you would stop at nothing to come seek us out!",
		},
	},
	{
		Name = "AphroditeAboutMegRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
		RequiredFalseTextLinesLastRun = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
		{
			Cue = "/VO/Aphrodite_0173",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"I sense you finally acted on your pent-up passion for the Fury Megaera, yes, little godling? These types of things, they don't escape my notice, and they're always so enjoyable to see!",
		},
	},
	{
		Name = "AphroditeAboutMegRelationship02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeAboutMegRelationship01" },
		RequiredMinAnyTextLines = { TextLines = { "MegIntermissionChat01", "MegIntermissionChat02", "MegIntermissionChat03", "MegIntermissionChat04", "MegIntermissionChat05", "MegIntermissionChat06" }, Count = 2 },
		{
			Cue = "/VO/Aphrodite_0174",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"How's fearsome Megaera the Fury treating you of late, {#DialogueItalicFormat}hmm{#PreviousFormat}, dearest? I know her type so very well, indeed. She acts as though there's nothing that can get under her skin, isn't that right?",
		},
	},
	{
		Name = "AphroditeAboutThanRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		RequiredFalseTextLinesLastRun = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		{
			Cue = "/VO/Aphrodite_0175",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"{#DialogueItalicFormat}Mmm{#PreviousFormat}, so my heart tells me that you've developed quite the bond with moody Thanatos, haven't you, there? I always figured that his brooding quality was just an act!",
		},
	},
	{
		Name = "AphroditeAboutThanRelationship02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeAboutThanRelationship01" },
		RequiredMinAnyTextLines = { TextLines = { "ThanatosHomeIntermissionChat01", "ThanatosHomeIntermissionChat02", "ThanatosHomeIntermissionChat03", "ThanatosHomeIntermissionChat04", "ThanatosHomeIntermissionChat05", "ThanatosHomeIntermissionChat06" }, Count = 2 },
		RequiredFalseTextLinesLastRun = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		{
			Cue = "/VO/Aphrodite_0176",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Little godling, would that I knew every last detail of how you and Thanatos are getting on of late! The notorious incarnate of death, and the newly discovered son of Hades, fraternizing? It's positively scandalous I think!",
		},
	},
	{
		Name = "AphroditeAboutDusaRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DusaGift08" },
		RequiredFalseTextLines = { "BecameCloseWithDusa01" },
		{
			Cue = "/VO/Aphrodite_0177",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteCheerful",
			Text =
			"{#DialogueItalicFormat}Erm{#PreviousFormat}, dearest? If my perfectly developed senses are correct, then you appear to be quite smitten with a little gorgon that you've met down there...? Why that must be adorable, if rather strange! ",
		},
	},
	{
		Name = "AphroditeAboutDusaRelationship02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeGift02", "BecameCloseWithDusa01" },
		RequiredFalseTextLinesLastRun = { "BecameCloseWithDusa01" },
		{
			Cue = "/VO/Aphrodite_0178",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteCheerful",
			Text =
			"Why, something's changed about the beating of your heart, dearest! {#DialogueItalicFormat}Oh{#PreviousFormat}, it's the little gorgon, isn't it. You Underworld dwellers and your complicated feelings! I can never get enough. My blessings to the both of you, then, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeAboutKeepsake01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTrait = "ForceAphroditeBoonTrait",

		{
			Cue = "/VO/Aphrodite_0197",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAffection",
			Text =
			"Why, you have my Eternal Rose, don't you? I am so very touched that you'd think first of me among my mighty kin. It pleases me to know I'm in your thoughts!",
		},
	},
	-- #endregion
	-- #region Generic priority dialogues
	{
		Name = "AphroditeLowHealth01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AphroditeAboutZeus01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredMaxHealthFraction = 0.20,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Aphrodite_0078",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteSurprise",
			Text = "Oh, look at you, you poor, poor thing, you're hurt! Though, let me see if I can make it better.",
		},
	},
	{
		Name = "AphroditeLowHealth02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLowHealth01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredMaxHealthFraction = 0.20,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Aphrodite_0079",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Tsk{#PreviousFormat}, you're in no condition for an outing with me, dearest. Though, perhaps you might recover from your hardships with my aid?",
		},
	},
	{
		Name = "AphroditeLowHealth03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLowHealth01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 0,

		{
			Cue = "/VO/Aphrodite_0200",
			Emote = "PortraitEmoteSurprise",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Dearest, why, your heart rate's fluctuating wildly! Has it really been that bad up to this point? I'll try to help however much I can.",
		},
	},
	{
		Name = "AphroditeLowHealth04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLowHealth01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Aphrodite_0201",
			Emote = "PortraitEmoteDepressed",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Oh, you're just in an awful situation, aren't you. Yet, I can tell your proud heart keeps on beating, for the moment anyway! Don't die just yet!",
		},
	},
	{
		Name = "AphroditeLowHealth05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLowHealth01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 0,

		{
			Cue = "/VO/Aphrodite_0202",
			Emote = "PortraitEmoteSurprise",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ah, little godling, you're about to die! Why, none of us want {#DialogueItalicFormat}that{#PreviousFormat}, because if so, you won't get to enjoy my blessings here!",
		},
	},
	{
		Name = "AphroditeLegendaryPickUp01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLowHealth01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp", "AphroditeGift01" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Aphrodite_0032",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I have been waiting for a special moment to confess my great appreciation for your deeds... this moment's special enough, isn't it?",
		},
	},
	{
		Name = "AphroditeLegendaryPickUp02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLowHealth01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp", "AphroditeGift01" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Aphrodite_0033",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My loveliest of blessings is reserved only for those who've earned my deepest adoration. So, congratulations, love! And here you go!",
		},
	},
	{
		Name = "AphroditeLegendaryPickUp03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLowHealth01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp", "AphroditeGift01" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Aphrodite_0158",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Sometimes, our hearts become so full that they could burst! If only you could see how much I care. I would do anything to aid you in your plight! My heartfelt blessings be with you, dearest.",
		},
	},
	{
		Name = "AphroditeLegendaryPickUp04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLowHealth01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Aphrodite_0159",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Little godling, you must know that the heart has infinite capacity for empathy. And I so feel for you there, that I have mustered for you some of the most beautiful of blessings I can offer!",
		},
	},
	-- #endregion
	-- #region Misc
	{
		Name = "AphroditeMiscPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AphroditeLowHealth01",
			CreateNewPriorityGroup = true,
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0011",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Did you miss me, little godling, {#DialogueItalicFormat}hm{#PreviousFormat}? I thought I'd steal away a bit and that together we might make up for lost time.",
		},
	},
	{
		Name = "AphroditeMiscPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0012",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hello again, there, little godling, let's get to it, {#DialogueItalicFormat}hm{#PreviousFormat}? I want what you want; there's no further need for words.",
		},
	},
	{
		Name = "AphroditeMiscPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredFalseRooms = { "RoomOpening" },
		RequiredMaxHealthFraction = 0.75,
		{
			Cue = "/VO/Aphrodite_0013",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteDepressed",
			Text =
			"Oh, boo, looks like you've rather got yourself into a bind, there, haven't you. Though, not to worry, dearest. I can pull some strings.",
		},
	},
	{
		Name = "AphroditeMiscPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Aphrodite_0014",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"There, there, dearest, you'll tell me all your troubles just as soon as you arrive, so let's just get you out of there for now.",
		},
	},
	{
		Name = "AphroditeMiscPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0015",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"What is it, love, are you still having problems with the dead? I swear, you'd think they had enough of me in life!",
		},
	},
	{
		Name = "AphroditeMiscPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0016",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"What did I miss since last time, anything of interest, {#DialogueItalicFormat}hm{#PreviousFormat}? You'll have to fill me in once you break free, dearest.",
		},
	},
	{
		Name = "AphroditeMiscPickup07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0017",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Well, look at you, there, love! So well-prepared to take on any danger that may come! But, I must wonder, are you well-prepared for {#DialogueItalicFormat}this{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeMiscPickup08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0018",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ready yourself, dearest, because you and I? We're going to have ourselves a little outing I expect that neither one of us shall soon forget.",
		},
	},
	{
		Name = "AphroditeMiscPickup09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0019",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Would you by any chance have room, there, in your heart for a most-gentle blessing from a goddess such as me?",
		},
	},
	{
		Name = "AphroditeMiscPickup10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Aphrodite_0020",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Don't lose heart, now, little godling! I won't have you giving up before you get to see me in the flesh among the gardens of Olympus here...!",
		},
	},
	{
		Name = "AphroditeMiscPickup11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0021",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Dearest, I've known many gods and godlings through the ages. And, I have to say, you're {#DialogueItalicFormat}quite {#PreviousFormat}intriguing, even for our kind.",
		},
	},
	{
		Name = "AphroditeMiscPickup12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0022",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Oh, dearest, I suspect we'll have ourselves a most exciting time together, you and I! Just do your best and it'll all be fine!",
		},
	},
	{
		Name = "AphroditeMiscPickup13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0023",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I am always here, or close enough, to help you through whatever troubles you may face, my little godling. So do not hesitate to call upon me, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeMiscPickup14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		MinRunsSinceAnyTextLines = { TextLines = { "AphroditePostEpilogue01" }, Count = 3 },
		{
			Cue = "/VO/Aphrodite_0024",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'd ask you show me a good time, there, love, although I almost can't imagine a good time where you reside! So dreary, constantly!",
		},
	},
	{
		Name = "AphroditeMiscPickup15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp", "AphroditeGift01" },
		{
			Cue = "/VO/Aphrodite_0025",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I missed you terribly, my little godling! All that I ask is that you do not die on me again, why, I don't think that I can take it anymore!",
		},
	},
	{
		Name = "AphroditeMiscPickup16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0026",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How you must yearn to reach the surface, little godling! It likewise stirs in me a yearning to assist you, by all means at my disposal!",
		},
	},
	{
		Name = "AphroditeMiscPickup17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0027",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"No need to worry any longer, dearest! I bring you strength and comfort, and I shall be watching every step of yours most carefully.",
		},
	},
	{
		Name = "AphroditeMiscPickup18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Aphrodite_0028",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ah, how I long to see you face-to-face! Until such time, however, this old means of keeping touch shall have to do. So you take care, now, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeMiscPickup19",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Aphrodite_0029",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You know I would do anything to have you here among us, don't you, love? Oh, I just hope my blessings are enough...!",
		},
	},
	{
		Name = "AphroditeMiscPickup20",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		{
			Cue = "/VO/Aphrodite_0030",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Love tends to blossom in the strangest places at the strangest times, you know that, don't you, dearest? All one can do is entertain the chance.",
		},
	},
	{
		Name = "AphroditeMiscPickup21",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Aphrodite_0031",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Don't work yourself too hard down there, you promise, little godling? We need you in good shape and spirits on Olympus here.",
		},
	},
	{
		Name = "AphroditeMiscPickup22",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0002",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What do you say we skip the chat and get right to it, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeMiscPickup23",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0003",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Oh, would you look at whom I found, all by his lonely self.",
		},
	},
	{
		Name = "AphroditeMiscPickup24",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0004",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let's see what mischief we can make, between the two of us!",
		},
	},
	{
		Name = "AphroditeMiscPickup25",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0005",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You want my blessings, dearest, here they are!",
		},
	},
	{
		Name = "AphroditeMiscPickup26",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0006",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I hope I didn't keep you waiting very long, did I?",
		},
	},
	{
		Name = "AphroditeMiscPickup27",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0007",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Even immortal hearts can break, my little godling.",
		},
	},
	{
		Name = "AphroditeMiscPickup28",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0008",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What do you say we go and make new friends together, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeMiscPickup29",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0009",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You seem like you could use a helping hand, there, love.",
		},
	},
	{
		Name = "AphroditeMiscPickup30",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0142",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The bond of love is strong enough to suffer any hardship, dearest.",
		},
	},
	{
		Name = "AphroditeMiscPickup31",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0143",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Times of adversity make love grow even stronger, little godling.",
		},
	},
	{
		Name = "AphroditeMiscPickup32",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0144",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I hate to see you struggling, dearest! Please do be careful, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeMiscPickup33",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0145",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Love conquers everything, you see that, don't you, dearest?",
		},
	},
	{
		Name = "AphroditeMiscPickup34",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0146",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Think of all those you love, and may they spur your courage, little godling.",
		},
	},
	{
		Name = "AphroditeMiscPickup35",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0147",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your passion to achieve your goal is quite inspiring, I have to say!",
		},
	},
	{
		Name = "AphroditeMiscPickup36",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0148",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It's such a pity I can barely see you in that awful darkness, little godling.",
		},
	},
	{
		Name = "AphroditeMiscPickup37",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0149",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Love spurs the heart to greater acts of valor, doesn't it, dearest?",
		},
	},
	{
		Name = "AphroditeMiscPickup38",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0150",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Take heart, now, little godling. And how about you take this from me, as well.",
		},
	},
	{
		Name = "AphroditeMiscPickup39",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AphroditeBasicPickUpTextLines,
		{
			Cue = "/VO/Aphrodite_0151",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'd love to help you however best I'm able, my little godling.",
		},
	},
	{
		Name = "AphroditeMiscPickupRare01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Aphrodite_0152",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I have the loveliest selection of my blessings for you this time, dearest!",
		},
	},
	{
		Name = "AphroditeMiscPickupRare02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Aphrodite_0153",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I think I'll give you something very special this time, little godling.",
		},
	},
	{
		Name = "AphroditeMiscPickupRare03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Aphrodite_0154",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Is not the purest act of love to aid somebody in their time of need?",
		},
	},
	{
		Name = "AphroditeMiscPickupRare04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AphroditeFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Aphrodite_0155",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'm feeling wonderful of late, dearest, so here, enjoy the benefits!",
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(newPortedInteractTextLines, "AphroditeUpgrade", "InteractTextLineSets",
	{
		TextLinePriorityType = "InteractTextLinePriorities",
		VoiceBankMappings = { Aphrodite = { "Modsnikkelmhadesbiomesaphrodite", "ZagreusField" } },
		CueMappings = { Aphrodite_ = "Modsnikkelmhadesbiomesaphrodite_" },
		PortraitMappings = { Aphrodite_ = "ModsNikkelMHadesBiomes_Portrait_Aphrodite_Default_01" },
	}
)

local newPortedDuoPickupTextLines = {
	{
		Name = "AphroditeWithZeus01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
		{
			Cue = "/VO/Aphrodite_0187",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"Dearest, your lord uncle wishes to address you from our mountaintop, although I had assured him that the two of us, we had everything well under control!"
		},
		{
			Cue = "/VO/Zeus_0199",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/ZeusBoonThunder",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Zeus_01",
			Portrait = "Portrait_Zeus_Default_01",
			Text =
			"Come now, Zagreus, the only thing Lady Aphrodite has under control is her long list of salivating suitors, am I right? Aphrodite, how about you bestow your blessing and be off, and I'll take it from here."
		},
	},
	{
		Name = "AphroditeWithPoseidon01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "ImprovedPomTrait",
		{
			Cue = "/VO/Aphrodite_0050",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"The thing to know about this family, dearest, is that, each of us, we have our little quirks. Although, we always stick together and our love for one another perseveres!"
		},
		{
			Cue = "/VO/Poseidon_0131",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/PoseidonBoonWaveCrash",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Poseidon_01",
			Portrait = "Portrait_Poseidon_Default_01",
			Text =
			"Oh, {#DialogueItalicFormat}hoh{#PreviousFormat}! What do we have here, little Hades? Seems to me that you have {#DialogueItalicFormat}company{#PreviousFormat}! Well, I'll just leave the two of you alone. My lips are sealed tighter than a warship hull!"
		},
		{
			Cue = "/VO/Aphrodite_0051",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Emote = "PortraitEmoteCheerful",
			Text =
			"Oh, feel free to stay, Poseidon! I was just explaining what an idiot you are, though you're able to articulate this best! Anyway, dearest, what was I on about...?"
		},
	},
	{
		Name = "AphroditeWithAres01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "CurseSickTrait",
		{
			Cue = "/VO/Aphrodite_0189",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"I think for many of us, dearest, it can come as a surprise to learn that love and war often go hand in hand. Opposite forces, yet this connects them, doesn't it. The fiercest passions of gods and mortals! Isn't that right, Lord Ares?"
		},
		{
			Cue = "/VO/Ares_0226",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/AresWrathBattle",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Ares_01",
			Portrait = "Portrait_Ares_Default_01",
			Text =
			"Mortals are so bent on clinging to their lives, that many among them would gladly kill for it. The surge of emotion which they feel... one passion is no different from another, Lady Aphrodite, dear."
		},
	},
	{
		Name = "AphroditeWithDemeter01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "SelfLaserTrait",
		{
			Cue = "/VO/Aphrodite_0191",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"The venerable goddess of the seasons, Demeter, chooses to look as stately as can be, can you believe it, dearest? Although, why one would mark so many fine lines upon their face, I wouldn't know."
		},
		{
			Cue = "/VO/Demeter_0152",
			PortraitExitWait = 0.35,
			StartSound = "/SFX/DemeterBoonFrost",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Demeter_01",
			Portrait = "Portrait_Demeter_Default_01",
			Text =
			"Oh, Aphrodite, dear... you wouldn't know a thing of substance if it offered you a cloak. Your chosen countenance makes plain the full extent of your intentions, and your interests alike."
		},
	},
}
mod.AddNarrativeDataEntries(newPortedDuoPickupTextLines, "AphroditeUpgrade", "DuoPickupTextLines",
	{
		CueMappings = { Aphrodite_ = "Modsnikkelmhadesbiomesaphrodite_", Ares_ = "Modsnikkelmhadesbiomesares_", Demeter_ = "Modsnikkelmhadesbiomesdemeter_", Poseidon_ = "Modsnikkelmhadesbiomesposeidon_", Zeus_ = "Modsnikkelmhadesbiomeszeus_" },
		PortraitMappings = { Aphrodite_ = "ModsNikkelMHadesBiomes_Portrait_Aphrodite_Default_01", Ares_ = "ModsNikkelMHadesBiomes_Portrait_Ares_Default_01", Demeter_ = "ModsNikkelMHadesBiomes_Portrait_Demeter_Default_01", Poseidon_ = "ModsNikkelMHadesBiomes_Portrait_Poseidon_Default_01", Zeus_ = "ModsNikkelMHadesBiomes_Portrait_Zeus_Default_01" },
	}
)

local newPortedLootBoughtTextLines = {
	{
		Name = "AphroditeLootBought01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Aphrodite_0061",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteCheerful",
			Text =
			"Looks like we meet again, dearest, here among the foul detritus of the boatman's wares! You truly take me to the best of places!",
		},
	},
	{
		Name = "AphroditeLootBought02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Aphrodite_0062",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"At first I didn't know how to get through to that odd river-boatman, Charon. Turns out he lusts for coin, and now I understand him well!",
		},
	},
	{
		Name = "AphroditeLootBought03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Aphrodite_0156",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You spent your hard-earned wealth on my account, dearest? Why if that isn't just the sweetest thing!",
		},
	},
	{
		Name = "AphroditeLootBought04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AphroditeLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Aphrodite_0157",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"One cannot put a price on love, but on my blessings, from the boatman, for my dearest? I'd say we're settled up.",
		},
	},
}
mod.AddNarrativeDataEntries(newPortedLootBoughtTextLines, "AphroditeUpgrade", "BoughtTextLines",
	{
		TextLinePriorityType = "BoughtTextLinePriorities",
		VoiceBankMappings = { Aphrodite = { "Modsnikkelmhadesbiomesaphrodite" } },
		CueMappings = { Aphrodite_ = "Modsnikkelmhadesbiomesaphrodite_" },
		PortraitMappings = { Aphrodite_ = "ModsNikkelMHadesBiomes_Portrait_Aphrodite_Default_01" },
	}
)

local newPortedRejectionTextLines = {
	{
		Name = "AphroditeRejection01",
		{
			Cue = "/VO/Aphrodite_0063",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"And here I was beginning to think that we had something special going, no...? Look here, little godling, let me save you lots of future suffering: I happen to be the jealous type.",
		},
	},
	{
		Name = "AphroditeRejection02",
		{
			Cue = "/VO/Aphrodite_0064",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You'd best not take for granted my affection, godling. Yes, I've lots of it to go around; but I can just as easily rescind such privileges.",
		},
	},
	{
		Name = "AphroditeRejection03",
		{
			Cue = "/VO/Aphrodite_0065",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"They say a lot of things about me, dearest; and they'll tell you, in your dealings with me, ample caution is in order. Let me show you why.",
		},
	},
	{
		Name = "AphroditeRejection04",
		{
			Cue = "/VO/Aphrodite_0066",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Don't {#DialogueItalicFormat}ever {#PreviousFormat}take me for some thoughtless nymph to be manipulated, dearest. I expect reciprocal devotion from you. Do you understand?",
		},
	},
	{
		Name = "AphroditeRejection05",
		{
			Cue = "/VO/Aphrodite_0067",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteCheerful",
			Text =
			"Oh, {#DialogueItalicFormat}really{#PreviousFormat}? You shall find I don't take such rejections lying down. And you shall find it out the hard way.",
		},
	},
	{
		Name = "AphroditeRejection06",
		{
			Cue = "/VO/Aphrodite_0068",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteCheerful",
			Text =
			"If it's your wish to test the limits of the fine relationship we've built, why then... I can confirm you're testing them, all right!",
		},
	},
	{
		Name = "AphroditeRejection07",
		{
			Cue = "/VO/Aphrodite_0133",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteCheerful",
			Text =
			"Now, dearest... surely there's no way that could have been one of the wiser choices that you've lately made?",
		},
	},
	{
		Name = "AphroditeRejection08",
		{
			Cue = "/VO/Aphrodite_0134",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteCheerful",
			Text =
			"Dearest, just in case it hasn't been made clear as crystal lately, let me tell you: When presented with the opportunity, don't {#DialogueItalicFormat}ever {#PreviousFormat}reject me.",
		},
	},
	{
		Name = "AphroditeRejection09",
		{
			Cue = "/VO/Aphrodite_0135",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You'd spurn my love this easily, dearest? You are about to find the consequences are much harder to dismiss without a second thought.",
		},
	},
	{
		Name = "AphroditeRejection10",
		{
			Cue = "/VO/Aphrodite_0136",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteCheerful",
			Text =
			"I must admit I'm unaccustomed to rejection, love. But {#DialogueItalicFormat}you {#PreviousFormat}must be accustomed to swift death! Here comes one for you now.",
		},
	},
	{
		Name = "AphroditeRejection11",
		{
			Cue = "/VO/Aphrodite_0213",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteDepressed",
			Text =
			"Oh, but this is such a heartbreak, dearest! Why would you do that? You know that I won't take this lying down.",
		},
	},
	{
		Name = "AphroditeRejection12",
		{
			Cue = "/VO/Aphrodite_0214",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAnger",
			Text =
			"You {#DialogueItalicFormat}dare {#PreviousFormat}to play with {#DialogueItalicFormat}my {#PreviousFormat}heart, little godling? I'll just take yours, and shatter it to pieces, then, I think!",
		},
	},
	{
		Name = "AphroditeRejection13",
		{
			Cue = "/VO/Aphrodite_0215",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Sometimes I think that you're quite {#DialogueItalicFormat}different {#PreviousFormat}than most all the others here, darling. And then, you go and do something like {#DialogueItalicFormat}this{#PreviousFormat}.",
		},
	},
	{
		Name = "AphroditeRejection14",
		{
			Cue = "/VO/Aphrodite_0216",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAnger",
			Text =
			"You think you can brush me aside like that? Well, I think I can crush you into tiny, little bits! Let's see who's right, shall we?",
		},
	},
}
mod.AddNarrativeDataEntries(newPortedRejectionTextLines, "AphroditeUpgrade", "RejectionTextLines",
	{
		VoiceBankMappings = { Aphrodite = { "Modsnikkelmhadesbiomesaphrodite" } },
		CueMappings = { Aphrodite_ = "Modsnikkelmhadesbiomesaphrodite_" },
		PortraitMappings = { Aphrodite_ = "ModsNikkelMHadesBiomes_Portrait_Aphrodite_Default_01" },
	}
)

local newPortedMakeUpTextLines = {
	{
		Name = "AphroditeMakeUp01",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0069",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Let's say we kissed and made up, dearest. Just, do not anger me again, or I might come down and kill you there myself!",
		},
	},
	{
		Name = "AphroditeMakeUp02",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0070",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Alas that passion sometimes drives me into vengeance, dearest! Yet, who among us isn't without vices, {#DialogueItalicFormat}hm{#PreviousFormat}?",
		},
	},
	{
		Name = "AphroditeMakeUp03",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0071",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Oh, how I hate to fight with you like this! Let's forgive each other and forget, go back to how things used to be?",
		},
	},
	{
		Name = "AphroditeMakeUp04",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0072",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'm not angry with you any longer, dearest! Though, might I suggest you take some extra steps to keep it that way, hm?",
		},
	},
	{
		Name = "AphroditeMakeUp05",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0073",
			PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
			PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteAffection", WaitTime = 7.6 },
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"A loving heart is a forgiving heart, don't you agree? So I shall let this little matter slide, and you've my loving heart to thank for it, {#DialogueItalicFormat}hm-hm{#PreviousFormat}!",
		},
	},
	{
		Name = "AphroditeMakeUp06",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0074",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The truth is I'm a lover, not a fighter, dearest. So how about we call this matter put to bed, and get on with our lives?",
		},
	},
	{
		Name = "AphroditeMakeUp07",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0137",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'd say this little squabble can be put to bed, for now. I'm better for the moment, but I was very angry with you, love!",
		},
	},
	{
		Name = "AphroditeMakeUp08",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0138",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I cannot bring myself to stay upset with you forever, little godling, so let's move along from that small misunderstanding there.",
		},
	},
	{
		Name = "AphroditeMakeUp09",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0139",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"There is no common sense with love, godling, so... why don't we pretend your indiscretion there did not occur.",
		},
	},
	{
		Name = "AphroditeMakeUp10",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0140",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It is through times of difficulty that the love we share is tested and reforged. But you just watch yourself when testing it like that.",
		},
	},
	{
		Name = "AphroditeMakeUp11",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0141",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Love and jealousy go hand in hand, don't they, dearest? Although the former's much more pleasant, isn't it.",
		},
	},
	{
		Name = "AphroditeMakeUp12",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Aphrodite_0217",
			Emote = "PortraitEmoteAffection",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Oh, all this fighting! It's just not like us at {#DialogueItalicFormat}all{#PreviousFormat}, dearest! Let's say we kissed and then made up, all right?",
		},
	},
}
mod.AddNarrativeDataEntries(newPortedMakeUpTextLines, "AphroditeUpgrade", "MakeUpTextLines",
	{
		VoiceBankMappings = { Aphrodite = { "Modsnikkelmhadesbiomesaphrodite" } },
		CueMappings = { Aphrodite_ = "Modsnikkelmhadesbiomesaphrodite_" },
		PortraitMappings = { Aphrodite_ = "ModsNikkelMHadesBiomes_Portrait_Aphrodite_Default_01" },
	}
)
