-- Adds EncounterData for Tartarus from Hades to Hades II
local encounterData = mod.LoadHadesEncounterData("EncounterData.lua") or {}
local encounterDataTartarus = {
	-- Generic encounters
	-- These are used by all biomes, we define it here
	ModsNikkelMHadesBiomesGenerated = encounterData.Generated,
	BaseThanatos = encounterData.BaseThanatos,
	ThanatosTartarus = encounterData.ThanatosTartarus,
	BaseSurvival = encounterData.BaseSurvival,
	SurvivalTartarus = encounterData.SurvivalTartarus,

	Story_Sisyphus_01 = encounterData.Story_Sisyphus_01,
	GeneratedTartarus = encounterData.GeneratedTartarus,
	OpeningGenerated = encounterData.OpeningGenerated,
	DevotionTestTartarus = encounterData.DevotionTestTartarus,

	-- Minibosses
	MiniBossGrenadier = encounterData.MiniBossGrenadier,
	MiniBossHeavyRangedSplitter = encounterData.MiniBossHeavyRangedSplitter,
	MiniBossWretchAssassin = encounterData.MiniBossWretchAssassin,
	MiniBossHeavyRangedSplitter2 = encounterData.MiniBossHeavyRangedSplitter2,

	-- Bosses
	BossHarpy1 = encounterData.BossHarpy1,
	BossHarpy2 = encounterData.BossHarpy2,
	BossHarpy3 = encounterData.BossHarpy3,

	-- Challenge encounters within a room
	TimeChallengeTartarus = encounterData.TimeChallengeTartarus,
	PerfectClearChallengeTartarus = game.DeepCopyTable(encounterData.PerfectClearChallengeF),
	EliteChallengeTartarus = game.DeepCopyTable(encounterData.EliteChallengeF),

	-- Intro encounters
	-- ThiefMineLayerIntro = encounterData.ThiefMineLayerIntro, -- is broken
	HeavyRangedIntro = encounterData.HeavyRangedIntro,
	PunchingBagIntro = encounterData.PunchingBagIntro,
	LightSpawnerIntro = encounterData.LightSpawnerIntro,
	DisembodiedHandIntro = encounterData.DisembodiedHandIntro,
}

mod.UpdateField(encounterDataTartarus, "Generated", "ModsNikkelMHadesBiomesGenerated", { "InheritFrom" },
	"EncounterDataTartarus")

-- For TimeChallengeTartarus
mod.UpdateField(encounterDataTartarus, "Challenge", "TimeChallenge", { "InheritFrom" }, "EncounterDataTartarus")

