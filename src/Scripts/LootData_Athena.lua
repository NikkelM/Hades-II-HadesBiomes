-- #region Hermes-delivered opener
local newHermesDeliveredDialogues = {
	{
		Name = "AthenaFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
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
mod.AddHermesDeliveredDialogues(newHermesDeliveredDialogues,
	{ Hermes = { "Modsnikkelmhadesbiomesathena", "ZagreusField" } }, { Athena_ = "Modsnikkelmhadesbiomesathena_" },
	{ Athena_ = "ModsNikkelMHadesBiomes_Portrait_Athena_Default_01" }, "/SFX/AthenaBoonHolyShield",
	{ Athena = { Speaker = "NPC_Athena_01", NarrativeContextArt = "DialogueBackground_Olympus" } })
-- #endregion

-- #region Only added to Athena herself, not Hermes
local newAthenaExclusivePortedInteractTextLines = {
	-- #region Opener
	{
		Name = "AthenaFirstPickUp",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAtFirstPriority = true,
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		-- RequiredRoom = "RoomSimple01",
		-- Disabling since you meet her in person
		-- {
		-- 	Cue = "/VO/ZagreusField_0774",
		-- 	Portrait = "Portrait_Zag_Default_01",
		-- 	Speaker = "PlayerUnit_Intro",
		-- 	SpeakerLabelOffsetY = 18,
		-- 	PreLineThreadedFunctionName = "PowerWordPresentation",
		-- 	PreLineThreadedFunctionArgs = { WaitTime = 5.7 },
		-- 	PostLineAnim = "ZagreusInteractEquip",
		-- 	PostLineAnimTarget = "Hero",
		-- 	PostLineFunctionName = "BoonInteractPresentation",
		-- 	Text =
		-- 	"It's got to be her. Then, here goes nothing... {#DialogueItalicFormat}Ahem{#PreviousFormat}. In the name of Hades! Olympus, I accept this message."
		-- },
		{
			Cue = "/VO/Athena_0002",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"Hail, noble Cousin. Now, let's get you from that miserable place. I'll see that all of us upon Olympus do our part, beginning here with me."
		},
	},
	-- #endregion
	-- #region Misc
	{
		Name = "AthenaMiscPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AthenaFirstPickUp",
			CreateNewPriorityGroup = true,
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0003",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Keep fighting, Cousin. Fight from out of that eternal gloom. I trust that you'll be joining us upon Olympus shortly."
		},
	},
	{
		Name = "AthenaMiscPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0004",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I have your back, Cousin. Rise now to your rightful station with my blessings!"
		},
	},
	{
		Name = "AthenaMiscPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0005",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "May the light and fury of Olympus guide you from the dark, Cousin. I've a token of it for you here."
		},
	},
	{
		Name = "AthenaMiscPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0006",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Push forward, noble Cousin. I shall be keen to see you circumvent the perils that the Fates arranged for you this time."
		},
	},
	{
		Name = "AthenaMiscPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0007",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Vanquish all who stand against you, noble Cousin. I and your relatives upon Olympus shall assist you in so doing."
		},
	},
	{
		Name = "AthenaMiscPickup06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0008",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Sometimes I think about what you've endured, to have been living in that loathsome squalor, Cousin. I swear, you'll have your justice."
		},
	},
	{
		Name = "AthenaMiscPickup07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0009",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Do not fear your father's cruel legions, Cousin! Their lives are long since forfeit, and they cannot stand against one of your birthright, nor against my power."
		},
	},
	{
		Name = "AthenaMiscPickup08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0010",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Yours is a brazen plan of action, Zagreus, and I admire it. The boldest strategy often prevails. Especially with my support."
		},
	},
	{
		Name = "AthenaMiscPickup09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0011",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Take heart, Cousin; for you have found me even in the suffocating darkness of the Underworld. May my power be of some assistance."
		},
	},
	{
		Name = "AthenaMiscPickup10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0012",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your struggles have not gone unnoticed, Cousin, so take heart. Eternity awaits you once you finally break free."
		},
	},
	{
		Name = "AthenaMiscPickup11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0013",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Here on Olympus is the opposite of everything about that lifeless squalor you reside in, Zagreus. Fight on and come to us!"
		},
	},
	{
		Name = "AthenaMiscPickup12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0014",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Cousin, I grow angry merely thinking of your situation. May what power I can offer be of service as you struggle towards your fate."
		},
	},
	{
		Name = "AthenaMiscPickup13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0015",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your father chose to sever ties with all of us, and stew alone within his land beneath the earth. But you are not beholden to his actions. Fight!"
		},
	},
	{
		Name = "AthenaMiscPickup14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0016",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your labors make you stronger, noble Cousin. And, the blessings I now offer ought to make you stronger still."
		},
	},
	{
		Name = "AthenaMiscPickup15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0017",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I've found you once again, dear Cousin, and my strength is yours; so much of it as I can send there to the bowels of the earth."
		},
	},
	{
		Name = "AthenaMiscPickup16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0018",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'm here again to lend to you my power, noble Cousin. Though your own strength of will is how you'll finally break free of that cruel place."
		},
	},
	{
		Name = "AthenaMiscPickup17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0019",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'm pleased to see your father's stubbornness is manifest in you as such determination, Zagreus. My blessing be with you."
		},
	},
	{
		Name = "AthenaMiscPickup18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0020",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"What wretched fools dare stand against you, Cousin? Punish them, so that they learn something they ought have learned in life."
		},
	},
	{
		Name = "AthenaMiscPickup19",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0021",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hold fast to your resolve, Cousin, and climb on toward the surface. No matter how often your foothold falters, I am here."
		},
	},
	{
		Name = "AthenaMiscPickup20",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", },
		{
			Cue = "/VO/Athena_0150",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I shall not keep you, Zagreus, except to offer you some of my power to improve your chances of escape. Now quickly choose, and go."
		},
	},
	{
		Name = "AthenaMiscPickup19_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0024",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "May wisdom and good fortune guide you toward the light of day this time, Cousin."
		},
	},
	{
		Name = "AthenaMiscPickup20_B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0025",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The Underworld's wretched dead shall fear you yet, Cousin."
		},
	},
	{
		Name = "AthenaMiscPickup21",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0026",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Strength and wisdom guide you from the darkness, Zagreus."
		},
	},
	{
		Name = "AthenaMiscPickup22",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0027",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The low cunning of your lifeless enemies is not a match for your divine might."
		},
	},
	{
		Name = "AthenaMiscPickup23",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0028",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Remember I am always watching over you, dear Cousin."
		},
	},
	{
		Name = "AthenaMiscPickup24",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		Priority = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0029",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "You'll have your justice in due course, Cousin. I promise you."
		},
	},
	{
		Name = "AthenaMiscPickup25",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0030",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The might and fury of Olympus courses through you, noble Cousin."
		},
	},
	{
		Name = "AthenaMiscPickupExtra01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0154",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I take it you've a plan in mind this time for how you're going to escape, don't you, Cousin?"
		},
	},
	{
		Name = "AthenaMiscPickupExtra02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0155",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I shall not keep you, Zagreus, except to offer you my power to improve your chances of escape."
		},
	},
	{
		Name = "AthenaMiscPickupExtra03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0156",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Remain relentless in your effort, Zagreus. For perseverance is a quality we all possess."
		},
	},
	{
		Name = "AthenaMiscPickupExtra04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0157",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I and your family on Olympus all stand ready to support you in your efforts, noble Cousin."
		},
	},
	{
		Name = "AthenaMiscPickupExtra05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0158",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Remember, doubt and hesitancy are your real enemies, Cousin."
		},
	},
	{
		Name = "AthenaMiscPickupExtra06",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0159",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I know that you are more than capable even without my power, Cousin. But just in case..."
		},
	},
	{
		Name = "AthenaMiscPickupExtra07",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		{
			Cue = "/VO/Athena_0160",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Envision your success, and choose the means by which you shall achieve it, Zagreus."
		},
	},
	{
		Name = "AthenaMiscPickupExtra08",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0161",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I shall not offer empty words, dear Cousin; I shall instead offer you this."
		},
	},
	{
		Name = "AthenaMiscPickupExtra09",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0162",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "With our ferocity combined, Cousin, what chances do your father's forces even have?"
		},
	},
	{
		Name = "AthenaMiscPickupExtra10",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0163",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "My support alone is not enough to see you through this, Zagreus; but it certainly shall help."
		},
	},
	{
		Name = "AthenaMiscPickupExtra11",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0164",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Your foes shall soon find it impossible to overcome your strength, combined with mine."
		},
	},
	{
		Name = "AthenaMiscPickupExtra12",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0165",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I've every confidence that you shall imminently put my blessing to good use."
		},
	},
	{
		Name = "AthenaMiscPickupExtra13",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0166",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Let not your sense of purpose waver, Zagreus. Visualize the outcome you desire."
		},
	},
	{
		Name = "AthenaMiscPickupExtra14",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0167",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Make not the same mistake twice, and you shall always grow wiser, no matter what else."
		},
	},
	{
		Name = "AthenaMiscPickupExtra15",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0168",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I shall do everything within my power to defend you from the perils of your journey, Zagreus."
		},
	},
	{
		Name = "AthenaMiscPickupExtra16",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0169",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Take heed against your father's legions, Zagreus. And take also my power."
		},
	},
	{
		Name = "AthenaMiscPickupExtra17",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0170",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Do not forget that changing strategy can be the key to victory, Cousin."
		},
	},
	{
		Name = "AthenaMiscPickupExtra18",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0171",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I cannot glean the details of your predicament right now, Cousin. Though maybe this shall help."
		},
	},
	{
		Name = "AthenaMiscPickupExtra19",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = game.GameData.AthenaBasicPickUpTextLines,
		{
			Cue = "/VO/Athena_0172",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "The might and honor of Olympus shield you against the darkness and the dead, Zagreus."
		},
	},
	{
		Name = "AthenaMiscPickupRare01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		RequiredTextLines = { "AthenaFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Athena_0173",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I take it having an impenetrable defense against your enemies may be of some use, Cousin?"
		},
	},
	{
		Name = "AthenaMiscPickupRare02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		RequiredTextLines = { "AthenaFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Athena_0174",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I'm not in any mood to trifle with your father's nonsense this time, Zagreus. So, use this."
		},
	},
	{
		Name = "AthenaMiscPickupRare03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		RequiredTextLines = { "AthenaFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Athena_0175",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "These are among the mightest defenses I can offer, Zagreus. Choose wisely, then."
		},
	},
	{
		Name = "AthenaMiscPickupRare04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		RequiredTextLines = { "AthenaFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredLootChoices = 3,
		RequiredInactiveMetaUpgrade = "ReducedLootChoicesShrineUpgrade",
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Athena_0176",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "I've readied several of my most potent blessings so your victory can be achieved, Cousin."
		},
	},
	{
		Name = "AthenaMiscPickupRare05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaMiscPickup01",
		},
		RequiredTextLines = { "AthenaFirstPickUp" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Athena_0177",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text = "Observe, dear Cousin, for this time I offer you uncommonly superior protection."
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(
	newAthenaExclusivePortedInteractTextLines, "NPC_Athena_01", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Athena = { "Modsnikkelmhadesbiomesathena", "ZagreusField" } }, { Athena_ = "Modsnikkelmhadesbiomesathena_" },
	{ Athena_ = "ModsNikkelMHadesBiomes_Portrait_Athena_Default_01" }, nil, nil, true,
	{ "PreEventFunctionName", "PreEventFunctionArgs" }
)
-- #endregion

