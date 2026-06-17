-- #region These are played when picking up a Hermes boon in a modded run
local newHermesDeliveredDialogues = {
	{
		Name = "DionysusAboutOrpheus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "HermesAboutApolloKeepsake01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		-- Removed DionysusFirstPickUp
		RequiredTextLines = { "DionysusGift01", "OrpheusTallTale03" },
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
	{ Dionysus_ = "ModsNikkelMHadesBiomes_Portrait_Dionysus_Default_01" })
-- #endregion
