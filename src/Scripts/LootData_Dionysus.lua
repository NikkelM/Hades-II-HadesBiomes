-- #region These are played when picking up a Hermes boon in a modded run
local newHermesDeliveredDialogues = {
	{
		Name = "DionysusFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "HermesAboutApolloKeepsake01",
			CreateNewPriorityGroup = true,
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
	{
		Name = "DionysusAboutOrpheus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "DionysusFirstPickUp",
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
}

mod.AddHermesDeliveredDialogues(newHermesDeliveredDialogues,
	{ Hermes = { "Modsnikkelmhadesbiomesdionysus", "ZagreusField" } }, { Dionysus_ = "Modsnikkelmhadesbiomesdionysus_" },
	{ Dionysus_ = "ModsNikkelMHadesBiomes_Portrait_Dionysus_Default_01" }, "/SFX/DionysusBoonWineLaugh")
-- #endregion
