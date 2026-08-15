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
			InsertAfterNarrativeTextLine = "AthenaAboutOlympianReunionQuest01",
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
	{
		Name = "DionysusAboutOlympianReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutOlympianReunionQuest01",
		},
		PlayOnce = true,
		RequiredTextLines = { "DionysusFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
		{
			Cue = "/VO/ZagreusField_4342",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 3.27 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text = "Hope this lives up to your expectations, mate. In the name of Hades! Olympus? This is an official message! Should be a good time, Lord Dionysus!",
		},
		{
			Cue = "/VO/Dionysus_0216",
			PortraitExitWait = 1.25,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteSurprise",
			Text = "Whoa, hold just for a moment, Zag, now, I can recognize an invite when I see one, man! And this is definitely almost certainly some sort of invite, one for me, and... one for everybody else, it looks like, here? Hoh, I'm excited, that is something really special, I can tell!",
		},
	},
	{
		Name = "DionysusPostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutOlympianReunionQuest01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Dionysus_0217",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Look, Zag, I don't entirely recall what happened at that feast you threw for all of us down there, but let me tell you, I am under the impression it went {#DialogueItalicFormat}smashingly{#PreviousFormat}! It was {#DialogueItalicFormat}amazing{#PreviousFormat}, man! Let's have another one sometime, all right?",
		},
	},
	-- #endregion
	-- #region Priority story and relationships
	{
		Name = "DionysusAboutOrpheus02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AthenaAboutOlympianReunionQuest01",
			CreateNewPriorityGroup = true,
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
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
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
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
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
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
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
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
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
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
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
	{
		Name = "DionysusAboutZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredGodLoot = "ZeusUpgrade",

		{
			Cue = "/VO/Dionysus_0032",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "So Zag, you met my dad by now, your uncle Zeus? He's cool and loves a feasting, just... be sure to keep him in your thoughts. OK?",
		},
	},
	{
		Name = "DionysusAboutPoseidon01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "PoseidonUpgrade",

		{
			Cue = "/VO/Dionysus_0033",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Hoh-ho{#PreviousFormat}, no way Zag, looking like you got yourself a gift from old Poseidon there? He's quite the catch, but here, hope you saved some room for more!",
		},
	},
	{
		Name = "DionysusAboutAthena01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AthenaUpgrade",

		{
			Cue = "/VO/Dionysus_0036",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey man, I heard Athena had a word with you already yeah? She's cool, though, once you get to know her. Here! I got something that ought to suit her style.",
		},
	},
	{
		Name = "DionysusAboutAphrodite01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AphroditeUpgrade",

		{
			Cue = "/VO/Dionysus_0031",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Whoa{#PreviousFormat}, hey, you must have had a run-in with the lovely Aphrodite, am I right, or am I right, there Zag? But I have {#DialogueItalicFormat}just {#PreviousFormat}the thing to go with her!",
		},
	},
	{
		Name = "DionysusAboutArtemis01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "ArtemisUpgrade",

		{
			Cue = "/VO/Dionysus_0035",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey, Zag, got to tell you, I cannot believe that little Artemis is hanging out with you! She doesn't hang with anybody, man! But I digress, take this!",
		},
	},
	{
		Name = "DionysusAboutAres01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AresUpgrade",

		{
			Cue = "/VO/Dionysus_0034",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You hanging out with Ares, are you, Zag? He's quite the chap, I'll give him that, I'll give him that, and now, I'll give you {#DialogueItalicFormat}this{#PreviousFormat}!",
		},
	},
	{
		Name = "DionysusAboutDemeter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "DemeterUpgrade",

		{
			Cue = "/VO/Dionysus_0155",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Felt a shiver in the air just now, and that can only mean that chilly Demeter decided to give you a little help, there, huh? Or maybe it's just cold, I mean, this is a mountaintop!",
		},
	},
	{
		Name = "DionysusAboutHadesKeepsake01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		RequiredTrait = "HadesShoutKeepsake",
		{
			Cue = "/VO/Dionysus_0220",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey, Zag, uh... I may just be losing it or something here, but isn't that your dad's own blessing that you've got? That's something, man, I didn't know that he was helping you!",
		},
	},
	{
		Name = "DionysusBackstory01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredMinCompletedRuns = 3,

		{
			Cue = "/VO/Dionysus_0040",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Sometimes I have to wonder, man, what's going through your head, I mean, I know you hear me and the others but it's so damn dark down there I can't hear you at all!",
		},
	},
	{
		Name = "DionysusBackstory02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusGift02" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 5 },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },

		{
			Cue = "/VO/Dionysus_0039",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let me tell you something, Zag, I know your dad he's got to be a real handful, I relate to that, you understand me, mate? So you get out of there, and you'll be more than welcome here, with us!",
		},
	},
	{
		Name = "DionysusPostEpilogue02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusPostEpilogue01" },
		{
			Cue = "/VO/Dionysus_0218",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey, back when we had that feast, there, man, I, I hope I didn't, you know, make for any inconveniences or anything down there, did I...?",
		},
	},
	{
		Name = "DionysusPostEpilogue03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusPostEpilogue02" },
		{
			Cue = "/VO/Dionysus_0219",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Zag, I cannot believe your mom's Persephone, that's something else, I got to tell you, man! I never took her for the sort to be all into Underworld stuff!",
		},
	},
	{
		Name = "DionysusAboutGifting01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusGift02", "PoseidonGift02", "AthenaGift02", "AresGift02", "ArtemisGift02", "AphroditeGift02", "DionysusGift02", "DemeterGift02" },
		{
			Cue = "/VO/Dionysus_0190",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You are the talk of the mountain, you know that, man? Good on you, getting on just about everybody's good side up here, I mean, that is a feat, all right!",
		},
	},
	-- #endregion
	-- #region Contextual
	{
		Name = "DionysusPostGiftPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "DionysusAboutOrpheus02",
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
	{
		Name = "DionysusRunProgress01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredMinCompletedRuns = 19,
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },

		{
			Cue = "/VO/Dionysus_0037",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I got to hand it to you, Zag, you don't back down, you don't ever back down, what is this, like the twentieth time that you've attempted to escape?",
		},
	},
	{
		Name = "DionysusRunProgress02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredRoomLastRun = "B_Intro",
		RequiredFalseRoomLastRun = "C_Intro",
		RequiredBiome = "Tartarus",
		RequiredMaxRunsCleared = 2,
		{
			Cue = "/VO/Dionysus_0038",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You're getting somewhere, getting somewhere, man, I understand you made it up to Asphodel before, now that is progress, keep it up, you keep on going, yeah?",
		},
	},
	{
		Name = "DionysusRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiresLastRunCleared = true,
		{
			Cue = "/VO/Dionysus_0122",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ah, Zag, what {#DialogueItalicFormat}happened {#PreviousFormat}last time, man? It seemed like you were rather close, but then, we couldn't see you anymore from here, and now you're back? Well, give another go!",
		},
	},
	{
		Name = "DionysusRunCleared02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusRunCleared01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiresLastRunCleared = true,
		{
			Cue = "/VO/Dionysus_0152",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Want you to know something, here, man. It's been a bit of a long haul, but you are getting closer to the surface, and you'll get there someday, and we're with you, however long it takes, OK?",
		},
	},
	{
		Name = "DionysusAboutNectar01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredLifetimeResourcesSpentMin = { GiftPoints = 60 },
		RequiredMinAnyTextLines = { TextLines = { "CerberusGift01", "ZeusGift01", "PoseidonGift01", "AthenaGift01", "AphroditeGift01", "AresGift01", "ArtemisGift01", "HermesGift01", "DemeterGift01", "MegaeraGift01", "ThanatosGift01", "AchillesGift01", "NyxGift01", "SkellyGift01", "SisyphusGift01", "PatroclusGift01", "EurydiceGift01", "DusaGift01", "HypnosGift01", "HadesGift01" }, Count = 8 },
		RequiredTextLines = { "DionysusGift04" },
		{
			Cue = "/VO/Dionysus_0186",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You, man, must be mates with just about {#DialogueItalicFormat}everybody {#PreviousFormat}down there, by now, yeah? Doling out Nectars left and right, just livening the place right up!",
		},
	},
	{
		Name = "DionysusLowHealth01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Dionysus_0065",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Whoaa Zag, man, you look positively knackered, you be sure and take it easy if you can out there, all right? Here, maybe this'll help!",
		},
	},
	{
		Name = "DionysusLowHealth02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Dionysus_0066",
			Emote = "PortraitEmoteDepressed",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Oof{#PreviousFormat}, Zag, look, I know you're not in a good spot right now, you must be really out of sorts! Though maybe {#DialogueItalicFormat}this {#PreviousFormat}might numb the pain a bit!",
		},
	},
	{
		Name = "DionysusLowHealth03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Dionysus_0205",
			Emote = "PortraitEmoteDepressed",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Eugh{#PreviousFormat}, you're a proper mess right now, got to be candid with you, man, you're bleeding everywhere, get it together, yeah?",
		},
	},
	{
		Name = "DionysusLowHealth04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Dionysus_0206",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Now what's the matter, down there, Zag, it's like you've been up feasting day and night, you're barely standing, everything OK?",
		},
	},
	{
		Name = "DionysusLowHealth05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Dionysus_0207",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Ooh{#PreviousFormat}, you're in no shape to be going off, what happened to you, there? Well, here, you know what? Let me see if we can get you back into it, man!",
		},
	},
	{
		Name = "DionysusLegendaryPickUp01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Dionysus_0123",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Oh-hoh{#PreviousFormat}, Zag, have I got something special here for you, I mean {#DialogueItalicFormat}this {#PreviousFormat}here is top-notch stuff, {#DialogueItalicFormat}even {#PreviousFormat}among the top-notch stuff I have to give, just look at this!",
		},
	},
	{
		Name = "DionysusLegendaryPickUp01_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DionysusFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Dionysus_0124",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Look, man, I am feeling generous right now, know what I mean? And so, here's something {#DialogueItalicFormat}extra {#PreviousFormat}potent for you, ought to keep you going for a while longer than you're used to, there!",
		},
	},
	-- #endregion
}

mod.AddHermesDeliveredDialogues(newHermesDeliveredDialogues,
	{ Hermes = { "Modsnikkelmhadesbiomesdionysus", "ZagreusField" } }, { Dionysus_ = "Modsnikkelmhadesbiomesdionysus_" },
	{ Dionysus_ = "ModsNikkelMHadesBiomes_Portrait_Dionysus_Default_01" }, "/SFX/DionysusBoonWineLaugh",
	{ Dionysus = { Speaker = "NPC_Dionysus_01", NarrativeContextArt = "DialogueBackground_Olympus" } })
-- #endregion
