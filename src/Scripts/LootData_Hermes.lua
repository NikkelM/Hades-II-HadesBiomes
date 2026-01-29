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
}
mod.AddNarrativeDataEntries(
	newPortedInteractTextLines, "HermesUpgrade", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Hermes = { "Dusa" } }, { Hermes_ = "Dusa_0" },
	{ Hermes_ = "ModsNikkelMHadesBiomes_Portrait_Hermes_Default_01" }
)