-- #region Ported Athena interact dialogues
-- #region Hermes-delivered super-priority
local newAthenaOlympianReunionTextLines = {
	{
		Name = "AthenaAboutOlympianReunionQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AthenaFirstPickUp",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		RequiredTextLines = { "AthenaFirstPickUp", "PersephoneAboutOlympianReunionQuest01" },
		{
			Cue = "/VO/ZagreusField_4338",
			Portrait = "Portrait_Zag_Default_01",
			Speaker = "CharProtag",
			PreLineThreadedFunctionName = "PowerWordPresentation",
			PreLineThreadedFunctionArgs = { WaitTime = 2.24 },
			PostLineAnim = "ZagreusInteractEquip",
			PostLineAnimTarget = "Hero",
			PostLineFunctionName = "BoonInteractPresentation",
			Text =
			"This is it, then. In the name of Hades! Olympus, this is an official message! Lady Athena, I trust you'll quickly figure this one out."
		},
		{
			Cue = "/VO/Athena_0233",
			PortraitExitWait = 1.25,
			PreContentSound = "/Leftovers/Menu Sounds/TextReveal2",
			UseEventEndSound = true,
			Text =
			"Is this some kind of offering for me? No, hold a moment, this appears to be a message! Part of one. Then, can this mean...? I have to notify the others. I trust they also have received something from you, or shortly shall."
		},
	},
}
-- #endregion

