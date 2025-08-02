-- Selected NPC data from Hades, loaded alongside other enemies in EnemyData.lua
-- Make modifications in EnemyData.lua, not here!
mod.NPCData = mod.NPCData or {
	NPC_Sisyphus_01 = {
		InheritFrom = { "NPC_Neutral", "NPC_Giftable" },

		UseText = "UseTalkToSisyphus",
		AnimOffsetZ = 235,
		Portrait = "Portrait_Sisyphus_Default_01",
		Groups = { "NPCs" },

		ActivateRequirements =
		{
			RequiredMinCompletedRuns = 1,
		},

		MetaPointMin = 50,
		MetaPointMax = 60,

		MoneyMin = 101,
		MoneyMax = 115,

		InteractTextLineSets =
		{
			SisyphusFirstMeeting =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				InitialGiftableOffSource = true,
				GiftableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0129",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Hey, Prince Z. Must look like I'm slacking off with the old boulder, here, but... I was just getting back on my feet. The Fury Sisters don't often leave me be. Where'd they go, anyway? And... what are you doing here?"
				},
				{
					Cue = "/VO/ZagreusField_0522",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, you know, just out on a little stroll is all. Do me a favor, though, you see the Fury Sisters, let them know I was headed down the way I came from, will you...?"
				},
				{
					Cue = "/VO/Sisyphus_0130",
					Text =
					"Oh I'll let them know, all right, I hear you loud and clear, Your Highness. I'll just go about my business now, and you take care."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting02_A =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting" },
				-- for backward compatibility
				RequiredFalseTextLines = { "SisyphusMeeting02" },
				{
					Cue = "/VO/Sisyphus_0179",
					Text =
					"You know, Prince Z., I'd not expected to run into you again, not after all this time. Something amiss down in the House, or what? Not had much company of late, is all."
				},
				{
					Cue = "/VO/ZagreusField_4346",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, something's just about always amiss back home, sir. Figured it couldn't hurt to check up on things in Tartarus a bit more frequently."
				},
				{
					Cue = "/VO/Sisyphus_0180",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well I am grateful for it, I and the old boulder there, in turn. I'm used to going lengthy stretches on my own, but having visitors from time to time would do me well!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting02_A", "SisyphusFirstMeeting" },
				RequiredFalseTextLines = { "Ending01" },
				{
					Cue = "/VO/Sisyphus_0131",
					Text =
					"If I may be so bold, Your Highness, I was wondering... what brings you back around this way again? Same story as last time?"
				},
				{
					Cue = "/VO/ZagreusField_0465",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Look, I have to level with you, Sisyphus. I'm leaving the House. I've had quite enough. You understand, I'm sure. I'm going to the surface."
				},
				{
					Cue = "/VO/Sisyphus_0133",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"{#DialogueItalicFormat}Whew{#PreviousFormat}, that is quite an undertaking, Prince. If it wasn't you yourself proposing it, I'd like to call it madness, truth be told. Though you're just mad enough to pull it off! Well hey, I hope you make it. Good fortune out there!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting03 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting02", "SisyphusGift01" },
				RequiredFalseTextLines = { "Ending01" },
				{
					Cue = "/VO/Sisyphus_0134",
					Text = "Hey Prince how goes the old escape plan, any luck?"
				},
				{
					Cue = "/VO/ZagreusField_0143",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You know it's been all right, all things considered. Dying now and then, and it's been hard, but hey, what can you do."
				},
				{
					Cue = "/VO/Sisyphus_0135",
					Text =
					"Ah, well, keep your chin up. Me, why I quit trying to get out of here a while back, but, if I was a fire-stepping youngster like yourself, perhaps I would have stuck to it."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusMeeting03", "SisyphusGift03" },
				{
					Cue = "/VO/Sisyphus_0136",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Hey, Your Highness, anything the matter, or just passing through? Happy that we get to chat like this of late, of course."
				},
				{
					Cue = "/VO/ZagreusField_0466",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, don't take this the wrong way, but... why are you helping me? My father's stuck you here for an eternity of torment and even still, you greet me with a smile, time after time."
				},
				{
					Cue = "/VO/Sisyphus_0137",
					Text =
					"{#DialogueItalicFormat}Hah{#PreviousFormat}! Come now, Prince Z., that's just the way I am! Besides, you're not your father, thank the gods! You always seemed a decent lad to me, and if you're saying you want out of here, why, I suppose I can relate, is all."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting_AboutFury01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "A_Boss01",
				RequiredFalseRoomLastRun = "B_Intro",
				RequiredFalseTextLines = { "SisyphusMeeting05", "SisyphusMeeting_FuryVictorious01", "SisyphusMeeting_FuryDefeated02" },
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 1 },
				{
					Cue = "/VO/Sisyphus_0173",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"You know, Prince, it's been good not having to see those Fury Sisters quite as much lately. The main one, what's her name, she's on your case now, isn't she."
				},
				{
					Cue = "/VO/ZagreusField_0524",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"You mean Megaera. She's on my case all right. Under strict orders not to let me out of Tartarus. I guess that means you've got yourself a break! About damn time they gave one to you, sir."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting05 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "A_Boss01",
				RequiredMinTimesSeenRoom = { A_Boss01 = 4 },
				RequiredMaxTimesSeenRoom = { A_PostBoss01 = 18 },
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 1 },
				{
					Cue = "/VO/ZagreusField_0472",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Hey, quick question, Sisyphus, you seen the other Fury Sisters lately?"
				},
				{
					Cue = "/VO/Sisyphus_0143",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Not seen the other Fury Sisters in some time now that you mention it! Just Megaera, the kindly one, and she is quite a handful on her own. I'll keep an eye out for the other two!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			-- bouldy introduced
			SisyphusMeeting06 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift02" },
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 12 },
				-- for backward compatibility
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },
				{
					Cue = "/VO/ZagreusField_0473",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Sisyphus, how can you stand it, being here like this? You always seem in such good spirits, though."
				},
				{
					Cue = "/VO/Sisyphus_0148",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"You push old Bouldy here sufficient times, and you might get a different outlook on things, too. With the Furies all preoccupied and with my running into you from time to time, I'm positively doing great lately. I like to take what pleasures I can get!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting07 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting06", "SisyphusGift03" },
				{
					Cue = "/VO/Sisyphus_0149",
					PreLineAnim = "SisyphusElbowing",
					Text = "Look here, Bouldy, Prince Z. himself has come to visit us!"
				},
				{
					Cue = "/VO/ZagreusField_0474",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Does Bouldy really keep you company? Personally I would resent a giant boulder that keeps tumbling back down a hill after I push it all the way up there."
				},
				{
					Cue = "/VO/Sisyphus_0150",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, Bouldy's not so bad, I mean, he's a good listener, a good shoulder to lean on, doesn't wield a whip... I rightly can't complain! Good having company down here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutBouldy01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting07", },
				{
					Cue = "/VO/ZagreusField_2835",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"You know I was just thinking, sir... sometimes I am a little envious of you and Bouldy there. You seem to have things pretty figured out. I still grow frustrated with myself quite often and don't always know whom to turn to."
				},
				{
					Cue = "/VO/Sisyphus_0181",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, {#DialogueItalicFormat}hah{#PreviousFormat}! Well, I just think you're in a tough spot lately, Prince. But you'll get through! As for old Bouldy, why, by all means do not hesitate to lay your troubles on him if you like! Dumped all of mine on him a while back."
				},
				{
					Cue = "/VO/ZagreusField_2836",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "So I can just... walk up and talk to him, and chat? That's all it takes?"
				},
				{
					Cue = "/VO/Sisyphus_0182",
					PostLineThreadedFunctionName = "SetUpBouldyConversation",
					Text = "That's truly all it takes to make a friend sometimes, indeed, Highness. Now, here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutBouldy02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "BouldyFirstMeeting", },
				RequiredMinAnyTextLines = { TextLines = { "BouldyMiscMeeting01", "BouldyMiscMeeting02", "BouldyMiscMeeting03" }, Count = 2 },
				{
					Cue = "/VO/ZagreusField_2837",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I have to thank you, Sisyphus, not just for all the help you've given me time after time, but for encouraging me to have a chat with Bouldy there. I daresay I feel a little more at peace of late, and maybe it's thanks to him."
				},
				{
					Cue = "/VO/Sisyphus_0183",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"He's a good one, all right, isn't he? Though if you've come to such an understanding with old Bouldy there, why, it must mean you've done some growing on your own as well, I think."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutBouldy03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusAboutBouldy02" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusAboutBouldy02" }, Count = 3 },
				{
					Cue = "/VO/Sisyphus_0439",
					PreLineAnim = "SisyphusElbowing",
					Text = "Hey, Your Highness, good, old Bouldy there had several things he wanted to tell you."
				},
				{
					Cue = "",
					Speaker = "NPC_Bouldy_01",
					SpeakerLabelOffsetY = 18,
					Portrait = "Portrait_Bouldy_Default_01",
					Text = ".   .   .   ."
				},
				{
					Cue = "/VO/Sisyphus_0440",
					PreLineAnim = "SisyphusExplaining",
					Text = "Thank you for listening to him! With all that said, I think I've got something for you right here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutBouldy04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusAboutBouldy02" },
				RequiredMinAnyTextLines = { TextLines = GameData.BouldyRepeatableTextLines, Count = 10 },
				{
					Cue = "/VO/Sisyphus_0441",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Hey Prince, ah, so... you do know Bouldy's just a plain old rock with a few lines chiseled into him, resembling a face, don't you? Chiseled into {#DialogueItalicFormat}it{#PreviousFormat}, I mean. Just so you don't get the wrong idea..."
				},
				{
					Cue = "",
					Speaker = "NPC_Bouldy_01",
					SpeakerLabelOffsetY = 18,
					Portrait = "Portrait_Bouldy_Default_01",
					Text = ".   .   .   ."
				},
				{
					Cue = "/VO/ZagreusField_3897",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Emote = "PortraitEmoteFiredUp",
					Text =
					"Come now, sir, we both know full well Bouldy's much more than that. You really think I doubt the power of Bouldy after everything we've been through?"
				},
				{
					Cue = "/VO/Sisyphus_0442",
					PreLineAnim = "SisyphusElbowing",
					Emote = "PortraitEmoteCheerful",
					Text =
					"{#DialogueItalicFormat}Hahahaha{#PreviousFormat}, no. Was just a jest, there, at Bouldy's expense. Look at him! He gets so annoyed when I call him a plain old rock like that. But then he calls me an old lazy lump, and then we're even for a while."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusAboutAlecto01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusMeeting06", "Fury2FirstAppearance" },
				RequiredRoomLastRun = "A_Boss02",
				{
					Cue = "/VO/ZagreusField_2838",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You ever meet Alecto, Sisyphus? The Fury Megaera's nastier sister. We recently became acquainted, she and I."
				},
				{
					Cue = "/VO/Sisyphus_0184",
					Text =
					"Ah, fortunately I've not seen too much of her, myself, Prince Z. And based on everything that I have seen and heard, I'd like to keep it that way for a while! I hope she doesn't cause you too much trouble there."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutTisiphone01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusMeeting06", "Fury3FirstAppearance" },
				RequiredRoomLastRun = "A_Boss03",
				{
					Cue = "/VO/ZagreusField_2839",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, have you had run-ins with Tisiphone the Fury here before? She isn't much for conversation, I don't think."
				},
				{
					Cue = "/VO/Sisyphus_0185",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Tisiphone. Why, yes, I have, in fact, Prince Z. She's visited on multiple occasions, truth be told. So she is back, is she?"
				},
				{
					Cue = "/VO/ZagreusField_2840",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "She is. Although, I think she's back to deal with me. I'll have to keep her plenty busy just in case."
				},
				{
					Cue = "/VO/Sisyphus_0186",
					Text =
					"Appreciate it, Prince. Of all the Fury Sisters, she's the one I would least care to see. But if she does stop by, you know, that's how it goes."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusMeeting08 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting04", "SisyphusGift01" },
				RequiredFalseTextLines = { "SisyphusBackstory03", "OlympianReunionQuestComplete" },
				{
					Cue = "/VO/Sisyphus_0147",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Look, Prince, I don't hold grudges, you know that. Push this boulder long as I have, you move past the petty stuff. So, just want you to know, in case you make it out this time, it's been a real pleasure."
				},
				{
					Cue = "/VO/ZagreusField_0521",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Feeling's mutual, sir. Someday you'll have to tell me all about how you tricked Father. I might learn a thing or two."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting06", "SisyphusGift01" },
				RequiredAnyTextLines = { "Flashback_Mother_01", "CerberusStyxMeeting01" },
				RequiredFalseTextLines = { "Ending01" },
				-- RequiredRunsCleared = 0,
				{
					Cue = "/VO/Sisyphus_0151",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Say, tell me something, Prince, if you don't mind. How come you're so intent on getting out of here? I mean, what happens when you do?"
				},
				{
					Cue = "/VO/ZagreusField_0475",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, you ever lose somebody dear to you? There's someone out there whom I need to find. That's... all that I can say right now."
				},
				{
					Cue = "/VO/Sisyphus_0152",
					PreLineWait = 0.3,
					Text =
					"I get it, Highness, and I didn't mean to pry, it's just... I can't remember what it's like to want something so bad, you know? Whoever's out there, I hope you find them soon."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting06", "SisyphusGift04" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusMeeting06", "SisyphusGift04" }, Count = 4 },
				{
					Cue = "/VO/ZagreusField_0470",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Hey sir, I've always wondered, what were you like back when you were alive? Were you always this wise?"
				},
				{
					Cue = "/VO/Sisyphus_0141",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Might surprise you, Highness, I've a bit of royalty in me, myself. Not on your level, mind, but I was very much a king. Though I'll be honest, I... I wasn't much of a good man."
				},
				{
					Cue = "/VO/ZagreusField_0471",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Huh{#PreviousFormat}! I thought I sensed the royalty in you! Although, I can't imagine you as anything besides the gentleman I know you for, my friend."
				},
				{
					Cue = "/VO/Sisyphus_0142",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well that is awful kind of you to say. Though, I would like to think my punishment here wasn't without warrant. At least I've had a lot of time to think it through!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory03 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory02", "ThanatosFieldFirstMeeting", "SisyphusGift05" },
				{
					Cue = "/VO/ZagreusField_0467",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"{#DialogueItalicFormat}Erm{#PreviousFormat}, Sisyphus, you mind my asking what you did to warrant this particular arrangement you've got here? Pushing a boulder till the end of time and all. Never heard it in your own words."
				},
				{
					Cue = "/VO/Sisyphus_0138",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Well, it's a bit of a long story, Prince. My time had come, though I just wasn't ready, you might say. Your father thought he had me in his clutches, but then, {#DialogueItalicFormat}shoom{#PreviousFormat}! I gave him the slip. Your father's henchman, Thanatos, he'll back me up on that."
				},
				{
					Cue = "/VO/ZagreusField_0468",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "Outsmarted Thanatos, that's amazing... what happened then?"
				},
				{
					Cue = "/VO/Sisyphus_0139",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Turns out your father doesn't like us mortals cheating death. Eventually they found me, so, now I'm stuck here with my boulder friend. I push old Bouldy up the hill to the beat of the Furies' whips, then he tumbles down, and then we go again."
				},
				{
					Cue = "/VO/ZagreusField_0469",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"So then, you're stuck forever, no reprieve. That's terrible... wish there was something I could do to help."
				},
				{
					Cue = "/VO/Sisyphus_0140",
					Text =
					"You save those sympathies for someone else, Your Highness! I could be Prometheus, spending an eternity having my liver gobbled up, but instead I get to stay in shape, and have these chats with you. Now I'd better get back to it!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory04 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 20 },
				{
					Cue = "/VO/ZagreusField_2841",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, I've meant to ask, where are you getting all this stuff you give to me? You must be pretty well connected around here."
				},
				{
					Cue = "/VO/Sisyphus_0187",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, well, you know! I have acquaintances amongst the locals here, try to be neighborly with everyone is all. It's not just Bouldy and myself as you can see. Sometimes I come across things that'd be better off in other hands than mine."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory05 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory02", "SisyphusGift06" },
				{
					Cue = "/VO/ZagreusField_3892",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I have to tell you, Sisyphus. Sometimes I wish I knew more about your past. You must have been a great king."
				},
				{
					Cue = "/VO/Sisyphus_0431",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Well, {#DialogueItalicFormat}ah-hah{#PreviousFormat}, the thing is that I wasn't, Highness. And that's not modesty from me, all right? All behind me, now. And I'd appreciate it if we left it at that."
				},
				{
					Cue = "/VO/ZagreusField_3893",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"I hear you, sir. Though, whatever you did in your mortal days... you've since more than paid for it, I'm sure.... Wait, is that why you're still here, in Tartarus? Because you think you deserve this?"
				},
				{
					Cue = "/VO/Sisyphus_0432",
					Text =
					"It's more like... this is where I belong. Where my path has taken me, you know? Here in the Underworld, you can't entirely escape your past... and yet, it's like you get another life to live. With all the wisdom that you picked up along the way."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusBackstory06 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory02", "SisyphusGift06" },
				RequiredMinRunsCleared = 5,
				{
					Cue = "/VO/Sisyphus_0437",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"You know, Prince Z., you really have a look about you that you know exactly where you're going, as of late. I used to think you weren't near as comfortable in your own skin."
				},
				{
					Cue = "/VO/ZagreusField_3896",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Oh, you were right. I was never comfortable performing Father's routine Tartarus inspections. Though those responsibilities of mine didn't last long."
				},
				{
					Cue = "/VO/Sisyphus_0438",
					Text =
					"Nor did we have much opportunity to chat back then, but hey! You always struck me as a decent sort. Wasn't accustomed to your father's henchpeople greeting me with a smile."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusLiberationQuest_Beginning_01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory03", "SisyphusMeeting06", "SisyphusGift06", "BouldyFirstMeeting" },
				{
					Cue = "/VO/ZagreusField_2849",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, I know you tend to be in remarkably good spirits, all things considered, but there must be something I can do to help with your predicament, isn't there?"
				},
				{
					Cue = "/VO/Sisyphus_0199",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Oh, come now, Prince, do Bouldy and I look like we could use your charity? We're planning to stay put within this chamber for a while. It's hardly a predicament, I'd say."
				},
				{
					Cue = "/VO/ZagreusField_2850",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					Text =
					"But, what of the Furies and their torments and all that? They might be back and make all this more difficult for you."
				},
				{
					Cue = "/VO/Sisyphus_0200",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Ah, yes, the Fury Sisters, well. I wouldn't mind seeing them more infrequently now that you mention it, but either way! So don't you even worry about me. Now, here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusLiberationQuestComplete =
			{
				SuperPriority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredCosmetics = { "SisyphusQuestItem" },
				{
					Cue = "/VO/ZagreusField_2851",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I have good news, sir! I located the contract binding you, and bought it out. It's null and void. You're free to go!"
				},
				{
					Cue = "/VO/Sisyphus_0201",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh! Indeed, then, does this mean, Prince, then... the Fury Sisters, they won't come around as often anymore?"
				},
				{
					Cue = "/VO/ZagreusField_2852",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Not just that, Sisyphus! You can make your way someplace else, where other decent shades reside! You know, somewhere with fewer chains and torture devices and such?"
				},
				{
					Cue = "/VO/Sisyphus_0202",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"You're much too kind to this old soul, Prince Z. The thing is, this is home. For me and Bouldy, it is what it is. Though, knowing that the Furies won't be visiting with quite their former regularity, that is a load off. Heavier than Bouldy, there."
				},
				{
					Cue = "/VO/ZagreusField_2853",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text = "You mean you're really going to stay? Even though you don't have to?"
				},
				{
					Cue = "/VO/Sisyphus_0203",
					Text =
					"Is that so odd, Highness? Don't see myself lugging old Bouldy out of here, besides! And if I were to leave, why, we would not be having these exchanges now and then. I happen to enjoy them quite a bit! Now, here you go, and thank you, very much."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",

					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Delay = 2.5, Title = "MainSubPlotComplete", Text = "SisyphusQuestItem", TextRevealSound = "/Leftovers/Menu Sounds/TextReveal3", AnimationName = "LocationTextBG", AnimationOutName = "LocationTextBGOut" },
				},
			},

			SisyphusLiberationQuestAftermath01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusLiberationQuestComplete" },
				RequiredAnyTextLines = { "SisyphusGift08_A", "SisyphusGift08_B", "SisyphusGift08" },
				{
					Cue = "/VO/Sisyphus_0425",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Must say, Prince Z., the free life sure does have its perks down here! This place really isn't as bad as it's cracked up to be."
				},
				{
					Cue = "/VO/ZagreusField_4105",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Glad to hear it, sir. But you're still here... the same as ever. Is it really all that different from the way it always was?"
				},
				{
					Cue = "/VO/Sisyphus_0426",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well, it used to be I'd have to start heaving Bouldy there at any point, if the Fury Sisters decided to show up. But now? I just get to relax, chat a bit with the other shades, and give you one of these when you're in the area!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusLiberationQuestAftermath02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusLiberationQuestComplete" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusLiberationQuestAftermath01", "SisyphusLiberationQuestAftermath02", "SisyphusLiberationQuestAftermath03" }, Count = 3 },
				RequiredAnyTextLines = { "SisyphusGift08_A", "SisyphusGift08_B", "SisyphusGift08" },
				{
					Cue = "/VO/Sisyphus_0427",
					Text =
					"Ah, there you are, Prince! I was just thinking about how grateful I am that you got me out of that contract with your father. It's been a real weight off my shoulders, truth be told."
				},
				{
					Cue = "/VO/ZagreusField_3890",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You never seemed particularly concerned even before, sir. Must say you're very good at hiding your worries."
				},
				{
					Cue = "/VO/Sisyphus_0428",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"And I could say the same to you! Look, I know you were concerned for my wellbeing. Now you don't have to be. And I'll still be around to help you out. Good feeling, isn't it?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusLiberationQuestAftermath03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusLiberationQuestAftermath02" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusLiberationQuestAftermath01", "SisyphusLiberationQuestAftermath02", "SisyphusLiberationQuestAftermath03" }, Count = 3 },
				RequiredAnyTextLines = { "SisyphusGift08_A", "SisyphusGift08_B", "SisyphusGift08" },
				RequiredMinRunsCleared = 3,
				{
					Cue = "/VO/Sisyphus_0429",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"You must have seen everything there is to see here in your father's Underworld, haven't you, Prince? I figure that there isn't any place nicer than this!"
				},
				{
					Cue = "/VO/ZagreusField_3891",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh! Well, I suppose now that you're free, you could always see for yourself? It's pretty different as soon as you reach Asphodel. Don't you have someplace or somebody you'd like to see?"
				},
				{
					Cue = "/VO/Sisyphus_0430",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"I'll take what's coming to me right here, thank you very much. You're the wayfaring sort, but my wayfaring days are over. It's hard to explain, but... this is a much-needed fresh start for me."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusHighRelationship01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusLiberationQuestAftermath01", "SisyphusLiberationQuestAftermath02", "SisyphusLiberationQuestAftermath03" }, Count = 3 },
				{
					Cue = "/VO/Sisyphus_0435",
					Text = "I will have you know, Prince, that your visits here have become a very important part of my routine!"
				},
				{
					Cue = "/VO/ZagreusField_3895",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "And what routine is that, exactly, sir? "
				},
				{
					Cue = "/VO/Sisyphus_0436",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Why, the routine of looking forward, of course! I try to appreciate the moment as much as anybody, but you know? It's always nice having something to look forward to. So, see you next time, then?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusMeeting_FuryVictorious01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting" },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },
				ConsecutiveDeathsInRoom =
				{
					Name = "A_Boss01",
					Count = 2,
				},
				{
					Cue = "/VO/Sisyphus_0146",
					Text =
					"I heard straight from the source the Fury Megaera's been giving you a time, there, hasn't she. Trust me I know the feeling, so, I'm grateful that you're here and that she's not. You give her hell for me next time, won't you?"
				},
				{
					Cue = "/VO/ZagreusField_0919",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "Oh I'll get her for the both of us one of these days. Nights? Whenever."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting_FuryDefeated01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting" },
				RequiredAnyTextLines = { "MegaeraMeeting01", "MegaeraMeeting01_B", "MegaeraMeeting01_Alt", "MegaeraMeeting01_Alt_B" },
				RequiredRoomLastRun = "B_Intro",
				{
					Cue = "/VO/Sisyphus_0144",
					Text =
					"Hey Prince, I heard you showed that Fury Sister the what-for, is that the truth? Might explain why I've been left here to my own devices for a change."
				},
				{
					Cue = "/VO/ZagreusField_0523",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I don't think she'll be out of commission for very long. She'd best find you minding that boulder, though at least you managed to catch a break for now. Be seeing you, Sisyphus."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting_FuryDefeated02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "MegaeraMeeting02", "SisyphusFirstMeeting" },
				RequiredFalseTextLines = { "MegaeraGift07", "SisyphusLiberationQuestComplete" },
				{
					Cue = "/VO/Sisyphus_0145",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Now you be careful out there, Highness. The kindly Megaera is out for blood. She kept on groaning 'bout the last exchange between the two of you. You must have showed her good!"
				},
				{
					Cue = "/VO/ZagreusField_0525",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "I think I might have gotten lucky."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusMeeting_AboutMegAndThanatos01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "MegaeraGift06", "SisyphusGift03" },
				RequiredAnyTextLines = { "ThanatosGift07", "ThanatosGift07_A" },
				{
					Cue = "/VO/Sisyphus_0171",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Hey, Prince Z., I heard the strangest rumor, here's the thing, I'll give it to you straight. I have heard you've been consorting both with Megaera the Fury and with that old stiff, Thanatos, can you believe it?"
				},
				{
					Cue = "/VO/ZagreusField_0479",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, I don't know where you heard that, but... it's true. They're... they're just doing their jobs, and I... I know how it looks, but... you're my friend, as well, and I don't want you to forget that."
				},
				{
					Cue = "/VO/Sisyphus_0172",
					Text =
					"I... look, I do appreciate the sentiment, Your Highness, I'm just surprised. I thought we shared a common foe in them, is all. What can I say, I hope that someday I can see them how you see them."
				},
				{
					Cue = "/VO/ZagreusField_0480",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "Thank you for understanding, sir. Besides... maybe I can get them to cut you some slack."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMeeting_AboutMegAndThanatos02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredFalseTextLinesLastRun = { "SisyphusMeeting_AboutMegAndThanatos01" },
				RequiredTextLines = { "MegaeraGift10", "ThanatosGift10", "SisyphusMeeting_AboutMegAndThanatos01" },
				{
					Cue = "/VO/ZagreusField_2854",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, I have to be up front with you. The Fury Megaera and Thanatos... I know you're not exactly on the best of terms with either one of them. But they're both close to me. You won't hold it against me, sir, will you?"
				},
				{
					Cue = "/VO/Sisyphus_0204",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Look, Prince, it's not for me to judge you, or your friends. The Fury Sisters, Master Thanatos... we got off on the wrong foot, you could say. My fault, entirely. I'd sooner make sure that our correspondence here doesn't make those relationships more difficult."
				},
				{
					Cue = "/VO/ZagreusField_2855",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Don't even say that, sir. I think Meg and Than know me better than that by now. Well, thanks for understanding, as always."
				},
				{
					Cue = "/VO/Sisyphus_0205",
					Text =
					"Certainly, Highness. And who knows? Perhaps as you spend more time together, some of your finer qualities will rub off on those two!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutThanatosRelationship01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusBackstory03", "SisyphusGift03", "ThanatosGift05" },
				{
					Cue = "/VO/Sisyphus_0443",
					Text =
					"How goes it with old Master Thanatos of late, Prince Z.? Is he at least less stern with you than with the poor mortals he's sent to take in here?"
				},
				{
					Cue = "/VO/ZagreusField_3898",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, Thanatos is doing all right. Much like my father, I think he feels he has some sort of fearsome reputation to uphold. Or maybe he's perpetually stressed over his work. But he's been well lately."
				},
				{
					Cue = "/VO/Sisyphus_0444",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"That's good, I guess! Always appreciated that he ultimately took me in, rather than having to show up here through much more sudden, much more painful means. Didn't stop me from trying to avoid the trip, of course."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusRunProgress01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "D_Hub",
				RequiredKills = { Theseus = 3 },
				RequiredTextLines = { "SisyphusGift01" },
				{
					Cue = "/VO/Sisyphus_0445",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Word is you've caused quite the hubbub in Elysium, Prince Z.! Making the champion up there really work for it, I hear?"
				},
				{
					Cue = "/VO/ZagreusField_4106",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"You could say that, I guess! Apparently word gets around. That Theseus, though... he doesn't care for me one bit, let me tell you!"
				},
				{
					Cue = "/VO/Sisyphus_0446",
					PreLineAnim = "SisyphusElbowing",
					Text = "I bet he'd like you better if you were a regular pushover! Ah, well, he'll learn, I'm sure."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusRunCleared01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiresLastRunCleared = true,
				RequiredTextLines = { "SisyphusFirstMeeting", "PersephoneFirstMeeting" },
				RequiredFalseTextLines = { "SisyphusPostEnding01", "Ending01" },
				{
					Cue = "/VO/Sisyphus_0418",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Prince, you've been gone for quite a while, why... I heard-tell you made it all the way outside! And I believed it for a while there, yet here you are. What happened, might I ask?"
				},
				{
					Cue = "/VO/ZagreusField_2858",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"I made it out of here, indeed, sir. I always said that I was leaving, but... turns out there was good reason for me to come back. Not the least of which is visiting my friends from time to time."
				},
				{
					Cue = "/VO/Sisyphus_0419",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well, I am certainly delighted to hear that! So long as you achieved what you set out to do. But, what brings you back again this way? More than a social visit I presume."
				},
				{
					Cue = "/VO/ZagreusField_2859",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"You're right. I'm back because... I'm leaving once again. Something I have to do if I get up there, though I should be back before long either way, I guess."
				},
				{
					Cue = "/VO/Sisyphus_0420",
					Text =
					"Going to try and make it out of here again and again, is it? Well they say repetition is the key to mastery, Prince Z. Now here, I'll send you on your way."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusRunCleared02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "SisyphusRunCleared01", "PersephoneMeeting06" },
				{
					Cue = "/VO/Sisyphus_0469",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"So, how do you like the surface, hey, Prince Z.? Now that you've finally had a chance to see it for yourself. Not too bad, I hope?"
				},
				{
					Cue = "/VO/ZagreusField_4318",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"It takes some getting used to, that's for sure. I'm not sure I'll ever grow completely accustomed to it. Do you miss it, sir?"
				},
				{
					Cue = "/VO/Sisyphus_0470",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Oh, you know. I still have almost everything that matters, and the rest? It makes for precious memories I didn't have up there."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusPostEnding01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting", "Ending01" },
				{
					Cue = "/VO/Sisyphus_0471",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"So, all this time, Prince, when you were battling up to the surface, and all that... you were searching for {#DialogueItalicFormat}her{#PreviousFormat}, weren't you? The Queen?"
				},
				{
					Cue = "/VO/ZagreusField_4639",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I was. Although, between us, sir, it's important that you keep that one a secret, please. Did... you happen to meet her, ever?"
				},
				{
					Cue = "/VO/Sisyphus_0478",
					Text =
					"Well, just the one time, briefly, when your father decided to put me here. And, you have my word, of course. About the... surface stuff."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusPostEpilogue01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusFirstMeeting", "OlympianReunionQuestComplete", },
				{
					Cue = "/VO/Sisyphus_0423",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Prince Z., my understanding is the Queen herself is back, is that correct? Moreover, I have heard a truly fascinating rumor about her..."
				},
				{
					Cue = "/VO/ZagreusField_2861",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"That I'm her son...? It's true, sir. And she's back with us for now, indeed. I think we're all still getting used to it, but... it feels good, having her in my life."
				},
				{
					Cue = "/VO/Sisyphus_0424",
					Text =
					"That's wonderful to hear. I'd always heard good things about that one. No wonder such a quality runs in the family."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusPostEpilogue02 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusPostEpilogue01" },
				{
					Cue = "/VO/Sisyphus_0473",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Just one thing I don't understand, Prince Z., if you'll indulge me for a moment, here. If everything is all right for you at the House, then... why is it you're fighting to the surface, still?"
				},
				{
					Cue = "/VO/ZagreusField_4320",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"Oh, you know. Wouldn't want Father to get too comfortable thinking this place is foolproof. It has a terrifyingly ominous reputation to uphold! {#DialogueItalicFormat}There is no escape{#PreviousFormat}."
				},
				{
					Cue = "/VO/Sisyphus_0474",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Sure, that makes sense! Well, from a certain point of view. Escape over and over to prove it can't be done! I like that. Well, let's both of us keep at it, then!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusPostEpilogue03 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusPostEpilogue02", "SisyphusLiberationQuestComplete" },
				MinRunsSinceAnyTextLines = { TextLines = { "SisyphusPostEpilogue02" }, Count = 3 },
				{
					Cue = "/VO/Sisyphus_0475",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Not working yourself {#DialogueItalicFormat}too {#PreviousFormat}hard of late, are you, Prince Z.? Remembering to take some breaks from time to time, and all?"
				},
				{
					Cue = "/VO/ZagreusField_4321",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I think I'm managing, thanks, sir. Though, back when you pushed Bouldy rather than talked to him... I suppose you didn't have much of a choice, did you?"
				},
				{
					Cue = "/VO/Sisyphus_0476",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Well, it was work, you know? Even your Father has to work. Of course, I've since retired! But it seems you and he like to keep yourselves occupied. Whatever makes you feel content."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusAboutKeepsake01 =
			{
				-- Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTrait = "VanillaTrait",
				{
					Cue = "/VO/Sisyphus_0188",
					Text =
					"Say, that's my Shattered Shackle on your person, right, Prince Z.? I'd recognize that clunky thing from anywhere. It serving you all right?"
				},
				{
					Cue = "/VO/ZagreusField_2842",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Hey sir, certainly it's been most welcome having something from you with me at all times. Though has it always held this power? And... how did you remove it to begin with?"
				},
				{
					Cue = "/VO/Sisyphus_0189",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Bit of an odd story, that. Involved a well-timed accident with the old boulder there. Though, I'd best not get into it so that you're not accomplice to that little crime. Surely you understand?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutKeepsake02 =
			{
				-- Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusAboutKeepsake01" },
				RequiredTrait = "VanillaTrait",
				RequiresMaxKeepsake = true,
				{
					Cue = "/VO/Sisyphus_0190",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"My Shattered Shackle's practically like new, there, Prince! Minus the part where it's still broken, and all that. Nice work!"
				},
				{
					Cue = "/VO/ZagreusField_2843",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Thanks, sir. It's been of help through my repeated treks across this realm, all thanks to you. You sure you don't want it back?"
				},
				{
					Cue = "/VO/Sisyphus_0191",
					Emote = "PortraitEmoteFiredUp",
					Text =
					"{#DialogueItalicFormat}Hahahahah{#PreviousFormat}! Absolutely not, though truly I appreciate the sentiment. I'd rather have a look at the old boulder there than a symbol of the time I first got stuck here, when I wasn't doing quite as well."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusAboutAboutSingersReunionQuest01 =
			{
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "OrpheusWithEurydice01", "SisyphusGift03" },
				MinRunsSinceAnyTextLines = { TextLines = { "OrpheusWithEurydice01" }, Count = 3 },
				RequiredMinNPCInteractions = { NPC_Sisyphus_01 = 15 },
				{
					Cue = "/VO/Sisyphus_0433",
					Text =
					"Word is that the most beautiful music's been heard up in Asphodel, lately, Prince! From the sound of it, why... I think that has got to be Eurydice and Orpheus!"
				},
				{
					Cue = "/VO/ZagreusField_3894",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"You heard correctly, Sisyphus! Orpheus is reunited with his muse, at last. Or at least, he gets to visit on the regular, when he isn't busy at my father's house. So you've heard of them, have you?"
				},
				{
					Cue = "/VO/Sisyphus_0434",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, I've more than heard of them! I'm sure you know how Orpheus once ventured all the way down here, after Eurydice passed on. I'll never forget his song! Even the Fury Sisters gave me a break, they were so captivated by it, then. {#DialogueItalicFormat}Ah{#PreviousFormat}, good times. For me, at least!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			SisyphusAboutLegendary01 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTrait = "SisyphusAssistTrait",
				{
					Cue = "/VO/Sisyphus_0197",
					Text =
					"Prince Z., it seems you've brought my little Shady back to visit me! How very kind. And I can tell he's in good care of late."
				},
				{
					Cue = "/VO/ZagreusField_2848",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"He is, sir, and I'm grateful once again to have adopted him. You sure you don't want him back, though? Always seems like you could use a friend."
				},
				{
					Cue = "/VO/Sisyphus_0198",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"All due respect, Highness, but I've the best friend anyone can ask for to my right just there. And as for little Shady, he was more inclined than I to see the farthest reaches of the Underworld. Safe travels to you both!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusAboutLegendary02 =
			{
				Priority = true,
				PlayOnce = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusAboutLegendary01" },
				RequiredTrait = "SisyphusAssistTrait",
				{
					Cue = "/VO/ZagreusField_2856",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, sir? Have you any idea how Shady works? I'm able to just whisk both you and Bouldy out of here, and to my aid? It must be awfully disorienting."
				},
				{
					Cue = "/VO/Sisyphus_0411",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Well, Prince, I told you that we'd be with you in spirit, didn't I? It's not just Shady's power, I suppose, nor is it Bouldy's or my hidden strength. It's testament to our companionship, is all. You gods are capable of anything!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			MegaeraWithSisyphus01_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "B_Intro",
				RequiredTextLines = { "SisyphusMeeting04" },
				RequiredAnyTextLines = { "MegaeraMeeting01", "MegaeraMeeting01_B", "MegaeraMeeting01_Alt", "MegaeraMeeting01_Alt_B" },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete", "MegaeraGift10" },
				RequiredKills = { Harpy = 2 },
				{
					Cue = "/VO/ZagreusField_0477",
					Portrait = "Portrait_Zag_Serious_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "She's gone... You still in one piece, Sisyphus? Not hurt or anything?"
				},
				{
					Cue = "/VO/Sisyphus_0168",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh I'm just fine, thanks, Prince. That Fury Sister, she is quite a lass, I have to say, and very, very strong. Bet she could push old Bouldy here better than I!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			MegaeraWithSisyphus02_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "B_Intro",
				RequiredTextLines = { "SisyphusMeeting06", "MegaeraWithSisyphus01_FollowUp" },
				MinRunsSinceAnyTextLines = { TextLines = { "MegaeraWithSisyphus01_FollowUp" }, Count = 6 },
				RequiredKills = { Harpy = 10 },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },
				{
					Cue = "/VO/ZagreusField_0478",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "You've really never gotten Bouldy to the top before?"
				},
				{
					Cue = "/VO/Sisyphus_0170",
					Portrait = "Portrait_Sisyphus_Default_01",
					Speaker = "NPC_Sisyphus_01",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"Never got the boulder to the top, not even once. Always tumbles down right at the very end. Lost count after the nineteen thousandth time or so, but you know what? One of these days, I bet it's going to stick."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			MegaeraWithSisyphus03_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredRoomLastRun = "B_Intro",
				RequiredTextLines = { "SisyphusMeeting06", "MegaeraWithSisyphus02_FollowUp" },
				RequiredKills = { Harpy = 15 },
				MinRunsSinceAnyTextLines = { TextLines = { "MegaeraWithSisyphus01_FollowUp", "MegaeraWithSisyphus02_FollowUp" }, Count = 6 },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete" },
				{
					Cue = "/VO/ZagreusField_2832",
					Portrait = "Portrait_Zag_Defiant_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, did I just hear correctly that Megaera has vowed to leave you be for now? Both you and Bouldy there?"
				},
				{
					Cue = "/VO/Sisyphus_0175",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Why, I believe you heard just that, Your Highness! Seems the Fates are giving me a break. Although, the Fury Sister did declare that she'll be back to haunting me after she's through with you..."
				},
				{
					Cue = "/VO/ZagreusField_4107",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Well, I bet I can keep her busy for a while yet. I'll take it as a bit of good news, sir."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			ThanatosWithSisyphus01_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusMeeting05", "ThanatosFirstAppearance" },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete", "Ending01" },
				{
					Cue = "/VO/Sisyphus_0164",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Oh, I'm doing very well, thanks, Prince. I'm not afraid of him, I mean, what have I got to lose? Now here, I wanted you to have this."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			ThanatosWithSisyphus02_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredTextLines = { "ThanatosWithSisyphus01_FollowUp" },
				MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithSisyphus01_FollowUp" }, Count = 5 },
				RequiredFalseTextLines = { "SisyphusLiberationQuestComplete", "Ending01" },
				{
					Cue = "/VO/Sisyphus_0166",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Can you believe the nerve of that one, Prince? He's nothing but a blowhard, so, I simply tell him what he wants to hear! He can't stop me from helping you, besides. I'm dead already, what's he going to do?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			ThanatosWithSisyphus03_FollowUp =
			{
				PlayOnce = true,
				InitialGiftableOffSource = true,
				UseableOffSource = true,
				RequiredAnyTextLines = { "ThanatosWithSisyphus02_FollowUp", "SisyphusLiberationQuestComplete" },
				MinRunsSinceAnyTextLines = { TextLines = { "ThanatosWithSisyphus02_FollowUp", "SisyphusLiberationQuestComplete" }, Count = 5 },
				{
					Cue = "/VO/Sisyphus_0177",
					Text =
					"Prince Z.! Just missed your stern-faced colleague, feel that stillness hanging in the air? Sounds like he won't be checking up on me again anytime soon."
				},
				{
					Cue = "/VO/ZagreusField_2833",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Thanatos really isn't such a bad sort once you get to know him, sir. Though, I suppose you'll have to take my word for that."
				},
				{
					Cue = "/VO/Sisyphus_0178",
					Text =
					"Oh, I believe it, Highness. I should think that bringing death must be a lonely job. Perhaps he ought to try pushing a boulder sometime!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

		},

		RepeatableTextLineSets =
		{
			SisyphusChat01 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0002",
					PreLineAnim = "SisyphusExplaining",
					Text = "Good to see you in one piece, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat02 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0003",
					PreLineAnim = "SisyphusExplaining",
					Text = "Life treating you all right, I take it, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat03 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0004",
					Text = "Oh I'm hanging in there, thanks for asking, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat04 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0005",
					PreLineAnim = "SisyphusExplaining",
					Text = "You'll make it out of here, I've no doubt about it!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat05 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0006",
					PreLineAnim = "SisyphusExplaining",
					Text = "Nice of you to drop in for a bit!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat06 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0007",
					Text = "You are a sight for sore eyes, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat07 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0008",
					PreLineAnim = "SisyphusExplaining",
					Text = "Now you be careful out there, won't you, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat08 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0009",
					PreLineAnim = "SisyphusExplaining",
					Text = "You give them hell for me, all right, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat09 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0010",
					PreLineAnim = "SisyphusExplaining",
					Text = "Go get them for me, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat10 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0011",
					Text = "Got just the thing for you here, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat11 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0012",
					Text = "It's always good to see you, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat12 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0013",
					PreLineAnim = "SisyphusExplaining",
					Text = "You keep your chin up, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat13 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0014",
					Text = "Keep fighting the good fight, there, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat14 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0015",
					Text = "Hey you take care, you hear me, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat15 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0016",
					PreLineAnim = "SisyphusExplaining",
					Text = "Let's both of us keep going, that a deal?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat16 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0017",
					Text = "It's good of you to visit me like this!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat17 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0018",
					PreLineAnim = "SisyphusExplaining",
					Text = "Hope everything's been well enough of late."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat18 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0019",
					Text = "You watch your step out there, all right, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat19 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0020",
					PreLineAnim = "SisyphusExplaining",
					Text = "Hullo Highness, you're looking well enough!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat20 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0021",
					Text = "Hey, Your Highness, how goes it, how is everything?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat21 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0022",
					PreLineAnim = "SisyphusExplaining",
					Text = "I have to say it's good to see a friendly face!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat22 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0023",
					Text = "Always a pleasure, Highness, you take care out there."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat23 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0024",
					Text = "Here's my best friend in all the Underworld, how goes it, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},

			},
			SisyphusChat24 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/Sisyphus_0025",
					PreLineAnim = "SisyphusExplaining",
					Text = "Glad you made it all this way, Prince Z."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat25 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0334",
					Text = "Think I've got just the thing for you right here, Highness!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat26 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0335",
					Text = "A brief hello from time to time does wonders, don't you think, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat27 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", "SisyphusMeeting06" },
				{
					Cue = "/VO/Sisyphus_0336",
					PreLineAnim = "SisyphusElbowing",
					Text = "Much as I like the company of Bouldy there, you're always welcome, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat28 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0337",
					Text = "Stop by whenever you're around these parts, all right, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat29 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0338",
					Text = "I know it isn't much, Highness, but I do hope this helps!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat30 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", "SisyphusMeeting06" },
				{
					Cue = "/VO/Sisyphus_0339",
					PreLineAnim = "SisyphusExplaining",
					Text = "Here's something courtesy of me and Bouldy, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat31 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0340",
					Text = "How about a little bit of help as you keep on your journey, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat32 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0341",
					Text = "Let's see if we might make your going slightly easier, there, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat33 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0342",
					Text = "Should have something that ought to come in handy for you, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat34 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0343",
					Text = "No need for these, so take one off my hands, won't you, Prince Z.?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat35 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", "SisyphusMeeting06" },
				{
					Cue = "/VO/Sisyphus_0344",
					PreLineAnim = "SisyphusElbowing",
					Text = "Bouldy and I have got the usual for you right here, Your Highness."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat36 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0345",
					Text = "Highness, please take one of these and go!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat37 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0351",
					Text = "All's well out here in Tartarus, Prince Z.! What will it be?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat38 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06", "SisyphusMeeting06" },
				{
					Cue = "/VO/Sisyphus_0352",
					PreLineAnim = "SisyphusElbowing",
					Text = "Bouldy and I got our usual selection here, Highness!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat39 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0456",
					PreLineAnim = "SisyphusExplaining",
					Text = "Don't let me keep you, Prince, I know you've plenty of important business here."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat40 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0457",
					Text = "Before you go, Prince Z., a little souvenir from your fine stay in Tartarus."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat41 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0458",
					PreLineAnim = "SisyphusElbowing",
					Text = "Don't do anything I wouldn't do out there, you hear me, Prince?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat42 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0459",
					RequiredMinHealthFraction = 0.9,
					PreLineAnim = "SisyphusExplaining",
					Text = "You're looking good and ready for whatever lies ahead up there, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat43 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0460",
					PreLineAnim = "SisyphusExplaining",
					Text = "You know approximately where to find me if you happen to be in the area again, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat44 =
			{
				UseableOffSource = true,
				{
					Cue = "/VO/Sisyphus_0461",
					PreLineAnim = "SisyphusExplaining",
					Text = "Everything's fine as ever here, Prince Z., so you go on ahead, and don't look back!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat45 =
			{
				UseableOffSource = true,
				RequiresLastRunNotCleared = true,
				{
					Cue = "/VO/Sisyphus_0462",
					PreLineAnim = "SisyphusExplaining",
					Text = "I have a feeling you are going to make it all the way topside this time, Highness!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusChat46 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift06" },
				{
					Cue = "/VO/Sisyphus_0032",
					PreLineAnim = "SisyphusExplaining",
					Text = "Need a little pick-me-up perhaps?"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

			-- max relationship
			SisyphusMaxChat01 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0346",
					PreLineAnim = "SisyphusElbowing",
					Text = "Bouldy and I will always be here in your time of need, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat02 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0347",
					PreLineAnim = "SisyphusElbowing",
					Text = "Bouldy says whatever we can do to help, we'll do it, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat03 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0348",
					Text = "In case words of encouragement are not enough, have one of these here, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat04 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0349",
					Text = "Let's get you on your way, Prince Z., and in good spirits, too!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat05 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0350",
					Text = "Don't you worry, Highness, we have got you covered here!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat06 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0353",
					PreLineAnim = "SisyphusElbowing",
					Text = "Told old Bouldy here you'd probably be back if only to say hi!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat07 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0354",
					PreLineAnim = "SisyphusElbowing",
					Text = "Hey Prince, Bouldy and I will not be needing these, but maybe they can help!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat08 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0355",
					Text = "Just do the best you can, if you don't mind me saying so, Prince Z.!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat09 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0453",
					PreLineAnim = "SisyphusElbowing",
					Text = "Speaking for myself and Bouldy there, we're always at your service, Prince."
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat10 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0454",
					Text = "You get all the way up to the top and do whatever it is needs getting done, Highness!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},
			SisyphusMaxChat11 =
			{
				UseableOffSource = true,
				RequiredTextLines = { "SisyphusGift09_A" },
				{
					Cue = "/VO/Sisyphus_0455",
					PreLineAnim = "SisyphusElbowing",
					Text = "I know Bouldy believes in you every bit as much as I do, Prince!"
				},
				{
					Text = "Sisyphus_OfferText01",
					Choices = PresetEventArgs.SisyphusBenefitChoices,
					PreLineFunctionName = "ShowUIForDecision",
				},
			},

		},

		GiftTextLineSets =
		{
			SisyphusGift01 =
			{
				PlayOnce = true,
				{
					Cue = "/VO/ZagreusHome_0120",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text = "Hey, sir, thought this might ease your burden for a while."
				},
				{
					Cue = "/VO/Sisyphus_0160",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Now hold a moment, Highness, I cannot accept something like this... not without giving back a little something in return, that is!"
				},
			},
			SisyphusGift02 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift01", },
				{
					Cue = "/VO/Sisyphus_0153",
					Emote = "PortraitEmoteSurprise",
					Text = "Oh, my, you're really giving that to me, there, Prince? But, I'm just, why would you...?"
				},
				{
					Cue = "/VO/ZagreusField_0526",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "You better believe it, sir. Now you take care, be seeing you around."
				},
			},
			SisyphusGift03 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift02", },
				{
					Cue = "/VO/Sisyphus_0154",
					Emote = "PortraitEmoteSparkly",
					Text = "Why, Prince, you being serious right now, is that for me?"
				},
				{
					Cue = "/VO/ZagreusField_0527",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkDenialStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkDenialReturnToIdle",
					PostLineAnimTarget = "Hero",
					Text =
					"You deserve better, Sisyphus! This really isn't much, but maybe it'll help you while away the days. Nights. Whatever time it is."
				},
			},
			SisyphusGift04 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift03", },
				{
					Cue = "/VO/Sisyphus_0155",
					Emote = "PortraitEmoteSparkly",
					Text = "Wow, Your Highness, you... you really shouldn't have. Thank you for not forgetting about me."
				},
				{
					Cue = "/VO/ZagreusField_0528",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "You're always a sight for sore eyes out here, Sisyphus. Thank you for always believing in me."
				},
			},
			SisyphusGift05 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift04", },
				{
					Cue = "/VO/Sisyphus_0156",
					Text =
					"I'm really very flattered, Highness! You didn't have to get me anything, I mean, your company's more than enough for me!"
				},
				{
					Cue = "/VO/ZagreusHome_0523",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "I figured you could do with something more than that this time around, good sir."
				},
			},
			SisyphusGift06 =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift05", },
				{
					Cue = "/VO/Sisyphus_0157",
					Emote = "PortraitEmoteSparkly",
					Text =
					"Oh, but this is just too much for me, Your Highness, thank you, really. I don't know how I can ever repay you."
				},
				{
					Cue = "/VO/ZagreusHome_0524",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text = "How about you keep on helping me not die as quickly as I might have otherwise, deal?"
				},
			},

			-- high relationship / locked gifts
			SisyphusGift07_A =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift06", },
				{
					Cue = "/VO/ZagreusField_2844",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Sisyphus, sir? You've helped me selflessly time after time without so much as asking anything in return. Wanted to say I'm very grateful, and thought you might like to try this. Here, for a special occasion!"
				},
				{
					Cue = "/VO/Sisyphus_0192",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Why, Prince, is this...? It is...! I've not so much as seen a bottle of it, much less sampled it, thank you so much! Although, with all respect, I cannot rightfully accept such a fine gift. Unless..."
				},
				{
					Cue = "/VO/ZagreusField_2845",
					Portrait = "Portrait_Zag_Empathetic_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusInteractionThoughtful",
					PreLineAnimTarget = "Hero",
					Text =
					"Unless...? Oh no, you're not making me take something in return, you know this was a gift not an exchange, sir, right? Wait, what is that?"
				},
				{
					Cue = "/VO/Sisyphus_0193",
					PreLineAnim = "SisyphusElbowing",
					Text =
					"This, Highness, is a little friend of mine kept tucked away in Bouldy's care. Wherever you'll be going next, he'll make a worthy traveling companion. And when he's with you, Bouldy and I... we'll be with you in spirit, too."
				},
			},
			-- if you haven't had ambrosia with others
			SisyphusGift08_A =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift07_A", },
				RequiredFalseTextLines = { "SisyphusGift08_B", "MegaeraGift10", "OlympianReunionQuestComplete" },
				EndVoiceLines =
				{
					PreLineWait = 0.7,
					UsePlayerSource = true,
					-- Yeah I hope so too.
					{ Cue = "/VO/ZagreusHome_0501" },
				},
				{
					Cue = "/VO/Sisyphus_0412",
					Emote = "PortraitEmoteSparkly",
					Text =
					"Prince, that vintage Ambrosia bottle that you gave me, my! That was the greatest thing I ever tried, I think! Even Bouldy enjoyed the stuff!"
				},
				{
					Cue = "/VO/ZagreusField_3902",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I thought you'd like it, sir. And so, I'm pleased to offer you another! Almost a shame we seldom get such imports from Olympus around here. I hope I can appreciate it for myself sometime. Once all this is over with, I think."
				},
				{
					Cue = "/VO/Sisyphus_0413",
					Emote = "PortraitEmoteSurprise",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"What? You mean that you've never touched the stuff yourself? You've much more self control than I have, there. Perhaps someday we'll have a chance to share some between us!"
				},
			},
			-- if you have had ambrosia with others
			SisyphusGift08_B =
			{
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift07_A" },
				RequiredAnyTextLines = { "MegaeraGift10", "OlympianReunionQuestComplete" },
				RequiredFalseTextLines = { "SisyphusGift08_A" },
				EndVoiceLines =
				{
					PreLineWait = 0.7,
					UsePlayerSource = true,
					-- Yeah I hope so too.
					{ Cue = "/VO/ZagreusHome_0501" },
				},
				{
					Cue = "/VO/Sisyphus_0412",
					Emote = "PortraitEmoteSparkly",
					Text =
					"Prince, that vintage Ambrosia bottle that you gave me, my! That was the greatest thing I ever tried, I think! Even Bouldy enjoyed the stuff!"
				},
				{
					Cue = "/VO/ZagreusField_3901",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"I thought you'd like it, sir. And so, I'm pleased to offer you another! Almost a shame we seldom get such imports from Olympus around here."
				},
				{
					Cue = "/VO/Sisyphus_0477",
					Emote = "PortraitEmoteSparkly",
					PreLineAnim = "SisyphusExplaining",
					Text =
					"Ah, look at what the Prince has brought for us, Bouldy! Perhaps someday we'll have a chance to share some between us!"
				},
			},
			SisyphusGift09_A =
			{
				PlayOnce = true,
				RequiredAnyTextLines = { "SisyphusGift08_A", "SisyphusGift08_B" },
				EndVoiceLines =
				{
					PreLineWait = 0.7,
					UsePlayerSource = true,
					-- You guys are great.
					{ Cue = "/VO/ZagreusField_2847" },
				},
				{
					Cue = "/VO/Sisyphus_0194",
					Text =
					"All this, for someone such as me. You know I'm down here for a reason, don't you, Prince? Not just because your father and good Thanatos don't care for me. Yet, from the very first, you showed me decency I'd not experienced since I was a king. Perhaps not even then."
				},
				{
					Cue = "/VO/ZagreusField_2846",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					PreLineAnim = "ZagreusTalkEmpathyStart",
					PreLineAnimTarget = "Hero",
					PostLineAnim = "ZagreusTalkEmpathy_Return",
					PostLineAnimTarget = "Hero",
					Text =
					"Whoever it was you used to be, sir, I believe you've changed. And I'm proud to say that you're my friend. And Bouldy there as well. It's odd for me to say, but I am glad you're here. I think I've learned a lot from you, about all this."
				},
				{
					Cue = "/VO/Sisyphus_0195",
					PostLineAnim = "SisyphusElbowing",
					Text =
					"Well, Your Highness, I am honored very much indeed, and having you amongst my list of friends makes it perhaps the greatest such a list a fellow such as I has ever had. Isn't that right, Bouldy?"
				},
				{
					Cue = "",
					Speaker = "NPC_Bouldy_01",
					SpeakerLabelOffsetY = 18,
					Portrait = "Portrait_Bouldy_Default_01",
					Emote = "PortraitEmoteSparkly",
					Text = ".   .   .   ."
				},
				{
					Cue = "/VO/Sisyphus_0196",
					PostLineThreadedFunctionName = "MaxedRelationshipPresentation",
					PostLineFunctionArgs = { Text = "NPC_SisyphusAndBouldy_01", Icon = "Keepsake_SisyphusSticker_Max" },
					Text = "Take it from me, Prince Z., Bouldy concurs."
				},
			},

			-- below: old conversations from before the Welcome to Hell update
			SisyphusGift07 =
			{
				Skip = true,
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift06" },
				{
					Cue = "/VO/Sisyphus_0158",
					Text =
					"Wait, really, this, this is for me, you mean it, Prince? I mean, I won't say no, I can't say no to such a thing, so, thank you! Thank you kindly."
				},
				{
					Cue = "/VO/ZagreusHome_0525",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "You're more than welcome, sir. For all you've done for me, it's the least I could do."
				},
			},
			SisyphusGift08 =
			{
				Skip = true,
				PlayOnce = true,
				RequiredTextLines = { "SisyphusGift07", },
				{
					Cue = "/VO/Sisyphus_0159",
					PreLineWait = 0.35,
					Text =
					"...I'm really rather speechless, Your Highness. I'm just a shade doing my time. I don't deserve your generosity."
				},
				{
					Cue = "/VO/ZagreusHome_0526",
					Portrait = "Portrait_Zag_Default_01",
					Speaker = "CharProtag",
					Text = "Come on, sir, what's a priceless bottle of the drink of the gods between friends?"
				},
			},
		},

		GiftGivenVoiceLines =
		{
			{
				BreakIfPlayed = true,
				PreLineWait = 1.1,
				PlayFromTarget = true,
				RequiredTextLines = { "SisyphusGift07_A" },

				-- Sir, is this a mint-condition Shady you just gave to me?! I'm so grateful. I will keep him safe!
				{ Cue = "/VO/ZagreusHome_1488" },
			},
			{
				BreakIfPlayed = true,
				PreLineWait = 1.0,
				PlayFromTarget = true,

				-- Thanks for that, sir.
				{ Cue = "/VO/ZagreusHome_0320" },
			},
		},

		CharacterInteractions =
		{
			Rescue =
			{
				VoiceLines =
				{
					{
						RandomRemaining = true,
						PreLineWait = 0.4,

						-- Sure thing!
						{ Cue = "/VO/Sisyphus_0038" },
						-- You got it.
						{ Cue = "/VO/Sisyphus_0039" },
						-- Say no more!
						{ Cue = "/VO/Sisyphus_0040" },
						-- Easy does it!
						{ Cue = "/VO/Sisyphus_0041" },
						-- Good choice!
						{ Cue = "/VO/Sisyphus_0042" },
						-- A fine selection there!
						{ Cue = "/VO/Sisyphus_0043" },
						-- It's all yours!
						{ Cue = "/VO/Sisyphus_0044" },
						-- Sure, here you go!
						{ Cue = "/VO/Sisyphus_0045" },
						-- Good idea!
						{ Cue = "/VO/Sisyphus_0046" },
						-- Makes sense to me!
						{ Cue = "/VO/Sisyphus_0047" },
						-- Most excellent!
						{ Cue = "/VO/Sisyphus_0048" },
						-- Not to worry!
						{ Cue = "/VO/Sisyphus_0049" },
						-- That I can do!
						{ Cue = "/VO/Sisyphus_0220" },
						-- Got just the thing!
						{ Cue = "/VO/Sisyphus_0221" },
						-- I got you covered!
						{ Cue = "/VO/Sisyphus_0036" },
						-- I got you covered, Prince!
						{ Cue = "/VO/Sisyphus_0222", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Certainly, Highness!
						{ Cue = "/VO/Sisyphus_0223" },
						-- Sure thing, Prince Z.!
						{ Cue = "/VO/Sisyphus_0224", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- My pleasure, Prince!
						{ Cue = "/VO/Sisyphus_0225", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- No worries whatsoever!
						{ Cue = "/VO/Sisyphus_0226" },
						-- Think I can do that, Prince!
						{ Cue = "/VO/Sisyphus_0227", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Got that right here, Prince Z.!
						{ Cue = "/VO/Sisyphus_0228", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Then here you go!
						{ Cue = "/VO/Sisyphus_0229" },
						-- Ah, certainly, Prince Z.!
						{ Cue = "/VO/Sisyphus_0230", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Here you are!
						{ Cue = "/VO/Sisyphus_0231" },
					},
					{
						BreakIfPlayed = true,
						RandomRemaining = true,
						SuccessiveChanceToPlayAll = 0.75,
						UsePlayerSource = true,

						-- Cheers, mate.
						{ Cue = "/VO/ZagreusField_0485" },
						-- Cheers, mate.
						{ Cue = "/VO/ZagreusField_4035", RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- Thank you, mate.
						{ Cue = "/VO/ZagreusField_0179", RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- All right!
						{ Cue = "/VO/ZagreusField_2813", RequiredFalsePlayedThisRoom = { "/VO/ZagreusField_2813" }, RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- Thanks!
						{ Cue = "/VO/ZagreusField_2959", RequiredFalsePlayedThisRoom = { "/VO/ZagreusField_2959" }, RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- A pleasure!
						{ Cue = "/VO/ZagreusField_4225", RequiredFalsePlayedThisRoom = { "/VO/ZagreusField_4225" }, RequiredPlayed = { "/VO/ZagreusField_0485" } },
						-- Ooh thank you!
						{ Cue = "/VO/ZagreusField_2515", RequiredPlayed = { "/VO/ZagreusField_0485" } },
					},
				},
			},
		},

		RepulseOnMeleeInvulnerableHit = 250,
		OnHitVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.45,
			PlayFromTarget = true,
			Cooldowns =
			{
				{ Name = "SisyphusAnyQuipSpeech", Time = 11 },
			},

			-- Uh, Prince?
			{ Cue = "/VO/Sisyphus_0064", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Nice try, there!
			{ Cue = "/VO/Sisyphus_0065" },
			-- No use in that.
			{ Cue = "/VO/Sisyphus_0066" },
			-- Already dead here, Prince.
			{ Cue = "/VO/Sisyphus_0067", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Don't bother, Prince.
			{ Cue = "/VO/Sisyphus_0068", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Come on, now.
			{ Cue = "/VO/Sisyphus_0069" },
			-- Oh come now.
			{ Cue = "/VO/Sisyphus_0070" },
			-- Why bother.
			{ Cue = "/VO/Sisyphus_0071" },
			-- Try all you like!
			{ Cue = "/VO/Sisyphus_0072" },
			-- Very funny, Prince.
			{ Cue = "/VO/Sisyphus_0073", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Oof, got me good there!
			{ Cue = "/VO/Sisyphus_0074" },
			-- Nope, can't feel a thing.
			{ Cue = "/VO/Sisyphus_0075" },
			-- That's it, let all out.
			{ Cue = "/VO/Sisyphus_0076" },
			-- Hah, good one, Prince!
			{ Cue = "/VO/Sisyphus_0232", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Augh, you got me, Highness!
			{ Cue = "/VO/Sisyphus_0233" },
			-- Oh, please, have mercy and all that!
			{ Cue = "/VO/Sisyphus_0234" },
			-- That your best shot, Prince Z.?
			{ Cue = "/VO/Sisyphus_0235", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Now don't get frustrated all right?
			{ Cue = "/VO/Sisyphus_0236" },
			-- You getting ready for the road ahead?
			{ Cue = "/VO/Sisyphus_0237" },
			-- Nice shot there, Prince!
			{ Cue = "/VO/Sisyphus_0238", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Augh, I'm hit!
			{ Cue = "/VO/Sisyphus_0239" },
			-- Wow you are strong Prince Z.!
			{ Cue = "/VO/Sisyphus_0240", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Whew, most impressive, Prince!
			{ Cue = "/VO/Sisyphus_0241", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
		},

		BouldyAttackReactionVoiceLines =
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.55,
			PlayFromTarget = true,
			RequiredTextLines = { "SisyphusFirstMeeting" },
			Cooldowns =
			{
				{ Name = "SisyphusAnyQuipSpeech", Time = 7 },
			},

			-- No use in that.
			{ Cue = "/VO/Sisyphus_0066", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0066" } },
			-- Don't bother, Prince.
			{ Cue = "/VO/Sisyphus_0068", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0068" },               Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Come on, now.
			{ Cue = "/VO/Sisyphus_0069", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0069" } },
			-- Oh come now.
			{ Cue = "/VO/Sisyphus_0070", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0070" } },
			-- Why bother.
			{ Cue = "/VO/Sisyphus_0071", RequiredFalsePlayedThisRoom = { "/VO/Sisyphus_0071" } },
			-- Very funny, Prince.
			{ Cue = "/VO/Sisyphus_0073", RequiredTextLines = { "SisyphusMeeting06" },                         Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Pick on somebody your own size, Prince!
			{ Cue = "/VO/Sisyphus_0254", RequiredTextLines = { "SisyphusGift03" },                            Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- That's one fight you aren't going to win!
			{ Cue = "/VO/Sisyphus_0255" },
			-- Takes more than that to budge old Bouldy, Prince!
			{ Cue = "/VO/Sisyphus_0256", RequiredTextLines = { "SisyphusMeeting06" },                         Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Sure is heavy, isn't he!
			{ Cue = "/VO/Sisyphus_0257", RequiredTextLines = { "SisyphusMeeting06" } },
			-- Bouldy can take whatever you dish out!
			{ Cue = "/VO/Sisyphus_0258", RequiredTextLines = { "SisyphusMeeting06" } },
			-- Now there's no need for that here, Prince.
			{ Cue = "/VO/Sisyphus_0259", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Try all you like, there, Prince!
			{ Cue = "/VO/Sisyphus_0260", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Hey that's my friend, Prince Z.
			{ Cue = "/VO/Sisyphus_0261", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- No hurting Bouldy, Prince.
			{ Cue = "/VO/Sisyphus_0262", RequiredTextLines = { "SisyphusMeeting06" },                         Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- That's one tough rock you're messing with.
			{ Cue = "/VO/Sisyphus_0263" },
			-- Don't hurt yourself, all right?
			{ Cue = "/VO/Sisyphus_0264" },
			-- Come now, Highness!
			{ Cue = "/VO/Sisyphus_0265" },
			-- Why, your Highness?
			{ Cue = "/VO/Sisyphus_0266" },
			-- Oh what did Bouldy ever do to you?
			{ Cue = "/VO/Sisyphus_0267", RequiredTextLines = { "SisyphusMeeting06" } },
		},
	},
}
