local newPortedInteractTextLines = {
	{
		Name = "ZeusFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		-- Always allow, to not block this if Hermes wasn't met in a modded run yet
		-- RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/ZagreusField_0776",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 4.05 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text = "Is this really him? OK. In the name of Hades! Olympus! I accept this message."
		},
		{
			Cue = "/VO/Zeus_0133",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"Greetings there, young man! Look, your father's always been rather difficult, and he's not so much as called in quite some time. You'll have a better home where you belong, here on Olympus! And to help you on your journey, have my blessing."
		},
	},
	-- #region High-Priority Storylines/Quests (Inserted in a group after ZeusFirstPickUp (above))
	{
		Name = "ZeusAboutDemeter03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "ZeusFirstPickUp",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		RequiredFalseTextLines = { "ZeusAboutDemeter01" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredGodLoot = "DemeterUpgrade",
		{
			Cue = "/VO/Zeus_0204",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I gather Lady Demeter's already got her frigid hold on you, certainly not the warmest member of the clan, now, is she? But do be patient with her, she's been through a lot."
		},
	},
	{
		Name = "ZeusAboutDemeter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutDemeter03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "DemeterAboutZeus01", "DemeterAboutFather01" },
		RequiredFalseTextLinesLastRun = { "ZeusAboutDemeter03", "DemeterAboutZeus01", "DemeterAboutFather01" },
		{
			Cue = "/VO/Zeus_0186",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My good sister Demeter already tried to poison you against me, as I understand, young man? Oh, {#DialogueItalicFormat}foster{#PreviousFormat}-sister she prefers I say, loath as she is to accept her role as part of our great family."
		},
	},
	{
		Name = "ZeusAboutDemeter02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutDemeter03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusAboutDemeter01", "DemeterAboutPersephone02" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0187",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			FontSize = 26,
			Text =
			"You must forgive the Lady Demeter her scornfulness, Nephew, for she is still recovering after the sudden disappearance of her daughter, though it was quite some time ago the girl, {#DialogueItalicFormat}poof{#PreviousFormat}! Just vanished. I try to lighten up the mood around it every now and then, but {#DialogueItalicFormat}no{#PreviousFormat}, a sore spot, still!"
		},
	},
	{
		Name = "ZeusAboutPersephone01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutDemeter03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusAboutDemeter02", "DemeterAboutPersephone03", "ZeusGift01" },
		RequiredFalseTextLinesLastRun = { "ZeusAboutDemeter02" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0188",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			FontSize = 26,
			Text =
			"Poor Demeter, young man. We still wonder what became of her fair daughter. Ran away with mortals, there, perhaps? Some of the tales, even more preposterous. Don't go believing everything you hear, and do be sensitive about the subject, hm? Demeter, she's been through quite enough."
		},
	},
	{
		Name = "ZeusAboutPersephone02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutDemeter03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusAboutPersephone01", "DemeterAboutPersephone04" },
		RequiredAnyTextLines = { "PersephoneMeeting05_A", "PersephoneMeeting05_B" },
		RequiredFalseTextLinesLastRun = { "ZeusAboutPersephone01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0189",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"The Lady Demeter still prattles on about her missing girl, Zagreus. But I want you to understand something, all right? She's gone. We all have grieved. Perhaps Demeter shall finally accept what has occurred, and we can move forward, having grown stronger as a family."
		},
	},
	{
		Name = "ZeusAboutOlympianReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutDemeter03",
		},
		PlayOnce = true,
		RequiredTextLines = { "ZeusFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
		{
			Cue = "/VO/ZagreusField_4336",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 2.63 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"Sure hope this works.... In the name of Hades! Olympus, this is an official message! For you, in all your splendor, Lord Uncle Zeus."
		},
		{
			Cue = "/VO/Zeus_0219",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"My, what is this you have for me, young man? Appears to be a message of some sort, bearing my thunder sigil! Though, there's one for everybody on Olympus? Have they as yet received their own? I must know what it says... it's from your father, who else could it be? I'd better check on this!"
		},
	},
	{
		Name = "ZeusAboutOlympianReunionQuest02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutDemeter03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusAboutOlympianReunionQuest01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0220",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I eagerly await learning some more about the contents of that fascinating message you had sent up here, Nephew! How mysterious, indeed. I'll be keeping an eye on all the others that come in!"
		},
	},
	{
		Name = "ZeusPostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutDemeter03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0221",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			FontSize = 26,
			Text =
			"I have to tell you, Zagreus, that it was wonderful to meet with you, at last! We were so pleased to learn Persephone was safe! And Nyx, why, she's as stunning as they say. Shouldn't have lied to us about your parentage, but, I know things get complicated, here, and that what's done is done!"
		},
	},
	-- #endregion
	-- #region Storylines (Inserted in a group after the priority dialogues above)
	{
		Name = "ZeusAboutPoseidon01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "ZeusAboutDemeter03",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredGodLoot = "PoseidonUpgrade",
		{
			Cue = "/VO/Zeus_0037",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Poseidon sought you out already, hm? My boastful brother gets on with Lord Hades even worse than I, so let me put a little spark into his storms for you!"
		},
	},
	{
		Name = "ZeusAboutAthena01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AthenaUpgrade",
		{
			Cue = "/VO/Zeus_0035",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My brave daughter Athena beat me to you this time, has she? No matter, with her blessing and my own, you shall be nigh unstoppable!"
		},
	},
	{
		Name = "ZeusAboutAphrodite01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AphroditeUpgrade",
		{
			Cue = "/VO/Zeus_0040",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Has lovely Aphrodite put you in a trance already, Zagreus? Or might I offer you the blessing of Olympus to intensify her catastrophic power with my own?"
		},
	},
	{
		Name = "ZeusAboutArtemis01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "ArtemisUpgrade",
		{
			Cue = "/VO/Zeus_0039",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So my elusive Artemis has shown you favor, has she? The little scamp, she seldom shows respect to anyone, not even me! But I'll enhance her blessing nonetheless."
		},
	},
	{
		Name = "ZeusAboutAres01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "AresGift01" },
		RequiredGodLoot = "AresUpgrade",
		{
			Cue = "/VO/Zeus_0038",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Getting along with Ares, are you, Nephew? {#DialogueItalicFormat}Heh{#PreviousFormat}. Would that you were my son instead of he, but no, I jest, I jest! Here, take my blessing, please!"
		},
	},
	{
		Name = "ZeusAboutDionysus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DionysusGift01" },
		RequiredGodLoot = "DionysusUpgrade",
		{
			Cue = "/VO/Zeus_0036",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It pleases me to know, young man, that you and Dionysus have been getting on so well. He could use a level-headed friend, and you could use my blessing!"
		},
	},
	{
		Name = "ZeusAboutHermes01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HermesFirstPickUp", "HermesGift01" },
		RequiredGodLoot = "HermesUpgrade",
		{
			Cue = "/VO/Zeus_0203",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Hmm{#PreviousFormat}! You've traveled rather quickly to this point... which reminds me, I've not seen swift Hermes anywhere of late! The rascal's likely dallying about!"
		},
	},
	{
		Name = "ZeusAboutHades01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusGift01" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 3 },
		RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0041",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Nephew, I have somewhat of a favor I must ask. You tell your father, if you so happen to run into him again, that his brother Zeus forgives him, and would like to reconnect, and welcome him into the family again. You tell him for me, hm?"
		},
	},
	{
		Name = "ZeusBackstory01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "Flashback_Mother_01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0046",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So you are son to Hades by that Nyx, the night-goddess, is that correct, Nephew...? Well I suppose she's closest to a queen as your lord father's like to find down there. I tried to match him up with some more wholesome types, but no, and here we are."
		},
	},
	{
		Name = "ZeusBackstory02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusBackstory01", },
		{
			Cue = "/VO/Zeus_0047",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"After we learned about your plight and your existence from the goddess Nyx, all of us on Olympus rallied to assist you just as best we could. A family such as mine protects its own!"
		},
	},
	{
		Name = "ZeusBackstory03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "ZeusGift01", "PoseidonGift01" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 1 },
		{
			Cue = "/VO/Zeus_0043",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My brothers Hades and Poseidon once fought bravely by my side, you know that, don't you, Nephew? We prevailed against the Titans and established law upon the earth. Your father then descended to the land of death, and we've not seen much of each other since."
		},
	},
	{
		Name = "ZeusBackstory04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "ZeusGift01" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 7 },
		{
			Cue = "/VO/Zeus_0044",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your father must have told you that his governance over the Underworld is due more to the weaving of the Fates than by his choice. Admittedly, he got the short end of the stick. Whereas Poseidon and myself, why, we've been doing rather well indeed."
		},
	},
	{
		Name = "ZeusBackstory05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "ZeusGift01" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 4 },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0045",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My brother Hades always was a lonesome man, you know. I pitied him! But I could never quite extract him from his thorny shell. Now he stews resentfully down there. You needn't bear the brunt of his frustrations."
		},
	},
	{
		Name = "ZeusBackstory06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 1 },
		RequiredMinRunsCleared = 1,
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0042",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Old Hades has continued to ignore my every effort to reach out to him, young man. Ah well, but he is obstinate, indeed. You are wise to seek your family's better half."
		},
	},
	{
		Name = "ZeusAboutNyx01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusBackstory01", "ZeusGift03" },
		RequiredMinNPCInteractions = { NPC_Nyx_01 = 1 },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0190",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"By the way, Nephew, I hear-tell your mother Nyx is quite the catch! If you'll forgive my saying so, of course. Your father's never had much of a sensibility around companionship, though perhaps this concubine of his brought something out in him, at last!"
		},
	},
	{
		Name = "ZeusRunProgress01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 1 },
		RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredAnyRoomsLastRun = { "B_Boss01", "B_Boss02" },
		{
			Cue = "/VO/Zeus_0048",
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"If and when you reach the surface, Zagreus, you call upon me then and there, all right? I'll personally see to it that you'll be escorted up to Olympus, and your quest shall be complete!"
		},
	},
	{
		Name = "ZeusRunProgress02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusGift01" },
		RequiredSeenRooms = { "C_Boss01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0183",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I know just how much you must want out of there, young man. And I want that as well! {#DialogueItalicFormat}Heh{#PreviousFormat}. Good thing for you, as I get what I want around here. Ask anybody!"
		},
	},
	{
		Name = "ZeusRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp" },
		RequiredMinAnyTextLines = { TextLines = { "AthenaRunCleared01", "PoseidonRunCleared01", "ArtemisRunCleared01", "AphroditeRunCleared01", "AresRunCleared01", "DionysusRunCleared01", "DemeterRunCleared01", "HermesRunCleared01" }, Count = 2 },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiresLastRunCleared = true,
		{
			Cue = "/VO/Zeus_0191",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			-- used for moments when Zag follow-up VO isn't appropriate
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"Nephew, I wanted to mention, it was odd how by every account you'd come quite close to breaking free from there at last, of late... only to be abruptly cut off from our contact! I suppose having suffered some ill fate? Perhaps your realm's guardian, Cerberus, is even deadlier than reputed!"
		},
	},
	{
		Name = "ZeusPostEpilogue02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusPostEpilogue01", "ZeusGift01" },
		{
			Cue = "/VO/Zeus_0222",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your dear mother Persephone is a shrewd woman, Zagreus. More than an equal to your mighty father! I'm pleased to know you've made amends with her, and taken new responsibilities within your House! Naturally, I'll continue to pitch in. And, I hope that we'll meet again, someday!"
		},
	},
	{
		Name = "ZeusPostEpilogue03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusPostEpilogue02", "ZeusGift03" },
		{
			Cue = "/VO/Zeus_0234",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I must say, Nephew! Although it pleases me that we, here, reconnected with your father's realm... just between us, it pleases me even more that you are able to keep sticking it to him! You keep that up, all right?"
		},
	},
	{
		Name = "ZeusPostEpilogue04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "ZeusGift07", "PersephoneGift09", "HadesGift05" },
		{
			Cue = "/VO/Zeus_0223",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Zagreus, you have a clever mother in Persephone! A very clever mother. And a lordly father! They make quite the team, that's evident! True rivals for Hera and me!"
		},
	},
	{
		Name = "ZeusHighAffinity01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusGift03" },
		{
			Cue = "/VO/Zeus_0184",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The lord and ruler of Olympus and the world, why, he needs a healthy sense of humor, no, young man? Now there's an awful lot of spoil-sports out here, can't take even a little joke, well, I know all their mothers, fie on all of them, I say! Let's joke away!"
		},
	},
	{
		Name = "ZeusAboutRumors01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutRumors01" },
		RequiredAnyTextLines = { "ZeusGift06", "ZeusGift06_B" },
		RequiredMinAnyTextLines = { TextLines = { "PoseidonAboutZeus01", "AthenaAboutZeus01", "AphroditeAboutZeus01", "AresAboutZeus01", "ArtemisAboutZeus01", "DionysusAboutZeus01", "DemeterAboutZeus01", "DemeterAboutZeus02", "HermesAboutZeus01", "ChaosAboutZeus01", "ZeusWithDemeter01" }, Count = 5 },
		{
			Cue = "/VO/Zeus_0218",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I suppose even down in the Underworld, you would have heard such tales of me, young man. They're all untrue, {#DialogueItalicFormat}hahaha{#PreviousFormat}! Except the tales of my bravery. Those are completely accurate, though all too modest, in most cases, I must say."
		},
	},
	{
		Name = "ZeusAboutKeepsake01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTrait = "ForceZeusBoonTrait",
		{
			Cue = "/VO/Zeus_0205",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ah, must be my gleaming Thunder Signet that I transferred to you! Why, I could feel its call from all the way up here!"
		},
	},
	{
		Name = "ZeusLowHealth01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Zeus_0075",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Why you look positively dreadful, Zagreus. That place is doing you no favors, I can tell! Luckily, I'll do you favors aplenty!"
		},
	},
	{
		Name = "ZeusLowHealth02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 0,
		{
			Cue = "/VO/Zeus_0076",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You seem in dire need of some assistance, Nephew. So, of course, I dropped what I was doing and then sought you out as quickly as I could!"
		},
	},
	{
		Name = "ZeusLowHealth03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 0,
		{
			Cue = "/VO/Zeus_0208",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Zagreus, you must have left most of your lifeblood back the other way, {#DialogueItalicFormat}hahahaha{#PreviousFormat}! Oh, I jest, I jest! But you look {#DialogueItalicFormat}terrible{#PreviousFormat}."
		},
	},
	{
		Name = "ZeusLowHealth04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp" },
		RequiredMaxHealthFraction = 0.20,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Zeus_0209",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"No, no one likes to die, young man! But since you seem about to any moment now, you keep your head held high, do you hear me?"
		},
	},
	{
		Name = "ZeusLowHealth05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 0,
		{
			Cue = "/VO/Zeus_0210",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Well, let's face it, Zagreus, you are as good as dead right now. But you'll just slosh right back out of the River Styx, and give it a good try again, won't you?"
		},
	},
	{
		Name = "ZeusLowHealth06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp" },
		RequiredMaxHealthFraction = 0.20,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Zeus_0211",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Remember, young man, dying is for mortals. So don't go making a habit of it, there! But if you have to do it, do it fighting, like a {#DialogueItalicFormat}hero {#PreviousFormat}would!"
		},
	},
	{
		Name = "ZeusLegendaryPickUp01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Zeus_0031",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I wonder, Nephew, whether you're prepared as yet to harness the surpassing power I shall grant you now? Don't take this blessing lightly, and may you use it well."
		},
	},
	{
		Name = "ZeusLegendaryPickUp02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "ZeusGift01" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Zeus_0032",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How about, young man, we cease with all the trifling down there and cause a real storm for once? Take now the fiercest of my powers, and you show your no-good father what you're made of!"
		},
	},
	-- #endregion
	-- #region Misc (Inserted in a group after priority dialogues above)
	{
		Name = "ZeusMiscPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "ZeusAboutPoseidon01",
			CreateNewPriorityGroup = true,
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0011",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"We meet again, young man! Yours isn't my affair, I know, and yet I cannot help but take an interest in your plight. Your father cast his lot; he need not take his anger out on you."
		},
	},
	{
		Name = "ZeusMiscPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0012",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hello, young man, and might I offer you a little taste of the heavens themselves? Though, don't go telling your old sulky father I've been spoiling you rotten!"
		},
	},
	{
		Name = "ZeusMiscPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0010",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I and all of us upon Olympus are anticipating your success, dear Nephew! Now let me see if I can't help spur you along."
		},
	},
	{
		Name = "ZeusMiscPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0013",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Well, my nephew, you're admittedly in quite a bind down there, but what is life without its struggles, hm? You'll make it here, eventually, I'm certain."
		},
	},
	{
		Name = "ZeusMiscPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0014",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I like the fire in you, Zagreus, and I have every confidence you'll someday clamber from the shadows there into the light!"
		},
	},
	{
		Name = "ZeusMiscPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0015",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Here on Olympus, Nephew, we take care of one another and support each other, quite unlike how it must be there in your father's grim domain. No wonder you intend to leave!"
		},
	},
	{
		Name = "ZeusMiscPickup07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0016",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'd ask you offer my respects to your lord father, Zagreus, but I suspect you won't have such a chance anytime soon, considering how far you'll come with my support!"
		},
	},
	{
		Name = "ZeusMiscPickup08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0017",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Remember you've as many chances as it takes, young man, to fight your way out of the dark and join us in the splendor of Olympus!"
		},
	},
	{
		Name = "ZeusMiscPickup09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0018",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your grim-faced father's such a spoilsport, Nephew, the way he keeps impeding your escape. Ah, well, just keep at it, hm?"
		},
	},
	{
		Name = "ZeusMiscPickup10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0019",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My greetings, young Nephew, and more importantly, my blessing and my strength be with you as you journey towards your rightful home."
		},
	},
	{
		Name = "ZeusMiscPickup11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0020",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Faith and courage, Zagreus, for each and every one of us upon Olympus is behind you all the way throughout this whole affair."
		},
	},
	{
		Name = "ZeusMiscPickup12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0021",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"What can I say, young man? You may not make your father very proud, but it is just the opposite with me! Now go, get out of there!"
		},
	},
	{
		Name = "ZeusMiscPickup13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0022",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Now, Nephew, how about we put both of our backs into this one, and see to it that you go farther through those depths than you have ever managed yet!"
		},
	},
	{
		Name = "ZeusMiscPickup14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0023",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Know that many mortals ask me for my blessings constantly, and I mean all the time, young Nephew, but for you! You needn't ask at all!"
		},
	},
	{
		Name = "ZeusMiscPickup15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0024",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Far be it from me to raise my hand against your father, dear Nephew! Although I do suppose old Hades has it coming, doesn't he."
		},
	},
	{
		Name = "ZeusMiscPickup16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0025",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I've every confidence in you, young man! Now you remember that, and take my blessing here, and fight your way on out of there for me!"
		},
	},
	{
		Name = "ZeusMiscPickup17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0026",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Nephew, I want you to go and show that surly Hades everything you're made of! And, I've arranged for you a little bit of help along the way!"
		},
	},
	{
		Name = "ZeusMiscPickup18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 8 },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0027",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How is old Hades doing, anyway, Nephew? I suspect he's every bit as prickly as ever, whereas you are nothing of the sort!"
		},
	},
	{
		Name = "ZeusMiscPickup19",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0028",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I eagerly anticipate getting to meet you face-to-face someday, dear Nephew, just as soon as you can up and out of there!"
		},
	},
	{
		Name = "ZeusMiscPickup20",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0029",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Good Nephew, I return once more to lend to you my power! I'd like to see your discontented father try and stop you now!"
		},
	},
	{
		Name = "ZeusMiscPickup21",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0030",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It is my solemn wish, dear Zagreus, that eventually we settle up our differences with your lord father. But for now, we fight!"
		},
	},
	{
		Name = "ZeusMiscPickup22",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusGift02" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0034",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hail, my most honorable, beloved nephew, and I bring to you the blessing of Olympus, so that you might finally get out of there, already!"
		},
	},
	{
		Name = "ZeusMiscPickup23",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0148",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I just know you'll reach the surface here eventually, Zagreus! And I look forward to our meeting when you do!"
		},
	},
	{
		Name = "ZeusMiscPickup24",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0149",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"We'll keep you safe here from your father, Zagreus! But while you're still inside that Underworld, there's only so much we can do."
		},
	},
	{
		Name = "ZeusMiscPickup25",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0150",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've a good head on your shoulders, Zagreus, so stay positive, stay healthy, and let nothing stand between you and your goal!"
		},
	},
	{
		Name = "ZeusMiscPickup26",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0151",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I wish you well in your continued quest, and offer my sincerest blessings, and of course my power, there, Nephew!"
		},
	},
	{
		Name = "ZeusMiscPickup27",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0152",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've seen the sheer destructive power of the heavens! Just imagine what it's like above the surface of the earth!"
		},
	},
	{
		Name = "ZeusMiscPickup28",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "ZeusFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },

		{
			Cue = "/VO/Zeus_0153",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Someday when we'll be resting easy on these heights, why, we'll look back at this and laugh, I'm sure of it!"
		},
	},
	{
		Name = "ZeusMiscPickupExtra01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "ZeusGift05" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0033",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Ahh{#PreviousFormat}, but if it isn't my most favored nephew! Striving always toward the surface of my world. Your father cannot possibly believe he can contain you, can he?"
		},
	},
	{
		Name = "ZeusMiscPickup23_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0002",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You have my blessing now as ever there, young man."
		},
	},
	{
		Name = "ZeusMiscPickup24_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0003",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I trust you shall be getting out of there in due course, Nephew."
		},
	},
	{
		Name = "ZeusMiscPickup25_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0004",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I shall be watching over you, young man, though it is dark down there!"
		},
	},
	{
		Name = "ZeusMiscPickup26_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0005",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "May the might of Olympus guide you through the shadows, Nephew."
		},
	},
	{
		Name = "ZeusMiscPickup27_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0006",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Don't let your father get to you, young man, and climb on out from there."
		},
	},
	{
		Name = "ZeusMiscPickup28_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0007",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Zagreus, we won't be giving up on you, so you keep at it, {#DialogueItalicFormat}hm{#PreviousFormat}?"
		},
	},
	{
		Name = "ZeusMiscPickup29",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0008",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I shall make the heavens themselves now aid your ascent, Nephew."
		},
	},
	{
		Name = "ZeusMiscPickup30",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0154",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You'll watch yourself down there, won't you, young man?"
		},
	},
	{
		Name = "ZeusMiscPickup31",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0155",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All of us, we're here for you, young man!"
		},
	},
	{
		Name = "ZeusMiscPickup32",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0156",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Please do be careful not to make your situation any worse, Nephew!"
		},
	},
	{
		Name = "ZeusMiscPickup33",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0157",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'm here for you, young man, so you take heart, and more than that, take {#DialogueItalicFormat}this{#PreviousFormat}!"
		},
	},
	{
		Name = "ZeusMiscPickup34",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "ZeusGift04" },
		{
			Cue = "/VO/Zeus_0158",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All of us believe in you, though certainly no one so much as I!"
		},
	},
	{
		Name = "ZeusMiscPickup35",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0159",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Here's something I can do to help, young man!"
		},
	},
	{
		Name = "ZeusMiscPickup36",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredMinRunsCleared = 1,
		{
			Cue = "/VO/Zeus_0160",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You just take all the time you need in terms of fighting your way out of there, young man!"
		},
	},
	{
		Name = "ZeusMiscPickup37",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0161",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Now, don't lose heart, young man, and we'll keep at it with you here, as well!"
		},
	},
	{
		Name = "ZeusMiscPickup38",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0162",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "As my kin, you are a born fighter, Zagreus! So put your back into it, and you climb right up!"
		},
	},
	{
		Name = "ZeusMiscPickup39",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0163",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It shall be glorious, indeed, the day you finally burst from that oppressive den into the light!"
		},
	},
	{
		Name = "ZeusMiscPickup40",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = game.GameData.ZeusBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0164",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I know you have it in you to surpass your father, Zagreus. Assuming you are anything like me!"
		},
	},
	{
		Name = "ZeusMiscPickupPostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Zeus_0226",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "How fares your lovely mother? Things still good with her and Hades, hm?"
		},
	},
	{
		Name = "ZeusMiscPickupPostEpilogue02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0227",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You tell your good lord father that his brother Zeus shall be always watching over you!"
		},
	},
	{
		Name = "ZeusMiscPickupPostEpilogue03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0228",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I trust your good lord father's treating you all right?"
		},
	},
	{
		Name = "ZeusMiscPickupPostEpilogue04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0229",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I know you're busy, Zagreus, though someday you shall have to visit us!"
		},
	},
	{
		Name = "ZeusMiscPickupPostEpilogue05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0230",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'm never quite so busy that I can't make time for family, young man!"
		},
	},
	{
		Name = "ZeusMiscPickupPostEpilogue06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusMiscPickup01",
		},
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0231",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "We're all in this together, aren't we, Nephew?"
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(newPortedInteractTextLines, "ZeusUpgrade", "InteractTextLineSets",
	{
		TextLinePriorityType = "InteractTextLinePriorities",
		VoiceBankMappings = { Zeus = { "Modsnikkelmhadesbiomeszeus", "ZagreusField" } },
		CueMappings = { Zeus_ = "Modsnikkelmhadesbiomeszeus_" },
		PortraitMappings = { Zeus_ = "ModsNikkelMHadesBiomes_Portrait_Zeus_Default_01" },
	}
)

