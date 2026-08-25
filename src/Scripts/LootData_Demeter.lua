local newPortedInteractTextLines = {
	-- #region First pickup
	{
		Name = "DemeterFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		GameStateRequirements = {
			{
				-- Been on the Surface before
				PathTrue = { "GameState", "RoomsEntered", "D_Boss01" },
			},
		},
		{
			Cue = "/VO/ZagreusField_2966",
			Portrait = "Portrait_Zag_Defiant_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 7.3 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"Last time I felt a chill like this was... on the surface, but, who...? Well, one way to find out. Then, in the name of Hades! Olympus, I accept this message!",
		},
		{
			Cue = "/VO/Demeter_0002",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"I understand, young Zagreus, that you would seek to leave that bitter darkness for this bitter cold? Quite honestly I fail to see why. But I'll aid your plight, why not? For I can offer plenty of assistance, and you soon shall grow fond of it, I think.",
		},
	},
	-- #endregion
	-- #region Super-priority story and quests
	{
		Name = "DemeterAboutZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "DemeterFirstPickUp",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredGodLoot = "ZeusUpgrade",
		{
			Cue = "/VO/Demeter_0062",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I see the noble King of the Olympians has reached you prior to me, Zagreus. I wonder which of all his many lies he's told you last.",
		},
	},
	{
		Name = "DemeterAboutPersephone01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredAnyTextLines = { "DemeterAboutLove01", "PersephoneFirstMeeting" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0078",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			-- used for moments when Zag follow-up VO isn't appropriate
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"My foster-brother's wayward son appears! I, too, once lost a child, Zagreus. I was quite foolish with her from the start. Her father was a baseborn farm-boy; worshiped me! He's gone as well, of course. Only the cold remains.",
		},
	},
	{
		Name = "DemeterAboutPersephone02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutPersephone01" },
		RequiredAnyTextLines = { "PersephoneMeeting04", "DemeterGift03" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0086",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"My daughter to a baseborn farm-boy, she... why, little sprout, I wasn't very kind to her, I think. Certainly not once her father passed. It was her mortal blood that made her weak! Born to mortals, taken by mortals, I suspect. So now, they {#DialogueItalicFormat}pay{#PreviousFormat}.",
		},
	},
	{
		Name = "DemeterAboutPersephone03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutPersephone02" },
		RequiredAnyTextLines = { "PersephoneMeeting07", "DemeterGift04" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0085",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"I don't suppose... no, it is nothing, little sprout, it's just... I hear such wicked rumors now and then, about my daughter, lost to me, and what became of her. Kore, we called her, then. Persephone is what she called herself. Before she vanished utterly, leaving no trace....",
		},
	},
	{
		Name = "DemeterAboutPersephone04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutPersephone03" },
		RequiredAnyTextLines = { "PersephoneMeeting08", "DemeterGift05" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0159",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"After my daughter Kore disappeared, I left this mountaintop. Wandered the earth, in search. For naught, of course. It was a necessary journey, I suppose. May yours fare better.",
		},
	},
	{
		Name = "DemeterAboutOlympianReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "DemeterFirstPickUp", "PersephoneAboutOlympianReunionQuest01" },
		{
			Cue = "/VO/ZagreusField_4344",
			Portrait = "Portrait_Zag_Serious_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 2.4 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"Hope Mother knows what she's doing, in the name of Hades! Olympus, this is an official message! Lady Demeter, this is for you.",
		},
		{
			Cue = "/VO/Demeter_0212",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"What's all of this, young Zagreus, a message of some sort, for me, indeed? I... can't decipher it, although... it bears the marks of my two foster-brothers here, and... well! It seems we'd better compare notes!",
		},
	},
	{
		Name = "DemeterPostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", },
		{
			Cue = "/VO/Demeter_0226",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			-- used for moments when Zag follow-up VO isn't appropriate
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"Why, little sprout, young Zagreus... my grandson! I can scarce believe it, still! To think that, Kore, or... Persephone, my daughter... she had been with Foster-Brother Hades, all this time! A match I wouldn't have expected... or approved. That's why she left! Our blasted hearts do what they want.",
		},
	},
	{
		Name = "DemeterLiftsWinterCurse01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "PersephoneReturnsFromOlympus01" },
		{
			Cue = "/VO/Demeter_0197",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"My little grandson, little sprout, I've thought... if my Persephone's alive, why then... this winter, hasn't it endured for long enough...? It's grown to have a certain stubbornness, but I... I am the goddess of the seasons, Zagreus. Perhaps it's time I changed them once again."
		},
	},
	{
		Name = "DemeterLiftsWinterCurse02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredRoomLastRun = "D_Boss01",
		RequiredTextLines = { "DemeterLiftsWinterCurse01" },
		{
			Cue = "/VO/Demeter_0225",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"I've lifted the cold from the earth, much as I said I would, grandson. But, near your father's realm... I have decided it shall stay the way it is. Bereft of warmth. As a reminder to us all, about all this.",
		},
	},
	-- #endregion
	-- #region Priority story and contextual dialogues
	-- Hades I weapon-specific dialogues are intentionally omitted because those weapons do not exist in Hades II
	{
		Name = "DemeterAboutPoseidon01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "DemeterAboutZeus01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredGodLoot = "PoseidonUpgrade",
		{
			Cue = "/VO/Demeter_0063",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You bear the blessing of Poseidon, Zagreus? Someday I shall remind him of his place, and freeze his watery domain entirely.",
		},
	},
	{
		Name = "DemeterAboutAthena01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredGodLoot = "AthenaUpgrade",
		{
			Cue = "/VO/Demeter_0061",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Athena has imparted you her {#DialogueItalicFormat}wisdom{#PreviousFormat}, Zagreus? A simulacrum of the real thing, at any rate. True wisdom only comes with age, I think.",
		},
	},
	{
		Name = "DemeterAboutAphrodite01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredGodLoot = "AphroditeUpgrade",
		{
			Cue = "/VO/Demeter_0064",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"All of the love and beauty in the world can wither in a season, Zagreus. Remember that when next the goddess Aphrodite makes her promises.",
		},
	},
	{
		Name = "DemeterAboutAres01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredGodLoot = "AresUpgrade",
		{
			Cue = "/VO/Demeter_0065",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Lord Ares already got hold of you, has he? He's good at making mortals kill each other, yes. But he has utterly no knack for subtlety.",
		},
	},
	{
		Name = "DemeterAboutArtemis01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredGodLoot = "ArtemisUpgrade",
		{
			Cue = "/VO/Demeter_0066",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The gentle Artemis already found you, Zagreus? She takes my orders well; one cannot blame her, for she'd have nothing to hunt if not for me.",
		},
	},
	{
		Name = "DemeterAboutDionysus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredGodLoot = "DionysusUpgrade",
		{
			Cue = "/VO/Demeter_0067",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You stumbled into Dionysus, Zagreus? One of these days I shall prevent his vineyards all from ripening; put to the test his carefree attitude.",
		},
	},
	{
		Name = "DemeterAboutChaos01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredLootThisRun = "TrialUpgrade",
		{
			Cue = "/VO/Demeter_0068",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The mark of Chaos is upon you, isn't it? A force older than I! Yet one which you ought not trust so readily. No rhyme or reason to that one at all.",
		},
	},
	{
		Name = "DemeterAboutPom01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "DemeterFirstPickUp" },
		RequiredLootThisRun = "StackUpgrade",
		{
			Cue = "/VO/Demeter_0069",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Is that the bloodlike stain of pomegranate on you, Zagreus? A hardy fruit resistant to a winter's chill. How fascinating they survive, down there.",
		},
	},
	{
		Name = "DemeterLegendaryPickUp01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Demeter_0020",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I don't often divulge such blessings as I am about to, Zagreus. Don't thank me for it, but make certain that you use my power well.",
		},
	},
	{
		Name = "DemeterLegendaryPickUp02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Demeter_0021",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I have affection for you, little sprout. No need for reciprocity, but now I'll offer you the fiercest of my capabilities.",
		},
	},
	{
		Name = "DemeterPostGiftPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift03" },
		{
			Cue = "/VO/Demeter_0059",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I must admit I have grown fond of you, young sprout; nevertheless, I shall not spoil you like some ill-mannered child.",
		},
	},
	{
		Name = "DemeterPostGiftPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift02" },
		{
			Cue = "/VO/Demeter_0060",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My, but you're as determined as my foster-brothers were, when my sisters and I stood with them 'gainst the Titans way back when.",
		},
	},
	{
		Name = "DemeterAboutLoss01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift01" },
		RequiredFalseTextLines = { "DemeterLiftsWinterCurse01", "DemeterAboutLoss02" },
		{
			Cue = "/VO/Demeter_0070",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Our family, why, I think we understand something of loss, now, don't we, Zagreus? Unlike the mortals on the surface. Always begging me for plenty. They'll get none. But as for you, I have a plethora to offer!",
		},
	},
	{
		Name = "DemeterAboutLoss02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredAnyTextLines = { "DemeterAboutLoss01", "DemeterGift03" },
		{
			Cue = "/VO/Demeter_0073",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You are entirely too young to have had meaningful experience with loss, young Zagreus. Pray to me that you never have to learn.",
		},
	},
	{
		Name = "DemeterAboutSurface01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutLoss01" },
		RequiredFalseTextLines = { "DemeterLiftsWinterCurse01" },
		{
			Cue = "/VO/Demeter_0071",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You live within the bosom of the earth, and know its warmth. But there is no such warmth up here, young Zagreus. You truly wish to feel the bitter cold of the outside? Then, here.",
		},
	},
	{
		Name = "DemeterAboutSurface02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutLoss01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredRoomLastRun = "D_Boss01",
		{
			Cue = "/VO/Demeter_0072",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Someday, you'll gain the surface, Zagreus; and you shall see firsthand what mortalkind has wrought. You'll find it has some commonality with your domain.",
		},
	},
	{
		Name = "DemeterAboutMotherhood01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutLoss02" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0079",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Motherhood's a curse, young Zagreus. Be thankful you're immune. You sprang from Nyx herself, or so I hear? I sprang from Theia, whoever she was. And I once bore a child, too. Long gone. A mother's work... isn't it such a waste?",
		},
	},
	{
		Name = "DemeterAboutHades01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutMotherhood01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0074",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your father Hades and I share a common fate, each having lost a child fully grown; except that he's a hollow fool, whose child left! Whereas my daughter never would have. Ever!",
		},
	},
	{
		Name = "DemeterAboutHades02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutHades01", "DemeterAboutZeus01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0156",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your father always had a sternness to him that his brothers lacked. Thought him a decent sort, comparatively anyway; though evidently he is no such thing.",
		},
	},
	{
		Name = "DemeterAboutLove01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutHades01", "DemeterGift02" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0157",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Should you achieve your goal, and see this surface-world, Zagreus, I've but one bit of knowledge to impart: Don't ever fall for mortals. Use them if you must, but do not waste your love on those who waste away.",
		},
	},
	{
		Name = "DemeterAboutHelios01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutPersephone04", "DemeterAboutRumors01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0161",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			-- used for moments when Zag follow-up VO isn't appropriate
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"I have a brother, Helios, the Sun. A nonsense-talker with a flaming chariot. Why, he once told me that my Kore, that she went into that Underworld of yours! Preposterous. The clouds now blot him out entirely.",
		},
	},
	{
		Name = "DemeterAboutHelios02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutHelios01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0162",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"This land is not unlike your own in certain ways. For, Helios the Sun has not shone down upon it for some time. How long, I really couldn't tell you, little sprout! Long enough for mortals to take notice, certainly.",
		},
	},
	{
		Name = "DemeterAboutSisters01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterGift04" },
		MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 5 },
		{
			Cue = "/VO/Demeter_0075",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My sisters Hestia and Hera surely would assist as well, young sprout. Except they and our foster-brothers haven't been getting along of late. Though as for me? I'll never leave this mountaintop of mine.",
		},
	},
	{
		Name = "DemeterAboutFather01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutHades01" },
		{
			Cue = "/VO/Demeter_0076",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"We all are willful children, are we not? I'm daughter to Hyperion, you know; a Titan so obscure and hated that Lord Zeus, he started calling me his birth-sister, so much did he dislike this bit of truth! And to get a rise out of me, too.",
		},
	},
	{
		Name = "DemeterAboutFather02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterAboutFather01" },
		{
			Cue = "/VO/Demeter_0077",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"As seasons give to one another, so do generations, I suppose. Hyperion, my father? He'd not a one redeeming quality. My sisters and my foster-brothers and myself; this world owes us a debt for ridding it of him and his kind.",
		},
	},
	{
		Name = "DemeterAboutZeus02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterGift01", "ZeusGift01", "DemeterAboutZeus01" },
		{
			Cue = "/VO/Demeter_0082",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"I ought to warn you that my foster-brother Zeus, he has just a {#DialogueItalicFormat}disgusting {#PreviousFormat}sense of humor, little sprout. He'd have you think he sired half the countryside! I have to shudder at the very thought.",
		},
	},
	{
		Name = "DemeterAboutRumors01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "DemeterAboutZeus02", "DemeterAboutSurface02" },
		{
			Cue = "/VO/Demeter_0160",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"There's so much nonsense that the mortals say to one another of our family, Zagreus. How viciously the rumors spread! Whether from that oaf, Zeus, or likely from the mortal drunkard-poets with no better use of their limited time!",
		},
	},
	{
		Name = "DemeterHighAffinity01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift06" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete", "DemeterHighAffinity02" },
		{
			Cue = "/VO/Demeter_0115",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"I warn you, Zagreus, best not to make attempts to grow much closer with me, thus. I'm much your elder, after all, and you're my little sprout. What say we keep it that way, hm?",
		},
	},
	{
		Name = "DemeterHighAffinity02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift07" },
		{
			Cue = "/VO/Demeter_0196",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"I... I am so very moved, I... have a daughter once again. And... I've a grandson, too! I thought, I felt something when first I met you, but... I brushed it off. Just like a fleck of snow...",
		},
	},
	{
		Name = "DemeterRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift02" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiresLastRunCleared = true,

		{
			Cue = "/VO/Demeter_0083",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Someday, my little sprout, you'll gain the surface of your father's realm, and see my handiwork. Until such time, I'll come to your aid as I can. It's quite the entertaining pastime, honestly!",
		},
	},
	{
		Name = "DemeterPostEpilogue02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterPostEpilogue01" },
		{
			Cue = "/VO/Demeter_0227",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"By the way, we had entirely a lovely time within your father's house, Grandson. And, to see Kore once again, it... warmed my heart. I'm beyond grateful that your mother's safe. And that you've an important job to do. Here, I shall help.",
		},
	},
	{
		Name = "DemeterPostEpilogue03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "DemeterGift06" },
		{
			Cue = "/VO/Demeter_0228",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"I meant to tell you something, Grandson... you needn't have deceived the rest of us. You could have sent word that my daughter was with you down there, all along! Ah, but families are a complicated thing. Just swear that you'll be candid with us, next time.",
		},
	},
	{
		Name = "DemeterPostEpilogue04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterLiftsWinterCurse02" },
		MinRunsSinceAnyTextLines = { TextLines = { "DemeterLiftsWinterCurse02" }, Count = 3 },
		{
			Cue = "/VO/Demeter_0229",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"You must visit us sometime up here, Grandson! I understand the surface hasn't been agreeable with you... though perhaps if not in this age, then the next, we shall have you over. It's brisk up here... but nice enough, I think.",
		},
	},
	{
		Name = "DemeterPostEpilogue05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "DemeterGift04" },
		{
			Cue = "/VO/Demeter_0214",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"Young sprout, I cannot fully understand my daughter's choices, such as what she saw in your gloom-filled father to have eloped with him. But if you are the result, then she is clearly wiser than I estimated.",
		},
	},
	{
		Name = "DemeterPostEpilogue06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "PersephoneReturnsFromOlympus01", "DemeterGift07" },
		{
			Cue = "/VO/Demeter_0215",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"I made mistakes raising your mother, sprout. When she was my Kore. I was blind to the possibility that she could have left me, but... I see it now. If you become a parent yourself, someday... may you listen more than I.",
		},
	},
	{
		Name = "DemeterPostEpilogue07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "DemeterGift04" },
		MinRunsSinceAnyTextLines = { TextLines = { "OlympianReunionQuestComplete" }, Count = 4 },
		RequiredFalseFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0201",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			TriggerCooldowns = { "ZagreusBoonPickUpSpeech" },
			Text =
			"You tell my Kore... {#DialogueItalicFormat}erm, Persephone{#PreviousFormat}, that is... the Queen! You tell her that her mother sends her warm regards. You tell her that. And you take care of her.",
		},
	},
	{
		Name = "DemeterPostEpilogue08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "PersephoneReturnsFromOlympus01", "PersephoneGift08", "DemeterGift07" },
		RequiredFalseFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0198",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Grandson, my daughter Queen Persephone, she sent me the most precious message, courtesy of Hermes, as of late. I'm pleased to hear that you are getting on all right. Though, I know you're at work, so here!",
		},
	},
	{
		Name = "DemeterAboutKeepsake01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTrait = "ForceDemeterBoonTrait",
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0155",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The Frostbitten Horn which you bear once overflowed. It holds a certain power still, of course. But never again shall mortalkind take it for granted.",
		},
	},
	{
		Name = "DemeterAboutPact01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredTrueFlags = { "ShrineUnlocked" },
		RequiredActiveShrinePointsMin = 6,

		{
			Cue = "/VO/Demeter_0080",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The heat has risen quite considerably there, is that not so? Then if my foster-brother's tampered with the temperature, I'll have to cool things off.",
		},
	},
	{
		Name = "DemeterAboutAsphodel01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredBiome = "Asphodel",

		{
			Cue = "/VO/Demeter_0081",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The heat of your surroundings must be difficult to bear, my little sprout. It's fortunate I've just the thing for that.",
		},
	},
	{
		Name = "DemeterAboutStyx01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredBiome = "Elysium",

		{
			Cue = "/VO/Demeter_0158",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"That chill sensation I detect must indicate that you are near the surface, Zagreus. If you can overcome the final challenges ahead, you soon shall see the long winter yourself.",
		},
	},
	{
		Name = "DemeterLowHealth01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Demeter_0116",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Why, you've the look of one who has endured a terribly long winter, Zagreus! I trust you'll cling to life a little longer, now.",
		},
	},
	{
		Name = "DemeterLowHealth02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Demeter_0117",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I sense your grip on life is coming loose, young Zagreus. Now turn that cold you feel against your enemies.",
		},
	},
	{
		Name = "DemeterLowHealth03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Demeter_0118",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You seem to be in dire need of some assistance, Zagreus. I think perhaps I have a bit to spare.",
		},
	},
	{
		Name = "DemeterLowHealth04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Demeter_0119",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're in the winter of your current stretch of life, aren't you, Zagreus? Do try and live a little longer for me, hm?",
		},
	},
	{
		Name = "DemeterLowHealth05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Demeter_0120",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You waste away just like a common mortal, Zagreus. How rather unbecoming of a god.",
		},
	},
	{
		Name = "DemeterLowHealth06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Demeter_0121",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The flame of life is easily extinguished by the cold, young Zagreus. Surely you feel the warmth within you giving way?",
		},
	},
	{
		Name = "DemeterLowHealth07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterAboutPoseidon01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,

		{
			Cue = "/VO/Demeter_0122",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Cold comfort for your terrible predicament, young Zagreus, but I am here.",
		},
	},
	-- #endregion
	-- #region Misc
	{
		Name = "DemeterMiscPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "DemeterAboutPoseidon01",
			CreateNewPriorityGroup = true,
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0003",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I once had plentitudes of blessings I would offer readily, young Zagreus; but I am feeling not as generous of late.",
		},
	},
	{
		Name = "DemeterMiscPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0004",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Did you detect perhaps a certain spirit-shaking chill within the air, young Zagreus?",
		},
	},
	{
		Name = "DemeterMiscPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0005",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Plenty of blessings left to go around; although, only for you, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0006",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your enemies shall have no shelter from the cold whilst I am at your side, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0007",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "There's something to the barrenness, where you reside; perhaps someday it shall be more like that up here.",
		},
	},
	{
		Name = "DemeterMiscPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0008",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your realm there is much like the wind-swept surface here. Mostly devoid of life, such as it's been of late.",
		},
	},
	{
		Name = "DemeterMiscPickup07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0009",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Olympus must seem like a distant paradise to you, young Zagreus; it is a frozen waste to me. But still, it's home.",
		},
	},
	{
		Name = "DemeterMiscPickup08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0010",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your foes shall more than catch cold by the time we're through, don't you agree, young sprout?",
		},
	},
	{
		Name = "DemeterMiscPickup09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0011",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All those who stand opposed to you, why, we shall shatter more than their resolve, I think, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0012",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"One of these seasons I suppose I ought to double-check the mortals haven't gone extinct without my intervention at each step.",
		},
	},
	{
		Name = "DemeterMiscPickup11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0013",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"None can endure an everlasting winter's chill, young Zagreus; not even your father's lifeless servants there beneath the earth.",
		},
	},
	{
		Name = "DemeterMiscPickup12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0014",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The seasons have a certain beauty to them, I suppose. Though struggle onward, and you needn't take my word for it.",
		},
	},
	{
		Name = "DemeterMiscPickup13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0015",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I've known your father and his brothers here for many seasons now; they bicker endlessly with me and one another.",
		},
	},
	{
		Name = "DemeterMiscPickup14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0016",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I have to tell you something, little sprout. I take cold comfort knowing that my foster-brother Hades is no better at his parenting than I.",
		},
	},
	{
		Name = "DemeterMiscPickup15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0017",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'd gladly scour all your father's realm if doing so would free you from his clutches, Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0018",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'll have you know something, young Zagreus: The bitter cold and frost is just as inescapable as death itself.",
		},
	},
	{
		Name = "DemeterMiscPickup17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0019",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The seasons turn relentlessly, without regard, and thusly should you doggedly push forward on your path.",
		},
	},
	{
		Name = "DemeterMiscPickup18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0154",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I shall bring desolation upon those who wrong you, little sprout.",
		},
	},
	{
		Name = "DemeterMiscPickup19",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0022",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I hope that you're aware how seldomly I give my blessing as of late, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup20",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0023",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "There's no escaping from the bitter cold, you know.",
		},
	},
	{
		Name = "DemeterMiscPickup21",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0024",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your adversaries soon shall know something of loss, I think.",
		},
	},
	{
		Name = "DemeterMiscPickup22",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0025",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let us see to it your foes are left with nothing.",
		},
	},
	{
		Name = "DemeterMiscPickup23",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0026",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "There shall be only souls for harvesting this day, I think, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup24",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift03" },
		{
			Cue = "/VO/Demeter_0027",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My warm regards, and all my blessings to you, little sprout.",
		},
	},
	{
		Name = "DemeterMiscPickup25",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0028",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The bitterness of cold and death go hand in hand, I do suppose.",
		},
	},
	{
		Name = "DemeterMiscPickup26",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0029",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "When all is taken away, the cold yet remains, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup27",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		{
			Cue = "/VO/Demeter_0030",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I am not feeling quite so generous of late, young Zagreus, but nevertheless: Choose.",
		},
	},
	{
		Name = "DemeterMiscPickup28",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0031",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your lifeless foes must foolishly believe they've nothing left to lose.",
		},
	},
	{
		Name = "DemeterMiscPickup29",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		{
			Cue = "/VO/Demeter_0032",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Go with my blessings, Zagreus; though you may take but one.",
		},
	},
	{
		Name = "DemeterMiscPickup30",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0033",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Decay is the inevitable state of things; we are merely helping it along.",
		},
	},
	{
		Name = "DemeterMiscPickup31",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0035",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The cold of Mount Olympus shall bring utter ruin on your enemies.",
		},
	},
	{
		Name = "DemeterMiscPickup32",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0036",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Death and cold, they are irrevocably bound together, Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup33",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredBiome = "Asphodel",
		{
			Cue = "/VO/Demeter_0037",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The climate in those depths needs cooling, then, I take it, Zagreus?",
		},
	},
	{
		Name = "DemeterMiscPickup34",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0038",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You bring with you the season of decay, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup35",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0039",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your foes shall all wither before you like unwatered crops.",
		},
	},
	{
		Name = "DemeterMiscPickup36",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0040",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The frost eventually shall cover everything, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup37",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0041",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You'll find that life gives way quite easily to cold, young sprout.",
		},
	},
	{
		Name = "DemeterMiscPickup38",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		{
			Cue = "/VO/Demeter_0042",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Look carefully upon my blessings, Zagreus, and take no more than one.",
		},
	},
	{
		Name = "DemeterMiscPickup39",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0043",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I trust that harvesting dead souls is not unlike the harvest we have on the surface, Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup40",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0044",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You're like a little flame there in your father's realm; easy enough to spot.",
		},
	},
	{
		Name = "DemeterMiscPickup41",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0045",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It seems to me your foes are ripe for harvesting, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickup42",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		{
			Cue = "/VO/Demeter_0046",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Any who stand against you soon shall wither from the cold, young sprout.",
		},
	},
	{
		Name = "DemeterMiscRarePickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Demeter_0048",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I seldom feel too generous of late, and yet for you, young Zagreus? Why not.",
		},
	},
	{
		Name = "DemeterMiscRarePickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Demeter_0049",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I once offered the mortals generosities as this in much more copious supply.",
		},
	},
	{
		Name = "DemeterMiscRarePickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Demeter_0050",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It soon shall be exceptionally cold down in the Underworld, I think.",
		},
	},
	{
		Name = "DemeterMiscRarePickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift03" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Demeter_0051",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'd never give out blessings such as this to merely anyone, I hope you know.",
		},
	},
	{
		Name = "DemeterMiscRarePickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift03" },
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Demeter_0052",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I've quite the harvest here from which to choose, my little sprout.",
		},
	},
	{
		Name = "DemeterMiscRarePickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift03" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Demeter_0053",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Soon, the season there shall turn exceptionally cold, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscRarePickup07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift03" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Demeter_0055",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It is particularly cold outside, today; and soon it shall be so in there for you.",
		},
	},
	{
		Name = "DemeterMiscPickupAboutWinter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift01" },
		RequiredFalseFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0034",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Well, my little sprout, we shall have to get you through this winter's cold.",
		},
	},
	{
		Name = "DemeterMiscPickupAboutWinter02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp" },
		RequiredFalseFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0047",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "A crisp and pleasant winter's evening to you, Zagreus; now, here.",
		},
	},
	{
		Name = "DemeterMiscPickupAboutWinter03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "DemeterGift02" },
		RequiredFalseFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0054",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My finest winter blessings to you, little sprout.",
		},
	},
	{
		Name = "DemeterMiscPickupExtra01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0202",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Well, Grandson, it's growing rather cold, don't you agree?",
		},
	},
	{
		Name = "DemeterMiscPickupExtra02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0203",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'm here to ease some of your burdens, my young sprout. That's what we grandmothers are for.",
		},
	},
	{
		Name = "DemeterMiscPickupExtra03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0204",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I trust you're keeping yourself warm enough in all of this, Grandson?",
		},
	},
	{
		Name = "DemeterMiscPickupExtra04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0205",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "When all this is over, please do come and visit us sometime, Grandson.",
		},
	},
	{
		Name = "DemeterMiscPickupExtra05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0206",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'd tell you not to work too hard, Grandson, although your family is in need of more hard-working sorts.",
		},
	},
	{
		Name = "DemeterMiscPickupExtra06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0207",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Foul weather's on the forecast for your foes, Grandson.",
		},
	},
	{
		Name = "DemeterMiscPickupExtra07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0208",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Don't let my foster-brother bully you about, you hear, Grandson?",
		},
	},
	{
		Name = "DemeterMiscPickupExtra08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0209",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let's cool down that hot head of yours a bit, why don't we, Grandson?",
		},
	},
	{
		Name = "DemeterMiscPickupExtra09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete", "DemeterGift05" },
		RequiredFalseFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0210",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My best regards to Queen Persephone and your lord father, little sprout. You keep it up.",
		},
	},
	{
		Name = "DemeterMiscPickupExtra10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete", "DemeterGift06" },
		RequiredFalseFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0211",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I trust your mother Queen Persephone is faring well if she has as fine a son as you, young Zagreus.",
		},
	},
	{
		Name = "DemeterMiscPickupPersephoneAway01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		RequiredTrueFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0222",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your mother sends you all her love from Mount Olympus, Grandson.",
		},
	},
	{
		Name = "DemeterMiscPickupPersephoneAway02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		RequiredTrueFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0223",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "All the best from Queen Persephone, young sprout. She misses you, you know.",
		},
	},
	{
		Name = "DemeterMiscPickupPersephoneAway03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "DemeterFirstPickUp", "OlympianReunionQuestComplete" },
		RequiredTrueFlags = { "PersephoneAway" },
		{
			Cue = "/VO/Demeter_0224",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Persephone is doing well here on Olympus, Zagreus. You ought to visit, too, sometime.",
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(newPortedInteractTextLines, "DemeterUpgrade", "InteractTextLineSets",
	{
		TextLinePriorityType = "InteractTextLinePriorities",
		VoiceBankMappings = { Demeter = { "Modsnikkelmhadesbiomesdemeter", "ZagreusField" } },
		CueMappings = { Demeter_ = "Modsnikkelmhadesbiomesdemeter_" },
		PortraitMappings = { Demeter_ = "ModsNikkelMHadesBiomes_Portrait_Demeter_Default_01" },
	}
)

-- #region Hades I duo dialogues
local newPortedDuoPickupTextLines = {
	{
		Name = "DemeterWithZeus01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "JoltDurationTrait",
		RequiredTextLines = { "DemeterGift01", "ZeusGift01" },
		RequiredFalseTextLinesLastRun = { "ZeusWithDemeter01" },
		{
			Cue = "/VO/Demeter_0151",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"Well, now, young sprout, you've met the so-called King of the Olympians, and I. Whom do you now suppose is genuinely ruler of this snow-encrusted mountaintop of ours?"
		},
		{
			Cue = "/VO/Zeus_0201",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/ZeusBoonThunder",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Zeus_01",
			Portrait = "Portrait_Zeus_Default_01",
			Text =
			"Oh, {#DialogueItalicFormat}hah-hah-hah{#PreviousFormat}, Lady Demeter! Your wit is just as dry as the earth lying quite fallow in your care! Perhaps you should go tend to that again, though let's we go ahead and help our young man first!"
		},
	},
	{
		Name = "DemeterWithPoseidon01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "BlizzardOrbTrait",
		{
			Cue = "/VO/Demeter_0145",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"Ah, little sprout. I was just notifying Lord Poseidon here that all of his domain exists because it pleases me; remember, my good foster-brother, I could freeze your oceans solid if I chose."
		},
		{
			Cue = "/VO/Poseidon_0145",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/PoseidonBoonWaveCrash",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Poseidon_01",
			Portrait = "Portrait_Poseidon_Default_01",
			Text =
			"{#DialogueItalicFormat}Ah, hahahah! {#PreviousFormat}Excellently stated, venerable Goddess Demeter! I'm reminded once more of your vast experience, though, I think we all prefer our oceans liquidy, isn't that right, Nephew?!"
		},
	},
	{
		Name = "DemeterWithAres01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "StationaryRiftTrait",
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Demeter_0143",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"Young Zagreus, once you arrive, do tell Lord Ares here that his great power's not worth anything without my own. Wars have their causes, among which, many I control."
		},
		{
			Cue = "/VO/Ares_0162",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/AresWrathBattle",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Speaker = "NPC_Ares_01",
			Portrait = "Portrait_Ares_Default_01",
			Text =
			"I do not question that your influence can stir a mortal's impulses toward war, O Goddess Demeter. At least we can agree that our domains are quite compatible!"
		},
	},
	{
		Name = "DemeterWithAphrodite01",
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		HasTraitNameInRoom = "SelfLaserTrait",
		{
			Cue = "/VO/Demeter_0153",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			Text =
			"Remember something for us, Zagreus. A frozen heart holds no sway over anyone at all. Isn't that right, oh Aphrodite, dear?"
		},
		{
			Cue = "/VO/Aphrodite_0192",
			PortraitExitWait = 0.35,
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.5,
			StartSound = "/SFX/AphroditeBoonLoveChimes",
			EndSound = "/Leftovers/World Sounds/MapZoomInShort",
			Emote = "PortraitEmoteCheerful",
			Speaker = "NPC_Aphrodite_01",
			Portrait = "Portrait_Aphrodite_Default_01",
			Text =
			"Oh, I don't know, my dearest Demeter! The frozen heart has tendency to thaw, and then begin to beat with renewed vigor after that. I trust your time shall come! It can never be too late, except for mortals, the poor things."
		},
	},
}
mod.AddNarrativeDataEntries(newPortedDuoPickupTextLines, "DemeterUpgrade", "DuoPickupTextLines",
	{
		VoiceBankMappings = {}, -- H2 loads only the selected duo speakers from their Cue names
		CueMappings = { Aphrodite_ = "Modsnikkelmhadesbiomesaphrodite_", Ares_ = "Modsnikkelmhadesbiomesares_", Demeter_ = "Modsnikkelmhadesbiomesdemeter_", Poseidon_ = "Modsnikkelmhadesbiomesposeidon_", Zeus_ = "Modsnikkelmhadesbiomeszeus_" },
		PortraitMappings = { Aphrodite_ = "ModsNikkelMHadesBiomes_Portrait_Aphrodite_Default_01", Ares_ = "ModsNikkelMHadesBiomes_Portrait_Ares_Default_01", Demeter_ = "ModsNikkelMHadesBiomes_Portrait_Demeter_Default_01", Poseidon_ = "ModsNikkelMHadesBiomes_Portrait_Poseidon_Default_01", Zeus_ = "ModsNikkelMHadesBiomes_Portrait_Zeus_Default_01" },
	}
)
-- #endregion

local newPortedLootBoughtTextLines = {
	{
		Name = "DemeterLootBought01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0056",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Be thankful that the rivers to your realm have not yet frozen over, Zagreus.",
		},
	},
	{
		Name = "DemeterLootBought02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0057",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I trust your ferry-boatman Charon has no qualms about the freezing temperatures up here?",
		},
	},
	{
		Name = "DemeterLootBought03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DemeterLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0058",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My message comes to you by river-boat this time, young Zagreus. At least that Charon is amenable to our attempts to contact you.",
		},
	},
}
mod.AddNarrativeDataEntries(newPortedLootBoughtTextLines, "DemeterUpgrade", "BoughtTextLines",
	{
		TextLinePriorityType = "BoughtTextLinePriorities",
		VoiceBankMappings = { Demeter = { "Modsnikkelmhadesbiomesdemeter" } },
		CueMappings = { Demeter_ = "Modsnikkelmhadesbiomesdemeter_" },
		PortraitMappings = { Demeter_ = "ModsNikkelMHadesBiomes_Portrait_Demeter_Default_01" },
	}
)

