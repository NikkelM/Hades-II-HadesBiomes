local newPortedInteractTextLines = {
	-- #region Keepsake Questline
	{
		Name = "ChaosAboutStyx01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ChaosAboutSurfaceAppearance01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ChaosFirstPickUp" },
		RequiredRoomLastRun = "D_Intro",
		{
			Cue = "/VO/Chaos_0317",
			StartSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			UseEventEndSound = true,
			Text =
			"You have traveled recently beyond my senses, Son of Hades. I persist here only in the fathomless depths. I know what lies out there, having created it. But I know nothing of what it is like, right now. Do not tell me. I prefer to think of all the possibilities."
		},
	},
	{
		Name = "ChaosSurfaceQuest01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ChaosAboutStyx01",
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "ChaosAboutStyx01", "ChaosGift06", "LordHadesDefeated02" },
		RequiredRoomLastRun = "D_Intro",
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
	{
		Name = "ChaosSurfaceQuestComplete",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ChaosAboutStyx01",
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		RequiredTextLines = { "LordHadesChaosSurfaceQuestDefeat01" },
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
	newPortedInteractTextLines, "TrialUpgrade", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Chaos = { "Dusa", "ZagreusField" } }, { Chaos_ = "Dusa_1" },
	{ Chaos_ = "ModsNikkelMHadesBiomes_Portrait_Chaos_Default_01" }
)

