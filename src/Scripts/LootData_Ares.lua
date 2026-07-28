local newPortedInteractTextLines = {
	-- #region High-Priority Storylines/Quests (Inserted in a group after AresPostTrueEndingAboutTyphon01)
	{
		Name = "AresAboutThanatos01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresPostTrueEndingAboutTyphon01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp", "ThanatosFirstAppearance", "ThanatosGift01", "AresGift01" },
		{
			Cue = "/VO/Ares_0041",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Perhaps you know a god called Thanatos? The two of us are very close associates, you know. Do give him my best wishes, should you see him soon."
		},
	},
	{
		Name = "AresAboutThanatos02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresAboutThanatos01", "AresGift01", "ThanatosGift03" },
		RequiredFalseTextLinesLastRun = { "AresAboutThanatos01" },
		{
			Cue = "/VO/Ares_0122",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I trust that Thanatos is doing well? Although he brings to mortals merciful release, whilst I most certainly do {#DialogueItalicFormat}no {#PreviousFormat}such thing, I do appreciate his take on it."
		},
	},
	{
		Name = "AresKillQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresGift03" },
		RequiredFalseTextLinesLastRun = { "AresKillProgress02" },
		RequiredMinTotalKills = 2000,
		{
			Cue = "/VO/Ares_0193",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I know that you have many aspirations, my good kin. To be plain with you about my own motive for a moment: As long as you continue bringing swift and steady death, you shall have my unyielding support."
		},
	},
	{
		Name = "AresKillQuestComplete",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresKillQuest01", },
		MinRunsSinceAnyTextLines = { TextLines = { "AresKillProgress01", "AresKillProgress02" }, Count = 2 },
		RequiredMinTotalKills = 10000,
		{
			Cue = "/VO/Ares_0121",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ten thousand souls have fallen to you, now, my hellborn kin. I am rather beside myself, I must admit. Fine work."
		},
	},
	{
		Name = "AresAboutOlympianReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos01",
		},
		PlayOnce = true,
		RequiredTextLines = { "AresFirstPickUp", "PersephoneAboutOlympianReunionQuest01", },
		{
			Cue = "/VO/ZagreusField_4340",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 2.15 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"Here goes, then. In the name of Hades! Olympus, this is an official message! Lord Ares, please consider our proposal... once you're able to decipher it."
		},
		{
			Cue = "/VO/Ares_0229",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"My, what is this, my kin? Some sort of invitation for me, I presume. Not just for me... this symbolizes all the others, here? Most intriguing. I shall investigate the meaning of this as quickly as I'm able, then. But first!"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresPostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos01",
		},
		PlayOnce = true,
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0230",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I wish to tell you once again I had a splendid time during our recent shared festivities, my kin. At last, I've finally seen your death-filled realm firsthand! I learned a great deal. And I look forward to learning more from our successful collaboration, hm?"
		},
	},
	-- #endregion
	-- #region Storylines (Inserted in a group after the priority dialogues above)
	{
		Name = "AresAboutThanatos03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AresAboutThanatos01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
		MinRunsSinceAnyTextLines = { TextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" }, Count = 3 },
		{
			Cue = "/VO/Ares_0123",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It is my understanding that you have grown rather close with Thanatos, my kin? A perfect choice of mate; though I confess I'd not expected Death to have affection for another save himself."
		},
	},
	{
		Name = "AresKillProgress01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredFalseTextLines = { "AresKillProgress02", "AresKillQuestComplete" },
		RequiredMinTotalKills = 100,
		{
			Cue = "/VO/Ares_0036",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Did you happen to know, my kin, that you have slain more than a hundred foes since you began your quest? You have! For I am keeping count. And I am most impressed."
		},
	},
	{
		Name = "AresKillProgress02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredFalseTextLines = { "AresKillQuestComplete" },
		RequiredMinTotalKills = 1000,
		{
			Cue = "/VO/Ares_0120",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You are a most impressive death-dealer, my kin. For by my estimation, you have slain at least a thousand souls down there! Souls mostly having died before, but still."
		},
	},
	{
		Name = "AresKillQuestAftermath01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresKillQuestComplete", "AresGift06" },
		RequiredFalseTextLinesLastRun = { "AresKillQuestComplete" },
		{
			Cue = "/VO/Ares_0194",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The more you slay your enemies, my kin, the stronger the bond between us, I think. Can you not feel it, too? Though, perhaps your lust for blood overpowers your other senses, hm?"
		},
	},
	-- #region Nyx-Ares storyline
	-- TODO: These are currently blocked on NyxGift07 and NyxAboutAres dialogues
	{
		Name = "AresPostFlashback01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" }, -- Removed Flashback_Mother_01, added RequiredMinRunsCleared = 1
		RequiredMinRunsCleared = 1,
		RequiredFalseTextLines = { "AresAboutNyx04", "AresAboutNyx04_B", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Ares_0040",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You are the son of Night herself, they say? A fascinating character, ill-liked upon Olympus, although I myself have always longed to meet her."
		},
	},
	{
		Name = "AresAboutNyxIntro01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresGift01", "NyxGift01" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 5 },
		{
			Cue = "/VO/Ares_0208",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Would that I knew the goddess Nyx, myself, my kin! So many of my wars are waged by night. I am most grateful, and I wish her well."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutNyx01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresAboutNyxIntro01", "AresPostFlashback01", "AresGift02", "NyxGift07", "ThanatosAboutAres01" },
		RequiredFalseTextLines = { "ModsNikkelMHadesBiomes_AresAboutNyx01_B", "OlympianReunionQuestComplete" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 6 },
		{
			Cue = "/VO/Ares_0163",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How is your mother Nyx of late, my kin? Have you yet given to her my regards? For I should think that Night and War would share a common ground."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutNyx01_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresAboutNyxIntro01", "AresPostFlashback01", "AresGift02", "NyxGift07", "ThanatosAboutAres01", "OlympianReunionQuestComplete" },
		RequiredFalseTextLines = { "ModsNikkelMHadesBiomes_AresAboutNyx01" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 6 },
		{
			Cue = "/VO/Ares_0234",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How is Nyx of late, my kin? Have you yet given to her my regards? For I should think that Night and War would share a common ground."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutNyx02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "NyxAboutAres01", },
		RequiredFalseTextLines = { "ModsNikkelMHadesBiomes_AresAboutNyx02_B", "OlympianReunionQuestComplete" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 6 },
		{
			Cue = "/VO/Ares_0164",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Do tell your mother Night Herself that I am often thinking of her here, although we haven't met. She must believe that there are those upon Olympus who admire her."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutNyx02_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		RequiredAnyTextLines = { "NyxAboutAres01", "NyxAboutAres01_B" },
		RequiredFalseTextLines = { "ModsNikkelMHadesBiomes_AresAboutNyx02" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 6 },
		{
			Cue = "/VO/Ares_0235",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Do tell Night Herself that I am often thinking of her here. She must believe that there are those upon Olympus who admire her."
		},
	},
	{
		Name = "AresAboutNyx03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "NyxAboutAres02", "AresGift03", "NyxGift08" },
		RequiredFalseTextLines = { "AresAboutNyx03_B", "OlympianReunionQuestComplete" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 5 },
		{
			Cue = "/VO/Ares_0165",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Perhaps once all of this is over, my good kin, you might arrange 'twixt myself and your dark mother, Nyx, some sort of chance to meet? Do think upon it, and declare to her my interest if you please."
		},
	},
	{
		Name = "AresAboutNyx03_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "NyxAboutAres02", "NyxAboutAres02_B" },
		RequiredTextLines = { "AresGift03", "NyxGift08", "OlympianReunionQuestComplete" },
		RequiredFalseTextLines = { "AresAboutNyx03" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 5 },
		{
			Cue = "/VO/Ares_0236",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Perhaps once all of this is over, my good kin, you might arrange 'twixt myself and the goddess Nyx some sort of chance to meet? Do think upon it, and declare to her my interest if you please."
		},
	},
	{
		Name = "AresAboutNyx04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "NyxAboutAres03", "AresGift03", },
		RequiredFalseTextLines = { "AresAboutNyx04_B", "OlympianReunionQuestComplete" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 6 },
		{
			Cue = "/VO/Ares_0166",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your mother Nyx and I, we have begun a correspondence, my good kin. I do appreciate you putting us in touch. She is a lovely specimen, if you don't mind my saying so, perhaps?"
		},
	},
	{
		Name = "AresAboutNyx04_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "NyxAboutAres03", "AresGift03", "OlympianReunionQuestComplete" },
		RequiredFalseTextLines = { "AresAboutNyx04" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 6 },
		{
			Cue = "/VO/Ares_0237",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The goddess Nyx and I, we have begun a correspondence, my good kin. I do appreciate you putting us in touch. She is a lovely specimen, if you don't mind my saying so, perhaps?"
		},
	},
	{
		Name = "AresAboutNyx05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "NyxAboutAres04", "NyxAboutAres04_B" },
		RequiredTextLines = { "AresGift04", "NyxGift09" },
		RequiredFalseTextLines = { "AresAboutNyx05_B", "OlympianReunionQuestComplete" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 6 },
		{
			Cue = "/VO/Ares_0167",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You shall be pleased to hear that your own mother Nyx and I, why, we intend to meet. I'm quite excited to exchange ideas in the flesh."
		},
	},
	{
		Name = "AresAboutNyx05_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "NyxAboutAres04", "NyxAboutAres04_B" },
		RequiredTextLines = { "AresGift04", "NyxGift09", "OlympianReunionQuestComplete" },
		RequiredFalseTextLines = { "AresAboutNyx05" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 6 },
		{
			Cue = "/VO/Ares_0238",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You shall be pleased to hear that Nyx and I, why, we intend to meet. I'm quite excited to exchange ideas in the flesh."
		},
	},
	{
		Name = "AresAboutNyx06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "NyxAboutAres05", "AresPostFlashback01", "AresGift04", },
		RequiredFalseTextLines = { "AresAboutNyx06_B", "OlympianReunionQuestComplete" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 5 },
		{
			Cue = "/VO/Ares_0168",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Please send your mother Nyx my warm regards, won't you, my kin? Would that the others on Olympus knew and understood your kind as I now do."
		},
	},
	{
		Name = "AresAboutNyx06_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos03",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyTextLines = { "NyxAboutAres05", "NyxAboutAres05_B" },
		RequiredTextLines = { "AresPostFlashback01", "AresGift04", "OlympianReunionQuestComplete" },
		RequiredFalseTextLines = { "AresAboutNyx06" },
		MinRunsSinceAnyTextLines = { TextLines = game.GameData.AresAboutNyxTextLines, Count = 5 },
		{
			Cue = "/VO/Ares_0239",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Please send the goddess Nyx my warm regards, won't you, my kin? Would that the others on Olympus knew and understood your kind as I now do."
		},
	},
	-- #endregion
	-- #endregion
	-- #region Misc (Inserted in a group after priority dialogues above)
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AresAboutThanatos03",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		-- TODO: Currently these are blocked on ArtemisFirstPickUp (needs adding through the mod)
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "ZeusUpgrade",
		{
			Cue = "/VO/Ares_0031",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Lord Zeus has gotten to you first, I see? My father's gifts are generous, indeed, though... I think I can help in my own way."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutPoseidon01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "PoseidonUpgrade",
		{
			Cue = "/VO/Ares_0032",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The blessing of your uncle Lord Poseidon might have helped you to this point, but here: My gift shall see you further still."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutAthena01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AthenaUpgrade",
		{
			Cue = "/VO/Ares_0035",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You bear the blessing of Athena, yes? She would protect you from your enemies, whilst I would rather that you slay them, and be done."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutAphrodite01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AphroditeUpgrade",
		{
			Cue = "/VO/Ares_0030",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Mm{#PreviousFormat}, I see you have the Lady Aphrodite's blessing there already. Love and death, together, hand in hand? Sounds most agreeable to me."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutArtemis01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "ArtemisUpgrade",
		{
			Cue = "/VO/Ares_0034",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So Artemis, my lonely half-sister, got to you first? She merely helps you hunt, whilst I shall help you kill. Observe."
		},
	},
	{
		Name = "AresAboutDionysus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "DionysusUpgrade",
		{
			Cue = "/VO/Ares_0033",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"That drunkard Dionysus cannot help you near as much as I, my hell-born kin. Compare the gift he gave to what I offer you."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutHermes01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HermesFirstPickUp", "HermesGift01", "AresGift01" },
		RequiredGodLoot = "HermesUpgrade",
		{
			Cue = "/VO/Ares_0125",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Our messenger Hermes has been in contact with you by now, yes? Perhaps you shall not see him very often, for my work keeps him rather preoccupied, shepherding souls and such."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutDemeter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp", "HermesFirstPickUp", "DemeterFirstPickUp" },
		RequiredGodLoot = "DemeterUpgrade",
		{
			Cue = "/VO/Ares_0158",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I faintly sense the mark of Goddess Demeter upon you, {#DialogueItalicFormat}hm{#PreviousFormat}? Her power over plentitude is opposite to mine in some respects. But, lately, she has channeled it in manners more agreeable to me."
		},
	},
	{
		Name = "AresRunProgress01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredRoomLastRun = "C_Intro",
		{
			Cue = "/VO/Ares_0037",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You traveled rather far down there since last we met, my kin. And that means you have dealt incalculable death. I must commend you thus."
		},
	},
	{
		Name = "AresRunProgress02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredKills = { SatyrRanged = 10, RatThug = 10, Crawler = 50 },
		RequiredRoomLastRun = "D_Hub",
		{
			Cue = "/VO/Ares_0126",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Ahh{#PreviousFormat}, my kin! I sensed fresh bloodshed from you recently, the real kind! For you have slain the living near the surface, have you not? Mere vermin, yes, but good enough for me."
		},
	},
	{
		Name = "AresRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp", "AresGift01" },
		RequiredBiome = "Asphodel",
		RequiredMinRunsCleared = 1,
		RequiresLastRunCleared = true,
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Ares_0169",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Recently, there was a burst of violence on the surface, near to where you are, but higher up. 'Twas altogether odd, but must have forced you to return once more. No matter; time is on our side."
		},
	},
	{
		Name = "AresRunCleared02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredMinRunsCleared = 2,
		RequiresLastRunCleared = true,
		{
			Cue = "/VO/Ares_0222",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I sense so much death at the gates of your father's realm, of late, my kin. Now, I know that seems perfectly ordinary on the face of it, except... there's something more. I wonder if {#DialogueItalicFormat}you {#PreviousFormat}know the reason why..."
		},
	},
	{
		Name = "AresRunCleared03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredMinRunsCleared = 3,
		RequiresLastRunCleared = true,
		{
			Cue = "/VO/Ares_0170",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I know your efforts to come here have repeatedly been thwarted, my good kin. However, we have caused such violence in the intervening time, that we must take this as a real victory. Let us continue for however long it takes."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutWar01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp", "AresGift04" },
		{
			Cue = "/VO/Ares_0221",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Surely you've heard rumblings about a war which has erupted on the surface, here? Doubtless you've seen an influx of fallen mortals. It's quite a decent one, I have to say! Though, unlikely to rise to the ranks of the greats. Too few armies involved in it, I fear."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutWar02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "ModsNikkelMHadesBiomes_AresAboutWar01", },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0196",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"War's such a wondrous thing, my kin. It solves so many different problems, whilst perpetuating its own inevitability. Let's keep it up, then, hm?"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutWar03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "ModsNikkelMHadesBiomes_AresAboutWar02", "AresGift07" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0212",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Do you ever think to yourself that you were born a bit too late, my kin? For my part, I wish that I could have been there myself when my father and the others waged ferocious war against the Titans. Ah, it must have been a sight!"
		},
	},
	{
		Name = "AresAboutWeaponEnchantments01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredMinUnlockedWeaponEnchantments = 5,
		{
			Cue = "/VO/Ares_0124",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I sense that you have forged a greater bond with your instruments of destruction there, my kin. Then that is very good. And may their altered forms serve you quite well."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresAboutKeepsake01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTrait = "ForceAresBoonTrait",
		{
			Cue = "/VO/Ares_0213",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ah, you bear the Blood-filled Vial which I granted you! The mortal's blood contained therein... I drew it myself! Too seldom am I able to become directly involved in such matters."
		},
	},
	{
		Name = "AresBackstory01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 5 },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Ares_0038",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Know that I admire your Lord Father very much. For his grim work lets me continue mine. I trust that one day you shall settle your dispute."
		},
	},
	{
		Name = "AresPostGiftPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "AresGift01", },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0028",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ah, my favorite Underworld death-dealer. I so look forward to the pain you shall inflict this time around."
		},
	},
	{
		Name = "AresPostGiftPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "AresGift02", },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0029",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Would that a sudden scourge of war would help you out of your predicament. Why, I would stir one up for you without a second thought."
		},
	},
	{
		Name = "AresPostGiftPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "AresGift03", },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0174",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ah, my closest kin in all the Underworld, I see you there, I think! What sort of violence shall we sow together this time, you and I?"
		},
	},
	{
		Name = "AresPostGiftPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "AresGift04", },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0175",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"There's so much insufferable talk of peace up here, my kin. It is quite the relief to focus on much more important things, with you."
		},
	},
	{
		Name = "AresPostGiftPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "AresGift05", },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0176",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You must know I often hunger for destruction, almost uncontrollably at that. Though I am finding you are able to sate that appetite of mine."
		},
	},
	{
		Name = "AresPostGiftPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "AresGift01", },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0195",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"May all the death you bring become the stuff of legends told in fearful mortal whisperings around the world, my kin."
		},
	},
	{
		Name = "AresPostEpilogue02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "ModsNikkelMHadesBiomes_AresPostEpilogue01" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0231",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You know, my kin, I had misunderstood that Nyx was your mother. But, Persephone? I never took her for the sort to have an interest in your realm. Alas that we never had opportunity to discuss the subject here."
		},
	},
	{
		Name = "AresPostEpilogue03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		RequiredTextLines = { "AresPostEpilogue02", "AresGift05" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0232",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your good mother, Persephone... dread Queen of the Underworld! I certainly misjudged her when we had occasion to interact whilst she resided on Olympus. Perhaps I, too, should consider a life there in your realm..."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresLegendaryPickUp01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Ares_0127",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The greatest wars require great alliances, my kin. And so, I shall entrust to you some of the greatest methods of destruction I've devised thus far."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresLegendaryPickUp02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Ares_0128",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The winds of war blow fiercely on the surface now, my kin. Thus I am able to confer upon you even greater power than has been my custom."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresLowHealth01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 0,
		{
			Cue = "/VO/Ares_0066",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You seem to be upon the verge of death, my kin. I cannot wait to hear of it! The experience of death, time after time! You are one of a kind!"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresLowHealth02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Ares_0067",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Ah, my kin, but you have suffered terribly to come this far. No matter, for we soon shall pay your enemies in kind."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresLowHealth03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Ares_0205",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So much letting of blood, so much of it, your own. Let's see to keeping you alive and in the fight a while longer, then."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresLowHealth04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Ares_0206",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're on the verge of yet another brush with death, I see, my hell-born kin. Do send some others down with you, would you?"
		},
	},
	{
		Name = "AresLowHealth05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AresFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Ares_0207",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"A mortal surely would have already succumbed to injuries such as the ones you've suffered, there. Impressive how you carry on, like that."
		},
	},
	-- #endregion
	-- #region Misc/No Priority
	{
		Name = "AresMiscPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "ModsNikkelMHadesBiomes_AresAboutZeus01",
			CreateNewPriorityGroup = true,
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0004",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I must say you deal death rather exquisitely. Though, perhaps I could be of some further assistance in such matters, yes?"
		},
	},
	{
		Name = "AresMiscPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0005",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"{#DialogueItalicFormat}Ah{#PreviousFormat}! I figured that you must have been the source of all that bloodshed underneath the earth. Let me see if I can make your death-dealing a little more efficient."
		},
	},
	{
		Name = "AresMiscPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0006",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Well, my hell-born kin, my blessing now is yours to do with as you wish; provided you inflict a little suffering for me?"
		},
	},
	{
		Name = "AresMiscPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0007",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I've just the thing for you this time, my kin. May I present my instruments of pain?"
		},
	},
	{
		Name = "AresMiscPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0008",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I surely hope your bloodshed's going well, and long that there shall be no end to it. I am, as ever, here to serve your benefit."
		},
	},
	{
		Name = "AresMiscPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0009",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"How fares your endless war against the dead? Let it be known that I am happy to take sides in such affairs. Please, I insist!"
		},
	},
	{
		Name = "AresMiscPickup07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0010",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Death rears its head in all too many forms, I'm sure you know. Though you may never find them all, I nonetheless encourage you to try."
		},
	},
	{
		Name = "AresMiscPickup08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0011",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The wretched dead you face perhaps forget themselves. Go, then, remind them of the agony which brought them to your realm."
		},
	},
	{
		Name = "AresMiscPickup09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0012",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Life and death are inextricable, and war is often what connects the two. Don't you agree?"
		},
	},
	{
		Name = "AresMiscPickup10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0013",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"This world has a limitless capacity for pain; and so, it truly is no inconvenience to help you to bring out a little more."
		},
	},
	{
		Name = "AresMiscPickup11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0014",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The living and the dead alike desire what I represent. Their appetite for bloodshed cannot easily be sated. A goal to strive for, no?"
		},
	},
	{
		Name = "AresMiscPickup12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0015",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Perhaps the dead you stand against have long forgotten the experience of anguish and despair. I trust that you shall soon remind them for me?"
		},
	},
	{
		Name = "AresMiscPickup13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0016",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Beautiful, isn't it? The strife which follows you. You have a real knack for this, and I for one am happy to assist."
		},
	},
	{
		Name = "AresMiscPickup14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0017",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Some would question the destruction which you sow, but I shall never do so. I fully understand your impulses. Allow me to indulge them."
		},
	},
	{
		Name = "AresMiscPickup15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0018",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Not once has your Lord Father thanked me for delivering vast portions of his clientele. Surely you shall be more grateful for my gifts."
		},
	},
	{
		Name = "AresMiscPickup16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0019",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Do you suppose the dead feel pain unlike the living? This is for me an endless fascination, so go on, and give me more to think about."
		},
	},
	{
		Name = "AresMiscPickup17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0020",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"As you continue waging war against the dead, I gladly lend you my support; family to family, no questions asked."
		},
	},
	{
		Name = "AresMiscPickup18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		Priority = true,
		RequiredTextLines = { "AresFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Ares_0042",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It is a veritable crime your father distances himself from all the rest of us. It is fortunate that you yourself are not so disagreeable."
		},
	},
	-- shorter acknowledgments
	{
		Name = "AresMiscPickup19",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0021",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let us together deal some death, shall we?"
		},
	},
	{
		Name = "AresMiscPickup20",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0022",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Shall we continue our campaign against the dead?"
		},
	},
	{
		Name = "AresMiscPickup21",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0023",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What do you say we bring the dead some pain, for old time's sake?"
		},
	},
	{
		Name = "AresMiscPickup22",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0024",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The devastation you have caused has not escaped my notice!"
		},
	},
	{
		Name = "AresMiscPickup23",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0025",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "We stand before a golden opportunity, to inflict pain. Let us proceed!"
		},
	},
	{
		Name = "AresMiscPickup24",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0026",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "There is no problem war cannot sort out."
		},
	},
	{
		Name = "AresMiscPickup25",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0027",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ah there you are, my kin! I have a gift to aid your bloody work."
		},
	},
	{
		Name = "AresMiscPickup26",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0138",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My blessing be with you, and may death follow in your wake."
		},
	},
	{
		Name = "AresMiscPickup27",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0139",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Please spread some suffering down there for me, my kin."
		},
	},
	{
		Name = "AresMiscPickup28",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0140",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I shall empower you to acts of greater violence than before."
		},
	},
	{
		Name = "AresMiscPickup29",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0141",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "War needn't carry out solely above the earth, my kin."
		},
	},
	{
		Name = "AresMiscPickup30",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0142",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I trust that the destruction which you sow is going well?"
		},
	},
	{
		Name = "AresMiscPickup31",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredRoomLastRun = "D_Intro",
		{
			Cue = "/VO/Ares_0143",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The recent devastation which you caused, that was impressive work."
		},
	},
	{
		Name = "AresMiscPickup32",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0144",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Whenever you bring death, why, you've my full support."
		},
	},
	{
		Name = "AresMiscPickup33",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0145",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "How fares the ceaseless slaying of your foes, quite well, my kin?"
		},
	},
	{
		Name = "AresMiscPickup34",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0146",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Perhaps my blessing shall let you deliver death still more efficiently."
		},
	},
	{
		Name = "AresMiscPickup35",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0147",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your father's realm shall be quite full, I think, once you and I are through."
		},
	},
	{
		Name = "AresMiscPickup36",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Ares_0148",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The finest instruments of death at my disposal shall be yours."
		},
	},
	{
		Name = "AresMiscPickup37",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Ares_0149",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'd like to offer you a choice amongst my most exquisite tools which inflict suffering."
		},
	},
	{
		Name = "AresMiscPickup38",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Ares_0150",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What say we start our next war with a special flair, my kin?"
		},
	},
	{
		Name = "AresMiscPickup39",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0151",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I've not seen ample blood spilled recently, so let's please make up for lost time."
		},
	},
	{
		Name = "AresMiscPickupExtra01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0197",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "There are so many types of death... and yet, the sudden, violent kind is unsurpassed, I think."
		},
	},
	{
		Name = "AresMiscPickupExtra02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0198",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I am quite eager to commence jointly killing your enemies, my kin."
		},
	},
	{
		Name = "AresMiscPickupExtra03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		RequiredAnyTextLines = { "AresGift02" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredMinTotalKills = 1000,
		{
			Cue = "/VO/Ares_0199",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "What do you say we start another of our famous killing sprees, my kin?"
		},
	},
	{
		Name = "AresMiscPickupExtra04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0200",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It's not been long since last I saw bloodshed... but far too long for me, nevertheless."
		},
	},
	{
		Name = "AresMiscPickupRareExtra01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Ares_0201",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My finest implements of death I now avail to you, my worthy kin."
		},
	},
	{
		Name = "AresMiscPickupRareExtra02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Ares_0202",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let us make this blood-letting truly one to remember, then, hm?"
		},
	},
	{
		Name = "AresMiscPickupRareExtra03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Ares_0203",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "May you sow such destruction as to shake this mountain to its core, my kin."
		},
	},
	{
		Name = "AresMiscPickupRareExtra04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Ares_0204",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I shall now give to you the means to wreak such havoc there, my kin!"
		},
	},
	{
		Name = "AresMiscPickupAboutNyx01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		RequiredAnyTextLines = { "AresAboutNyx06", "AresAboutNyx06_B" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0209",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I was quite pleased to hear again from Nyx of late, my kin."
		},
	},
	{
		Name = "AresMiscPickupAboutNyx02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		RequiredAnyTextLines = { "AresAboutNyx04", "AresAboutNyx04_B" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0210",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "May the wondrous goddess Nyx continue to watch over you, and darken the eyes of your foes."
		},
	},
	{
		Name = "AresMiscPickupAboutNyx03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresMiscPickup01",
		},
		RequiredTextLines = game.GameData.AresBasicPickUpTextLines,
		RequiredAnyTextLines = { "ModsNikkelMHadesBiomes_AresAboutNyx02", "ModsNikkelMHadesBiomes_AresAboutNyx02_B" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0211",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "To think you have the goddess Nyx's aid, as well as mine!"
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(
	newPortedInteractTextLines, "AresUpgrade", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Ares = { "Modsnikkelmhadesbiomesares", "ZagreusField" } }, { Ares_ = "Modsnikkelmhadesbiomesares_" },
	{ Ares_ = "ModsNikkelMHadesBiomes_Portrait_Ares_Default_01" }
)

