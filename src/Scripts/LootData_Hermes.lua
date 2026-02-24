local newPortedInteractTextLines = {
	-- #region Charon Fight Questline
	{
		Name = "HermesAboutCharonFight01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutTyphonReveal01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "HermesLootBought01" },
		RequiredSeenRooms = { "CharonFight01" },
		{
			Cue = "/VO/Hermes_0197",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I can't believe you got into a fight with my professional associate, you daft or something, Coz? Just about everybody that I know, they're all at least a little bit afraid of that one and his boat, yet you think you can take him, huh?"
		},
	},
	{
		Name = "HermesAboutCharonFight02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutCharonFight01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutCharonFight01", "BossCharonOutro01" },
		RequiredFalseTextLines = { "HermesBeatCharonQuestComplete" },
		{
			Cue = "/VO/Hermes_0198",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So you took on my good professional associate, is that right, Coz? And you beat the big boatman himself! I knew you were pretty tough, but not {#DialogueItalicFormat}that {#PreviousFormat}tough! Impressive work! He's impressed, too. He isn't even mad!"
		},
	},
	{
		Name = "HermesBeatCharonQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutCharonFight01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutCharonFight01", "HermesGift03" },
		{
			Cue = "/VO/Hermes_0199",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, uh, so I kind of placed a bet with the old boatman, my associate that is, that you could beat him in a fight, twice in a row! No pressure, or anything, but just in case you prove me right one of these days, I would appreciate it, Coz!"
		},
	},
	{
		Name = "HermesBeatCharonQuestComplete",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutCharonFight01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "BossCharonHermesQuestComplete01" },
		{
			Cue = "/VO/Hermes_0200",
			Emote = "PortraitEmoteCheerful",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You did it, Coz! And by {#DialogueItalicFormat}it {#PreviousFormat}I'm referring to the act of beating down my seemingly invincible boatman associate, who fancies himself pretty tough as Underworld deities go! He wasn't sure you had it in you, and if I may be so bold, neither was I!"
		},
	},
	-- #endregion
	-- #region Priority Story
	{
		Name = "HermesSecondPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesPostTrueEnding01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0003",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"What's going on, there, Coz? Can I call you Coz? Got something here for you should make your battles to the death end that much quicker!"
		},
	},
	{
		Name = "HermesAboutPersephoneMeeting01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesSecondPickUp",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp", "PersephoneFirstMeeting" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredRoomLastRun = "D_Intro",
		MinRunsSinceAnyTextLines = { TextLines = { "PersephoneFirstMeeting" }, Count = 5 },
		{
			Cue = "/VO/Hermes_0162",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Heard that you finally got out of there, Coz! Big congratulations due for that: Congrats! The secret's safe with me, of course! The others here, they think you're still at it. Though, I guess you are!"
		},
	},
	{
		Name = "HermesPostEnding01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutPersephoneMeeting01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp", "Ending01" },
		MinRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 4 },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Hermes_0163",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I heard a certain someone's back at home with you down there now, Coz! I'd call it wonderful news, except it {#DialogueItalicFormat}isn't {#PreviousFormat}news, at least not yet! Though if the time comes that you want to spread the word, just give the signal here!"
		},
	},
	{
		-- Used to be called HermesPostEnding01, but was a duplicate with a SuperPriority textline
		Name = "HermesPostEnding02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesPostEnding01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "Ending01", "HermesGift04" },
		MinRunsSinceAnyTextLines = { TextLines = { "Ending01" }, Count = 2 },
		{
			Cue = "/VO/Hermes_0232",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So {#DialogueItalicFormat}you {#PreviousFormat}get to keep breaking out of there, time after time, so that {#DialogueItalicFormat}your father {#PreviousFormat}can keep finding ways to make it even harder to escape? Something like that? Sounds like an interesting assignment, Coz!"
		},
	},
	-- #endregion
	-- #region Story
	{
		Name = "HermesFirstRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutTyphonReveal01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", "PersephoneFirstMeeting" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Hermes_0164",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Another message from Olympus, boss. This goes, {#DialogueItalicFormat}'Zagreus, take absolutely all the time you need making your way to us; we know the going must be treacherous, and we assure you our support, however long it takes.' {#PreviousFormat}Well, how about that!"
		},
	},
	{
		Name = "HermesRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiresLastRunCleared = true,
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Hermes_0109",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Heard you got through pretty quick last time! Not bad, not bad!"
		},
	},
	{
		Name = "HermesRunCleared02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiresLastRunCleared = true,
		RequiredMinRunsCleared = 3,
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Hermes_0225",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You'd think that once you break free to the surface we could see you from Olympus a bit more than usual, but no! It's like you're shrouded in eternal night up here, hm? Something like that. Odd, right?"
		},
	},
	{
		Name = "HermesRunClearedNewRecord01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstRunCleared01", },
		RequiresLastRunCleared = true,
		RequiresBestClearTimeLastRun = true,
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Hermes_0110",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, you beat your fastest time fighting through all of that! Not that I'm keeping track! I'm keeping track."
		},
	},
	{
		Name = "HermesRunClearedNewRecord02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesRunClearedNewRecord01" },
		RequiresLastRunCleared = true,
		RequiresBestClearTimeLastRun = true,
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Hermes_0111",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey Coz, that last run-through that you did, I almost can't believe how quick you pulled that off! You're really pretty good!"
		},
	},
	{
		Name = "HermesRunClearedNewRecord03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesRunClearedNewRecord02" },
		RequiresLastRunCleared = true,
		RequiresBestClearTimeLastRun = true,
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Hermes_0215",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, you got out of there in practically no time at all before! Let's see if you can have another go like that!"
		},
	},
	{
		Name = "HermesRunClearedNewRecord04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesRunClearedNewRecord03" },
		RequiresLastRunCleared = true,
		RequiresBestClearTimeLastRun = true,
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Hermes_0216",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're getting faster, Coz, keep at it, just like that! Can always go a little faster than before is what I always say!"
		},
	},
	{
		Name = "HermesRunClearedNewRecord05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesRunClearedNewRecord04" },
		RequiresLastRunCleared = true,
		RequiresBestClearTimeLastRun = true,
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Hermes_0217",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, Coz, looks to me you beat your fastest time climbing up out of there! That's nicely done! Can you go faster still?"
		},
	},
	{
		Name = "HermesRunClearedNewRecord06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesRunClearedNewRecord05" },
		RequiresLastRunCleared = true,
		RequiresBestClearTimeLastRun = true,
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Hermes_0218",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"What do you know, you beat your personal best time escaping recently! I hope my blessing helped a bit with that!"
		},
	},
	{
		Name = "HermesRunClearStreak01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		RequiresLastRunCleared = true,
		RequiredMinConsecutiveClears = 3,
		{
			Cue = "/VO/Hermes_0112",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Well look at you, Coz! Rushing to victory after successive victory. Caught wind of your accomplishments down there! Well then, let's keep the streak alive!"
		},
	},
	{
		Name = "HermesRunClearStreakBroken01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesFirstRunCleared01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesRunClearStreak01", },
		RequiresLastRunNotCleared = true,
		{
			Cue = "/VO/Hermes_0113",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Heard the news you broke your streak of victories of late, boss. Happens, right? You seem the sort to bounce right back, though. Let me help with that!"
		},
	},
	-- #endregion
	-- #region Misc NPC reaction voicelines
	{
		Name = "HermesAboutThanatos01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "HermesAboutApolloKeepsake01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", "ThanatosGift06" },
		{
			Cue = "/VO/Hermes_0076",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're pretty close with Thanatos, aren't you, boss? We don't often run in the same lanes, though our duties sometimes intersect a bit. Odd chap. Seems good at what he does, though!"
		},
	},
	{
		Name = "HermesAboutOrpheus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutThanatos01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OrpheusGift02", "HermesGift02" },
		RequiredMinNPCInteractions = { NPC_Orpheus_01 = 10 },
		{
			Cue = "/VO/Hermes_0121",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I hear you're close with Orpheus down there, you get the chance, you tell him I said hey! He's pretty decent with that lyre of his, last time I checked."
		},
	},
	{
		Name = "HermesAboutEurydice01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutThanatos01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesGift03", "HermesAboutOrpheus01" },
		RequiredAnyTextLines = { "EurydiceAboutOrpheus01", "EurydiceAboutOrpheus01_B" },
		{
			Cue = "/VO/Hermes_0224",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey boss, in all your travels there, you happen to run into a lass by name Eurydice? Hope she's all right! I feel bad because we didn't get a proper send-off last we met."
		},
	},
	{
		Name = "HermesAboutEurydice02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutThanatos01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "EurydiceAboutHermes01" },
		{
			Cue = "/VO/Hermes_0120",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I caught wind you found Eurydice down there, that's great! Long as she's on the up and up, I can eject her from the tiny worry center of my mind."
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(
	newPortedInteractTextLines, "HermesUpgrade", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Hermes = { "Dusa" } }, { Hermes_ = "Dusa_0" },
	{ Hermes_ = "ModsNikkelMHadesBiomes_Portrait_Hermes_Default_01" }
)