-- #region Athena priority
local newAthenaPriorityTextLines = {
	{
		Name = "AthenaAboutDemeter01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutOlympianReunionQuest01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredGodLoot = "DemeterUpgrade",
		{
			Cue = "/VO/Athena_0212",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The biting cold surrounding you must mean the Goddess of Seasons decided to take an interest in your struggle, Zagreus? I did not count on Demeter being a part of this. Take heart, though use discretion around her."
		},
	},
	{
		Name = "AthenaPostEpilogue01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutDemeter01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0234",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It was my privilege to have visited your father's House, and briefly had a chance to meet {#DialogueItalicFormat}you{#PreviousFormat}, Zagreus. Nyx and your mother each are very shrewd; perhaps you've taken after both of them. As for your new responsibilities... exposing weak points in defenses is my specialty."
		},
	},
	{
		Name = "AthenaAboutZeus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutDemeter01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredGodLoot = "ZeusUpgrade",
		{
			Cue = "/VO/Athena_0034",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I understand you've been in contact with my father. Your uncle Zeus, I mean. He's taken interest in your plight; you should feel honored!"
		},
	},
	{
		Name = "AthenaAboutPoseidon01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiredGodLoot = "PoseidonUpgrade",
		{
			Cue = "/VO/Athena_0035",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've met the master of the seas, Poseidon, haven't you? Our uncle's affable but quick to anger. Be on your guard with him, is my advice."
		},
	},
	{
		Name = "AthenaAboutAphrodite01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", "AphroditeFirstPickUp" },
		RequiredFalseTextLines = { "AphroditeWithAthena01", "AthenaAboutAphrodite01", "OlympianReunionQuestComplete" },
		RequiredGodLoot = "AphroditeUpgrade",
		{
			Cue = "/VO/Athena_0033",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Cousin, you've met Aphrodite, no? She likes beguiling others with her charms; but her intentions with you I believe are pure. You'll find our strengths are complementary."
		},
	},
	{
		Name = "AthenaAboutAres01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "AresUpgrade",
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0036",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"My warlike brother Ares reached you, didn't he. I've always found his conduct quite disturbing. At least it seems he's helping you for now."
		},
	},
	{
		Name = "AthenaAboutArtemis01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "ArtemisUpgrade",
		{
			Cue = "/VO/Athena_0037",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I'll tell you something, Cousin: If even Artemis is aiding you, it's proof your cause is just. She doesn't often take an interest in family affairs."
		},
	},
	{
		Name = "AthenaAboutDionysus01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "DionysusUpgrade",
		{
			Cue = "/VO/Athena_0038",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Did Dionysus truly visit you before? He tends to seek out revelry, not conflict. I'm pleased to know he's making himself useful here."
		},
	},
	{
		Name = "AthenaAboutHermes01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ZeusFirstPickUp", "PoseidonFirstPickUp", "AthenaFirstPickUp", "AphroditeFirstPickUp", "AresFirstPickUp", "ArtemisFirstPickUp", "DionysusFirstPickUp" },
		RequiredGodLoot = "HermesUpgrade",
		{
			Cue = "/VO/Athena_0211",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You arrived sooner than anticipated, Cousin, and my estimations seldom are inaccurate. All for the best, of course. Perhaps you're simply faster than I thought."
		},
	},
	{
		Name = "AthenaAboutHadesKeepsake01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete" },
		RequiredTrait = "HadesShoutKeepsake",
		{
			Cue = "/VO/Athena_0237",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Zagreus, perhaps it is a fancy of imagination, but it seems almost as though, this time, you bear the blessing of... your own father! If Lord Hades is assisting you in any way in this, then I shall hold out hope that your relationship yet has capacity to heal, to some extent at least."
		},
	},
	{
		Name = "AthenaAboutHadesKeepsake02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		RequiredFalseTextLinesThisRun = game.GameData.GodAboutGodVoiceLines,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaAboutHadesKeepsake01", "AthenaGift03", "HadesGift03" },
		MinRunsSinceAnyTextLines = { TextLines = { "AthenaAboutHadesKeepsake01" }, Count = 2 },
		RequiredTrait = "HadesShoutKeepsake",
		{
			Cue = "/VO/Athena_0238",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"So you've another blessing from Lord Hades, then. Zagreus, I'm under no delusion you and your father shall become the closest friends, from here. Neverthless, I do believe it's possible to move forward even such a relationship as yours. Believe me... I know."
		},
	},
}
-- #endregion