-- #region Hades I duo dialogues
local newPortedDuoPickupTextLines = {
	{
		Name = "ZeusWithAres01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "AutoRetaliateTrait",
		{
			Cue = "/VO/Zeus_0126",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"Nephew! By my divine authority, my oft-misunderstood son, Ares, now shall lend you a small token of his power. I'll make him helpful yet!"
		},
		{
			Cue = "/VO/Ares_0118",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/AresWrathBattle",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Ares_01",
			Portrait = "Portrait_Ares_Default_01",
			Text = "It shall be exactly as you say, Lord Father. Your wishes are identical to mine."
		},
	},
	{
		Name = "ZeusWithAphrodite01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "RegeneratingCappedSuperTrait",
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Zeus_0200",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"Young man, I know you'd like to get to know the comely Aphrodite face to face, or I don't know, you can decide once you arrive at last! He can decide, isn't that right, my Lady Aphrodite, hm?"
		},
		{
			Cue = "/VO/Aphrodite_0188",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/AphroditeBoonLoveChimes",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Emote = "PortraitEmoteCheerful",
			Speaker = "NPC_Aphrodite_01",
			Portrait = "Portrait_Aphrodite_Default_01",
			Text =
			"Why, I never, Lord Zeus! That sounded rather like a crass remark, from {#DialogueItalicFormat}you{#PreviousFormat}! How shocking that the golden standard for the rest of us should have such words for {#DialogueItalicFormat}me{#PreviousFormat}!"
		},
	},
	{
		Name = "ZeusWithDemeter01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "JoltDurationTrait",
		RequiredFalseTextLinesLastRun = { "DemeterWithZeus01" },
		{
			Cue = "/VO/Zeus_0202",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"Now, now, young man, whatever you have heard about good Demeter, I'm here to clear the air. She's like a sister to me, yes, but only thus. Although her Titan parents and my own met the same fate."
		},
		{
			Cue = "/VO/Demeter_0150",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/DemeterBoonFrost",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Demeter_01",
			Portrait = "Portrait_Demeter_Default_01",
			Text =
			"Why, Foster-Brother Zeus! Such an unlikely bit of candor there, from you! Almost as though you felt compelled to speak the truth only whilst I'm directly within earshot."
		},
	},
}
mod.AddNarrativeDataEntries(newPortedDuoPickupTextLines, "ZeusUpgrade", "DuoPickupTextLines",
	{
		VoiceBankMappings = {}, -- H2 loads only the selected duo speakers from their Cue names
		CueMappings = { Aphrodite_ = "Modsnikkelmhadesbiomesaphrodite_", Ares_ = "Modsnikkelmhadesbiomesares_", Demeter_ = "Modsnikkelmhadesbiomesdemeter_", Poseidon_ = "Modsnikkelmhadesbiomesposeidon_", Zeus_ = "Modsnikkelmhadesbiomeszeus_" },
		PortraitMappings = { Aphrodite_ = "ModsNikkelMHadesBiomes_Portrait_Aphrodite_Default_01", Ares_ = "ModsNikkelMHadesBiomes_Portrait_Ares_Default_01", Demeter_ = "ModsNikkelMHadesBiomes_Portrait_Demeter_Default_01", Poseidon_ = "ModsNikkelMHadesBiomes_Portrait_Poseidon_Default_01", Zeus_ = "ModsNikkelMHadesBiomes_Portrait_Zeus_Default_01" },
	}
)
-- #endregion

