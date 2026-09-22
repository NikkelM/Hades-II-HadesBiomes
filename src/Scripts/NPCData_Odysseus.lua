local newModdedInteractTextLines = {
	-- #region High-Priority contextual reactions
	-- First conversation immediately after a modded run
	{
		Name = "ModsNikkelMHadesBiomes_OdysseusAboutModdedRoute01",
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "OdysseusFirstMeeting",
			CreateNewPriorityGroup = true,
		},
		PlayOnce = true,
		UseableOffSource = true,
		StatusAnimation = "ModsNikkelMHadesBiomes_StatusIconWantsToTalk",
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			-- Only right after a modded run, as it references using the Chaos Gate the previous night
			{
				PathTrue = { "CurrentRun", "ModsNikkelMHadesBiomesIsModdedRun" },
			},
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomescustomodysseus_0000",
			Text =
			"Got a most peculiar report, Goddess. Our eyes down in the Training Grounds say a Chaos Gate opened up there, that you went into it last night, and that you turned up by your own tent come morning. Care to explain?"
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomescustommelinoe_0004",
			UsePlayerSource = true,
			Portrait = "Portrait_Mel_Hesitant_01",
			PreLineAnim = "MelTalkPensive01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			Text =
			"I don't know if I {#Emph}can {#Prev}explain what happened, Odysseus. Usually these Gates let me visit Chaos in their domain. Last night however, I seemed to relive my brother's memories instead, as part as one of Chaos' experiments."
		},
		{
			Cue = "/VO/Modsnikkelmhadesbiomescustomodysseus_0001",
			Text =
			"Now {#Emph}that {#Prev}is the start of a tale worth hearing, I reckon. Do report back on what you find, Goddess... I'm sure we can put that knowledge to good use."
		},
		EndVoiceLines = {
			{
				PreLineWait = 0.35,
				UsePlayerSource = true,
				RequiredMinElapsedTime = 2,
				{ Cue = "/VO/Melinoe_0057", Text = "I will." },
			},
		},
	},
	-- #endregion
}
mod.AddNarrativeDataEntries(newModdedInteractTextLines, "NPC_Odysseus_01", "InteractTextLineSets", {
	TextLinePriorityType = "InteractTextLinePriorities",
	SkipModdedRunRequirement = true,
	SkipUseRecordRequirement = true,
	IsWorldNpc = true,
	DummyCues = { "/VO/Odysseus_0110" },
	DummyVoiceBank = "Odysseus",
})
