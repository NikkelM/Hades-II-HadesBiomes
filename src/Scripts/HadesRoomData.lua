mod.RoomData = mod.RoomData or {}
mod.RoomData.Base = {
	BaseRoom =
	{
		DebugOnly = true,
		SecretSpawnChance = 0.2,
		SecretDoorRequirements =
		{
			RequiredMinCompletedRuns = 1,
			RequiredMinBiomeDepth = 0,
			RequiredMinRoomsSinceSecretDoor = 4,
		},
		ShrinePointDoorSpawnChance = 0.3,
		ShrinePointDoorRequirements =
		{
			RequiredScreenViewed = "ShrineUpgrade",
			RequiredMinRoomsSinceShrinePointDoor = 4,
			RequiredCosmetics = { "ShrinePointGates", },
		},
		ChallengeSpawnChance = 0.25,
		ChallengeSwitchRequirements =
		{
			RequiredMinBiomeDepth = 5,
			RequiredMinRoomsSinceChallengeSwitch = 3,
		},
		WellShopSpawnChance = 0.40,
		WellShopRequirements =
		{
			RequiredMinBiomeDepth = 3,
			RequiredMinRoomsSinceWellShop = 2,
		},
		SellTraitShopChance = 0.10,
		SellTraitShopRequirements =
		{
			RequiredMinBiomeDepth = 3,
			RequiredUpgradeableGodTraits = 3,
			RequiredMinRoomsSinceSellTraitShop = 6,
		},
		FishingPointChance = 0.10,
		FishingPointRequirements =
		{
			RequiredCosmetics = { "FishingUnlockItem" },
			RequiredMinRoomsSinceFishingPoint = 10,
		},
		MinDepthBeforeIntros = 3,
		LockedUseSound = "/Leftovers/World Sounds/Caravan Interior/ChestClose",
		UnlockedUseSound = "/Leftovers/SFX/DoorClose",
		UsePromptOffsetX = 10,
		UsePromptOffsetY = -50,
		StopSecretMusic = true,
		IntroSequenceDuration = 0.1,
		ChallengeEncounterName = "TimeChallengeTartarus",
		NumExits = 1,
		ShrinePointRoomOptions = { "RoomChallenge01", "RoomChallenge02", "RoomChallenge03", "RoomChallenge04" },
	},

	_TartarusTemplateRoom =
	{
		InheritFrom = { "BaseRoom" },
	},
	_AsphodelTemplateRoom =
	{
		InheritFrom = { "BaseRoom" },
	},
	_ElysiumTemplateRoom =
	{
		InheritFrom = { "BaseRoom" },
	},
	_StyxTemplateRoom =
	{
		InheritFrom = { "BaseRoom" },
	},
	TestingRoom =
	{
		TestRoom = true,
	},
	C_CombatTemp01 =
	{
		InheritFrom = { "BaseRoom" },
	},

	RandomizeTrapTypes =
	{
		InheritFrom = { "BaseRoom" },
		DebugOnly = true,

		PreThingCreationUnthreadedEvents =
		{
			{
				FunctionName = "RandomizeTrapTypes",
				Args =
				{
					FractionMin = 0.0,
					FractionMax = 1.0,
				}
			},
		},
	},

	RandomizeTrapTypesAll =
	{
		InheritFrom = { "BaseRoom" },
		DebugOnly = true,

		PreThingCreationUnthreadedEvents =
		{
			{
				FunctionName = "RandomizeTrapTypes",
				Args =
				{
					FractionMin = 1.0,
					FractionMax = 1.0,
				}
			},
		},
	},

	AllPrePlacedTraps =
	{
		InheritFrom = { "BaseRoom" },
		DebugOnly = true,

		StartUnthreadedEvents =
		{
			{ FunctionName = "ActivatePrePlaced", Args = { FractionMin = 1.0, FractionMax = 1.0 } },
		},
	},

	-- ending
	Return01 =
	{
		InheritFrom = { "BaseRoom" },
		LegalEncounters = { "Surface" },
		-- Music = "/Music/EndTheme",
		Ambience = "/Leftovers/Object Ambiences/WaterRushingStream",
		ZoomFraction = 0.75,

		PauseMusicOnPauseScreen = true,

		EntranceFunctionName = "ReturnRoomEntrance",
		ExitFunctionName = "ReturnRoomExit",
		FlipHorizontalChance = 0.0,
		SkipSave = true,
		BlockCameraReattach = true,

		HideCombatUI = true,
		HideEncounterText = true,
		HideGoldGainFx = true,
		BlockTraitSetup = true,
		HideLowHealthShroud = true,

		SecretSpawnChance = 0.0,
		ShrinePointDoorSpawnChance = 0.0,
		ChallengeSpawnChance = 0.0,
		WellShopSpawnChance = 0.0,
		SellTraitShopChance = 0.0,
		FishingPointChance = 0.0,

		UnthreadedEvents =
		{
			-- HandleReturnBoatRideIntro & HandleReturnBoatRide are called from PersephoneReturnsHome01 narrative event
			{ FunctionName = "HandleReturnBoatRideAnimationSetup" },
		},
		ThreadedEvents =
		{
		},

		BoatAnimData =
		{
			Zagreus = "ZagreusEndingBoat_IdleLoop4",
			Persephone = "PersephoneEndingBoat_IdleLoop1",
		},

		Binks =
		{
			"CharonEndingBoatRowIdle_Bink",
			"CharonEndingBoatRow_Bink",
			"ZagreusEndingBoatIdleLoop_Bink",
			"ZagreusEndingBoatIdleFidget1_Bink",
			"ZagreusEndingBoatIdleFidget2_Bink",
			"NPC_PersephoneEndingBoatIdleLoop_Bink",
			"NPC_PersephoneEndingBoatIdleFidget1_Bink",
			"EndingBoatFront_Bink",
			"EndingBoatBack_Bink",
		},
	},

	Return02 =
	{
		InheritFrom = { "Return01" },
		Ambience = "None",

		UnthreadedEvents =
		{
			{ FunctionName = "HandleReturnBoatRide", Args = { NextMap = "Return03", } },
		},
		ThreadedEvents =
		{
		},

		BoatAnimData =
		{
			Zagreus = "ZagreusEndingBoat_IdleLoop4",
			Persephone = "PersephoneEndingBoat_IdleLoop3",
		},
	},

	Return03 =
	{
		InheritFrom = { "Return01" },
		Ambience = "None",

		UnthreadedEvents =
		{
			{ FunctionName = "HandleReturnBoatRide", Args = { NextMap = "Return04", } },
		},
		ThreadedEvents =
		{
			--{ FunctionName = "BoatRideSupportiveShadeReact", Args = { AnimationNames = { "StatusIconSmile" }, ReactionChance = 1.0, Delay = 20, Ids = { 571365 }, Shake = true } },
		},

		BoatAnimData =
		{
			--Zagreus = "ZagreusEndingBoat_IdleLoop3",
			Persephone = "PersephoneEndingBoat_IdleLoop2",
		},
	},

	Return04 =
	{
		InheritFrom = { "Return01" },
		Ambience = "None",

		UnthreadedEvents =
		{
			{ FunctionName = "HandleReturnBoatRide", Args = { NextMap = "Return05", } },
		},
		ThreadedEvents =
		{
		},

		BoatAnimData =
		{
			Zagreus = "ZagreusEndingBoat_IdleLoop5",
			Persephone = "PersephoneEndingBoat_IdleLoop4",
		},
	},

	Return05 =
	{
		InheritFrom = { "Return01" },
		Ambience = "None",

		UnthreadedEvents =
		{
			{ FunctionName = "HandleReturnBoatRide", Args = { NextMap = "Return06", } },
		},
		ThreadedEvents =
		{
		},

		BoatAnimData =
		{
			Zagreus = "ZagreusEndingBoat_IdleLoop2",
			Persephone = "PersephoneEndingBoat_IdleLoop2",
		},
	},

	Return06 =
	{
		InheritFrom = { "Return01" },

		ThreadedEvents = {},
		UnthreadedEvents =
		{
			{ FunctionName = "HandleReturnBoatRideAudio" },
			{ FunctionName = "HandleReturnBoatRide",     Args = {} },
			{ FunctionName = "HandleReturnBoatRideOutro" },
			{ FunctionName = "SurfaceKillHero",          Args = {} },
		},

		BoatAnimData =
		{
			Zagreus = "ZagreusEndingBoat_IdleLoop1",
			Persephone = "PersephoneEndingBoat_IdleLoop4",
		},

		RunOverrides =
		{
			DeathPresentationFunctionName = "BoatToDeathAreaTransition",
			ReturnedByBoat = true,
		},
	},

	RoomChallenge01 =
	{
		InheritFrom = { "BaseRoom" },
		RewardPreviewIcon = "RoomElitePreview3",
		RewardPreviewFx = "RoomRewardAvailableRareSparkles",

		NumExits = 3,
		EntranceFunctionName = "RoomEntrancePortal",
		NextRoomEntranceFunctionName = "RoomEntrancePortal",
		EntranceAnimation = "ZagreusDashEntrance",
		EntranceVfx = "ZagreusSecretDoorDiveFadeFx_Shrine",
		ExitAnimation = "ZagreusSecretDoorExit",
		ExitVfx = "ZagreusSecretDoorDiveFadeFx_Shrine",
		ExitDoorOpenAnimation = "ExitDoorLinesSpecial",
		ExitDoorCloseAnimation = "ExitDoorLinesSpecial",
		LocationText = "Location_Challenge",
		ResultText = "RunHistoryScreenResult_Challenge",
		RichPresence = "#RichPresence_Erebus",
		BiomeName = "Challenge",
		Ambience = "/Leftovers/Ambience/MountainAmbience",
		BlockRandomStems = true,
		SkipLeavePrevRoomSFX = true,
		UsePreviousRoomSet = true,
		ResetBinksOnEnter = true,
		ResetBinksOnExit = true,
		ForcedRewardStore = "RunProgress",
		IgnoreForceLootName = true,
		-- SkipMinBiomeDepthRequirements = true,
		BoonRaritiesOverride =
		{
			LegendaryChance = 0.1,
			EpicChance = 0.25,
			RareChance = 0.90
		},
		StackNumOverride = 2,
		RewardConsumableOverrides =
		{
			AddMaxHealth = 50,
			DropMoney = 200,
		},
		LegalEncounters = { "ShrineChallengeTartarus", "ShrineChallengeAsphodel", "ShrineChallengeElysium", },
		ZoomFraction = 0.75,
		SoftClamp = 0.75,

		SecretSpawnChance = 0.0,
		ShrinePointDoorSpawnChance = 0.0,
		ChallengeSpawnChance = 0.0,
		WellShopSpawnChance = 0.0,
		IneligibleRewards = { "Devotion", "WeaponUpgrade", },

		InspectPoints =
		{
			[515865] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				InteractTextLineSets =
				{
					CharonFirstInspect =
					{
						-- Is this where Father's goons assemble to come after me?
						EndCue = "/VO/ZagreusField_1472",
						EndWait = 0.3,
						{
							Cue = "/VO/Storyteller_0220",
							Text =
							"{#DialogueItalicFormat}Concealed in the dark recesses of the Underworld is the land of Erebus, wherein the dead await eternal sentencing; they long for the attention and good graces of their master, the Lord Hades."
						},
					},
				},
			},
		},
	},

	RoomChallenge02 =
	{
		InheritFrom = { "RoomChallenge01" },

		InspectPoints =
		{
		},
	},
	RoomChallenge03 =
	{
		InheritFrom = { "RoomChallenge01" },

		InspectPoints =
		{
		},
	},
	RoomChallenge04 =
	{
		InheritFrom = { "RoomChallenge01" },

		InspectPoints =
		{
		},
	},

	CharonFight01 =
	{
		InheritFrom = { "BaseRoom" },
		UsePreviousRoomSet = true,
		NoReward = true,

		EntranceFunctionName = "RoomEntrancePortal",
		NextRoomEntranceFunctionName = "RoomEntrancePortal",
		HeroEndPoint = 50059,

		ZoomFraction = 0.85,

		LegalEncounters = { "BossCharon" },

		LocationText = "Location_Challenge",
		BiomeName = "Challenge",

		Milestone = true,
		MilestoneIcon = "BossIcon",
		ResetBinksOnEnter = true,
		ResetBinksOnExit = true,

		Ambience = "/Leftovers/Object Ambiences/WaterRushingBloodRiver2",
		EnterGlobalVoiceLines = "EnteredCharonFightVoiceLines",

		FlipHorizontalChance = 0.0,
		IntroSequenceDuration = 0.0,
		BlockCameraReattach = true,
		SkipLastKillPresentation = true,
		ResultText = "RunHistoryScreenResult_CharonFight01",
		RichPresence = "#RichPresence_CharonFight",

		UnthreadedEvents =
		{
			{
				FunctionName = "BossIntroCharon",
				Args =
				{
					ProcessTextLinesIds = { 490802 },
					SetupBossIds = { 490802 },
					DelayedStart = true,
				},
			},
		},

		InspectPoints =
		{
			[556684] =
			{
				PlayOnce = true,
				UseText = "UseExamineMisc",
				RequiredMinCompletedRuns = 1,
				InteractTextLineSets =
				{
					CharonFight01_FirstInspect =
					{
						EndVoiceLines =
						{
							{
								PreLineWait = 0.4,
								RequiredMinElapsedTime = 3,
								-- Nice place you got here, mate!
								{ Cue = "/VO/ZagreusField_3903" },
							},
							{
								PreLineWait = 0.2,
								ObjectType = "Charon",
								-- Mmmrrrrnnn....
								{ Cue = "/VO/Charon_0011", RequiredPlayed = { "/VO/ZagreusField_3903" } },
							},
						},
						{
							Cue = "/VO/Storyteller_0366",
							Text =
							"{#DialogueItalicFormat}A hidden stretch of the boundless river Styx cuts through misty Erebus, providing for the river-boatman Charon a locale in which to deal with the unruliest of souls."
						},
					},
				},
			},
		},

	},
}
