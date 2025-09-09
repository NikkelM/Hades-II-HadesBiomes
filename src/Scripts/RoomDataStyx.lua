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

	D_MiniBoss03 = {
		LegalEncounters = { "ModsNikkelMHadesBiomesMiniBossCrawler", "MiniBossHeavyRangedForked" },
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

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerStyxIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerStyxOut",
		-- Devotion rewards are not available in Styx
		IneligibleRewards = { "Devotion" },
		OptionalOverrides = {
			IneligibleRewards = { "WeaponUpgrade", "Devotion" },
		},
	},
	BaseStyxWingEnd = {
		NextRoomEntranceFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesReturnToStyxHubPresentation",
		IneligibleRewards = { "Devotion" },
	},

	-- OPENING ROOMS
	D_Intro = {
		InheritFrom = { "BaseStyx", "BiomeStartRoom", },
		Starting = true,
		BlockRunProgressUI = true,
		EntranceFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesDelayedRoomEntranceStandard",
		StartUnthreadedEvents = {
			{ FunctionName = "EndBiomeRecords", },
			{ FunctionName = "EndAllBiomeStates" },
		},
		EntranceDirection = "LeftRight",
		StrictLeftRight = true,
		FlipHorizontalChance = 0.0,
		ThreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "DisplayLocationText", Args = { AnimationName = "ModsNikkelMHadesBiomesInfoBannerStyxIn", AnimationOutName = "ModsNikkelMHadesBiomesInfoBannerStyxOut" }, },
		},
	},
	D_Hub = {
		-- Megaera for Storyteller for Cerberus
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		UnthreadedEvents = {
			[1] = {
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro",
			},
		},
		-- Shorter as we add more wait time after the animation starts
		IntroSequenceDuration = 0.3,
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceD_Hub",
		DistanceTriggers = {
			[1] = {
				TriggerObjectType = "ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
			},
			[2] = {
				TriggerObjectType = "ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
			},
		},
		StoreDataName = "Q_WorldShop",
		PostCombatReloadThreadedEvents = { { FunctionName = "CheckConversations" } },
		-- We need to call this before the PostCombatReloadThreadedEvents as by then the room is already visible and the items would pop in
		ModsNikkelMHadesBiomesPostCombatReloadThreadedEventsDHub = game.EncounterSets.ShopRoomEvents,
		SaveWhitelist = {
			ObjectStates = true,
			DoorsChosen = true,
			FirstPurchase = true,
		},
		-- To make sure the shop is set up correctly when re-entering the room
		ModsNikkelMHadesBiomesOnReloadStripEncounter = true,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
		HoundFamiliarIgnoreUnitsForPathfinding = true,
		StartRoomPresentationOnReload = true,
		EncounterCompleteWait = 0.02,
		UnlockExitsWait = 0.02,
	},

	-- MINIBOSSES
	D_MiniBoss03 = {
		-- Need to always call this, as overwriting it in the overrides is too late. The function will skip itself if it's not the correct encounter
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceCrawlerMiniBoss",
		-- Moved here from overrides, as those are applied after the local roomData variable is set which is used to determine the UnthreadedEvents to run
		UnthreadedEvents = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro",
				Args = {
					ProcessTextLinesIds = { 552394 },
					SetupBossIds = { 552394 },
				},
			},
			{
				FunctionName = "CheckAssistHint",
				Args = {
					Delay = 10.0,
				}
			},
		},
		EncounterSpecificDataOverwrites = {
			MiniBossCrawler = mod.NilValue,
			ModsNikkelMHadesBiomesMiniBossCrawler = {
				SkipLastKillSound = true,
			},
		},
	},

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
				FunctionName = _PLUGIN.guid .. "." .. "BossIntroHades",
				Args = { DelayedStart = true, },
			},
		},
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceHades",
		ExitFunctionName = _PLUGIN.guid .. "." .. "CheckRunEndPresentation",
	},

	-- OTHER
	D_Reprieve01 = {
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
		StartUnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "SpawnConsumables", },
		}
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Styx, roomModifications, roomReplacements, "Styx")