-- #region Athena-only contextual
local newAthenaExclusivePostGiftTextLines = {
	{
		Name = "AthenaPostGiftPickup01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "AthenaAboutDemeter01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaGift01", },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0031",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I so look forward to our meeting face to face amongst the gods, dear Cousin. Olympus shall be merrier and wiser once you're here."
		},
	},
	{
		Name = "AthenaPostGiftPickup02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaGift02", },
		{
			Cue = "/VO/Athena_0032",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Hail and good tidings to you, noble Cousin. May you be swift and thorough vanquishing the dead who dare oppose you."
		},
	},
	{
		Name = "AthenaPostGiftPickup03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaGift03", },
		{
			Cue = "/VO/Athena_0151",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Remain relentless in your effort to escape, dear Cousin. In spite of all our differences, perseverance is a quality we all possess."
		},
	},
	{
		Name = "AthenaPostGiftPickup04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaGift04", },
		{
			Cue = "/VO/Athena_0152",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You can always count upon assistance from me, Zagreus. I always shall prioritize the needs of our family above everything else."
		},
	},
	{
		Name = "AthenaPostGiftPickup05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaGift05", },
		{
			Cue = "/VO/Athena_0153",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Let my voice be a glimmer in the darkness, noble Cousin; though, may the blessing I am about to provide be even more than that."
		},
	},
}
-- #endregion

