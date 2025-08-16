-- Adds RoomData for Styx from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseStyx = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
		RoomSetName = "Styx",

		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		ShrinePointDoorRequirements = { Skip = true },
	},

	D_Hub = {
		Binks = { "Cerberus_HubIdle_Bink", },
	},
}

local roomModifications = {
	-- GENERIC
	BaseStyx = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },

		Ambience = "/Leftovers/Object Ambiences/CreepyIslandAmbience",
		ReverbValue = 2.0,

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Styx",

		TimeChallengeEncounterOptions = { "TimeChallengeStyx" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeStyx" },
		EliteChallengeEncounterOptions = { "EliteChallengeStyx" },

		LocationAnimName = "LocationBackingIrisChaosIn",
		LocationAnimOutName = "LocationBackingIrisChaosOut",
	},

	-- OPENING ROOMS
	D_Intro = {
		InheritFrom = { "BaseStyx", "BiomeStartRoom", },
		Starting = true,
		BlockRunProgressUI = true,
		StartUnthreadedEvents = {
			{ FunctionName = "EndBiomeRecords", },
			{ FunctionName = "EndAllBiomeStates" },
		},
		EntranceDirection = "LeftRight",
		StrictLeftRight = true,
		FlipHorizontalChance = 0.0,
		ThreadedEvents = {
			[1] = { Args = { AnimationName = "LocationBackingIrisChaosIn", AnimationOutName = "LocationBackingIrisChaosOut" }, },
		},
	},
	D_Hub = {
		-- Megaera for Storyteller
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		UnthreadedEvents = {
			[1] = {
				FunctionName = "ModsNikkelMHadesBiomesBossIntro",
			},
		},
		DistanceTriggers = {
			[1] = {
				TriggerObjectType = "ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
			},
			[2] = {
				TriggerObjectType = "ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
			},
		},
	},

	-- MINIBOSSES
	-- C_MiniBoss01 = {
	-- 	LoadModdedVoiceBanks = { "Minotaur", "ZagreusField" },
	-- 	RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	-- },

	-- BOSSES
	D_Boss01 = {
		LoadModdedVoiceBanks = { "HadesField", "ZagreusField" },
		ForcedReward = "MixerIBossDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
		BlockNextBiomeEnemyShrineUpgrade = true,
		UnthreadedEvents = {
			[1] = {
				Args = {
					DelayedStart = true,
				},
			},
		},
	},

	-- OTHER
	D_Reprieve01 = {
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Styx, roomModifications, roomReplacements, "Styx")
