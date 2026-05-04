-- For Tisiphone stage transition
game.HeroData.FinalHitSlowParameters = {
	{ ScreenPreWait = 0.01, Fraction = 0.00001, LerpTime = 0 },
	{ ScreenPreWait = 0.6,  Fraction = 1.0,     LerpTime = 0.1 },
}

-- For Post-Ending run outros
mod.ModsNikkelMHadesBiomes_GameOutroData = {
	{
		Header = "Outro_PostEnding01",
		FadeOutWait = 21.6,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_PostEnding01" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Thus having once more gained the surface of his grim-faced father's realm beneath the earth, resourceful Zagreus makes his way toward the one-time abode of radiant Persephone.
			{ Cue = "/VO/Storyteller_0371", PreLineWait = 0.8, NoTarget = true },
			-- It is a journey of considerable distances, which he has already completed many times, and which has always ended in the same result. So... imagine he made it there with just time enough to water the crops and tidy up a bit, before...
			{ Cue = "/VO/Storyteller_0372", PreLineWait = 0.6, NoTarget = true },
		},
	},
	{
		Header = "Outro_PostEnding02",
		FadeOutWait = 7.2,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_PostEnding01" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_PostEnding02" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Once more, tenacious Zagreus achieves his lofty goal, and, just as every time before, except with some sort of new twist of Fate, perhaps, he goes a little distance, then he dies.
			{ Cue = "/VO/Storyteller_0385", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_PostEnding03",
		FadeOutWait = 7.0,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_PostEnding02" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_PostEnding03" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Having already seen the splendid cottage of Persephone sufficient times, the stubborn Underworld Prince nevertheless attempts to go there once again. Although, his memory of it shall have to do.
			{ Cue = "/VO/Storyteller_0386", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_PostEnding04",
		FadeOutWait = 4.2,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_PostEnding03" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_PostEnding04" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Reflecting on his victory, Prince Zagreus observes how death can take hold in so many different ways, at times quite slowly, and at other times --
			{ Cue = "/VO/Storyteller_0387", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Inescapable",
		FadeOutWait = 3.5,
		SubtitleColor = game.Color.NarratorVoice,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_PostEnding04" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Inescapable" },
			},
		},
		VoiceLines = {
			-- The master of this realm, Lord Hades, states that death is inescapable. There is considerable credence to his claim.
			{ Cue = "/VO/Storyteller_0218", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Prince",
		FadeOutWait = 1.5,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Inescapable" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Prince" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Imagine, if you will, the Underworld Prince soon meets one of his typical, ignoble deaths.
			{ Cue = "/VO/Storyteller_0182", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_RatherGood",
		FadeOutWait = 2.4,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Prince" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_RatherGood" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- The Underworld Prince is getting rather good at this. But let us say he perished anyhow.
			{ Cue = "/VO/Storyteller_0204", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Glorious",
		FadeOutWait = 8.5,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_RatherGood" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Glorious" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- There are a myriad of tales to be told, of both great deeds and of vainglorious defeats, and this has been a tale that falls somewhere in the middle, overall.
			{ Cue = "/VO/Storyteller_0280", PreLineWait = 0.8, NoTarget = true },
		},
	},
	-- end of initial linear series of 8 (18 clears)
	{
		Header = "Outro_Perfume",
		FadeOutWait = 9,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Perfume" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Having gained the surface once again, Prince Zagreus breaths deeply of the wildflowers, and the roses, and the like, among which one of them contains an allergen so intolerably potent, that it causes this:
			{ Cue = "/VO/Storyteller_0376", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Avalanche",
		FadeOutWait = 10,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Avalanche" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- As he journeys to his mother's cottage in the cold, loudly-speaking Zagreus calls out to hear the echo of his voice, the blast of sound causing a substantive amount of ice and snow to break off from a nearby mountaintop, and fall, and fall, and...
			{ Cue = "/VO/Storyteller_0377", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_WrongTurn",
		FadeOutWait = 9,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_WrongTurn" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- So complicated is the path to the well-hidden cottage of Persephone that surface-walking Zagreus on this particular occasion sadly zigs instead of zags, plummeting from off a precipice into most-familiar waters...
			{ Cue = "/VO/Storyteller_0378", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Cactus",
		FadeOutWait = 8.3,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Cactus" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Amid the wondrous ever-springing garden of Persephone, Prince Zagreus discovers a greenish plant of some sort, supple-skinned and covered all in spines, a bit too small to see, until it is too late...
			{ Cue = "/VO/Storyteller_0379", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Bear",
		FadeOutWait = 10.5,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Bear" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 20,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- The limitless variety of fauna dwelling on the surface brings to Zagreus no shortage of delight.
			{ Cue = "/VO/Storyteller_0380", PreLineWait = 0.8, NoTarget = true },
			-- Though, when he makes an effort to communicate with one, its eyes so full of calm intelligence, he learns that bears are not as gentle as they seem.
			{ Cue = "/VO/Storyteller_0410", PreLineWait = 0.3, NoTarget = true },
		},
	},
	{
		Header = "Outro_MountainGoat",
		FadeOutWait = 8.3,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_MountainGoat" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Horned creatures are familiar to Zagreus, having fought countless Satyrs and the like; but he discovers, this time, that not even Satyrs possess the sheer, ferocious power of a startled mountain-goat...
			{ Cue = "/VO/Storyteller_0382", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Snake",
		FadeOutWait = 12,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Snake" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Snakes and serpents rank amongst the creatures somewhat known to Zagreus, due to their presence in the Underworld.
			{ Cue = "/VO/Storyteller_0383", PreLineWait = 0.8, NoTarget = true },
			-- So it is with delight that he approaches one upon the surface, greeting it as a familiar friend. It greets him venomously back, using its fangs.
			{ Cue = "/VO/Storyteller_0384", PreLineWait = 0.6, NoTarget = true },
		},
	},
	{
		Header = "Outro_Spears",
		FadeOutWait = 2.75,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Spears" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 30,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Alas, the wisely-spoken Zagreus... stumbled upon a pit of deadly spears, perhaps?
			{ Cue = "/VO/Storyteller_0206", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Doom",
		FadeOutWait = 2.55,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Doom" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Prince Zagreus proceeded onward toward his certain doom, entirely too graphic to describe.
			{ Cue = "/VO/Storyteller_0209", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Horrifying",
		FadeOutWait = 2.55,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Horrifying" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Beyond this point lies such a horrifying fate that we had better speak no more of it for now.
			{ Cue = "/VO/Storyteller_0210", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Beetle",
		FadeOutWait = 4,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Beetle" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 35,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Just then, erm, how about a very small yet very deadly beetle landed upon Hydra-slaying Zagreus, ending his attempt?
			{ Cue = "/VO/Storyteller_0211", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Precipice",
		FadeOutWait = 3.5,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Precipice" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 30,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- The never-learning Zagreus then... carelessly fell off a precipice, or something, plunging him into the rapids of the Styx.
			{ Cue = "/VO/Storyteller_0212", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Variety",
		FadeOutWait = 3.5,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Variety" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Although there are innumerable ways for one to die, our danger-seeking Prince has come to know a sizable variety.
			{ Cue = "/VO/Storyteller_0216", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Clever",
		FadeOutWait = 5.2,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Clever" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- The clever-minded Prince again eluded certain death, up to a certain point, but then, predictably made one of his fatal mistakes, again.
			{ Cue = "/VO/Storyteller_0217", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Another",
		FadeOutWait = 3.5,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Another" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- The oft-impatient Zagreus appears to take repeated deaths in stride, and so, here comes another one for him.
			{ Cue = "/VO/Storyteller_0219", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Setbacks",
		FadeOutWait = 4.25,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Setbacks" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Having ventured successfully much farther than before, the surface-seeking Prince encounters setbacks far too hideous to be described.
			{ Cue = "/VO/Storyteller_0230", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Wall",
		FadeOutWait = 5.0,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Wall" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 30,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Just then, the carefree-running Underworld Prince runs headlong into a thick and deadly wall of stone, painted to look like the way out.
			{ Cue = "/VO/Storyteller_0236", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Fungus",
		FadeOutWait = 5.0,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Fungus" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 30,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Filled with such confidence, the Prince neglected to avoid, erm, stepping on a toxic strain of fungus, so rare you'd not have heard of it.
			{ Cue = "/VO/Storyteller_0238", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Dream",
		FadeOutWait = 7.75,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Dream" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 30,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Having somehow defeated grim Lord Hades in a thrilling fight, Prince Zagreus discovers... it was all a dream! A rather deadly nightmare, actually.
			{ Cue = "/VO/Storyteller_0263", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Confines",
		FadeOutWait = 6.25,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Confines" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Despite having transcended past the confines of the Underworld yet again, Prince Zagreus proves utterly unable to get past this point.
			{ Cue = "/VO/Storyteller_0264", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Change",
		FadeOutWait = 6.9,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Change" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Imagine that Prince Zagreus experiences some sort of joyous outcome, for a change, in contrast to the arbitrary and unfortunately painful death he shall experience... now.
			{ Cue = "/VO/Storyteller_0265", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Shiver",
		FadeOutWait = 7,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Shiver" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- After defeating his lord father, yet again, Prince Zagreus begins to shiver, and catch cold. And, as is well known, there sadly is no cure for such a thing.
			{ Cue = "/VO/Storyteller_0266", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Tool",
		FadeOutWait = 8.5,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Tool" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 30,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- As he explores the wonders of the world, Prince Zagreus discovers a quaint farm, in which he carelessly trespasses, stepping on a farming-tool, which swoops up and strikes him in the forehead, fatally.
			{ Cue = "/VO/Storyteller_0267", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Tale",
		FadeOutWait = 2.5,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Tale" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- One might suppose the Prince's tale most likely ends akin to other tales of the heroes of our time, like so:
			{ Cue = "/VO/Storyteller_0268", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Sure",
		FadeOutWait = 10.3,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Sure" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 30,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- The favor-doing Zagreus then walks into a chamber, black as night, but with a blood-red pool, and from it comes a voice which says: Would you mind diving in these waters, Prince? To which the Prince replies, Oh! Sure.
			{ Cue = "/VO/Storyteller_0276", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Chariot",
		FadeOutWait = 8.1,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Chariot" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Mere moments from his final victory, the Prince, in his great haste, ignored surveying each side of a rather busy crossing, where a swiftly-passing chariot collided with him, very forcefully.
			{ Cue = "/VO/Storyteller_0277", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Demises",
		FadeOutWait = 8.1,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Demises" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- The often-dying Prince, having achieved his purpose, then reflects upon his life and deeds, remembering his many past demises with such vivid clarity, that this occurs:
			{ Cue = "/VO/Storyteller_0278", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Peel",
		FadeOutWait = 9.6,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Peel" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 30,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- In his great hurry to explore the country-side, the hapless-footed Prince steps on the peel of a most-exotic sallow-colored fruit, and tumbles backward with such sudden, violent force that you-know-what occurs.
			{ Cue = "/VO/Storyteller_0279", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Ideas",
		FadeOutWait = 7.6,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Ideas" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 50,
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- He cannot kill me like this every time, believes the Underworld Prince. He shall eventually have no more ideas. But the Prince, as often is the case, is wrong.
			{ Cue = "/VO/Storyteller_0281", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Steam",
		FadeOutWait = 9.1,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Steam" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Just when his victory was all but certain, a fissure opens underneath the feet of the ill-fated Prince, and from it vents a cloud of superheated water-vapor; steam, as it is known! And probably you know what happens next.
			{ Cue = "/VO/Storyteller_0283", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Waiting",
		FadeOutWait = 11.75,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Waiting" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Upon the surface realm, the mortal-loving Prince would doubtless find that death still comes in a variety of different forms. One of the most common, yet perhaps least interesting, involves simply waiting... long... enough... until...
			{ Cue = "/VO/Storyteller_0302", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Mundanity",
		FadeOutWait = 10.75,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Mundanity" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Having achieved his goal, the Underworld Prince discovers that the mortal realm is utterly bereft of the life-threatening excitement to which he has grown accustomed, and the lack of anything of note to do, the sheer mundanity, results in this:
			{ Cue = "/VO/Storyteller_0338", PreLineWait = 0.8, NoTarget = true },
		},
	},
	{
		Header = "Outro_Bloodless",
		FadeOutWait = 5.65,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Bloodless" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- Then, erm, valiantly striding Zagreus was set upon by seven Bloodless Slam-Dancers, and slain. Or something of the sort.
			{ Cue = "/VO/Storyteller_0207", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		Header = "Outro_Joy",
		FadeOutWait = 5.3,
		SubtitleColor = game.Color.NarratorVoice,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros", "Outro_Glorious" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_Joy" },
			},
		},
		VoiceLines = {
			-- So joyfully did Zagreus attempt to gain the surface that, why, he just rose too quickly; and we know how that one goes, from Icarus' tale.
			{ Cue = "/VO/Storyteller_0239", PreLineWait = 1.0, NoTarget = true },
		},
	},
	{
		PlayOnce = true,
		Header = "Outro_StartingOver",
		FadeOutWait = 8.6,
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomes_PlayedRunOutros" },
				HasAll = { "Outro_PostEnding01", "Outro_PostEnding02", "Outro_PostEnding03", "Outro_PostEnding04", "Outro_Inescapable", "Outro_Prince", "Outro_RatherGood", "Outro_Glorious", "Outro_Perfume", "Outro_Avalanche", "Outro_WrongTurn", "Outro_Cactus", "Outro_Bear", "Outro_MountainGoat", "Outro_Snake", "Outro_Spears", "Outro_Doom", "Outro_Horrifying", "Outro_Beetle", "Outro_Precipice", "Outro_Variety", "Outro_Clever", "Outro_Another", "Outro_Setbacks", "Outro_Wall", "Outro_Fungus", "Outro_Dream", "Outro_Confines", "Outro_Change", "Outro_Shiver", "Outro_Tool", "Outro_Tale", "Outro_Sure", "Outro_Chariot", "Outro_Demises", "Outro_Peel", "Outro_Ideas", "Outro_Steam", "Outro_Waiting", "Outro_Mundanity", "Outro_Bloodless", "Outro_Joy" },
			},
			{
				PathFalse = { "GameState", "ModsNikkelMHadesBiomes_LastPlayedOutro", "Outro_StartingOver" },
			},
		},
		SubtitleColor = game.Color.NarratorVoice,
		VoiceLines = {
			-- ...I have no new tales left to tell. But do not think that you have won, Prince Zagreus... for any tale worth telling... is a tale worth telling again, and again, and again. Bye-bye!
			{ Cue = "/VO/Storyteller_0381", PreLineWait = 0.8, NoTarget = true },
		},
	},
}
-- Convert Storyteller_ to Modsnikkelmhadesbiomesstoryteller_
for _, outroData in pairs(mod.ModsNikkelMHadesBiomes_GameOutroData) do
	outroData.Name = outroData.Header
	for _, line in ipairs(outroData.VoiceLines) do
		if line.Cue:find("/VO/Storyteller_") then
			line.Cue = line.Cue:gsub("/VO/Storyteller_", "/VO/Modsnikkelmhadesbiomesstoryteller_")
		end
	end
end