-- For tables that should be replaced. The modifications append table data!
-- Can still use modifications if the modified table did not exist beforehand
local encounterReplacements = {
	ModsNikkelMHadesBiomesGenerated = {
		-- The "Generated" encounter in Hades II uses this to place enemies, Hades doesn't have this
		StartRoomUnthreadedEvents = { { FunctionName = "HandleEncounterPreSpawns", }, },
		PreSpawnSpawnOverrides = {
			WakeUpDelay = 0.3,
			AggroReactionTimeMin = 0.15,
			AggroReactionTimeMax = 0.45,
		},
		CanEncounterSkip = true,
		BlockAthenaEncounterKeepsake = false,
	},
	GeneratedTartarus = {
		-- To ensure we are not attacked while still running the entrance animation
		PreSpawnAIWakeDelay = 1,
		-- The original from Hades is 2.3
		ActiveEnemyCapBase = 4.8,
		-- The original from Hades is 30
		BaseDifficulty = 45,
		-- The original from Hades is 0.35
		ActiveEnemyCapDepthRamp = 0.75,
		-- The original from Hades is 11
		DepthDifficultyRamp = 13,
	},
	OpeningGenerated = {
		-- Blocks the LocationText from being shown an extra time in RoomEntranceDrop
		BlockLocationText = true,
		UnthreadedEvents = {
			{
				FunctionName = "SpawnRoomReward",
				Args = { WaitUntilPickup = true, }
			},
			{ FunctionName = "EncounterAudio" },
			{ FunctionName = "BeginOpeningEncounter" },
			{ FunctionName = "HandleEnemySpawns" },
			{ FunctionName = "CheckForAllEnemiesDead" },
			{ FunctionName = "PostCombatAudio" },
		},
		CanEncounterSkip = false,
	},

	PerfectClearChallengeTartarus = {
		InheritFrom = { "PerfectClearChallenge", "GeneratedTartarus" },
		EnemySet = EnemySets.EnemiesBiome1,
	},
	EliteChallengeTartarus = {
		InheritFrom = { "EliteChallenge", "GeneratedTartarus" },
		EnemySet = EnemySets.EnemiesBiome1_EliteChallenge,
	},
	BaseSurvival = {
		UnthreadedEvents = mod.EncounterSets.ModsNikkelMHadesBiomesEncounterEventsSurvival,
		StartRoomUnthreadedEvents = mod.NilValue,
	},

	Story_Sisyphus_01 = {
		ExitVoiceLines = {
			ObjectType = "NPC_Sisyphus_01",
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineAnim = "SisyphusIdleGreeting",

				-- Well you take care!
				{ Cue = "/VO/Sisyphus_0122" },
				-- Bye now!
				{ Cue = "/VO/Sisyphus_0123" },
				-- You can do it!
				{ Cue = "/VO/Sisyphus_0124" },
				-- You got this, Prince!
				-- { Cue = "/VO/Sisyphus_0125", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
				-- Farewell, then!
				{ Cue = "/VO/Sisyphus_0126" },
				-- All right, bye!
				{ Cue = "/VO/Sisyphus_0127" },
				-- Careful out there!
				{ Cue = "/VO/Sisyphus_0128" },
				-- Take care out there!
				{ Cue = "/VO/Sisyphus_0111" },
				-- Good luck out there!
				{ Cue = "/VO/Sisyphus_0112" },
				-- Godspeed and all!
				{ Cue = "/VO/Sisyphus_0113" },
				-- Take care of yourself!
				{ Cue = "/VO/Sisyphus_0114" },
				-- Go get them, Prince!
				-- { Cue = "/VO/Sisyphus_0115", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
				-- Farewell, Highness!
				{ Cue = "/VO/Sisyphus_0116" },
				-- Safe travels!
				{ Cue = "/VO/Sisyphus_0117" },
				-- Bye now!
				{ Cue = "/VO/Sisyphus_0118" },
				-- You can do this!
				{ Cue = "/VO/Sisyphus_0119" },
				-- So long for now!
				{ Cue = "/VO/Sisyphus_0120" },
				-- Keep going, Prince!
				-- { Cue = "/VO/Sisyphus_0121", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
				-- See you again, all right?
				{ Cue = "/VO/Sisyphus_0242" },
				-- Do tell the Furies I said hi!
				{ Cue = "/VO/Sisyphus_0243", RequiredCosmetics = { "SisyphusQuestItem" } },
				-- You have this, Prince!
				-- { Cue = "/VO/Sisyphus_0244", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
				-- Stop by again sometime!
				{ Cue = "/VO/Sisyphus_0245", RequiredTextLines = { "SisyphusGift02" }, },
				-- Careful out there, all right?
				{ Cue = "/VO/Sisyphus_0246" },
				-- May you get out of here this time, Highness!
				{ Cue = "/VO/Sisyphus_0247", RequiredTextLines = { "SisyphusGift02" }, },
				-- Always a pleasure, Prince!
				-- { Cue = "/VO/Sisyphus_0248", Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
				-- So long, Highness!
				{ Cue = "/VO/Sisyphus_0249" },
				-- Think he'll go all the way this time, Bouldy?
				{ Cue = "/VO/Sisyphus_0250", RequiredTextLines = { "SisyphusMeeting06" }, },
				-- Keep fighting, Highness!
				{ Cue = "/VO/Sisyphus_0251" },
				-- Thanks for stopping by!
				{ Cue = "/VO/Sisyphus_0252" },
				-- Until next time, all right?
				{ Cue = "/VO/Sisyphus_0253", RequiredTextLines = { "SisyphusGift02" }, },
			},
		},
		DistanceTriggers = {
			{
				TriggerObjectType = "NPC_Sisyphus_01",
				WithinDistance = 600,
				LeaveDistanceBuffer = 60,
				VoiceLines = {
					{
						RandomRemaining = true,
						PreLineAnim = "SisyphusIdleGreeting",

						-- Your Highness!
						{ Cue = "/VO/Sisyphus_0058" },
						-- Hullo!
						{ Cue = "/VO/Sisyphus_0054", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- That who I think it is...?
						{ Cue = "/VO/Sisyphus_0050", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Ahoy!
						{ Cue = "/VO/Sisyphus_0051", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Ahoy there!
						{ Cue = "/VO/Sisyphus_0052", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Look who!
						{ Cue = "/VO/Sisyphus_0053", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Hullo, hullo!
						{ Cue = "/VO/Sisyphus_0055", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Just on a little break!
						{ Cue = "/VO/Sisyphus_0056", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Perfect timing!
						{ Cue = "/VO/Sisyphus_0057", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Well, well!
						{ Cue = "/VO/Sisyphus_0059", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Aren't you a sight!
						{ Cue = "/VO/Sisyphus_0060", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Prince Z.!
						-- { Cue = "/VO/Sisyphus_0061", RequiredPlayed = { "/VO/Sisyphus_0058" }, Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- Hey, hey!
						{ Cue = "/VO/Sisyphus_0062", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Good morning or whenever!
						{ Cue = "/VO/Sisyphus_0063", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Bouldy, look who!
						{ Cue = "/VO/Sisyphus_0206", RequiredPlayed = { "/VO/Sisyphus_0058" }, RequiredTextLines = { "SisyphusMeeting06" }, },
						-- Hullo, Your Highness!
						{ Cue = "/VO/Sisyphus_0207", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- You're back, welcome!
						{ Cue = "/VO/Sisyphus_0208", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- He's back again, Bouldy!
						{ Cue = "/VO/Sisyphus_0209", RequiredPlayed = { "/VO/Sisyphus_0058" }, RequiredTextLines = { "SisyphusMeeting06" }, },
						-- Good to see you!
						{ Cue = "/VO/Sisyphus_0210", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Caught me on a break again!
						{ Cue = "/VO/Sisyphus_0211", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Hullo, Prince Z.!
						-- { Cue = "/VO/Sisyphus_0212", RequiredPlayed = { "/VO/Sisyphus_0058" }, Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- How nice to see you, Prince!
						-- { Cue = "/VO/Sisyphus_0213", RequiredPlayed = { "/VO/Sisyphus_0058" }, Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- It's him, Bouldy!
						{ Cue = "/VO/Sisyphus_0214", RequiredPlayed = { "/VO/Sisyphus_0058" }, RequiredTextLines = { "SisyphusMeeting06" }, },
						-- Well if it isn't you!
						{ Cue = "/VO/Sisyphus_0215", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Ahoy, what's new of late?
						{ Cue = "/VO/Sisyphus_0216", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- The Prince returns!
						-- { Cue = "/VO/Sisyphus_0217", RequiredPlayed = { "/VO/Sisyphus_0058" }, Cooldowns = { { Name = "SisyphusSaidPrinceRecently", Time = 10 }, }, },
						-- What a surprise!
						{ Cue = "/VO/Sisyphus_0218", RequiredPlayed = { "/VO/Sisyphus_0058" }, },
						-- Why, look who's here, Bouldy!
						{ Cue = "/VO/Sisyphus_0219", RequiredPlayed = { "/VO/Sisyphus_0058" }, RequiredTextLines = { "SisyphusMeeting06" }, },
					},
					{
						UsePlayerSource = true,
						RandomRemaining = true,
						SuccessiveChanceToPlay = 0.66,
						RequiredTextLines = { "SisyphusFirstMeeting" },

						-- Hello, sir.
						{ Cue = "/VO/ZagreusField_0463" },
						-- Hey sir!
						{ Cue = "/VO/ZagreusField_0464" },
					},
				},
			},
		},
	},
}

local encounterModifications = {
	-- GENERIC
	ModsNikkelMHadesBiomesGenerated = {
		BlockTypesAcrossWaves = true,
		UnthreadedEvents = game.EncounterSets.EncounterEventsDefault,
		CountsForRoomEncounterDepth = true,
	},
	OpeningGenerated = {
		-- The modifier should get the difficulty down to 0 for the first room, orient from BaseDifficulty in GeneratedTartarus
		DifficultyModifier = -60,
		-- First room of the run needs to wait for the boon pickup before spawning enemies
		PreSpawnEnemies = false,
		NoFirstWaveStartDelay = true,
		SpawnOverrides = { UseActivatePresentation = false, },
		CanEncounterSkip = false,
		BlockNextBiomeEnemyShrineUpgrade = true,
		BlockAthenaEncounterKeepsake = true,
		-- Requires AthenaFirstPickup voiceline, which is not implemented
		RequiredTextLines = mod.NilValue,
		WaveTemplate = {
			Spawns = {},
			OverrideValues = game.BaseWaveOverrideValues,
			StartDelay = 0.0
		},
		Blacklist = { LightSpawner = true, },
	},
	DevotionTestTartarus = {
		CanEncounterSkip = false,
	},
	Story_Sisyphus_01 = {
		StartRoomUnthreadedEvents = {
			[1] = { FunctionName = "ActivatePrePlaced", Args = { FractionMin = 1.0, FractionMax = 1.0, LegalTypes = { "NPC_Sisyphus_01", "ModsNikkelMHadesBiomes_NPC_Bouldy_01" }, } },
			[3] = mod.NilValue,
			[4] = mod.NilValue,
			[5] = mod.NilValue,
			[6] = mod.NilValue,
			[7] = mod.NilValue,
			[8] = mod.NilValue,
		},
	},
	BaseThanatos = {
		LoadModdedVoiceBanks = { "Thanatos", "ThanatosField", "ZagreusField" },
		RequiredKillFunctionName = _PLUGIN.guid .. "." .. "TrackThanatosChallengeProgress",
		BlockAthenaEncounterKeepsake = true,
		SkipExitReadyCheckpoint = true,
	},
	BaseSurvival = {
		LoadModdedVoiceBanks = { "HadesField" },
		BlockAthenaEncounterKeepsake = true,
		CanEncounterSkip = false,
		PreSpawnEnemies = false,
	},

	-- MINIBOSSES
	MiniBossGrenadier = {
		LoadPackages = { "BiomeB" },
		CanEncounterSkip = false,
		BlockNextBiomeEnemyShrineUpgrade = true,
	},
	MiniBossHeavyRangedSplitter = {
		WipeEnemiesOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CancelSpawnsOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CanEncounterSkip = false,
	},
	MiniBossHeavyRangedSplitter2 = {
		WipeEnemiesOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CancelSpawnsOnKillAllTypes = { "HeavyRangedSplitterMiniboss" },
		CanEncounterSkip = false,
	},
	MiniBossWretchAssassin = {
		WipeEnemiesOnKillAllTypes = { "WretchAssassinMiniboss" },
		CancelSpawnsOnKillAllTypes = { "WretchAssassinMiniboss" },
		CanEncounterSkip = false,
		BlockNextBiomeEnemyShrineUpgrade = true,
	},

	-- BOSSES
	BossHarpy1 = {
		WipeEnemiesOnKillAllTypes = { "Harpy" },
		CancelSpawnsOnKillAllTypes = { "Harpy" },
		PostUnthreadedEvents = mod.NilValue,
		StartRoomUnthreadedEvents = {
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryActivations" },
		},
		BlockNextBiomeEnemyShrineUpgrade = true,
	},
	BossHarpy2 = {
		WipeEnemiesOnKillAllTypes = { "Harpy2" },
		CancelSpawnsOnKillAllTypes = { "Harpy2" },
		StartRoomUnthreadedEvents = {
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryActivations" },
		},
		BlockNextBiomeEnemyShrineUpgrade = true,
	},
	BossHarpy3 = {
		WipeEnemiesOnKillAllTypes = { "Harpy3" },
		CancelSpawnsOnKillAllTypes = { "Harpy3" },
		StartRoomUnthreadedEvents = {
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "MultiFuryActivations" },
		},
		BlockNextBiomeEnemyShrineUpgrade = true,
	},
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataTartarus, encounterModifications, encounterReplacements)