-- #region Athena priority
local newAthenaRelationshipTextLines = {
	{
		Name = "AthenaVsOlympians01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", "PoseidonFirstPickUp", "ZeusFirstPickUp", "ArtemisFirstPickUp", "AphroditeFirstPickUp", "DionysusFirstPickUp", "AresFirstPickUp" },
		{
			Cue = "/VO/Athena_0041",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You've met your distant relatives by now. We don't all share the same demeanor, nor see eye to eye. Though, all of us, I think, wish you the best."
		},
	},
	{
		Name = "AthenaBackstory01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		RequiredMinNPCInteractions = { NPC_Nyx_01 = 1 },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0042",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The one called Nyx... she is your mother, as I understand? We Olympians rarely consort with the chthonic gods. Though Nyx herself reached out to me about your plight, and I was spurred to act."
		},
	},
	{
		Name = "AthenaBackstory02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "NyxAboutAthena01", "AthenaGift02", "NyxGift02", "NyxAboutPersephone01" },
		RequiredFalseTextLinesLastRun = { "AthenaBackstory01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0043",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Please send the goddess Nyx my kind regards. That she supports you in your effort to escape her own domain suggests a selflessness I would not have expected."
		},
	},
	{
		Name = "AthenaBackstory03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaBackstory01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0040",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It's such a cruelty that your father hid the knowledge of your birth and life from us, my cousin. It's unacceptable."
		},
	},
	{
		Name = "AthenaBackstory04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", "ZeusFirstPickUp" },
		RequiredMinNPCInteractions = { NPC_Hades_01 = 1 },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0044",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Your father Hades and my father Zeus have not communicated in some time, and Zeus refuses to explain. Something transpired between the two of them. Perhaps you know better than I."
		},
	},
	{
		Name = "AthenaBackstory05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaVsOlympians01" },
		{
			Cue = "/VO/Athena_0045",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"There's something that I've wished to tell you, Zagreus: There is no shame in your upbringing. Many of us on Olympus, we likewise were born and raised under the strangest circumstances. Someday I'll have to tell you about mine."
		},
	},
	{
		Name = "AthenaPostFlashback01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "HadesPostFlashback01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0039",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're nothing like your father, Zagreus. I mean that as a compliment. He cut himself off from the rest of us. Many times have we attempted peace, to no avail."
		},
	},
}
-- #endregion