local newPortedLootBoughtTextLines = {
	{
		Name = "ZeusLootBought01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0049",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I see the boatman of the Underworld has found the means to reach you with my blessing, Nephew. Such strange alliances we forge these days!"
		},
	},
	{
		Name = "ZeusLootBought02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0050",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Why here I am, young man, in such strange circumstances I might add! Luckily the boatman Charon is much easier to get ahold of than your father!"
		},
	},
	{
		Name = "ZeusLootBought03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0212",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ah, so then the boatman Charon came through for us after all, did he? Whatever means we have to reach you, we'll employ!"
		},
	},
	{
		Name = "ZeusLootBought04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0213",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your Charon there must drive quite a hard bargain, Zagreus, if he would keep you from your victory just for a bit of coin!"
		},
	},
	{
		Name = "ZeusLootBought05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ZeusLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0214",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I thought that ferryman would be content to transfer souls across the River Styx, not rob you on your journey to the surface, there, Nephew!"
		},
	},
}
mod.AddNarrativeDataEntries(newPortedLootBoughtTextLines, "ZeusUpgrade", "BoughtTextLines",
	{
		TextLinePriorityType = "BoughtTextLinePriorities",
		VoiceBankMappings = { Zeus = { "Modsnikkelmhadesbiomeszeus" } },
		CueMappings = { Zeus_ = "Modsnikkelmhadesbiomeszeus_" },
		PortraitMappings = { Zeus_ = "ModsNikkelMHadesBiomes_Portrait_Zeus_Default_01" },
	}
)

