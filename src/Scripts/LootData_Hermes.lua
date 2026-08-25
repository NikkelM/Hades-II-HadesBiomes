-- Don't play Hermes' rushed delivery cues if a Hermes delivery dialogue is skipped, as it's not Hermes who's speaking last
table.insert(game.LootData.HermesUpgrade.TextLinesEndEvents[1].GameStateRequirements, {
	PathFromArgs = true,
	PathFalse = { "ModsNikkelMHadesBiomesIsHermesDeliveredDialogue" },
})

local newPortedInteractTextLines = {
	-- #region First pickup
	{
		Name = "HermesFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		-- Removing this prerequisite to allow this one to play before the delivered AthenaFirstPickUp
		-- RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/ZagreusField_1923",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 3.05 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text = "This mark, almost like a bat wing. In the name of Hades! Olympus! I accept this message."
		},
		{
			Cue = "/VO/Hermes_0002",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"Hey boss, found you, good. Hermes, at your service. Pleasure! You are the talk of Olympus! Normally I wouldn't get mixed up, but for you, I will be making an exception. Now, come on, we both got places to be!"
		},
	},
	-- #endregion
	-- #region Opener
	{
		Name = "HermesSecondPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaFirstPickUp",
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
	-- #endregion
	-- #region Super-priority story and quests
	{
		Name = "HermesAboutCharonFight01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus01",
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
	-- #region Priority story
	{
		Name = "HermesAboutPersephoneMeeting01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
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
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
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
		-- Used to be called HermesPostEnding01 as well, but was a duplicate with a SuperPriority textline
		Name = "HermesPostEnding02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
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
	{
		Name = "HermesExpectingZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredFalseGodLoot = "ZeusUpgrade",
		RequiredTrait = "ForceZeusBoonTrait",
		{
			Cue = "/VO/Hermes_0061",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Sorry, boss, my pop had pressing matters to attend to. But I'm here! Relaying you that message, and relaying this."
		},
	},
	{
		Name = "HermesExpectingPoseidon01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredFalseGodLoot = "PoseidonUpgrade",
		RequiredTrait = "ForcePoseidonBoonTrait",
		{
			Cue = "/VO/Hermes_0062",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Here to tell you that Poseidon's on his way, boss. Sometimes he is a little slow. But you'll meet up with him again eventually!"
		},
	},
	{
		Name = "HermesExpectingAthena01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredFalseGodLoot = "AthenaUpgrade",
		RequiredTrait = "ForceAthenaBoonTrait",
		{
			Cue = "/VO/Hermes_0060",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Expecting someone else, there, boss? A certain half-sister of mine perchance? Well, tough break, I got here first. Want one of these, or not?"
		},
	},
	{
		Name = "HermesExpectingAres01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredFalseGodLoot = "AresUpgrade",
		RequiredTrait = "ForceAresBoonTrait",
		{
			Cue = "/VO/Hermes_0063",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Soon as I heard you were looking to see Ares, boss, I got here as fast as I could! He's never going to beat me. Much less in all that armor."
		},
	},
	{
		Name = "HermesExpectingAphrodite01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredFalseGodLoot = "AphroditeUpgrade",
		RequiredTrait = "ForceAphroditeBoonTrait",
		{
			Cue = "/VO/Hermes_0064",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Aphrodite said she's running just a little late, Coz, though I'm sure you understand. Besides, I'm here! In spirit anyhow."
		},
	},
	{
		Name = "HermesExpectingDemeter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredFalseGodLoot = "DemeterUpgrade",
		RequiredTrait = "ForceDemeterBoonTrait",
		{
			Cue = "/VO/Hermes_0160",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"That chill you were expecting in the air, that wasn't Demeter this time, here, boss! No, that was just me whisking to you in a flash. Makes for a little pleasant breeze I think!"
		},
	},
	{
		Name = "HermesAboutPlume02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutPlume01" },
		RequiredAnyTextLines = { "HermesGift06", "HermesGift06B" },
		RequiredTrait = "FastClearDodgeBonusTrait",
		RequiresMaxKeepsake = true,
		{
			Cue = "/VO/Hermes_0115",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey looking like you're getting some good use out of that fancy plume of yours! Keep going like that, maybe someday you'll be half as quick as me!"
		},
	},
	{
		Name = "HermesAboutSkelly01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", "HermesGift01", "SkellyBackstory01" },
		RequiredAnyTextLines = { "HermesAboutHourglass01", "HermesLootBought01", "HermesLootBought01_B" },
		RequiredTrait = "ReincarnationTrait",
		RequiresMaxKeepsake = true,
		{
			Cue = "/VO/Hermes_0117",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I got a keen eye, boss, so I happened to notice that you've got a certain tooth you're carrying about. Know you're from the land of the dead and all, but don't you think that comes across as just a little odd?"
		},
	},
	{
		Name = "HermesAboutOlympianReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		RequiredTextLines = { "HermesFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
		{
			Cue = "/VO/ZagreusField_4343",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 2.7 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"I get to be the messenger this time. In the name of Hades! Olympus, this is an official message! Lord Hermes? Got here as quickly as I could."
		},
		{
			Cue = "/VO/Hermes_0226",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"Why, that looks like you've got a message just for {#DialogueItalicFormat}me{#PreviousFormat}, this time, how special is that, boss? Some sort of invite from the looks of things. You sure that I'm supposed to have this, seeing as I'm not officially involved?"
		},
	},
	{
		Name = "HermesPostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", },
		{
			Cue = "/VO/Hermes_0227",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Got to tell you, Coz, that was a real something of a feast back your place! A little awkward, having to pretend we just met, but hey, I'm an Olympian! Means I can posture with the best of them. Good times, Coz! Glad it all worked out."
		},
	},
	-- #endregion
	-- #region Priority NPC reaction dialogues
	{
		Name = "HermesAboutThanatos01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
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
		Name = "HermesAboutThanatos02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutThanatos01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutThanatos01", },
		RequiredAnyTextLines = { "BecameCloseWithThanatos01", "BecameCloseWithThanatos01_B" },
		MinRunsSinceAnyTextLines = { TextLines = { "ThanatosAboutRelationship02" }, Count = 2 },
		{
			Cue = "/VO/Hermes_0157",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Saw Thanatos again lately, here, boss, and want to tell you, almost looked as though he cracked a smile when he mentioned you! Never seen anything like that with him!"
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
	-- #region Priority story
	{
		Name = "HermesAboutZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredGodLoot = "ZeusUpgrade",
		{
			Cue = "/VO/Hermes_0053",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You heard already from my pop, haven't you, Coz? Wonderful guy. Don't get to spend a lot of time together, though! You know how that is. Well, see you!"
		},
	},
	{
		Name = "HermesAboutZeus02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutZeus01" },
		RequiredGodLoot = "ZeusUpgrade",
		{
			Cue = "/VO/Hermes_0223",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You know, Coz, my pop never gives his lightning blessings to me! He's quite invested in what happens to you, isn't he?"
		},
	},
	{
		Name = "HermesAboutPoseidon01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredGodLoot = "PoseidonUpgrade",
		{
			Cue = "/VO/Hermes_0054",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Want to bring you in on something, boss. Reason that Uncle Poseidon got to you before I did is, I let him. He's under the impression he's as spry as ever! {#DialogueItalicFormat}Hah!{#PreviousFormat}"
		},
	},
	{
		Name = "HermesAboutAthena01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredGodLoot = "AthenaUpgrade",
		{
			Cue = "/VO/Hermes_0055",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So then Athena's looking out for you, that's good, that's good! She likes to put a lot of thought and stuff in everything, it's all a little much, if you ask me!"
		},
	},
	{
		Name = "HermesAboutAres01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredGodLoot = "AresUpgrade",
		{
			Cue = "/VO/Hermes_0056",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You know who keeps me awful busy, Coz? Ares. Nothing like a good old war amongst the mortals to create demand for lots and lots of messages to go around!"
		},
	},
	{
		Name = "HermesAboutArtemis01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredGodLoot = "ArtemisUpgrade",
		{
			Cue = "/VO/Hermes_0057",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Did Artemis manage to locate you already, boss? She's pretty good at that, I have to say. I'm faster! But she's fast, she's pretty fast, all right."
		},
	},
	{
		Name = "HermesAboutAphrodite01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredGodLoot = "AphroditeUpgrade",
		{
			Cue = "/VO/Hermes_0058",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Aphrodite's really something, don't you think so, Coz? Normally I'd stop for no one here. But when it comes to her, exceptions must be made!"
		},
	},
	{
		Name = "HermesAboutDionysus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredGodLoot = "DionysusUpgrade",
		{
			Cue = "/VO/Hermes_0059",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You ever get the feeling life's been moving all too quickly for you, boss? Well Dionysus doesn't, as you're probably aware. Throws quite a feast, though!"
		},
	},
	{
		Name = "HermesAboutDemeter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp", "DemeterGift01" },
		RequiredFalseFlags = { "PersephoneAway" },
		RequiredGodLoot = "DemeterUpgrade",
		{
			Cue = "/VO/Hermes_0159",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Been downright chilly up here lately, Coz! We've Demeter to thank for that! Me, I try to stay out of her way, she doesn't think I'm of much help to her. Although I'm sure she's warmed to you at least!"
		},
	},
	{
		Name = "HermesAboutHadesKeepsake01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp", "OlympianReunionQuestComplete" },
		RequiredTrait = "HadesShoutKeepsake",
		{
			Cue = "/VO/Hermes_0235",
			Emote = "PortraitEmoteSurprise",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Say, isn't that your father's blessing on you, Coz?! I almost can't believe it, but you've done such a good job of things, how could he {#DialogueItalicFormat}not {#PreviousFormat}approve?"
		},
	},
	{
		Name = "HermesBackstory01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0004",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Whoa, what's good, there, Coz? Though, who am I kidding, we can cut the small talk. I don't mind. I interrupt my brothers and my sisters all the time!"
		},
	},
	{
		Name = "HermesBackstory02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0067",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Boss, you've probably caught yourself thinking: {#DialogueItalicFormat}Hermes sure is quick! So how come it took so long for him to show up in the first place? {#PreviousFormat}Well, I'm afraid that's not for you to know. But! It's not because I was late. Not late for anything."
		},
	},
	{
		Name = "HermesBackstory03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesBackstory01", "HermesBackstory02" },
		{
			Cue = "/VO/Hermes_0068",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, uh, could you do a little favor for me, Coz? My brothers, sisters, family, and whatnot, they're unaware I'm working with you, here. It's no big deal, but let's keep it that way for now. All right?"
		},
	},
	{
		Name = "HermesBackstory04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", "HermesLootBought02" },
		{
			Cue = "/VO/Hermes_0069",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Happened to be in the area, boss! Seeing as the mortal folk up here keep dying off, and someone's got to bring their souls to your domain, now, don't they."
		},
	},
	{
		Name = "HermesBackstory05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesGift05" },
		{
			Cue = "/VO/Hermes_0072",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Know that saying {#DialogueItalicFormat}'don't be hasty'{#PreviousFormat}, boss? That comes from me. I swear! A little way to stave off competition, masquerading as the wisdom of a sage. Those stupid mortals will buy anything!"
		},
	},
	{
		Name = "HermesBackstory06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesBackstory03", "HermesGift02" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Hermes_0193",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Not that I really know {#DialogueItalicFormat}exactly {#PreviousFormat}what you're up to, Coz, but! If I did, I don't think anybody on Olympus is aware of it. Or, if they are, they're keeping their mouths shut. The same as me!"
		},
	},
	{
		Name = "HermesBackstory07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesBackstory02", "HermesGift04" },
		{
			Cue = "/VO/Hermes_0214",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You ever wonder how I got this fast, Coz? Lots of practicing, I'll tell you that! And being born unnaturally quick, I guess!"
		},
	},
	{
		Name = "HermesAboutSkinnyLittleChap01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		-- these requirements are purely coincidental to the content of this event
		RequiredAnyTextLines = { "HermesAboutSecretService01", "SkellyBackstory03", "SkellyGift09", "HermesGift08" },
		{
			Cue = "/VO/Hermes_0195",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Once took a skinny little chap down to the Underworld, got the business end of a sharp spear, he did! He had it coming, though, a lot of lying, cheating, and the like. Last that I heard, he's still making his amends down there. {#DialogueItalicFormat}Eh{#PreviousFormat}!"
		},
	},
	{
		Name = "HermesAboutSkelly02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "SkellyAboutSources01", },
		{
			Cue = "/VO/Hermes_0118",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Boss, I know you've heard a certain rumor from a very skinny individual who's uninclined to move. You best keep that one to yourself, all right? Or else our jig is up, and your father wouldn't like that, nor would you. So, cheers!"
		},
	},
	{
		Name = "HermesAboutSkelly03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutSkelly01", "HermesGift05", "SkellyGift09" },
		{
			Cue = "/VO/Hermes_0196",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Say, you're in good with what's-his-name, the one who gave you his lucky tooth? So he's an all-right sort, then. Has to be, if you put up with him!"
		},
	},
	{
		Name = "HermesAboutSecretService01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "SkellyAboutSources02" },
		RequiredFalseTextLinesLastRun = { "SkellyAboutSources02" },
		{
			Cue = "/VO/Hermes_0165",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So, now you've found me out, haven't you, Coz? Heard from the big boat-man himself. Well, good! We're pleased to be of service. And {#DialogueItalicFormat}we've {#PreviousFormat}got a lot of dirt on {#DialogueItalicFormat}you{#PreviousFormat}, so you be sure to keep our secrets, too. All right?"
		},
	},
	{
		Name = "HermesAboutSecretService02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "Ending01", "HermesGift08", "CharonGift07" },
		RequiredAnyTextLines = { "HermesLootBought01", "HermesLootBought01_B", "HermesAboutHourglass01" },
		{
			Cue = "/VO/Hermes_0231",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So my professional associate, the fearsome boatman on the River Styx? You got to know him pretty well in all of this, right, Coz? Hard getting through to him, I know, but his heart's in the right place! It's why I'm working with him, after all this time!"
		},
	},
	{
		Name = "HermesAboutHades01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", "HadesAboutCharon01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Hermes_0071",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Met your father face to face only the one time, Coz. Despite rendering services to him for quite a while. Memorable experience, I'll give it that! Seems like he's not done anything with all the messages my side keeps sending him."
		},
	},
	{
		Name = "HermesPostEpilogue02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", },
		{
			Cue = "/VO/Hermes_0228",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Everybody on Olympus, they're still going on about Persephone, Queen of the Underworld! They had no idea she was down there all along, none whatsoever, Coz! And as for me, now I can deliver you my blessings more officially, I think!"
		},
	},
	{
		Name = "HermesPostEpilogue03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "HermesGift03" },
		{
			Cue = "/VO/Hermes_0229",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Even though everything's out in the open, now, and all my brothers, sisters, and whatnot are going to keep helping you fight your way out of there, I've still been keeping to myself, of late! That way nobody slows me down."
		},
	},
	{
		Name = "HermesPostEpilogue04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "HermesGift04" },
		MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 3 },
		{
			Cue = "/VO/Hermes_0230",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Some members of the family up here, I know they haven't helped at all, but just don't take it personal or anything, all right? Think of it this way: You've got more of us getting along and talking properly than I have ever {#DialogueItalicFormat}seen{#PreviousFormat}!"
		},
	},
	{
		Name = "HermesAboutPersephoneVisit01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		RequiredTrueFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Hermes_0233",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your mother got from there just fine, don't worry, Coz! She had me looking after her, and such. Seemed real nice! Told me to tell you hi."
		},
	},
	{
		Name = "HermesAboutPersephoneVisit02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusAboutOrpheus02",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		RequiredTrueFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Hermes_0234",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You know, I never knew the pomegranate seeds down in the Underworld held such power if not for your mother mentioning it, Coz! And here I thought they were just tasty, that was it!"
		},
	},
	-- #endregion
	-- #region Contextual
	{
		Name = "HermesExpectingMiscOlympian01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMinAnyTextLines = { TextLines = { "HermesExpectingZeus01", "HermesExpectingPoseidon01", "HermesExpectingAthena01", "HermesExpectingAphrodite01", "HermesExpectingAres01", "HermesExpectingArtemis01", "HermesExpectingDionysus01", "HermesExpectingDemeter01", }, Count = 2 },
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		-- Adding H2 gods
		RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait", "ForceHeraBoonKeepsake", "ForceApolloBoonKeepsake", "ForceHephaestusBoonKeepsake", "ForceHestiaBoonKeepsake" },
		{
			Cue = "/VO/Hermes_0166",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Afraid your regularly scheduled Olympian could not be here right now, because I'm that much faster, boss!"
		},
	},
	{
		Name = "HermesExpectingMiscOlympian02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMinAnyTextLines = { TextLines = { "HermesExpectingZeus01", "HermesExpectingPoseidon01", "HermesExpectingAthena01", "HermesExpectingAphrodite01", "HermesExpectingAres01", "HermesExpectingArtemis01", "HermesExpectingDionysus01", "HermesExpectingDemeter01", }, Count = 2 },
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		-- Adding H2 gods
		RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait", "ForceHeraBoonKeepsake", "ForceApolloBoonKeepsake", "ForceHephaestusBoonKeepsake", "ForceHestiaBoonKeepsake" },
		{
			Cue = "/VO/Hermes_0167",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You might have been expecting someone else, here, boss. But I just couldn't help beating them to the punch this time!"
		},
	},
	{
		Name = "HermesExpectingMiscOlympian03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredMinAnyTextLines = { TextLines = { "HermesExpectingZeus01", "HermesExpectingPoseidon01", "HermesExpectingAthena01", "HermesExpectingAphrodite01", "HermesExpectingAres01", "HermesExpectingArtemis01", "HermesExpectingDionysus01", "HermesExpectingDemeter01", }, Count = 2 },
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		-- Adding H2 gods
		RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait", "ForceHeraBoonKeepsake", "ForceApolloBoonKeepsake", "ForceHephaestusBoonKeepsake", "ForceHestiaBoonKeepsake" },
		{
			Cue = "/VO/Hermes_0168",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Got here just as quickly as I could, Coz. Which turns out to be quite a bit faster than my relatives!"
		},
	},
	{
		Name = "HermesExpectingMiscOlympian04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMinAnyTextLines = { TextLines = { "HermesExpectingZeus01", "HermesExpectingPoseidon01", "HermesExpectingAthena01", "HermesExpectingAphrodite01", "HermesExpectingAres01", "HermesExpectingArtemis01", "HermesExpectingDionysus01", "HermesExpectingDemeter01", }, Count = 2 },
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		-- Adding H2 gods
		RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait", "ForceHeraBoonKeepsake", "ForceApolloBoonKeepsake", "ForceHephaestusBoonKeepsake", "ForceHestiaBoonKeepsake" },
		{
			Cue = "/VO/Hermes_0169",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'm sure that keepsake that you brought will come in handy soon enough, there, boss!"
		},
	},
	{
		Name = "HermesExpectingMiscOlympian05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMinAnyTextLines = { TextLines = { "HermesExpectingZeus01", "HermesExpectingPoseidon01", "HermesExpectingAthena01", "HermesExpectingAphrodite01", "HermesExpectingAres01", "HermesExpectingArtemis01", "HermesExpectingDionysus01", "HermesExpectingDemeter01", }, Count = 2 },
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		-- Adding H2 gods
		RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait", "ForceHeraBoonKeepsake", "ForceApolloBoonKeepsake", "ForceHephaestusBoonKeepsake", "ForceHestiaBoonKeepsake" },
		{
			Cue = "/VO/Hermes_0170",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My relatives are normally quite quick to heed the call of anybody bearing one of their keepsakes! Huh!"
		},
	},
	{
		Name = "HermesExpectingMiscOlympian06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMinAnyTextLines = { TextLines = { "HermesExpectingZeus01", "HermesExpectingPoseidon01", "HermesExpectingAthena01", "HermesExpectingAphrodite01", "HermesExpectingAres01", "HermesExpectingArtemis01", "HermesExpectingDionysus01", "HermesExpectingDemeter01", }, Count = 2 },
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		-- Adding H2 gods
		RequiredOneOfTraits = { "ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAresBoonTrait", "ForceAphroditeBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait", "ForceHeraBoonKeepsake", "ForceApolloBoonKeepsake", "ForceHephaestusBoonKeepsake", "ForceHestiaBoonKeepsake" },
		{
			Cue = "/VO/Hermes_0171",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I may not be the god you're looking for right at the moment, boss, but I will get you on your way to them in no time here!"
		},
	},
	{
		Name = "HermesAboutMegRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", "HermesGift03" },
		RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
		MinRunsSinceAnyTextLines = { TextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" }, Count = 2 },
		{
			Cue = "/VO/Hermes_0194",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Heard you've been seeing the Fury, Megaera, Coz? Got the impression she was quite a handful, though I guess the same can probably be said of you, there, huh? You two have fun!"
		},
	},
	{
		Name = "HermesMessage01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesBackstory03", "HermesSecondPickUp", },
		RequiredFalseTextLinesLastRun = { "HermesMessage01", "HermesMessage02", "HermesMessage03", "HermesMessage04", "HermesMessage05", "HermesMessage06" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Hermes_0073",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Message from Olympus for you, boss! It says, {#DialogueItalicFormat}'It sure is nice up here upon this mountain, not having to escape the Underworld! Come join us soon, won't you?'{#PreviousFormat}"
		},
	},
	{
		Name = "HermesMessage02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesMessage01", },
		RequiredFalseTextLinesLastRun = { "HermesMessage01", "HermesMessage02", "HermesMessage03", "HermesMessage04", "HermesMessage05", "HermesMessage06" },
		RequiresLastRunNotCleared = true,
		{
			Cue = "/VO/Hermes_0074",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Message for you, boss. It says, {#DialogueItalicFormat}'You're rather slow. If only somebody could help you out with that.' {#PreviousFormat}Huh, fancy that, what a coincidence!"
		},
	},
	{
		Name = "HermesMessage03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		Priority = true,
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesMessage01", },
		RequiredFalseTextLinesLastRun = { "HermesMessage01", "HermesMessage02", "HermesMessage03", "HermesMessage04", "HermesMessage05", "HermesMessage06" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredMinCompletedRuns = 20,
		RequiresLastRunNotCleared = true,
		{
			Cue = "/VO/Hermes_0075",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Got you a message, Coz. Says here, {#DialogueItalicFormat}ahem{#PreviousFormat}: {#DialogueItalicFormat}'Hurry up and get out of there already.' {#PreviousFormat}It's from the surface of the earth, says so right here."
		},
	},
	{
		Name = "HermesMessage04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesMessage01", },
		RequiredFalseTextLinesLastRun = { "HermesMessage01", "HermesMessage02", "HermesMessage03", "HermesMessage04", "HermesMessage05", "HermesMessage06" },
		{
			Cue = "/VO/Hermes_0158",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Another message here! It says, {#DialogueItalicFormat}'One small spoon dried oregano, two spoons extra virgin olive oil, one large onion, minced, a dash of salt to taste,' {#PreviousFormat}wait, this isn't for you. Though you should try it sometime if you ever make it out!"
		},
	},
	{
		Name = "HermesMessage05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesMessage01", },
		RequiredAnyTextLines = { "HermesGift07", "HermesGift07B" },
		RequiredFalseTextLinesLastRun = { "HermesMessage01", "HermesMessage02", "HermesMessage03", "HermesMessage04", "HermesMessage05", "HermesMessage06" },
		{
			Cue = "/VO/Hermes_0176",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Message for you, Coz, it says, {#DialogueItalicFormat}'On behalf of all Olympus, we would like for you to know that was a right good bottle of Ambrosia that you offered to the god of travel, Hermes, who appreciated every drop.' {#PreviousFormat}Sincerely, me!"
		},
	},
	{
		Name = "HermesMessage06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesMessage01", },
		RequiredAnyTextLines = { "HermesGift08", "HermesGift08B" },
		RequiredFalseTextLinesLastRun = { "HermesMessage01", "HermesMessage02", "HermesMessage03", "HermesMessage04", "HermesMessage05", "HermesMessage06" },
		{
			Cue = "/VO/Hermes_0177",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Another message for you, Coz, this one says, {#DialogueItalicFormat}'Hey, mate! If you ever do make it up here up on this mountaintop for whatever reason, we should hang out, all right? I can show you around.' {#PreviousFormat} Your friend, Hermes."
		},
	},
	{
		Name = "HermesMaxRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "HermesMessage06" },
		{
			Cue = "/VO/Hermes_0178",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You know, boss, just between us? Out of all special delivery recipients I've had over the ages, here, I've got to say, you're the most interesting one!"
		},
	},
	{
		Name = "HermesRunProgress01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp", "HermesLootBought02" },
		{
			Cue = "/VO/Hermes_0070",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You know, Coz, all this time that I've been bussing souls across the borders of your father's land, it's good to have the chance to help somebody out the other way!"
		},
	},
	{
		Name = "HermesAboutHourglass01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		RequiredTrait = "ShopDurationTrait",
		{
			Cue = "/VO/Hermes_0116",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"That's quite a nice Bone Hourglass you got, there, boss! So you're in good with my professional associate, as well. A real gentleman!"
		},
	},
	{
		Name = "HermesAboutPlume01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		RequiredTrait = "FastClearDodgeBonusTrait",
		{
			Cue = "/VO/Hermes_0114",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Why, look at you, there, boss! I recognize that fancy plume you got! Just an iota of my speediness in there, but still! Much more than most can do."
		},
	},
	{
		Name = "HermesAboutWhippedFrenzy01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMinActiveMetaUpgradeLevel = { Name = "EnemySpeedShrineUpgrade", Count = 2 },
		{
			Cue = "/VO/Hermes_0077",
			Emote = "PortraitEmoteSurprise",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Whoa, what's gotten into all those lifeless wretches that you're always fighting with down there? They're really moving lately! Whatever's made them go all out, it wasn't me!"
		},
	},
	{
		Name = "HermesAboutEnemySpeedCondition01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		RequiredActiveMetaUpgrade = "EnemySpeedShrineUpgrade",
		{
			Cue = "/VO/Hermes_0188",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Got all your father's lifeless wretches hot and bothered, going all out all because of that {#DialogueItalicFormat}Forced Overtime {#PreviousFormat}condition of his, isn't that right, Coz? Well, if they're interested in getting things done quickly, I am sure you can oblige them in a bit!"
		},
	},
	{
		Name = "HermesAboutEnemySpeedCondition02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutWhippedFrenzy01", },
		RequiredMinActiveMetaUpgradeLevel = { Name = "EnemySpeedShrineUpgrade", Count = 2 },
		{
			Cue = "/VO/Hermes_0189",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Looks like those lifeless wretches you're contending with down there are {#DialogueItalicFormat}really {#PreviousFormat}on the move this time around, aren't they, boss? Oh, well, you're faster still, I'm sure!"
		},
	},
	{
		Name = "HermesAboutBiomeSpeedCondition01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutWhippedFrenzy01", },
		RequiredActiveMetaUpgrade = "BiomeSpeedShrineUpgrade",
		{
			Cue = "/VO/Hermes_0190",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Somebody's on a tight deadline, I take it, Coz? Courtesy of your father's Pact, well, you believe me, I know how that is, so I won't keep you, just keep moving, right?"
		},
	},
	{
		Name = "HermesAboutBiomeSpeedCondition02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		-- Changed from HermesAboutWhippedFrenzy03 which doesn't exist
		RequiredTextLines = { "HermesAboutBiomeSpeedCondition01" },
		RequiredActiveMetaUpgrade = "BiomeSpeedShrineUpgrade",
		{
			Cue = "/VO/Hermes_0191",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I realize you're on a tight deadline, there, boss, so let's dispense with all unnecessary chit-chat here and get you on your merry way, posthaste!"
		},
	},
	{
		Name = "HermesAboutBiomeSpeedCondition03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutWhippedFrenzy01", },
		RequiredActiveMetaUpgrade = "BiomeSpeedShrineUpgrade",
		{
			Cue = "/VO/Hermes_0192",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You racing against time to keep things interesting, or what, there, boss? Turns out that time goes pretty quick. I like racing against it, too!"
		},
	},
	{
		Name = "HermesAboutTimer01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		RequiredTrueConfigOptions = { "ShowGameplayTimer", },
		{
			Cue = "/VO/Hermes_0087",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Hah! {#PreviousFormat}Can't help but notice you've been timing yourself, boss! Good habit that. Keep an eye on the time, you'll get faster and faster! Not as fast as me, mind."
		},
	},
	{
		Name = "HermesAboutTimer02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutTimer01", },
		RequiredTrueConfigOptions = { "ShowGameplayTimer", },
		{
			Cue = "/VO/Hermes_0088",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You know, Coz, since you're timing yourself, case you haven't noticed, doesn't count against you when we stop to have these chats! Insisted on that little rule myself."
		},
	},
	{
		Name = "HermesAboutTimer03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutTimer01", },
		RequiredFalseConfigOptions = { "ShowGameplayTimer", },
		{
			Cue = "/VO/Hermes_0089",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey, you stopped timing yourself, boss, everything all right? If that's not a cry for help, well, I don't know what is. Um, here!"
		},
	},
	{
		Name = "HermesAboutTimer04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutTimer01", "HermesAboutTimer03" },
		RequiredTrueConfigOptions = { "ShowGameplayTimer", },
		{
			Cue = "/VO/Hermes_0090",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Good, boss, I can see you're clocking yourself once again. Little term I like to use, means beating yourself up whilst keeping time!"
		},
	},
	{
		Name = "HermesAboutTimer05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesAboutTimer04", },
		RequiredFalseConfigOptions = { "ShowGameplayTimer", },
		{
			Cue = "/VO/Hermes_0091",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Look, Coz, if you aren't always going to time yourself, that is a choice of lifestyle I have to respect. And learn to understand."
		},
	},
	{
		Name = "HermesFirstRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
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
	{
		Name = "HermesAboutHearing01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesGift01" },
		RequiresLastRunNotCleared = true,
		RequiredFalseRooms = { "RoomOpening" },
		{
			Cue = "/VO/Hermes_0204",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Thought I'd check up on you, there, boss. You doing well, everything good and all? Can't hear you one iota, mind, so then, don't answer that!"
		},
	},
	{
		Name = "HermesAboutHurrying01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesGift05" },
		RequiredFalseConfigOptions = { "ShowGameplayTimer", },
		RequiredInactiveMetaUpgrade = "BiomeSpeedShrineUpgrade",
		{
			Cue = "/VO/Hermes_0205",
			Emote = "PortraitEmoteFiredUp",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Come quickly, boss! You need to hurry up and get out of there, you're running out of time!! You're not, really, but it's a bit of motivation, hey?"
		},
	},
	{
		Name = "HermesLegendaryPickUp01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Hermes_0099",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Oh, you ready for this, boss? Got you the {#DialogueItalicFormat}Premium Express {#PreviousFormat}this time. Absolute cream of the crop right here! You're going to go real far."
		},
	},
	{
		Name = "HermesLegendaryPickUp02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Hermes_0100",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Guess what, Coz? It's the {#DialogueItalicFormat}Premium Express{#PreviousFormat}, delivered straight to you, fresh from the richest mountaintop up here! You're going to like this."
		},
	},
	{
		Name = "HermesLegendaryPickUp03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Hermes_0101",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Express-delivered message for you, Coz. It says: {#DialogueItalicFormat}'Congratulations! You're my hundredth customer today.' {#PreviousFormat}And here is what you get!"
		},
	},
	{
		Name = "HermesLowHealth01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Hermes_0092",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Eugh, I have to tell you, you look awful, Coz. You're barely holding on! Let's see if we can't perk you right back up."
		},
	},
	{
		Name = "HermesLowHealth02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Hermes_0093",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Whew{#PreviousFormat}! Looks like times hit you hard since last we had a run-in, Coz. Well, when life is tough, just hurry through the rubbish bits, I say!"
		},
	},
	{
		Name = "HermesLowHealth03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Hermes_0094",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Whoa you're a hot mess, there, Coz, what happened getting here? Ah well, I hope your travels run a little smoother here on out."
		},
	},
	{
		Name = "HermesLowHealth04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Hermes_0219",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"There's a fine line between being quick and being hasty, boss. And if you're hurt as bad as I think, I think you might be on the hasty side!"
		},
	},
	{
		Name = "HermesLowHealth05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Hermes_0220",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Well, good news is you got to me, but I can tell you hit a lot of bad news on the way! You stay alive, all right?"
		},
	},
	{
		Name = "HermesLowHealth06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Hermes_0221",
			Emote = "PortraitEmoteSurprise",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Oof{#PreviousFormat}! What happened getting here, boss? Let me guess, you got whipped, burned, beat up with spectral clubs... something like that?"
		},
	},
	{
		Name = "HermesLowHealth07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesExpectingMiscOlympian01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Hermes_0222",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're looking worse for wear, I hate to tell you, boss. But, we can pick you up and get you going here, I think!"
		},
	},
	-- #endregion
	-- #region Misc
	{
		Name = "HermesMiscPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "HermesExpectingMiscOlympian01",
			CreateNewPriorityGroup = true,
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0027",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"All right, Coz, here's the goods, fresh from our mountaintop. Take all the time you need deciding! If you want to be a slowpoke."
		},
	},
	{
		Name = "HermesMiscPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0028",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Won't need but a moment of your time, here, boss! And you'll more than make up for it right quick, you got my guarantee!"
		},
	},
	{
		Name = "HermesMiscPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredFalseBiome = "Tartarus",
		{
			Cue = "/VO/Hermes_0029",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"All right, Coz, express delivery to {#DialogueItalicFormat}where{#PreviousFormat}-in-blazes are you at right now? Anyway take one of these, and go about your business!"
		},
	},
	{
		Name = "HermesMiscPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0030",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I know you're kind of in a hurry, boss. But let me show you what a {#DialogueItalicFormat}real {#PreviousFormat}hurry's all about in just a moment here!"
		},
	},
	{
		Name = "HermesMiscPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		{
			Cue = "/VO/Hermes_0031",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Package for you, boss! And I think you know what's inside. Well, maybe not exactly, but... just pick something, will you?"
		},
	},
	{
		Name = "HermesMiscPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0032",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Come on, Coz, you can do this! And furthermore, I think you can do this rather quick! Now go!"
		},
	},
	{
		Name = "HermesMiscPickup07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0033",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It's you, boss, that's good! But you're standing still! That's bad. Let's get you up and moving about again, all right?"
		},
	},
	{
		Name = "HermesMiscPickup08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0034",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey, boss! Not much to report up here. But I've not exactly come this far to bring you news, have I?"
		},
	},
	{
		Name = "HermesMiscPickup09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0035",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Afraid there's no one faster than myself, here, Coz. But good news is, {#DialogueItalicFormat}you {#PreviousFormat}are about to close the gap a little bit!"
		},
	},
	{
		Name = "HermesMiscPickup10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		{
			Cue = "/VO/Hermes_0036",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Slow day so far, there, boss? Well all of that's about to change, you got my guarantee!"
		},
	},
	{
		Name = "HermesMiscPickup11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp", },
		{
			Cue = "/VO/Hermes_0037",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How 'bout we pick the pace up {#DialogueItalicFormat}just {#PreviousFormat}a little, Coz? Or maybe by a lot! Whatever you've the mood and stomach for right now."
		},
	},
	{
		Name = "HermesMiscPickup12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		{
			Cue = "/VO/Hermes_0038",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Last thing I ever want to do is slow you down, boss. So, enough chit-chat. Now pick and go. {#DialogueItalicFormat}Go{#PreviousFormat}!"
		},
	},
	{
		Name = "HermesMiscPickup13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0039",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've got a ways to go yet, boss. Good news is, the slowest part of this particular trip is hereby over... {#DialogueItalicFormat}now{#PreviousFormat}!"
		},
	},
	{
		Name = "HermesMiscPickup14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0040",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"All's well enough here on the surface, Coz. Though, sooner you can make it out of there, the better it'll be!"
		},
	},
	{
		Name = "HermesMiscPickup15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0041",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Another go up to the surface, boss? Might suggest that you be very quick about it. And might give you this!"
		},
	},
	{
		Name = "HermesMiscPickup16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0042",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Let's hustle, shall we, boss? Honestly, I don't know how the rest of you can stand it, trudging about like you don't have someplace to be!"
		},
	},
	{
		Name = "HermesMiscPickup17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0043",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hiya, boss! I'd ask what's new, but I already know! I have my ways. And you have to get right on out of there."
		},
	},
	{
		Name = "HermesMiscPickup18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0044",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Wish I could just fly in and haul you out of there, Coz, but there's some rules even I can't break. Though nice to see {#DialogueItalicFormat}you {#PreviousFormat}have a go of it!"
		},
	},
	{
		Name = "HermesMiscPickup19",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp", },
		{
			Cue = "/VO/Hermes_0045",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I come with urgent tidings, boss! Unfortunately not addressed to you. But someone got you these!"
		},
	},
	{
		Name = "HermesMiscPickup20",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Hermes_0046",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Sorry, Coz, no messages this time. Guess that's what happens when your whole existence is kept secret from the world!"
		},
	},
	{
		Name = "HermesMiscPickupExtra01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseRooms = { "RoomOpening" },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0202",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"There's not much new worth mentioning up here, though looks like {#DialogueItalicFormat}you {#PreviousFormat}have got your hands full down there, boss!"
		},
	},
	{
		Name = "HermesMiscPickupExtra02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0203",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've got a tough climb up ahead, Coz, so you just pace yourself, all right? Just kidding, go as quickly as you can. It works for me!"
		},
	},
	{
		Name = "HermesMiscPickup21",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0005",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Come on, now, boss, let's get you moving here!"
		},
	},
	{
		Name = "HermesMiscPickup22",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0006",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Got here in practically no time at all, boss. Ready now?"
		},
	},
	{
		Name = "HermesMiscPickup23",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0007",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey Coz, package for you here. Knock yourself out!"
		},
	},
	{
		Name = "HermesMiscPickup24",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0008",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Got a customary care package for you, Coz."
		},
	},
	{
		Name = "HermesMiscPickup25",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0009",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey, what's it going to be this time, boss?"
		},
	},
	{
		Name = "HermesMiscPickup26",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0010",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Come on, Coz, let's pick up the pace a bit!"
		},
	},
	{
		Name = "HermesMiscPickup27",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0011",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Go get yourself out of there in a hurry, Coz."
		},
	},
	{
		Name = "HermesMiscPickup28",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0012",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "No rush, but go on and pick one of these, boss."
		},
	},
	{
		Name = "HermesMiscPickup29",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0013",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Message for you, Coz: It says {#DialogueItalicFormat}'Take one, it's free, enjoy!'{#PreviousFormat}"
		},
	},
	{
		Name = "HermesMiscPickup30",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0014",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What's going on, there, boss? Are things all right?"
		},
	},
	{
		Name = "HermesMiscPickup31",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0015",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You want the usual, or what, there, boss?"
		},
	},
	{
		Name = "HermesMiscPickup32",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0016",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Special delivery and all that, boss! Here, take your pick."
		},
	},
	{
		Name = "HermesMiscPickup33",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0017",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hey boss! You take one of these, and go for it."
		},
	},
	{
		Name = "HermesMiscPickup34",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0018",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Just so happened to be in the area, here, boss!"
		},
	},
	{
		Name = "HermesMiscPickup35",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0019",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Making sure you got this, Coz. You got this, Coz!"
		},
	},
	{
		Name = "HermesMiscPickup36",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0020",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Here comes a little boost to get you up and out of there in no time, boss!"
		},
	},
	{
		Name = "HermesMiscPickup37",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0021",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Now, don't just stand there, Coz, pick one of these and {#DialogueItalicFormat}go{#PreviousFormat}!"
		},
	},
	{
		Name = "HermesMiscPickup38",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0022",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your quickness is my number one priority, here, boss."
		},
	},
	{
		Name = "HermesMiscPickup39",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0023",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "No time to waste and so on, Coz. Now, choose!"
		},
	},
	{
		Name = "HermesMiscPickup40",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0024",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Caught wind you need my services here, boss?"
		},
	},
	{
		Name = "HermesMiscPickup41",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0025",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Thought I'd check in, Coz. See how things are going. Slow, right? Not for long."
		},
	},
	{
		Name = "HermesMiscPickup42",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0026",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ready to hustle? Good! I'll take that as a yes."
		},
	},
	{
		Name = "HermesMiscPickup43",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0153",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let's get you quickly on your way, there, Coz!"
		},
	},
	{
		Name = "HermesMiscPickup44",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		{
			Cue = "/VO/Hermes_0154",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Message for you, boss. It says: {#DialogueItalicFormat}'Here, choose one of these, and go!'{#PreviousFormat}"
		},
	},
	{
		Name = "HermesMiscPickup45",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0155",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Another message for you! This one says: {#DialogueItalicFormat}'Hey boss! Take this!'{#PreviousFormat}"
		},
	},
	{
		Name = "HermesMiscPickup46",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0156",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Just thought I'd check up on you, boss, and bring you this!"
		},
	},
	{
		Name = "HermesMiscPickup47",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0201",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Hope you enjoyed the life of being slow, because all that's about to change, right here!"
		},
	},
	{
		Name = "HermesMiscPickup48",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0206",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All right, boss, here, let's get you on your way!"
		},
	},
	{
		Name = "HermesMiscPickup49",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0207",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Past time we got you out of there, right, boss?"
		},
	},
	{
		Name = "HermesMiscPickup50",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0208",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Just thought I'd drop by, give you this, and go!"
		},
	},
	{
		Name = "HermesMiscPickup51",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0209",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "We'll have you racing out of here in no time, Coz!"
		},
	},
	{
		Name = "HermesMiscPickup52",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0210",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "How goes it underground of late, there, boss?"
		},
	},
	{
		Name = "HermesMiscPickup53",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0211",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Nice day we're having on the surface! You should see it, boss!"
		},
	},
	{
		Name = "HermesMiscPickup54",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Hermes_0212",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Another day, another race up to the top! You ready, boss?"
		},
	},
	{
		Name = "HermesMiscPickup55",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.HermesBasicPickUpTextLines,
		{
			Cue = "/VO/Hermes_0213",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Well, here we go again! Let's go, then, boss!"
		},
	},
	{
		Name = "HermesFirstLootPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesFirstPickUp" },
		RequiredBiome = "Tartarus",
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		{
			Cue = "/VO/Hermes_0047",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Got here as quickly as I could, boss. Now what say we get you promptly the hell out of there!"
		},
	},
	{
		Name = "HermesFirstLootPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredBiome = "Tartarus",
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0048",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hey Coz, gathered you were just about to make another go of breaking out of there! Thought I'd stop by and give you a boost."
		},
	},
	{
		Name = "HermesFirstLootPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredBiome = "Tartarus",
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		RequiredTextLines = { "HermesFirstPickUp" },
		{
			Cue = "/VO/Hermes_0049",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You're raring for your next trek out of there, right, boss? Well then I guess I got here just in time."
		},
	},
	{
		Name = "HermesFirstLootPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredBiome = "Tartarus",
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		RequiredTextLines = { "HermesFirstPickUp" },
		{
			Cue = "/VO/Hermes_0050",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Heard you were heading out again, boss. Changed my schedule around a bit, not a big deal, and figured I'd drop in!"
		},
	},
	{
		Name = "HermesFirstLootPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredBiome = "Tartarus",
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		RequiredTextLines = { "HermesFirstPickUp" },
		{
			Cue = "/VO/Hermes_0051",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You're off again, are you? All right well then safe travels! Or swift travels, failing that!"
		},
	},
	{
		Name = "HermesFirstLootPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesMiscPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredBiome = "Tartarus",
		-- Adding H2 gods
		RequiredFalseGodLoots = { "ZeusUpgrade", "PoseidonUpgrade", "AthenaUpgrade", "AphroditeUpgrade", "AresUpgrade", "ArtemisUpgrade", "DionysusUpgrade", "DemeterUpgrade", "ApolloUpgrade", "HeraUpgrade", "HestiaUpgrade", "HephaestusUpgrade" },
		RequiredTextLines = { "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0052",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You ready for another go at this, Coz? Well then think I can speed you on your journey there."
		},
	},
	-- #endregion
}

