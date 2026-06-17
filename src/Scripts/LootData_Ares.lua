-- #region These are played when picking up a Hermes boon in a modded run
local newHermesDeliveredDialogues = {
	{
		Name = "AresAboutThanatos01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "HermesAboutApolloKeepsake01",
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
		Name = "AresAboutThanatos03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AresAboutThanatos01",
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
}

mod.AddHermesDeliveredDialogues(newHermesDeliveredDialogues,
	{ Hermes = { "Modsnikkelmhadesbiomesares", "ZagreusField" } }, { Ares_ = "Modsnikkelmhadesbiomesares_" },
	{ Ares_ = "ModsNikkelMHadesBiomes_Portrait_Ares_Default_01" }, "/SFX/AresBoonBattle")
-- #endregion