-- #region Athena-only contextual
local newAthenaExclusiveRunTextLines = {
	{
		Name = "AthenaRunProgress01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyRoomsLastRun = { "B_Boss01", "B_Boss02" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0046",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It comforts me to see how far you've come, Cousin. And I am confident that you shall make your way, eventually. I shall look forward to our conversations then."
		},
	},
	{
		Name = "AthenaRunProgress02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredBiome = "Asphodel",
		RequiredRunsCleared = 0,
		{
			Cue = "/VO/Athena_0202",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You reached the flames of Asphodel, well done! You may have quite a distance still to go, but having crossed through Tartarus is no small step, Cousin."
		},
	},
	{
		Name = "AthenaRunProgress03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredRoomLastRun = "C_Intro",
		RequiredFalseRoomLastRun = "D_Intro",
		RequiredMaxRunsCleared = 2,
		{
			Cue = "/VO/Athena_0203",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I see you've made it all the way to hallowed Elysium, Cousin? A significant way toward the surface, and if you could get there the one time, surely you have what it takes to do it again, and overcome the dangers that await therein."
		},
	},
	{
		Name = "AthenaRunProgress04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredAnyRoomsLastRun = { "D_Intro" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		RequiresLastRunNotCleared = true,
		{
			Cue = "/VO/Athena_0204",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I understand you nearly reached the surface lately, Zagreus. My confidence remains unshaken that you shall get out of there, eventually. No matter what sorts of unknown horrors lie shrouded beyond the boundary there."
		},
	},
	{
		Name = "AthenaRunCleared01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiresLastRunCleared = true,
		{
			Cue = "/VO/Athena_0205",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Were you not close to having reached the surface lately, Cousin? Then, this can only mean some unforeseen impediment prevented your escape."
		},
	},
	{
		Name = "AthenaRunCleared02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiresLastRunCleared = true,
		RequiredTextLines = { "AthenaRunCleared01" },
		RequiredFalseTextLines = { "OlympianReunionQuestComplete" },
		{
			Cue = "/VO/Athena_0206",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"There must be some unconquerable force or foe awaiting you, just at the border of your realm and ours. We cannot even see it through a shroud of darkness, there. I shall make certain that your family knows it may take considerable time to surpass... so fear not, for we are patient, here."
		},
	},
	{
		Name = "AthenaRunCleared03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiresLastRunCleared = true,
		RequiredTextLines = { "AthenaRunCleared01", "AthenaGift06" },
		{
			Cue = "/VO/Athena_0207",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Despite whatever difficulties you've encountered, dear Cousin, again and again, you have never yielded. I must admit, your strength of will is quite inspiring. For, even I have doubts, from time to time. It's all the clearer to me why the goddess Nyx spoke so highly of you."
		},
	},
}
-- #endregion

