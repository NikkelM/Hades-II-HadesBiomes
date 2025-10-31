-- Contains some of the GlobalVoiceLines from Hades AudioData.lua
mod.GlobalVoiceLines = mod.GlobalVoiceLines or {
	-- #region Hades
	HadesDeathTauntVoiceLines = {
		RandomRemaining = true,
		BreakIfPlayed = true,
		PreLineWait = 1.95,
		NoTarget = true,

		-- What did I tell you?
		{ Cue = "/VO/Hades_0259" },
		-- What did I tell you.
		{ Cue = "/VO/Hades_0260" },
		-- What did you expect?
		{ Cue = "/VO/Hades_0261" },
		-- What did you expect.
		{ Cue = "/VO/Hades_0262" },
		-- Surely you could have avoided that.
		{ Cue = "/VO/Hades_0263" },
		-- That was inevitable.
		{ Cue = "/VO/Hades_0264" },
		-- I'll see you back at home.
		{ Cue = "/VO/Hades_0265" },
		-- You are a weakling, boy.
		-- { Cue = "/VO/Hades_0266" },
		-- Was that truly your best?
		{ Cue = "/VO/Hades_0267" },
		-- Die, like a mere mortal.
		{ Cue = "/VO/Hades_0268" },
		-- Oh, that was it?
		{ Cue = "/VO/Hades_0269" },
		-- <Laughter>
		{ Cue = "/VO/Hades_0270" },
		-- <Laughter>
		{ Cue = "/VO/Hades_0271" },
		-- <Laughter>
		{ Cue = "/VO/Hades_0272" },
		-- A very tragic end.
		{ Cue = "/VO/Hades_0329" },
		-- Your time is up, boy.
		-- { Cue = "/VO/Hades_0330" },
		-- So much for that attempt.
		{ Cue = "/VO/Hades_0331" },
		-- Whatever happened there?
		{ Cue = "/VO/Hades_0332" },
		-- You don't have what it takes. Nobody does.
		{ Cue = "/VO/Hades_0333" },
		-- A tragic end fit for a poet's verse.
		{ Cue = "/VO/Hades_0334" },
		-- How many deaths is that?
		{ Cue = "/VO/Hades_0335" },
		-- You never seem to learn.
		{ Cue = "/VO/Hades_0336" },
		-- What did I tell you?
		{ Cue = "/VO/Hades_0337" },
	},
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
	FatherSonArgumentVoiceLines = {
		{
			RequiredTextLines = { "Ending01" },
			MaxRunsSinceAnyTextLines = { TextLines = { "HadesGift05" }, Count = 60 },
			RequiredFalseBossPhase = 3,
			{
				RandomRemaining = true,
				PreLineWait = 0.65,
				SuccessiveChanceToPlay = 0.25,
				TriggerCooldowns = { "HadesAnyQuipSpeech", "HadesSummonSpawnsSpeech", "HadesGoneInvisSpeech" },
				Cooldowns =
				{
					{ Name = "FatherSonArgumentSpeech", Time = 320 },
					{ Name = "HadesStageSwitchSpeech",  Time = 90 },
					{ Name = "ZagStageSwitchSpeech",    Time = 90 },
				},

				-- Path A
				-- You think I shall go easy on you, boy?
				{ Cue = "/VO/HadesField_0506" },

				-- Path B
				-- You think your mother shall make me go soft, do you?
				{ Cue = "/VO/HadesField_0507" },

				-- Path C
				-- Why don't you clean your chambers so ferociously?
				{ Cue = "/VO/HadesField_0508" },

				-- Path D
				-- You'd not have made it here without Olympus, boy!
				{ Cue = "/VO/HadesField_0509" },

				-- Path E
				-- Which of our relatives aided you this time, boy?
				{ Cue = "/VO/HadesField_0510" },

				-- Path F
				-- You mother already begins to coddle you!
				{ Cue = "/VO/HadesField_0511" },

				-- Path G
				-- I trust you're having a most pleasant evening, boy?
				{ Cue = "/VO/HadesField_0512" },

				-- Path H
				-- Zagreus! Is this the best that you can do?
				{ Cue = "/VO/HadesField_0513" },

				-- Path I
				-- Zagreus! I trust you had a pleasant journey here?
				{ Cue = "/VO/HadesField_0515" },

				-- Path J
				-- Zagreus! How fared your plundering of my domain?
				{ Cue = "/VO/HadesField_0516" },

				-- Path K
				-- To think you're so receptive to this form of discipline!
				{ Cue = "/VO/HadesField_0517" },
			},
			-- Path A
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- You think I shall go easy on you, boy?
				RequiredLastLinePlayed = { "/VO/HadesField_0506" },

				-- Would be odd of you to start right now!
				{ Cue = "/VO/ZagreusField_4548" },
				-- What, you mean like last time?
				{ Cue = "/VO/ZagreusField_4549" },
				-- Think we both know the answer to that one!
				{ Cue = "/VO/ZagreusField_4550" },
				-- Not really, though, why do you ask?
				{ Cue = "/VO/ZagreusField_4551" },
				-- I guess we'll find out soon, won't we?
				{ Cue = "/VO/ZagreusField_4552" },
			},
			{
				PreLineWait = 0.4,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.85,

				-- You know, I think you're right!
				{ Cue = "/VO/HadesField_0518", RequiredLastLinePlayed = { "/VO/ZagreusField_4548" }, },
				-- You're easily distracted, you know that?
				{ Cue = "/VO/HadesField_0519", RequiredLastLinePlayed = { "/VO/ZagreusField_4549" }, },
				-- That we most certainly do.
				{ Cue = "/VO/HadesField_0520", RequiredLastLinePlayed = { "/VO/ZagreusField_4550" }, },
				-- A useless thought is all!
				{ Cue = "/VO/HadesField_0521", RequiredLastLinePlayed = { "/VO/ZagreusField_4551" }, },
				-- I suppose we shall!
				{ Cue = "/VO/HadesField_0522", RequiredLastLinePlayed = { "/VO/ZagreusField_4552" }, },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.55,

				-- Why, thanks!
				{ Cue = "/VO/ZagreusField_4598", RequiredLastLinePlayed = { "/VO/HadesField_0518" }, },
				-- Good chat!
				{ Cue = "/VO/ZagreusField_4599", RequiredLastLinePlayed = { "/VO/HadesField_0518" }, },

				-- Look at that lovely sky!
				{ Cue = "/VO/ZagreusField_4600", RequiredLastLinePlayed = { "/VO/HadesField_0519" }, },
				-- Am not!
				{ Cue = "/VO/ZagreusField_4601", RequiredLastLinePlayed = { "/VO/HadesField_0519" }, },

				-- Great!
				{ Cue = "/VO/ZagreusField_4602", RequiredLastLinePlayed = { "/VO/HadesField_0520" }, },
				-- All right, then!
				{ Cue = "/VO/ZagreusField_4603", RequiredLastLinePlayed = { "/VO/HadesField_0520" }, },

				-- Save it, then!
				{ Cue = "/VO/ZagreusField_4604", RequiredLastLinePlayed = { "/VO/HadesField_0521" }, },
				-- Well thanks for sharing, anyway!
				{ Cue = "/VO/ZagreusField_4605", RequiredLastLinePlayed = { "/VO/HadesField_0521" }, },

				-- Let's do it then!
				{ Cue = "/VO/ZagreusField_4606", RequiredLastLinePlayed = { "/VO/HadesField_0522" }, },
			},
			-- Path B
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- You think your mother shall make me go soft, do you?
				RequiredLastLinePlayed = { "/VO/HadesField_0507" },

				-- I'm sure she'll wear you down eventually!
				{ Cue = "/VO/ZagreusField_4553" },
				-- Who knows? Mother's full of surprises!
				{ Cue = "/VO/ZagreusField_4554" },
				-- Perish the thought of you being less difficult, Father!
				{ Cue = "/VO/ZagreusField_4555" },
				-- Is that your deepest fear of late, Father?
				{ Cue = "/VO/ZagreusField_4556" },
				-- I think you'll get there, yes!
				{ Cue = "/VO/ZagreusField_4557" },
			},
			{
				PreLineWait = 0.4,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.85,

				-- You treat her with respect!
				{ Cue = "/VO/HadesField_0523", RequiredLastLinePlayed = { "/VO/ZagreusField_4553", "/VO/ZagreusField_4554" }, },
				-- Do not treat her as you allow yourself with me!
				{ Cue = "/VO/HadesField_0524", RequiredLastLinePlayed = { "/VO/ZagreusField_4553", "/VO/ZagreusField_4554" }, },
				-- Ah, how could I forget?
				{ Cue = "/VO/HadesField_0525", RequiredLastLinePlayed = { "/VO/ZagreusField_4554" }, },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.75,

				-- Same goes for you!
				{ Cue = "/VO/ZagreusField_4607", RequiredLastLinePlayed = { "/VO/HadesField_0523", "/VO/HadesField_0524" }, },
				-- Worry about yourself!
				{ Cue = "/VO/ZagreusField_4608", RequiredLastLinePlayed = { "/VO/HadesField_0523", "/VO/HadesField_0524" }, },
				-- Likewise to you!
				{ Cue = "/VO/ZagreusField_4609", RequiredLastLinePlayed = { "/VO/HadesField_0523", "/VO/HadesField_0524" }, },
				-- No plans for that!
				{ Cue = "/VO/ZagreusField_4610", RequiredLastLinePlayed = { "/VO/HadesField_0523", "/VO/HadesField_0524" }, },
				-- Old age, it happens!
				{ Cue = "/VO/ZagreusField_4611", RequiredLastLinePlayed = { "/VO/HadesField_0525" }, },
				-- You've been so busy!
				{ Cue = "/VO/ZagreusField_4612", RequiredLastLinePlayed = { "/VO/HadesField_0525" }, },
			},
			-- Path C
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- Why don't you clean your chambers so ferociously?
				RequiredLastLinePlayed = { "/VO/HadesField_0508" },

				-- My chambers just aren't as enjoyable to fight!
				{ Cue = "/VO/ZagreusField_4558" },
				-- What, so they could look like your boring chambers?
				{ Cue = "/VO/ZagreusField_4559" },
				-- Too busy ransacking through your domain, sorry!
				{ Cue = "/VO/ZagreusField_4560" },
				-- Why don't you concentrate on fighting back?
				{ Cue = "/VO/ZagreusField_4561" },
			},
			{
				PreLineWait = 0.4,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.85,

				-- You and your clever wit!
				{ Cue = "/VO/HadesField_0556", RequiredLastLinePlayed = { "/VO/ZagreusField_4558" }, },
				-- Bah...!
				{ Cue = "/VO/HadesField_0555", RequiredLastLinePlayed = { "/VO/ZagreusField_4558" }, },
				-- You take that back about my chambers!
				{ Cue = "/VO/HadesField_0526", RequiredLastLinePlayed = { "/VO/ZagreusField_4559" }, },
				-- What would you know of real work?
				{ Cue = "/VO/HadesField_0527", RequiredLastLinePlayed = { "/VO/ZagreusField_4560" }, },
				-- I ask the questions here!
				{ Cue = "/VO/HadesField_0528", RequiredLastLinePlayed = { "/VO/ZagreusField_4561" }, },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.75,

				-- Nope!
				{ Cue = "/VO/ZagreusField_4613", RequiredLastLinePlayed = { "/VO/HadesField_0526" }, },
				-- They're boring, I say!
				{ Cue = "/VO/ZagreusField_4614", RequiredLastLinePlayed = { "/VO/HadesField_0526" }, },

				-- This isn't real work?
				{ Cue = "/VO/ZagreusField_4615", RequiredLastLinePlayed = { "/VO/HadesField_0527" }, },
				-- Just what you've taught me!
				{ Cue = "/VO/ZagreusField_4616", RequiredLastLinePlayed = { "/VO/HadesField_0527" }, },

				-- Whatever you say!
				{ Cue = "/VO/ZagreusField_4617", RequiredLastLinePlayed = { "/VO/HadesField_0528" }, },
				-- Really?
				{ Cue = "/VO/ZagreusField_4618", RequiredLastLinePlayed = { "/VO/HadesField_0528" }, },
			},
			-- Path D
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- You'd not have made it here without Olympus, boy!
				RequiredLastLinePlayed = { "/VO/HadesField_0509" },

				-- That's funny, you wouldn't be here without Olympus, either!
				{ Cue = "/VO/ZagreusField_4562" },
				-- You act like you do everything yourself!
				{ Cue = "/VO/ZagreusField_4563" },
				-- You should be pleased to have their help!
				{ Cue = "/VO/ZagreusField_4564" },
				-- And what's your point, exactly, there?
				{ Cue = "/VO/ZagreusField_4565" },
			},
			{
				PreLineWait = 0.4,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.85,

				-- Bah, blast you, boy!
				{ Cue = "/VO/HadesField_0529", RequiredLastLinePlayed = { "/VO/ZagreusField_4562" }, },
				-- More than you know!
				{ Cue = "/VO/HadesField_0530", RequiredLastLinePlayed = { "/VO/ZagreusField_4563" }, },
				-- Oh, I'm delighted, boy!
				{ Cue = "/VO/HadesField_0531", RequiredLastLinePlayed = { "/VO/ZagreusField_4564" }, },
				-- Someday you'll understand!
				{ Cue = "/VO/HadesField_0532", RequiredLastLinePlayed = { "/VO/ZagreusField_4565" }, },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.75,

				-- Blast you right back!
				{ Cue = "/VO/ZagreusField_4619", RequiredLastLinePlayed = { "/VO/HadesField_0529" }, },
				-- <Chuckle>
				{ Cue = "/VO/ZagreusField_4620", RequiredLastLinePlayed = { "/VO/HadesField_0529" }, },

				-- Well, cheers!
				{ Cue = "/VO/ZagreusField_4621", RequiredLastLinePlayed = { "/VO/HadesField_0530" }, },
				-- I know a thing or two!
				{ Cue = "/VO/ZagreusField_4622", RequiredLastLinePlayed = { "/VO/HadesField_0530" }, },

				-- I can tell!
				{ Cue = "/VO/ZagreusField_4623", RequiredLastLinePlayed = { "/VO/HadesField_0531" }, },
				-- Clearly!
				{ Cue = "/VO/ZagreusField_4624", RequiredLastLinePlayed = { "/VO/HadesField_0531" }, },

				-- Ominous!
				{ Cue = "/VO/ZagreusField_4625", RequiredLastLinePlayed = { "/VO/HadesField_0532" }, },
				-- Sounds good!
				{ Cue = "/VO/ZagreusField_4626", RequiredLastLinePlayed = { "/VO/HadesField_0532" }, },
			},
			-- Path E
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- Which of our relatives aided you this time, boy?
				RequiredLastLinePlayed = { "/VO/HadesField_0510" },

				-- I'll leave that one for you to figure out!
				{ Cue = "/VO/ZagreusField_4566" },
				-- Who do you think, Father?
				{ Cue = "/VO/ZagreusField_4567" },
				-- Oh, quite a few of them, I'll have you know!
				{ Cue = "/VO/ZagreusField_4568" },
				-- Certainly not you!
				{ Cue = "/VO/ZagreusField_4569", RequiredFalseTraits = { "HadesShoutKeepsake" }, },
			},
			{
				PreLineWait = 0.5,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.85,

				-- Enough!
				{ Cue = "/VO/HadesField_0551", RequiredLastLinePlayed = { "/VO/ZagreusField_4568", "/VO/ZagreusField_4569" }, },
				-- All right!
				{ Cue = "/VO/HadesField_0553", RequiredLastLinePlayed = { "/VO/ZagreusField_4568", "/VO/ZagreusField_4569" }, },
				-- I think it's time for you to die!
				{ Cue = "/VO/HadesField_0533", RequiredLastLinePlayed = { "/VO/ZagreusField_4567" }, },
				-- Do not pretend to even care!
				{ Cue = "/VO/HadesField_0534", RequiredLastLinePlayed = { "/VO/ZagreusField_4567" }, },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.75,

				-- Well I would beg to differ!
				{ Cue = "/VO/ZagreusField_4627", RequiredLastLinePlayed = { "/VO/HadesField_0533" }, },
				-- Mm, no thanks!
				{ Cue = "/VO/ZagreusField_4628", RequiredLastLinePlayed = { "/VO/HadesField_0533" }, },

				-- All right, I won't!
				{ Cue = "/VO/ZagreusField_4629", RequiredLastLinePlayed = { "/VO/HadesField_0534" }, },
				-- Fine!
				{ Cue = "/VO/ZagreusField_4630", RequiredLastLinePlayed = { "/VO/HadesField_0534" }, },
			},
			-- Path F
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- You mother already begins to coddle you!
				RequiredLastLinePlayed = { "/VO/HadesField_0511" },

				-- Last I checked princes were meant to be coddled!
				{ Cue = "/VO/ZagreusField_4570" },
				-- It's called showing affection to your children, Father!
				{ Cue = "/VO/ZagreusField_4571" },
				-- Whatever will you do about it, Father?
				{ Cue = "/VO/ZagreusField_4572" },
				-- What do you even care?
				{ Cue = "/VO/ZagreusField_4573" },
			},
			{
				PreLineWait = 0.4,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.85,

				-- Ah, thank you for the information, there!
				{ Cue = "/VO/HadesField_0535", RequiredLastLinePlayed = { "/VO/ZagreusField_4570", "/VO/ZagreusField_4571" }, },
				-- Please, teach me more, then!
				{ Cue = "/VO/HadesField_0536", RequiredLastLinePlayed = { "/VO/ZagreusField_4570", "/VO/ZagreusField_4571", }, },
				-- Always such accusations, from you!
				{ Cue = "/VO/HadesField_0537", RequiredLastLinePlayed = { "/VO/ZagreusField_4573", }, },
				-- You impudent...!
				{ Cue = "/VO/HadesField_0549", RequiredLastLinePlayed = { "/VO/ZagreusField_4572", }, },
				-- You impertinent...!
				{ Cue = "/VO/HadesField_0550", RequiredLastLinePlayed = { "/VO/ZagreusField_4572", }, },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.75,

				-- You're most welcome!
				{ Cue = "/VO/ZagreusField_4631", RequiredLastLinePlayed = { "/VO/HadesField_0535" }, },
				-- Sure thing!
				{ Cue = "/VO/ZagreusField_4632", RequiredLastLinePlayed = { "/VO/HadesField_0535" }, },
				-- Happy to!
				{ Cue = "/VO/ZagreusField_4633", RequiredLastLinePlayed = { "/VO/HadesField_0536" }, },
				-- Always!
				{ Cue = "/VO/ZagreusField_4634", RequiredLastLinePlayed = { "/VO/HadesField_0537" }, },
			},
			-- Path G
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- I trust you're having a most pleasant evening, boy?
				RequiredLastLinePlayed = { "/VO/HadesField_0512" },

				-- Quite lovely, Father, how about yourself?
				{ Cue = "/VO/ZagreusField_4574" },
				-- There's a refreshing chill now that you mention it!
				{ Cue = "/VO/ZagreusField_4575" },
				-- Oh I most definitely am, thank you, Father!
				{ Cue = "/VO/ZagreusField_4576" },
				-- It could be going better, I suppose!
				{ Cue = "/VO/ZagreusField_4577" },
			},
			{
				PreLineWait = 0.4,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.85,

				-- Oh, you know, same as ever, here!
				{ Cue = "/VO/HadesField_0538", RequiredLastLinePlayed = { "/VO/ZagreusField_4574" }, },
				-- Silence!
				{ Cue = "/VO/HadesField_0552", RequiredLastLinePlayed = { "/VO/ZagreusField_4574" }, },

				-- Just as I thought!
				{ Cue = "/VO/HadesField_0539", RequiredLastLinePlayed = { "/VO/ZagreusField_4577", }, },
				-- And such a shame for that!
				{ Cue = "/VO/HadesField_0540", RequiredLastLinePlayed = { "/VO/ZagreusField_4577" }, },

				-- You impudent...!
				{ Cue = "/VO/HadesField_0549", RequiredLastLinePlayed = { "/VO/ZagreusField_4572", }, },
				-- You impertinent...!
				{ Cue = "/VO/HadesField_0550", RequiredLastLinePlayed = { "/VO/ZagreusField_4572", }, },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.75,

				-- Well, carry on!
				{ Cue = "/VO/ZagreusField_4635", RequiredLastLinePlayed = { "/VO/HadesField_0538" }, },
				-- Thanks for your concern!
				{ Cue = "/VO/ZagreusField_4636", RequiredLastLinePlayed = { "/VO/HadesField_0539" }, },
				-- It'll be all right!
				{ Cue = "/VO/ZagreusField_4637", RequiredLastLinePlayed = { "/VO/HadesField_0540" }, },
			},
			-- Path H
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- Zagreus! Is this the best that you can do?
				RequiredLastLinePlayed = { "/VO/HadesField_0513" },

				-- You'll have to let me know when this is over!
				{ Cue = "/VO/ZagreusField_4578" },
				-- We'll soon find out I think!
				{ Cue = "/VO/ZagreusField_4579" },
				-- I'm pretty sure it is!
				{ Cue = "/VO/ZagreusField_4580" },
				-- You know what, probably not!
				{ Cue = "/VO/ZagreusField_4581" },
			},
			{
				PreLineWait = 0.4,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.85,
				RequiredLastLinePlayed = { "/VO/ZagreusField_4568", "/VO/ZagreusField_4578", "/VO/ZagreusField_4579", "/VO/ZagreusField_4580", "/VO/ZagreusField_4581" },

				-- Enough!
				{ Cue = "/VO/HadesField_0551" },
				-- Silence!
				{ Cue = "/VO/HadesField_0552" },
				-- All right!
				{ Cue = "/VO/HadesField_0553" },
				-- End of discussion, boy!
				{ Cue = "/VO/HadesField_0554" },
				-- Bah...!
				{ Cue = "/VO/HadesField_0555" },
				-- You and your clever wit!
				{ Cue = "/VO/HadesField_0556" },
			},
			-- Path I
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- Zagreus! I trust you had a pleasant journey here?
				RequiredLastLinePlayed = { "/VO/HadesField_0515" },

				-- Oh, absolutely wonderful, thank you!
				{ Cue = "/VO/ZagreusField_4586" },
				-- It went all right, now that you mention it!
				{ Cue = "/VO/ZagreusField_4587" },
				-- Quite pleasant, actually!
				{ Cue = "/VO/ZagreusField_4588" },
				-- It's always pleasant in the Underworld!
				{ Cue = "/VO/ZagreusField_4589" },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.75,

				-- How truly wonderful to hear.
				{ Cue = "/VO/HadesField_0543", RequiredLastLinePlayed = { "/VO/ZagreusField_4586", "/VO/ZagreusField_4587", "/VO/ZagreusField_4588", "/VO/ZagreusField_4577" }, },
			},
			-- Path J
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				-- Zagreus! How fared your plundering of my domain?
				RequiredLastLinePlayed = { "/VO/HadesField_0516" },

				-- It fared just great, thank you for asking, there!
				{ Cue = "/VO/ZagreusField_4590" },
				-- Could have gone better, though what can you do?
				{ Cue = "/VO/ZagreusField_4591" },
				-- Not bad at all, this time!
				{ Cue = "/VO/ZagreusField_4592" },
				-- I've had better escape attempts I think!
				{ Cue = "/VO/ZagreusField_4593" },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.85,

				-- You're very welcome, boy!
				{ Cue = "/VO/HadesField_0541", RequiredLastLinePlayed = { "/VO/ZagreusField_4590" }, },
				-- I can do this!
				{ Cue = "/VO/HadesField_0544", RequiredLastLinePlayed = { "/VO/ZagreusField_4591" }, },
				-- How truly wonderful to hear.
				{ Cue = "/VO/HadesField_0543", RequiredLastLinePlayed = { "/VO/ZagreusField_4592" }, },
				-- Losing your spirit, same as ever, there!
				{ Cue = "/VO/HadesField_0545", RequiredLastLinePlayed = { "/VO/ZagreusField_4593" }, },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.75,

				-- Not just yet!
				{ Cue = "/VO/ZagreusField_4638", RequiredLastLinePlayed = { "/VO/HadesField_0545" }, },
			},
			-- Path K
			{
				PreLineWait = 0.4,
				UsePlayerSource = true,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.9,
				-- To think you're so receptive to this form of discipline!
				RequiredLastLinePlayed = { "/VO/HadesField_0517" },

				-- And we finally have an activity we can do together!
				{ Cue = "/VO/ZagreusField_4594" },
				-- Seems like you have a lot to learn about discipline, huh?
				{ Cue = "/VO/ZagreusField_4595" },
				-- We gods do like to fight!
				{ Cue = "/VO/ZagreusField_4596" },
				-- Discipline, that's what we're calling it?
				{ Cue = "/VO/ZagreusField_4597" },
			},
			{
				PreLineWait = 0.4,
				RandomRemaining = true,
				SuccessiveChanceToPlay = 0.85,

				-- Ah, yes, indeed!
				{ Cue = "/VO/HadesField_0546", RequiredLastLinePlayed = { "/VO/ZagreusField_4594", "/VO/ZagreusField_4575", "/VO/ZagreusField_4576" }, },
				-- We've all a lot to learn, I think!
				{ Cue = "/VO/HadesField_0547", RequiredLastLinePlayed = { "/VO/ZagreusField_4595" }, },
				-- Incorrigible brat!
				{ Cue = "/VO/HadesField_0548", RequiredLastLinePlayed = { "/VO/ZagreusField_4595" }, },
				-- How thoughtful, there, indeed!
				{ Cue = "/VO/HadesField_0542", RequiredLastLinePlayed = { "/VO/ZagreusField_4595" }, },
				-- Silence!
				{ Cue = "/VO/HadesField_0552", RequiredLastLinePlayed = { "/VO/ZagreusField_4597" }, },
				-- I think it's time for you to die!
				{ Cue = "/VO/HadesField_0533", RequiredLastLinePlayed = { "/VO/ZagreusField_4596" }, },
			},
			{
				PreLineWait = 0.4,
				BreakIfPlayed = true,
				RandomRemaining = true,
				UsePlayerSource = true,
				SuccessiveChanceToPlay = 0.75,

				-- Well, carry on!
				{ Cue = "/VO/ZagreusField_4635", RequiredLastLinePlayed = { "/VO/HadesField_0538" }, },
				-- Thanks for your concern!
				{ Cue = "/VO/ZagreusField_4636", RequiredLastLinePlayed = { "/VO/HadesField_0539" }, },
				-- It'll be all right!
				{ Cue = "/VO/ZagreusField_4637", RequiredLastLinePlayed = { "/VO/HadesField_0540" }, },
			},
		},
		-- pre-ending
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			SuccessiveChanceToPlay = 0.25,
			TriggerCooldowns = { "HadesAnyQuipSpeech", "HadesSummonSpawnsSpeech", "HadesGoneInvisSpeech" },
			RequiredFalseTextLines = { "Ending01" },
			Cooldowns =
			{
				{ Name = "FatherSonArgumentSpeech", Time = 300 },
				{ Name = "HadesStageSwitchSpeech",  Time = 70 },
				{ Name = "ZagStageSwitchSpeech",    Time = 70 },
			},

			-- Path A
			-- You dare lash out against me like this, boy?
			{ Cue = "/VO/HadesField_0155" },
			-- You really think you can just walk away?
			{ Cue = "/VO/HadesField_0359", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- You dare attempt to vanquish me, again?
			{ Cue = "/VO/HadesField_0360", RequiresLastRunCleared = true,              RequiredPlayed = { "/VO/HadesField_0155" } },
			-- You truly think this surface is where you belong?
			{ Cue = "/VO/HadesField_0361", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- Do you even realize what you're doing, boy?
			{ Cue = "/VO/HadesField_0362", RequiredPlayed = { "/VO/HadesField_0155" } },

			-- Path B
			-- Why do you keep up this foolishness?
			{ Cue = "/VO/HadesField_0158", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- Why do you keep doing this, time after blasted time?
			{ Cue = "/VO/HadesField_0363", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- Why have you forced me to confront you here, again?
			{ Cue = "/VO/HadesField_0364", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- Why do you wish to die repeatedly like this?
			{ Cue = "/VO/HadesField_0365", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- Why have you come all this way, again?
			{ Cue = "/VO/HadesField_0366", RequiredPlayed = { "/VO/HadesField_0155" } },

			-- Path C
			-- You've no control over your brutish strength!
			{ Cue = "/VO/HadesField_0216", RequiredPlayed = { "/VO/HadesField_0155" }, CooldownName = "SaidStrengthRecently",     CooldownTime = 40, },
			-- That brutish strength of yours! How like your relatives you are!
			{ Cue = "/VO/HadesField_0367", RequiredPlayed = { "/VO/HadesField_0155" }, CooldownName = "SaidStrengthRecently",     CooldownTime = 40, },
			-- You lack the proper form! Pure brutish strength!
			{ Cue = "/VO/HadesField_0368", RequiredPlayed = { "/VO/HadesField_0155" }, CooldownName = "SaidStrengthRecently",     CooldownTime = 40, },
			-- Is this another showing of your brutish strength?
			{ Cue = "/VO/HadesField_0369", RequiredPlayed = { "/VO/HadesField_0155" }, CooldownName = "SaidStrengthRecently",     CooldownTime = 40, },

			-- Path D
			-- What shall it take for you to cease with this madness?
			{ Cue = "/VO/HadesField_0217", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- What shall it take for all of this to end?
			{ Cue = "/VO/HadesField_0370", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- What shall it take for you to cease making me face you here?
			{ Cue = "/VO/HadesField_0371", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- What shall it take for you to stop this foolishness?
			{ Cue = "/VO/HadesField_0372", RequiredPlayed = { "/VO/HadesField_0155" } },
			-- What is it going to take for you to get some sense into your head?
			{ Cue = "/VO/HadesField_0373", RequiredPlayed = { "/VO/HadesField_0155" } },
		},
		-- Path A
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.85,
			-- You dare lash out against me like this, boy?
			RequiredLastLinePlayed = { "/VO/HadesField_0155", "/VO/HadesField_0359", "/VO/HadesField_0360", "/VO/HadesField_0361", "/VO/HadesField_0362" },

			-- I do!
			{ Cue = "/VO/ZagreusField_2291" },
			-- That's right!
			{ Cue = "/VO/ZagreusField_2292" },
			-- What do you think, Father?
			{ Cue = "/VO/ZagreusField_2293" },
			-- I guess so!
			{ Cue = "/VO/ZagreusField_2294" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.75,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2293" },

			-- I think that you are an ignoble brat!
			{ Cue = "/VO/HadesField_0156" },
			-- I think you are wasting your time.
			{ Cue = "/VO/HadesField_0157" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.65,
			RequiredLastLinePlayed = { "/VO/HadesField_0156" },

			-- Oh you'll think better of me soon!
			{ Cue = "/VO/ZagreusField_2295" },
			-- And I am shocked to hear it!
			{ Cue = "/VO/ZagreusField_2296" },
			-- And I think you're a miserable failure as a father!
			{ Cue = "/VO/ZagreusField_2297" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.5,
			RequiredLastLinePlayed = { "/VO/HadesField_0157" },

			-- It's my time to do with as I please!
			{ Cue = "/VO/ZagreusField_2298" },
			-- I don't care what you think!
			{ Cue = "/VO/ZagreusField_2299" },
			-- Oh this isn't a waste of time at all!
			{ Cue = "/VO/ZagreusField_2300" },
		},
		-- Path B
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.85,
			-- Why do you keep up this foolishness?
			RequiredLastLinePlayed = { "/VO/HadesField_0158", "/VO/HadesField_0363", "/VO/HadesField_0364", "/VO/HadesField_0365", "/VO/HadesField_0366" },

			-- It beats having to live within your House!
			{ Cue = "/VO/ZagreusField_2301" },
			-- You know exactly why!
			{ Cue = "/VO/ZagreusField_2302" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.75,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2301" },

			-- Would that you could be useful there from time to time!
			{ Cue = "/VO/HadesField_0159" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.75,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2302" },
			RequiredFalseTextLines = { "PersephoneFirstMeeting" },

			-- You shall never find her! She is gone!
			{ Cue = "/VO/HadesField_0160" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.65,
			RequiredLastLinePlayed = { "/VO/HadesField_0159" },

			-- You'd like that, wouldn't you?
			{ Cue = "/VO/ZagreusField_2303" },
			-- Would that you could shut up and fight!
			{ Cue = "/VO/ZagreusField_2304" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.65,
			RequiredLastLinePlayed = { "/VO/HadesField_0160" },

			-- Liar! Why should I trust a single word you say?
			{ Cue = "/VO/ZagreusField_2305" },
			-- No! She's out there. I know it!
			{ Cue = "/VO/ZagreusField_2306" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.55,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2305" },

			-- You're but a simple fool!
			{ Cue = "/VO/HadesField_0161" },
			-- All that I've told you is for your own good.
			{ Cue = "/VO/HadesField_0162" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.55,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2306" },

			-- She's gone, I say!
			{ Cue = "/VO/HadesField_0163" },
			-- You know nothing!
			{ Cue = "/VO/HadesField_0164" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.55,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2303" },

			-- You'd like to perish, wouldn't you?!
			{ Cue = "/VO/HadesField_0165" },
			-- What would you know of it!
			{ Cue = "/VO/HadesField_0166" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.55,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2304" },

			-- Oh I can do just that.
			{ Cue = "/VO/HadesField_0167" },
			-- I'll happily oblige.
			{ Cue = "/VO/HadesField_0168" },
		},
		-- Path C
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.85,
			RequiredLastLinePlayed = { "/VO/HadesField_0216", "/VO/HadesField_0367", "/VO/HadesField_0368", "/VO/HadesField_0369" },

			-- I'll show you brutish strength!
			{ Cue = "/VO/ZagreusField_2412" },
			-- Not interested in the analysis now, Father!
			{ Cue = "/VO/ZagreusField_2413" },
		},
		-- C_1
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.85,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2412" },

			-- And I'll show you the might that vanquished the Titans themselves.
			{ Cue = "/VO/HadesField_0218" },
			-- No! You're holding back, as always.
			{ Cue = "/VO/HadesField_0219" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.75,
			-- And I'll show you the might that vanquished the Titans themselves.
			RequiredLastLinePlayed = { "/VO/HadesField_0218" },

			-- I'm not afraid of you!
			{ Cue = "/VO/ZagreusField_2416", PreLineWait = 0.7 },
			-- I'll have you join them soon!
			{ Cue = "/VO/ZagreusField_2417" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.75,
			-- No! You're holding back, as always.
			RequiredLastLinePlayed = { "/VO/HadesField_0219" },

			-- Am I brutish or am I holding back? Make up your blasted mind!
			{ Cue = "/VO/ZagreusField_2418" },
			-- You want me to go all out? Then fine!
			{ Cue = "/VO/ZagreusField_2419" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2416" },

			-- You ought to be.
			{ Cue = "/VO/HadesField_0226" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2417" },

			-- You impudent...!
			{ Cue = "/VO/HadesField_0227" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2418" },

			-- I'll make you regret this.
			{ Cue = "/VO/HadesField_0228" },
		},
		{
			RandomRemaining = true,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2419" },
			PreLineWait = 0.4,

			-- Fine!
			{ Cue = "/VO/HadesField_0229" },
		},
		-- C_2
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.55,
			-- Not interested in the analysis now, Father!
			RequiredLastLinePlayed = { "/VO/ZagreusField_2413" },

			-- You have no inkling of what you need.
			{ Cue = "/VO/HadesField_0220" },
			-- Oh I think it's the perfect time.
			{ Cue = "/VO/HadesField_0221" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.75,
			-- You have no inkling of what you need.
			RequiredLastLinePlayed = { "/VO/HadesField_0220" },

			-- I said shut up with the analysis!
			{ Cue = "/VO/ZagreusField_2420" },
			-- I need you to quit blathering and fight!
			{ Cue = "/VO/ZagreusField_2421" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.85,
			-- Oh I think it's the perfect time.
			RequiredLastLinePlayed = { "/VO/HadesField_0221" },

			-- Oh I disagree!
			{ Cue = "/VO/ZagreusField_2422" },
			-- Well then, let's hear it!
			{ Cue = "/VO/ZagreusField_2423" },
		},
		{
			RandomRemaining = true,
			SuccessiveChanceToPlay = 0.35,
			PreLineWait = 0.4,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2420" },

			-- Unfilial oaf!
			{ Cue = "/VO/HadesField_0235" },
		},
		{
			RandomRemaining = true,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2421" },
			PreLineWait = 0.3,

			-- Happily.
			{ Cue = "/VO/HadesField_0231" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2422" },

			-- I thought you might!
			{ Cue = "/VO/HadesField_0232" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2423" },

			-- You'd not listen even if I did!
			{ Cue = "/VO/HadesField_0233" },
		},
		-- Path D
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.85,
			RequiredLastLinePlayed = { "/VO/HadesField_0217", "/VO/HadesField_0370", "/VO/HadesField_0371", "/VO/HadesField_0372", "/VO/HadesField_0373" },

			-- You know exactly what it's going to take!
			{ Cue = "/VO/ZagreusField_2414" },
			-- It'll take you getting out of my blasted way!
			{ Cue = "/VO/ZagreusField_2415" },
		},
		-- D_1
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.85,
			-- You know exactly what it's going to take!
			RequiredLastLinePlayed = { "/VO/ZagreusField_2291", "/VO/ZagreusField_2292", "/VO/ZagreusField_2294", "/VO/ZagreusField_2414" },

			-- Stubborn oaf!
			{ Cue = "/VO/HadesField_0222" },
			-- What you desire is impossible!
			{ Cue = "/VO/HadesField_0223" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			SuccessiveChanceToPlay = 0.75,
			-- Stubborn oaf!
			RequiredLastLinePlayed = { "/VO/HadesField_0222" },

			-- Miserable husk of a man!
			{ Cue = "/VO/ZagreusField_2424" },
			-- Wretched excuse for a father!
			{ Cue = "/VO/ZagreusField_2425" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.4,
			SuccessiveChanceToPlay = 0.75,
			-- What you desire is impossible!
			RequiredLastLinePlayed = { "/VO/HadesField_0223" },

			-- We'll see!
			{ Cue = "/VO/ZagreusField_2426" },
			-- Like you would know!
			{ Cue = "/VO/ZagreusField_2427" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2424" },

			-- What would you know of misery?!
			{ Cue = "/VO/HadesField_0234" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2425" },

			-- Such utter disrespect!
			{ Cue = "/VO/HadesField_0230" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.65,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2426" },

			-- We certainly shall!
			{ Cue = "/VO/HadesField_0236" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.45,
			SuccessiveChanceToPlay = 0.35,
			RequiredLastLinePlayed = { "/VO/ZagreusField_2427" },

			-- I do, you idiot!
			{ Cue = "/VO/HadesField_0237" },
		},
		-- D_2
		{
			RandomRemaining = true,
			PreLineWait = 0.4,
			ChanceToPlay = 0.85,
			-- It'll take you getting out of my blasted way!
			RequiredLastLinePlayed = { "/VO/ZagreusField_2415" },

			-- You cannot talk to me that way!
			{ Cue = "/VO/HadesField_0224" },
			-- No; that shall accomplish nothing.
			{ Cue = "/VO/HadesField_0225" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.3,
			SuccessiveChanceToPlay = 0.75,
			-- You cannot talk to me that way!
			RequiredLastLinePlayed = { "/VO/HadesField_0224" },

			-- Well I just did!
			{ Cue = "/VO/ZagreusField_2428" },
			-- And you cannot treat me this way!
			{ Cue = "/VO/ZagreusField_2429" },
		},
		{
			RandomRemaining = true,
			UsePlayerSource = true,
			PreLineWait = 0.3,
			SuccessiveChanceToPlay = 0.75,
			-- No; that shall accomplish nothing.
			RequiredLastLinePlayed = { "/VO/HadesField_0225" },

			-- Let's test that theory!
			{ Cue = "/VO/ZagreusField_2530" },
			-- Oh I think it shall!
			{ Cue = "/VO/ZagreusField_2531" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.3,
			SuccessiveChanceToPlay = 0.35,
			-- Well I just did!
			RequiredLastLinePlayed = { "/VO/ZagreusField_2428" },

			-- You won't do it again.
			{ Cue = "/VO/HadesField_0238" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.3,
			SuccessiveChanceToPlay = 0.35,
			-- And you cannot treat me this way!
			RequiredLastLinePlayed = { "/VO/ZagreusField_2429" },

			-- I'll treat you as you deserve.
			{ Cue = "/VO/HadesField_0239" },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.3,
			SuccessiveChanceToPlay = 0.35,
			-- Let's test that theory!
			RequiredLastLinePlayed = { "/VO/ZagreusField_2530" },

			-- Happily.
			{ Cue = "/VO/HadesField_0231" },
			-- Fine!
			{ Cue = "/VO/HadesField_0229", PreLineWait = 0.25, },
		},
		{
			RandomRemaining = true,
			PreLineWait = 0.3,
			SuccessiveChanceToPlay = 0.35,
			-- Oh I think it shall!
			RequiredLastLinePlayed = { "/VO/ZagreusField_2531" },

			-- I thought you might!
			{ Cue = "/VO/HadesField_0232" },
			-- You impudent...!
			{ Cue = "/VO/HadesField_0227", PreLineWait = 0.65 },
		},
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
				Actor = "StrangerOcclusionP",
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
				Actor = "StrangerOcclusionP",
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
				Actor = "StrangerOcclusionP",
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
				Actor = "StrangerOcclusionP",
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
				Actor = "StrangerOcclusionP",
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
				Actor = "StrangerOcclusionP",
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
	-- #region Charon
	-- Custom: Replaced Charon_ with Megaera_1
	CharonSurprisedVoiceLines = {
		Queue = "Interrupt",
		{
			RandomRemaining = true,
			BreakIfPlayed = true,
			-- TODO: This might need to be changed to ModsNikkelMHadesBiomes_NPC_Charon_01
			ObjectType = "NPC_Charon_01",
			PreLineWait = 0.1,
			Cooldowns =
			{
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
			ObjectType = "NPC_Persephone_01",
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
		{
			-- { Cue = "/VO/MelinoeField_3423", Text = "Brother...!", },
			-- { Cue = "/VO/MelinoeField_3424", Text = "Brother...", },
			-- { Cue = "/VO/MelinoeField_3913", Text = "Just hold on a little while longer, Brother...", },
			-- { Cue = "/VO/Melinoe_5062",      Text = "Prince Zagreus.", },
			-- { Cue = "/VO/Melinoe_1417",      Text = "That just might work..." },
			-- { Cue = "/VO/Melinoe_3412",      Text = "I know what to do..." },
			{ Cue = "/VO/Melinoe_1075",      Text = "{#Emph}By blood and darkness, let my will be done!" },
			{ Cue = "/VO/MelinoeField_3418", Text = "{#Emph}Night and Darkness, guide me to my blood beyond the grasp of Time!", PlayFirst = true },
			-- { Cue = "/VO/Melinoe_4706",      Text = "{#Emph}The strongest dreams shall shatter if they must!" },
		},
	},
	-- #endregion
}
