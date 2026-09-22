local newPortedInteractTextLines = {
	-- #region Priority Storylines
	{
		Name = "ArtemisAboutOlympianReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
		{
			Cue = "/VO/ZagreusField_4341",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 2.44 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"Found you, Huntress, here. In the name of Hades! Olympus, this is an official message! Especially for you, Lady Artemis!"
		},
		{
			Cue = "/VO/Artemis_0225",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"Some kind of special message for me...! Oh, looks like there's one for everybody on Olympus, then. Felt rather special for a moment, there! And now you're making me check in with all the others. Great!"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ArtemisPostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutOlympianReunionQuest01",
		},
		PlayOnce = true,
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0226",
			PreLineThreadedFunctionName = "PlayEmoteAnimFromSource",
			PreLineThreadedFunctionArgs = { Emote = "PortraitEmoteSparkly", WaitTime = 7.0 },
			UseEventEndSound = true,
			Text =
			"Have to say, I had a pretty decent time with everybody at our little visit recently! Met you, Uncle Hades, even great Achilles! Still don't quite appreciate you tricking us, but {#DialogueItalicFormat}eh{#PreviousFormat}! I can get over it eventually. Anyway, you still could use assistance from me, right?"
		},
	},
	{
		Name = "ArtemisFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutOlympianReunionQuest01",
		},
		PlayOnce = true,
		-- Always allow, to not block this if Hermes wasn't met in a modded run yet
		-- RequiredTextLines = { "AthenaFirstPickUp", },
		-- Disabled as you meet her in person
		-- {
		-- 	Cue = "/VO/ZagreusField_0786",
		-- 	Portrait = "Portrait_Zag_Default_01",
		-- 	Speaker = "CharProtag",
		-- 	PreLineThreadedFunctionName = "PowerWordPresentation",
		-- 	PreLineThreadedFunctionArgs = { WaitTime = 5.72 },
		-- 	PostLineAnim = "ZagreusInteractEquip",
		-- 	PostLineAnimTarget = "Hero",
		-- 	PostLineFunctionName = "BoonInteractPresentation",
		-- 	Text =
		-- 	"There's only one heavenly archer I know of. Well, several, really. Anyway! In the name of Hades! Olympus? I accept this message."
		-- },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0011",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"I heard about you. Look, I'm not like all the others on Olympus. The power of the hunt helps keep me company, so... maybe it'll help you, too!"
		},
	},
	-- #endregion
	-- #region Misc (Inserted in a group after priority dialogues above)
	{
		Name = "ArtemisAboutZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "ArtemisAboutOlympianReunionQuest01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "ZeusUpgrade",
		{
			Cue = "/VO/Artemis_0034",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ah, good old Father Zeus, he must have blessed you with his lightning bolts, did he? Always looking out for everyone."
		},
	},
	{
		Name = "ArtemisAboutPoseidon01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "PoseidonUpgrade",
		{
			Cue = "/VO/Artemis_0035",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Uncle Poseidon blessed you, didn't he. To think that big, fat oaf is your own father's brother. I'm told to be respectful near him, but it's hard."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ArtemisAboutAthena01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AthenaUpgrade",
		{
			Cue = "/VO/Artemis_0033",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You met Athena earlier, I guess? I'd never trade my bow for all that pomp and armor, but... I guess to each her own."
		},
	},
	{
		Name = "ArtemisAboutAres01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "AresGift02" },
		RequiredGodLoot = "AresUpgrade",
		{
			Cue = "/VO/Artemis_0036",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're pretty close with Ares, aren't you? And here they said it couldn't be done. If I were you I'd watch myself with him."
		},
	},
	{
		Name = "ArtemisAboutAphrodite01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AphroditeUpgrade",
		{
			Cue = "/VO/Artemis_0037",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So Aphrodite reached you first, did she? Sounds exactly like something she'd do. She has a knack for trouble. So, let's just stay focused, here!"
		},
	},
	{
		Name = "ArtemisAboutDionysus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DionysusGift02" },
		RequiredGodLoot = "DionysusUpgrade",
		{
			Cue = "/VO/Artemis_0038",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"That lush and lecher, Dionysus, counts you as a friend? I'm hoping that there must be some mistake, yeah, Zagreus?"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ArtemisAboutHermes01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 3 },
		RequiredGodLoot = "HermesUpgrade",
		{
			Cue = "/VO/Artemis_0240",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You seem particularly light on your feet, there, Zagreus. I'd figure Hermes, himself, was speeding you along, except I've not seen him about in... been a while, really."
		},
	},
	{
		Name = "ArtemisAboutDemeter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "DemeterUpgrade",
		{
			Cue = "/VO/Artemis_0191",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So even Demeter's become involved in this! Didn't think she would. Though you'll be glad she did! Provided you stay on her warm and fuzzy side, of course. Working on that, myself!"
		},
	},
	{
		Name = "ArtemisBackstory01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp", "ArtemisGift01" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 5 },
		RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Artemis_0039",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Something's troubled me a little, about you. You fight so desperately. At first I thought you simply lacked in patience. But now I see it's urgency that drives you. What is it that you're after, really...?"
		},
	},
	{
		Name = "ArtemisRunProgress01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiredMinDepth = 8,
		{
			Cue = "/VO/Artemis_0040",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Let's see. You blundered headlong into danger for the past six chambers or more. And you made such a racket I could almost hear it from Olympus. I have to say, your hunting skills are rather unconventional."
		},
	},
	{
		Name = "ArtemisRunProgress02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Artemis_0141",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'm with you every step till you arrive here, Zagreus. Then I will probably ignore you like the rest. Just warning you ahead of time, all right?"
		},
	},
	{
		Name = "ArtemisAboutVermin01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiredRoomLastRun = "D_Intro",
		{
			Cue = "/VO/Artemis_0189",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Say, were you hunting vermin near the surface lately, Zagreus? That's practically just like the real thing! It must have been a thrill!"
		},
	},
	{
		Name = "ArtemisAboutVermin02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutVermin01" },
		RequiredRoomLastRun = "D_Intro",
		RequiredKills = { RatThug = 10, RatThugElite = 3, Crawler = 20, CrawlerMiniBoss = 1 },
		{
			Cue = "/VO/Artemis_0190",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've become a right accomplished vermin hunter, Zagreus! Maybe you'll get to use those skills against worthier creatures soon enough."
		},
	},
	{
		Name = "ArtemisVsMeg01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiredRunsCleared = 0,
		ConsecutiveDeathsInRoom = {
			Name = "A_Boss01",
			Count = 2,
		},
		{
			Cue = "/VO/Artemis_0041",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"That Fury down in Tartarus has been a real problem, hasn't she. I see the huntress instinct in her. She thinks she knows your weaknesses. Don't let yourself become predictable."
		},
	},
	{
		Name = "ArtemisVsAchilles01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp", "AchillesGift02", },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete", "ArtemisVsAchilles02" },
		{
			Cue = "/VO/Artemis_0042",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, I once heard Lord Hades has in his employ the greatest hero of the Trojan War, you happen to know anything about that? I'm kind of a fan. You see Achilles, tell him he's the best for me!"
		},
	},
	{
		Name = "ArtemisVsAchilles02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisGift01", "AchillesGift03" },
		{
			Cue = "/VO/Artemis_0043",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So, I have heard that Achilles, himself, taught you how to fight! No wonder you can hold your own down there, that is amazing...! You be sure to honor him from time to time, got it?"
		},
	},
	{
		Name = "ArtemisPostFlashback01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp", "ArtemisGift02" },
		RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Artemis_0044",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Living on Olympus here, I'm surrounded by my family, but I always felt alone. I know that's not the same as your experience, but, I'm just saying I relate to what you're going through."
		},
	},
	{
		Name = "ArtemisHighAffinity01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisGift02", },
		{
			Cue = "/VO/Artemis_0045",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I think you might enjoy it on Olympus, there's... a lot of feasting here, I guess, and the air is cool and crisp, and it's much brighter than it is down there. Sounds like a dream, right?"
		},
	},
	{
		Name = "ArtemisHighAffinity02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisGift04", },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Artemis_0046",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I hope that once you make it to Olympus we'll go hunting sometime, you and I, you know? I like being on my own and all, but it's been nice, talking to you like this."
		},
	},
	{
		Name = "ArtemisHighAffinity03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisGift07", },
		{
			Cue = "/VO/Artemis_0215",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I grow so tired of the others here, you know? Much rather be out with the woodland nymphs than with these gods upon this mountaintop. You must know what it's like."
		},
	},
	{
		Name = "ArtemisAboutCallisto01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisHighAffinity01", },
		{
			Cue = "/VO/Artemis_0216",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Not everybody on Olympus is a total disappointment, Zagreus. Why, someday maybe you could meet Callisto, she goes hunting with me all the time! Bet you don't see many woodland nymphs down there."
		},
	},
	{
		Name = "ArtemisAboutCallisto02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto01", "ArtemisGift03", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 3 },
		{
			Cue = "/VO/Artemis_0217",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey Zagreus, that Nectar you sent? Callisto and the nymphs and I, we popped it open recently, and it was really good! Had us positively frolicking about. So, thanks!"
		},
	},
	{
		Name = "ArtemisAboutCallisto03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto02", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 3 },
		{
			Cue = "/VO/Artemis_0218",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You must have a friend or two, don't you? It's hard being alone all of the time. At least I have Callisto and the other nymphs, and... I have you! A distant friend is still a friend, isn't that right?"
		},
	},
	{
		Name = "ArtemisAboutCallisto04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto03", "ArtemisGift04", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 2 },
		{
			Cue = "/VO/Artemis_0219",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hope you don't mind, I told Callisto all about you recently! Don't worry, I was quite discreet about it, the two of us were on the hunt, not like I just shouted out your story from the mountaintops!"
		},
	},
	{
		Name = "ArtemisAboutCallisto05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto04", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 3 },
		{
			Cue = "/VO/Artemis_0220",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Zagreus, if only you could turn yourself into a woodland creature and just fly or burrow out of there! My Callisto, she can turn into a bear, you ever seen those? Monstrous, furry things, quite huggable, if they don't kill you first!"
		},
	},
	{
		Name = "ArtemisAboutCallisto06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto05", "ArtemisGift05", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 3 },
		{
			Cue = "/VO/Artemis_0221",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've never even seen the woods, have you? I hope you do, someday. You could meet Callisto and the others! It's quite beautiful, and green, and calm, it's... anyway."
		},
	},
	{
		Name = "ArtemisAboutCallisto07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto06", "ArtemisGift06", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 3 },
		{
			Cue = "/VO/Artemis_0222",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Don't know what it is about you, Zagreus, but I feel like I can be me with you, you know? Maybe it's that you don't constantly talk over me like everybody else, besides Callisto and the nymphs I guess. Not that I can even hear you, but, you know what I mean, right?"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ArtemisAboutZagreus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp", "NyxBackstory01", "ArtemisGift01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Artemis_0208",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your name, it means {#DialogueItalicFormat}'great hunter'{#PreviousFormat}, Zagreus! I guess your mother Nyx must have expected someday that you'd pick up a few pointers from myself!"
		},
	},
	{
		Name = "ArtemisRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiresLastRunCleared = true,
		{
			Cue = "/VO/Artemis_0188",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, hold a moment, Zagreus, I could have sworn... you were so close, before, but now you're back? Ah, must have tripped up just when victory was close at hand, it happens all the time. We'll get you out of there, you'll see!"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ArtemisLowHealth01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiredMaxHealthFraction = 0.20,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Artemis_0071",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, you all right there, Zagreus? Wouldn't do to have you die on me just moments after meeting here like this."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ArtemisLowHealth02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiredMaxHealthFraction = 0.20,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Artemis_0072",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteSurprise",
			Text =
			"{#DialogueItalicFormat}Oh{#PreviousFormat}! Look at you, you're hurt there pretty bad, but, just stay focused on the hunt, and it'll help to keep the pain at bay."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ArtemisLowHealth03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Artemis_0209",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Look, I'm just goddess of the hunt, not medicine, so... I don't know if this is going to help right now, but, here!"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ArtemisLowHealth04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Artemis_0210",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your hunt has evidently not been going very well so far, I see. Though, maybe we can still turn it around."
		},
	},
	{
		Name = "ArtemisLowHealth05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		RequiredMaxHealthFraction = 0.20,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Artemis_0211",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Well, one good thing about all of the blood you've lost is it was even easier to track you down this time!"
		},
	},
	{
		Name = "ArtemisLegendaryPickUp01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Artemis_0031",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"All right, get ready for this, Zagreus, because I seldom share the greatest of my hunting secrets like I am about to."
		},
	},
	{
		Name = "ArtemisLegendaryPickUp02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Artemis_0032",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"All right, no need to keep on toying with your prey. Here comes one of my finest blessings, {#DialogueItalicFormat}now{#PreviousFormat}!"
		},
	},
	{
		Name = "ArtemisLegendaryPickUp03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Artemis_0170",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I don't reveal my greatest hunting techniques for just anybody, Zagreus, so you better appreciate what you're about to get, and use it to go far!"
		},
	},
	{
		Name = "ArtemisLegendaryPickUp04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Epic",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Artemis_0171",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How about we not take any chances this time, Zagreus? So here, this is the best I've got. You better not waste it!"
		},
	},
	-- #endregion
	-- #region Misc/No Priority
	{
		Name = "ArtemisMiscPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "ArtemisAboutZeus01",
			CreateNewPriorityGroup = true,
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0013",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The dead must make a rather easy target, wouldn't you say? Let's see what you can do to them, given your choice of these."
		},
	},
	{
		Name = "ArtemisMiscPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		Priority = true,
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Artemis_0012",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey. You're not alone. You're not alone down there, OK? Here, let me show you."
		},
	},
	{
		Name = "ArtemisMiscPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0014",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You busy, Zagreus? Thought maybe I could interest you in some of these old hunting tricks of mine."
		},
	},
	{
		Name = "ArtemisMiscPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0015",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How fares the hunt this time around, OK? I bet it could be better, so, {#DialogueItalicFormat}erm{#PreviousFormat}, here! Maybe this'll help."
		},
	},
	{
		Name = "ArtemisMiscPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0016",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Let's take a little hunting expedition, yeah? You'll do most of the work, but hey, I'll be with you in spirit!"
		},
	},
	{
		Name = "ArtemisMiscPickup07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0017",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Sorry you're still stuck down there. Sometimes I feel stuck myself, but, a good hunt always sets me straight."
		},
	},
	{
		Name = "ArtemisMiscPickup08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0018",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"When I am on the hunt, my mind is clear, and nothing stands between me and my target. Though, have a blessing just in case you can't relate!"
		},
	},
	{
		Name = "ArtemisMiscPickup09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		Priority = true,
		RequiredTextLines = { "ArtemisGift02" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0019",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'd love to know about your life down there. I'll try and help you live through it this time so that way you can tell me?"
		},
	},
	{
		Name = "ArtemisMiscPickup10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0020",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The wretches whom you face down there have died already, sometimes more than once. Should make for easy targets, right?"
		},
	},
	{
		Name = "ArtemisMiscPickup11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0021",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I've never come across a target I couldn't take down. I expect the same of you, you hear me? Hopefully you hear me."
		},
	},
	{
		Name = "ArtemisMiscPickup12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0022",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Good hunting, Zagreus! The sooner you get out of there the sooner you can save me from my insufferable relatives. Please?"
		},
	},
	{
		Name = "ArtemisMiscPickup13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0023",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, Zagreus, good luck out there, this time. I'd tell you {#DialogueItalicFormat}'may your aim be true' {#PreviousFormat}but I can guarantee it, actually."
		},
	},
	{
		Name = "ArtemisMiscPickup14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp", "ArtemisGift04" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0024",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The hunt requires utter concentration, so, I'll leave you to it, and... just watch your every move in silence over here..."
		},
	},
	{
		Name = "ArtemisMiscPickup15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		PlayOnce = true,
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0025",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You want to make it out of there, you... don't have to listen to a word I say, to be quite honest, but... my huntress blessings ought to help."
		},
	},
	{
		Name = "ArtemisMiscPickup16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0026",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Well, Zagreus, you getting out of there this time, or am I going to have to keep on hunting by myself for the time being? Probably?"
		},
	},
	{
		Name = "ArtemisMiscPickup17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp", "ArtemisGift06" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0027",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Looks to me like you could use a little help, so I'll just have a look in my big bag of blessings here, and, {#DialogueItalicFormat}oh{#PreviousFormat}! Here's just the thing."
		},
	},
	{
		Name = "ArtemisMiscPickup18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0028",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The hunt comes down to kill-or-be-killed. Except for us immortals, who have to live with our shame, which is worse?"
		},
	},
	{
		Name = "ArtemisMiscPickup19",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0029",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Those wretched things harassing you throughout that Underworld just won't give up, will they? Well, just keep killing them, I guess!"
		},
	},
	{
		Name = "ArtemisMiscPickup20",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0030",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Need a hunting partner, Zagreus? Not that I'm able to join you myself down there, or even hear you respond for that matter, but, anyway, here."
		},
	},
	-- relationship improved
	{
		Name = "ArtemisMiscPickup21",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisGift01", },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0065",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Zagreus, it's me! I'm here to join the hunt with you again. Let's show them what we can do."
		},
	},
	{
		Name = "ArtemisMiscPickup22",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisGift02", },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0066",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hello again, you ready for this hunt? Me, I've been looking forward since last time, so, let's get on with it."
		},
	},
	-- shorter acknowledgments
	{
		Name = "ArtemisMiscPickup23",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0002",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Stay on your guard, tread lightly, and all that."
		},
	},
	{
		Name = "ArtemisMiscPickup24",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0003",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Keep a sharp eye out there, won't you?"
		},
	},
	{
		Name = "ArtemisMiscPickup25",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0004",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Good hunting down there, Zagreus."
		},
	},
	{
		Name = "ArtemisMiscPickup26",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0005",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What are you hunting this time, I wonder."
		},
	},
	{
		Name = "ArtemisMiscPickup27",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0006",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'll be looking out for you. If you don't mind of course."
		},
	},
	{
		Name = "ArtemisMiscPickup28",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0007",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Remember, Zagreus, kill-or-be-killed."
		},
	},
	{
		Name = "ArtemisMiscPickup29",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0008",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "How about I join you for this hunt, OK?"
		},
	},
	{
		Name = "ArtemisMiscPickup30",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0009",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey, you take care of yourself, all right?"
		},
	},
	{
		Name = "ArtemisMiscPickup31",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0010",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Got you something I bet you could use."
		},
	},
	{
		Name = "ArtemisMiscPickupExtra01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0139",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The finer points of hunting are not easy to communicate, though you're learning from experience, at least!"
		},
	},
	{
		Name = "ArtemisMiscPickupExtra02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0140",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My senses sure are going to be sharp if I keep trying to keep up with you like this in all that dark down there."
		},
	},
	{
		Name = "ArtemisMiscPickupExtra03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0143",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "A good, clean shot is all it takes, most of the time!"
		},
	},
	{
		Name = "ArtemisMiscPickupExtra04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0144",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You getting anywhere down there yet, Zagreus?"
		},
	},
	{
		Name = "ArtemisMiscPickupExtra05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0145",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What are you waiting for, let's get to hunting, then!"
		},
	},
	{
		Name = "ArtemisMiscPickupExtra06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0146",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Not much of a hunt when your prey knows exactly where you are, but it'll do!"
		},
	},
	{
		Name = "ArtemisMiscPickupExtra07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp", "ArtemisGift02" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0147",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I hope your every strike cuts to the vital bits of all your prey, there, Zagreus."
		},
	},
	{
		Name = "ArtemisMiscPickupExtra08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0148",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I brought some hunting gear for you to try, if you could give me your attention, Zagreus?"
		},
	},
	{
		Name = "ArtemisMiscPickupExtra09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0149",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All right, Zagreus, catch your breath, decide, and then what say we get you out of hell maybe?"
		},
	},
	{
		Name = "ArtemisMiscPickupExtra10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp", "ArtemisGift03" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0150",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What are we hunting this time, Zagreus? Don't tell me wretched dead, again?"
		},
	},
	{
		Name = "ArtemisMiscPickupExtra11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp", "ArtemisGift07" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0151",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You see how easily I tracked you down? Unless you went out of your way for me, that is?"
		},
	},
	{
		Name = "ArtemisMiscPickupExtra12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp", "ArtemisGift01" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0152",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I have a Boon for you, here, Zagreus, though just be sure you don't embarrass me."
		},
	},
	{
		Name = "ArtemisMiscPickupExtra13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0153",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Well, perfect timing, Zagreus, now stock up and head out."
		},
	},
	{
		Name = "ArtemisMiscPickupExtra14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0154",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You want to make it out of there, my Boons are just about the only way to go."
		},
	},
	{
		Name = "ArtemisMiscPickupExtra15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0155",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Don't you let your father or let {#DialogueItalicFormat}anybody {#PreviousFormat}push you around, Zagreus."
		},
	},
	{
		Name = "ArtemisMiscPickupExtra16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = GameData.ArtemisBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Artemis_0156",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Bet I can help you break out of your father's realm in no time, Zagreus!"
		},
	},
	{
		Name = "ArtemisMiscPickupRare01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Artemis_0162",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Decided I would pack you something extra for this hunt, if you can handle it!"
		},
	},
	{
		Name = "ArtemisMiscPickupRare02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Artemis_0163",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Enough toying around with our prey, there, Zagreus. What do you say we finish it, this time?"
		},
	},
	{
		Name = "ArtemisMiscPickupRare03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Artemis_0164",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I know it must be such a struggle for you, Zagreus, so here! In case this helps."
		},
	},
	{
		Name = "ArtemisMiscPickupRare04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Artemis_0165",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "A great hunter ought to have great tools, Zagreus, so here! Please allow me."
		},
	},
	{
		Name = "ArtemisMiscPickupRare05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		RequiredTextLines = { "ArtemisFirstPickUp", "ArtemisGift03" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Artemis_0166",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Wish I could hunt with you myself, but here's the next best thing, all right?"
		},
	},
	{
		Name = "ArtemisMiscPickupAboutCallisto01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto02", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 4 },
		{
			Cue = "/VO/Artemis_0142",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You know how long it took Callisto to become a master of the hunt? I'm sure you can still learn a thing or two!"
		},
	},
	{
		Name = "ArtemisMiscPickupAboutCallisto02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto03", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 4 },
		{
			Cue = "/VO/Artemis_0157",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I was about to head out with Callisto for a hunt, though I can spare you a quick Boon, I guess!"
		},
	},
	{
		Name = "ArtemisMiscPickupAboutCallisto03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto04", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 4 },
		{
			Cue = "/VO/Artemis_0158",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I have to meet Callisto soon, but it won't take me but a moment here to get you on your way!"
		},
	},
	{
		Name = "ArtemisMiscPickupAboutCallisto04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto03", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 4 },
		{
			Cue = "/VO/Artemis_0159",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Someday perhaps you'll join me and Callisto for a hunt! But as for now..."
		},
	},
	{
		Name = "ArtemisMiscPickupAboutCallisto05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto07", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 4 },
		{
			Cue = "/VO/Artemis_0160",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Greetings to you from the forest! Callisto and the woodland nymphs say hi!"
		},
	},
	{
		Name = "ArtemisMiscPickupAboutCallisto06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ArtemisMiscPickup03",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ArtemisAboutCallisto02", },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.ArtemisAboutCallistoTextLines, Count = 4 },
		{
			Cue = "/VO/Artemis_0161",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You'd make a real asset on the hunt, I think. Not that Callisto and I need assistance, though."
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(newPortedInteractTextLines, "NPC_Artemis_Field_01", "InteractTextLineSets",
	{
		TextLinePriorityType = "InteractTextLinePriorities",
		VoiceBankMappings = { Artemis = { "Modsnikkelmhadesbiomesartemis", "ZagreusField" } },
		CueMappings = { Artemis_ = "Modsnikkelmhadesbiomesartemis_" },
		PortraitMappings = { Artemis_ = "ModsNikkelMHadesBiomes_Portrait_Artemis_Default_01" },
		IsWorldNpc = true,
	}
)