-- #region Athena priority
local newAthenaLateStoryTextLines = {
	{
		Name = "AthenaPostEpilogue02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "OlympianReunionQuestComplete", "AthenaPostEpilogue01" },
		{
			Cue = "/VO/Athena_0235",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It's fortunate your troubles with your mother were resolved. Persephone, I mean! To think I led all of my family to believe your mother was the goddess Nyx, instead. It seems I was an unwitting accomplice to a bit of a deception, there. But Nyx, I know she merely tried to help."
		},
	},
	{
		Name = "AthenaAboutKeepsake01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTrait = "ForceAthenaBoonTrait",
		{
			Cue = "/VO/Athena_0213",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You bear my Owl Pendant, noble Cousin! Wherever it should go, I faintly see its shimmer from afar. Even where you reside! For owls see in total darkness, after all."
		},
	},
	{
		Name = "AthenaAboutNyx01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaGift04", "NyxGift04" },
		{
			Cue = "/VO/Athena_0208",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"I have grown closer than expected with the goddess Nyx in all of this, Cousin. It is quite evident to me how much she cares for you. I must admit I envy your relationship, sometimes. For I've made do without a mother's presence in my life."
		},
	},
	{
		Name = "AthenaAboutNyx02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		-- Removed AresWithAthena01 as Athena is not a boon-giver and the Duo-dialogue is not available
		RequiredTextLines = { "AthenaGift04" },
		RequiredAnyTextLines = { "AresAboutNyx04", "AresAboutNyx04_B" },
		RequiredFalseTextLinesLastRun = { "AresAboutNyx04", "AresAboutNyx04_B" },
		{
			Cue = "/VO/Athena_0209",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Lord Ares has suggested he and goddess Nyx have grown much closer to each other, in all this. Nothing untoward, if you must know. Ares and I have often disagreed, about so many things, and yet we share a fondness for the Night herself, it seems."
		},
	},
	{
		Name = "AthenaAboutNyx03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaGift07", "NyxGift09" },
		{
			Cue = "/VO/Athena_0210",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Sometimes I think about the goddess Nyx, and how I long for her to be the mother that I never had, Cousin. Is it improper that I say such things to you? One would expect I would already have somebody on Olympus, yet... it often feels as though I am the mother, here."
		},
	},
	{
		Name = "AthenaAboutQuestLog01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaAboutZeus01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiresLastRunCleared = true,
		RequiredTextLines = { "AthenaFirstPickUp" },
		-- RequiredCosmetics = { "QuestLog", },
		RequiredScreenViewed = "QuestLog",
		RequiredMinQuestsComplete = 5,
		{
			Cue = "/VO/Athena_0216",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The goddess Nyx has indicated you possess a list of prophecies from the Three Fates. I've such a list upon Olympus, here! It seems to be connected to your own, as several prophecies already are fulfilled. Isn't it such an honor to urge Fate along?"
		},
	},
}
-- #endregion

