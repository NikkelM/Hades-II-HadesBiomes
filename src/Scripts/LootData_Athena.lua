-- #region These are EXCLUSIVELY played when picking up a Hermes boon in a modded run
local newExclusiveHermesDeliveredDialogues = {
	{
		Name = "AthenaFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "HermesAboutUltimateProgress01",
			HermesDeliveredDialoguesSkipIntroLine = true,
		},
		PlayOnce = true,
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Hermes_AthenaFirstPickUp_0000",
			Speaker = "HermesUpgrade",
			Portrait = "ModsNikkelMHadesBiomes_Portrait_Hermes_Default_01",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			-- Custom for this dialogue
			PreLineThreadedFunctionName = _PLUGIN.guid .. "." .. "PlayDummyLootPickupCue",
			PreLineThreadedFunctionArgs = {
				DummyCues = { "/VO/Hermes_0129" },
				DummyVoiceBank = "HermesUpgrade",
			},
			PostLineThreadedFunctionName = _PLUGIN.guid .. "." .. "PlayDummyLootPickupCue",
			PostLineThreadedFunctionArgs = {
				DummyCues = { "/SFX/AthenaBoonHolyShield" },
			},
			NarrativeContextArt = "DialogueBackground_Olympus",
			PostLineRemoveContextArt = true,
			ExitPortraitImmediately = true,
			Text =
			"Hey boss, glad to catch you here. Got a message here from a friend of Nyx's that I was supposed to deliver a while ago, one of many to come, take a look!"
		},
		{
			Cue = "/VO/ZagreusField_0774",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineFunctionName = "BoonInteractPresentation",
			PreLineWait = 0.8,
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 5.7 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"It's got to be her. Then, here goes nothing... {#DialogueItalicFormat}Ahem{#PreviousFormat}. In the name of Hades! Olympus, I accept this message."
		},
		{
			Cue = "/VO/Athena_0002",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"Hail, noble Cousin. Now, let's get you from that miserable place. I'll see that all of us upon Olympus do our part, beginning here with me."
		},
	},
}

mod.AddHermesDeliveredDialogues(newExclusiveHermesDeliveredDialogues,
	{ Hermes = { "Modsnikkelmhadesbiomesathena", "ZagreusField" } }, { Athena_ = "Modsnikkelmhadesbiomesathena_" },
	{ Athena_ = "ModsNikkelMHadesBiomes_Portrait_Athena_Default_01" }, "/SFX/AthenaBoonHolyShield")
-- #endregion

-- #region These can play either when picking up a Hermes boon, or meeting Athena in a modded run
-- TODO: Also add new non-exclusive Hermes-delivered dialogues to Athena herself as she can be summoned during modded runs
-- #endregion