local newPortedRejectionTextLines = {
	{
		Name = "ZeusRejection01",
		{
			Cue = "/VO/Zeus_0051",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAnger",
			Text =
			"My blessing isn't good enough for you, is that the way of it, young man? How impetuous of you. {#DialogueItalicFormat}Oh{#PreviousFormat}, I never!"
		},
	},
	{
		Name = "ZeusRejection02",
		{
			Cue = "/VO/Zeus_0052",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It isn't wise to go against me, Nephew, both in matters large and small. I am not known for being charitable to the insolent."
		},
	},
	{
		Name = "ZeusRejection03",
		{
			Cue = "/VO/Zeus_0053",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Perhaps you have defied me here in jest, young man. Though in such cases pertinent to my authority, you'll find I lack a sense of humor."
		},
	},
	{
		Name = "ZeusRejection04",
		{
			Cue = "/VO/Zeus_0054",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Audacity runs in our family, Zagreus, but my advice to you is that you keep it carefully suppressed in your relationship with me."
		},
	},
	{
		Name = "ZeusRejection05",
		{
			Cue = "/VO/Zeus_0055",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"What have I done, good Nephew, to deserve such scorn? Your lapse in judgment here is not so easy to forgive, yet easily punished."
		},
	},
	{
		Name = "ZeusRejection06",
		{
			Cue = "/VO/Zeus_0056",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your father likewise turned his back on me before, Nephew, and we both know what has become of him. I'd caution you against this."
		},
	},
	{
		Name = "ZeusRejection07",
		RequiredTextLines = { "ZeusRejection01", "ZeusRejection02", "ZeusRejection03" },
		{
			Cue = "/VO/Zeus_0134",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Apparently, the consequences of displeasing me have slipped your mind, young man. A harsh reminder is in order, then."
		},
	},
	{
		Name = "ZeusRejection08",
		{
			Cue = "/VO/Zeus_0135",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAnger",
			Text =
			"I did not restore order to this world, and claim the heavens for myself, only to be insulted by my own nephew!"
		},
	},
	{
		Name = "ZeusRejection09",
		{
			Cue = "/VO/Zeus_0136",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAnger",
			Text = "Why, Nephew, is this all some sort of jest to you? It isn't one that I appreciate!"
		},
	},
	{
		Name = "ZeusRejection10",
		{
			Cue = "/VO/Zeus_0137",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Nephew, when presented with a choice to side against me or not to be such a fool, do be sure to choose the latter next time, hm?"
		},
	},
	{
		Name = "ZeusRejection11",
		{
			Cue = "/VO/Zeus_0138",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Don't say I didn't warn you, young man! I only wish that I could say you didn't insult me!"
		},
	},
	{
		Name = "ZeusRejection12",
		{
			Cue = "/VO/Zeus_0139",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAnger",
			Text = "This is outrageous, Zagreus! Even your father would agree that actions such as that can't go unpunished."
		},
	},
	{
		Name = "ZeusRejection13",
		{
			Cue = "/VO/Zeus_0140",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Young man, I don't know why you would do this to me, though I trust you're going to think twice, next time!"
		},
	},
	{
		Name = "ZeusRejection14",
		{
			Cue = "/VO/Zeus_0141",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You overstep your bounds with me, Nephew! But I shall make you fall right back in line."
		},
	},

}
mod.AddNarrativeDataEntries(newPortedRejectionTextLines, "ZeusUpgrade", "RejectionTextLines",
	{
		VoiceBankMappings = { Zeus = { "Modsnikkelmhadesbiomeszeus" } },
		CueMappings = { Zeus_ = "Modsnikkelmhadesbiomeszeus_" },
		PortraitMappings = { Zeus_ = "ModsNikkelMHadesBiomes_Portrait_Zeus_Default_01" },
	}
)