-- #region Athena-only contextual
local newAthenaExclusiveContextualTextLines = {
	{
		Name = "AthenaLegendaryPickUp01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Athena_0181",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You cannot withstand your father's legions, Zagreus. But if you possess one of my greatest blessings, things may unfold differently, I think."
		},
	},
	{
		Name = "AthenaLegendaryPickUp02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Athena_0182",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Dear Cousin, would that I could give to you everlasting, tireless resolve. Though, come to think of it, this may be suited as a counterpart."
		},
	},
	{
		Name = "AthenaMaxRelationship01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		-- Updated from broken Athena_07
		RequiredTextLines = { "AthenaGift07" },
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/Athena_0222",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Supporting you through your ordeal, Cousin? It's reminiscent of the thrill of doing battle by the side of those whom I hold dear. I may be safe upon our mountaintop, though I am with you there, as well... for every well-earned victory, and bitter loss."
		},
	},
	{
		Name = "AthenaLowHealth01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Athena_0071",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You're badly injured aren't you, Cousin? I wish that I could will the pain away, though at the least I can provide you this."
		},
	},
	{
		Name = "AthenaLowHealth02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Athena_0072",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Look at you, Zagreus, you're barely fit to fight from all the injury that you've sustained! I'll try to keep you going for as long as possible."
		},
	},
	{
		Name = "AthenaLowHealth03",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Athena_0183",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"It seems to me that you've sustained life-draining injuries already, Zagreus. But don't lose hope. We can sustain you in a proper fighting shape."
		},
	},
	{
		Name = "AthenaLowHealth04",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Athena_0184",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"You may have suffered many wounds but shall not perish imminently, Cousin. Not if I have anything to say about it. Here."
		},
	},
	{
		Name = "AthenaLowHealth05",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp", "AthenaGift01" },
		RequiredMaxHealthFraction = 0.25,
		RequiredMaxLastStands = 1,
		{
			Cue = "/VO/Athena_0185",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"Oh, Zagreus... your recent battles evidently haven't gone as hoped. Nevertheless, always strive onward, while you still draw breath."
		},
	},
	{
		-- Two versions exist in H1, so adding the _Alternate suffix
		Name = "AthenaLegendaryPickUp01_Alternate",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Athena_0022",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"For you, my cousin Zagreus, I wish to offer the most potent of the blessings I am able to bestow. Make wise your use of this, and rise toward us!"
		},
	},
	{
		-- Two versions exist in H1, so adding the _Alternate suffix
		Name = "AthenaLegendaryPickUp02_Alternate",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "AthenaPostGiftPickup01",
		},
		PlayOnce = true,
		PreEventFunctionName = "BoonInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "AthenaFirstPickUp" },
		ValuableUpgradeInRoom = {
			AllAtLeastRarity = "Rare",
			HasAtLeastRarity = "Epic",
		},
		{
			Cue = "/VO/Athena_0023",
			StartSound = "/Leftovers/World Sounds/MapZoomInShort",
			UseEventEndSound = true,
			Text =
			"The circumstances spur me now to offer you the greatest of my powers, Cousin. Take my strength, and strike the darkness down!"
		},
	},
}
-- #endregion

mod.AddHermesDeliveredDialogues(game.DeepCopyTable(newAthenaOlympianReunionTextLines) or {},
	{ Hermes = { "Modsnikkelmhadesbiomesathena", "ZagreusField" } }, { Athena_ = "Modsnikkelmhadesbiomesathena_" },
	{ Athena_ = "ModsNikkelMHadesBiomes_Portrait_Athena_Default_01" }, "/SFX/AthenaBoonHolyShield",
	{ Athena = { Speaker = "NPC_Athena_01", NarrativeContextArt = "DialogueBackground_Olympus" } })

local athenaPriorityTextLines = game.ConcatTableValuesIPairs(
	game.ConcatTableValuesIPairs(
		game.ConcatTableValuesIPairs(newAthenaOlympianReunionTextLines, newAthenaPriorityTextLines),
		newAthenaRelationshipTextLines),
	newAthenaLateStoryTextLines) or {}
mod.AddNarrativeDataEntries(
	athenaPriorityTextLines, "NPC_Athena_01", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Athena = { "Modsnikkelmhadesbiomesathena", "ZagreusField" } }, { Athena_ = "Modsnikkelmhadesbiomesathena_" },
	{ Athena_ = "ModsNikkelMHadesBiomes_Portrait_Athena_Default_01" }, nil, nil, true,
	{ "PreEventFunctionName", "PreEventFunctionArgs" }
)

local exclusiveAthenaContextualTextLines = game.ConcatTableValuesIPairs(
	game.ConcatTableValuesIPairs(newAthenaExclusivePostGiftTextLines, newAthenaExclusiveRunTextLines),
	newAthenaExclusiveContextualTextLines) or {}
mod.AddNarrativeDataEntries(
	exclusiveAthenaContextualTextLines, "NPC_Athena_01", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Athena = { "Modsnikkelmhadesbiomesathena", "ZagreusField" } }, { Athena_ = "Modsnikkelmhadesbiomesathena_" },
	{ Athena_ = "ModsNikkelMHadesBiomes_Portrait_Athena_Default_01" }, nil, nil, true,
	{ "PreEventFunctionName", "PreEventFunctionArgs" }
)
-- #endregion
