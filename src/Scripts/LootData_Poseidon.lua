local newPortedInteractTextLines = {
	-- #region First pickup
	{
		Name = "PoseidonFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		-- Always allow, to not block this if Hermes wasn't met in a modded run yet
		-- RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/ZagreusField_0779",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 4.85 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text = "It's uncle number two, it's got to be. Then, in the name of Hades! Olympus, I accept this message.",
		},
		{
			Cue = "/VO/Poseidon_0002",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text = "Hoy there, little Hades! You recognize your uncle, do you not? We've a lot of catching up to do, but first things first, you get yourself out of that dour Underworld! As for me, I'll see if I can {#DialogueItalicFormat}stir {#PreviousFormat}things up a bit to cover your advance!",
		},
	},
	-- #endregion
	-- #region Super-priority story and quests
	{
		Name = "PoseidonBeatTheseusQuestComplete",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "PoseidonFirstPickUp",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredKillsLastRun = { "Theseus2" },
		RequiredTextLines = { "PoseidonBeatTheseusQuest01" },
		{
			Cue = "/VO/Poseidon_0227",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "{#DialogueItalicFormat}Ah-haha{#PreviousFormat}! I knew that I could count on you, Nephew! So the ungrateful Theseus, the winsome prize he earned was just some chariot, correct? And he was vanquished on it, anyway! That's what he gets! Boasting his prize was greater than any in his mortal days, {#DialogueItalicFormat}pah{#PreviousFormat}!",
		},
	},
	{
		Name = "PoseidonFishQuestComplete",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonBeatTheseusQuestComplete",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFishQuest01" },
		RequiredFalseTextLinesLastRun = { "PoseidonFishQuest01" },
		RequiredMinTotalCaughtFish = 25,
		RequiredAnyCaughtFishTypes = { "Fish_Tartarus_Legendary_01", "Fish_Asphodel_Legendary_01", "Fish_Elysium_Legendary_01", "Fish_Styx_Legendary_01", "Fish_Chaos_Legendary_01", "Fish_Surface_Legendary_01" },
		{
			Cue = "/VO/Poseidon_0149",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Ah-haha-hah{#PreviousFormat}, little Hades, I was certain you'd the wherewithal to thin the ranks of the betraying river denizens who fled my surface-seas to your father's domain!! I bid you good fish-hunting forevermore!",
		},
	},
	{
		Name = "PoseidonAboutOlympianReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonBeatTheseusQuestComplete",
		},
		PlayOnce = true,
		RequiredTextLines = { "PoseidonFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
		{
			Cue = "/VO/ZagreusField_4337",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 2.38 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text = "All right, here goes. In the name of Hades! Olympus! This is an official message! Uncle Poseidon, hope you can make this out.",
		},
		{
			Cue = "/VO/Poseidon_0238",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Emote = "PortraitEmoteSurprise",
			Text = "What's this, Nephew? Why, isn't this a note? Or, part of one, addressed to me, but it appears there should be other pieces, for the others here? {#DialogueItalicFormat}Ah{#PreviousFormat}, it's like a sunken treasure, then! Which means I must seek its mysteries at once!",
		},
	},
	{
		Name = "PoseidonPostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonBeatTheseusQuestComplete",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Poseidon_0239",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You know, Nephew, I had a positively raucous time down there, with your old father, and Persephone, was she a sight! I never thought I'd see {#DialogueItalicFormat}her {#PreviousFormat}again! So then, we're one big happy family, at last! But you've a job to do, and we upon Olympus, we'll do our fair share!",
		},
	},
	-- #endregion
	-- #region Priority story and contextual dialogues
	{
		Name = "PoseidonAboutZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "PoseidonBeatTheseusQuestComplete",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "ZeusUpgrade",

		{
			Cue = "/VO/Poseidon_0037",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "So, Nephew, my honored brother Zeus already has endowed you with his thunderous might? Well you shall soon forget about all that, after a taste of {#DialogueItalicFormat}this{#PreviousFormat}!",
		},
	},
	{
		Name = "PoseidonAboutAthena01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AthenaUpgrade",

		{
			Cue = "/VO/Poseidon_0038",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Ahh{#PreviousFormat}, you've received a blessing from Athena there already, little Hades! So careful all the time, that one, but here, I'll help you live a little, just in case!",
		},
	},
	{
		Name = "PoseidonAboutAphrodite01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AphroditeUpgrade",

		{
			Cue = "/VO/Poseidon_0039",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Oh-hoh{#PreviousFormat}, so you've already heard from Aphrodite, have you, Nephew? Understandable, but first things first, now let me add a little something to all that!",
		},
	},
	{
		Name = "PoseidonAboutAres01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AresUpgrade",

		{
			Cue = "/VO/Poseidon_0040",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hoy, Nephew! It's my understanding you've been blessed already by one of my {#DialogueItalicFormat}other {#PreviousFormat}nephews, Ares! As you can see, not all of us are cut from the same cloth; and thank the Fates for that!",
		},
	},
	{
		Name = "PoseidonAboutArtemis01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "ArtemisUpgrade",

		{
			Cue = "/VO/Poseidon_0041",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I sense that you've been marked by the elusive Artemis, correct, Nephew? She shies away from most of us, so if she's taken somewhat of a liking to you, great!",
		},
	},
	{
		Name = "PoseidonAboutDionysus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "DionysusUpgrade",

		{
			Cue = "/VO/Poseidon_0042",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Whenever Dionysus calls a feast, I'm turning up sooner or later, hear me, Nephew? So make room for one more blessing, and, let's go!",
		},
	},
	{
		Name = "PoseidonAboutHermes01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "HermesUpgrade",

		{
			Cue = "/VO/Poseidon_0137",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Little Hades, it appears that you are moving right along! Almost at an uncanny pace!! I wonder how you got to be so fast! Aquatic exercise?!",
		},
	},
	{
		Name = "PoseidonAboutHermes02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonAboutHermes01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredGodLoot = "HermesUpgrade",

		{
			Cue = "/VO/Poseidon_0138",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Nephew, how is it you're navigating your cruel father's realm at such a blinding speed?! There's only one Olympian who moves that quick! Besides myself! Where is he, anyway?",
		},
	},
	{
		Name = "PoseidonAboutDemeter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredGodLoot = "DemeterUpgrade",

		{
			Cue = "/VO/Poseidon_0143",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Why, little Hades, there's a certain chill about you, meaning you received an ice-cold blessing courtesy of Elder Goddess Demeter, correct? Now, personally, I think water's best in liquid form, but who am I to judge?",
		},
	},
	{
		Name = "PoseidonVsZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp", "ZeusGift01" },
		RequiredMinCompletedRuns = 3,

		{
			Cue = "/VO/Poseidon_0049",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You've come to know your Uncle Zeus, by now, correct? Just want to let you know, good Zeus gets very busy on the regular, so you just stick with me, I've always time for you, Nephew!",
		},
	},
	{
		Name = "PoseidonBackstory01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonGift01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },

		{
			Cue = "/VO/Poseidon_0043",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Nephew, your cruel father, Hades, he's my elder brother, you know that? Not exactly the expressive type, and never was. We seldomly saw eye-to-eye on things!",
		},
	},
	{
		Name = "PoseidonBackstory02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonBackstory01", "PoseidonGift02" },
		{
			Cue = "/VO/Poseidon_0044",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I daresay, little Hades, you've some spunk in you! Why, I think you take after me more than my crusty elder brother! You'll get away from that old codger yet!",
		},
	},
	{
		Name = "PoseidonBackstory03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonBackstory01", "HadesPostFlashback01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },

		{
			Cue = "/VO/Poseidon_0045",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My crusty elder brother Hades must have tried to poison you against us lot! I can imagine it as clear as water, Nephew! I'm proud that you've resisted his undoubtedly most-twisted words!",
		},
	},
	{
		Name = "PoseidonBackstory04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonBackstory01", "HadesPostFlashback01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },

		{
			Cue = "/VO/Poseidon_0221",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Last time your father and I spoke, he told me I was all washed up, can you believe the nerve of it, Nephew? Why, he took the words right out of my mouth!",
		},
	},
	{
		Name = "PoseidonAboutPowers01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "PoseidonGift02" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0167",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It's likely, little Hades, that you currently reside just underneath one of my boundless seas! Normally you'd have to be submerged to use this power, but you know what, close enough!",
		},
	},
	{
		Name = "PoseidonHighRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "PoseidonFirstPickUp", "PoseidonGift04" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0168",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You know I've many vitally important things to do besides lending my aid to you repeatedly, Nephew? But, all of that can wait! Family comes first!",
		},
	},
	{
		Name = "PoseidonMaxRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "PoseidonGift07" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0231",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "If you should ever make it here, Nephew, know this! I shall be pleased to stand in for the father figure I can tell you never really had. We can engage in all sorts of aquatic competitions, solve riddles, visit the sea-nymphs! Oh, it would be great, wouldn't you think?",
		},
	},
	{
		Name = "PoseidonAboutSeas01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "PoseidonFirstPickUp", "PoseidonGift03" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0169",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Nephew, why, the seas up here, they're just about as widely feared as your vast Underworld down there! For water can be deadlier than bronze!",
		},
	},
	{
		Name = "PoseidonAboutSeas02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "PoseidonFirstPickUp", "PoseidonGift01" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0220",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My oceans, they are filled with danger, not just water, little Hades! Many of the dead you face, they met their mortal end at sea, and not on land!",
		},
	},
	{
		Name = "PoseidonVsMeg01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredFalseTextLines = { "PoseidonVsMeg02" },
		ConsecutiveDeathsInRoom =
		{
		  Name = "A_Boss01",
		  Count = 2,
		},
		{
			Cue = "/VO/Poseidon_0046",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Ahh{#PreviousFormat}, it seems to me you've had yourself a spot of lady trouble, lately, isn't that correct, Nephew? I mean the Fury down in Tartarus, of course! You going to let her keep on bossing you around?!",
		},
	},
	{
		Name = "PoseidonVsMeg02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredKills = { Harpy = 3 },
		RequiredKillsLastRun = { "Harpy" },
		{
			Cue = "/VO/Poseidon_0047",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Hah{#PreviousFormat}! I heard you showed that good-for-nothing Fury after all, I knew you'd handle that old crone, Nephew! And if she troubles you again, you just remind her who's in charge down there!",
		},
	},
	{
		Name = "PoseidonRunProgress01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp", "PoseidonVsMeg02" },
		RequiredRoomLastRun = "B_Intro",
		RequiredBiome = "Asphodel",
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Poseidon_0048",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Good tidings, Nephew! I've learned that you have managed to get all the way to Asphodel, fine work! Now, you just keep on going!",
		},
	},
	{
		Name = "PoseidonRunProgress02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredRoomLastRun = "C_MiniBoss01",
		RequiredMinTimesSeenRoom = { C_MiniBoss01 = 2 },
		{
			Cue = "/VO/Poseidon_0134",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Ohh{#PreviousFormat}, Nephew, you've stood against the Bull of Minos, have you? Well I must apologize for any inconvenience there, because, he was a living testament to my revenge! Long story, boring really, rather sordid, too. Stay strong!",
		},
	},
	{
		Name = "PoseidonRunProgress03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredMinTimesSeenRoom = { D_Boss01 = 2 },
		RequiredRoomLastRun = "D_Boss01",
		{
			Cue = "/VO/Poseidon_0136",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Word reaches us that you've come very far, indeed, Nephew! Striking distance from the surface! You just keep at it like that, and with our help, we'll have you out of there for sure!",
		},
	},
	{
		Name = "PoseidonRunProgress04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredRoomLastRun = "D_Boss01",
		{
			Cue = "/VO/Poseidon_0140",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I wonder what monstrosities await you near the surface, little Hades? There's your father's terrifying hell-hound, for one thing! Ah, well, I'm sure you'll find a way to sail past whatever's in your way!",
		},
	},
	{
		Name = "PoseidonRunProgress05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredRoomLastRun = "D_Intro",
		RequiresLastRunNotCleared = true,
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0170",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Now don't lose heart, Nephew! Because in spite of all your efforts, it is probably the case that you still have a long and painful road ahead!",
		},
	},
	{
		Name = "PoseidonRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiresLastRunCleared = true,
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0218",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Ah{#PreviousFormat}, I thought for certain you were well on your way out of there last time, Nephew! But, no matter, we'll just get you on another voyage to the top!",
		},
	},
	{
		Name = "PoseidonRunCleared02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		RequiresLastRunCleared = true,
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0219",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Little Nephew, why, I could have sworn you made it to the surface recently, and yet, you're all the way back there, again? Must be some sort of terrible monstrosity preventing your way out!",
		},
	},
	{
		Name = "PoseidonPostEpilogue02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Poseidon_0240",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'll tell you, Nephew, I was quite taken aback to learn Persephone, she was your mother all along! Just disappeared up here, one day! Ran off, I figured, as she's got some mortal blood in her. But she was with your father! That rascal is my brother, after all!",
		},
	},
	{
		Name = "PoseidonPostEpilogue03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "PoseidonGift03" },
		MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 3 },
		{
			Cue = "/VO/Poseidon_0244",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "So how is crusty old Hades faring down there of late, Nephew? Fewer worries there upon his brow? That Underworld of yours all running smoothly, and all that? We'll keep on pitching in from over here. Least we can do!",
		},
	},
	{
		Name = "PoseidonPostEpilogue04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "PoseidonGift04" },
		RequiredTrueFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Poseidon_0245",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Persephone, she says you're really stuck down there, born of the Underworld, something like that? Well, if you ask me, that's no kind of attitude to have! You can do {#DialogueItalicFormat}anything {#PreviousFormat}you set your mind to, Nephew! Take it from me!",
		},
	},
	{
		Name = "PoseidonPostEpilogue05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "PoseidonGift07" },
		MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 4 },
		{
			Cue = "/VO/Poseidon_0246",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "If you {#DialogueItalicFormat}do {#PreviousFormat}ever get the opportunity to spend some time up here, Nephew, know I shall take you on a grand tour of the surface! From the depths of my seas to the height of Olympus! Sure, maybe not today, or tomorrow, or even the next aeon! But sometime, we should go!",
		},
	},
	{
		Name = "PoseidonPostEpilogue06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "PoseidonGift07", "ZeusGift07", "HadesGift05" },
		{
			Cue = "/VO/Poseidon_0247",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Been nice to see my brothers getting on again, just like old times! Well, not exactly like old times, and come to think of it, there always was a bit of tension there between those two, but still! It's better than before!",
		},
	},
	{
		Name = "PoseidonAboutPersephoneVisit01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		RequiredTrueFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Poseidon_0243",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your good mother Persephone, she's here all safe and sound, thought you should know, there, little Hades! Shame you can't be here with her, too, but {#DialogueItalicFormat}ah{#PreviousFormat}! Doubtless we'll someday meet again!",
		},
	},
	{
		Name = "PoseidonAboutKeepsake01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTrait = "ForcePoseidonBoonTrait",
		{
			Cue = "/VO/Poseidon_0222",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ah-{#DialogueItalicFormat}hah{#PreviousFormat}! I sense you have in your possession that fine shell I sent to you, a little gift plucked straight out of the sea! You keep it close so I can better track you down!",
		},
	},
	{
		Name = "PoseidonAboutTheseus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredRoomLastRun = "C_Boss01",
		{
			Cue = "/VO/Poseidon_0224",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Say, word has reached me that you squared against one known as Theseus, now champion there in Elysium? He was a handful even when he lived! So much so that my honored brother Zeus, he took to calling him my son, can you believe the nerve?",
		},
	},
	{
		Name = "PoseidonAboutTheseus02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredRoomLastRun = "C_Boss01",
		RequiredTextLines = { "PoseidonAboutTheseus01" },
		{
			Cue = "/VO/Poseidon_0225",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "So, little Hades, doubtless you have seen that we upon Olympus also lend our favor to the mighty Theseus, who bars your passage from Elysium! Now, don't you take it personally, there, because our blessings go to {#DialogueItalicFormat}all {#PreviousFormat}who deserve them. Although, we try to save the best for you!",
		},
	},
	{
		Name = "PoseidonBeatTheseusQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredRoomLastRun = "C_Boss01",
		RequiredTextLines = { "PoseidonAboutTheseus02", "PoseidonGift03", "PoseidonRunProgress02" },
		MinRunsSinceAnyTextLines = { TextLines = { "PersephoneFirstMeeting" }, Count = 2 },
		RequiredMinRunsCleared = 1,
		{
			Cue = "/VO/Poseidon_0226",
			Emote = "PortraitEmoteAnger",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "That scoundrel Theseus! Apparently he earned himself some sort of winsome prize, for all his blustering there in Elysium! Though, I'm quite certain that, no matter what he and his bull friend have at their disposal, you've the power to defeat them, utterly! So go do it, surely I'll get word!",
		},
	},
	{
		Name = "PoseidonAboutFishing01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredWeaponsUnlocked = { "ToolFishingRod" },

		{
			Cue = "/VO/Poseidon_0146",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "Why, Nephew, you've procured the Rod of Fishing, I detect! Fine handiwork if I say so myself! Its line is nigh-invisible and causes denizens of my domain to flock to it like mortals to temples of mine! Good fortune with that thing!",
		},
	},
	{
		Name = "PoseidonAboutFishing02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonAboutFishing01", "PoseidonGift02" },
		RequiredWeaponsUnlocked = { "ToolFishingRod" },
		RequiredFalseTextLinesLastRun = { "PoseidonAboutFishing01" },
		RequiredMinTotalCaughtFish = 9,
		{
			Cue = "/VO/Poseidon_0147",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'm told a number of the underwater denizens from my domain were captured fair-and-square through your surpassing skill using the Rod of Fishing, little Hades!! They're yours, I've millions more!",
		},
	},
	{
		Name = "PoseidonAboutFishing03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonAboutFishing02", "PoseidonGift06" },
		RequiredFalseTextLinesLastRun = { "PoseidonAboutFishing02" },
		RequiredMinTotalCaughtFish = 18,
		RequiredHasFish = true,
		{
			Cue = "/VO/Poseidon_0241",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All these river denizens you've caught, little Hades... it can only mean we share a deep connection, don't you think? I, with my power over the entire vastness of the seas! And you, with the power to ensnare a hapless fish with but a flick of the wrist!",
		},
	},
	{
		Name = "PoseidonLowHealth01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Poseidon_0073",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Hoh{#PreviousFormat}, you look positively in atrocious shape, there, Nephew! What's the matter, one too many run-ins with the wretched dead before {#DialogueItalicFormat}I {#PreviousFormat}intervened?",
		},
	},
	{
		Name = "PoseidonLowHealth02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Poseidon_0074",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Seems to me that you're in dire straits, there, little Hades! Why, you're bleeding everywhere! Here, let me try and do something for that.",
		},
	},
	{
		Name = "PoseidonLowHealth03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Poseidon_0199",
			Emote = "PortraitEmoteSurprise",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Ah{#PreviousFormat}, what happened to you, little Hades?! I can tell even from here that you've been beaten like a skiff during a storm!",
		},
	},
	{
		Name = "PoseidonLowHealth04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Poseidon_0200",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Now, don't go dying on me, yet, Nephew! You have to {#DialogueItalicFormat}live{#PreviousFormat}! Or else the Boon I offer you shall go to waste!",
		},
	},
	{
		Name = "PoseidonLowHealth05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Poseidon_0201",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your hated enemies, they almost got the best of you, I fear! But you can still turn it around, especially now that you have my aid!",
		},
	},
	{
		Name = "PoseidonLegendaryPickUp01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Poseidon_0033",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Ohh{#PreviousFormat}, have I got something for you this time, little Hades! Something special I have saved for when you {#DialogueItalicFormat}really {#PreviousFormat}proved yourself!",
		},
	},
	{
		Name = "PoseidonLegendaryPickUp02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Poseidon_0034",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "There's nothing stronger than the sea, Nephew, neither above it nor below!! And, if you are in need of further proof, behold: The greatest of my blessings, just for you!",
		},
	},
	-- #endregion
	-- #region Misc
	{
		Name = "PoseidonMiscPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "PoseidonAboutZeus01",
			CreateNewPriorityGroup = true,
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0012",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hoy, Nephew, it's excellent to see you once again, and in good spirits, still? Then, come, let's make some waves!",
		},
	},
	{
		Name = "PoseidonMiscPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0013",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "Ahoy, little Hades, it is I! The greatest of your uncles! Here to aid you in your daringest escape attempt! And I do admire your persistence!",
		},
	},
	{
		Name = "PoseidonMiscPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0014",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Good tidings once again, there, little Nephew!! It is I, returned as ever here to make a splash against your many, many foolish enemies!",
		},
	},
	{
		Name = "PoseidonMiscPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0015",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ahoy, Nephew! I bet you have your hands full dealing with your enemies down there, so let me see what I can do. And I can do a lot!",
		},
	},
	{
		Name = "PoseidonMiscPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0016",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It seems you're getting somewhere, little Nephew! Good, but here, allow your favorite Uncle to bestow a little boost!",
		},
	},
	{
		Name = "PoseidonMiscPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0017",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "{#DialogueItalicFormat}Ah, hahaha! {#PreviousFormat}Found you down there, Nephew! Now let's overwhelm your enemies in a typhoon of godly might, what do you say?",
		},
	},
	{
		Name = "PoseidonMiscPickup07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0018",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Little Hades, have I ever told you I detest the dead? Well, I admit it, I just cannot stand a mortal past his due. So how about we get you far away from all such filth, agreed?",
		},
	},
	{
		Name = "PoseidonMiscPickup08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0019",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What do you say, there, Nephew, ready to get wet, or no? Oh I suspect you are, so let's get to it, and dispense some liquid justice!",
		},
	},
	{
		Name = "PoseidonMiscPickup09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "PoseidonFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0020",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "How fares your feud against my crusty elder brother lately, good? Big Hades, he is disagreeable with all of us, not just with you, so, don't you take it personal, and stick with me!",
		},
	},
	{
		Name = "PoseidonMiscPickup10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0021",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Looks like {#DialogueItalicFormat}you {#PreviousFormat}could use the power of the sea, wouldn't you say so, little Hades? Good thing I'm here, so that together, we might wash your enemies away!",
		},
	},
	{
		Name = "PoseidonMiscPickup11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0022",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Enough kidding around without me, Nephew! I am here, so let's go bust you out, much like a raging river through a frail little dam!",
		},
	},
	{
		Name = "PoseidonMiscPickup12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0023",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You're looking somewhat stronger than before, there, little Nephew, but you're much too scrawny still, to be quite blunt. So, here! Let's fatten you right up!",
		},
	},
	{
		Name = "PoseidonMiscPickup13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0024",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "{#DialogueItalicFormat}Hoy{#PreviousFormat}, my nephew! I think I have kept you waiting long enough, so then, let's {#DialogueItalicFormat}go{#PreviousFormat}! And break our enemies to pieces, like so many ships upon the shoals!",
		},
	},
	{
		Name = "PoseidonMiscPickup14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0025",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'll have you know, the power of the seas themselves is yours once more, Nephew! So how about you put it to its rightful purpose, and go smash some stuff!",
		},
	},
	{
		Name = "PoseidonMiscPickup15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0026",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Are you perchance in need of godlike aid, Nephew? Well, excellent! Because I happen to command the sea, and I shall hereby let you take it for a whirl!",
		},
	},
	{
		Name = "PoseidonMiscPickup16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0027",
			Emote = "PortraitEmoteFiredUp",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Who dares to mess with little Hades? You simply point me at them, Nephew, and we'll leave them shivering and sopping wet, you'll see!",
		},
	},
	{
		Name = "PoseidonMiscPickup17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0028",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "At last I found you once again, Nephew! You eating well and getting strong, correct? I'll help you with the latter category in a moment. Here!",
		},
	},
	{
		Name = "PoseidonMiscPickup18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0029",
			Emote = "PortraitEmoteFiredUp",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The awesome bounty of the sea is yours to do with as you please, Nephew! I've mustered forth a sample, anyway!",
		},
	},
	{
		Name = "PoseidonMiscPickup19",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0030",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "Hoh, little Hades! I'd heard you were preparing to rain terrible destruction on your enemies! So I got here as quickly as I could! I'm not too late, am I?",
		},
	},
	{
		Name = "PoseidonMiscPickup20",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0031",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All of us must sail through troubled waters now and then, correct, Nephew? Fortunately, navigation is my speciality, so let's be on our way!",
		},
	},
	{
		Name = "PoseidonMiscPickup21",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0032",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your victory's most certainly at hand now that I'm here, Nephew! So long as you make sure to take advantage of the absolutely awesome power I bequeath!",
		},
	},
	{
		Name = "PoseidonMiscPickup23",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonGift01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0035",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "Why, if it isn't the most favored of my nephews, stuck as ever though you may yet be! We'll get you from there, little Hades, don't despair, Uncle Poseidon's here!!",
		},
	},
	{
		Name = "PoseidonMiscPickup24",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonGift02" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0036",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "Good tidings, my most favored nephew! All is relatively well, I hope? But hope alone is worthless without action, is it not? So here, let's act {#DialogueItalicFormat}together{#PreviousFormat}!",
		},
	},
	{
		Name = "PoseidonMiscPickup25",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonGift04" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },

		{
			Cue = "/VO/Poseidon_0050",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Just wait until you see the seas, Nephew! My underwater realm is the most glorious of the world's habitats. It positively teems with life, and it's much cooler there than in that sweaty Underworld of yours!",
		},
	},
	{
		Name = "PoseidonMiscPickup26",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0004",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Well, Nephew, supposing it's high time for the high seas to lend their might once more?",
		},
	},
	{
		Name = "PoseidonMiscPickup27",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0005",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your uncle's offering to shake things up once more, what say you, little Hades?",
		},
	},
	{
		Name = "PoseidonMiscPickup28",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0006",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "No more dallying about, now, little Nephew! Time instead we really got somewhere!",
		},
	},
	{
		Name = "PoseidonMiscPickup29",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0007",
			Emote = "PortraitEmoteFiredUp",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Good tidings, little Hades! It is I! And I am always here to help!",
		},
	},
	{
		Name = "PoseidonMiscPickup30",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0008",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Fear not, Nephew, it is I, your uncle! Come to wash away your troubles, here and now!",
		},
	},
	{
		Name = "PoseidonMiscPickup31",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0009",
			Emote = "PortraitEmoteFiredUp",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Just point me toward your enemies, Nephew, and they'll become sworn enemies of mine!",
		},
	},
	{
		Name = "PoseidonMiscPickup32",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0010",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let's get you out from underneath the sea, there, little Nephew!",
		},
	},
	{
		Name = "PoseidonMiscPickup33",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0011",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ahoy, my godly Nephew, I've arrived, so set aside your worries and let's drench the dead!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0171",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "How about we set you up here with some real {#DialogueItalicFormat}water{#PreviousFormat}-power, little Hades?",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0172",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I take it you could use some liquid courage at this time, no, little Hades?",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0173",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "How about a swim, there, little Hades? A swim, that is, within the Pool of Blessings! Now, dive in!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0174",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'm here, Nephew, to aid you in your time of need, with {#DialogueItalicFormat}this{#PreviousFormat}!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0175",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I heard that you could use the awesome power of the sea, Nephew!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0176",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Go on and make a splash for me, why don't you, little Hades!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0177",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The treasures of the sea are limitless, so here! You take your pick!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0178",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What do you say we make some waves, right, little Hades?",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0179",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Don't let the wretched dead dampen your spirits, little Hades! Dampen {#DialogueItalicFormat}theirs{#PreviousFormat}!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0180",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Here comes another cool, refreshing blessing for you, Nephew!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0181",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Water can even cut through solid stone, with enough time! So you keep at it, there!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0182",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I know that you can do it, little Hades! Whatever it may be!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredMaxHealthFraction = 0.45,
		{
			Cue = "/VO/Poseidon_0183",
			Emote = "PortraitEmoteDepressed",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It's darker than the bottom of the sea in there! Are you alive, Nephew?!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		{
			Cue = "/VO/Poseidon_0184",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The secrets of the sea can all be yours! Eventually at least, I have just three for now!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredMaxHealthFraction = 0.45,
		{
			Cue = "/VO/Poseidon_0185",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You still alive down there, Nephew? Because if so, why, this ought to keep it that way!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0186",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Must get so stuffy in that dreary place, Nephew! So why don't you cool off a bit, with {#DialogueItalicFormat}this{#PreviousFormat}!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0187",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You have a dirty job down there, Nephew, but I can help you to clean up a bit!",
		},
	},
	{
		Name = "PoseidonMiscPickupExtra18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = game.GameData.PoseidonBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0188",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All that I ask, here, little Nephew, is for you to do your best! As I would do!",
		},
	},
	{
		Name = "PoseidonMiscPickupRare01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Poseidon_0189",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ahoy, and now prepare yourself! For I've a rare treat here, especially for you!",
		},
	},
	{
		Name = "PoseidonMiscPickupRare02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Poseidon_0190",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I am ever impressed with your will to succeed, Nephew, so here! Great blessings be with you!",
		},
	},
	{
		Name = "PoseidonMiscPickupRare03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Poseidon_0191",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You've earned only the very finest of my blessings, little Hades! Why? Why {#DialogueItalicFormat}not{#PreviousFormat}!",
		},
	},
	{
		Name = "PoseidonMiscPickupRare04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Poseidon_0192",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "If you are ever going to get out of there, only the mightiest of all my blessings will suffice!",
		},
	},
	{
		Name = "PoseidonMiscPickupRare05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonMiscPickup01",
		},
		RequiredTextLines = { "PoseidonFirstPickUp", "PoseidonGift06" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Poseidon_0193",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My favorite Nephew ought have access to my greatest blessings, should he not?",
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(
	newPortedInteractTextLines, "PoseidonUpgrade", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Poseidon = { "Modsnikkelmhadesbiomesposeidon", "ZagreusField" } }, { Poseidon_ = "Modsnikkelmhadesbiomesposeidon_" },
	{ Poseidon_ = "ModsNikkelMHadesBiomes_Portrait_Poseidon_Default_01" }
)

