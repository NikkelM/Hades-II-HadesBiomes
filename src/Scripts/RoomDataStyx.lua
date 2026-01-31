-- Adds RoomData for Styx from Hades to Hades II

local roomReplacements = {
	-- GENERIC
	BaseStyx = {
		SecretDoorRequirements = game.DeepCopyTable(game.RoomSetData.Base.BaseRoom.SecretDoorRequirements),
		-- The Asphodel teleport in Hades II - we don't want it in Hades biomes
		AnomalyDoorChance = 0.0,
		RoomSetName = "Styx",

		-- We set the requirements, but the chance is set to 0 for Styx (there are no Challenges)
		TimeChallengeSwitchRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockInfernalTrovesIncantation" },
			},
		},
		PerfectClearSwitchRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockMoonMonumentsIncantation" },
			},
		},
		EliteSwitchRequirements = {
			NamedRequirements = { "TalentLegal", },
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockMoonMonumentsIncantation" },
			},
		},
		WellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation" },
			},
			RequiredMinCompletedRuns = 1,
			RequiredMinRoomsSinceWellShop = 6,
		},
		SellShopRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation" },
			},
			RequiredMinCompletedRuns = 1,
			RequiredUpgradeableGodTraits = 3,
			RequiredMinRoomsSinceSellTraitShop = 6,
		},
		-- We set the requirements, but the chance is set to 0 for Styx (there are no Chaos or Erebus Gates)
		ShrinePointDoorRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockShrinePointGatesIncantation" },
			},
			{
				PathTrue = { "GameState", "ScreensViewed", "Shrine" },
			},
			RequiredMinRoomsSinceShrinePointDoor = 8,
			NamedRequirementsFalse = { "StandardPackageBountyActive" },
		},

		HasHarvestPoint = true,
		HasShovelPoint = true,
		HasPickaxePoint = true,
		HasExorcismPoint = true,
		HasFishingPoint = true,

		HarvestPointChances = { 0.3, },
		ShovelPointChance = 0.2,
		PickaxePointChance = 0.3,
		ExorcismPointChance = 0.2,
		FishingPointChance = 0.15,

		HarvestPointRequirements = {
			{
				SumPrevRooms = 11,
				Path = { "NumHarvestPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantStyx" },
						Comparison = "<",
						Value = 16,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
		ShovelPointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedElysium" },
				Comparison = ">=",
				Value = 3,
			},
			{
				-- At least two major rooms
				SumPrevRooms = 11,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				-- At least one major room
				SumPrevRooms = 6,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedStyx" },
						Comparison = "<",
						Value = 12,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 6,
						Path = { "NumPickaxePoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
		PickaxePointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreElysium" },
				Comparison = ">=",
				Value = 5,
			},
			{
				SumPrevRooms = 11,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreStyx" },
						Comparison = "<",
						Value = 8,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 6,
						Path = { "NumShovelPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
		ExorcismPointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
			{
				Path = { "GameState", "ExorcisedNames", "ElysiumGhostIdle" },
				Comparison = ">=",
				Value = 2,
			},
			{
				SumPrevRooms = 11,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					OrRequirements = {
						{
							{
								Path = { "GameState", "LifetimeResourcesGained", "MemPointsCommon" },
								Comparison = "<=",
								Value = 1500,
							},
						},
						{
							{
								Path = { "GameState", "ExorcisedNames", "3dGhostIdle" },
								Comparison = "<",
								Value = 6,
							},
						},
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 6,
						Path = { "NumFishingPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
		FishingPointRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				SumPrevRooms = 11,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 6,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", },
						NotHasAll = { "Fish_Styx_Common_01", "Fish_Styx_Rare_01", "Fish_Styx_Legendary_01" },
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 6,
						Path = { "NumExorcismPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
	},

	D_Intro = {
		EnterVoiceLines = {
			-- Chaos Trial/Bounty
			{ GlobalVoiceLines = "StartPackagedBountyRunVoiceLines" },
			-- TODO: Normal Melinoe voicelines
		},
	},

	D_Hub = {
		Binks = { "Cerberus_HubIdle_Bink", },

		DistanceTriggers = {
			{
				TriggerObjectType = "ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
				WithinDistance = 1500,
				GameStateRequirements = {
					RequiredRoomThisRun = "D_Reprieve01",
				},
				FunctionName = _PLUGIN.guid .. "." .. "PlaySoundWithSource",
				Args = { Name = "/VO/CerberusBarks" },
			},
			{
				TriggerObjectType = "ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
				WithinDistance = 400,
				LeaveDistanceBuffer = 60,
				VoiceLines = {
					Cooldowns = { { Name = "ApproachedCerberusSpeech", Time = 15 }, },
					{
						PlayOnceFromTableThisRun = true,
						SuccessiveChanceToPlay = 0.33,
						RequiredFalseTextLinesThisRun = { "CerberusStyxMeeting01" },
						RequiredFalseSeenRoomThisRun = "D_Reprieve01",
						{
							SkipAnim = true,
							{ Cue = "/VO/CerberusBarks" },
						},
						{
							UsePlayerSource = true,
							RandomRemaining = true,
							PreLineWait = 0.25,
							{ Cue = "/VO/MelinoeField_1750", Text = "I'd rather keep my hand..." },
							{ Cue = "/VO/MelinoeField_1751", Text = "Won't let me." },
							{ Cue = "/VO/MelinoeField_1752", Text = "OK, OK..." },
							{ Cue = "/VO/MelinoeField_1753", Text = "Sorry, boy..." },
							{ Cue = "/VO/MelinoeField_1755", Text = "Stay back, got it..." },
							{ Cue = "/VO/MelinoeField_3895", Text = "Don't snap my head off, boy..." },
							{ Cue = "/VO/MelinoeField_0920", Text = "You're not going to step aside, are you?", },
							{ Cue = "/VO/MelinoeField_0926", Text = "You're very vigilant, I'll grant you that." },
							{
								Cue = "/VO/MelinoeField_3033",
								Text = "Hecuba, meet Cerberus!",
								PlayFirst = true,
								GameStateRequirements = {
									{
										Path = { "GameState", "EquippedFamiliar" },
										IsAny = { "HoundFamiliar" },
									},
								},
							},
							{
								Cue = "/VO/MelinoeField_3034",
								Text = "You're not afraid of dogs are you, Toula?",
								GameStateRequirements = {
									{
										Path = { "GameState", "EquippedFamiliar" },
										IsAny = { "CatFamiliar" },
									},
								},
							},
						},
					},
					{
						UsePlayerSource = true,
						RandomRemaining = true,
						PlayOnceFromTableThisRun = true,
						RequiredRoomThisRun = "D_Reprieve01",
						SuccessiveChanceToPlay = 0.33,
						{ Cue = "/VO/Melinoe_0246",   Text = "I got you something.", },
						{ Cue = "/VO/Melinoe_0248",   Text = "Got something for you.", },
						{ Cue = "/VO/Melinoe_2357",   Text = "Got you something!" },
						{ Cue = "/VO/Melinoe_3592",   Text = "You're going to like this." },
						{ Cue = "/VO/Melinoe_0246_B", Text = "I got you something.", },
						{ Cue = "/VO/Melinoe_0247_B", Text = "I got you this.", },
						{ Cue = "/VO/Melinoe_0248_B", Text = "Got something for you.", },
						{ Cue = "/VO/Melinoe_2357_B", Text = "Got you something!" },
						{ Cue = "/VO/Melinoe_2358_B", Text = "This is for you!" },
						{ Cue = "/VO/Melinoe_3592_B", Text = "You're going to like this." },
						{ Cue = "/VO/Melinoe_3789_B", Text = "This is for you." },
					},
				},
			},
			{
				TriggerObjectType = "TravelDoor03",
				WithinDistance = 360,
				GlobalVoiceLines = "ModsNikkelMHadesBiomes_StyxHubForkedPathVoiceLines",
			},
		},

		EnterVoiceLines = {
			-- when you return to the Hub with the key item
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.35,
				PlayOnceFromTableThisRun = true,
				RequiredRoomThisRun = "D_Reprieve01",
				SuccessiveChanceToPlay = 1, -- 0.33,

				{ Cue = "/VO/MelinoeField_0620", Text = "Now to get out of here." },
				{ Cue = "/VO/MelinoeField_0623", Text = "Time to go." },
				{ Cue = "/VO/MelinoeField_0624", Text = "Finished here." },
				{ Cue = "/VO/MelinoeField_0625", Text = "Should be able to get out." },
			},
			-- when you return to the Hub with the Key item with Wings open
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.35,
				RequiredRoomThisRun = "D_Reprieve01",
				PlayOnceFromTableThisRun = true,
				SuccessiveChanceToPlayAll = 1, --0.33,
				RequiredMaxDoorsClosedInRoom = 4,

				{ Cue = "/VO/MelinoeField_2115", Text = "More to discover...", },
				{ Cue = "/VO/MelinoeField_1077", Text = "There's more to find here still." },
				{ Cue = "/VO/MelinoeField_1080", Text = "Still Boons and such to find." },
				{ Cue = "/VO/MelinoeField_0512", Text = "Now what..." },
				{ Cue = "/VO/MelinoeField_1562", Text = "He'll send more and more foes the longer I stay..." },
				{ Cue = "/VO/MelinoeField_1544", Text = "Best not stay any longer than I must..." },
			},
			-- when you return to the Hub in the same run
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.35,
				RequiredRoomThisRun = "D_Hub",
				RequiredFalseSeenRoomThisRun = "D_Reprieve01",
				SuccessiveChanceToPlay = 1, --0.25,
				{ Cue = "/VO/MelinoeField_0374", Text = "They're trying to slow me down..." },
				{ Cue = "/VO/MelinoeField_0511", Text = "What next..." },
				{ Cue = "/VO/MelinoeField_0513", Text = "Where next..." },
				{ Cue = "/VO/MelinoeField_0514", Text = "Where else." },
				{ Cue = "/VO/MelinoeField_0515", Text = "Where to from here..." },
				{ Cue = "/VO/MelinoeField_0516", Text = "Next up..." },
				{ Cue = "/VO/MelinoeField_0517", Text = "Getting somewhere." },
				{ Cue = "/VO/MelinoeField_0376", Text = "Where to this time..." },
				{ Cue = "/VO/MelinoeField_0859", Text = "Can't get out yet...!" },
				{ Cue = "/VO/MelinoeField_0197", Text = "Must be a way out." },
			},
			-- when you first enter the Hub
			{
				BreakIfPlayed = true,
				PreLineWait = 1.6,
				RequiredFalseTextLines = { "CerberusStyxMeeting01" },
				{ Cue = "/VO/MelinoeField_1109", Text = "Cerberus, is that you?!" },
			},
			-- subsequent first-time visits
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 1.45,
				PlayOnceFromTableThisRun = true,
				RequiredTextLines = { "CerberusStyxMeeting01" },
				GameStateRequirements = {
					{
						Path = { "CurrentRun", "CurrentRoom", "TimesVisited" },
						Comparison = "<=",
						Value = 1,
					}
				},
				SuccessiveChanceToPlayAll = 1, -- 0.33,

				{ Cue = "/VO/MelinoeField_0368", Text = "Best have a look around..." },
				{ Cue = "/VO/MelinoeField_2117", Text = "Few things to find..." },
				{ Cue = "/VO/MelinoeField_0198", Text = "Won't be staying long..." },
				{ Cue = "/VO/Melinoe_1843",      Text = "OK...", },
				{ Cue = "/VO/MelinoeField_0108", Text = "I can do this..." },
				{ Cue = "/VO/MelinoeField_0977", Text = "Almost out of here..." },
			},
		},

		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasExorcismPoint = false,

		FishingPointChance = 0.3,
		FishingPointRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				SumPrevRooms = 1,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", },
						NotHasAll = { "Fish_Styx_Common_01", "Fish_Styx_Rare_01", "Fish_Styx_Legendary_01" },
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 2,
						Path = { "NumExorcismPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},
	},

	D_MiniBoss03 = {
		LegalEncounters = { "ModsNikkelMHadesBiomesMiniBossCrawler", "MiniBossHeavyRangedForked" },
	},

	D_Reprieve01 = {
		EnterVoiceLines = {
			{
				-- found early
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.2,
				SuccessiveChanceToPlayAll = 0.5,
				RequiredMaxDoorsClosedInRoom = 2,
				RequiredMaxDoorsClosedRoom = "D_Hub",
				{ Cue = "/VO/MelinoeField_2108", Text = "Here already..." },
				{ Cue = "/VO/Melinoe_5503",      Text = "...That's convenient." },
				{ Cue = "/VO/MelinoeField_0561", Text = "{#Emph}Huh!" },
				{ Cue = "/VO/MelinoeField_0563", Text = "Straightforward." },
			},
			{
				-- found late
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 1.2,
				SuccessiveChanceToPlayAll = 0.5,
				RequiredMinDoorsClosedInRoom = 5,
				RequiredMinDoorsClosedRoom = "D_Hub",
				{ Cue = "/VO/Melinoe_1102",      Text = "Finally..." },
				{ Cue = "/VO/MelinoeField_0427", Text = "Finally." },
				{ Cue = "/VO/MelinoeField_0211", Text = "...Finally." },
				{ Cue = "/VO/Melinoe_5709",      Text = "At last..." },
				{ Cue = "/VO/MelinoeField_0212", Text = "...At last." },
				{ Cue = "/VO/MelinoeField_0425", Text = "At last." },
				{ Cue = "/VO/MelinoeField_0110", Text = "At last..." },
				{ Cue = "/VO/Melinoe_1464",      Text = "At last..." },
			},
			{ GlobalVoiceLines = "EnteredReprieveRoomVoiceLines", },
		},
	},

	D_Boss01 = {
		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasExorcismPoint = false,
		FishingPointRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				SumPrevRooms = 1,
				Path = { "NumFishingPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumShovelPoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumPickaxePoints" },
				Comparison = "<=",
				Value = 0,
			},
			{
				SumPrevRooms = 1,
				Path = { "NumExorcismPoints" },
				Comparison = "<=",
				Value = 0,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", },
						NotHasAll = { "Fish_Surface_Common_01", "Fish_Surface_Rare_01", "Fish_Surface_Legendary_01" },
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
					{
						SumPrevRooms = 2,
						Path = { "NumExorcismPoints" },
						Comparison = "<=",
						Value = 0,
					},
				},
			},
		},

		EnterVoiceLines = {
			-- First meeting
			{
				PlayOnce = true,
				PlayOnceContext = "ModsNikkelMHadesBiomes_D_Boss01_FirstMeeting",
				PreLineWait = 2.25,
				{ Cue = "/VO/MelinoeField_3000", Text = "{#Emph}<Gasp>" },
				{ Cue = "/VO/Melinoe_4017",      Text = "Father...",    PreLineWait = 0.8, BreakIfPlayed = true, },
			},
			-- Progressing the story
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 4.35,
				PlayOnce = true,
				PlayOnceContext = "ModsNikkelMHadesBiomes_D_Boss01",
				{ Cue = "/VO/MelinoeField_0920", Text = "You're not going to step aside, are you?", RequiredTextLines = { "PersephoneMeeting06" }, RequiredFalseTextLines = { "Ending01" }, RequiredFalsePlayedThisRun = { "/VO/MelinoeField_0920" }, },
				{ Cue = "/VO/MelinoeField_1904", Text = "You're in my way.",                        RequiredTextLines = { "PersephoneMeeting09" }, RequiredFalseTextLines = { "Ending01" }, },
			},
			{
				BreakIfPlayed = true,
				PreLineWait = 4.35,
				RequiredEncounters = { "BossHadesPeaceful" },
				{ Cue = "/VO/MelinoeField_1906", Text = "Every time..." },
			},
			-- Afterwards
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 4.35,
				SuccessiveChanceToPlayAll = 0.65,
				RequiredFalseEncounters = { "BossHadesPeaceful" },
				-- From I_Story01
				{ Cue = "/VO/MelinoeField_1520", Text = "Father...?" },
				{ Cue = "/VO/Melinoe_4016",      Text = "Father." },
				{ Cue = "/VO/Melinoe_4017",      Text = "Father..." },
				{ Cue = "/VO/MelinoeField_1519", Text = "Father...!" },
				{ Cue = "/VO/MelinoeField_1521", Text = "{#Emph}Erm... {#Prev}greetings, Father..." },
				-- From Cerberus boss fight
				{ Cue = "/VO/MelinoeField_0920", Text = "You're not going to step aside, are you?", RequiredFalsePlayedThisRun = { "/VO/MelinoeField_0920" } },
				{ Cue = "/VO/MelinoeField_0923", Text = "Heads up..." },
				{ Cue = "/VO/MelinoeField_0922", Text = "I'm sorry, but I have to get through.",    RequiredFalseTextLines = { "Ending01" }, },
				{ Cue = "/VO/MelinoeField_0924", Text = "I'm not afraid of you..." },
				-- From Eris
				{ Cue = "/VO/MelinoeField_1904", Text = "You're in my way." },
				{ Cue = "/VO/MelinoeField_1906", Text = "Every time..." },
				-- From Prometheus
				{ Cue = "/VO/MelinoeField_2517", Text = "Guess who." },
			},
		},
	},
}