mod.AddNarrativeDataEntries(newPortedInteractTextLines, "HermesUpgrade", "InteractTextLineSets",
	{
		TextLinePriorityType = "InteractTextLinePriorities",
		VoiceBankMappings = { Hermes = { "Modsnikkelmhadesbiomeshermes" } },
		CueMappings = { Hermes_ = "Modsnikkelmhadesbiomeshermes_" },
		PortraitMappings = { Hermes_ = "ModsNikkelMHadesBiomes_Portrait_Hermes_Default_01" },
	}
)

local newPortedLootBoughtTextLines = {
	{
		Name = "HermesLootBought01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesSecondPickUp" },
		RequiredFalseTextLines = { "HermesLootBought01_B" },
		{
			Cue = "/VO/Hermes_0095",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Why, hello, Coz! Odd that we're running into one another here! Among the wares of my professional associate, I mean. Must be some sort of clerical mistake!"
		},
	},
	{
		Name = "HermesLootBought01_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "HermesLootBought01", "HermesSecondPickUp" },
		{
			Cue = "/VO/Hermes_0161",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Why, hello, boss! Odd that we're running into one another here! Among the wares of my professional associate, I mean. Must be some sort of clerical mistake!"
		},
	},
	{
		Name = "HermesLootBought02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "HermesLootBought01", "HermesLootBought01_B", "HermesAboutHourglass01" },
		{
			Cue = "/VO/Hermes_0096",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're well familiar with my professional associate, there, with the boat? Souls of the recently departed got to make it over to the Underworld somehow. Part of my job! I bring them in, he takes them down."
		},
	},
	{
		Name = "HermesLootBought03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought02" },
		RequiredAnyTextLines = { "HermesLootBought01", "HermesLootBought01_B" },
		{
			Cue = "/VO/Hermes_0097",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I guess I'm used to these one-sided chats here, boss, thanks to my work experience with my professional associate down there! You tell him I said hi, all right?"
		},
	},
	{
		Name = "HermesLootBought04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought02", "HermesLootBought03" },
		{
			Cue = "/VO/Hermes_0098",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"A word of caution, Coz. Don't ask too many questions about me, or my professional associate down there. I hand souls over to him, and that's it, you understand?"
		},
	},
	{
		Name = "HermesLootBought05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought04" },
		{
			Cue = "/VO/Hermes_0179",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Wouldn't you know it, boss! I was just minding my own business, handing off a few dearly departed souls to my professional associate, and who shows up, but {#DialogueItalicFormat}you{#PreviousFormat}?"
		},
	},
	{
		Name = "HermesLootBought06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought04" },
		{
			Cue = "/VO/Hermes_0180",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My heavy-breathing professional associate was gracious enough to drop me off here with his other stuff, and for quite an affordable price, at that!"
		},
	},
	{
		Name = "HermesLootBought07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought04" },
		{
			Cue = "/VO/Hermes_0181",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"All right, then, let's go make that spend of hard-earned coin well worth your while! What do you think, Coz?"
		},
	},
	{
		Name = "HermesLootBought08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought04" },
		{
			Cue = "/VO/Hermes_0182",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'd tell you not to ask too many questions of my good professional associate nearby, but then, {#DialogueItalicFormat}who are we kidding{#PreviousFormat}, boss? Not like he'd answer you those questions anyhow!"
		},
	},
	{
		Name = "HermesLootBought09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought04" },
		{
			Cue = "/VO/Hermes_0183",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Message for you, boss, from my professional associate, who wanted you to know, and I quote, {#DialogueItalicFormat}'Hhhrrrrnnnngggggghhhhhh.'{#PreviousFormat}"
		},
	},
	{
		Name = "HermesLootBought10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought04" },
		{
			Cue = "/VO/Hermes_0184",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Been working with my good professional associate, the boatman there, since I-don't-know-how-long. Though, let me tell you, Coz, we haven't had a job quite like this yet!"
		},
	},
	{
		Name = "HermesLootBought11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought04" },
		{
			Cue = "/VO/Hermes_0185",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Among the many ways in which you could parlay your earnings into better chances of survival here, I'm flattered you would think of me this time!"
		},
	},
	{
		Name = "HermesLootBought12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought04" },
		{
			Cue = "/VO/Hermes_0186",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How strange of a coincidence that you keep running into me along the riverside like this, don't you agree, there, Coz?"
		},
	},
	{
		Name = "HermesLootBought13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HermesLootBought04" },
		{
			Cue = "/VO/Hermes_0187",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Don't normally go selling off my blessings to the highest bidder, boss, but your bid there is good enough for me!"
		},
	},
}
mod.AddNarrativeDataEntries(newPortedLootBoughtTextLines, "HermesUpgrade", "BoughtTextLines",
	{
		TextLinePriorityType = "BoughtTextLinePriorities",
		VoiceBankMappings = { Hermes = { "Modsnikkelmhadesbiomeshermes" } },
		CueMappings = { Hermes_ = "Modsnikkelmhadesbiomeshermes_" },
		PortraitMappings = { Hermes_ = "ModsNikkelMHadesBiomes_Portrait_Hermes_Default_01" },
	}
)