-- TODO: HelpText/LootData entries for these for localizations
local newModdedInteractTextLines = {
	-- #region Intro conversations/New route explanation
	-- Should play during the ForcedReward of the first time dropping into RoomOpening
	{
		Name = "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ChaosFirstPickUp",
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsAny = { "RoomOpening" },
			},
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns01_0000",
			SkipContextArt = true,
			SecretMusic = "/Music/ChaosTheme_MC",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			Text =
			"Welcome, Spawn of Hades, to the place you call Tartarus. I conclude that you have entered the gateway I opened for you in the place between the realms, where the Unseen reside? Respond."
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Melinoe_ChaosAboutNightmareRuns01_0000",
			UsePlayerSource = true,
			PostLineRemoveContextArt = true,
			SecretMusic = "/Music/ChaosTheme_MC",
			SecretMusicMutedStems = { "ChaosBass" },
			PreLineAnim = "MelTalkPensive01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			Text =
			"Almighty Chaos, indeed I have traveled through the portal you opened within the Crossroads. How is it possible I am here? This Tartarus, it feels familiar, but... different."
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns01_0001",
			SkipContextArt = true,
			SecretMusic = "/Music/ChaosTheme_MC",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosBoonChange",
			Text =
			"I have altered your perception of reality for this night, aided by your own ability to peer through the veil of dreams and time. Your brother's journey becomes your own. Take my mark, and find me again."
		},
	},
	-- Second meeting, hasn't met Megaera yet/not experienced Zagreus' voicelines
	{
		Name = "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns02A",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns01",
			CreateNewPriorityGroup = true,
		},
		GameStateRequirements = {
			{
				PathFalse = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns02B" },
			},
			{
				PathFalse = { "GameState", "RoomsEntered", "A_PreBoss01" },
			},
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02A_0000",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			Text =
			"The place in which you find yourself this night, it elicits discomfort in you, does it not? Respond."
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Melinoe_ChaosAboutNightmareRuns02A_0000",
			UsePlayerSource = true,
			SecretMusicMutedStems = { "ChaosBass" },
			PreLineAnim = "MelTalkPensive01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			Text =
			"It does, Almighty Chaos. Before, you mentioned that you set me on my brother's path, yet I do not know what I am looking for in this altered version of Tartarus."
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02A_0001",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosBoonChange",
			Text =
			"Your brother once sought to escape from your father's house. I have set you upon that same path within this {$Keywords.ModsNikkelMHadesBiomesModdedRoute}. In your own time, you will find to understand your brother's motivations more deeply."
		},
	},
	-- Second meeting, has met Megaera/experienced Zagreus' voicelines
	{
		Name = "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns02B",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns02A",
		},
		GameStateRequirements = {
			{
				PathFalse = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns02A" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "A_PreBoss01" },
			},
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02A_0000",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			Text =
			"The place in which you find yourself this night, it elicits discomfort in you, does it not? Respond."
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Melinoe_ChaosAboutNightmareRuns02B_0000",
			UsePlayerSource = true,
			SecretMusicMutedStems = { "ChaosBass" },
			PreLineAnim = "MelTalkPensive01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			Text =
			"It does, Almighty Chaos. Another night, I encountered the Fury Megaera, and I recalled one of my brother's interactions with her. Were these memories, or imagination?"
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02B_0000",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosBoonChange",
			Text =
			"Your brother once sought to escape from your father's house. I have set you upon that same path within this {$Keywords.ModsNikkelMHadesBiomesModdedRoute}. All that you recall has happened, in this reality or another."
		},
	},
	-- Had not met Megaera for the second meeting, but has now
	{
		Name = "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns02C",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns02A",
		},
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns02A" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "A_PreBoss01" },
			},
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02C_0000",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			Text =
			"Since our last interaction, you have learned more about what links you to your brother in this realm, have you not? Respond."
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Melinoe_ChaosAboutNightmareRuns02C_0000",
			UsePlayerSource = true,
			SecretMusicMutedStems = { "ChaosBass" },
			PreLineAnim = "MelTalkPensive01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			Text =
			"Another night, I encountered the Fury Megaera, and I recalled one of my brother's interactions with her. Were these memories, or imagination?"
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02C_0001",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosBoonChange",
			Text =
			"All that you recall has happened, in this reality or another. Continue seeking understanding of your brother's path, as I will observe your progress."
		},
	},
	-- #endregion
	-- #region Misc dialogues
	{
		Name = "ModsNikkelMHadesBiomes_ChaosAboutZagreusEscapeAttempts01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterTextLineGroupContaining = "ChaosAboutBounties01",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutZagreusEscapeAttempts01_0000",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosBoonChange",
			Text =
			"I have inferred from our previous interactions that you have taken an interest in your brother's history. I concluded that it would be quite amusing to let you walk the path he took when once he attempted to learn more about your shared past. This conclusion has proven correct."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ChaosAboutZagreusEscapeAttempts02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_ChaosAboutZagreusEscapeAttempts01",
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutZagreusEscapeAttempts02_0000",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			Text =
			"I remember the many times that your brother entered my realm during his quest; much in the same way that many of his attempts likened to each other, so do yours compare to his. Yet, none shall ever be the same, for each is unique in its own way. I often ponder the implications of this."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ChaosAboutOlympianAid01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_ChaosAboutZagreusEscapeAttempts01",
		},
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 5,
			}
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutOlympianAid01_0000",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			Text =
			"You will since have noticed that while you seem to be reliving your brother's memories, not all aspects of this {$Keywords.ModsNikkelMHadesBiomesModdedRoute} align with his experiences. Part of you is still bound to your own reality, and so is your connection to Olympus."
		},
	},
	-- #endregion
	-- #region Randomized Chaos Trials/Questline
	{
		Name = "ModsNikkelMHadesBiomes_ChaosAboutModdedRandomBounties01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			-- Ensure it has higher priority than the vanilla random-bounty voicelines, so it definitely plays before them if both are eligible
			InsertAfterNarrativeTextLine = "ChaosAboutBountyChaosIntro01",
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "ActiveBounty" },
				IsAny = mod.RandomizedChaosTrialBountyNames,
			},
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutModdedRandomBounties01_0000",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			Text =
			"Spawn of Hades, once again you have entered the realm of near-infinite possibilities, thus revealing a new facet of reality. Breaking you free from the usual confines of your Nightmares shall yield the most interesting results. Please proceed."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_ChaosAboutModdedRandomBounties02",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_ChaosAboutModdedRandomBounties01",
		},
		PlayOnce = true,
		PreEventFunctionName = "ChaosInteractPresentation",
		PreEventFunctionArgs = { PickupWait = 1.0, },
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "ActiveBounty" },
				IsAny = mod.RandomizedChaosTrialBountyNames,
			},
			{
				Path = { "GameState", "TextLinesRecord" },
				HasAny = { "ModsNikkelMHadesBiomes_ChaosAboutNightmareRuns01" }
			}
		},
		{
			Cue = "/VO/ModsNikkelMHadesBiomes_Chaos_ChaosAboutModdedRandomBounties02_0000",
			SecretMusicActiveStems = { "ChaosBass" },
			PreContentSound = "/SFX/Menu Sounds/ChaosMiscSFX",
			Text =
			"Your own abilities allow you to alter the events you perceive as memories of your brother's past. Peering into these altered realities through the Pitch-Black Stone further grants me the ability to explore possibilities even further removed from what has been."
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(
	newModdedInteractTextLines, "TrialUpgrade", "InteractTextLineSets", "InteractTextLinePriorities",
	{ Chaos = { "Dusa", "ZagreusField" } }, { Chaos_ = "Dusa_1" },
	{ ModsNikkelMHadesBiomes_Chaos_ = "ModsNikkelMHadesBiomes_Portrait_Chaos_Default_01" }
)
