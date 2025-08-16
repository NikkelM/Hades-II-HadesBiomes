-- Adds EncounterData for Elysium from Hades to Hades II
local encounterData = mod.LoadHadesEncounterData("EncounterData.lua") or {}
local encounterDataElysium = {
	-- Generic encounters
	GeneratedElysium = encounterData.GeneratedElysium,
	DevotionTestElysium = encounterData.DevotionTestElysium,
	Story_Patroclus_01 = encounterData.Story_Patroclus_01,

	-- Minibosses
	MiniBossMinotaur = encounterData.MiniBossMinotaur,
	MiniBossNakedSpawners = encounterData.MiniBossNakedSpawners,

	-- Bosses
	BossTheseusAndMinotaur = encounterData.BossTheseusAndMinotaur,

	-- Challenge encounters within a room
	TimeChallengeElysium = encounterData.TimeChallengeElysium,
	PerfectClearChallengeElysium = game.DeepCopyTable(encounterData.PerfectClearChallengeF),
	EliteChallengeElysium = game.DeepCopyTable(encounterData.EliteChallengeF),

	-- Intro encounters
	ShadeSpearUnitIntro = encounterData.ShadeSpearUnitIntro,
	ShadeSwordUnitIntro = encounterData.ShadeSwordUnitIntro,
	ShadeShieldUnitIntro = encounterData.ShadeShieldUnitIntro,
	ShadeBowUnitIntro = encounterData.ShadeBowUnitIntro,
	FlurrySpawnerUnitIntro = encounterData.FlurrySpawnerUnitIntro,
	IllusionistIntro = encounterData.IllusionistIntro,
	ChariotIntro = encounterData.ChariotIntro,
	ChariotSuicideIntro = encounterData.ChariotSuicideIntro,
}

mod.UpdateField(encounterDataElysium, "Generated", "ModsNikkelMHadesBiomesGenerated", { "InheritFrom" },
	"EncounterDataElysium")

-- For TimeChallengeElysium
mod.UpdateField(encounterDataElysium, "Challenge", "TimeChallenge", { "InheritFrom" }, "EncounterDataElysium")

-- For tables that should be replaced. The modifications append table data!
-- Can still use modifications if the modified table did not exist beforehand
local encounterReplacements = {
	GeneratedElysium = {
		-- The original from Hades is 2.3 - inherited from Generated
		ActiveEnemyCapBase = 3.9,
		-- The original from Hades is 220
		BaseDifficulty = 300,
		-- The original from Hades is 0.4
		ActiveEnemyCapDepthRamp = 0.7,
		-- The original from Hades is 0.35
		TypeCountDepthRamp = 0.55,
		-- The original from Hades is 70
		DepthDifficultyRamp = 80,
		-- Original is missing HandleEncounterPreSpawns
		StartRoomUnthreadedEvents = {
			{ FunctionName = "HandleEncounterPreSpawns" },
		},
		-- The normal events, plus disabling room traps in the end
		UnthreadedEvents = {
			{ FunctionName = "EncounterAudio" },
			{ FunctionName = "HandleEnemySpawns" },
			{ FunctionName = "CheckForAllEnemiesDead" },
			{ FunctionName = "DisableRoomTraps" },
			{ FunctionName = "PostCombatAudio" },
			{ FunctionName = "SpawnRoomReward" },
		},
	},

	Story_Patroclus_01 = {
		UnthreadedEvents = {},
	},

	PerfectClearChallengeElysium = {
		InheritFrom = { "PerfectClearChallenge", "GeneratedElysium" },
		EnemySet = EnemySets.EnemiesBiome3,
	},
	EliteChallengeElysium = {
		InheritFrom = { "EliteChallenge", "GeneratedElysium" },
		EnemySet = EnemySets.EnemiesBiome3_EliteChallenge,
	},
}

local encounterModifications = {
	-- GENERIC
	DevotionTestElysium = {
		CanEncounterSkip = false,
	},
	Story_Patroclus_01 = {
		ExitVoiceLines = { ObjectType = "NPC_Patroclus_01", },
	},

	-- MINIBOSSES
	MiniBossNakedSpawners = {
		-- Move the max enemies from 6 to 8 and add additional FlurrySpawners when the Vow of Shadows is active
		EnemyCountShrineModifierName = "MinibossCountShrineUpgrade",
		EnemyCountShineModifierAmount = 2,
		ManualWaveTemplates = {
			[1] = {
				Spawns = {
					[3] = {
						Name = "FlurrySpawner",
						TotalCount = 3,
						RequiredMiniBossShrine = true,
					},
				},
			},
		},
		CanEncounterSkip = false,
	},
	MiniBossMinotaur = {
		InheritFrom = { "MinibossEncounter" },
		BlockAthenaEncounterKeepsake = true,
		CanEncounterSkip = false,
		BlockRespawnShrineUpgrade = true,
		DelayedStart = true,
		-- Without this, the room exits will immediately unlock after the conversation
		UnthreadedEvents = {
			{
				FunctionName = "ModsNikkelMHadesBiomesBossIntro",
				Args = { DelayedStart = true, },
			},
			{ FunctionName = "EncounterAudio" },
			{ FunctionName = "HandleEnemySpawns" },
			{ FunctionName = "CheckForAllEnemiesDead" },
			{ FunctionName = "PostCombatAudio" },
			{ FunctionName = "SpawnRoomReward" },
		},
	},

	-- BOSSES
	BossTheseusAndMinotaur = {
		DelayedStart = true,
		PostUnthreadedEvents = mod.NilValue,
		-- For the Grenade graphics of EM Theseus
		LoadPackages = { "BiomeOBoss" },
	},
}

mod.ApplyModificationsAndInheritEncounterData(encounterDataElysium, encounterModifications, encounterReplacements)