local newPortedMakeUpTextLines = {
	{
		Name = "ZeusMakeUp01",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0057",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ah, very well, good show, young man! And I think I shall let you off the hook, and take you back under my wing, for now."
		},
	},
	{
		Name = "ZeusMakeUp02",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0058",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Commendable of you to live through that, and I suspect you shall think twice next time before so brazenly defying me, won't you?"
		},
	},
	{
		Name = "ZeusMakeUp03",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0059",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Now, now, no need to hold such grudges any longer I suppose, but you just mind yourself around your Uncle Zeus."
		},
	},
	{
		Name = "ZeusMakeUp04",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0060",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Do not spurn me again like that, do you hear me, young man? I think you do, so let's put this to bed and move along."
		},
	},
	{
		Name = "ZeusMakeUp05",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0061",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Oh Nephew, but I simply can't stay wrathful toward you, much as I might try! Though, better not to tempt me, just in case."
		},
	},
	{
		Name = "ZeusMakeUp06",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0062",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"All right, all right, let's call the score between us settled up for now. Just don't go spurning me again, you understand?"
		},
	},
	{
		Name = "ZeusMakeUp07",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0142",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All right, this is becoming unproductive, Zagreus. As you were!"
		},
	},
	{
		Name = "ZeusMakeUp08",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0143",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Oh, I don't have the heart to keep exacting vengeance on you, Nephew."
		},
	},
	{
		Name = "ZeusMakeUp09",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0144",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I say, such petty squabbles. Aren't we better than this, Zagreus?"
		},
	},
	{
		Name = "ZeusMakeUp10",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0145",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Well, young man, I'd say it's best we put this little slight behind us, wouldn't you?"
		},
	},
	{
		Name = "ZeusMakeUp11",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0146",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Pah{#PreviousFormat}! All is forgiven and forgotten, Zagreus. What were we even going on about back there?"
		},
	},
	{
		Name = "ZeusMakeUp12",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Zeus_0147",
			Emote = "PortraitEmoteSparkly",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Hahaha{#PreviousFormat}, that is quite enough, that's quite enough, I say! You're still alive, aren't you?"
		},
	},
}
mod.AddNarrativeDataEntries(newPortedMakeUpTextLines, "ZeusUpgrade", "MakeUpTextLines",
	{
		VoiceBankMappings = { Zeus = { "Modsnikkelmhadesbiomeszeus" } },
		CueMappings = { Zeus_ = "Modsnikkelmhadesbiomeszeus_" },
		PortraitMappings = { Zeus_ = "ModsNikkelMHadesBiomes_Portrait_Zeus_Default_01" },
	}
)
