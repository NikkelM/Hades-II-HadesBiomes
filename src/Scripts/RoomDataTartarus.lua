-- Adds RoomData for Tartarus from Hades to Hades II

local roomSetDataTartarus = mod.LoadHadesRoomData("RoomDataTartarus.lua").Tartarus

local roomReplacements = {
	-- GENERIC
	BaseTartarus = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		WellShopRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.WellShopRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
	},

	-- OPENING ROOMS
	RoomOpening = {
		-- Music
		MusicActiveStems = { "Guitar", "Drums", "Bass", },
		Music = mod.NilValue,
		MusicRequirements = mod.NilValue,
		MusicStartDelay = 3.75,
	},

	-- SHOPS
	A_Shop01 = {
		Binks = mod.NilValue,
	},
	-- TODO: Add additional bosses as they are implemented
	A_PreBoss01 = {
		LinkedRooms = { "A_Boss01" }, -- , "A_Boss02", "A_Boss03"
		Binks = mod.NilValue,
	},
}

local roomModifications = {
	-- GENERIC
	BaseTartarus = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", "TartarusModsNikkelMHadesBiomes" },

		SaveProfileLocationText = "ModdedLocation_Hades_Tartarus",

		TimeChallengeEncounterOptions = { "TimeChallengeTartarus" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeTartarus" },
		EliteChallengeEncounterOptions = { "EliteChallengeTartarus" },

		-- Erebus challenge encounter are not currently working - the skip flag always makes the check return false so we don't get any gates spawned
		ShrinePointDoorRequirements = { Skip = true },
	},

	-- OPENING ROOMS
	RoomOpening = {
		InheritFrom = { "BaseTartarus", "BiomeStartRoom", },
		LegalEncounters = { "OpeningGenerated" },
		EntranceFunctionName = "RoomEntranceMaterialize",
		EntranceFunctionArgs = { HeroGoalAngle = 335 },
		ThreadedEvents = {
			-- This will work with roomSetDataTartarus.RoomOpening.ThreadedEvents[3].Args.SpawnTypes = { "TartarusGhost01" }, but has the problem of spawning all Ghosts on the same ID
			[3] = mod.NilValue
		},
		StartUnthreadedEvents = {
			-- Don't start the demo presentation mode
			[1] = mod.NilValue,
			-- Don't play the standard music event, it won't be able to get changed later
			[3] = mod.NilValue,
		},
		ForcedRewards = mod.NilValue,
		IneligibleRewards = game.RewardSets.OpeningRoomBans,
		MaxAppearancesThisBiome = 1,
		BlockRunProgressUI = true,
		StartThreadedEvents =
		{
			{ FunctionName = "CheckBiomeStateStart" },
			{ FunctionName = "ShadeMercManager",    Args = { StartingCountMin = 3, StartingCountMax = 12, ObjectNames = { "ShadeMerc" }, MaxActive = 12 } },
		},
		UnthreadedEvents = {
			[1] = {
				-- Requires AthenaFirstPickup voiceline, which is not implemented
				GameStateRequirements = mod.NilValue
			}
		}
	},
	-- This is the first run's opening room, which forces Athena boons
	RoomSimple01 = mod.NilValue,

	-- SHOPS
	-- TODO: Move some of these into a base shop object for all Hades shops to inherit from to prevent duplicates
	A_Shop01 = {
		ThreadedEvents = {
			-- To get PatrolPath working, see RoomOpening
			[1] = mod.NilValue,
			[2] = mod.NilValue
		},
		StoreDataName = "WorldShop",
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},
	A_PreBoss01 = {
		SkipLastKillPresentation = true,
		StartUnthreadedEvents = game.EncounterSets.ShopRoomEvents,
		IneligibleRewards = { "Devotion", "RoomMoneyDrop", },
		FamiliarsPreferSpawnPointMovement = true,
		FrogFamiliarMaxLeapDistance = 800,
	},

	-- MINIBOSSES
	-- Other miniboss rooms inherit from this
	A_MiniBoss01 = {
		-- TODO: This is misaligned, done in EventPresentation Line 3921 onwards
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
	},

	-- BOSSES
	A_Boss01 = {
		LoadModdedVoiceBanks = { "Megaera*", "ZagreusField" },
		-- Replaces MegaeraHome with Megaera voicelines
		UnthreadedEvents = {
			[1] = {
				FunctionName = "ModsNikkelMHadesBiomesBossIntro",
				Args = {
					VoiceLines = {
						[1] = { Cue = "/VO/Megaera_0061" },
						[2] = { Cue = "/VO/Megaera_0053", RequiredPlayed = { "/VO/Megaera_0061" }, },
						[4] = { Cue = "/VO/Megaera_0057", },
					},
				},
			},
		},
		-- TODO - Hades II drops the same item always - which one to choose?
		ForcedReward = "MixerFBossDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
	},

	-- OTHER
	A_Reprieve01 = {
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
	},
	A_PostBoss01 = {
		ExitPreviewAnim = "HadesExitPreview",
		-- TODO: Remove placeholder
		NextRoomSet = { "G" },
		SellShopSpawnChance = 1.0,
		SellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossSellTraitShops" },
			},
		},
		-- Defines where the well spawns, making sure the sell shop spawns on the other possible ID
		WellShopChallengeBaseId = 487438,
		WellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossWellShops" },
			},
		},
		ObstacleData = {
			[486504] = {
				SetupGameStateRequirements = {
					{
						PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradePostBossGiftRack" },
					},
					RequiredCosmetics = mod.NilValue,
				},
			},
			-- Makes the exit door interactable
			[430000] = {
				ActivateIds = { 430000, },
			},
		},
	},
}

-- Assign separately so we don't get a circular reference
game.RoomData.ModsNikkelMHadesBiomesBaseRoom = {
	-- We need to always load the RoomManagerModsNikkelMHadesBiomes package to get animations for non-binked enemies
	LoadModdedPackages = { "RoomManagerModsNikkelMHadesBiomes", "FxModsNikkelMHadesBiomes", "GUIModsNikkelMHadesBiomes", "ModsNikkelMHadesBiomesPortraits" },
}

mod.ApplyModificationsAndInheritRoomData(roomSetDataTartarus, roomModifications, roomReplacements, "Tartarus")