local newPortedLootboughtTextLines = {
	{
		Name = "ModsNikkelMHadesBiomes_AresLootBought01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0043",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I knew that foul boatman would come through, and you would find amongst his wares this gift!"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresLootBought02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0044",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I give to you this token of respect, buried though it must have been within the boatman's hoard."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresLootBought03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0152",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I trust the river-boatman Charon has been keeping plenty busy lately thanks to me?"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresLootBought04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0153",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The boatman Charon ought invest into a boat of more substantial size if he's to keep up with my work, my kin."
		},
	},
	{
		Name = "AresLootBought05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_AresLootBought01",
		},
		PlayOnce = true,
		ChanceToPlay = 0.33,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0192",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your boatman there is a reliable deliverer of death, it seems. And that makes three of us, I think."
		},
	},
}
mod.AddNarrativeDataEntries(
	newPortedLootboughtTextLines, "AresUpgrade", "BoughtTextLines", "BoughtTextLinePriorities",
	{ Ares = { "Modsnikkelmhadesbiomesares" } }, { Ares_ = "Modsnikkelmhadesbiomesares_" },
	{ Ares_ = "ModsNikkelMHadesBiomes_Portrait_Ares_Default_01" }
)

local newPortedRejectionTextLines = {
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection01",
		RequiredFalseTextLines = { "AresGift03" },
		{
			Cue = "/VO/Ares_0003",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You reject my generous offering of aid? {#DialogueItalicFormat}Hahahaha{#PreviousFormat}, you must not know me very well. Death shall come, regardless, either to your enemies, or you."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection02",
		{
			Cue = "/VO/Ares_0045",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You would deny such aid as I would offer you? How rather disappointing. You've more to learn about the art of dealing death, it seems."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection03",
		{
			Cue = "/VO/Ares_0046",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"An incorrect decision, there, my kin, to side against me thus. Blood needs be shed, and yours is going to suffice."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection04",
		{
			Cue = "/VO/Ares_0047",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "It seems unwise of you to thus dismiss my offering. Suffer, then, a while by my hand."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection05",
		{
			Cue = "/VO/Ares_0048",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your choice leaves much to be desired here, my kin. My temper I shall keep in check, but only barely so."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection06",
		{
			Cue = "/VO/Ares_0129",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "A disappointing choice, my kin, and there are consequences to such choices, every single time."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection07",
		{
			Cue = "/VO/Ares_0130",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your course of action here was ill-advised, my kin. For war shall come to you no matter what, as I shall presently reveal."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection08",
		{
			Cue = "/VO/Ares_0131",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The whims of our kind are unpredictable, my kin. But you shall find responses to such acts to be the definition of consistency."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection09",
		{
			Cue = "/VO/Ares_0132",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'll not abide such disregard of our past companionship, my kin. In war, one must take sides, and you had best choose mine."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection10",
		{
			Cue = "/VO/Ares_0177",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"War shall be waged here, no matter what, my kin. But even still, I am dismayed you would have sided against me."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection11",
		{
			Cue = "/VO/Ares_0178",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You wish to have a taste of what a war against me would be like? Well, then, I shall oblige."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection12",
		{
			Cue = "/VO/Ares_0179",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Did I detect some hesitancy on your part just then? Perhaps you knew that you were making a mistake. No matter; you'll learn now."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresRejection13",
		{
			Cue = "/VO/Ares_0180",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 1.0,
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You shall not goad me into anger with a petty insult such as this, you know. Nevertheless, there is a price which must be paid for it."
		},
	},
}
mod.AddNarrativeDataEntries(
	newPortedRejectionTextLines, "AresUpgrade", "RejectionTextLines", nil,
	{ Ares = { "Modsnikkelmhadesbiomesares" } }, { Ares_ = "Modsnikkelmhadesbiomesares_" },
	{ Ares_ = "ModsNikkelMHadesBiomes_Portrait_Ares_Default_01" }
)

local newPortedMakeUpTextLines = {
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp01",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0049",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"A sacrifice in blood is fully paid, and we are squared away. Though think you twice next time before you cross me, hm?"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp02",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0050",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Well haven't you withstood my murderous intent! Resilience as this deserves reward, and I am feeling rather generous."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp03",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0051",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It is not often I attempt to kill someone and they survive. Bravo! Our score is settled up for now, so let us carry on as friends."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp04",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0052",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You capably survived my wrath, and I commend you for it. Let us continue on, as friends and kin."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp05",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0053",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I think that we are squared away, for now. Though, do not test my patience further, hm?"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp06",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0133",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You crossed the fields of death impressively back there. Though, you are fortunate I'm in a giving mood."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp07",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0134",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "When blood is spilled and death is dealt, I simply cannot remain discontented for too long."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp08",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0135",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"What I could see of that display of violence you just sowed was thoroughly commendable, my kin. Then, here."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp09",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0136",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your sacrifice to me just now has moved me to forgiveness for the time; thus shall we call a truce."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp10",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0137",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"A war can only last so long, my kin. This one is not worth the pursuit, I think, when we can wage a greater one, together."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp11",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0181",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Ah, after a show of violence such as that, how can I possibly remain upset, my kin?"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_AresMakeUp12",
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Ares_0182",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your slight against me is already forgotten; for I was more than pleased to witness such a monstrous show of force."
		},
	},
}
mod.AddNarrativeDataEntries(
	newPortedMakeUpTextLines, "AresUpgrade", "MakeUpTextLines", nil,
	{ Ares = { "Modsnikkelmhadesbiomesares" } }, { Ares_ = "Modsnikkelmhadesbiomesares_" },
	{ Ares_ = "ModsNikkelMHadesBiomes_Portrait_Ares_Default_01" }
)