local newPortedRejectionTextLines = {
	{
		Name = "DemeterRejection01",
		{
			Cue = "/VO/Demeter_0087",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My blessing's seldom given and ought not be so readily refused, young Zagreus.",
		},
	},
	{
		Name = "DemeterRejection02",
		{
			Cue = "/VO/Demeter_0088",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I am accustomed to such disrespect from all those blasted mortals, Zagreus, but {#DialogueItalicFormat}you{#PreviousFormat}?",
		},
	},
	{
		Name = "DemeterRejection03",
		{
			Cue = "/VO/Demeter_0089",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "If you are so disinterested in my generosity, young Zagreus, then you shall have my wrath.",
		},
	},
	{
		Name = "DemeterRejection04",
		{
			Cue = "/VO/Demeter_0090",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I don't recall if I yet warned against this type of attitude, although it doesn't matter either way.",
		},
	},
	{
		Name = "DemeterRejection05",
		{
			Cue = "/VO/Demeter_0091",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Do you believe I give my blessings liberally, Zagreus? Well then I've news for you.",
		},
	},
	{
		Name = "DemeterRejection06",
		{
			Cue = "/VO/Demeter_0092",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Offend me, and I'll drain the last traces of color from those cheeks of yours.",
		},
	},
	{
		Name = "DemeterRejection07",
		{
			Cue = "/VO/Demeter_0093",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "That was an ill-advised decision, Zagreus. I'm past quickly forgiving such mistakes.",
		},
	},
	{
		Name = "DemeterRejection08",
		{
			Cue = "/VO/Demeter_0094",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You truly think you can withstand the ravages of winter, Zagreus? That I would like to see.",
		},
	},
	{
		Name = "DemeterRejection09",
		{
			Cue = "/VO/Demeter_0095",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "A harsh winter is coming for you, Zagreus. And I'm afraid you've brought it on yourself.",
		},
	},
	{
		Name = "DemeterRejection10",
		{
			Cue = "/VO/Demeter_0096",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "For that decision, Zagreus, it is about to be a very cold day down there in your Underworld.",
		},
	},
	{
		Name = "DemeterRejection11",
		{
			Cue = "/VO/Demeter_0097",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"A careless choice you've made, there, Zagreus. As you grow long in years, perhaps you shall learn better judgment as to whom to trust, and whom to never, ever disrespect.",
		},
	},
}
mod.AddNarrativeDataEntries(newPortedRejectionTextLines, "DemeterUpgrade", "RejectionTextLines",
	{
		VoiceBankMappings = { Demeter = { "Modsnikkelmhadesbiomesdemeter" } },
		CueMappings = { Demeter_ = "Modsnikkelmhadesbiomesdemeter_" },
		PortraitMappings = { Demeter_ = "ModsNikkelMHadesBiomes_Portrait_Demeter_Default_01" },
	}
)

local newPortedMakeUpTextLines = {
	{
		Name = "DemeterMakeUp01",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0098",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Perhaps you'll exercise more wisdom in such interactions moving forward, hm?",
		},
	},
	{
		Name = "DemeterMakeUp02",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0099",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It ultimately isn't my intent to leave you in the cold like this, young Zagreus.",
		},
	},
	{
		Name = "DemeterMakeUp03",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0100",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The freezing cold ought to have drained the life from you; but I've allowed it to relent, for now.",
		},
	},
	{
		Name = "DemeterMakeUp04",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0101",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Next time, young Zagreus, perhaps I'll take every last bit of warmth you've left down there.",
		},
	},
	{
		Name = "DemeterMakeUp05",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0102",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I am the eldest of Olympus, Zagreus. And I expect for you to treat me suitably.",
		},
	},
	{
		Name = "DemeterMakeUp06",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0103",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The harsh of winter's gone for now, young Zagreus; and so take heart, but also you take heed.",
		},
	},
	{
		Name = "DemeterMakeUp07",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0104",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So you survived a little winter's chill, didn't you, there? Be careful, though; next season could be worse.",
		},
	},
	{
		Name = "DemeterMakeUp08",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0105",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Remember, next time, Zagreus, that on my whim I can take everything from you.",
		},
	},
	{
		Name = "DemeterMakeUp09",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0106",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I am quite capable of making your life plenty difficult, you do now realize, young Zagreus?",
		},
	},
	{
		Name = "DemeterMakeUp10",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0107",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Perhaps a few more winter seasons such as that might teach you more of how this world works.",
		},
	},
	{
		Name = "DemeterMakeUp11",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Demeter_0108",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Enough; I do not hold to grudges, Zagreus. You've my good graces, and my temper's cooled, for now.",
		},
	},
}
mod.AddNarrativeDataEntries(newPortedMakeUpTextLines, "DemeterUpgrade", "MakeUpTextLines",
	{
		VoiceBankMappings = { Demeter = { "Modsnikkelmhadesbiomesdemeter" } },
		CueMappings = { Demeter_ = "Modsnikkelmhadesbiomesdemeter_" },
		PortraitMappings = { Demeter_ = "ModsNikkelMHadesBiomes_Portrait_Demeter_Default_01" },
	}
)
