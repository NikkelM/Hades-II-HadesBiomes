-- Contains some of the GlobalVoiceLines from Hades AudioData.lua
mod.GlobalVoiceLines = mod.GlobalVoiceLines or {
	-- #region Hades
	-- HadesDeathTauntVoiceLines = {
	-- 	RandomRemaining = true,
	-- 	BreakIfPlayed = true,
	-- 	PreLineWait = 1.95,
	-- 	NoTarget = true,

	-- 	-- What did I tell you?
	-- 	{ Cue = "/VO/Hades_0259" },
	-- 	-- What did I tell you.
	-- 	{ Cue = "/VO/Hades_0260" },
	-- 	-- What did you expect?
	-- 	{ Cue = "/VO/Hades_0261" },
	-- 	-- What did you expect.
	-- 	{ Cue = "/VO/Hades_0262" },
	-- 	-- Surely you could have avoided that.
	-- 	{ Cue = "/VO/Hades_0263" },
	-- 	-- That was inevitable.
	-- 	{ Cue = "/VO/Hades_0264" },
	-- 	-- I'll see you back at home.
	-- 	{ Cue = "/VO/Hades_0265" },
	-- 	-- You are a weakling, boy.
	-- 	-- { Cue = "/VO/Hades_0266" },
	-- 	-- Was that truly your best?
	-- 	{ Cue = "/VO/Hades_0267" },
	-- 	-- Die, like a mere mortal.
	-- 	{ Cue = "/VO/Hades_0268" },
	-- 	-- Oh, that was it?
	-- 	{ Cue = "/VO/Hades_0269" },
	-- 	-- <Laughter>
	-- 	{ Cue = "/VO/Hades_0270" },
	-- 	-- <Laughter>
	-- 	{ Cue = "/VO/Hades_0271" },
	-- 	-- <Laughter>
	-- 	{ Cue = "/VO/Hades_0272" },
	-- 	-- A very tragic end.
	-- 	{ Cue = "/VO/Hades_0329" },
	-- 	-- Your time is up, boy.
	-- 	-- { Cue = "/VO/Hades_0330" },
	-- 	-- So much for that attempt.
	-- 	{ Cue = "/VO/Hades_0331" },
	-- 	-- Whatever happened there?
	-- 	{ Cue = "/VO/Hades_0332" },
	-- 	-- You don't have what it takes. Nobody does.
	-- 	{ Cue = "/VO/Hades_0333" },
	-- 	-- A tragic end fit for a poet's verse.
	-- 	{ Cue = "/VO/Hades_0334" },
	-- 	-- How many deaths is that?
	-- 	{ Cue = "/VO/Hades_0335" },
	-- 	-- You never seem to learn.
	-- 	{ Cue = "/VO/Hades_0336" },
	-- 	-- What did I tell you?
	-- 	{ Cue = "/VO/Hades_0337" },
	-- },
	HadesPostBossVoiceLines = {
		Queue = "Interrupt",
		{
			RandomRemaining = true,
			PreLineWait = 1.35,
			NoTarget = true,
			SuccessiveChanceToPlay = 0.5,
			CooldownName = "HadesPostBossCooldown",
			CooldownTime = 30,

			-- A_PostBoss01 lines
			-- You wouldn't dare.
			{ Cue = "/VO/Intercom_0273", RequiredPlayed = { "/VO/Intercom_0274" }, RequiredFalseTextLines = { "Ending01" }, },
			-- How did you... grrr.
			{ Cue = "/VO/Intercom_0274", RequiredFalseTextLines = { "Ending01" }, },
			-- Go on and try.
			{ Cue = "/VO/Intercom_0275", RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- You're going nowhere, boy.
			-- { Cue = "/VO/Intercom_0276", RequiredPlayed = { "/VO/Intercom_0274" }, RequiredFalseTextLines = { "Ending01" }, },
			-- You won't be anything at all.
			{ Cue = "/VO/Intercom_0277", RequiredPlayed = { "/VO/Intercom_0274" }, RequiredPlayedThisRoom = { "/VO/ZagreusField_0891" },                                    RequiredFalseTextLines = { "Ending01" }, },
			-- You withstood the combined might of the Furies...
			{ Cue = "/VO/Intercom_0543", RequiredRoom = "A_PostBoss01",            RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 1 }, },
			-- At least the Fury Sisters are on better terms.
			{ Cue = "/VO/Intercom_0544", RequiredRoom = "A_PostBoss01",            RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 1 }, },
			-- Megaera failed again?
			{ Cue = "/VO/Intercom_0278", RequiredRoom = "A_PostBoss01",            RequiredKillsThisRun = { "Harpy" },                                                      ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 2, }, RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- You're not permitted to leave Tartarus...!
			{ Cue = "/VO/Intercom_0279", RequiredRoom = "A_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0274" },                                                RequiredFalseTextLines = { "Ending01" }, },
			-- It seems the Fury failed to do her job.
			{ Cue = "/VO/Intercom_0280", RequiredRoom = "A_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0274" },                                                RequiredFalseTextLines = { "Ending01" }, },
			-- Megaera seems to be having difficulties.
			{ Cue = "/VO/Intercom_0325", RequiredRoom = "A_PostBoss01",            RequiredKillsThisRun = { "Harpy" },                                                      ConsecutiveClearsOfRoom = { Name = "A_Boss01", Count = 3 }, },
			-- Go on to Asphodel, and die.
			{ Cue = "/VO/Intercom_0326", RequiredRoom = "A_PostBoss01",            RequiredRoomLastRun = "B_Intro",                                                         RequiredFalseTextLines = { "Ending01" }, },
			-- Did you enjoy this stint in Tartarus?
			{ Cue = "/VO/Intercom_0327", RequiredRoom = "A_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- Tartarus has proved unable to contain you.
			{ Cue = "/VO/Intercom_0328", RequiredRoom = "A_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0274" },                                                RequiredMinRunsCleared = 1 },
			-- Alecto failed...?!
			{ Cue = "/VO/Intercom_0361", RequiredRoom = "A_PostBoss01",            RequiredKillsThisRun = { "Harpy2" },                                                     RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- Alecto failed just as her sister did.
			{ Cue = "/VO/Intercom_0362", RequiredRoom = "A_PostBoss01",            RequiredKillsThisRun = { "Harpy2" },                                                     RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- Tisiphone has failed me, has she.
			{ Cue = "/VO/Intercom_0363", RequiredRoom = "A_PostBoss01",            RequiredKillsThisRun = { "Harpy3" },                                                     RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- Tisiphone, defeated...?!
			{ Cue = "/VO/Intercom_0364", RequiredRoom = "A_PostBoss01",            RequiredKillsThisRun = { "Harpy3" },                                                     RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- So much for the fearsome Furies.
			{ Cue = "/VO/Intercom_0365", RequiredRoom = "A_PostBoss01",            RequiredKills = { Harpy2 = 1, Harpy3 = 1 },                                              RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- I ought to lock you up in Tartarus.
			{ Cue = "/VO/Intercom_0590", RequiredRoom = "A_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0274" },                                                RequiredFalseTextLines = { "Ending01" }, },
			-- How many times...
			{ Cue = "/VO/Intercom_0591", RequiredRoom = "A_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0274" },                                                RequiredMinCompletedRuns = 25 },
			-- Enjoy the searing heat of Asphodel.
			{ Cue = "/VO/Intercom_0592", RequiredRoom = "A_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- Here's to a pleasant voyage up in Asphodel.
			{ Cue = "/VO/Intercom_0593", RequiredRoom = "A_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- Do bathe yourself in magma when you get to Asphodel.
			{ Cue = "/VO/Intercom_0594", RequiredRoom = "A_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0274" },                                                RequiredFalseTextLines = { "Ending01" }, },
			-- Suitably achieved, this time around.
			{ Cue = "/VO/Intercom_0994", RequiredRoom = "A_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- The Furies seem incapable of thwarting you.
			{ Cue = "/VO/Intercom_0995", RequiredRoom = "A_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- Your progress has been duly noted, boy.
			-- { Cue = "/VO/Intercom_0996", RequiredRoom = "A_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- Is Tartarus some sort of joke to you?
			{ Cue = "/VO/Intercom_0997", RequiredRoom = "A_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- Those wretches of Tartarus cannot be relied upon.
			{ Cue = "/VO/Intercom_0998", RequiredRoom = "A_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- You'll have more difficulties up in Asphodel.
			{ Cue = "/VO/Intercom_0999", RequiredRoom = "A_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- Are you suitably warmed up for Asphodel?
			{ Cue = "/VO/Intercom_1000", RequiredRoom = "A_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- Let's see how you fare in warmer environs.
			{ Cue = "/VO/Intercom_1001", RequiredRoom = "A_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- Alecto's performance has been lacking as of late.
			{ Cue = "/VO/Intercom_1002", RequiredRoom = "A_PostBoss01",            RequiredKillsThisRun = { "Harpy2" },                                                     RequiredTextLines = { "Ending01" } },
			-- That Tisiphone has met her match with you.
			{ Cue = "/VO/Intercom_1003", RequiredRoom = "A_PostBoss01",            RequiredKillsThisRun = { "Harpy3" },                                                     RequiredTextLines = { "Ending01" } },
			-- Megaera had better not be going easy on you.
			{ Cue = "/VO/Intercom_1004", RequiredRoom = "A_PostBoss01",            RequiredKillsThisRun = { "Harpy" },                                                      RequiredTextLines = { "Ending01" } },
			-- Hrm, already made it out of Tartarus...
			{ Cue = "/VO/Intercom_1005", RequiredRoom = "A_PostBoss01",            RequiredTextLines = { "Ending01" } },

			-- B_PostBoss01 lines
			-- You surpassed my Hydra.
			{ Cue = "/VO/Intercom_0380", RequiredRoom = "B_PostBoss01" },
			-- The Hydra fell to you again, did it.
			{ Cue = "/VO/Intercom_0381", RequiredRoom = "B_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0380" } },
			-- Where do you think you're going?
			{ Cue = "/VO/Intercom_0382", RequiredPlayed = { "/VO/Intercom_0274" }, RequiredFalseTextLines = { "Ending01" }, },
			-- No paradise awaits you, boy.
			-- { Cue = "/VO/Intercom_0383", RequiredRoom = "B_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- Tread lightly, boy.
			-- { Cue = "/VO/Intercom_0384", RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- You are testing my patience.
			{ Cue = "/VO/Intercom_0385", RequiredRoom = "B_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- Still there, are you?
			{ Cue = "/VO/Intercom_0386", RequiredRoom = "B_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- We'll have you back here soon enough I think.
			{ Cue = "/VO/Intercom_0387", RequiredRoom = "B_PostBoss01" },
			-- Go no further, boy. I'm warning you.
			-- { Cue = "/VO/Intercom_0388", RequiredRoom = "B_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- How could you, boy? That Hydra had a family!
			-- { Cue = "/VO/Intercom_0389", RequiredRoom = "B_PostBoss01",            RequiredPlayed = { "/VO/Intercom_0380" } },
			-- That victory of yours shall be short-lived.
			{ Cue = "/VO/Intercom_0390", RequiredRoom = "B_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- Oh, I didn't see you come in.
			{ Cue = "/VO/Intercom_0391", RequiredPlayed = { "/VO/Intercom_0274" }, },
			-- I trust you had a pleasant stay in Asphodel?
			{ Cue = "/VO/Intercom_0392", RequiredRoom = "B_PostBoss01" },
			-- You think you can just walk into Elysium, do you?
			{ Cue = "/VO/Intercom_0393", RequiredRoom = "B_PostBoss01",            RequiredSeenRooms = { "C_Intro" },                                                       RequiredFalseTextLines = { "Ending01" }, },
			-- Off to taint Elysium again?
			{ Cue = "/VO/Intercom_0595", RequiredRoom = "B_PostBoss01",            RequiredSeenRooms = { "C_Intro" },                                                       RequiredFalseTextLines = { "Ending01" }, },
			-- King Theseus is eager to see you again soon.
			{ Cue = "/VO/Intercom_0596", RequiredRoom = "B_PostBoss01",            RequiredSeenRooms = { "C_Boss01" } },
			-- Just as we were finishing cleaning up Elysium...
			{ Cue = "/VO/Intercom_0597", RequiredRoom = "B_PostBoss01",            RequiredSeenRooms = { "C_Boss01" } },
			-- They're already expecting you up in Elysium.
			{ Cue = "/VO/Intercom_0598", RequiredRoom = "B_PostBoss01",            RequiredSeenRooms = { "C_Boss01" } },
			-- Short work of the Hydra, then, I take it.
			{ Cue = "/VO/Intercom_1006", RequiredRoom = "B_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- Had enough heat for now, I presume?
			{ Cue = "/VO/Intercom_1007", RequiredRoom = "B_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- That blasted Hydra never takes my feedback...
			{ Cue = "/VO/Intercom_1008", RequiredRoom = "B_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- It seems you're off to cooler climates, then.
			{ Cue = "/VO/Intercom_1009", RequiredRoom = "B_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- The Bloodless failed to stop you once again...
			{ Cue = "/VO/Intercom_1010", RequiredRoom = "B_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- You crossed through all of Asphodel's defenses...
			{ Cue = "/VO/Intercom_1011", RequiredRoom = "B_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- Hrm, you crossed through Asphodel quite rapidly...
			{ Cue = "/VO/Intercom_1012", RequiredRoom = "B_PostBoss01",            RequiredTextLines = { "Ending01" } },
			-- Emerged from Asphodel intact, have you?
			{ Cue = "/VO/Intercom_1013", RequiredRoom = "B_PostBoss01",            RequiredTextLines = { "Ending01" } },

			-- C_PostBoss01 Lines
			-- So you withstood the finest of Elysium.
			{ Cue = "/VO/Intercom_0441", RequiredRoom = "C_PostBoss01" },
			-- King Theseus has fallen to the likes of you?
			{ Cue = "/VO/Intercom_0442", RequiredRoom = "C_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- Your struggles soon shall be in vain.
			{ Cue = "/VO/Intercom_0443", RequiredRoom = "C_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- You really think you can get out of here?
			{ Cue = "/VO/Intercom_0444", RequiredRoom = "C_PostBoss01" },
			-- So you thwarted the Champion of Elysium.
			{ Cue = "/VO/Intercom_0445", RequiredRoom = "C_PostBoss01" },
			-- Don't make me come up there, boy.
			-- { Cue = "/VO/Intercom_0446", RequiredRoom = "C_PostBoss01" },
			-- Nothing good awaits beyond my realm.
			{ Cue = "/VO/Intercom_0447", RequiredRoom = "C_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- The worst is yet to come, boy.
			-- { Cue = "/VO/Intercom_0448", RequiredRoom = "C_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- You think you can just walk away from me?
			{ Cue = "/VO/Intercom_0449", RequiredRoom = "C_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- A disappointing show from Theseus.
			{ Cue = "/VO/Intercom_0450", RequiredRoom = "C_PostBoss01" },
			-- Must I send Cerberus to block your path again?
			{ Cue = "/VO/Intercom_0451", RequiredRoom = "C_PostBoss01",            RequiredTextLines = { "CerberusStyxMeeting01" } },
			-- I shall have to have a word with our King Theseus.
			{ Cue = "/VO/Intercom_0452", RequiredRoom = "C_PostBoss01" },
			-- Your stubborness shall only bring you pain.
			{ Cue = "/VO/Intercom_0453", RequiredRoom = "C_PostBoss01",            RequiredFalseTextLines = { "Ending01" }, },
			-- I shall stop you by my own hand if I must.
			{ Cue = "/VO/Intercom_0454", RequiredRoom = "C_PostBoss01",            RequiredAnyTextLines = { "LordHadesEncounter01", "LordHadesEncounter01_B" } },
			-- Go give the vermin in the Temple my regards.
			{ Cue = "/VO/Intercom_0599", RequiredRoom = "C_PostBoss01",            RequiredSeenRooms = { "D_Combat01", "D_Combat02", "D_Combat03", "D_Combat04" } },
			-- Befriended any Satyrs lately, boy?
			-- { Cue = "/VO/Intercom_0600", RequiredRoom = "C_PostBoss01",            RequiredSeenRooms = { "D_Combat01", "D_Combat02", "D_Combat03", "D_Combat04" } },
			-- You force me to send Cerberus ahead, again.
			{ Cue = "/VO/Intercom_0601", RequiredRoom = "C_PostBoss01",            RequiredSeenRooms = { "D_Hub" } },
			-- Cerberus is patiently at work, instead of resting here.
			{ Cue = "/VO/Intercom_0602", RequiredRoom = "C_PostBoss01",            RequiredSeenRooms = { "D_Hub" } },
			-- I suppose that I shall be seeing you quite soon.
			{ Cue = "/VO/Intercom_0603", RequiredRoom = "C_PostBoss01",            RequiredSeenRooms = { "D_Boss01" } },
			-- Hurry up, then, and I shall see you outside.
			{ Cue = "/VO/Intercom_0604", RequiredRoom = "C_PostBoss01",            RequiredSeenRooms = { "D_Boss01" } },
			-- Go tend to the Satyr problem, for a change.
			{ Cue = "/VO/Intercom_1014", RequiredRoom = "C_PostBoss01",            RequiredTextLines = { "Ending01" }, },
			-- You made short work of Theseus, I take it, boy?
			-- { Cue = "/VO/Intercom_1015", RequiredRoom = "C_PostBoss01",            RequiredTextLines = { "Ending01" }, },
			-- The finest of Elysium all failed to thwart you, eh?
			{ Cue = "/VO/Intercom_1016", RequiredRoom = "C_PostBoss01",            RequiredTextLines = { "Ending01" }, },
			-- It seems I had best prepare myself, at this rate.
			{ Cue = "/VO/Intercom_1017", RequiredRoom = "C_PostBoss01",            RequiredTextLines = { "Ending01" }, },
			-- You won't get through me quite that easily.
			{ Cue = "/VO/Intercom_1018", RequiredRoom = "C_PostBoss01",            RequiredTextLines = { "Ending01" }, },
			-- So close to the surface, already...
			{ Cue = "/VO/Intercom_1019", RequiredRoom = "C_PostBoss01",            RequiredTextLines = { "Ending01" }, },
			-- Elysium ought to be harder to escape than that.
			{ Cue = "/VO/Intercom_1020", RequiredRoom = "C_PostBoss01",            RequiredTextLines = { "Ending01" }, },
			-- Already made it that far, have you, boy?
			-- { Cue = "/VO/Intercom_1021", RequiredRoom = "C_PostBoss01",            RequiredTextLines = { "Ending01" }, },
		},
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			UsePlayerSource = true,
			RequiredFalseScreensOpen = { "AwardMenu", "SellTraitMenu", "Store" },

			-- I sure did, Father.
			{ Cue = "/VO/ZagreusField_1539", RequiredPlayedThisRoom = { "/VO/Intercom_0380" }, },
			-- You are correct, Father.
			{ Cue = "/VO/ZagreusField_1540", RequiredPlayedThisRoom = { "/VO/Intercom_0380" }, },

			-- It most certainly did.
			{ Cue = "/VO/ZagreusField_1541", RequiredPlayedThisRoom = { "/VO/Intercom_0381" }, },
			-- It fell to me, indeed.
			{ Cue = "/VO/ZagreusField_1542", RequiredPlayedThisRoom = { "/VO/Intercom_0381" }, },

			-- I think I'm going to Elysium.
			{ Cue = "/VO/ZagreusField_1543", RequiredPlayedThisRoom = { "/VO/Intercom_0382" }, RequiredRoom = "B_PostBoss01" },
			-- You know exactly where.
			{ Cue = "/VO/ZagreusField_1544", RequiredPlayedThisRoom = { "/VO/Intercom_0382" }, },

			-- I figured, thanks.
			{ Cue = "/VO/ZagreusField_1545", RequiredPlayedThisRoom = { "/VO/Intercom_0383" }, },
			-- Oh I'm sure it's fine.
			{ Cue = "/VO/ZagreusField_1546", RequiredPlayedThisRoom = { "/VO/Intercom_0383" }, },

			-- Thanks for the tip.
			{ Cue = "/VO/ZagreusField_1547", RequiredPlayedThisRoom = { "/VO/Intercom_0384" }, },
			-- Don't know any other way.
			{ Cue = "/VO/ZagreusField_1548", RequiredPlayedThisRoom = { "/VO/Intercom_0384" }, },

			-- Good.
			{ Cue = "/VO/ZagreusField_1549", RequiredPlayedThisRoom = { "/VO/Intercom_0385" }, },
			-- Sounds like progress to me.
			{ Cue = "/VO/ZagreusField_1550", RequiredPlayedThisRoom = { "/VO/Intercom_0385" }, },

			-- I am, indeed.
			{ Cue = "/VO/ZagreusField_1551", RequiredPlayedThisRoom = { "/VO/Intercom_0386" }, },
			-- Seems that way.
			{ Cue = "/VO/ZagreusField_1552", RequiredPlayedThisRoom = { "/VO/Intercom_0386" }, },

			-- We'll see.
			{ Cue = "/VO/ZagreusField_1553", RequiredPlayedThisRoom = { "/VO/Intercom_0387" }, },
			-- Don't count on it.
			{ Cue = "/VO/ZagreusField_1554", RequiredPlayedThisRoom = { "/VO/Intercom_0387" }, },

			-- Or else what, Father?
			{ Cue = "/VO/ZagreusField_1555", RequiredPlayedThisRoom = { "/VO/Intercom_0388" }, },
			-- Sorry, can't turn back.
			{ Cue = "/VO/ZagreusField_1556", RequiredPlayedThisRoom = { "/VO/Intercom_0388" }, },

			-- So do I.
			{ Cue = "/VO/ZagreusField_1557", RequiredPlayedThisRoom = { "/VO/Intercom_0389" }, },
			-- Not in the mood for your jesting, Father.
			{ Cue = "/VO/ZagreusField_1558", RequiredPlayedThisRoom = { "/VO/Intercom_0389" }, },

			-- There's always the next one.
			{ Cue = "/VO/ZagreusField_1559", RequiredPlayedThisRoom = { "/VO/Intercom_0390" }, },
			-- What are you, the Three Fates?
			{ Cue = "/VO/ZagreusField_1560", RequiredPlayedThisRoom = { "/VO/Intercom_0390" }, },

			-- Don't worry, won't be long.
			{ Cue = "/VO/ZagreusField_1561", RequiredPlayedThisRoom = { "/VO/Intercom_0391" }, },
			-- Well, I did.
			{ Cue = "/VO/ZagreusField_1562", RequiredPlayedThisRoom = { "/VO/Intercom_0391" }, },

			-- Oh very much.
			{ Cue = "/VO/ZagreusField_1563", RequiredPlayedThisRoom = { "/VO/Intercom_0392" }, },
			-- You really need to turn down the heat in that place.
			{ Cue = "/VO/ZagreusField_1564", RequiredPlayedThisRoom = { "/VO/Intercom_0392" }, },

			-- Yes, yes I do.
			{ Cue = "/VO/ZagreusField_1565", RequiredPlayedThisRoom = { "/VO/Intercom_0393" }, },
			-- I absolutely do.
			{ Cue = "/VO/ZagreusField_1566", RequiredPlayedThisRoom = { "/VO/Intercom_0393" }, },


			-- C_PostBoss01 responses
			-- Detecting a pattern yet, Father?
			{ Cue = "/VO/ZagreusField_1998", RequiredPlayedThisRoom = { "/VO/Intercom_0441" }, },
			-- They weren't that great.
			{ Cue = "/VO/ZagreusField_1999", RequiredPlayedThisRoom = { "/VO/Intercom_0441" }, },

			-- Don't forget Asterius!
			{ Cue = "/VO/ZagreusField_2000", RequiredPlayedThisRoom = { "/VO/Intercom_0442" }, },
			-- He's all talk.
			{ Cue = "/VO/ZagreusField_2001", RequiredPlayedThisRoom = { "/VO/Intercom_0442" }, },

			-- So you keep saying.
			{ Cue = "/VO/ZagreusField_2002", RequiredPlayedThisRoom = { "/VO/Intercom_0443" }, },
			-- You know nothing of my struggles.
			{ Cue = "/VO/ZagreusField_2003", RequiredPlayedThisRoom = { "/VO/Intercom_0443" }, },

			-- What gave you that idea?
			{ Cue = "/VO/ZagreusField_2004", RequiredPlayedThisRoom = { "/VO/Intercom_0444" }, },
			-- I do.
			{ Cue = "/VO/ZagreusField_2005", RequiredPlayedThisRoom = { "/VO/Intercom_0444" }, },

			-- I guess word travels fast.
			{ Cue = "/VO/ZagreusField_2006", RequiredPlayedThisRoom = { "/VO/Intercom_0445" }, },
			-- I thwarted him all right.
			{ Cue = "/VO/ZagreusField_2007", RequiredPlayedThisRoom = { "/VO/Intercom_0445" }, },

			-- Not making you do anything.
			{ Cue = "/VO/ZagreusField_2008", RequiredPlayedThisRoom = { "/VO/Intercom_0446" }, },
			-- Stay home, Father.
			{ Cue = "/VO/ZagreusField_2009", RequiredPlayedThisRoom = { "/VO/Intercom_0446" }, },

			-- I'll be the judge of that.
			{ Cue = "/VO/ZagreusField_2010", RequiredPlayedThisRoom = { "/VO/Intercom_0447" }, },
			-- I'm sure I'll find something.
			{ Cue = "/VO/ZagreusField_2011", RequiredPlayedThisRoom = { "/VO/Intercom_0447" }, },

			-- Looking forward to it!
			{ Cue = "/VO/ZagreusField_2012", RequiredPlayedThisRoom = { "/VO/Intercom_0448" }, },
			-- See you soon, Father.
			{ Cue = "/VO/ZagreusField_2013", RequiredPlayedThisRoom = { "/VO/Intercom_0448" }, },

			-- It's more of a brisk jog.
			{ Cue = "/VO/ZagreusField_2014", RequiredPlayedThisRoom = { "/VO/Intercom_0449" }, },
			-- Better off this way.
			{ Cue = "/VO/ZagreusField_2015", RequiredPlayedThisRoom = { "/VO/Intercom_0449" }, },

			-- Perhaps your expectations are too high.
			{ Cue = "/VO/ZagreusField_2016", RequiredPlayedThisRoom = { "/VO/Intercom_0450" }, },
			-- I pray his ego will recover soon.
			{ Cue = "/VO/ZagreusField_2017", RequiredPlayedThisRoom = { "/VO/Intercom_0450" }, },

			-- No, but you're going to anyway.
			{ Cue = "/VO/ZagreusField_2018", RequiredPlayedThisRoom = { "/VO/Intercom_0451" }, },
			-- You leave Cerberus out of this.
			{ Cue = "/VO/ZagreusField_2019", RequiredPlayedThisRoom = { "/VO/Intercom_0451" }, },

			-- Tell him I said hi.
			{ Cue = "/VO/ZagreusField_2020", RequiredPlayedThisRoom = { "/VO/Intercom_0452" }, },
			-- Mind asking him to tone it down a bit?
			{ Cue = "/VO/ZagreusField_2021", RequiredPlayedThisRoom = { "/VO/Intercom_0452" }, },

			-- What would you know of it?
			{ Cue = "/VO/ZagreusField_2022", RequiredPlayedThisRoom = { "/VO/Intercom_0453" }, },
			-- What are you, the Fates?
			{ Cue = "/VO/ZagreusField_2023", RequiredPlayedThisRoom = { "/VO/Intercom_0453" }, },

			-- I welcome you to try.
			{ Cue = "/VO/ZagreusField_2024", RequiredPlayedThisRoom = { "/VO/Intercom_0454" }, },
			-- Then I'll deal with you same as all the rest.
			{ Cue = "/VO/ZagreusField_2025", RequiredPlayedThisRoom = { "/VO/Intercom_0454" }, },
		},
	},
	HadesWrathAttackVoiceLines = {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.25,
		SuccessiveChanceToPlay = 0.66,
		RequiredFalseBossPhase = 3,
		Cooldowns =
		{
			{ Name = "HadesAnyQuipSpeech" },
			{ Name = "HadesWrathSpeech",  Time = 150 },
		},

		-- You test my patience!
		{ Cue = "/VO/HadesField_0054" },
		-- You had your chance!
		{ Cue = "/VO/HadesField_0056" },
		-- Hrryyaaaahhh!
		{ Cue = "/VO/HadesField_0058" },
		-- Grraaauuuugggghhh!
		{ Cue = "/VO/HadesField_0059" },
		-- You wish to anger me?!
		{ Cue = "/VO/HadesField_0060" },
		-- I've had it with you, boy!!
		-- { Cue = "/VO/HadesField_0286" },
		-- Let's have it out, then, boy!!
		-- { Cue = "/VO/HadesField_0287" },
		-- I shall not take such disrespect from you!!
		{ Cue = "/VO/HadesField_0288" },
		-- You wish to anger me?!
		{ Cue = "/VO/HadesField_0289" },
		-- You brought this on yourself!!
		{ Cue = "/VO/HadesField_0290" },
		-- I'll tolerate no more of this from you!!
		{ Cue = "/VO/HadesField_0291" },
		-- Raauuugghhhh!!
		{ Cue = "/VO/HadesField_0292" },
		-- Nrrraaaaghh!!
		{ Cue = "/VO/HadesField_0293" },
	},
	HadesBeamAttackVoiceLines = {
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.35,
			SuccessiveChanceToPlay = 0.8,
			TriggerCooldowns = { "HadesAnyQuipSpeech" },
			RequiredFalseBossPhase = 3,
			Cooldowns =
			{
				{ Name = "HadesCastBeamSpeech", Time = 60 },
			},

			-- I have something for you!!
			{ Cue = "/VO/HadesField_0061" },
			-- Zagreus!!
			-- { Cue = "/VO/HadesField_0062", RequiredTextLines = { "Ending01" }, },
			-- You blasted little...!
			{ Cue = "/VO/HadesField_0063" },
			-- No more!
			{ Cue = "/VO/HadesField_0064" },
			-- Enough of you!
			{ Cue = "/VO/HadesField_0065" },
			-- Out of my sight!
			{ Cue = "/VO/HadesField_0066" },
			-- Now this!!
			{ Cue = "/VO/HadesField_0300" },
			-- This is for your own good!
			{ Cue = "/VO/HadesField_0301" },
			-- Let's see you run from this!
			{ Cue = "/VO/HadesField_0302" },
			-- You'll burn!
			{ Cue = "/VO/HadesField_0303" },
			-- Behold!!
			{ Cue = "/VO/HadesField_0304" },
			-- Fire!!
			{ Cue = "/VO/HadesField_0305" },
		},
		[2] = GlobalVoiceLines.HadesWrathAttackVoiceLines,
	},
	-- #region FatherSonArgumentVoiceLines
	-- FatherSonArgumentVoiceLines = {
	-- 	{
	-- 		RequiredTextLines = { "Ending01" },
	-- 		MaxRunsSinceAnyTextLines = { TextLines = { "HadesGift05" }, Count = 60 },
	-- 		RequiredFalseBossPhase = 3,
	-- 		{
	-- 			RandomRemaining = true,
	-- 			PreLineWait = 0.65,
	-- 			SuccessiveChanceToPlay = 0.25,
	-- 			TriggerCooldowns = { "HadesAnyQuipSpeech", "HadesSummonSpawnsSpeech", "HadesGoneInvisSpeech" },
	-- 			Cooldowns =
	-- 			{
	-- 				{ Name = "FatherSonArgumentSpeech", Time = 320 },
	-- 				{ Name = "HadesStageSwitchSpeech",  Time = 90 },
	-- 				{ Name = "ZagStageSwitchSpeech",    Time = 90 },
	-- 			},

	-- 			-- Path A
	-- 			-- You think I shall go easy on you, boy?
	-- 			{ Cue = "/VO/HadesField_0506" },

	-- 			-- Path B
	-- 			-- You think your mother shall make me go soft, do you?
	-- 			{ Cue = "/VO/HadesField_0507" },

	-- 			-- Path C
	-- 			-- Why don't you clean your chambers so ferociously?
	-- 			{ Cue = "/VO/HadesField_0508" },

	-- 			-- Path D
	-- 			-- You'd not have made it here without Olympus, boy!
	-- 			{ Cue = "/VO/HadesField_0509" },

	-- 			-- Path E
	-- 			-- Which of our relatives aided you this time, boy?
	-- 			{ Cue = "/VO/HadesField_0510" },

	-- 			-- Path F
	-- 			-- You mother already begins to coddle you!
	-- 			{ Cue = "/VO/HadesField_0511" },

	-- 			-- Path G
	-- 			-- I trust you're having a most pleasant evening, boy?
	-- 			{ Cue = "/VO/HadesField_0512" },

	-- 			-- Path H
	-- 			-- Zagreus! Is this the best that you can do?
	-- 			{ Cue = "/VO/HadesField_0513" },

	-- 			-- Path I
	-- 			-- Zagreus! I trust you had a pleasant journey here?
	-- 			{ Cue = "/VO/HadesField_0515" },

	-- 			-- Path J
	-- 			-- Zagreus! How fared your plundering of my domain?
	-- 			{ Cue = "/VO/HadesField_0516" },

	-- 			-- Path K
	-- 			-- To think you're so receptive to this form of discipline!
	-- 			{ Cue = "/VO/HadesField_0517" },
	-- 		},
	-- 		-- Path A
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- You think I shall go easy on you, boy?
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0506" },

	-- 			-- Would be odd of you to start right now!
	-- 			{ Cue = "/VO/ZagreusField_4548" },
	-- 			-- What, you mean like last time?
	-- 			{ Cue = "/VO/ZagreusField_4549" },
	-- 			-- Think we both know the answer to that one!
	-- 			{ Cue = "/VO/ZagreusField_4550" },
	-- 			-- Not really, though, why do you ask?
	-- 			{ Cue = "/VO/ZagreusField_4551" },
	-- 			-- I guess we'll find out soon, won't we?
	-- 			{ Cue = "/VO/ZagreusField_4552" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.85,

	-- 			-- You know, I think you're right!
	-- 			{ Cue = "/VO/HadesField_0518", RequiredLastLinePlayed = { "/VO/ZagreusField_4548" }, },
	-- 			-- You're easily distracted, you know that?
	-- 			{ Cue = "/VO/HadesField_0519", RequiredLastLinePlayed = { "/VO/ZagreusField_4549" }, },
	-- 			-- That we most certainly do.
	-- 			{ Cue = "/VO/HadesField_0520", RequiredLastLinePlayed = { "/VO/ZagreusField_4550" }, },
	-- 			-- A useless thought is all!
	-- 			{ Cue = "/VO/HadesField_0521", RequiredLastLinePlayed = { "/VO/ZagreusField_4551" }, },
	-- 			-- I suppose we shall!
	-- 			{ Cue = "/VO/HadesField_0522", RequiredLastLinePlayed = { "/VO/ZagreusField_4552" }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.55,

	-- 			-- Why, thanks!
	-- 			{ Cue = "/VO/ZagreusField_4598", RequiredLastLinePlayed = { "/VO/HadesField_0518" }, },
	-- 			-- Good chat!
	-- 			{ Cue = "/VO/ZagreusField_4599", RequiredLastLinePlayed = { "/VO/HadesField_0518" }, },

	-- 			-- Look at that lovely sky!
	-- 			{ Cue = "/VO/ZagreusField_4600", RequiredLastLinePlayed = { "/VO/HadesField_0519" }, },
	-- 			-- Am not!
	-- 			{ Cue = "/VO/ZagreusField_4601", RequiredLastLinePlayed = { "/VO/HadesField_0519" }, },

	-- 			-- Great!
	-- 			{ Cue = "/VO/ZagreusField_4602", RequiredLastLinePlayed = { "/VO/HadesField_0520" }, },
	-- 			-- All right, then!
	-- 			{ Cue = "/VO/ZagreusField_4603", RequiredLastLinePlayed = { "/VO/HadesField_0520" }, },

	-- 			-- Save it, then!
	-- 			{ Cue = "/VO/ZagreusField_4604", RequiredLastLinePlayed = { "/VO/HadesField_0521" }, },
	-- 			-- Well thanks for sharing, anyway!
	-- 			{ Cue = "/VO/ZagreusField_4605", RequiredLastLinePlayed = { "/VO/HadesField_0521" }, },

	-- 			-- Let's do it then!
	-- 			{ Cue = "/VO/ZagreusField_4606", RequiredLastLinePlayed = { "/VO/HadesField_0522" }, },
	-- 		},
	-- 		-- Path B
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- You think your mother shall make me go soft, do you?
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0507" },

	-- 			-- I'm sure she'll wear you down eventually!
	-- 			{ Cue = "/VO/ZagreusField_4553" },
	-- 			-- Who knows? Mother's full of surprises!
	-- 			{ Cue = "/VO/ZagreusField_4554" },
	-- 			-- Perish the thought of you being less difficult, Father!
	-- 			{ Cue = "/VO/ZagreusField_4555" },
	-- 			-- Is that your deepest fear of late, Father?
	-- 			{ Cue = "/VO/ZagreusField_4556" },
	-- 			-- I think you'll get there, yes!
	-- 			{ Cue = "/VO/ZagreusField_4557" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.85,

	-- 			-- You treat her with respect!
	-- 			{ Cue = "/VO/HadesField_0523", RequiredLastLinePlayed = { "/VO/ZagreusField_4553", "/VO/ZagreusField_4554" }, },
	-- 			-- Do not treat her as you allow yourself with me!
	-- 			{ Cue = "/VO/HadesField_0524", RequiredLastLinePlayed = { "/VO/ZagreusField_4553", "/VO/ZagreusField_4554" }, },
	-- 			-- Ah, how could I forget?
	-- 			{ Cue = "/VO/HadesField_0525", RequiredLastLinePlayed = { "/VO/ZagreusField_4554" }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.75,

	-- 			-- Same goes for you!
	-- 			{ Cue = "/VO/ZagreusField_4607", RequiredLastLinePlayed = { "/VO/HadesField_0523", "/VO/HadesField_0524" }, },
	-- 			-- Worry about yourself!
	-- 			{ Cue = "/VO/ZagreusField_4608", RequiredLastLinePlayed = { "/VO/HadesField_0523", "/VO/HadesField_0524" }, },
	-- 			-- Likewise to you!
	-- 			{ Cue = "/VO/ZagreusField_4609", RequiredLastLinePlayed = { "/VO/HadesField_0523", "/VO/HadesField_0524" }, },
	-- 			-- No plans for that!
	-- 			{ Cue = "/VO/ZagreusField_4610", RequiredLastLinePlayed = { "/VO/HadesField_0523", "/VO/HadesField_0524" }, },
	-- 			-- Old age, it happens!
	-- 			{ Cue = "/VO/ZagreusField_4611", RequiredLastLinePlayed = { "/VO/HadesField_0525" }, },
	-- 			-- You've been so busy!
	-- 			{ Cue = "/VO/ZagreusField_4612", RequiredLastLinePlayed = { "/VO/HadesField_0525" }, },
	-- 		},
	-- 		-- Path C
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- Why don't you clean your chambers so ferociously?
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0508" },

	-- 			-- My chambers just aren't as enjoyable to fight!
	-- 			{ Cue = "/VO/ZagreusField_4558" },
	-- 			-- What, so they could look like your boring chambers?
	-- 			{ Cue = "/VO/ZagreusField_4559" },
	-- 			-- Too busy ransacking through your domain, sorry!
	-- 			{ Cue = "/VO/ZagreusField_4560" },
	-- 			-- Why don't you concentrate on fighting back?
	-- 			{ Cue = "/VO/ZagreusField_4561" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.85,

	-- 			-- You and your clever wit!
	-- 			{ Cue = "/VO/HadesField_0556", RequiredLastLinePlayed = { "/VO/ZagreusField_4558" }, },
	-- 			-- Bah...!
	-- 			{ Cue = "/VO/HadesField_0555", RequiredLastLinePlayed = { "/VO/ZagreusField_4558" }, },
	-- 			-- You take that back about my chambers!
	-- 			{ Cue = "/VO/HadesField_0526", RequiredLastLinePlayed = { "/VO/ZagreusField_4559" }, },
	-- 			-- What would you know of real work?
	-- 			{ Cue = "/VO/HadesField_0527", RequiredLastLinePlayed = { "/VO/ZagreusField_4560" }, },
	-- 			-- I ask the questions here!
	-- 			{ Cue = "/VO/HadesField_0528", RequiredLastLinePlayed = { "/VO/ZagreusField_4561" }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.75,

	-- 			-- Nope!
	-- 			{ Cue = "/VO/ZagreusField_4613", RequiredLastLinePlayed = { "/VO/HadesField_0526" }, },
	-- 			-- They're boring, I say!
	-- 			{ Cue = "/VO/ZagreusField_4614", RequiredLastLinePlayed = { "/VO/HadesField_0526" }, },

	-- 			-- This isn't real work?
	-- 			{ Cue = "/VO/ZagreusField_4615", RequiredLastLinePlayed = { "/VO/HadesField_0527" }, },
	-- 			-- Just what you've taught me!
	-- 			{ Cue = "/VO/ZagreusField_4616", RequiredLastLinePlayed = { "/VO/HadesField_0527" }, },

	-- 			-- Whatever you say!
	-- 			{ Cue = "/VO/ZagreusField_4617", RequiredLastLinePlayed = { "/VO/HadesField_0528" }, },
	-- 			-- Really?
	-- 			{ Cue = "/VO/ZagreusField_4618", RequiredLastLinePlayed = { "/VO/HadesField_0528" }, },
	-- 		},
	-- 		-- Path D
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- You'd not have made it here without Olympus, boy!
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0509" },

	-- 			-- That's funny, you wouldn't be here without Olympus, either!
	-- 			{ Cue = "/VO/ZagreusField_4562" },
	-- 			-- You act like you do everything yourself!
	-- 			{ Cue = "/VO/ZagreusField_4563" },
	-- 			-- You should be pleased to have their help!
	-- 			{ Cue = "/VO/ZagreusField_4564" },
	-- 			-- And what's your point, exactly, there?
	-- 			{ Cue = "/VO/ZagreusField_4565" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.85,

	-- 			-- Bah, blast you, boy!
	-- 			{ Cue = "/VO/HadesField_0529", RequiredLastLinePlayed = { "/VO/ZagreusField_4562" }, },
	-- 			-- More than you know!
	-- 			{ Cue = "/VO/HadesField_0530", RequiredLastLinePlayed = { "/VO/ZagreusField_4563" }, },
	-- 			-- Oh, I'm delighted, boy!
	-- 			{ Cue = "/VO/HadesField_0531", RequiredLastLinePlayed = { "/VO/ZagreusField_4564" }, },
	-- 			-- Someday you'll understand!
	-- 			{ Cue = "/VO/HadesField_0532", RequiredLastLinePlayed = { "/VO/ZagreusField_4565" }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.75,

	-- 			-- Blast you right back!
	-- 			{ Cue = "/VO/ZagreusField_4619", RequiredLastLinePlayed = { "/VO/HadesField_0529" }, },
	-- 			-- <Chuckle>
	-- 			{ Cue = "/VO/ZagreusField_4620", RequiredLastLinePlayed = { "/VO/HadesField_0529" }, },

	-- 			-- Well, cheers!
	-- 			{ Cue = "/VO/ZagreusField_4621", RequiredLastLinePlayed = { "/VO/HadesField_0530" }, },
	-- 			-- I know a thing or two!
	-- 			{ Cue = "/VO/ZagreusField_4622", RequiredLastLinePlayed = { "/VO/HadesField_0530" }, },

	-- 			-- I can tell!
	-- 			{ Cue = "/VO/ZagreusField_4623", RequiredLastLinePlayed = { "/VO/HadesField_0531" }, },
	-- 			-- Clearly!
	-- 			{ Cue = "/VO/ZagreusField_4624", RequiredLastLinePlayed = { "/VO/HadesField_0531" }, },

	-- 			-- Ominous!
	-- 			{ Cue = "/VO/ZagreusField_4625", RequiredLastLinePlayed = { "/VO/HadesField_0532" }, },
	-- 			-- Sounds good!
	-- 			{ Cue = "/VO/ZagreusField_4626", RequiredLastLinePlayed = { "/VO/HadesField_0532" }, },
	-- 		},
	-- 		-- Path E
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- Which of our relatives aided you this time, boy?
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0510" },

	-- 			-- I'll leave that one for you to figure out!
	-- 			{ Cue = "/VO/ZagreusField_4566" },
	-- 			-- Who do you think, Father?
	-- 			{ Cue = "/VO/ZagreusField_4567" },
	-- 			-- Oh, quite a few of them, I'll have you know!
	-- 			{ Cue = "/VO/ZagreusField_4568" },
	-- 			-- Certainly not you!
	-- 			{ Cue = "/VO/ZagreusField_4569", RequiredFalseTraits = { "HadesShoutKeepsake" }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.5,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.85,

	-- 			-- Enough!
	-- 			{ Cue = "/VO/HadesField_0551", RequiredLastLinePlayed = { "/VO/ZagreusField_4568", "/VO/ZagreusField_4569" }, },
	-- 			-- All right!
	-- 			{ Cue = "/VO/HadesField_0553", RequiredLastLinePlayed = { "/VO/ZagreusField_4568", "/VO/ZagreusField_4569" }, },
	-- 			-- I think it's time for you to die!
	-- 			{ Cue = "/VO/HadesField_0533", RequiredLastLinePlayed = { "/VO/ZagreusField_4567" }, },
	-- 			-- Do not pretend to even care!
	-- 			{ Cue = "/VO/HadesField_0534", RequiredLastLinePlayed = { "/VO/ZagreusField_4567" }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.75,

	-- 			-- Well I would beg to differ!
	-- 			{ Cue = "/VO/ZagreusField_4627", RequiredLastLinePlayed = { "/VO/HadesField_0533" }, },
	-- 			-- Mm, no thanks!
	-- 			{ Cue = "/VO/ZagreusField_4628", RequiredLastLinePlayed = { "/VO/HadesField_0533" }, },

	-- 			-- All right, I won't!
	-- 			{ Cue = "/VO/ZagreusField_4629", RequiredLastLinePlayed = { "/VO/HadesField_0534" }, },
	-- 			-- Fine!
	-- 			{ Cue = "/VO/ZagreusField_4630", RequiredLastLinePlayed = { "/VO/HadesField_0534" }, },
	-- 		},
	-- 		-- Path F
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- You mother already begins to coddle you!
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0511" },

	-- 			-- Last I checked princes were meant to be coddled!
	-- 			{ Cue = "/VO/ZagreusField_4570" },
	-- 			-- It's called showing affection to your children, Father!
	-- 			{ Cue = "/VO/ZagreusField_4571" },
	-- 			-- Whatever will you do about it, Father?
	-- 			{ Cue = "/VO/ZagreusField_4572" },
	-- 			-- What do you even care?
	-- 			{ Cue = "/VO/ZagreusField_4573" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.85,

	-- 			-- Ah, thank you for the information, there!
	-- 			{ Cue = "/VO/HadesField_0535", RequiredLastLinePlayed = { "/VO/ZagreusField_4570", "/VO/ZagreusField_4571" }, },
	-- 			-- Please, teach me more, then!
	-- 			{ Cue = "/VO/HadesField_0536", RequiredLastLinePlayed = { "/VO/ZagreusField_4570", "/VO/ZagreusField_4571", }, },
	-- 			-- Always such accusations, from you!
	-- 			{ Cue = "/VO/HadesField_0537", RequiredLastLinePlayed = { "/VO/ZagreusField_4573", }, },
	-- 			-- You impudent...!
	-- 			{ Cue = "/VO/HadesField_0549", RequiredLastLinePlayed = { "/VO/ZagreusField_4572", }, },
	-- 			-- You impertinent...!
	-- 			{ Cue = "/VO/HadesField_0550", RequiredLastLinePlayed = { "/VO/ZagreusField_4572", }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.75,

	-- 			-- You're most welcome!
	-- 			{ Cue = "/VO/ZagreusField_4631", RequiredLastLinePlayed = { "/VO/HadesField_0535" }, },
	-- 			-- Sure thing!
	-- 			{ Cue = "/VO/ZagreusField_4632", RequiredLastLinePlayed = { "/VO/HadesField_0535" }, },
	-- 			-- Happy to!
	-- 			{ Cue = "/VO/ZagreusField_4633", RequiredLastLinePlayed = { "/VO/HadesField_0536" }, },
	-- 			-- Always!
	-- 			{ Cue = "/VO/ZagreusField_4634", RequiredLastLinePlayed = { "/VO/HadesField_0537" }, },
	-- 		},
	-- 		-- Path G
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- I trust you're having a most pleasant evening, boy?
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0512" },

	-- 			-- Quite lovely, Father, how about yourself?
	-- 			{ Cue = "/VO/ZagreusField_4574" },
	-- 			-- There's a refreshing chill now that you mention it!
	-- 			{ Cue = "/VO/ZagreusField_4575" },
	-- 			-- Oh I most definitely am, thank you, Father!
	-- 			{ Cue = "/VO/ZagreusField_4576" },
	-- 			-- It could be going better, I suppose!
	-- 			{ Cue = "/VO/ZagreusField_4577" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.85,

	-- 			-- Oh, you know, same as ever, here!
	-- 			{ Cue = "/VO/HadesField_0538", RequiredLastLinePlayed = { "/VO/ZagreusField_4574" }, },
	-- 			-- Silence!
	-- 			{ Cue = "/VO/HadesField_0552", RequiredLastLinePlayed = { "/VO/ZagreusField_4574" }, },

	-- 			-- Just as I thought!
	-- 			{ Cue = "/VO/HadesField_0539", RequiredLastLinePlayed = { "/VO/ZagreusField_4577", }, },
	-- 			-- And such a shame for that!
	-- 			{ Cue = "/VO/HadesField_0540", RequiredLastLinePlayed = { "/VO/ZagreusField_4577" }, },

	-- 			-- You impudent...!
	-- 			{ Cue = "/VO/HadesField_0549", RequiredLastLinePlayed = { "/VO/ZagreusField_4572", }, },
	-- 			-- You impertinent...!
	-- 			{ Cue = "/VO/HadesField_0550", RequiredLastLinePlayed = { "/VO/ZagreusField_4572", }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.75,

	-- 			-- Well, carry on!
	-- 			{ Cue = "/VO/ZagreusField_4635", RequiredLastLinePlayed = { "/VO/HadesField_0538" }, },
	-- 			-- Thanks for your concern!
	-- 			{ Cue = "/VO/ZagreusField_4636", RequiredLastLinePlayed = { "/VO/HadesField_0539" }, },
	-- 			-- It'll be all right!
	-- 			{ Cue = "/VO/ZagreusField_4637", RequiredLastLinePlayed = { "/VO/HadesField_0540" }, },
	-- 		},
	-- 		-- Path H
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- Zagreus! Is this the best that you can do?
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0513" },

	-- 			-- You'll have to let me know when this is over!
	-- 			{ Cue = "/VO/ZagreusField_4578" },
	-- 			-- We'll soon find out I think!
	-- 			{ Cue = "/VO/ZagreusField_4579" },
	-- 			-- I'm pretty sure it is!
	-- 			{ Cue = "/VO/ZagreusField_4580" },
	-- 			-- You know what, probably not!
	-- 			{ Cue = "/VO/ZagreusField_4581" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.85,
	-- 			RequiredLastLinePlayed = { "/VO/ZagreusField_4568", "/VO/ZagreusField_4578", "/VO/ZagreusField_4579", "/VO/ZagreusField_4580", "/VO/ZagreusField_4581" },

	-- 			-- Enough!
	-- 			{ Cue = "/VO/HadesField_0551" },
	-- 			-- Silence!
	-- 			{ Cue = "/VO/HadesField_0552" },
	-- 			-- All right!
	-- 			{ Cue = "/VO/HadesField_0553" },
	-- 			-- End of discussion, boy!
	-- 			{ Cue = "/VO/HadesField_0554" },
	-- 			-- Bah...!
	-- 			{ Cue = "/VO/HadesField_0555" },
	-- 			-- You and your clever wit!
	-- 			{ Cue = "/VO/HadesField_0556" },
	-- 		},
	-- 		-- Path I
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- Zagreus! I trust you had a pleasant journey here?
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0515" },

	-- 			-- Oh, absolutely wonderful, thank you!
	-- 			{ Cue = "/VO/ZagreusField_4586" },
	-- 			-- It went all right, now that you mention it!
	-- 			{ Cue = "/VO/ZagreusField_4587" },
	-- 			-- Quite pleasant, actually!
	-- 			{ Cue = "/VO/ZagreusField_4588" },
	-- 			-- It's always pleasant in the Underworld!
	-- 			{ Cue = "/VO/ZagreusField_4589" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.75,

	-- 			-- How truly wonderful to hear.
	-- 			{ Cue = "/VO/HadesField_0543", RequiredLastLinePlayed = { "/VO/ZagreusField_4586", "/VO/ZagreusField_4587", "/VO/ZagreusField_4588", "/VO/ZagreusField_4577" }, },
	-- 		},
	-- 		-- Path J
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			-- Zagreus! How fared your plundering of my domain?
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0516" },

	-- 			-- It fared just great, thank you for asking, there!
	-- 			{ Cue = "/VO/ZagreusField_4590" },
	-- 			-- Could have gone better, though what can you do?
	-- 			{ Cue = "/VO/ZagreusField_4591" },
	-- 			-- Not bad at all, this time!
	-- 			{ Cue = "/VO/ZagreusField_4592" },
	-- 			-- I've had better escape attempts I think!
	-- 			{ Cue = "/VO/ZagreusField_4593" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.85,

	-- 			-- You're very welcome, boy!
	-- 			{ Cue = "/VO/HadesField_0541", RequiredLastLinePlayed = { "/VO/ZagreusField_4590" }, },
	-- 			-- I can do this!
	-- 			{ Cue = "/VO/HadesField_0544", RequiredLastLinePlayed = { "/VO/ZagreusField_4591" }, },
	-- 			-- How truly wonderful to hear.
	-- 			{ Cue = "/VO/HadesField_0543", RequiredLastLinePlayed = { "/VO/ZagreusField_4592" }, },
	-- 			-- Losing your spirit, same as ever, there!
	-- 			{ Cue = "/VO/HadesField_0545", RequiredLastLinePlayed = { "/VO/ZagreusField_4593" }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.75,

	-- 			-- Not just yet!
	-- 			{ Cue = "/VO/ZagreusField_4638", RequiredLastLinePlayed = { "/VO/HadesField_0545" }, },
	-- 		},
	-- 		-- Path K
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			UsePlayerSource = true,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.9,
	-- 			-- To think you're so receptive to this form of discipline!
	-- 			RequiredLastLinePlayed = { "/VO/HadesField_0517" },

	-- 			-- And we finally have an activity we can do together!
	-- 			{ Cue = "/VO/ZagreusField_4594" },
	-- 			-- Seems like you have a lot to learn about discipline, huh?
	-- 			{ Cue = "/VO/ZagreusField_4595" },
	-- 			-- We gods do like to fight!
	-- 			{ Cue = "/VO/ZagreusField_4596" },
	-- 			-- Discipline, that's what we're calling it?
	-- 			{ Cue = "/VO/ZagreusField_4597" },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			RandomRemaining = true,
	-- 			SuccessiveChanceToPlay = 0.85,

	-- 			-- Ah, yes, indeed!
	-- 			{ Cue = "/VO/HadesField_0546", RequiredLastLinePlayed = { "/VO/ZagreusField_4594", "/VO/ZagreusField_4575", "/VO/ZagreusField_4576" }, },
	-- 			-- We've all a lot to learn, I think!
	-- 			{ Cue = "/VO/HadesField_0547", RequiredLastLinePlayed = { "/VO/ZagreusField_4595" }, },
	-- 			-- Incorrigible brat!
	-- 			{ Cue = "/VO/HadesField_0548", RequiredLastLinePlayed = { "/VO/ZagreusField_4595" }, },
	-- 			-- How thoughtful, there, indeed!
	-- 			{ Cue = "/VO/HadesField_0542", RequiredLastLinePlayed = { "/VO/ZagreusField_4595" }, },
	-- 			-- Silence!
	-- 			{ Cue = "/VO/HadesField_0552", RequiredLastLinePlayed = { "/VO/ZagreusField_4597" }, },
	-- 			-- I think it's time for you to die!
	-- 			{ Cue = "/VO/HadesField_0533", RequiredLastLinePlayed = { "/VO/ZagreusField_4596" }, },
	-- 		},
	-- 		{
	-- 			PreLineWait = 0.4,
	-- 			BreakIfPlayed = true,
	-- 			RandomRemaining = true,
	-- 			UsePlayerSource = true,
	-- 			SuccessiveChanceToPlay = 0.75,

	-- 			-- Well, carry on!
	-- 			{ Cue = "/VO/ZagreusField_4635", RequiredLastLinePlayed = { "/VO/HadesField_0538" }, },
	-- 			-- Thanks for your concern!
	-- 			{ Cue = "/VO/ZagreusField_4636", RequiredLastLinePlayed = { "/VO/HadesField_0539" }, },
	-- 			-- It'll be all right!
	-- 			{ Cue = "/VO/ZagreusField_4637", RequiredLastLinePlayed = { "/VO/HadesField_0540" }, },
	-- 		},
	-- 	},
	-- 	-- pre-ending
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.65,
	-- 		SuccessiveChanceToPlay = 0.25,
	-- 		TriggerCooldowns = { "HadesAnyQuipSpeech", "HadesSummonSpawnsSpeech", "HadesGoneInvisSpeech" },
	-- 		RequiredFalseTextLines = { "Ending01" },
	-- 		Cooldowns =
	-- 		{
	-- 			{ Name = "FatherSonArgumentSpeech", Time = 300 },
	-- 			{ Name = "HadesStageSwitchSpeech",  Time = 70 },
	-- 			{ Name = "ZagStageSwitchSpeech",    Time = 70 },
	-- 		},

	-- 		-- Path A
	-- 		-- You dare lash out against me like this, boy?
	-- 		{ Cue = "/VO/HadesField_0155" },
	-- 		-- You really think you can just walk away?
	-- 		{ Cue = "/VO/HadesField_0359", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- You dare attempt to vanquish me, again?
	-- 		{ Cue = "/VO/HadesField_0360", RequiresLastRunCleared = true,              RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- You truly think this surface is where you belong?
	-- 		{ Cue = "/VO/HadesField_0361", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- Do you even realize what you're doing, boy?
	-- 		{ Cue = "/VO/HadesField_0362", RequiredPlayed = { "/VO/HadesField_0155" } },

	-- 		-- Path B
	-- 		-- Why do you keep up this foolishness?
	-- 		{ Cue = "/VO/HadesField_0158", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- Why do you keep doing this, time after blasted time?
	-- 		{ Cue = "/VO/HadesField_0363", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- Why have you forced me to confront you here, again?
	-- 		{ Cue = "/VO/HadesField_0364", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- Why do you wish to die repeatedly like this?
	-- 		{ Cue = "/VO/HadesField_0365", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- Why have you come all this way, again?
	-- 		{ Cue = "/VO/HadesField_0366", RequiredPlayed = { "/VO/HadesField_0155" } },

	-- 		-- Path C
	-- 		-- You've no control over your brutish strength!
	-- 		{ Cue = "/VO/HadesField_0216", RequiredPlayed = { "/VO/HadesField_0155" }, CooldownName = "SaidStrengthRecently",     CooldownTime = 40, },
	-- 		-- That brutish strength of yours! How like your relatives you are!
	-- 		{ Cue = "/VO/HadesField_0367", RequiredPlayed = { "/VO/HadesField_0155" }, CooldownName = "SaidStrengthRecently",     CooldownTime = 40, },
	-- 		-- You lack the proper form! Pure brutish strength!
	-- 		{ Cue = "/VO/HadesField_0368", RequiredPlayed = { "/VO/HadesField_0155" }, CooldownName = "SaidStrengthRecently",     CooldownTime = 40, },
	-- 		-- Is this another showing of your brutish strength?
	-- 		{ Cue = "/VO/HadesField_0369", RequiredPlayed = { "/VO/HadesField_0155" }, CooldownName = "SaidStrengthRecently",     CooldownTime = 40, },

	-- 		-- Path D
	-- 		-- What shall it take for you to cease with this madness?
	-- 		{ Cue = "/VO/HadesField_0217", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- What shall it take for all of this to end?
	-- 		{ Cue = "/VO/HadesField_0370", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- What shall it take for you to cease making me face you here?
	-- 		{ Cue = "/VO/HadesField_0371", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- What shall it take for you to stop this foolishness?
	-- 		{ Cue = "/VO/HadesField_0372", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 		-- What is it going to take for you to get some sense into your head?
	-- 		{ Cue = "/VO/HadesField_0373", RequiredPlayed = { "/VO/HadesField_0155" } },
	-- 	},
	-- 	-- Path A
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.85,
	-- 		-- You dare lash out against me like this, boy?
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0155", "/VO/HadesField_0359", "/VO/HadesField_0360", "/VO/HadesField_0361", "/VO/HadesField_0362" },

	-- 		-- I do!
	-- 		{ Cue = "/VO/ZagreusField_2291" },
	-- 		-- That's right!
	-- 		{ Cue = "/VO/ZagreusField_2292" },
	-- 		-- What do you think, Father?
	-- 		{ Cue = "/VO/ZagreusField_2293" },
	-- 		-- I guess so!
	-- 		{ Cue = "/VO/ZagreusField_2294" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.75,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2293" },

	-- 		-- I think that you are an ignoble brat!
	-- 		{ Cue = "/VO/HadesField_0156" },
	-- 		-- I think you are wasting your time.
	-- 		{ Cue = "/VO/HadesField_0157" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.65,
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0156" },

	-- 		-- Oh you'll think better of me soon!
	-- 		{ Cue = "/VO/ZagreusField_2295" },
	-- 		-- And I am shocked to hear it!
	-- 		{ Cue = "/VO/ZagreusField_2296" },
	-- 		-- And I think you're a miserable failure as a father!
	-- 		{ Cue = "/VO/ZagreusField_2297" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.5,
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0157" },

	-- 		-- It's my time to do with as I please!
	-- 		{ Cue = "/VO/ZagreusField_2298" },
	-- 		-- I don't care what you think!
	-- 		{ Cue = "/VO/ZagreusField_2299" },
	-- 		-- Oh this isn't a waste of time at all!
	-- 		{ Cue = "/VO/ZagreusField_2300" },
	-- 	},
	-- 	-- Path B
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.85,
	-- 		-- Why do you keep up this foolishness?
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0158", "/VO/HadesField_0363", "/VO/HadesField_0364", "/VO/HadesField_0365", "/VO/HadesField_0366" },

	-- 		-- It beats having to live within your House!
	-- 		{ Cue = "/VO/ZagreusField_2301" },
	-- 		-- You know exactly why!
	-- 		{ Cue = "/VO/ZagreusField_2302" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.75,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2301" },

	-- 		-- Would that you could be useful there from time to time!
	-- 		{ Cue = "/VO/HadesField_0159" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.75,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2302" },
	-- 		RequiredFalseTextLines = { "PersephoneFirstMeeting" },

	-- 		-- You shall never find her! She is gone!
	-- 		{ Cue = "/VO/HadesField_0160" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.65,
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0159" },

	-- 		-- You'd like that, wouldn't you?
	-- 		{ Cue = "/VO/ZagreusField_2303" },
	-- 		-- Would that you could shut up and fight!
	-- 		{ Cue = "/VO/ZagreusField_2304" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.65,
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0160" },

	-- 		-- Liar! Why should I trust a single word you say?
	-- 		{ Cue = "/VO/ZagreusField_2305" },
	-- 		-- No! She's out there. I know it!
	-- 		{ Cue = "/VO/ZagreusField_2306" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.55,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2305" },

	-- 		-- You're but a simple fool!
	-- 		{ Cue = "/VO/HadesField_0161" },
	-- 		-- All that I've told you is for your own good.
	-- 		{ Cue = "/VO/HadesField_0162" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.55,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2306" },

	-- 		-- She's gone, I say!
	-- 		{ Cue = "/VO/HadesField_0163" },
	-- 		-- You know nothing!
	-- 		{ Cue = "/VO/HadesField_0164" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.55,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2303" },

	-- 		-- You'd like to perish, wouldn't you?!
	-- 		{ Cue = "/VO/HadesField_0165" },
	-- 		-- What would you know of it!
	-- 		{ Cue = "/VO/HadesField_0166" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.55,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2304" },

	-- 		-- Oh I can do just that.
	-- 		{ Cue = "/VO/HadesField_0167" },
	-- 		-- I'll happily oblige.
	-- 		{ Cue = "/VO/HadesField_0168" },
	-- 	},
	-- 	-- Path C
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.85,
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0216", "/VO/HadesField_0367", "/VO/HadesField_0368", "/VO/HadesField_0369" },

	-- 		-- I'll show you brutish strength!
	-- 		{ Cue = "/VO/ZagreusField_2412" },
	-- 		-- Not interested in the analysis now, Father!
	-- 		{ Cue = "/VO/ZagreusField_2413" },
	-- 	},
	-- 	-- C_1
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.85,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2412" },

	-- 		-- And I'll show you the might that vanquished the Titans themselves.
	-- 		{ Cue = "/VO/HadesField_0218" },
	-- 		-- No! You're holding back, as always.
	-- 		{ Cue = "/VO/HadesField_0219" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.75,
	-- 		-- And I'll show you the might that vanquished the Titans themselves.
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0218" },

	-- 		-- I'm not afraid of you!
	-- 		{ Cue = "/VO/ZagreusField_2416", PreLineWait = 0.7 },
	-- 		-- I'll have you join them soon!
	-- 		{ Cue = "/VO/ZagreusField_2417" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.75,
	-- 		-- No! You're holding back, as always.
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0219" },

	-- 		-- Am I brutish or am I holding back? Make up your blasted mind!
	-- 		{ Cue = "/VO/ZagreusField_2418" },
	-- 		-- You want me to go all out? Then fine!
	-- 		{ Cue = "/VO/ZagreusField_2419" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2416" },

	-- 		-- You ought to be.
	-- 		{ Cue = "/VO/HadesField_0226" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2417" },

	-- 		-- You impudent...!
	-- 		{ Cue = "/VO/HadesField_0227" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2418" },

	-- 		-- I'll make you regret this.
	-- 		{ Cue = "/VO/HadesField_0228" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2419" },
	-- 		PreLineWait = 0.4,

	-- 		-- Fine!
	-- 		{ Cue = "/VO/HadesField_0229" },
	-- 	},
	-- 	-- C_2
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.55,
	-- 		-- Not interested in the analysis now, Father!
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2413" },

	-- 		-- You have no inkling of what you need.
	-- 		{ Cue = "/VO/HadesField_0220" },
	-- 		-- Oh I think it's the perfect time.
	-- 		{ Cue = "/VO/HadesField_0221" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.75,
	-- 		-- You have no inkling of what you need.
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0220" },

	-- 		-- I said shut up with the analysis!
	-- 		{ Cue = "/VO/ZagreusField_2420" },
	-- 		-- I need you to quit blathering and fight!
	-- 		{ Cue = "/VO/ZagreusField_2421" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.85,
	-- 		-- Oh I think it's the perfect time.
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0221" },

	-- 		-- Oh I disagree!
	-- 		{ Cue = "/VO/ZagreusField_2422" },
	-- 		-- Well then, let's hear it!
	-- 		{ Cue = "/VO/ZagreusField_2423" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		PreLineWait = 0.4,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2420" },

	-- 		-- Unfilial oaf!
	-- 		{ Cue = "/VO/HadesField_0235" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2421" },
	-- 		PreLineWait = 0.3,

	-- 		-- Happily.
	-- 		{ Cue = "/VO/HadesField_0231" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2422" },

	-- 		-- I thought you might!
	-- 		{ Cue = "/VO/HadesField_0232" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2423" },

	-- 		-- You'd not listen even if I did!
	-- 		{ Cue = "/VO/HadesField_0233" },
	-- 	},
	-- 	-- Path D
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.85,
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0217", "/VO/HadesField_0370", "/VO/HadesField_0371", "/VO/HadesField_0372", "/VO/HadesField_0373" },

	-- 		-- You know exactly what it's going to take!
	-- 		{ Cue = "/VO/ZagreusField_2414" },
	-- 		-- It'll take you getting out of my blasted way!
	-- 		{ Cue = "/VO/ZagreusField_2415" },
	-- 	},
	-- 	-- D_1
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.85,
	-- 		-- You know exactly what it's going to take!
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2291", "/VO/ZagreusField_2292", "/VO/ZagreusField_2294", "/VO/ZagreusField_2414" },

	-- 		-- Stubborn oaf!
	-- 		{ Cue = "/VO/HadesField_0222" },
	-- 		-- What you desire is impossible!
	-- 		{ Cue = "/VO/HadesField_0223" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		SuccessiveChanceToPlay = 0.75,
	-- 		-- Stubborn oaf!
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0222" },

	-- 		-- Miserable husk of a man!
	-- 		{ Cue = "/VO/ZagreusField_2424" },
	-- 		-- Wretched excuse for a father!
	-- 		{ Cue = "/VO/ZagreusField_2425" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.4,
	-- 		SuccessiveChanceToPlay = 0.75,
	-- 		-- What you desire is impossible!
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0223" },

	-- 		-- We'll see!
	-- 		{ Cue = "/VO/ZagreusField_2426" },
	-- 		-- Like you would know!
	-- 		{ Cue = "/VO/ZagreusField_2427" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.65,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2424" },

	-- 		-- What would you know of misery?!
	-- 		{ Cue = "/VO/HadesField_0234" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.65,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2425" },

	-- 		-- Such utter disrespect!
	-- 		{ Cue = "/VO/HadesField_0230" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.65,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2426" },

	-- 		-- We certainly shall!
	-- 		{ Cue = "/VO/HadesField_0236" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.45,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2427" },

	-- 		-- I do, you idiot!
	-- 		{ Cue = "/VO/HadesField_0237" },
	-- 	},
	-- 	-- D_2
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.4,
	-- 		ChanceToPlay = 0.85,
	-- 		-- It'll take you getting out of my blasted way!
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2415" },

	-- 		-- You cannot talk to me that way!
	-- 		{ Cue = "/VO/HadesField_0224" },
	-- 		-- No; that shall accomplish nothing.
	-- 		{ Cue = "/VO/HadesField_0225" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.3,
	-- 		SuccessiveChanceToPlay = 0.75,
	-- 		-- You cannot talk to me that way!
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0224" },

	-- 		-- Well I just did!
	-- 		{ Cue = "/VO/ZagreusField_2428" },
	-- 		-- And you cannot treat me this way!
	-- 		{ Cue = "/VO/ZagreusField_2429" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		UsePlayerSource = true,
	-- 		PreLineWait = 0.3,
	-- 		SuccessiveChanceToPlay = 0.75,
	-- 		-- No; that shall accomplish nothing.
	-- 		RequiredLastLinePlayed = { "/VO/HadesField_0225" },

	-- 		-- Let's test that theory!
	-- 		{ Cue = "/VO/ZagreusField_2530" },
	-- 		-- Oh I think it shall!
	-- 		{ Cue = "/VO/ZagreusField_2531" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.3,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		-- Well I just did!
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2428" },

	-- 		-- You won't do it again.
	-- 		{ Cue = "/VO/HadesField_0238" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.3,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		-- And you cannot treat me this way!
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2429" },

	-- 		-- I'll treat you as you deserve.
	-- 		{ Cue = "/VO/HadesField_0239" },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.3,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		-- Let's test that theory!
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2530" },

	-- 		-- Happily.
	-- 		{ Cue = "/VO/HadesField_0231" },
	-- 		-- Fine!
	-- 		{ Cue = "/VO/HadesField_0229", PreLineWait = 0.25, },
	-- 	},
	-- 	{
	-- 		RandomRemaining = true,
	-- 		PreLineWait = 0.3,
	-- 		SuccessiveChanceToPlay = 0.35,
	-- 		-- Oh I think it shall!
	-- 		RequiredLastLinePlayed = { "/VO/ZagreusField_2531" },

	-- 		-- I thought you might!
	-- 		{ Cue = "/VO/HadesField_0232" },
	-- 		-- You impudent...!
	-- 		{ Cue = "/VO/HadesField_0227", PreLineWait = 0.65 },
	-- 	},
	-- },
	-- #endregion
	-- Played when using HadesPreDamageBoon on Hades himself
	ModsNikkelMHadesBiomesHadesPreDamageHimselfVoiceLines = {
		{
			RandomRemaining = true,
			PreLineWait = 0.35,
			ObjectType = "Hades",
			{ Cue = "/VO/HadesField_0631", Text = "What?!" },
			{ Cue = "/VO/HadesField_0671", Text = "You are the prey, not me." },
			{ Cue = "/VO/HadesField_0484", Text = "It seems you need all of the help that you can get!" },
			{ Cue = "/VO/HadesField_0278", Text = "You mean to mock me with such tricks?" },
			{ Cue = "/VO/HadesField_0466", Text = "You need assistance even now?" },
			{ Cue = "/VO/HadesField_0583", Text = "I am still more than capable of besting you." },
		},
	},
	-- Ending
	HadesSighVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.9,
		AllowTalkOverTextLines = true,
		ObjectType = "NPC_Hades_Story_02",
		-- <Sigh>
		{ Cue = "/VO/HadesField_0617" },
	},
	-- #endregion
	-- #region Megaera
	MultiFuryFightStartVoiceLines = {
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.1,
			UsePlayerSource = true,
			SuccessiveChanceToPlay = 0.5,
			RequiredMinElapsedTime = 3,
			RequiredRoom = "A_Boss01",
			RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 1 },
			ObjectType = "Harpy",

			-- Come, sisters!
			{ Cue = "/VO/MegaeraField_0356", RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
			-- Now, sisters!
			{ Cue = "/VO/MegaeraField_0357", RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
			-- Prepare, sisters!
			{ Cue = "/VO/MegaeraField_0358", RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
			-- Alecto, Tisiphone, now!!
			{ Cue = "/VO/MegaeraField_0361", RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
			-- We are the Furies!!
			{ Cue = "/VO/MegaeraField_0365", RequiredSupportAINames = { "Tisiphone", "Alecto" }, },
			-- Now!
			{ Cue = "/VO/MegaeraField_0366" },
			-- Attack!
			{ Cue = "/VO/MegaeraField_0367" },
			-- Kill!
			{ Cue = "/VO/MegaeraField_0368" },
		},
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.1,
			UsePlayerSource = true,
			SuccessiveChanceToPlay = 0.5,
			RequiredMinElapsedTime = 3,
			RequiredRoom = "A_Boss02",
			RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 1 },
			ObjectType = "Harpy2",

			-- Let's go, sisters!
			{ Cue = "/VO/Alecto_0289", RequiredSupportAINames = { "Tisiphone", "Megaera" }, },
			-- Now, sisters!
			{ Cue = "/VO/Alecto_0290", RequiredSupportAINames = { "Tisiphone", "Megaera" }, },
			-- Ready, sisters!
			{ Cue = "/VO/Alecto_0292", RequiredSupportAINames = { "Tisiphone", "Megaera" }, },
			-- Ready, sisters?
			{ Cue = "/VO/Alecto_0293", RequiredSupportAINames = { "Tisiphone", "Megaera" }, },
			-- Megaera, Tisiphone, now!!
			{ Cue = "/VO/Alecto_0294", RequiredSupportAINames = { "Tisiphone", "Megaera" }, },
			-- Megaera, Tis, you ready?
			{ Cue = "/VO/Alecto_0295", RequiredSupportAINames = { "Tisiphone", "Megaera" }, },
			-- We are the Furies!!
			{ Cue = "/VO/Alecto_0299", RequiredSupportAINames = { "Tisiphone", "Megaera" }, },
			-- Now!
			{ Cue = "/VO/Alecto_0300" },
			-- Attack!
			{ Cue = "/VO/Alecto_0301" },
			-- Kill!
			{ Cue = "/VO/Alecto_0302" },
		}
	},
	-- #endregion
	-- #region Hydra/Lernie
	ModsNikkelMHadesBiomesEnteredHydraChamberVoiceLines = {
		{
			PlayOnce = true,
			PlayOnceContext = "ModsNikkelMHadesBiomesEnteredHydraChamber",
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.35,
			{ Cue = "/VO/MelinoeField_0917", Text = "{#Emph}Erm... {#Prev}hello?", },
		},
		{
			PlayOnce = true,
			PlayOnceContext = "ModsNikkelMHadesBiomesEnteredHydraEMChamber",
			BreakIfPlayed = true,
			RandomRemaining = true,
			RequiredRoom = "B_Boss02",
			PreLineWait = 0.5,
			{ Cue = "/VO/MelinoeField_3532", Text = "Covered in magma now... the Vow of Rivals caused all this?" },
		},
		{
			PlayOnce = true,
			PlayOnceContext = "ModsNikkelMHadesBiomesEnteredHydraChamberAfterEM",
			BreakIfPlayed = true,
			RandomRemaining = true,
			RequiredRoom = "B_Boss01",
			RequiredRoomLastRun = "B_Boss02",
			PreLineWait = 0.5,
			{ Cue = "/VO/MelinoeField_3537", Text = "At least that magma's gone for now...", },
		},
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.35,
			SuccessiveChanceToPlay = 0.33,
			{ Cue = "/VO/MelinoeField_0923", Text = "Heads up..." },
			{ Cue = "/VO/MelinoeField_0921", Text = "What is it you think you're guarding, {#Emph}hm?" },
			{ Cue = "/VO/MelinoeField_0926", Text = "You're very vigilant, I'll grant you that." },
			{ Cue = "/VO/MelinoeField_1904", Text = "You're in my way." },
			{ Cue = "/VO/MelinoeField_1906", Text = "Every time..." },
			{ Cue = "/VO/MelinoeField_1242", Text = "And here we go..." },
			{ Cue = "/VO/MelinoeField_2860", Text = "Oh, no...", },
		},
	},
	-- #endregion
	-- #region Thanatos
	-- ThanatosGreetingVoiceLines = {
	-- 	BreakIfPlayed = true,
	-- 	RandomRemaining = true,
	-- 	PreLineWait = 0.4,
	-- 	PlayOnceFromTableThisRun = true,

	-- 	-- Hmph.
	-- 	{ Cue = "/VO/Thanatos_0161", RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- What.
	-- 	{ Cue = "/VO/Thanatos_0183" },
	-- 	-- Well, well.
	-- 	{ Cue = "/VO/Thanatos_0188", RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- What do you need exactly.
	-- 	{ Cue = "/VO/Thanatos_0147", RequiredPlayed = { "/VO/Thanatos_0183" },                                                RequiredFalseTextLines = { "ThanatosGift07_A" } },
	-- 	-- Hmph.
	-- 	{ Cue = "/VO/Thanatos_0161", RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Hm.
	-- 	{ Cue = "/VO/Thanatos_0179", RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Yes?
	-- 	{ Cue = "/VO/Thanatos_0182", RequiredFalseTextLines = { "ThanatosGift06" },                                           RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Tsch.
	-- 	{ Cue = "/VO/Thanatos_0180", RequiredFalseTextLines = { "ThanatosGift05" },                                           RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- What?
	-- 	{ Cue = "/VO/Thanatos_0184", RequiredFalseTextLines = { "ThanatosGift05" },                                           RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- You.
	-- 	{ Cue = "/VO/Thanatos_0186", RequiredFalseTextLines = { "ThanatosGift04" },                                           RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- It's you.
	-- 	{ Cue = "/VO/Thanatos_0187", RequiredFalseTextLines = { "ThanatosGift05" },                                           RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- What's up.
	-- 	{ Cue = "/VO/Thanatos_0152", RequiredTextLines = { "ThanatosGift04" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Heh.
	-- 	{ Cue = "/VO/Thanatos_0181", RequiredTextLines = { "ThanatosGift05" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- What is it, Zag.
	-- 	{ Cue = "/VO/Thanatos_0148", RequiredTextLines = { "ThanatosGift03" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Welcome home.
	-- 	{ Cue = "/VO/Thanatos_0192", RequiredTextLines = { "ThanatosGift05" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Sorry, Zag.
	-- 	{ Cue = "/VO/Thanatos_0191", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" },       RequiresRunNotCleared = true },
	-- 	-- You all right?
	-- 	{ Cue = "/VO/Thanatos_0189", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" },       RequiresRunNotCleared = true },
	-- 	-- You OK?
	-- 	{ Cue = "/VO/Thanatos_0190", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" },       RequiresRunNotCleared = true },
	-- 	-- Hey Zag.
	-- 	{ Cue = "/VO/Thanatos_0193", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Hey.
	-- 	{ Cue = "/VO/Thanatos_0194", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Ahem.
	-- 	-- { Cue = "/VO/Thanatos_0185" },
	-- 	-- Welcome back.
	-- 	{ Cue = "/VO/Thanatos_0425", RequiredTextLines = { "ThanatosGift07_A" },                                              RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Hey Zag.
	-- 	{ Cue = "/VO/Thanatos_0426", RequiredAnyTextLines = { "BecameCloserWithThanatos01", "BecameCloserWithThanatos01_B" }, RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Hey.
	-- 	{ Cue = "/VO/Thanatos_0427", RequiredTextLines = { "ThanatosGift10" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- You're back.
	-- 	{ Cue = "/VO/Thanatos_0428", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Good work out there.
	-- 	{ Cue = "/VO/Thanatos_0429", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" },       RequiresRunCleared = true, },
	-- 	-- Well done that time.
	-- 	{ Cue = "/VO/Thanatos_0430", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" },       RequiresRunCleared = true, },
	-- 	-- Good work.
	-- 	{ Cue = "/VO/Thanatos_0431", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" },       RequiresRunCleared = true, },
	-- 	-- Heard you made it, Zag.
	-- 	{ Cue = "/VO/Thanatos_0432", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" },       RequiresRunCleared = true, },
	-- 	-- Went all the way again, huh.
	-- 	{ Cue = "/VO/Thanatos_0433", RequiredTextLines = { "ThanatosGift08" },                                                RequiredPlayed = { "/VO/Thanatos_0183" },       RequiresRunCleared = true, },
	-- 	-- Glad you're back.
	-- 	{ Cue = "/VO/Thanatos_0434", RequiredAnyTextLines = { "BecameCloserWithThanatos01", "BecameCloserWithThanatos01_B" }, RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Back in one piece.
	-- 	{ Cue = "/VO/Thanatos_0435", RequiredTextLines = { "ThanatosGift07_A" },                                              RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Over here.
	-- 	{ Cue = "/VO/Thanatos_0436", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- Hm, hello.
	-- 	{ Cue = "/VO/Thanatos_0437", RequiredTextLines = { "ThanatosGift06" },                                                RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- 	-- What's going on, Zag.
	-- 	{ Cue = "/VO/Thanatos_0438", RequiredAnyTextLines = { "BecameCloserWithThanatos01", "BecameCloserWithThanatos01_B" }, RequiredPlayed = { "/VO/Thanatos_0183" } },
	-- },
	ThanatosDeathTauntVoiceLines = {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 1.25,
		NoTarget = true,
		Source = { SubtitleColor = Color.ThanatosVoice },

		-- Time to go home.
		{ Cue = "/VO/Thanatos_0116" },
		-- Can't be helped.
		{ Cue = "/VO/Thanatos_0117" },
		-- You tried.
		{ Cue = "/VO/Thanatos_0118" },
		-- Oh, Zag...
		-- { Cue = "/VO/Thanatos_0119" },
		-- What were you thinking.
		{ Cue = "/VO/Thanatos_0120" },
		-- You're dead.
		{ Cue = "/VO/Thanatos_0121" },
		-- You're dead, Zag.
		-- { Cue = "/VO/Thanatos_0122" },
		-- You're coming with me.
		{ Cue = "/VO/Thanatos_0123" },
		-- That's it.
		{ Cue = "/VO/Thanatos_0124" },
		-- That does it.
		{ Cue = "/VO/Thanatos_0125" },
		-- Well, come along.
		{ Cue = "/VO/Thanatos_0126" },
		-- You had this coming.
		{ Cue = "/VO/Thanatos_0127" },
		-- What did you expect.
		{ Cue = "/VO/Thanatos_0128" },
		-- No escaping Death.
		{ Cue = "/VO/Thanatos_0129" },
		-- I have to take you back.
		{ Cue = "/VO/Thanatos_0130" },
		-- Let's go home.
		{ Cue = "/VO/Thanatos_0131" },
		-- Let's go, Zag.
		-- { Cue = "/VO/Thanatos_0132" },
		-- We're heading home.
		{ Cue = "/VO/Thanatos_0133" },
		-- There is no escape.
		{ Cue = "/VO/Thanatos_0134" },
		-- Time to die.
		{ Cue = "/VO/Thanatos_0135" },
		-- Blood and darkness.
		{ Cue = "/VO/Thanatos_0136" },
		-- In the name of Hades.
		{ Cue = "/VO/Thanatos_0137" },
		-- Death has come.
		{ Cue = "/VO/Thanatos_0138" },
		-- Not this time.
		{ Cue = "/VO/Thanatos_0139" },
		-- I'm sorry.
		{ Cue = "/VO/Thanatos_0140" },
		-- I have to take you now.
		{ Cue = "/VO/Thanatos_0141" },
		-- It's over.
		{ Cue = "/VO/Thanatos_0142" },
		-- You're finished.
		{ Cue = "/VO/Thanatos_0143" },
		-- You brought this on yourself.
		{ Cue = "/VO/Thanatos_0144" },
		-- Your luck's run out.
		{ Cue = "/VO/Thanatos_0145" },
		-- Nothing I can do.
		{ Cue = "/VO/Thanatos_0146" },
	},
	ThanatosSpecialExitVoiceLines = {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 1.5,
		Source = { SubtitleColor = game.Color.ThanatosVoice },
		AllowTalkOverTextLines = true,
		-- Bye, Zag.
		{ Cue = "/VO/ThanatosField_0236" },
	},
	-- #endregion
	-- #region Patroclus
	PatroclusGreetingLines = {
		Queue = "Interrupt",
		Cooldowns =
		{
			{ Name = "PatroclusGreetedRecently", Time = 30 },
		},
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineAnim = "AchillesIdleGreeting",
			ObjectType = "NPC_Achilles_Story_01",
			SuccessiveChanceToPlay = 0.5,

			-- Why, look who.
			{ Cue = "/VO/Achilles_0222" },
			-- Hah, haha.
			{ Cue = "/VO/Achilles_0223", RequiredPlayed = { "/VO/Achilles_0222" } },
			-- Hello, lad.
			-- { Cue = "/VO/Achilles_0224", RequiredPlayed = { "/VO/Achilles_0222" } },
			-- Look, Pat.
			{ Cue = "/VO/Achilles_0225", RequiredPlayed = { "/VO/Achilles_0222" } },
			-- We've a guest.
			{ Cue = "/VO/Achilles_0226", RequiredPlayed = { "/VO/Achilles_0222" } },
			-- Ah, you're here.
			{ Cue = "/VO/Achilles_0227", RequiredPlayed = { "/VO/Achilles_0222" } },
			-- How goes it, lad?
			-- { Cue = "/VO/Achilles_0228", RequiredPlayed = { "/VO/Achilles_0222" } },
			-- Come all this way, huh.
			{ Cue = "/VO/Achilles_0229", RequiredPlayed = { "/VO/Achilles_0222" } },
		},
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },
			ObjectType = "NPC_Patroclus_01",

			-- Oh.
			{ Cue = "/VO/Patroclus_0152", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- Although...
			{ Cue = "/VO/Patroclus_0153", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- But anyway...
			{ Cue = "/VO/Patroclus_0155", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- ...Ah.
			{ Cue = "/VO/Patroclus_0156", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- ...You.
			{ Cue = "/VO/Patroclus_0157", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- Well...
			{ Cue = "/VO/Patroclus_0158" },
			-- <Chuckle>
			{ Cue = "/VO/Patroclus_0076", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- <Chuckle>
			{ Cue = "/VO/Patroclus_0342", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- Hrn?
			{ Cue = "/VO/Patroclus_0333", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- Eh...
			{ Cue = "/VO/Patroclus_0334", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- Heh...
			{ Cue = "/VO/Patroclus_0335", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- Hm.
			{ Cue = "/VO/Patroclus_0336", RequiredPlayed = { "/VO/Patroclus_0158" } },
			-- Ah yes.
			{ Cue = "/VO/Patroclus_0337", RequiredPlayed = { "/VO/Patroclus_0158" } },
		},
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			RequiredTextLines = { "MyrmidonReunionQuestComplete" },
			ObjectType = "NPC_Patroclus_01",
			IsIdAlive = 563036,
			SuccessiveChanceToPlayAll = 0.25,

			-- Achilles, look.
			{ Cue = "/VO/Patroclus_0227", },
			-- We have a visitor.
			{ Cue = "/VO/Patroclus_0228" },
			-- Here comes our guest.
			{ Cue = "/VO/Patroclus_0229" },
		},
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			RequiredTextLines = { "MyrmidonReunionQuestComplete" },
			ObjectType = "NPC_Patroclus_01",
			SuccessiveChanceToPlay = 0.66,

			-- You're back.
			{ Cue = "/VO/Patroclus_0220" },
			-- You're back, stranger.
			{ Cue = "/VO/Patroclus_0221" },
			-- Ah.
			{ Cue = "/VO/Patroclus_0222" },
			-- Oh.
			{ Cue = "/VO/Patroclus_0223" },
			-- Welcome back.
			{ Cue = "/VO/Patroclus_0224" },
			-- You're back.
			{ Cue = "/VO/Patroclus_0225" },
			-- It's you.
			{ Cue = "/VO/Patroclus_0226" },
			-- Well, look who.
			{ Cue = "/VO/Patroclus_0230" },
			-- Stranger.
			{ Cue = "/VO/Patroclus_0231" },
			-- Stranger...!
			{ Cue = "/VO/Patroclus_0232" },
			-- Hello again.
			{ Cue = "/VO/Patroclus_0233" },
		},
	},
	PatroclusMutteringLines = {
		{
			{
				PlayOnce = true,
				RandomRemaining = true,
				Queue = "Interrupt",
				PreLineWait = 0.75,
				-- SuccessiveChanceToPlayAll = 0.25,
				IsIdAlive = 563036,
				-- SubtitleMinDistance = 1300,
				ObjectType = "NPC_Achilles_Story_01",

				-- ...and then, when that pig-headed braggart ordered me to do it, I swear...
				{ Cue = "/VO/Achilles_0260" },
			},
			{
				PlayOnce = true,
				BreakIfPlayed = true,
				RandomRemaining = true,
				Queue = "Interrupt",
				PreLineWait = 0.7,
				-- SuccessiveChanceToPlayAll = 0.25,
				IsIdAlive = 563036,
				-- SubtitleMinDistance = 1300,
				ObjectType = "NPC_Achilles_Story_01",
				RequiredFalsePlayedThisRoom = { "/VO/Achilles_0222" },

				-- ...were it not for you, Pat, I don't even like to think about what I'd have done. The war would have gone differently, then, I suppose.
				{ Cue = "/VO/Achilles_0353" },
			},
		},
		{
			-- after reunion
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				Queue = "Interrupt",
				PreLineWait = 0.75,
				-- SuccessiveChanceToPlayAll = 0.5,
				-- SubtitleMinDistance = 1300,
				RequiredFalsePlayedThisRoom = { "/VO/Achilles_0260" },
				IsIdAlive = 563036,

				-- ...hahaha, that was an amazing day, indeed.
				{ Cue = "/VO/Patroclus_0304", PreLineWait = 1.0, BreakIfPlayed = true, },
				-- ...a moment, we have other company, I think.
				{ Cue = "/VO/Patroclus_0305", PreLineWait = 1.0, BreakIfPlayed = true, },
				-- ...oh, I am not so certain about that, are you quite sure?
				{ Cue = "/VO/Patroclus_0306", PreLineWait = 1.0 },
				-- ...come now, I don't think that's anything to be concerned about.
				{ Cue = "/VO/Patroclus_0307", PreLineWait = 1.0 },
				-- ...always the stubbornness, well, fine, have it your way...!
				{ Cue = "/VO/Patroclus_0308", PreLineWait = 1.0 },
				-- ...isn't fear for the weak, my friend?
				{ Cue = "/VO/Patroclus_0309", PreLineWait = 1.0 },
				-- ...haha, wait, my friend, someone is here.
				{ Cue = "/VO/Patroclus_0310", PreLineWait = 1.0 },
				-- ...hahaha, oh, it seems we have a visitor.
				{ Cue = "/VO/Patroclus_0311", PreLineWait = 1.0 },
				-- ...hahaha, someone's coming, wait...
				{ Cue = "/VO/Patroclus_0312", PreLineWait = 1.0 },
				-- ...mm, but it would seem we have a visitor, don't we?
				{ Cue = "/VO/Patroclus_0313", PreLineWait = 1.0 },
				-- ...though, look there, that's your ward approaching, no?
				{ Cue = "/VO/Patroclus_0314", PreLineWait = 1.0 },
			},
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				Queue = "Interrupt",
				PreLineWait = 0.75,
				-- SuccessiveChanceToPlayAll = 0.5,
				-- SubtitleMinDistance = 1300,
				IsIdAlive = 563036,

				ObjectType = "NPC_Achilles_Story_01",
				SuccessiveChanceToPlay = 0.5,

				-- More than quite sure, indeed!
				{ Cue = "/VO/Achilles_0261", RequiredPlayedThisRoom = { "/VO/Patroclus_0306" }, },
				-- Well I suppose you're right.
				{ Cue = "/VO/Achilles_0262", RequiredPlayedThisRoom = { "/VO/Patroclus_0307" }, },
				-- Oh, come on, you can fight better than that.
				{ Cue = "/VO/Achilles_0263", RequiredPlayedThisRoom = { "/VO/Patroclus_0308" }, },
				-- Indeed it is, you're right.
				{ Cue = "/VO/Achilles_0264", RequiredPlayedThisRoom = { "/VO/Patroclus_0309" }, },
				-- You're right!
				{ Cue = "/VO/Achilles_0265", RequiredPlayedThisRoom = { "/VO/Patroclus_0310" }, },
				-- We do.
				{ Cue = "/VO/Achilles_0266", RequiredPlayedThisRoom = { "/VO/Patroclus_0311" }, },
				-- Ah, yes.
				{ Cue = "/VO/Achilles_0267", RequiredPlayedThisRoom = { "/VO/Patroclus_0312" }, },
				-- Indeed!
				{ Cue = "/VO/Achilles_0268", RequiredPlayedThisRoom = { "/VO/Patroclus_0313" }, },
				-- I do believe it is!
				{ Cue = "/VO/Achilles_0269", RequiredPlayedThisRoom = { "/VO/Patroclus_0314" }, },
			},
			-- after reunion
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				Queue = "Interrupt",
				PreLineWait = 0.75,
				SuccessiveChanceToPlayAll = 0.5,
				-- SubtitleMinDistance = 1300,
				RequiredTextLines = { "MyrmidonReunionQuestComplete" },
				AreIdsNotAlive = { 563036 },

				-- ...We were invincible, together, weren't we? Though, I have never missed those days...
				{ Cue = "/VO/Patroclus_0295", PreLineWait = 1.0 },
				-- ...I thought that I was lost, just... wandering, but, not even moving, just... being here...
				{ Cue = "/VO/Patroclus_0296", PreLineWait = 1.0 },
				-- ...When is he going to return again, it's been a bit too long...
				{ Cue = "/VO/Patroclus_0297", PreLineWait = 1.0 },
				-- ...That blasted god, I hope that he is treating you with every due respect...
				{ Cue = "/VO/Patroclus_0298", PreLineWait = 1.0 },
				-- ...Who would have ever guessed, that someday we would meet again, within this place...
				{ Cue = "/VO/Patroclus_0299", PreLineWait = 1.0 },
				-- ...I wonder where you are... presiding over some proud hall somewhere...
				{ Cue = "/VO/Patroclus_0300", PreLineWait = 1.0 },
				-- ...Let's see, the glade looks nice and orderly of late, I guess...
				{ Cue = "/VO/Patroclus_0301", PreLineWait = 1.0 },
				-- ...We've all the rest of time together, now... the Fates were gentle with us, after all...
				{ Cue = "/VO/Patroclus_0302", PreLineWait = 1.0 },
				-- ...The fish are positively teeming, aren't they?
				{ Cue = "/VO/Patroclus_0303", PreLineWait = 1.0, RequiresFishingPointInRoom = true },
			},
			-- before reunion
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				Queue = "Interrupt",
				PreLineWait = 0.75,
				SuccessiveChanceToPlayAll = 0.25,
				-- SubtitleMinDistance = 1300,
				RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" },

				{ Cue = "/VO/Patroclus_0144" },
				{ Cue = "/VO/Patroclus_0145" },
				{ Cue = "/VO/Patroclus_0146" },
				{ Cue = "/VO/Patroclus_0147" },
				{ Cue = "/VO/Patroclus_0148" },
				{ Cue = "/VO/Patroclus_0149" },
				{ Cue = "/VO/Patroclus_0150" },
				{ Cue = "/VO/Patroclus_0151" },
				-- ...To think, he could have... none of this, it didn't have to be....
				{ Cue = "/VO/Patroclus_0030", PreLineWait = 1.4 },
				-- ...He was always, you were always such a stubborn fool...
				{ Cue = "/VO/Patroclus_0031", PreLineWait = 1.4 },
				-- ...Why was I brought here, to be left alone? Where did you go... what did you do?
				{ Cue = "/VO/Patroclus_0032", PreLineWait = 1.4 },
				-- ...You're wallowing away somewhere, the same as I, but where...? And why not here...?
				{ Cue = "/VO/Patroclus_0033", PreLineWait = 1.4 },
				-- ...So then, I'll just keep waiting here, I guess. No time to lose, hahaha.
				{ Cue = "/VO/Patroclus_0034", PreLineWait = 1.4 },
				-- ...But you must hate me so, to have abandoned me among these noble champions and kings....
				{ Cue = "/VO/Patroclus_0035", PreLineWait = 1.4 },
				-- ...Truly must the gods despise us, each in turn, to have divided us like this...
				{ Cue = "/VO/Patroclus_0036", PreLineWait = 1.4 },
				-- ...What we were once, I wonder if it's but a falsely ringing memory of mine...
				{ Cue = "/VO/Patroclus_0037", PreLineWait = 1.4 },
				-- ...It's all forgettable, with just a single drink, and yet, I always hesitate...
				{ Cue = "/VO/Patroclus_0289", PreLineWait = 1.4 },
				-- ...Where are you now, I wonder, and what thoughts are running through your mind...?
				{ Cue = "/VO/Patroclus_0290", PreLineWait = 1.4 },
				-- ...So damned obstinate, about every detail... always so unyielding, to your doom...
				{ Cue = "/VO/Patroclus_0291", PreLineWait = 1.4 },
				-- ...The Fates decided this for us, I guess, and so... who are we to complain...?
				{ Cue = "/VO/Patroclus_0292", PreLineWait = 1.4 },
				-- ...What more could I have even done? Could I have swayed you, any other way? I tried, with all my might, with all my heart, you must know that, and still, it never was enough...
				{ Cue = "/VO/Patroclus_0293", PreLineWait = 1.4 },
				-- ...You chose to die in glory, not to live in peace... and all for what? Such a waste, all for your foolish pride, that you should care more to be remembered by those you shall never know than to be loved...
				{ Cue = "/VO/Patroclus_0294", PreLineWait = 1.4 },
			},
		},
	},
	-- #endregion
	-- #region Theseus
	TheseusWrathActivationVoiceLines = {
		RandomRemaining = true,
		PreLineWait = 0.1,
		CooldownTime = 40,
		CooldownName = "TheseusWrathLinesPlayedRecently",

		-- Olympians! Aid us against this fiend!
		{ Cue = "/VO/Theseus_0088", RequiredAnyUnitAlive = { "Minotaur", "Minotaur2" }, },
		-- Olympians, I call upon your aid!
		{ Cue = "/VO/Theseus_0089" },
		-- Gods of Olympus, I shall stop this monster!
		{ Cue = "/VO/Theseus_0090" },
		-- Gods above, lend me your strength!
		{ Cue = "/VO/Theseus_0091" },
		-- Gods, grant me your power!
		{ Cue = "/VO/Theseus_0092" },
		-- By the power of Olympus!!
		{ Cue = "/VO/Theseus_0093" },
		-- Witness the power of the gods!!
		{ Cue = "/VO/Theseus_0094" },
		-- Gods on high, attend me!!
		{ Cue = "/VO/Theseus_0095" },
		-- Olympus, I invoke your aid!
		{ Cue = "/VO/Theseus_0450" },
		-- Olympus, I require your assistance, now!
		{ Cue = "/VO/Theseus_0451", RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 3 }, },
		-- Olympus, help me, please!
		{ Cue = "/VO/Theseus_0452", RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 3 }, },
		-- Olympus, please avenge my chariot!
		{ Cue = "/VO/Theseus_0453", RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 3 }, },
		-- Olympus, vengeance for the Macedonian!!
		{ Cue = "/VO/Theseus_0454", RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 3 }, },
		-- Olympus, 'tis my time of need!
		{ Cue = "/VO/Theseus_0455", RequiredMinActiveMetaUpgradeLevel = { Name = "BossDifficultyShrineUpgrade", Count = 3 }, },
	},
	TheseusChariotRuinedVoiceLines = {
		Queue = "Interrupt",
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 2.0,
			SuccessiveChanceToPlay = 0.02,
			ObjectType = "Theseus2",

			-- Gah, my chariot! You filth!
			{ Cue = "/VO/Theseus_0305" },
		},
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 2.0,
			RequiredPlayed = { "/VO/Theseus_0305" },
			ObjectType = "Theseus2",

			-- Ungh, my... no!!
			{ Cue = "/VO/Theseus_0304" },
			-- Urngh, why, you!!
			{ Cue = "/VO/Theseus_0306" },
			-- Augh, no, it's ruined!!
			{ Cue = "/VO/Theseus_0307" },
			-- Nrrh I'll make you pay for this!!
			{ Cue = "/VO/Theseus_0308" },
			-- Guh, that -- you!!
			{ Cue = "/VO/Theseus_0309" },
			-- Wha, how, you!!
			{ Cue = "/VO/Theseus_0310" },
			-- My, my, my! No!!
			{ Cue = "/VO/Theseus_0311" },
			-- Chariot!! I shall avenge you!
			{ Cue = "/VO/Theseus_0312" },
			-- Noooo!!
			{ Cue = "/VO/Theseus_0313" },
			-- Augh, drat!!
			{ Cue = "/VO/Theseus_0314" },
			-- No! What depths you stoop to, fiend!!
			{ Cue = "/VO/Theseus_0315" },
			-- How dare you, monster!
			{ Cue = "/VO/Theseus_0316" },
			-- I shall get you for this!!
			{ Cue = "/VO/Theseus_0317" },
			-- Wha, why did it explode?!
			{ Cue = "/VO/Theseus_0318" },
			-- The Macedonian!!
			{ Cue = "/VO/Theseus_0319" },
			-- Another priceless chariot?!
			{ Cue = "/VO/Theseus_0320" },
			-- No, not again!!
			{ Cue = "/VO/Theseus_0321" },
			-- No!! I'd just completed the repairs!
			{ Cue = "/VO/Theseus_0322" },
			-- Again you did this to me?!
			{ Cue = "/VO/Theseus_0323" },
			-- My chariot may be gone, but we shall rise again!
			{ Cue = "/VO/Theseus_0324" },
			-- Gah, no!
			{ Cue = "/VO/Theseus_0325" },
			-- How many times?!
			{ Cue = "/VO/Theseus_0326" },
			-- My chariot, again?!
			{ Cue = "/VO/Theseus_0327" },
			-- The Macedonian, destroyed?!
			{ Cue = "/VO/Theseus_0328" },
		},
	},
	-- #endregion
	-- #region Charon/ForbiddenShopItem/BossCharon
	-- Custom: Replaced Charon_ with Megaera_1
	CharonSurprisedVoiceLines = {
		Queue = "Interrupt",
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			ObjectType = "NPC_Charon_01",
			PreLineWait = 0.1,
			Cooldowns = {
				{ Name = "CharonSurprisedSpeech", Time = 10 },
			},
			-- Hoh?
			{ Cue = "/VO/Megaera_10052" },
			-- Hrn?
			{ Cue = "/VO/Megaera_10053" },
			-- Hehh?
			{ Cue = "/VO/Megaera_10054" },
			-- Hraugh!
			{ Cue = "/VO/Megaera_10055" },
			-- Nrraugh?!
			{ Cue = "/VO/Megaera_10068" },
			-- Hrrngh?!
			{ Cue = "/VO/Megaera_10069" },
			-- Haaah?!
			{ Cue = "/VO/Megaera_10070" },
			-- Rraah!!
			{ Cue = "/VO/Megaera_10071" },
			-- Hrrnn!!
			{ Cue = "/VO/Megaera_10072" },
		},
	},
	EnteredCharonFightVoiceLines = {
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			UsePlayerSource = true,
			PlayOnce = true,
			PlayOnceContext = "ModsNikkelMHadesBiomes_EnteredCharonFightFirstTime",
			{ Cue = "/VO/MelinoeField_0173", Text = "Oh no.", },
		},
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlay = 0.66,
			UsePlayerSource = true,
			GameStateRequirements = {
				{
					PathFalse = { "CurrentRun", "CurrentRoom", "SpeechRecord", "/VO/MelinoeField_0173" },
				},
			},
			{ Cue = "/VO/MelinoeField_0173", Text = "Oh no.", },
			{ Cue = "/VO/MelinoeField_5000", Text = "Hi there...!", },
			{ Cue = "/VO/MelinoeField_5001", Text = "{#Emph}Raaah!", },
			{ Cue = "/VO/MelinoeField_5006", Text = "...Hi.", },
		},
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlay = 0.66,
			ObjectType = "Charon",
			-- Harrhh...!
			{ Cue = "/VO/Megaera_10028" },
			-- Hrraahh...!
			{ Cue = "/VO/Megaera_10029" },
			-- Hrrrr...!
			{ Cue = "/VO/Megaera_10030" },
			-- Nrrrrhhh...!
			{ Cue = "/VO/Megaera_10031" },
			-- Hmmmm....!
			{ Cue = "/VO/Megaera_10032" },
			-- Guuhhhh...
			{ Cue = "/VO/Megaera_10033" },
			-- Heehhhh...
			{ Cue = "/VO/Megaera_10034" },
			-- Mrrrrnnn....
			{ Cue = "/VO/Megaera_10035" },
		},
	},
	-- #endregion
	-- #region Sisyphus / Bouldy
	BlessedByBouldyVoiceLines = {
		{
			RandomRemaining = true,
			PreLineWait = 1.13,
			UsePlayerSource = true,
			SuccessiveChanceToPlayAll = 0.8,

			-- I, uh... OK!
			{ Cue = "/VO/ZagreusField_2808" },
			-- Well then!
			{ Cue = "/VO/ZagreusField_2809" },
			-- I see!
			{ Cue = "/VO/ZagreusField_2810" },
			-- Well, cheers!
			{ Cue = "/VO/ZagreusField_2811" },
			-- Enlightening!
			{ Cue = "/VO/ZagreusField_2812" },
			-- All right!
			{ Cue = "/VO/ZagreusField_2813", RequiredFalsePlayedThisRoom = { "/VO/ZagreusField_2813" }, },
			-- Fair enough!
			{ Cue = "/VO/ZagreusField_2814" },
			-- OK!
			{ Cue = "/VO/ZagreusField_2951" },
			-- OK?
			{ Cue = "/VO/ZagreusField_2952" },
			-- Indeed.
			{ Cue = "/VO/ZagreusField_2953" },
			-- Well...?
			{ Cue = "/VO/ZagreusField_2954" },
			-- Good chat!
			{ Cue = "/VO/ZagreusField_2955" },
			-- Pleasure!
			{ Cue = "/VO/ZagreusField_2956" },
			-- Huh.
			{ Cue = "/VO/ZagreusField_2957" },
			-- Thanks?
			{ Cue = "/VO/ZagreusField_2958" },
			-- Thanks!
			{ Cue = "/VO/ZagreusField_2959", RequiredFalsePlayedThisRoom = { "/VO/ZagreusField_2959" }, },
			-- Cheers?
			{ Cue = "/VO/ZagreusField_2960" },
			-- Cheers!
			{ Cue = "/VO/ZagreusField_2961" },
			-- A pleasure!
			{ Cue = "/VO/ZagreusField_4225", RequiredFalsePlayedThisRoom = { "/VO/ZagreusField_4225" }, },
			-- Well, see you!
			{ Cue = "/VO/ZagreusField_4226" },
			-- Good chat!
			{ Cue = "/VO/ZagreusField_4227" },
			-- Brilliant!
			{ Cue = "/VO/ZagreusField_4228" },
			-- That's that!
			{ Cue = "/VO/ZagreusField_4229" },
		},
		{
			ObjectType = "NPC_Sisyphus_01",
			RequiredUnitAlive = "NPC_Sisyphus_01",
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.45,
			SuccessiveChanceToPlay = 0.65,
			RequiresInRun = true,
			RequiredKillEnemiesNotFound = true,
			-- Custom!
			RequiredFalseTextLinesThisRun = { "ModsNikkelMHadesBiomes_BouldyFirstMeeting" },

			-- Bouldy is much obliged!
			{ Cue = "/VO/Sisyphus_0356" },
			-- Thanks on behalf of Bouldy there!
			{ Cue = "/VO/Sisyphus_0357" },
			-- Look how happy Bouldy is!
			{ Cue = "/VO/Sisyphus_0358" },
			-- That's one good rock, isn't he, Prince!
			-- { Cue = "/VO/Sisyphus_0359", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- You've Bouldy's favor, Prince!
			-- { Cue = "/VO/Sisyphus_0360", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- I think he likes you!
			{ Cue = "/VO/Sisyphus_0361" },
			-- Bouldy is grateful.
			{ Cue = "/VO/Sisyphus_0362" },
			-- Your offering has been accepted, Prince!
			-- { Cue = "/VO/Sisyphus_0363", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- I'm sure he's grateful, Prince.
			-- { Cue = "/VO/Sisyphus_0364", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- That's good of you, Prince Z.!
			-- { Cue = "/VO/Sisyphus_0365", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
			-- Bouldy has got you covered!
			{ Cue = "/VO/Sisyphus_0366" },
			-- See that, Bouldy?
			{ Cue = "/VO/Sisyphus_0367" },
			-- Think Bouldy's warming up to you!
			{ Cue = "/VO/Sisyphus_0368" },
			-- Bouldy's a good listener isn't he!
			{ Cue = "/VO/Sisyphus_0369" },
			-- You have been blessed by Bouldy!
			{ Cue = "/VO/Sisyphus_0370" },
			-- Bouldy appreciated that!
			{ Cue = "/VO/Sisyphus_0463" },
			-- Oh, look how happy Bouldy is!
			{ Cue = "/VO/Sisyphus_0464" },
			-- You're most gracious, Prince Z.
			{ Cue = "/VO/Sisyphus_0465" },
			-- You see that, Bouldy?
			{ Cue = "/VO/Sisyphus_0466" },
			-- You two have a real thing going!
			{ Cue = "/VO/Sisyphus_0467" },
			-- Bouldy's got your back.
			{ Cue = "/VO/Sisyphus_0468" },
		},
	},
	-- #endregion
	-- #region Persephone/Ending/Surface
	PersephoneFirstMeetingIntermissionVoiceLines = {
		{
			PreLineWait = 0.35,
			UsePlayerSource = true,
			AllowTalkOverTextLines = true,
			-- Mother...!
			{ Cue = "/VO/ZagreusField_3605" },
		}
	},
	SurfaceBoatSightedVoiceLines = {
		{
			PreLineWait = 2.35,
			UsePlayerSource = true,
			AllowTalkOverTextLines = true,
			-- Charon?!
			{ Cue = "/VO/ZagreusField_3672" },
		},
		{
			ObjectType = "NPC_Charon_01",
			AllowTalkOverTextLines = true,
			-- Custom: Using Hades II animation
			PreLineAnim = "Charon_Greeting",
			-- Custom: Using Hades II voiceline
			-- Hrrm...
			{ Cue = "/VO/Charon_0034", Text = "{#Emph}Hrrm..." },
		},
	},
	StartingBoatRideVoiceLines = {
		{
			PreLineWait = 21.5,
			UsePlayerSource = true,
			SkipAnim = true,
			-- Wait, isn't this... Eurydice and Orpheus?
			{ Cue = "/VO/ZagreusField_3676", }, -- RequiredTextLines = { "EurydiceAboutOrpheus03" } },
			-- Wait, isn't this Orpheus?
			-- { Cue = "/VO/ZagreusField_3677", RequiredFalseTextLines = { "EurydiceAboutOrpheus03" } },
		},
		{
			PreLineWait = 4,
			ObjectType = "ModsNikkelMHadesBiomes_NPC_Persephone_01",
			SkipAnim = true,
			-- Snow everywhere... Mother...
			-- Replace Persephone_ with Megaera_2
			{ Cue = "/VO/Megaera_20098" },
		},
	},
	SunriseOverlookVoiceLines = {
		BreakIfPlayed = true,
		PreLineWait = 2.8,
		UsePlayerSource = true,
		PlayOnce = true,
		RequiredTrueFlags = { "Overlook" },

		-- Wha, that thing, that's... the sun...
		{ Cue = "/VO/ZagreusField_3592", PlayOnce = true,                              PreLineWait = 5.6 },
		-- So... bright... ugh...
		{ Cue = "/VO/ZagreusField_3595", RequiredPlayed = { "/VO/ZagreusField_3592" }, PreLineWait = 6.0 },
		-- It's... I...
		{ Cue = "/VO/ZagreusField_4695", RequiredPlayed = { "/VO/ZagreusField_3592" }, PreLineWait = 6.0 },
		-- So much water... Uncle Poseidon's realm
		{ Cue = "/VO/ZagreusField_3593", RequiredPlayed = { "/VO/ZagreusField_3592" }, },
		-- Mother isn't far...
		{ Cue = "/VO/ZagreusField_3594", RequiredPlayed = { "/VO/ZagreusField_3592" }, },
		-- Huh... to see this each day...
		{ Cue = "/VO/ZagreusField_4694", RequiredPlayed = { "/VO/ZagreusField_3592" }, },
		-- ...Beautiful...
		{ Cue = "/VO/ZagreusField_4696", RequiredPlayed = { "/VO/ZagreusField_3592" }, PreLineWait = 6.2 },
		-- ...The Sun...
		{ Cue = "/VO/ZagreusField_4697", RequiredPlayed = { "/VO/ZagreusField_3592" }, PreLineWait = 6.0 },
		-- ...The Sun... Helios...
		{ Cue = "/VO/ZagreusField_4698", RequiredPlayed = { "/VO/ZagreusField_4697" }, PreLineWait = 6.0, RequiredTextLines = { "DemeterAboutHelios01" } },
	},
	StorytellerEndingVoiceLines = {
		{
			PreLineWait = 1.2,
			NoTarget = true,
			-- Thus was Hades, feared ruler of the dead, reunited with his long-lost bride, Persephone, the Queen; and, together with their firstborn son, Prince Zagreus, they would go on to reign eternally beneath the Earth, in relative harmony.
			{ Cue = "/VO/Megaera_00340",    SubtitleColor = game.Color.NarratorVoice, },
			-- The Queen's return marked an occasion of enthusiastic joy... so much as possible, in that dark, gloom-filled realm of the dead.
			{ Cue = "/VO/Megaera_00341",    SubtitleColor = game.Color.NarratorVoice,                                                                                                                                                                           PreLineWait = 1 },
			-- And, even after all this time, Olympus never did discover what transpired there in the Underworld.
			-- { Cue = "/VO/Megaera_00342", SubtitleColor = Color.NarratorVoice, PreLineWait = 1 },
			{ Cue = "/VO/Storyteller_0097", Text = "{#Emph}One rightly may imagine that this tale has a very thrilling end; although I am afraid for now, that we are out of Time.",                                                                            TextLimit = 300, PreLineWait = 0.8, NoTarget = true },
			{ Cue = "/VO/Storyteller_0180", Text = "{#Emph}So lifelike was the nightmare tormenting the Princess of the Dead that she was very much surprised to learn that it was all a dream! Merely a dream, from which she shall awaken any moment now...", TextLimit = 300, PreLineWait = 0.8, NoTarget = true },
		},
	},
	-- #endregion
	-- #region Survival Encounters
	SurvivalEncounterStartVoiceLines = {
		{
			RandomRemaining = true,
			PreLineWait = 0.85,
			NoTarget = true,
			RequiredFalseBiome = "Styx",

			-- You truly are an idiot, aren't you.
			{ Cue = "/VO/Intercom_0057", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" }, RequiredFalseTextLines = { "Ending01" }, },
			-- Don't make me laugh.
			{ Cue = "/VO/Intercom_0060", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Do not so much as think about it.
			{ Cue = "/VO/Intercom_0041", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- I do not think so, boy.
			-- { Cue = "/VO/Intercom_0043", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Who dares?
			{ Cue = "/VO/Intercom_0096", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- You dare?
			{ Cue = "/VO/Intercom_0097", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Thief!
			{ Cue = "/VO/Intercom_0098", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Interloper!
			{ Cue = "/VO/Intercom_0099" },
			-- You shall pay for that!
			{ Cue = "/VO/Intercom_0100", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- You shall regret this.
			{ Cue = "/VO/Intercom_0101", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" }, RequiredFalseTextLines = { "Ending01" }, },
			-- That is private property.
			{ Cue = "/VO/Intercom_0102", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- We have an intruder.
			{ Cue = "/VO/Intercom_0103" },
			-- Trespasser!
			{ Cue = "/VO/Intercom_0104" },
			-- Transgressions are not tolerated.
			{ Cue = "/VO/Intercom_0105", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Consider this a warning.
			{ Cue = "/VO/Intercom_0106", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- We have a pest problem.
			{ Cue = "/VO/Intercom_0107" },
			-- Death is inescapable.
			{ Cue = "/VO/Intercom_0226", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- You cannot escape.
			{ Cue = "/VO/Intercom_0227", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- That is far enough.
			{ Cue = "/VO/Intercom_0228", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Wretches of the Underworld, this is your chance.
			{ Cue = "/VO/Intercom_0229", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel" } },
			-- Come forth, wretches, and stop this meddler.
			{ Cue = "/VO/Intercom_0230", RequiredFalseBiome = "Elysium" },
			-- Do not presume that you escape my notice, boy.
			-- { Cue = "/VO/Intercom_0231", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- You really think you can get out of here?
			{ Cue = "/VO/Intercom_0232", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredFalseTextLines = { "Ending01" }, },
			-- Let's see if you can live through this.
			{ Cue = "/VO/Intercom_0233", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Nobody gets out of here, whether alive or dead.
			{ Cue = "/VO/Intercom_0234", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- You're out well past your curfew, boy.
			-- { Cue = "/VO/Intercom_0235", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredFalseTextLines = { "Ending01" }, },
			-- I've tolerated your impudence for long enough.
			{ Cue = "/VO/Intercom_0236", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredFalseTextLines = { "Ending01" }, },
			-- I see you there.
			{ Cue = "/VO/Intercom_0237", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- You think you can just walk away from here?
			{ Cue = "/VO/Intercom_0238", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- If I could have a minute of your time...
			{ Cue = "/VO/Intercom_0239", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Let's see your relatives upon Olympus get you out of this.
			{ Cue = "/VO/Intercom_0240", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Allow me, boy, to introduce some of my loyal subjects.
			-- { Cue = "/VO/Intercom_0241", RequiredAnyTextLines = { "HadesGift01", "HadesGift01_B" }, },
			-- You're not going anywhere.
			{ Cue = "/VO/Intercom_0242", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Champions of Elysium, now prove yourselves!
			{ Cue = "/VO/Intercom_0463", RequiredBiome = "Elysium" },
			-- Come, heroes of Elysium, and vanquish the intruder!
			{ Cue = "/VO/Intercom_0464", RequiredBiome = "Elysium" },
			-- Why you...
			{ Cue = "/VO/Intercom_0551", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- That does not belong to you.
			{ Cue = "/VO/Intercom_0552", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Again with your tampering?
			{ Cue = "/VO/Intercom_0553", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" }, RequiredPlayed = { "/VO/Intercom_0552" } },
			-- That was ill-advised.
			{ Cue = "/VO/Intercom_0554", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- What, again?
			{ Cue = "/VO/Intercom_0555", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" }, RequiredPlayed = { "/VO/Intercom_0552" } },
			-- My coffers are not yours for pillaging.
			{ Cue = "/VO/Intercom_0556", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- You thief.
			{ Cue = "/VO/Intercom_0557", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" }, RequiredFalseTextLines = { "Ending01" }, },
			-- Security!
			{ Cue = "/VO/Intercom_0558" },
			-- Halt.
			{ Cue = "/VO/Intercom_0567", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Seal the chamber.
			{ Cue = "/VO/Intercom_0568", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- There you are.
			{ Cue = "/VO/Intercom_0569", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- He's there. Get him.
			-- { Cue = "/VO/Intercom_0570", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- What's your rush, there, boy?
			-- { Cue = "/VO/Intercom_0571", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- My subjects wish to have a word with you.
			{ Cue = "/VO/Intercom_0572", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- No need to be in such a hurry, boy.
			-- { Cue = "/VO/Intercom_0573", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- I thought I'd find you here.
			{ Cue = "/VO/Intercom_0574", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- All right, wretches, get to work!
			{ Cue = "/VO/Intercom_1110" },
			-- Stop him, wretches!
			-- { Cue = "/VO/Intercom_1111" },
			-- Stop him, wretches, now!
			-- { Cue = "/VO/Intercom_1112" },
			-- You leave my troves alone!
			{ Cue = "/VO/Intercom_1113", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Those troves are not for you!
			{ Cue = "/VO/Intercom_1114", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Get your hands off my trove!
			{ Cue = "/VO/Intercom_1115", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- Wretches, take him, now!
			-- { Cue = "/VO/Intercom_1116" },
			-- Remain exactly where you are.
			{ Cue = "/VO/Intercom_1117" },
			-- I'll give these wretches not a minute more.
			{ Cue = "/VO/Intercom_1118", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" } },
			-- How foolhardy of you.
			{ Cue = "/VO/Intercom_1119" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.3,
			SuccessiveChanceToPlay = 0.2,
			RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },
			RequiredFalseBiome = "Styx",
			UsePlayerSource = true,

			-- You lot, huh?
			{ Cue = "/VO/ZagreusField_0215", PreLineWait = 4.9, },
			-- Come and get it.
			{ Cue = "/VO/ZagreusField_0217" },
			-- Let's make this quick.
			{ Cue = "/VO/ZagreusField_0218" },
			-- No time to lose.
			{ Cue = "/VO/ZagreusField_0219" },
		}
	},
	SurvivalEncounterSurvivedVoiceLines = {
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.35,
			NoTarget = true,
			RequiredFalseBiome = "Styx",

			-- Enough!
			{ Cue = "/VO/Intercom_0243" },
			-- Worthless wretches.
			{ Cue = "/VO/Intercom_0244", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Pah, useless.
			{ Cue = "/VO/Intercom_0245", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Blood and darkness.
			{ Cue = "/VO/Intercom_0246", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- They had their chance.
			{ Cue = "/VO/Intercom_0247", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- I shall deal with you later, then.
			{ Cue = "/VO/Intercom_0248", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- You lived through all of that?
			{ Cue = "/VO/Intercom_0249", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Who is going to clean all of this up?
			{ Cue = "/VO/Intercom_0250", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Idiots!
			{ Cue = "/VO/Intercom_0251", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Worthless!
			{ Cue = "/VO/Intercom_0252", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Useless!
			{ Cue = "/VO/Intercom_0253", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Damnable fools.
			{ Cue = "/VO/Intercom_0254", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- It seems I need to look for better help.
			{ Cue = "/VO/Intercom_0255", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Back to the lowest depths with them.
			{ Cue = "/VO/Intercom_0256", RequiredFalseBiome = "Elysium",                                                          RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Enough, I've better things to do.
			{ Cue = "/VO/Intercom_0257", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Kkh, you waste my time.
			{ Cue = "/VO/Intercom_0258", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- All right, break it up!
			{ Cue = "/VO/Intercom_0419", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- That's all the time we have.
			{ Cue = "/VO/Intercom_0420", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Bah, that's enough!
			{ Cue = "/VO/Intercom_0421", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Decidedly below my expectations.
			{ Cue = "/VO/Intercom_0422", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Work faster next time!
			{ Cue = "/VO/Intercom_0423", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- No more of this buffoonery!
			{ Cue = "/VO/Intercom_0424", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- I expected more from the Exalted.
			{ Cue = "/VO/Intercom_0465", RequiredBiome = "Elysium",                                                               RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Disappointing for these so-called Champions.
			{ Cue = "/VO/Intercom_0466", RequiredBiome = "Elysium",                                                               RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Why do I pay these wretches.
			{ Cue = "/VO/Intercom_0559", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- That's quite enough.
			{ Cue = "/VO/Intercom_0560", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Fine, help yourself.
			{ Cue = "/VO/Intercom_0561", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" }, CooldownName = "SaidHelpRecently",        CooldownTime = 30,                       RequiredPlayed = { "/VO/Intercom_0243" } },
			-- You did not earn this, boy.
			{ Cue = "/VO/Intercom_0562", RequiredFalseEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" }, RequiredPlayed = { "/VO/Intercom_0243" }, RequiredFalseTextLines = { "Ending01" }, },
			-- Nrgh, how many times...
			{ Cue = "/VO/Intercom_0563", RequiredMinCompletedRuns = 12,                                                           RequiredPlayed = { "/VO/Intercom_0243" } },
			-- There. Satisfied?
			{ Cue = "/VO/Intercom_0564", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Ugh, why do I bother.
			{ Cue = "/VO/Intercom_0565", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- I should not be the supervisor here.
			{ Cue = "/VO/Intercom_0566", RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Fine, get out.
			{ Cue = "/VO/Intercom_0575", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Again you make a mockery of me.
			{ Cue = "/VO/Intercom_0576", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- I've no more time for this.
			{ Cue = "/VO/Intercom_0577", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Out, all of you!
			{ Cue = "/VO/Intercom_0578", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Utterly incompetent.
			{ Cue = "/VO/Intercom_0579", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- I ought have left them all in Erebus.
			{ Cue = "/VO/Intercom_0580", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- I trust they inconvenienced you at least.
			{ Cue = "/VO/Intercom_0581", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Why do I even bother.
			{ Cue = "/VO/Intercom_0582", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Every time!
			{ Cue = "/VO/Intercom_1120", RequiredPlayed = { "/VO/Intercom_0243" },                                                RequiredMinCompletedRuns = 15 },
			-- Incompetents.
			{ Cue = "/VO/Intercom_1121", RequiredPlayed = { "/VO/Intercom_0243" },                                                PlayOnce = true, },
			-- Pah. Fine, go!
			{ Cue = "/VO/Intercom_1122", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" } },
			-- Fine, go, then!
			{ Cue = "/VO/Intercom_1123", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" }, RequiredTextLines = { "Ending01" }, },
			-- Time's up!
			{ Cue = "/VO/Intercom_1124", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" }, RequiredTextLines = { "Ending01" }, },
			-- All right, all right!
			{ Cue = "/VO/Intercom_1125", RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },      RequiredPlayed = { "/VO/Intercom_0243" }, RequiredTextLines = { "Ending01" }, },
		},
		{
			RandomRemaining = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.66,
			UsePlayerSource = true,
			RequiredBiome = "Styx",

			-- Yes.
			{ Cue = "/VO/ZagreusField_1126" },
			-- Yes...!
			{ Cue = "/VO/ZagreusField_1127" },
			-- Simple.
			{ Cue = "/VO/ZagreusField_1128", RequiredMinHealthFraction = 0.6 },
			-- Easy.
			{ Cue = "/VO/ZagreusField_1129", RequiredMinHealthFraction = 0.6 },
			-- No problem.
			{ Cue = "/VO/ZagreusField_1130" },
			-- No problem!
			{ Cue = "/VO/ZagreusField_1131" },
			-- There we go.
			{ Cue = "/VO/ZagreusField_1132", },
			-- How's that?
			{ Cue = "/VO/ZagreusField_1133" },
			-- How's that!
			{ Cue = "/VO/ZagreusField_1134" },
			-- There.
			{ Cue = "/VO/ZagreusField_1135" },
			-- What do I get?
			{ Cue = "/VO/ZagreusField_1136" },
			-- Short work.
			{ Cue = "/VO/ZagreusField_1137" },
			-- Whew.
			{ Cue = "/VO/ZagreusField_1138", RequiredMaxHealthFraction = 0.4, CooldownName = "SaidWhewRecently", CooldownTime = 30 },
		}
	},
	SurvivalAboutToStartVoiceLines = {
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayOnce = true,
			PlayOnceContext = "ModsNikkelMHadesBiomesSurvivalAboutToStart",
			RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },
			{ Cue = "/VO/MelinoeField_0173", Text = "Oh no.", },
		},
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			PlayOnceFromTableThisRun = true,
			SuccessiveChanceToPlayAll = 0.5,
			RequiredEncounters = { "SurvivalTartarus", "SurvivalAsphodel", "SurvivalElysium" },
			{ Cue = "/VO/Melinoe_4314",      Text = "Again." },
			{ Cue = "/VO/MelinoeField_1118", Text = "They think they caught a live one." },
			{ Cue = "/VO/MelinoeField_0682", Text = "Ah, yes." },
			{ Cue = "/VO/MelinoeField_0683", Text = "This again." },
			{ Cue = "/VO/MelinoeField_0684", Text = "Let's begin...!" },
			{ Cue = "/VO/MelinoeField_0685", Text = "Let's go, then." },
			{ Cue = "/VO/MelinoeField_0687", Text = "I've returned." },
			{ Cue = "/VO/MelinoeField_0688", Text = "You won't stop me." },
			{ Cue = "/VO/MelinoeField_0249", Text = "You don't know who you're dealing with..." },
			{ Cue = "/VO/MelinoeField_0901", Text = "Got their attention, huh..." },
			{ Cue = "/VO/MelinoeField_0891", Text = "I've drawn them out..." },
			{ Cue = "/VO/MelinoeField_0892", Text = "They know I'm here..." },
			{ Cue = "/VO/MelinoeField_0893", Text = "Here they come..." },
			{ Cue = "/VO/MelinoeField_0895", Text = "I'm ready for you!" },
			{ Cue = "/VO/MelinoeField_0897", Text = "Incoming..." },
		},
	},
	SurvivalStartVoiceLines = {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 1.85,
		PlayOnceFromTableThisRun = true,
		SuccessiveChanceToPlayAll = 0.5,
		ExplicitRequirements = true,
		GameStateRequirements = {
			-- None
		},
		{ Cue = "/VO/Melinoe_0269",      Text = "You again.", },
		{ Cue = "/VO/Melinoe_1780",      Text = "You again.", },
		{ Cue = "/VO/Melinoe_1259",      Text = "Lost Souls, I'll lead you to your graves.", },
		{ Cue = "/VO/Melinoe_1772",      Text = "I'll send you to your graves.", },
		{ Cue = "/VO/Melinoe_0265",      Text = "I'll slay you all!", },
		{ Cue = "/VO/Melinoe_0259",      Text = "You wretches...", },
		{ Cue = "/VO/MelinoeField_4823", Text = "Face me." },
		{ Cue = "/VO/MelinoeField_4821", Text = "Who first?" },
		{ Cue = "/VO/MelinoeField_1119", Text = "All you lot against me?" },
	},
	SurvivalExpiringVoiceLines = {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 0.55,
		SuccessiveChanceToPlayAll = 0.5,
		ExplicitRequirements = true,
		GameStateRequirements = {
			-- None
		},
		-- -- Almost there...
		-- { Cue = "/VO/ZagreusField_0188" },
		-- -- Few more moments...
		-- { Cue = "/VO/ZagreusField_0189" },
		-- -- Got to hold on...
		-- { Cue = "/VO/ZagreusField_0190" },
		-- -- Almost...!
		-- { Cue = "/VO/ZagreusField_0553" },
		-- -- Just a bit longer...!
		-- { Cue = "/VO/ZagreusField_0554" },
		-- -- So close...!
		-- { Cue = "/VO/ZagreusField_0555" },
		-- -- Nearly made it...!
		-- { Cue = "/VO/ZagreusField_0556" },
		{ Cue = "/VO/MelinoeField_0598", Text = "Almost finished..." },
		{ Cue = "/VO/MelinoeField_1670", Text = "Not much time left..." },
		{ Cue = "/VO/MelinoeField_1671", Text = "Time's almost up..." },
		{ Cue = "/VO/Melinoe_1972",      Text = "The final reinforcements..." },
		{ Cue = "/VO/Melinoe_1970",      Text = "They're slowing down..." },
		{ Cue = "/VO/Melinoe_1973",      Text = "We're almost there, hold on...", },
	},
	SurvivalResolvedVoiceLines = {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 3.65,
		SuccessiveChanceToPlayAll = 0.33,
		ExplicitRequirements = true,
		GameStateRequirements = {
			-- None
		},
		-- -- Well that's better!
		-- { Cue = "/VO/ZagreusField_0191" },
		-- -- There we are.
		-- { Cue = "/VO/ZagreusField_0192" },
		-- -- Peace and quiet.
		-- { Cue = "/VO/ZagreusField_0193" },
		-- -- Finally.
		-- { Cue = "/VO/ZagreusField_0220" },
		-- -- That's that.
		-- { Cue = "/VO/ZagreusField_0221" },
		-- -- There we go.
		-- { Cue = "/VO/ZagreusField_0224" },
		-- -- Now to collect.
		-- { Cue = "/VO/ZagreusField_0222", },
		-- -- There.
		-- { Cue = "/VO/ZagreusField_0226", },
		{ Cue = "/VO/MelinoeField_3704", Text = "Whatever you were paid was not enough." },
		{ Cue = "/VO/MelinoeField_3705", Text = "Your little plan to slay me backfired." },
		{ Cue = "/VO/MelinoeField_1137", Text = "They won't be gone for long..." },
		{ Cue = "/VO/MelinoeField_1138", Text = "All banished for now..." },
		{ Cue = "/VO/Melinoe_1000",      Text = "Done." },
		{ Cue = "/VO/Melinoe_1001",      Text = "Enough." },
		{ Cue = "/VO/Melinoe_1002",      Text = "{#Emph}Whew." },
		{ Cue = "/VO/MelinoeField_0472", Text = "Let this be a message to your lord!", },
	},
	-- #endregion
	-- #region Erebus Gates/ShrineChallenges
	PerfectClearEncounterStartVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 1.25,
		NoTarget = true,
		-- Let's see if you're as skillful as you think.
		{ Cue = "/VO/Intercom_0289" },
		-- Wretches of the Underworld, take him.
		-- { Cue = "/VO/Intercom_0290" },
		-- We shall see how good you really are.
		{ Cue = "/VO/Intercom_0291" },
		-- How about a little contest, boy.
		-- { Cue = "/VO/Intercom_0292" },
		-- My wretches have come to collect.
		{ Cue = "/VO/Intercom_0293" },
		-- Let's see you avoid this.
		{ Cue = "/VO/Intercom_0294" },
		-- I have a challenge for you, boy.
		-- { Cue = "/VO/Intercom_0295" },
		-- Can you evade my wretches, boy?
		-- { Cue = "/VO/Intercom_0296" },
		-- Get him, wretches, now!
		-- { Cue = "/VO/Intercom_0297" },
		-- Time now to pay your dues.
		{ Cue = "/VO/Intercom_0298" },
		-- I'd like to see you dodge the following.
		{ Cue = "/VO/Intercom_0299" },
		-- Don't let yourself get hit, or else, boy!
		-- { Cue = "/VO/Intercom_0300" },
		-- I know where you are.
		{ Cue = "/VO/Intercom_0413" },
		-- You shall not escape.
		{ Cue = "/VO/Intercom_0414" },
		-- Where do you think you're going?
		{ Cue = "/VO/Intercom_0415" },
		-- Stop right there.
		{ Cue = "/VO/Intercom_0416" },
		-- You should know when to quit.
		{ Cue = "/VO/Intercom_0417", RequiredFalseTextLines = { "Ending01" }, },
		-- You're trapped, boy. Don't you understand?
		-- { Cue = "/VO/Intercom_0418", RequiredFalseTextLines = { "Ending01" }, },
		-- So you've returned.
		{ Cue = "/VO/Intercom_0583", RequireCurrentEncounterCompleted = true },
		-- Welcome to Erebus.
		{ Cue = "/VO/Intercom_0584" },
		-- What sort of fool goes into Erebus at will?
		{ Cue = "/VO/Intercom_0585", RequiredFalseTextLines = { "Ending01" }, },
		-- I see that you've returned.
		{ Cue = "/VO/Intercom_0586", RequireCurrentEncounterCompleted = true },
		-- One scratch and all your efforts will be lost.
		{ Cue = "/VO/Intercom_0587" },
		-- Remember not to get too nervous, boy.
		-- { Cue = "/VO/Intercom_0588" },
		-- I've a delicious onion waiting for you, boy.
		-- { Cue = "/VO/Intercom_1136", }, -- RequiredCodexEntry = { EntryName = "RoomRewardConsolationPrize", EntryIndex = 1, }, },
		-- Let's see you put your youthful reflexes to work.
		{ Cue = "/VO/Intercom_1137" },
		-- I doubt you'll outmaneuver all this lot.
		{ Cue = "/VO/Intercom_1138" },
		-- Longing for the bitter taste of onion, boy?
		-- { Cue = "/VO/Intercom_1139", }, -- RequiredCodexEntry = { EntryName = "RoomRewardConsolationPrize", EntryIndex = 1, }, },
		-- One false move is all it takes here, boy.	
		-- { Cue = "/VO/Intercom_1140" },
	},
	PerfectClearEncounterFailedVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 1.25,
		NoTarget = true,
		CooldownTime = 200,
		-- As expected.
		{ Cue = "/VO/Intercom_0304", RequiredFalseTextLines = { "Ending01" }, },
		-- Another failure.
		{ Cue = "/VO/Intercom_0305", RequiredFalseTextLines = { "Ending01" }, },
		-- Oh, too bad.
		{ Cue = "/VO/Intercom_0306" },
		-- You've always been slow, boy.
		-- { Cue = "/VO/Intercom_0307", RequiredFalseTextLines = { "Ending01" }, },
		-- You failed.
		{ Cue = "/VO/Intercom_0308" },
		-- I knew you couldn't do it.
		{ Cue = "/VO/Intercom_0309", RequiredFalseTextLines = { "Ending01" }, },
		-- Predictable.
		{ Cue = "/VO/Intercom_0310" },
		-- Laughable.
		{ Cue = "/VO/Intercom_0311", RequiredFalseTextLines = { "Ending01" }, },
		-- Aww.
		{ Cue = "/VO/Intercom_0312" },
		-- Not quite nimble enough.
		{ Cue = "/VO/Intercom_1141", RequiredTextLines = { "Ending01" }, },
		-- I was more spry than that when I was young.
		{ Cue = "/VO/Intercom_1142", RequiredTextLines = { "Ending01" }, },
		-- Too slow!
		{ Cue = "/VO/Intercom_1143" },
		-- An onion you shall have!
		{ Cue = "/VO/Intercom_1144", }, -- RequiredCodexEntry = { EntryName = "RoomRewardConsolationPrize", EntryIndex = 1, }, },
		-- Fell short of expectations.
		{ Cue = "/VO/Intercom_1145", RequiredTextLines = { "Ending01" }, },
		-- A failed attempt.
		{ Cue = "/VO/Intercom_1146" },
		-- You could do better than that.
		{ Cue = "/VO/Intercom_1147", RequiredTextLines = { "Ending01" }, },
	},
	PerfectClearEncounterQuicklyFailedVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 1.25,
		NoTarget = true,
		CooldownTime = 200,
		-- Hah, already?
		{ Cue = "/VO/Intercom_0851" },
		-- Pah, haha.
		{ Cue = "/VO/Intercom_0852", RequiredPlayed = { "/VO/Intercom_0851" }, },
		-- Ah, too bad.
		{ Cue = "/VO/Intercom_0853", RequiredPlayed = { "/VO/Intercom_0851" }, },
		-- You already failed?
		{ Cue = "/VO/Intercom_0854", RequiredPlayed = { "/VO/Intercom_0851" }, RequiredFalseTextLines = { "Ending01" }, },
		-- Well that was quick.
		{ Cue = "/VO/Intercom_0855", RequiredPlayed = { "/VO/Intercom_0851" }, },
		-- Already?
		{ Cue = "/VO/Intercom_0856", RequiredPlayed = { "/VO/Intercom_0851" }, },
		-- Hah, haha.
		{ Cue = "/VO/Intercom_0857", RequiredPlayed = { "/VO/Intercom_0851" }, },
		-- An immediate failure.
		{ Cue = "/VO/Intercom_0858", RequiredPlayed = { "/VO/Intercom_0851" }, },
	},
	PerfectClearEncounterClearedVoiceLines = {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 1.35,
		NoTarget = true,
		-- <Laugh>
		{ Cue = "/VO/Intercom_0301", PreLineWait = 0.3,                               CurrentEncounterValueTrue = "PlayerTookDamage" },
		-- <Laugh>
		{ Cue = "/VO/Intercom_0302", PreLineWait = 0.3,                               CurrentEncounterValueTrue = "PlayerTookDamage" },
		-- <Laugh>
		{ Cue = "/VO/Intercom_0303", PreLineWait = 0.3,                               CurrentEncounterValueTrue = "PlayerTookDamage" },
		-- You thank the Fates for this.
		{ Cue = "/VO/Intercom_0313", CurrentEncounterValueFalse = "PlayerTookDamage", RequiredFalseTextLines = { "Ending01" }, },
		-- Useless lot.
		{ Cue = "/VO/Intercom_0314", CurrentEncounterValueFalse = "PlayerTookDamage" },
		-- Miserable fools.
		{ Cue = "/VO/Intercom_0315", CurrentEncounterValueFalse = "PlayerTookDamage" },
		-- Mere luck is all.
		{ Cue = "/VO/Intercom_0316", CurrentEncounterValueFalse = "PlayerTookDamage", RequiredFalseTextLines = { "Ending01" }, },
		-- How fortunate for you.
		{ Cue = "/VO/Intercom_0317", CurrentEncounterValueFalse = "PlayerTookDamage" },
		-- Enough of this.
		{ Cue = "/VO/Intercom_0318", CurrentEncounterValueFalse = "PlayerTookDamage", RequiredFalseTextLines = { "Ending01" }, },
		-- Grr...
		{ Cue = "/VO/Intercom_0319", CurrentEncounterValueFalse = "PlayerTookDamage" },
		-- <Scoff>
		{ Cue = "/VO/Intercom_0320", CurrentEncounterValueFalse = "PlayerTookDamage" },
		-- Blast.
		{ Cue = "/VO/Intercom_0321", CurrentEncounterValueFalse = "PlayerTookDamage" },
		-- Gloat all you like.
		{ Cue = "/VO/Intercom_0322", CurrentEncounterValueFalse = "PlayerTookDamage", RequiredFalseTextLines = { "Ending01" }, },
		-- Feh, the dead are useless.
		{ Cue = "/VO/Intercom_0323", CurrentEncounterValueFalse = "PlayerTookDamage" },
		-- Fine, keep your trinket, then.
		{ Cue = "/VO/Intercom_0324", CurrentEncounterValueFalse = "PlayerTookDamage" },
		-- You're quick, I'll give you that.
		{ Cue = "/VO/Intercom_1148", CurrentEncounterValueFalse = "PlayerTookDamage", RequiredTextLines = { "Ending01" }, },
		-- A perfectly good onion gone to waste!
		{ Cue = "/VO/Intercom_1149", CurrentEncounterValueFalse = "PlayerTookDamage", }, --RequiredCodexEntry = { EntryName = "RoomRewardConsolationPrize", EntryIndex = 1, }, },
		-- Hapless wretches.
		{ Cue = "/VO/Intercom_1150", CurrentEncounterValueFalse = "PlayerTookDamage" },
		-- All right, I've seen enough.
		{ Cue = "/VO/Intercom_1151", CurrentEncounterValueFalse = "PlayerTookDamage", RequiredTextLines = { "Ending01" }, },
		-- Deft on your feet as ever.
		{ Cue = "/VO/Intercom_1152", CurrentEncounterValueFalse = "PlayerTookDamage", RequiredTextLines = { "Ending01" }, },
		-- Eluded all of them...
		{ Cue = "/VO/Intercom_1153", CurrentEncounterValueFalse = "PlayerTookDamage", RequiredTextLines = { "Ending01" }, },
	},
	-- #endregion
	-- #region Fishing
	PatroclusFishCaughtVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.8,
		RequiredTextLines = { "PatroclusFirstMeeting" },
		ObjectType = "NPC_Patroclus_01",
		RequiredRoom = "C_Story01",
		-- You caught one there, did you?
		{ Cue = "/VO/Patroclus_0243" },
		-- Did you just catch another?
		{ Cue = "/VO/Patroclus_0244" },
		-- Good fishing, stranger.
		{ Cue = "/VO/Patroclus_0245" },
		-- You showed that fish all right.
		{ Cue = "/VO/Patroclus_0246" },
		-- Very clever, stranger.
		{ Cue = "/VO/Patroclus_0247" },
		-- Another catch.
		{ Cue = "/VO/Patroclus_0248" },
		-- Another catch, huh.
		{ Cue = "/VO/Patroclus_0249" },
		-- Please leave me be.
		{ Cue = "/VO/Patroclus_0250", RequiredFalseTextLines = { "MyrmidonReunionQuestComplete" } },
		-- A noble victory.
		{ Cue = "/VO/Patroclus_0251" },
		-- Skilfully done.
		{ Cue = "/VO/Patroclus_0252" },
		-- What good's a fish down here?
		{ Cue = "/VO/Patroclus_0253" },
		-- Fool of a fish.
		{ Cue = "/VO/Patroclus_0254" },
		-- It should have been more careful.
		{ Cue = "/VO/Patroclus_0255" },
		-- At last, the rivers are safe.
		{ Cue = "/VO/Patroclus_0256" },
	},
	PersephoneFishCaughtVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.8,
		RequiredTextLines = { "PersephoneFirstMeeting" },
		ObjectType = "ModsNikkelMHadesBiomes_NPC_Persephone_01",
		RequiredRoom = "E_Story01",
		PreLineAnim = "PersephoneGarden_Greeting",
		SubtitleMinDistance = 1200,
		-- Good catch!
		{ Cue = "/VO/Persephone_0284" },
		-- Oh, good catch!
		{ Cue = "/VO/Persephone_0285" },
		-- Well caught.
		{ Cue = "/VO/Persephone_0286" },
		-- Nicely done!
		{ Cue = "/VO/Persephone_0287" },
		-- Ooh look at that!
		{ Cue = "/VO/Persephone_0288" },
		-- Got that one all right!
		{ Cue = "/VO/Persephone_0289" },
	},
	ModsNikkelMHadesBiomes_FishCaughtVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.35,
		Queue = "Interrupt",
		-- Got you!
		{ Cue = "/VO/ZagreusField_3044" },
		-- You're mine.
		{ Cue = "/VO/ZagreusField_3045" },
		-- Come on up!
		{ Cue = "/VO/ZagreusField_3046" },
		-- Right there!
		{ Cue = "/VO/ZagreusField_3047" },
		-- That's a bite!
		{ Cue = "/VO/ZagreusField_3048" },
		-- Got a bite!
		{ Cue = "/VO/ZagreusField_3049" },
		-- Now!
		{ Cue = "/VO/ZagreusField_3050" },
		-- Mine!
		{ Cue = "/VO/ZagreusField_3051" },
		-- There!
		{ Cue = "/VO/ZagreusField_3052" },
		-- Fish!
		{ Cue = "/VO/ZagreusField_3053" },
		-- Bite this!
		{ Cue = "/VO/ZagreusField_3054" },
		-- Come on out!
		{ Cue = "/VO/ZagreusField_3055" },
		-- Got it!
		{ Cue = "/VO/ZagreusField_3056" },
		-- Think I got one!
		{ Cue = "/VO/ZagreusField_3057" },
		-- I got one!
		{ Cue = "/VO/ZagreusField_3058" },
	},
	ModsNikkelMHadesBiomes_FishIdentifiedVoiceLines = {
		{ GlobalVoiceLines = "PersephoneFishCaughtVoiceLines" },
		{
			RandomRemaining = true,
			PreLineWait = 1.0,
			Cooldowns = {
				{ Name = "ZagreusGlobalFishCaughtVoiceLinesPlayed", Time = 30 },
			},
			-- Huzzah!
			{ Cue = "/VO/ZagreusField_3109" },
			-- Victory!
			{ Cue = "/VO/ZagreusField_3110" },
			-- A sea-creature!
			{ Cue = "/VO/ZagreusField_3111" },
			-- I caught one!
			{ Cue = "/VO/ZagreusField_3112" },
			-- A fine catch!
			{ Cue = "/VO/ZagreusField_3113" },
			-- That's one more fish for me!
			{ Cue = "/VO/ZagreusField_3114" },
			-- I am victorious.
			{ Cue = "/VO/ZagreusField_3115" },
			-- I win this round, Fish.
			{ Cue = "/VO/ZagreusField_3116" },
		},
	},
	ModsNikkelMHadesBiomes_FishingInitiatedVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		PreLineWait = 0.35,
		SuccessiveChanceToPlay = 0.85,
		TriggerCooldowns = { Name = "ApproachedCerberusSpeech" },
		Cooldowns = {
			{ Name = "ZagreusStartedFishingSpeech", Time = 5 },
		},
		-- Here, fishies.
		{ Cue = "/VO/ZagreusField_3032", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Come forth, fishes.
		{ Cue = "/VO/ZagreusField_3033", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Let's fish.
		{ Cue = "/VO/ZagreusField_3034" },
		-- Looks like a good spot.
		{ Cue = "/VO/ZagreusField_3035", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Fishing time.
		{ Cue = "/VO/ZagreusField_3036", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Fishing time, then.
		{ Cue = "/VO/ZagreusField_3037", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Come to me, fishies.
		{ Cue = "/VO/ZagreusField_3038", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Come, fishies.
		{ Cue = "/VO/ZagreusField_3039", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Time to fish.
		{ Cue = "/VO/ZagreusField_3040", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Always time to fish.
		{ Cue = "/VO/ZagreusField_3041", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Sure, why not.
		{ Cue = "/VO/ZagreusField_3042", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- I know you're out there, fish.
		{ Cue = "/VO/ZagreusField_3043", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- It's you or me, fishies.
		{ Cue = "/VO/ZagreusField_3217", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Denizens of the deep, arise.
		{ Cue = "/VO/ZagreusField_3219", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- Got to hold nice and still.
		{ Cue = "/VO/ZagreusField_3220", RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- What lurks in this surface river here?
		{ Cue = "/VO/ZagreusField_3227", RequiredBiome = "Styx",                      RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- What lurks in the waters of the surface?
		{ Cue = "/VO/ZagreusField_3228", RequiredBiome = "Styx",                      RequiredPlayed = { "/VO/ZagreusField_3034" } },
		-- All right, let's catch some fish.
		{ Cue = "/VO/ZagreusField_3340", },
	},
	ModsNikkelMHadesBiomes_FishNotCaughtVoiceLines = {
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.8,
			RequiredTextLines = { "PersephoneFirstMeeting" },
			ObjectType = "ModsNikkelMHadesBiomes_NPC_Persephone_01",
			RequiredRoom = "E_Story01",
			PreLineAnim = "PersephoneGarden_Vulnerable",
			-- Alas for that.
			{ Cue = "/VO/Persephone_0290", },
			-- Next time, my son.
			{ Cue = "/VO/Persephone_0291", },
			-- Ah, well.
			{ Cue = "/VO/Persephone_0292", },
			-- Oof, almost!
			{ Cue = "/VO/Persephone_0293", },
			-- Can't win them all.
			{ Cue = "/VO/Persephone_0294", },
			-- Wasn't meant to be.
			{ Cue = "/VO/Persephone_0295", },
		},
		{
			RandomRemaining = true,
			PreLineWait = 1.4,
			ExplicitRequirements = true,
			GameStateRequirements = {
				-- None
			},
			-- Drat.
			{ Cue = "/VO/ZagreusField_3117" },
			-- Ah well.
			{ Cue = "/VO/ZagreusField_3118" },
			-- Missed...
			{ Cue = "/VO/ZagreusField_3119" },
			-- Tsk...
			{ Cue = "/VO/ZagreusField_3120" },
			-- Got away.
			{ Cue = "/VO/ZagreusField_3121" },
			-- You win this round, fish.
			{ Cue = "/VO/ZagreusField_3122", PreLineWait = 1.8 },
			-- Blood and...
			{ Cue = "/VO/ZagreusField_3123" },
			-- Argh.
			{ Cue = "/VO/ZagreusField_3124" },
			-- Missed it.
			{ Cue = "/VO/ZagreusField_3125" },
			-- Not quite.
			{ Cue = "/VO/ZagreusField_3126" },
			-- I missed...
			{ Cue = "/VO/ZagreusField_3127" },
			-- Blasted little...
			{ Cue = "/VO/ZagreusField_3128" },
			-- Damn.
			{ Cue = "/VO/ZagreusField_3129" },
			-- That little...
			{ Cue = "/VO/ZagreusField_3130" },
			-- I'll get you next time, fish!
			{ Cue = "/VO/ZagreusField_3131", PreLineWait = 1.8 },
			-- Lost it.
			{ Cue = "/VO/ZagreusField_3132" },
			-- No good.
			{ Cue = "/VO/ZagreusField_3133" },
			-- Curses!
			{ Cue = "/VO/ZagreusField_3134" },
		},
	},
	ModsNikkelMHadesBiomes_FishNotCaughtTooLateVoiceLines = {
		{
			RandomRemaining = true,
			PreLineWait = 2,
			Cooldowns = {
				{ Name = "ZagreusFishingSpeech", Time = 8 },
			},
			ExplicitRequirements = true,
			GameStateRequirements = {
				-- None
			},
			-- Ah well.
			{ Cue = "/VO/ZagreusField_3135" },
			-- Oh well.
			{ Cue = "/VO/ZagreusField_3136" },
			-- Better move on.
			{ Cue = "/VO/ZagreusField_3137" },
			-- Think that's enough.
			{ Cue = "/VO/ZagreusField_3138" },
			-- No use I guess.
			{ Cue = "/VO/ZagreusField_3139" },
			-- No fish this time.
			{ Cue = "/VO/ZagreusField_3140" },
		},
	},
	ModsNikkelMHadesBiomes_FishNotCaughtWayTooLateVoiceLines = {
		BreakIfPlayed = true,
		RandomRemaining = true,
		RequiresFalseFishingInput = true,
		Cooldowns = {
			{ Name = "ZagreusFishingSpeech", Time = 14 },
		},
		-- Think I missed my chance here.
		{ Cue = "/VO/ZagreusField_3559" },
		-- Hmm, no bites I guess...
		{ Cue = "/VO/ZagreusField_3560" },
		-- Don't think I'll get a bite at this rate.
		{ Cue = "/VO/ZagreusField_3561" },
		-- ...I think I've waited long enough.
		{ Cue = "/VO/ZagreusField_3562" },
		-- No river denizens about I think.
		{ Cue = "/VO/ZagreusField_3563" },
		-- I should probably go...
		{ Cue = "/VO/ZagreusField_3564" },
	},
	-- Inserted into Hades II table
	ModsNikkelMHadesBiomes_FishNotCaughtTooLateVoiceLines_PatroclusReaction = {
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.8,
			RequiredTextLines = { "PatroclusFirstMeeting" },
			ObjectType = "NPC_Patroclus_01",
			RequiredRoom = "C_Story01",
			-- Too bad, stranger.
			{ Cue = "/VO/Patroclus_0257", },
			-- <Chuckle>
			{ Cue = "/VO/Patroclus_0258", },
			-- It got away, did it?
			{ Cue = "/VO/Patroclus_0259", },
			-- My sympathies, stranger.
			{ Cue = "/VO/Patroclus_0260", },
			-- Good fortune never lasts...
			{ Cue = "/VO/Patroclus_0261", },
			-- You keep on trying, stranger.
			{ Cue = "/VO/Patroclus_0262", },
			-- Figured as much...
			{ Cue = "/VO/Patroclus_0263", },
			-- You'll get him yet I'm sure...
			{ Cue = "/VO/Patroclus_0264", },
			-- I saw nothing, stranger.
			{ Cue = "/VO/Patroclus_0265", },
			-- You missed, did you?
			{ Cue = "/VO/Patroclus_0266", },
			-- Tough fortune, there, stranger.
			{ Cue = "/VO/Patroclus_0267", },
			-- I thought you had that one...
			{ Cue = "/VO/Patroclus_0268", },
		},
	}
	-- #endregion
}

mod.HeroVoiceLines = mod.HeroVoiceLines or {
	-- #region Hades
	HitByGraveHandsVoiceLines = {
		{
			RandomRemaining = true,
			Queue = "Interrupt",
			TriggerCooldowns = { "ZagreusAnyQuipSpeech" },
			RequiredFalseTraits = { "StatusImmunityTrait" },
			RequiredFalseBossPhase = 3,
			Cooldowns = {
				{ Name = "ZagreusHitByGraveHandsSpeech", Time = 10 }
			},

			-- Let me go!
			{ Cue = "/VO/ZagreusField_2360", RequiredPlayed = { "/VO/ZagreusField_2362" } },
			-- Let go of me!
			{ Cue = "/VO/ZagreusField_2361", RequiredPlayed = { "/VO/ZagreusField_2362" } },
			-- Get off me!
			{ Cue = "/VO/ZagreusField_2362", },
			-- Aah!
			{ Cue = "/VO/ZagreusField_2363", RequiredPlayed = { "/VO/ZagreusField_2362" } },
			-- Ah, stuck!
			{ Cue = "/VO/ZagreusField_2364", RequiredPlayed = { "/VO/ZagreusField_2362" } },
			-- Stuck!
			{ Cue = "/VO/ZagreusField_2365", RequiredPlayed = { "/VO/ZagreusField_2362" } },
			-- I'm stuck!
			{ Cue = "/VO/ZagreusField_2366", RequiredPlayed = { "/VO/ZagreusField_2362" } },
			-- Can't move!
			{ Cue = "/VO/ZagreusField_2367", RequiredPlayed = { "/VO/ZagreusField_2362" } },
			-- Not again!
			{ Cue = "/VO/ZagreusField_2368", RequiredPlayed = { "/VO/ZagreusField_2362" } },
			-- Augh again?
			{ Cue = "/VO/ZagreusField_2369", RequiredPlayed = { "/VO/ZagreusField_2362" } },
		},
		{
			ObjectType = "Hades",
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 0.3,
				RequiredFalseBossPhase = 3,
				Cooldowns = {
					{ Name = "HadesAnyQuipSpeech" },
					{ Name = "HadesGhostHandsSpeech", Time = 100 }
				},

				ExplicitRequirements = true,
				GameStateRequirements = {
					-- None
				},

				-- What's the matter, boy?
				-- { Cue = "/VO/HadesField_0199" },
				-- You're stuck.
				{ Cue = "/VO/HadesField_0200" },
				-- You're trapped.
				{ Cue = "/VO/HadesField_0201" },
				-- Hold still...!
				{ Cue = "/VO/HadesField_0202" },
				-- No squirming out of this.
				{ Cue = "/VO/HadesField_0203" },
				-- Be careful where you step.
				{ Cue = "/VO/HadesField_0204" },
				-- You stepped in something, boy.
				-- { Cue = "/VO/HadesField_0205" },
				-- Even my wretches don't want you to leave.
				{ Cue = "/VO/HadesField_0206" },
				-- You wait right there.
				{ Cue = "/VO/HadesField_0207" },
			}
		}
	},
	HitByHadesAmmoVoiceLines = {
		{
			RandomRemaining = true,
			PreLineWait = 0.15,
			SuccessiveChanceToPlay = 0.33,
			RequiredFalseBossPhase = 3,
			Cooldowns = {
				{ Name = "ZagreusAnyQuipSpeech" },
				{ Name = "ZagHitByHadesAmmoSpeech", Time = 100 }
			},
			-- Ngh, I'm hit!
			{ Cue = "/VO/ZagreusField_2370", RequiredPlayed = { "/VO/ZagreusField_2376" } },
			-- Ungh, trouble...
			{ Cue = "/VO/ZagreusField_2371", RequiredPlayed = { "/VO/ZagreusField_2376" } },
			-- Rngh, no.
			{ Cue = "/VO/ZagreusField_2372", RequiredPlayed = { "/VO/ZagreusField_2376" } },
			-- Ah, got me!
			{ Cue = "/VO/ZagreusField_2373", RequiredPlayed = { "/VO/ZagreusField_2376" } },
			-- Khh, you!
			{ Cue = "/VO/ZagreusField_2374", RequiredPlayed = { "/VO/ZagreusField_2376" } },
			-- Unf not this.
			{ Cue = "/VO/ZagreusField_2375", RequiredPlayed = { "/VO/ZagreusField_2376" } },
			-- Augh, wha--?
			{ Cue = "/VO/ZagreusField_2376" },
			-- Mph get out!
			{ Cue = "/VO/ZagreusField_2377", RequiredPlayed = { "/VO/ZagreusField_2376" } },
		},
		{
			ObjectType = "Hades",
			{
				RandomRemaining = true,
				PreLineWait = 0.3,
				SuccessiveChanceToPlay = 0.5,
				RequiredFalseBossPhase = 3,
				Cooldowns = {
					{ Name = "HadesAnyQuipSpeech" },
					{ Name = "HadesGhostHandsSpeech", Time = 100 }
				},

				ExplicitRequirements = true,
				GameStateRequirements = {
					-- None
				},

				-- Prepare...!
				{ Cue = "/VO/HadesField_0189" },
				-- Do you feel your blood beginning to boil?
				{ Cue = "/VO/HadesField_0190" },
				-- Too slow.
				{ Cue = "/VO/HadesField_0191" },
				-- Beware, boy.
				-- { Cue = "/VO/HadesField_0192" },
				-- I'll boil your blood.
				{ Cue = "/VO/HadesField_0193" },
				-- You should have avoided that.
				{ Cue = "/VO/HadesField_0194" },
				-- Got you.
				{ Cue = "/VO/HadesField_0195" },
				-- What's wrong, boy?
				-- { Cue = "/VO/HadesField_0196" },
				-- Wake up, boy!
				-- { Cue = "/VO/HadesField_0197" },
				-- Surely you could have avoided that?
				{ Cue = "/VO/HadesField_0198" },
			}
		}
	},
	-- #endregion
	-- #region Thanatos
	ThanatosSpawningVoiceLines = {
		{
			BreakIfPlayed = true,
			PlayOnce = true,
			PlayOnceContext = "ModsNikkelMHadesBiomesThanatosSpawning",
			PreLineWait = 0.65,
			{ Cue = "/VO/MelinoeField_3739", Text = "{#Emph}Erm{#Prev}, what's going on...?", },
		},
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.65,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_0168",      Text = "It's him..." },
			{ Cue = "/VO/Melinoe_2284",      Text = "Right on time." },
			{ Cue = "/VO/Melinoe_4268",      Text = "We meet again, and welcome." },
			{ Cue = "/VO/MelinoeField_3117", Text = "Found me...!", },
			{ Cue = "/VO/MelinoeField_3116", Text = "Here he comes...", },
			{ Cue = "/VO/MelinoeField_3115", Text = "Here he comes...!", },
			{ Cue = "/VO/MelinoeField_3240", Text = "Oh {#Emph}hello!", },
		},
	},
	-- #endregion
	-- #region Charon/ForbiddenShopItem/BossCharon
	ForbiddenShopItemTakenVoiceLines = {
		Queue = "Interrupt",
		{
			UsePlayerSource = true,
			PreLineWait = 0.5,
			PlayOnce = true,
			PlayOnceContext = "ModsNikkelMHadesBiomes_ForbiddenShopItemTakenFirstTime",
			{ Cue = "/VO/Melinoe_1904", Text = "I'll just stash this away.", TriggerCooldowns = { "CharonSurprisedSpeech" } },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.5,
			GameStateRequirements = {
				{
					PathFalse = { "CurrentRun", "CurrentRoom", "SpeechRecord", "/VO/Melinoe_1904" },
				},
			},
			{ Cue = "/VO/MelinoeField_0524", Text = "Don't mind me...!",                  TriggerCooldowns = { "CharonSurprisedSpeech" } },
			{ Cue = "/VO/Melinoe_1293",      Text = "Pure Gold...",                       TriggerCooldowns = { "CharonSurprisedSpeech" } },
			{ Cue = "/VO/Melinoe_0694",      Text = "Gold...",                            TriggerCooldowns = { "CharonSurprisedSpeech" } },
			{ Cue = "/VO/Melinoe_2154",      Text = "Gold coins...",                      TriggerCooldowns = { "CharonSurprisedSpeech" } },
			{ Cue = "/VO/Melinoe_1904",      Text = "I'll just stash this away.",         TriggerCooldowns = { "CharonSurprisedSpeech" } },
			{ Cue = "/VO/Melinoe_1216",      Text = "I need this.",                       TriggerCooldowns = { "CharonSurprisedSpeech" } },
			{ Cue = "/VO/Melinoe_1217",      Text = "This should help.",                  TriggerCooldowns = { "CharonSurprisedSpeech" } },
			{ Cue = "/VO/Melinoe_2150",      Text = "Don't mind me.",                     TriggerCooldowns = { "CharonSurprisedSpeech" } },
			-- All below: CharonSurprisedVoiceLines will play
			-- All below: "Sorry" type ForbiddenShopItemCaughtVoiceLines will not play
			{ Cue = "/VO/MelinoeField_0409", Text = "Pardon the racket, Lord Charon...!", TriggerCooldowns = { "ForbiddenShopItemCaughtSpeech" }, PreLineWait = 1.5, },
			{ Cue = "/VO/Melinoe_2773",      Text = "Shall we?",                          TriggerCooldowns = { "ForbiddenShopItemCaughtSpeech" }, PreLineWait = 1.5, },
			{ Cue = "/VO/MelinoeField_3700", Text = "Shall we cross blades again?",       TriggerCooldowns = { "ForbiddenShopItemCaughtSpeech" }, PreLineWait = 1.5, },
			{ Cue = "/VO/Melinoe_3654",      Text = "Shall we liven things up?",          TriggerCooldowns = { "ForbiddenShopItemCaughtSpeech" }, PreLineWait = 1.5, },
		},
		{
			-- Custom: Replaced Charon_ with Megaera_1
			RandomRemaining = true,
			PreLineWait = 0.2,
			ObjectType = "NPC_Charon_01",
			-- Nrraaauuuggghhh!!
			{ Cue = "/VO/Megaera_10041" },
			-- Hhhaaaauuuhhhhh!!
			{ Cue = "/VO/Megaera_10042" },
			-- Hrrrauuugggghhhh!
			{ Cue = "/VO/Megaera_10043" },
			-- Grrraauuuggggghhh!
			{ Cue = "/VO/Megaera_10044" },
			-- Haaahhhhhhhhh....
			{ Cue = "/VO/Megaera_10005" },
		},
	},
	ForbiddenShopItemCaughtVoiceLines = {
		Queue = "Interrupt",
		PreLineWait = 0.73,
		UsePlayerSource = true,
		Cooldowns = {
			{ Name = "ForbiddenShopItemCaughtSpeech", Time = 10 },
		},
		{ Cue = "/VO/MelinoeField_2368", Text = "Sorry...!" },
	},
	-- #endregion
	-- #region Custom
	-- Plays when saluting the good shade in the Elysium boss room
	ModsNikkelMHadesBiomes_ElysiumShadeVoiceLines = {
		UsePlayerSource = true,
		{
			PreLineWait = 0.4,
			BreakIfPlayed = true,
			PlayOnceThisRun = true,
			RandomRemaining = true,
			{ Cue = "/VO/Melinoe_4351",      Text = "No more despair, good Shade." },
			{ Cue = "/VO/Melinoe_4352",      Text = "Hello again, good Shade." },
			{ Cue = "/VO/MelinoeField_3045", Text = "You're always here, good Shade." },
			{ Cue = "/VO/MelinoeField_3047", Text = "Something about my brother..." },
			{ Cue = "/VO/MelinoeField_3048", Text = "My brother's biggest fan...?",              PlayFirst = true },
			-- Generic voicelines
			{ Cue = "/VO/Melinoe_4352",      Text = "Hello again, good Shade." },
			{ Cue = "/VO/Melinoe_2321",      Text = "Hold fast to hope, good Shade." },
			{ Cue = "/VO/Melinoe_2322",      Text = "Moonlight guide you, good Shade." },
			{ Cue = "/VO/Melinoe_5519",      Text = "Thank you for having faith in him and me.", },
			{
				Cue = "/VO/Melinoe_5521",
				Text = "He's safe and sound.",
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
				},
			},
			{ Cue = "/VO/Melinoe_2320", Text = "Have faith in him for me.", },
			{ Cue = "/VO/Melinoe_1698", Text = "Salutations." },
			{ Cue = "/VO/Melinoe_1699", Text = "Salutations!" },
			{ Cue = "/VO/Melinoe_1701", Text = "Moonlight guide you." },
			{ Cue = "/VO/Melinoe_1703", Text = "May moonlight guide you." },
			{ Cue = "/VO/Melinoe_1704", Text = "Moonlight guide us." },
			{ Cue = "/VO/Melinoe_1705", Text = "May moonlight guide us." },
			{ Cue = "/VO/Melinoe_4260", Text = "Thank you for having faith in me." },
			{ Cue = "/VO/Melinoe_4258", Text = "To further victories!", },
		},
	},
	-- Plays when exiting the Hades boss room
	ModsNikkelMHadesBiomes_MelinoeDBossExitVoiceLines = {
		-- After the peaceful encounter
		{
			BreakIfPlayed = true,
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "TextLinesRecord", "LordHadesBeforePersephoneReturn01" },
				},
			},
			{ Cue = "/VO/MelinoeField_1525", Text = "Thank you, Father." },
		},
		-- First time
		{
			BreakIfPlayed = true,
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "TextLinesRecord", "LordHadesDefeated01" },
				},
			},
			{ Cue = "/VO/MelinoeField_3418", Text = "{#Emph}Night and Darkness, guide me to my blood beyond the grasp of Time!" },
		},
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			{ Cue = "/VO/MelinoeField_3418", Text = "{#Emph}Night and Darkness, guide me to my blood beyond the grasp of Time!" },
			{ Cue = "/VO/Melinoe_1075",      Text = "{#Emph}By blood and darkness, let my will be done!" },
			{ Cue = "/VO/MelinoeField_5192", Text = "OK. {#Emph}To the abyss of the subconscious I descend...!", },
			{ Cue = "/VO/MelinoeField_5191", Text = "Again. {#Emph}To the abyss of the subconscious I descend...!", },
			{ Cue = "/VO/Melinoe_4706",      Text = "{#Emph}The strongest dreams shall shatter if they must!" },
		},
	},
	-- After defeating Hades, when opening the run clear scren
	ModsNikkelMHadesBiomes_RunClearedVoiceLines = {
		Queue = "Always",
		-- First time
		{
			BreakIfPlayed = true,
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "TextLinesRecord", "LordHadesDefeated01" },
				},
			},
			{ Cue = "/VO/MelinoeField_3881", Text = "...now for Zagreus to do his part." },
		},
		{ GlobalVoiceLines = "BarelySurvivedBossFightVoiceLines" },
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.15,
			SuccessiveChanceToPlayAll = 0.5,
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ActiveBounty" },
					IsAny = mod.RandomizedChaosTrialBountyNames,
				},
			},
			{ Cue = "/VO/MelinoeField_3746", Text = "For Almighty Chaos." },
			{ Cue = "/VO/MelinoeField_3747", Text = "By the will of Chaos.",     PlayFirst = true },
			{ Cue = "/VO/MelinoeField_3748", Text = "Everything is possible." },
			{ Cue = "/VO/MelinoeField_3749", Text = "Did Chaos witness this?" },
			{ Cue = "/VO/MelinoeField_4818", Text = "See that, Almighty Chaos?" },
			{ Cue = "/VO/MelinoeField_4819", Text = "This one's for you, Chaos." },
		},
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.15,
			GameStateRequirements = {},
			-- Only plays if we've not seen the ending yet, as after it, we no longer switch to Zagreus
			{ Cue = "/VO/MelinoeField_3881", Text = "...now for Zagreus to do his part.", RequiredFalseTextLines = { "Ending01" }, },
			{ Cue = "/VO/MelinoeField_1418", Text = "For my brother!", },
			{ Cue = "/VO/MelinoeField_1407", Text = "Suffer in darkness..." },
			{ Cue = "/VO/MelinoeField_1417", Text = "For my mother!" },
			{ Cue = "/VO/MelinoeField_4816", Text = "For the Unseen!" },
			{ Cue = "/VO/MelinoeField_4817", Text = "You're gone." },
			{ Cue = "/VO/MelinoeField_1412", Text = "Fall, I said...!", },
			-- From Underworld-specific
			{ Cue = "/VO/MelinoeField_1415", Text = "What did I tell you?", },
			{
				Cue = "/VO/MelinoeField_1420",
				Text = "For Nyx!",
				GameStateRequirements = {
					{
						Path = { "GameState", "EnemyKills", "Hades" },
						Comparison = ">=",
						Value = 5,
					},
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "SuitMarkCritAspect" },
					},
				}
			},
			{
				Cue = "/VO/MelinoeField_1421",
				Text = "For Thanatos!",
				GameStateRequirements = {
					{
						Path = { "GameState", "EnemyKills", "Hades" },
						Comparison = ">=",
						Value = 5,
					},
					{
						PathTrue = { "GameState", "TextLinesRecord", "ThanatosFirstAppearance" },
					},
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "AxePerfectCriticalAspect" },
					},
				}
			},
			{
				Cue = "/VO/MelinoeField_1423",
				Text = "For Olympus!",
				GameStateRequirements = {
					{
						Path = { "GameState", "EnemyKills", "Hades" },
						Comparison = ">=",
						Value = 6,
					},
				}
			},
			{
				Cue = "/VO/MelinoeField_1424",
				Text = "For Charon!",
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EnemyKills", "Hades" },
						Comparison = ">=",
						Value = 6,
					},
					{
						PathTrue = { "CurrentRun", "Hero", "TraitDictionary", "AxeArmCastAspect" },
					},
				}
			},
			{
				Cue = "/VO/MelinoeField_1427",
				Text = "For Schelemeus!",
				GameStateRequirements =
				{
					{
						Path = { "GameState", "EnemyKills", "Hades" },
						Comparison = ">=",
						Value = 10,
					},
				}
			},
			-- From Surface-specific
			{ Cue = "/VO/MelinoeField_4813", Text = "This is our time.", },
			{ Cue = "/VO/MelinoeField_3228", Text = "Return to shadow, {#Emph}now.", },
			{ Cue = "/VO/MelinoeField_1413", Text = "Fall, damn you.", },
			{ Cue = "/VO/MelinoeField_1414", Text = "...Fall.", },
		},
	},
	-- When entering an Erebus Gate/ShrineGate to a RoomChallenge
	ModsNikkelMHadesBiomes_ShrineGateEnterVoiceLines = {
		Queue = "Interrupt",
		{
			BreakIfPlayed = true,
			PreLineWait = 0.25,
			GameStateRequirements = {
				{
					-- Only play when entering, not when exiting a RoomChallenge
					Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
					IsNone = { "Challenge" },
				},
				{
					-- Only on first time using a ShrineGate
					PathFalse = { "GameState", "BiomeVisits", "Challenge" },
				},
			},
			{ Cue = "/VO/MelinoeField_4286", Text = "I accept these terms... I think!" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.25,
			GameStateRequirements = {
				{
					-- Only play when entering, not when exiting a RoomChallenge
					Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
					IsNone = { "Challenge" },
				},
			},
			-- From ZagContract
			{ Cue = "/VO/MelinoeField_4284", Text = "I accept these terms!" },
			{ Cue = "/VO/MelinoeField_4286", Text = "I accept these terms... I think!" },
			-- Custom
			{ Cue = "/VO/Melinoe_0376",      Text = "Into Erebus.", },
			{ Cue = "/VO/Melinoe_4302",      Text = "Into the dark." },
			{ Cue = "/VO/Melinoe_4305",      Text = "To the abyss." },
			{ Cue = "/VO/Melinoe_5282",      Text = "Here we go again...!" },
		},
	},
	-- Returning to the Crossroads
	ModsNikkelMHadesBiomes_EnteredDeathAreaVoiceLines = {
		Queue = "Always",
		TriggerCooldowns = { "DoraAnyQuipSpeech" },
		Cooldowns = {
			{ Name = "MelinoeAnyQuipSpeech", Time = 4 },
		},
		-- After the first modded run
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			GameStateRequirements = {
				{
					Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
					Comparison = "==",
					Value = 0,
				},
			},
			{ Cue = "/VO/MelinoeField_5141", Text = "{#Emph}<Gasp> {#Prev}I... remember... all of that?" },
		},
		{
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			GameStateRequirements = {
				{
					Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
					Comparison = "==",
					Value = 0,
				},
				{
					PathTrue = { "CurrentRun", "Cleared" },
				},
			},
			{ Cue = "/VO/MelinoeField_3575", Text = "Father! Mother... Brother...!" },
		},
		-- #region Including base game priority events for compatibility
		-- epilogue
		{
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "TextLinesRecord", "FatesEpilogue01" },
				},
			},
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			{ Cue = "/VO/Melinoe_4882", Text = "{#Emph}Mmm{#Prev}, I'll have to keep working on that. On both counts." },
		},
		-- post-moros sighting 1
		{
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "TextLinesRecord", "MorosGrantsQuestLog" },
				},
			},
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			{ Cue = "/VO/Melinoe_1584", Text = "{#Emph}Ungh... {#Prev}he's gone..." },
		},
		-- post-moros sighting 2
		{
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "TextLinesRecord", "MorosSecondAppearance" },
				},
			},
			BreakIfPlayed = true,
			PreLineWait = 2.2,
			{ Cue = "/VO/Melinoe_1871", Text = "{#Emph}Ungh... {#Prev}where did he go?" },
		},
		-- post-moros relationship
		{
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "TextLinesRecord", "MorosBecomingCloser01" },
				},
			},
			BreakIfPlayed = true,
			PreLineWait = 2.2,
			{
				Cue = "/VO/Melinoe_4748",
				Text = "{#Emph}<Gasp> {#Prev}Oh...! {#Emph}Hm...",
				GameStateRequirements = {
					{
						Path = { "CurrentRun", "TextLinesChoiceRecord", "MorosBecomingCloser01", },
						IsAny = { "Choice_MorosAccept" },
					},
				},
			},
			{
				Cue = "/VO/Melinoe_2401",
				Text = "{#Emph}<Gasp> <Sigh>",
				GameStateRequirements = {
					{
						Path = { "CurrentRun", "TextLinesChoiceRecord", "MorosBecomingCloser01", },
						IsAny = { "Choice_MorosDecline" },
					},
				},
			},
		},
		-- post-flashback01
		{
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "TextLinesRecord", "HecateHideAndSeek01" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			{ Cue = "/VO/Melinoe_2130", Text = "{#Emph}Ungh... {#Prev}Death to Chronos..." },
		},
		-- post-flashback02
		{
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "TextLinesRecord", "ChronosNightmare01" },
				},
			},
			PlayOnce = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			{ Cue = "/VO/Melinoe_0373", Text = "{#Emph}<Gasp> {#Prev}...Father..." },
		},
		-- artemis singing
		{
			PlayOnce = true,
			PlayOnceContext = "ArtemisSingingIntro",
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.3,
			GameStateRequirements = {
				{
					Path = { "AudioState", "AmbientTrackName" },
					IsAny = { "/Music/ArtemisSong_MC", "/Music/IrisEndThemeCrossroads_MC" },
				},
			},
			{ Cue = "/VO/Melinoe_4023", Text = "{#Emph}Ungh... {#Prev}is that... singing...?", PlayFirst = true },
			{ Cue = "/VO/Melinoe_4024", Text = "{#Emph}Augh... {#Prev}hey... Artemis..." },
		},
		-- #endregion
		-- Cleared Modded Run
		{
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 1.0,
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "Cleared" },
				},
			},
			{ Cue = "/VO/Melinoe_2567", Text = "{#Emph}Mmph... {#Prev}adequate.",                              RequiredTextLines = { "Ending01", }, },
			{ Cue = "/VO/Melinoe_2568", Text = "{#Emph}Whew. {#Prev}Not a bad night, I guess.", },
			{ Cue = "/VO/Melinoe_2399", Text = "{#Emph}Mmph... {#Prev}well {#Emph}that {#Prev}was productive." },
			{ Cue = "/VO/Melinoe_3646", Text = "{#Emph}<Sigh> {#Prev}As it should be.", },
			{ Cue = "/VO/Melinoe_3647", Text = "{#Emph}<Sigh> {#Prev}A night well spent.", },
			{ Cue = "/VO/Melinoe_3648", Text = "{#Emph}<Sigh> {#Prev}A good night's rest!",                    RequiredTextLines = { "Ending01", }, },
			{ Cue = "/VO/Melinoe_3649", Text = "{#Emph}<Sigh> {#Prev}Another eventful night.", },
			{ Cue = "/VO/Melinoe_2569", Text = "...The Fates were on my side.", },
			{ Cue = "/VO/Melinoe_2570", Text = "...I did all right that time...", },
			{ Cue = "/VO/Melinoe_3643", Text = "{#Emph}Mm... {#Prev}good enough.",                             RequiredTextLines = { "Ending01", }, },
			{
				Cue = "/VO/Melinoe_3644",
				Text = "...That's more like it.",
				PreLineWait = 2.1,
				GameStateRequirements = {
					{
						PathFalse = { "PrevRun", "Cleared" },
					},
				},
			},
			{ Cue = "/VO/Melinoe_3645", Text = "Just need to keep that up.", },
			{ Cue = "/VO/Melinoe_5150", Text = "{#Emph}<Sigh> {#Prev}Properly done.", RequiredTextLines = { "Ending01", }, },
			{ Cue = "/VO/Melinoe_5151", Text = "{#Emph}<Sigh> {#Prev}One more then?" },
			{ Cue = "/VO/Melinoe_5152", Text = "{#Emph}<Sigh> {#Prev}That was good.", RequiredTextLines = { "Ending01", }, },
			{
				Cue = "/VO/Melinoe_5154",
				Text = "{#Emph}<Sigh> {#Prev}One after another...",
				GameStateRequirements = {
					{
						PathTrue = { "PrevRun", "Cleared" },
					},
				},
			},
			{
				Cue = "/VO/Melinoe_5149",
				Text = "{#Emph}<Sigh> {#Prev}That's more like it.",
				GameStateRequirements = {
					{
						Path = { "PrevRun" },
						HasNone = { "Cleared", "BountyCleared" }
					},
				},
			},
			{
				Cue = "/VO/Melinoe_5153",
				Text = "{#Emph}<Sigh> {#Prev}We did it, Frinos.",
				PostLineFunctionName = "FrogFamiliarReaction",
				GameStateRequirements = {
					{
						FunctionName = "RequiredAlive",
						FunctionArgs = { Ids = { 566831 } },
					},
				},
			},
			-- Custom
			{ Cue = "/VO/MelinoeField_3575", Text = "Father! Mother... Brother...!", RequiredFalseTextLines = { "Ending01", } },
		},
		-- #region Including base game events
		-- packaged bounty cleared
		{
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "BountyCleared" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			{ Cue = "/VO/Melinoe_3042", Text = "{#Emph}Whew... {#Prev}Chaos Trial, check.",     PlayFirst = true },
			{ Cue = "/VO/Melinoe_2703", Text = "{#Emph}Mm... {#Prev}Chaos got their way." },
			{ Cue = "/VO/Melinoe_2705", Text = "{#Emph}Mmph... {#Prev}thank you, Chaos..." },
			{ Cue = "/VO/Melinoe_2760", Text = "{#Emph}Nngh... {#Prev}Chaos shall be pleased." },
			{ Cue = "/VO/Melinoe_2761", Text = "{#Emph}Ungh... {#Prev}did what I had to do." },
			{ Cue = "/VO/Melinoe_3043", Text = "{#Emph}Mhm... {#Prev}another Chaos Trial down." },
			{ Cue = "/VO/Melinoe_3044", Text = "{#Emph}Nngh... {#Prev}Chaos Trial done..." },
			{ Cue = "/VO/Melinoe_3045", Text = "{#Emph}Whew... {#Prev}Trial complete..." },
			{ Cue = "/VO/Melinoe_3046", Text = "{#Emph}Mph... {#Prev}Trial finished." },
			{ Cue = "/VO/Melinoe_3047", Text = "{#Emph}Hm... {#Prev}Trial, done." },
			{ Cue = "/VO/Melinoe_3048", Text = "{#Emph}Nngh... {#Prev}cheers, Chaos." },
			{
				Cue = "/VO/Melinoe_4832",
				Text = "{#Emph}<Gasp> {#Prev}...From out of the abyss...",
				GameStateRequirements = {
					{
						PathTrue = { "GameState", "ReachedTrueEnding" },
					},
					{
						FunctionName = "RequireRunsSinceTextLines",
						FunctionArgs = { TextLines = { "TrueEndingFinale01" }, Min = 9 },
					},
				},
			},
			{
				Cue = "/VO/Melinoe_2704",
				Text = "{#Emph}Whew... {#Prev}mission complete...",
				GameStateRequirements = {
					{
						Path = { "CurrentRun", "SpeechRecord" },
						HasNone = { "/VO/Melinoe_0978", "/VO/Melinoe_0979", "/VO/Melinoe_0980" },
					},
				},
			},
		},
		-- lost (partly) due to Chaos Curse
		{
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "CurrentRoom", "Encounter", "TookChaosCurseDamage" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_2700", Text = "{#Emph}Urgh... {#Prev}the mark of Chaos..." },
			{ Cue = "/VO/Melinoe_2701", Text = "{#Emph}Oof... {#Prev}careless with Chaos..." },
		},
		-- lost due to BiomeTimer
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "KilledByName", },
					IsAny = { "BiomeTimer" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_3053", Text = "{#Emph}Ungh... {#Prev}Time got the best of me for sure...", PlayFirst = true },
			{ Cue = "/VO/Melinoe_3054", Text = "{#Emph}Ngh... {#Prev}just wasn't swift enough..." },
			{ Cue = "/VO/Melinoe_3055", Text = "{#Emph}Augh... {#Prev}need to be faster still." },
			{ Cue = "/VO/Melinoe_3056", Text = "{#Emph}Urgh... {#Prev}I blame the Oath... or me." },
			{ Cue = "/VO/Melinoe_3057", Text = "{#Emph}Rngh... {#Prev}I brought that on myself." },
		},
		-- #endregion
		-- #region Minibosses
		-- Satyr
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "D_MiniBoss01", },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_2573", Text = "{#Emph}Eugh... {#Prev}that wretched Satyr..." },
			{ Cue = "/VO/Melinoe_3038", Text = "{#Emph}Urgh... {#Prev}Satyrs..." },
		},
		-- Minotaur
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "Y_MiniBoss01" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_5134", Text = "{#Emph}Guh... {#Prev}I got the hooves..." },
		},
		-- Asphodel minibosses
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "X_MiniBoss01" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_4120", Text = "{#Emph}Augh... {#Prev}dislike those two...", },
			{ Cue = "/VO/Melinoe_3638", Text = "{#Emph}Ngh... {#Prev}just couldn't take the heat..." },
		},
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "X_Wrapping01", "X_MiniBoss02" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_3638", Text = "{#Emph}Ngh... {#Prev}just couldn't take the heat..." },
		},
		-- Misc "Evil" miniboss (from Crawler Miniboss)
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "A_MiniBoss02", "A_MiniBoss04", "Y_MiniBoss02", "D_MiniBoss02", "D_MiniBoss03", "D_MiniBoss04", },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_2263", Text = "{#Emph}Ugh... {#Prev}that thing was evil..." },
			{ Cue = "/VO/Melinoe_2264", Text = "{#Emph}Urgh... {#Prev}that was terrifying..." },
		},
		-- #endregion
		-- #region Bosses
		-- Harpies
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "A_Boss01", "A_Boss02", "A_Boss03" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_1875", Text = "{#Emph}Nrgh{#Prev}, I almost had her there..." },
			{ Cue = "/VO/Melinoe_0370", Text = "{#Emph}Augh{#Prev}, she's... strong.", },
			{ Cue = "/VO/Melinoe_2261", Text = "{#Emph}Ngh... {#Prev}what is her problem?" },
			{ Cue = "/VO/Melinoe_3165", Text = "{#Emph}Ngh... {#Prev}to be beaten by {#Emph}her..." },
		},
		-- Hydra
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "X_Boss01", "X_Boss02" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_5124", Text = "{#Emph}Whew... {#Prev}too hot back there." },
			{ Cue = "/VO/Melinoe_3638", Text = "{#Emph}Ngh... {#Prev}just couldn't take the heat..." },
			{ Cue = "/VO/Melinoe_5120", Text = "{#Emph}Ngh... {#Prev}I had nowhere to go...", },
			{ Cue = "/VO/Melinoe_0372", Text = "{#Emph}Eugh{#Prev}, ate me alive back there..." },
		},
		-- Champions
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "Y_Boss01" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_4120", Text = "{#Emph}Augh... {#Prev}dislike those two..." },
			{ Cue = "/VO/Melinoe_5122", Text = "{#Emph}Bleh... {#Prev}they're an odd pairing...", },
			{ Cue = "/VO/Melinoe_5126", Text = "{#Emph}Eugh... {#Prev}don't know which one is worse...", },
		},
		-- Hades
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "D_Boss01" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_0373",   Text = "{#Emph}<Gasp> {#Prev}...Father..." },
			{ Cue = "/VO/Melinoe_2807",   Text = "{#Emph}Ngh... {#Prev}no, I could have beaten him!" },
			{ Cue = "/VO/Melinoe_2805",   Text = "{#Emph}Augh... {#Prev}I could have had him...!" },
			{ Cue = "/VO/Melinoe_2571",   Text = "{#Emph}Augh... {#Prev}he hits hard..." },
			{ Cue = "/VO/Melinoe_2752",   Text = "{#Emph}Urgh... {#Prev}he had me figured out..." },
			{ Cue = "/VO/Melinoe_2753",   Text = "{#Emph}Ungh... {#Prev}barely escaped from him..." },
			{ Cue = "/VO/Melinoe_2938_B", Text = "Father..." },
			{ Cue = "/VO/Melinoe_5175",   Text = "See you again soon, Father.", },
		},
		-- Charon
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "CharonFight01" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_3583", Text = "The sheer might of Lord Charon..." },
			{ Cue = "/VO/Melinoe_5135", Text = "{#Emph}Nngh... {#Prev}I {#Emph}did {#Prev}hear he was strong..." },
		},
		-- #endregion
		-- #region Including base game events
		-- almost beat boss
		{
			GameStateRequirements = {
				{
					Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
					Comparison = ">=",
					Value = 1,
				},
				{
					Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
					IsAny = { "A_Boss01", "A_Boss02", "A_Boss02", "X_Boss01", "X_Boss02", "Y_Boss01", "D_Boss01" },
				},
				{
					Path = { "CurrentRun", "BossHealthBarRecord" },
					MaxOf = "All",
					Comparison = "<",
					Value = 0.15,
				},
				{
					Path = { "CurrentRun", "BossHealthBarRecord" },
					MaxOf = "All",
					Comparison = ">",
					Value = 0,
				},
				{
					PathFalse = { "CurrentRun", "ActiveBounty" },
				},
				{
					PathFalse = { "CurrentRun", "Cleared" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			{ Cue = "/VO/Melinoe_0105", Text = "Almost...",                             PreLineWait = 1.9 },
			{ Cue = "/VO/Melinoe_2636", Text = "{#Emph}Hah... {#Prev}I was so close..." },
			{ Cue = "/VO/Melinoe_2637", Text = "{#Emph}Rngh... {#Prev}nearly had it..." },
			{
				Cue = "/VO/Melinoe_2638",
				Text = "{#Emph}Ungh... {#Prev}almost had him...!",
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
						IsAny = { "D_Boss01" },
					},
				},
			},
			{
				Cue = "/VO/Melinoe_2639",
				Text = "{#Emph}Khh... {#Prev}almost had her...!",
				GameStateRequirements =
				{
					{
						Path = { "CurrentRun", "ModsNikkelMHadesBiomesActualCurrentRoomName" },
						IsAny = { "A_Boss01", "A_Boss02", "A_Boss02" },
					},
				},
			},
			{ Cue = "/VO/Melinoe_2640", Text = "{#Emph}Ngh... {#Prev}just when I thought..." },
			{ Cue = "/VO/Melinoe_2641", Text = "{#Emph}Eugh... {#Prev}thought I had that..." },
		},
		-- other encounters
		-- lost in devotion encounter
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "CurrentRoom", "Encounter", "Name" },
					IsAny = { "DevotionTestTartarus", "DevotionTestAsphodel", "DevotionTestElysium", "DevotionTestStyx" },
				},
			},
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_1876", Text = "...The gods don't like me very much I guess." },
		},
		-- other encounters
		-- lost in artemis encounter
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "CurrentRoom", "Encounter", "Name" },
					IsAny = { "ArtemisCombatIntro", "ArtemisCombatF", "ArtemisCombatG" },
				},
			},
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_1877", Text = "...Not even Artemis could help me out of that." },
		},
		-- lost in nemesis encounter
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "CurrentRoom", "Encounter", "Name" },
					IsAny = { "NemesisCombatIntro", "NemesisCombatF", "NemesisCombatG", "NemesisCombatH", "NemesisCombatI" },
				},
			},
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_2267", Text = "{#Emph}Eugh... {#Prev}damn it, Nemesis..." },
		},
		-- packaged bounties not cleared / failed chaos trial / lost to chaos trial
		-- multiple losses
		{
			GameStateRequirements = {
				{
					Path = { "CurrentRun", "ActiveBountyAttempts" },
					Comparison = ">=",
					ValuePath = { "CurrentRun", "ActiveBountyClears" },
					ValuePathAddition = 4,
				},
				{
					PathTrue = { "CurrentRun", "ActiveBounty" },
				},
				{
					PathFalse = { "CurrentRun", "BountyCleared" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_3489", Text = "{#Emph}Ungh... {#Prev}perhaps that Trial and I need a break..." },
			{ Cue = "/VO/Melinoe_3490", Text = "{#Emph}Ngh... {#Prev}why keep bashing my head against that one...?" },
		},
		{
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "ActiveBounty" },
				},
				{
					PathFalse = { "CurrentRun", "BountyCleared" },
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlayAll = 0.5,
			{ Cue = "/VO/Melinoe_2706", Text = "{#Emph}Ungh... {#Prev}have to try that one again..." },
			{ Cue = "/VO/Melinoe_2707", Text = "{#Emph}Augh... {#Prev}was not an easy mission..." },
			{ Cue = "/VO/Melinoe_2708", Text = "{#Emph}Eugh... {#Prev}apologies, Chaos..." },
			{ Cue = "/VO/Melinoe_2709", Text = "{#Emph}<Gasp>... {#Prev}what happened there..." },
			{ Cue = "/VO/Melinoe_2632", Text = "{#Emph}Mm... {#Prev}no mere vision, was it?" },
			{ Cue = "/VO/Melinoe_2633", Text = "{#Emph}Augh... {#Prev}my head still aches..." },
			{ Cue = "/VO/Melinoe_2634", Text = "{#Emph}Ungh... {#Prev}was like a vivid dream..." },
			{ Cue = "/VO/Melinoe_3049", Text = "{#Emph}Augh... {#Prev}was not an easy Trial..." },
			{ Cue = "/VO/Melinoe_3050", Text = "{#Emph}Eugh... {#Prev}not a successful Trial..." },
			{ Cue = "/VO/Melinoe_3051", Text = "{#Emph}Ungh... {#Prev}Trial incomplete...",          PlayFirst = true },
			{ Cue = "/VO/Melinoe_3052", Text = "{#Emph}Ngh... {#Prev}apologies, almighty Chaos." },
			{
				Cue = "/VO/Melinoe_2707",
				Text = "{#Emph}Augh... {#Prev}was not an easy mission...",
				GameStateRequirements = {
					{
						Path = { "CurrentRun", "ActiveBounty" },
						IsAny = game.ConcatTableValuesIPairs(
							{ "PackageBountyRandomUnderworld_Difficulty2", "PackageBountyRandomSurface_Difficulty2" },
							mod.DifficultRandomizedChaosTrialBountyNames),
					},
				},
			},
		},
		-- #endregion
		-- #region Including base game events
		-- artemis
		{
			GameStateRequirements = {
				{
					Path = { "AudioState", "AmbientTrackName" },
					IsAny = { "/Music/ArtemisSong_MC", "/Music/IrisEndThemeCrossroads_MC" },
				},
			},
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			SuccessiveChanceToPlay = 0.2,
			{ Cue = "/VO/Melinoe_4024", Text = "{#Emph}Augh... {#Prev}hey... Artemis..." },
		},
		-- lost in misc. ways
		{
			GameStateRequirements = {
				{
					Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
					Comparison = ">=",
					Value = 1,
				},
			},
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 1.0,
			{
				Cue = "/VO/Melinoe_3556",
				Text = "{#Emph}Ungh... {#Prev}Frinos, you there...?",
				PostLineFunctionName = "FrogFamiliarReaction",
				GameStateRequirements = {
					{
						FunctionName = "RequiredAlive",
						FunctionArgs = { Ids = { 566831 } },
					},
				},
			},
			{ Cue = "/VO/Melinoe_0099", Text = "{#Emph}<Gasp> Ungh...",                                                  PreLineWait = 0.5 },
			{
				Cue = "/VO/Melinoe_0008_V3",
				Text = "{#Emph}<Gasp> Augh...",
				PreLineWait = 0.5,
				GameStateRequirements =
				{
					{
						Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache", },
						Comparison = ">=",
						Value = 10,
					},
				},
			},
			{ Cue = "/VO/Melinoe_5130", Text = "{#Emph}<Gasp> Urgh..." },
			{ Cue = "/VO/Melinoe_0100", Text = "{#Emph}...Augh!" },
			{ Cue = "/VO/Melinoe_0101", Text = "Returned...",                                                            PreLineWait = 1.8 },
			{ Cue = "/VO/Melinoe_0102", Text = "Home...",                                                                PreLineWait = 1.8 },
			{ Cue = "/VO/Melinoe_0103", Text = "No...",                                                                  PreLineWait = 1.8 },
			{ Cue = "/VO/Melinoe_0104", Text = "{#Emph}Augh..." },
			{ Cue = "/VO/Melinoe_0106", Text = "How long was I out...?",                                                 PreLineWait = 1.6 },
			{ Cue = "/VO/Melinoe_0361", Text = "{#Emph}Eugh, augh..." },
			{ Cue = "/VO/Melinoe_0362", Text = "{#Emph}Mmph... {#Prev}back again..." },
			{ Cue = "/VO/Melinoe_0363", Text = "{#Emph}Urgh... {#Prev}damn it." },
			{ Cue = "/VO/Melinoe_0364", Text = "{#Emph}Mmph{#Prev}, blood and..." },
			{ Cue = "/VO/Melinoe_0365", Text = "{#Emph}Ungh... {#Prev}get up, Mel." },
			{ Cue = "/VO/Melinoe_0366", Text = "{#Emph}Mm{#Prev}, not good enough." },
			{ Cue = "/VO/Melinoe_0367", Text = "{#Emph}Eugh{#Prev}, I won't be making {#Emph}that {#Prev}mistake again." },
			{ Cue = "/VO/Melinoe_0368", Text = "{#Emph}Augh{#Prev}, my training clearly isn't yet complete." },
			{ Cue = "/VO/Melinoe_0374", Text = "{#Emph}<Gasp> <Scoff>" },
			{ Cue = "/VO/Melinoe_2397", Text = "{#Emph}Ngh{#Prev}... rise and shine..." },
			{ Cue = "/VO/Melinoe_2398", Text = "{#Emph}Eugh{#Prev}... what a night." },
			{ Cue = "/VO/Melinoe_2400", Text = "{#Emph}Ah{#Prev}... hm." },
			{ Cue = "/VO/Melinoe_2401", Text = "{#Emph}<Gasp> <Sigh>" },
			{ Cue = "/VO/Melinoe_2402", Text = "{#Emph}<Gasp> <Chuckle>" },
			{ Cue = "/VO/Melinoe_2710", Text = "{#Emph}Nngh... {#Prev}back already." },
			{ Cue = "/VO/Melinoe_2711", Text = "{#Emph}Augh... {#Prev}another night." },
			{ Cue = "/VO/Melinoe_5141", Text = "{#Emph}Nngh... {#Prev}blast..." },
			{ Cue = "/VO/Melinoe_5142", Text = "{#Emph}Augh... {#Prev}not quite..." },
			{ Cue = "/VO/Melinoe_5143", Text = "{#Emph}Rngh... {#Prev}not that time..." },
			{ Cue = "/VO/Melinoe_5144", Text = "{#Emph}<Scoff> <Sigh>" },
			{ Cue = "/VO/Melinoe_5146", Text = "{#Emph}Nngh... {#Prev}oh well..." },
			{ Cue = "/VO/Melinoe_5147", Text = "{#Emph}Mmm... {#Prev}just not my night..." },
			{ Cue = "/VO/Melinoe_5148", Text = "{#Emph}Hrnn... ow..." },
			{
				Cue = "/VO/Melinoe_5145",
				Text = "{#Emph}Eugh... {#Prev}not my best, Frinos...",
				PostLineFunctionName = "FrogFamiliarReaction",
				GameStateRequirements = {
					{
						FunctionName = "RequiredAlive",
						FunctionArgs = { Ids = { 566831 } },
					},
				},
			},
			-- From Nightmare
			{ Cue = "/VO/Melinoe_2635", Text = "{#Emph}Eugh... {#Prev}just another nightmare..." },
		},
		-- #endregion
	},
	-- Playing the Return to Shadow now animation after a cleared run post-ending
	-- For compatibility, also including the generic voicelines just in case
	ModsNikkelMHadesBiomes_DeathReturnVoiceLines = {
		{
			Queue = "Always",
			BreakIfPlayed = true,
			RandomRemaining = true,
			GameStateRequirements = {
				{
					PathTrue = { "CurrentRun", "Cleared" },
				},
				{
					PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
				},
			},
			{ Cue = "/VO/MelinoeField_3311", Text = "Return to shadow... now." },
			{ Cue = "/VO/MelinoeField_3312", Text = "Return to shadow, now..." },
			{ Cue = "/VO/MelinoeField_3313", Text = "Return to shadow, now?" },
			{ Cue = "/VO/MelinoeField_3314", Text = "Return to shadow, now!" },
			{ Cue = "/VO/MelinoeField_3836", Text = "Return to shadow, now." },
			{ Cue = "/VO/MelinoeField_3837", Text = "Return to shadow, now." },
			{ Cue = "/VO/MelinoeField_3838", Text = "Return to shadow, now." },
			{ Cue = "/VO/MelinoeField_3839", Text = "Return to shadow, now." },
			{ Cue = "/VO/Melinoe_1694",      Text = "Return to shadow, now." },
		},
		{
			Queue = "Always",
			BreakIfPlayed = true,
			RandomRemaining = true,
			GameStateRequirements = { {}, },
			{ Cue = "/VO/Melinoe_1695",      Text = "Return to shadow, now...!" },
			{ Cue = "/VO/Melinoe_1693",      Text = "Return to shadow, now!" },
			{ Cue = "/VO/Melinoe_1696",      Text = "Return to shadow, now..." },
			{ Cue = "/VO/MelinoeField_1393", Text = "Return to shadow, now...!" },
		},
	},
	-- #endregion
}