local newPortedLootBoughtTextLines = {
	{
		Name = "PoseidonLootBought01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0051",
			Emote = "PortraitEmoteFiredUp",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ah-{#DialogueItalicFormat}hah{#PreviousFormat}! You found me, little Nephew! Strewn among the inventories of that most disturbing river-boatman! That means you win my blessing!",
		},
	},
	{
		Name = "PoseidonLootBought02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0052",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Well, well, my plan to get ahold of you via the boatman worked out flawlessly! Harness the might of the sea, then, why don't you?",
		},
	},
	{
		Name = "PoseidonLootBought03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0194",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Well, Nephew, I know that salty Charon can be difficult. But I am certain that whatever price you paid, you got a {#DialogueItalicFormat}deal{#PreviousFormat}!",
		},
	},
	{
		Name = "PoseidonLootBought04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0195",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Nothing comes freely for the mortals on the surface, Nephew! And from the sound of things, it isn't any different with that Charon character!",
		},
	},
	{
		Name = "PoseidonLootBought05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "PoseidonLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "PoseidonGift05" },
		{
			Cue = "/VO/Poseidon_0196",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let me just say, Nephew, that money-hoarding boatman best be fair with you! Because I'd hate to see anything happen to that little boat of his!",
		},
	},
}
mod.AddNarrativeDataEntries(
	newPortedLootBoughtTextLines, "PoseidonUpgrade", "BoughtTextLines", "BoughtTextLinePriorities",
	{ Poseidon = { "Modsnikkelmhadesbiomesposeidon" } }, { Poseidon_ = "Modsnikkelmhadesbiomesposeidon_" },
	{ Poseidon_ = "ModsNikkelMHadesBiomes_Portrait_Poseidon_Default_01" }
)

