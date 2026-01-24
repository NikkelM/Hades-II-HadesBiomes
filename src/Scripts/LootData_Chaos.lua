local newInteractTextLines = {
	-- #region Keepsake Questline
	ChaosAboutStyx01 = {
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ChaosAboutSurfaceAppearance01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ChaosFirstPickUp" },
		RequiredRoomLastRun = "D_Intro",
		RequiredFalseFlags = { "NyxChaosReunionInProgress" },
		{
			Cue = "/VO/Chaos_0317",
			StartSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			UseEventEndSound = true,
			Text =
			"You have traveled recently beyond my senses, Son of Hades. I persist here only in the fathomless depths. I know what lies out there, having created it. But I know nothing of what it is like, right now. Do not tell me. I prefer to think of all the possibilities."
		},
	},
	ChaosSurfaceQuest01 = {
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ChaosAboutStyx01",
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ChaosAboutStyx01", "ChaosGift06", "LordHadesDefeated02" },
		RequiredRoomLastRun = "D_Intro",
		RequiredFalseFlags = { "NyxChaosReunionInProgress" },
		RequiredMinRunsCleared = 2,
		{
			Cue = "/VO/Chaos_0318",
			StartSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			Text =
			"From the rumblings of the earth, I have deduced your father, himself, stands against you when at last you are about to leave these depths. It must be quite an interaction between you. Have I deduced correctly? Respond."
		},
		{
			Cue = "/VO/ZagreusField_3804",
			Speaker = "CharProtag",
			Portrait = "Portrait_Zag_Default_01",
			SecretMusicMutedStems = { "ChaosBass" },
			PreLineAnim = "ZagreusTalkDenialStart",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "ZagreusTalkDenialReturnToIdle",
			PostLineAnimTarget = "Hero",
			Text =
			"That's right, Master Chaos. My father personally takes it upon himself to stop me in the event none of his underlings beat him to it. He... can be a handful."
		},
		{
			Cue = "/VO/Chaos_0319",
			UseEventEndSound = true,
			SecretMusicActiveStems = { "ChaosBass" },
			Text =
			"Well, then. Consider bringing to one of your future interactions the small round catalyst, which I provided you. The one in the shape you call an egg? It shall serve no purpose there at all. Yet if you succeed, then it shall bring us some amusement, shall it not?"
		},
	},
	ChaosSurfaceQuestComplete = {
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ChaosAboutStyx01",
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "LordHadesChaosSurfaceQuestDefeat01" },
		RequiredFalseFlags = { "NyxChaosReunionInProgress" },
		{
			Cue = "/VO/Chaos_0320",
			StartSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			UseEventEndSound = true,
			Text =
			"I faintly sensed that you were able to confront your father while in possession of my small round catalyst. It seems my asking you, and your success, was in accordance with the Fates' design, as well. The result is more amusing even than expected. Thus, thank you."
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(
	newInteractTextLines, "TrialUpgrade", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Chaos = { "Dusa", "ZagreusField" } }, { Chaos_ = "Dusa_1" },
	{ Chaos_ = "ModsNikkelMHadesBiomes_Portrait_Chaos_Default_01" }
)