local roomModifications = {
	-- GENERIC
	BaseStyx = {
		-- These are loaded in LoadCurrentRoomResources, which is called OnAnyLoad
		LoadModdedAudioBanks = { "EnemiesModsNikkelMHadesBiomes", "SoundsModsNikkelMHadesBiomes", },
		LoadCustomModdedAudioBanks = { "ModsNikkelMHadesBiomesMusicModded", "ModsNikkelMHadesBiomesMusicStyxModded", },
		-- "/Leftovers/Object Ambiences/CreepyIslandAmbience"
		Ambience = "{ff413738-f0b8-400b-bbd6-c660e227583c}",
		ReverbValue = 2.0,

		SaveProfileLocationText = "ModsNikkelMHadesBiomesLocation_Hades_Styx",

		TimeChallengeEncounterOptions = { "TimeChallengeStyx" },
		PerfectClearEncounterOptions = { "PerfectClearChallengeStyx" },
		EliteChallengeEncounterOptions = { "EliteChallengeStyx" },

		LocationAnimName = "ModsNikkelMHadesBiomesInfoBannerStyxIn",
		LocationAnimOutName = "ModsNikkelMHadesBiomesInfoBannerStyxOut",
		-- Devotion rewards are not available in Styx
		IneligibleRewards = { "Devotion" },
		-- No longer offer any meta rewards here. It didn't do so anyways, but be sure
		TargetMetaRewardsRatio = 0,
		OptionalOverrides = {
			IneligibleRewards = { "WeaponUpgrade", "Devotion", "SpellDrop", "HermesUpgrade" },
			RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
			BoonRaritiesOverride = {
				Legendary = 0.1,
				Epic = 0.25,
				Rare = 0.90,
				LegendaryChance = mod.NilValue,
				EpicChance = mod.NilValue,
				RareChance = mod.NilValue,
			},
			-- We directly change the consumables to their upgraded versions when choosing the door reward using the map
			RewardConsumableOverrides = mod.NilValue,
			RewardConsumableOverrideMap = {
				RoomMoneyDrop = "RoomMoneyBigDrop",
				MaxHealthDrop = "MaxHealthDropBig",
				MaxManaDrop = "MaxManaDropBig",
				StackUpgrade = "StackUpgradeBig",
				TalentDrop = "TalentBigDrop",
			},
		},
	},
	BaseStyxMini = {
		-- Don't turn off any stems during Styx mini rooms
		CombatOverMusicEvents = {},

		-- No harvesting in mini rooms
		HasHarvestPoint = false,
		HasShovelPoint = false,
		HasPickaxePoint = false,
		HasExorcismPoint = false,
	},
	BaseStyxWingEnd = {
		NextRoomEntranceFunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesReturnToStyxHubPresentation",
		IneligibleRewards = { "Devotion" },
		-- Turn on the Bass stem, and play the outro music from the Drums section after the end combat rooms
		CombatOverMusicEvents = mod.CombatOverMusicEvents.Styx,
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
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "DisplayLocationText", Args = { AnimationName = "ModsNikkelMHadesBiomesInfoBannerStyxIn", AnimationOutName = "ModsNikkelMHadesBiomesInfoBannerStyxOut" }, },
			[2] = { FunctionName = _PLUGIN.guid .. "." .. "CheckLocationUnlock", Args = { Biome = "Styx" } },
		},
	},
	D_Hub = {
		-- Megaera for Storyteller for Cerberus
		LoadModdedVoiceBanks = { "Megaera", "ZagreusField" },
		-- "/Leftovers/Ambience/MatchSiteIPoolAmbience"
		Ambience = "{e65b32ad-3a7e-4f88-9149-3260e929f04c}",
		UnthreadedEvents = {
			[1] = {
				FunctionName = _PLUGIN.guid .. "." .. "ModsNikkelMHadesBiomesBossIntro",
			},
		},
		-- Shorter as we add more wait time after the animation starts
		IntroSequenceDuration = 0.3,
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceD_Hub",
		DistanceTriggersPostCombatReload = true,
		TimerBlock = "ShopEncounter",
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
		SkipUnusedWeaponBonusReward = true,
	},

	-- MINIBOSSES
	BaseStyxMiniBoss = {
		RewardPreviewIcon = "RoomRewardSubIcon_Miniboss",
		-- Turn on the Bass stem, and play the outro music from the Drums section after the end combat rooms
		CombatOverMusicEvents = mod.CombatOverMusicEvents.Styx,
	},
	D_MiniBoss01 = {
		BackupCauseOfDeath = "SatyrRangedMiniboss",
	},
	D_MiniBoss02 = {
		BackupCauseOfDeath = "RatThugMiniboss",
	},
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
		BackupCauseOfDeath = "HeavyRangedForkedMiniboss",
		EncounterSpecificDataOverwrites = {
			MiniBossCrawler = mod.NilValue,
			ModsNikkelMHadesBiomesMiniBossCrawler = {
				SkipLastKillSound = true,
				BackupCauseOfDeath = "CrawlerMiniBoss",
			},
		},
	},
	D_MiniBoss04 = {
		BackupCauseOfDeath = "ThiefImpulseMineLayerMiniboss",
	},

	-- BOSSES
	D_Boss01 = {
		LoadModdedVoiceBanks = { "HadesField", "ZagreusField" },
		-- "/Leftovers/Ambience/OceanWavesWaterAmbience"
		Ambience = "{c8b4b4e9-ee0e-4b72-8a5f-8b12e5179707}",
		EndMusicOnEnter = true,

		NarrativeContextArt = "ModsNikkelMHadesBiomes_DialogueBackground_StyxBoss",
		RewardPreviewIcon = "RoomRewardSubIcon_Boss",
		ForcedReward = "ModsNikkelMHadesBiomes_BossResourceStyxDrop",
		FirstClearRewardStore = mod.NilValue,
		ForcedRewardStore = mod.NilValue,
		EligibleRewards = mod.NilValue,
		RewardConsumableOverrides = mod.NilValue,
		UnthreadedEvents = {
			[1] = {
				FunctionName = _PLUGIN.guid .. "." .. "BossIntroHades",
				Args = { DelayedStart = true, },
			},
		},
		TeleportCatFamiliarOnEncounterStart = true,
		EntranceFunctionName = _PLUGIN.guid .. "." .. "RoomEntranceHades",
		ExitFunctionName = _PLUGIN.guid .. "." .. "CheckRunEndPresentation",
		-- To prevent e.g. Centaur Arcana from triggering on the Surface
		NextRoomEntranceFunctionArgsOverride = { NotifyName = "ThisWillNeverHappen" },
		ObstacleData = {
			-- Makes the exit door interactable
			-- FinalBossExitDoor
			[552590] = {
				Template = "FinalBossExitDoor",
				ActivateIds = { 552590, },
			},
		},
		BackupCauseOfDeath = "Hades",
	},

	-- OTHER
	D_Reprieve01 = {
		-- "/Leftovers/Ambience/StillWaterAmbience2"
		Ambience = "{988cda14-71e5-41c8-9496-49f765a603d5}",
		GameStateRequirements = {
			RequiredCosmetics = mod.NilValue,
		},
		StartUnthreadedEvents = {
			[1] = { FunctionName = _PLUGIN.guid .. "." .. "SpawnConsumables", },
		},
		DisableRewardMagnetisim = true,
		SuppressRewardSpawnSounds = false,

		HarvestPointChances = { 0.5, 0.3, },
		HarvestPointRequirements = {
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_PlantStyx" },
						Comparison = "<",
						Value = 16,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
		ShovelPointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeToolsShop" },
			},
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedElysium" },
				Comparison = ">=",
				Value = 3,
			},
			OrRequirements =
			{
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_SeedStyx" },
						Comparison = "<",
						Value = 6,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
		PickaxePointRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreElysium" },
				Comparison = ">=",
				Value = 5,
			},
			OrRequirements = {
				-- collection
				{
					{
						Path = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_OreStyx" },
						Comparison = "<",
						Value = 8,
					},
				},
				-- accumulation
				{
					ChanceToPlay = 0.5,
				},
			},
		},
	},
}

mod.ApplyModificationsAndInheritRoomData(mod.RoomData.Styx, roomModifications, roomReplacements, "Styx")
