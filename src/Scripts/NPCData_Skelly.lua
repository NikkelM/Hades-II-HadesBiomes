-- Adds the modded Crossroads dialogues for Skelly, unlocked alongside the Hades statues in DeathLoopData

game.EnemyData.NPC_Skelly_01.InteractTextLineSets = game.EnemyData.NPC_Skelly_01.InteractTextLineSets or {}

local newModdedInteractTextLines = {
	{
		Name = "ModsNikkelMHadesBiomes_HadesStatueIntro01",
		-- Insert after the last vanilla trophy quest voiceline so they always play first
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "SkellyAboutTrophyQuest03",
		},
		PlayOnce = true,
		UseableOffSource = true,
		StatusAnimation = "ModsNikkelMHadesBiomes_StatusIconWantsToTalkImportant_Skelly",
		GameStateRequirements = {
			-- Vanilla trophy quest must already be unlocked
			{
				PathTrue = { "GameState", "TextLinesRecord", "SkellyAboutTrophyQuest01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 3,
			},
		},
		{
			Cue = "/VO/Skelly_0178",
			PreLineAnim = "Skelly_Explaining",
			Text =
			"I'll level with you, pal. You have impressed somebody well above my pay grade here, and so... they have a little proposition for you, you listening?"
		},
		{
			Cue = "/VO/ZagreusHome_1054",
			Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Defiant_01",
			Speaker = "CharProtag",
			UsePlayerSource = true,
			PreLineAnim = "MelTalkExplaining01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			Text =
			"Let me guess... they want me to fight all the way through the Underworld, having used the Pact of Punishment over there to make the going even more treacherous than it already is, and if I succeed, they'll reward me with some sort of useless trinket?"
		},
		{
			Cue = "/VO/Skelly_0179",
			PreLineAnim = "Skelly_Babbling",
			Text =
			"Wrong! We're talking something really big, here, pal, you see that thing back there? Trinket. Come on, what are you, scared?"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_HadesStatueUnveil01",
		-- Insert after the last vanilla trophy quest voiceline so they always play first
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_HadesStatueIntro01",
		},
		PlayOnce = true,
		UseableOffSource = true,
		StatusAnimation = "ModsNikkelMHadesBiomes_StatusIconWantsToTalkImportant_Skelly",
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueIntro01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				-- Threshold value must match game.ScreenData.Shrine.ModsNikkelMHadesBiomesShrinePointThresholds[1]
				Value = 8,
			},
		},
		{
			Cue = "/VO/Skelly_0183",
			PreLineAnim = "Skelly_Explaining",
			PreLineFunctionName = _PLUGIN.guid .. "." .. "HadesStatueUnveilPresentation",
			PreLineFunctionArgs = {
				StatueIndex = 1,
				Subtitle = "ShrinePointStatue_Unlocked_Subtitle_01",
				AnimationNames = { "StatusIconOhBoy", "StatusIconEmbarrassed" },
				ReactionChance = 0.25,
				Delay = 1.01,
			},
			Text =
			"I just knew you had it in you, pal, enjoying your new prize? Pact of Punishment, {#DialogueItalicFormat}Shmact {#Prev}of Punishment, no problem, know what I mean? 'Course, that was just the easy one you got there, pretty sure I could've got that one, myself."
		},
		{
			Cue = "/VO/ZagreusHome_0678",
			Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Defiant_01",
			PreLineAnim = "MelTalkExplaining01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			Speaker = "CharProtag",
			UsePlayerSource = true,
			Text =
			"Wait, just so I understand. I literally toiled through hell and back, and my reward is just... a statue of you? Don't get me wrong, it's lovely, it's just... I don't know what I expected."
		},
		{
			Cue = "/VO/Skelly_0184",
			PreLineAnim = "Skelly_Babbling",
			Text =
			"Look, boyo, there was a little mix-up when we put in the request for that thing, see? I told 'em to make something that'll make me look good with my sources, and anyway that's how it all turned out. The other ones turned out much better, though, you'll see!"
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_HadesStatueUnveil02",
		-- Insert after the last vanilla trophy quest voiceline so they always play first
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_HadesStatueUnveil01",
		},
		PlayOnce = true,
		UseableOffSource = true,
		StatusAnimation = "ModsNikkelMHadesBiomes_StatusIconWantsToTalkImportant_Skelly",
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueUnveil01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				-- Threshold value must match game.ScreenData.Shrine.ModsNikkelMHadesBiomesShrinePointThresholds[2]
				Value = 16,
			},
		},
		{
			Cue = "/VO/ZagreusHome_0681",
			Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Defiant_01",
			Speaker = "CharProtag",
			PreLineAnim = "MelTalkBrooding01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			UsePlayerSource = true,
			PreLineFunctionName = _PLUGIN.guid .. "." .. "HadesStatueUnveilPresentation",
			PreLineFunctionArgs = {
				StatueIndex = 2,
				Subtitle = "ShrinePointStatue_Unlocked_Subtitle_02",
				AnimationNames = { "StatusIconOhBoy", "StatusIconFiredUp" },
				ReactionChance = 0.30,
				Delay = 1.01
			},
			Text =
			"Skelly, let me ask you something. Did you really commission three nearly-identical statues of yourself to goad me into using the Pact of Punishment?"
		},
		{
			Cue = "/VO/Skelly_0188",
			PreLineAnim = "Skelly_Babbling",
			Emote = "PortraitEmoteFiredUp",
			Text =
			"I am offended, pal! You haven't even seen the third one yet, so how can you insinuate a thing like that?! Maybe I was wrong about you. I thought you really were the one!"
		},
		{
			Cue = "/VO/ZagreusHome_0682",
			Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Defiant_01",
			Speaker = "CharProtag",
			UsePlayerSource = true,
			PreLineAnim = "MelTalkPensive01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			Text =
			"You're only saying that to get me to apologize and try and unlock the last of your three identical statues, aren't you."
		},
		{
			Cue = "/VO/Skelly_0189",
			PreLineAnim = "Skelly_Explaining",
			Emote = "PortraitEmoteFiredUp",
			Text =
			"{#DialogueItalicFormat}How could you{#Prev}--? I would return those statues for a full refund right here and now, if I could move! And if there was a refund policy on them."
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_HadesStatueUnveil03",
		-- Insert after the last vanilla trophy quest voiceline so they always play first
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_HadesStatueUnveil02",
		},
		PlayOnce = true,
		UseableOffSource = true,
		StatusAnimation = "ModsNikkelMHadesBiomes_StatusIconWantsToTalkImportant_Skelly",
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueUnveil02" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				-- Threshold value must match game.ScreenData.Shrine.ModsNikkelMHadesBiomesShrinePointThresholds[3]
				Value = 32,
			},
		},
		{
			Cue = "/VO/Skelly_0193",
			PreLineAnim = "Skelly_Babbling",
			PreLineFunctionName = _PLUGIN.guid .. "." .. "HadesStatueUnveilPresentation",
			PreLineFunctionArgs = {
				StatueIndex = 3,
				Subtitle = "ShrinePointStatue_Unlocked_Subtitle_03",
				AnimationNames = { "StatusIconFiredUp", "StatusIconFear", "StatusIconEmbarrassed" },
				ReactionChance = 0.35,
				Delay = 1.01
			},
			Text =
			"Look I'm sorry I messed up your statues, boyo. Really. When I saw them, I just kind of freaked. But then I figured there's no way he's going to see how they turned out, so, I just rolled with it, you know?"
		},
		{
			Cue = "/VO/ZagreusHome_0686",
			Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Default_01",
			PreLineAnim = "MelTalkPensive01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			Speaker = "CharProtag",
			UsePlayerSource = true,
			Text =
			"You shouldn't have underestimated me, mate. But... I shouldn't have said such awful things about your statues. You must have really gone out of your way to get them here."
		},
		{
			Cue = "/VO/Skelly_0194",
			PreLineAnim = "Skelly_Explaining",
			Text =
			"Oh you better believe it, pal! So how about we call it even. We've been through a lot. Both of us! Really learned from this experience, and now, we share a deeper understanding, yeah?"
		},
	},
	-- Extra conversation for Goddess Mode
	{
		Name = "ModsNikkelMHadesBiomes_SkellyHintMeeting_EasyMode01",
		-- Insert after the last vanilla trophy quest voiceline so they always play first
		ModsNikkelMHadesBiomes_TextLineMetadata = {
			InsertAfterNarrativeTextLine = "ModsNikkelMHadesBiomes_HadesStatueUnveil03",
		},
		PlayOnce = true,
		UseableOffSource = true,
		GameStateRequirements = {
			{
				PathFalse = { "GameState", "RoomsEntered", "A_PostBoss01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 4,
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "ModConfigLeafKeyHasValue",
				FunctionArgs = { LeafKey = "z_GoddessMode", ExpectedValue = false }
			},
			{
				PathFalse = { "GameState", "TraitsTaken", "ModsNikkelMHadesBiomesGoddessModeTrait" },
			},
		},
		StatusAnimation = "ModsNikkelMHadesBiomes_StatusIconWantsToTalkImportant_Skelly",
		EndVoiceLines = {
			PreLineWait = 0.35,
			ObjectType = "NPC_Skelly_01",
			-- Exactly, pal, that's it!
			{ Cue = "/VO/Skelly_0368" },
		},
		{
			Cue = "/VO/Skelly_0367",
			Emote = "PortraitEmoteFiredUp",
			Text =
			"If you're having a rough time out there, boyo, you just remember something: You're a {#DialogueItalicFormat}god{#Prev}, all right?! Way tougher than you think. They give you trouble, you just turn on {#DialogLegendaryFormat}Goddess Mode {#Prev}{#DialogueItalicFormat}(in the mod config){#Prev}, and you let 'em have it for me!"
		},
		{
			Cue = "/VO/ZagreusHome_1506",
			Portrait = "ModsNikkelMHadesBiomes_Portrait_Zag_Defiant_01",
			Speaker = "CharProtag",
			PreLineAnim = "MelTalkBrooding01",
			PreLineAnimTarget = "Hero",
			PostLineAnim = "MelinoeIdleWeaponless",
			PostLineAnimTarget = "Hero",
			PostLineThreadedFunctionName = "DisplayGodModeHint",
			Text =
			"You act as though this {#DialogueItalicFormat}Goddess Mode {#Prev}is some sort of lever I can simply switch at will if ever I wish to unlock my latent strength, there, mate."
		},
	},
}

mod.AddNarrativeDataEntries(newModdedInteractTextLines, "NPC_Skelly_01", "InteractTextLineSets", {
	TextLinePriorityType = "InteractTextLinePriorities",
	CueMappings = { Skelly_ = "Modsnikkelmhadesbiomesskelly_", ZagreusHome_ = "Modsnikkelmhadesbiomeszagreushome_" },
	-- These play in the Crossroads after any kind of run, not during a modded run
	SkipModdedRunRequirement = true,
	SkipUseRecordRequirement = true,
	IsWorldNpc = true,
})