local newPortedRejectionTextLines = {
	{
		Name = "PoseidonRejection01",
		{
			Cue = "/VO/Poseidon_0003",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "{#DialogueItalicFormat}Whaaaa{#PreviousFormat}, you think that you've a chance in hell without my help, am I to understand?! You made a big mistake there, little Hades, just you watch.",
		},
	},
	{
		Name = "PoseidonRejection02",
		{
			Cue = "/VO/Poseidon_0053",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "How bold of you to throw your lot in with my relatives instead of me, given the choice, there, little Hades. But don't you ever bet against {#DialogueItalicFormat}this {#PreviousFormat}horse!",
		},
	},
	{
		Name = "PoseidonRejection03",
		{
			Cue = "/VO/Poseidon_0054",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Oh, now, it seems to me your strength outweighs your smarts, there, Nephew, if you're prone to picking other sides than mine!",
		},
	},
	{
		Name = "PoseidonRejection04",
		{
			Cue = "/VO/Poseidon_0055",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "A word of caution, little Nephew: Never turn your back against the sea. And, while you're at it, never take up sides against your greatest uncle!",
		},
	},
	{
		Name = "PoseidonRejection05",
		{
			Cue = "/VO/Poseidon_0056",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "{#DialogueItalicFormat}Augh{#PreviousFormat}! I'm absolutely flabbergasted, Nephew!! I offer you the finest blessings of the earth and sea, and they're not good enough?",
		},
	},
	{
		Name = "PoseidonRejection06",
		{
			Cue = "/VO/Poseidon_0057",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Apparently my crusty elder brother failed to teach you any manners, if you deign to thusly spurn my offerings! But I can teach you yet!",
		},
	},
	{
		Name = "PoseidonRejection07",
		{
			Cue = "/VO/Poseidon_0152",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAnger",
			Text = "{#DialogueItalicFormat}Betrayal{#PreviousFormat}, little Hades!! Of all my nephews, you should know better than this! Or perhaps I should. One of us, at least!",
		},
	},
	{
		Name = "PoseidonRejection08",
		{
			Cue = "/VO/Poseidon_0153",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "That's definitely not the choice {#DialogueItalicFormat}I {#PreviousFormat}would have made, Nephew! Because, for me to side against myself, why, that would make no sense at all!",
		},
	},
	{
		Name = "PoseidonRejection09",
		{
			Cue = "/VO/Poseidon_0154",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "Nephew, what you have just done is tantamount to spitting in my face! Let me remind you, then, the ocean can spit back!",
		},
	},
	{
		Name = "PoseidonRejection10",
		{
			Cue = "/VO/Poseidon_0155",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteDepressed",
			Text = "You wound me, little Hades, with your callous choice! It's fortunate I'm quite impervious to harm. But I don't think the same is true for you!",
		},
	},
	{
		Name = "PoseidonRejection11",
		{
			Cue = "/VO/Poseidon_0156",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You know the saying not to play with fire, don't you, Nephew? You'll find the same is very much the case with water, too!",
		},
	},
	{
		Name = "PoseidonRejection12",
		RequiredTextLines = game.GameData.PoseidonMiscRejectionTextLines,
		{
			Cue = "/VO/Poseidon_0157",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteFiredUp",
			Text = "Again, you would defy me, little Hades? I'm beginning to see why your father might be very frustrated, indeed, having to deal with you!",
		},
	},
	{
		Name = "PoseidonRejection13",
		RequiredTextLines = game.GameData.PoseidonMiscRejectionTextLines,
		{
			Cue = "/VO/Poseidon_0158",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Emote = "PortraitEmoteAnger",
			Text = "It seems that you require yet one more gentle reminder not to scoff at chances to accept my blessings, little Hades! Now remember this!",
		},
	},
	{
		Name = "PoseidonRejection14",
		RequiredTextLines = game.GameData.PoseidonMiscRejectionTextLines,
		{
			Cue = "/VO/Poseidon_0159",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Sometimes I think, surely my nephew takes to heart my strongly worded threats about my distaste for his little acts of treachery, but {#DialogueItalicFormat}no{#PreviousFormat}!",
		},
	},
	{
		Name = "PoseidonRejection15",
		RequiredTextLines = game.GameData.PoseidonMiscRejectionTextLines,
		{
			Cue = "/VO/Poseidon_0160",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I could have sworn I told you never to take the power of the sea for granted, little Hades? It seems the time for words is over, then!",
		},
	},
}
mod.AddNarrativeDataEntries(
	newPortedRejectionTextLines, "PoseidonUpgrade", "RejectionTextLines", nil,
	{ Poseidon = { "Modsnikkelmhadesbiomesposeidon" } }, { Poseidon_ = "Modsnikkelmhadesbiomesposeidon_" },
	{ Poseidon_ = "ModsNikkelMHadesBiomes_Portrait_Poseidon_Default_01" }
)

local newPortedMakeUpTextLines = {
	{
		Name = "PoseidonMakeUp01",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0058",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Oh, very well then, little Hades! Uncle's going to let you off the hook this time. Just mind your manners next we meet!",
		},
	},
	{
		Name = "PoseidonMakeUp02",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0059",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I must hand it to you, little Hades! I did not expect that you would weather such a storm! I'm mightily impressed!",
		},
	},
	{
		Name = "PoseidonMakeUp03",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0060",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ah, I can't stay angry! Let us call all that unpleasantness back there water under the bridge, what say you, Nephew?",
		},
	},
	{
		Name = "PoseidonMakeUp04",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0061",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My, a show of strength like that deserves a commendation I should think! Although, for next time, know my favor's not a thing to trifle with!",
		},
	},
	{
		Name = "PoseidonMakeUp05",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0062",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All right, that's quite enough, I take it you have had about enough of that, correct? You're pretty good! So here, why don't you run along!",
		},
	},
	{
		Name = "PoseidonMakeUp06",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0161",
			Emote = "PortraitEmoteFiredUp",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "{#DialogueItalicFormat}Ah-haha{#PreviousFormat}, my fits of anger come and go just like the tides, Nephew! Now take this from me, and get out of here!",
		},
	},
	{
		Name = "PoseidonMakeUp07",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0162",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Now that was truly finely fought, indeed, Nephew! And I've a suitable reward here, just for you! Don't even know what I was mad about!",
		},
	},
	{
		Name = "PoseidonMakeUp08",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0163",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What can I say, Nephew? Sometimes our tempers get the best of all of us. You're fortunate mine didn't get the best of you back there!",
		},
	},
	{
		Name = "PoseidonMakeUp09",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0164",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You weathered the storm, there, little Hades, and the sea is once again at peace. And you'll make every attempt to keep it that way, correct?",
		},
	},
	{
		Name = "PoseidonMakeUp10",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0165",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All right, no need to fight about this any longer, don't you think, Nephew? Here, take my blessing, like you should have in the first place!",
		},
	},
	{
		Name = "PoseidonMakeUp11",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Poseidon_0166",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Now let's not set a bad example for the family, Nephew! We're better than all that. Besides! They've many bad examples as it is.",
		},
	},
}
mod.AddNarrativeDataEntries(
	newPortedMakeUpTextLines, "PoseidonUpgrade", "MakeUpTextLines", nil,
	{ Poseidon = { "Modsnikkelmhadesbiomesposeidon" } }, { Poseidon_ = "Modsnikkelmhadesbiomesposeidon_" },
	{ Poseidon_ = "ModsNikkelMHadesBiomes_Portrait_Poseidon_Default_01" }
)
