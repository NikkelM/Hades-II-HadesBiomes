local function applyModificationsAndInheritObstacleData(base, modifications, additions, needInheritanceProcessing)
	-- Apply additions
	for obstacleName, obstacleData in pairs(additions) do
		if base[obstacleName] then
			mod.DebugPrint("Obstacle " .. obstacleName .. " already exists, skipping", 2)
		else
			base[obstacleName] = obstacleData
		end
		if base[obstacleName].Name == nil then
			base[obstacleName].Name = obstacleName
		end
	end

	-- Apply modifications
	for obstacleName, obstacleData in pairs(modifications) do
		if not base[obstacleName] then
			base[obstacleName] = {}
		end
		mod.ApplyModifications(base[obstacleName], obstacleData, false)
	end

	-- Process data inheritance
	for _, obstacleName in ipairs(needInheritanceProcessing) do
		game.ProcessDataInheritance(game.ObstacleData[obstacleName], game.ObstacleData)
	end
end

-- Also works for already existing obstacles in Hades II
local obstacleModifications = {
	-- #region TARTARUS
	TartarusDoor03b = {
		-- Red and blue reward preview backing
		CustomLockedAnimation_Run = "HadesDoorLocked",
		CustomLockedAnimation_Meta = "DoorLocked_MetaReward",
		UnlockedAnimation = "DoorLocked_MetaReward",
	},
	-- Rubble that falls when hitting destructible pillars
	TartarusRubble02 = {
		DeathFx = "RubbleFall",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	-- So they don't all immediately get destroyed in the fight with Tisiphone
	TartarusPillarBase04 = {
		ImpactReaction = {
			RequireNotProjectileNames = { "HarpyBeamTisiphone" },
		},
	},
	TartarusPillarBase04A = {
		ImpactReaction = {
			RequireNotProjectileNames = { "HarpyBeamTisiphone" },
		},
	},
	TartarusPillarBase04B = {
		ImpactReaction = {
			RequireNotProjectileNames = { "HarpyBeamTisiphone" },
		},
	},
	-- #endregion

	-- #region ASPHODEL
	AsphodelBoat01b = {
		ExitFunctionName = _PLUGIN.guid .. "." .. "AsphodelLeaveRoomPresentation",
	},
	AsphodelTerrainRock01 = {
		DeathFx = "AsphodelTerrainRockCollapse",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	AsphodelTerrainRock02 = {
		DeathFx = "AsphodelTerrainRockCollapse",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	AsphodelTerrainRock03 = {
		DeathFx = "AsphodelTerrainRockCollapse",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	AsphodelSkull = {
		DeathFx = "AsphodelTerrainRockCollapse",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFallLarge", },
	},
	HealthFountainAsphodel = {
		InheritFrom = { "HealthFountain" },
		HealingSpentAnimation = "HealthFountainEmptyAsphodel",
	},
	-- #endregion

	-- #region ELYSIUM
	-- Is commented out in Hades II - enabling it again only causes there to be a "Foes nearby" prompt when attempting to use the door in the Zagreus fight
	ElysiumExitDoor = {
		InheritFrom = { "ExitDoor", },
		ExitThroughCenter = true,
		RewardPreviewOffsetZ = 0,
		RewardPreviewOffsetY = -360,
		RewardPreviewOffsetX = 0,
		UnlockedUseTextCannotReroll = "UseLeaveRoom_CannotReroll",
		UnlockedAnimation = "ElysiumDoorUnlocked",
		ExitDoorOpenAnimation = "ElysiumDoorOpen",
		ExitDoorCloseAnimation = "ElysiumDoorClose",
		UnlockedUseSound = "",
	},
	HealthFountainElysium = {
		InheritFrom = { "HealthFountain" },
		HealingSpentAnimation = "HealthFountainEmptyElysium",
	},
	ElysiumRubble04 = {
		DeathFx = "RubbleFall",
		OnTouchdown = { ProjectileName = "ModsNikkelMHadesBiomesRubbleFall", },
	},
	-- Red pillars in the boss room
	ElysiumPillar06 = {
		OnHitShake = mod.NilValue,
	},
	-- #endregion

	-- #region STYX
	-- #endregion

	-- #region Resource Points
	HarvestPoint = {
		ModsNikkelMHadesBiomesBreakBreakablesOnPlace = true,
		ModsNikkelMHadesBiomesOccupySpawnPointId = true,
	},
	PickaxePoint = {
		ModsNikkelMHadesBiomesBreakBreakablesOnPlace = true,
	},
	ShovelPoint = {
		ModsNikkelMHadesBiomesBreakBreakablesOnPlace = true,
		ModsNikkelMHadesBiomesOccupySpawnPointId = true,
	},
	ExorcismPoint = {
		ModsNikkelMHadesBiomesBreakBreakablesOnPlace = true,
		ModsNikkelMHadesBiomesScaleFactors = {
			["3dGhostIdle"] = 0.9,
			AsphodelGhostIdle = 0.65,
			ElysiumGhostIdle = 0.85,
		},
	},
	GhostRecruit = {
		ModsNikkelMHadesBiomesLoadPackages = {
			AsphodelGhostIdle = "AsphodelModsNikkelMHadesBiomes",
			ElysiumGhostIdle = "ElysiumModsNikkelMHadesBiomes",
		},
		ModsNikkelMHadesBiomesScaleFactors = {
			["3dGhostIdle"] = 0.9,
			AsphodelGhostIdle = 0.65,
			ElysiumGhostIdle = 0.85,
		},
	},
	-- #endregion
}

local addedObstacles = {
	-- #region TARTARUS
	MultiFuryMegaeraIntro = { ExitAnimation = "MegaeraMultiFuryTakeOff", },
	MultiFuryAlectoIntro = { ExitAnimation = "AlectoMultiFuryTakeOff", },
	MultiFuryTisiphoneIntro = { ExitAnimation = "TisiphoneMultiFuryTakeOff", },
	-- #endregion

	-- #region ELYSIUM
	EnemyShield = {
		IsEnemyWeapon = true,
		UseText = "UseEnemyWeapon",
		BeginPickupAnimation = "EnemyShieldPickupContainer",
		PickupFailedAnimation = "EnemyShieldIdleContainer",
		SwapToUnitOnPickup = "ShadeShieldUnit",
	},
	EnemyBow = {
		IsEnemyWeapon = true,
		UseText = "UseEnemyWeapon",
		BeginPickupAnimation = "EnemyBowPickupContainer",
		PickupFailedAnimation = "EnemyBowIdleContainer",
		SwapToUnitOnPickup = "ShadeBowUnit",
	},
	EnemySpear = {
		IsEnemyWeapon = true,
		UseText = "UseEnemyWeapon",
		BeginPickupAnimation = "EnemySpearPickupContainer",
		PickupFailedAnimation = "EnemySpearIdleContainer",
		SwapToUnitOnPickup = "ShadeSpearUnit",
	},
	EnemySword = {
		IsEnemyWeapon = true,
		UseText = "UseEnemyWeapon",
		BeginPickupAnimation = "EnemySwordPickupContainer",
		PickupFailedAnimation = "EnemySwordIdleContainer",
		SwapToUnitOnPickup = "ShadeSwordUnit",
	},
	-- #endregion

	-- #region STYX
	-- Doors out of Styx mini rooms
	StyxDoor01 = {
		InheritFrom = { "ExitDoor", },
		ExitThroughCenter = true,
		RewardPreviewOffsetZ = 642,
		UnlockedUseTextCannotReroll = "UseLeaveRoom_CannotReroll",
		UnlockedAnimation = "StyxDoorUnlocked",
		ExitDoorOpenAnimation = "StyxDoorOpen",
		ExitDoorCloseAnimation = "StyxDoorClose",
		AllowReroll = false,
		-- intentionally blank, on the anim
		UnlockedUseSound = "",
		-- Custom
		RewardPreviewOffsetY = 290,
		RewardPreviewOffsetX = 10,
	},
	-- Styx: Doors to Wings from D_Hub
	TravelDoor03 = {
		InheritFrom = { "ExitDoor", },
		ExitThroughCenter = true,
		RewardPreviewOffsetZ = 0,
		RewardPreviewOffsetX = 0,
		UnlockedUseTextCannotReroll = "UseLeaveRoom_CannotReroll",
		LockedUseText = "UseExitDoorWhileLocked",
		UnlockedAnimation = "TravelDoor03Unlocked",
		UnlockedSound = "/EmptyCue",
		ExitDoorOpenAnimation = "TravelDoor03Open",
		ExitDoorCloseAnimation = "TravelDoor03Close",
		ExitVoiceLines = {
			PreLineWait = 0.25,
			RandomRemaining = true,
			BreakIfPlayed = true,
			SuccessiveChanceToPlay = 0.33,

			-- Let's see what's in here.
			{ Cue = "/VO/ZagreusField_2054" },
			-- This one I guess.
			{ Cue = "/VO/ZagreusField_2268" },
			-- Here goes.
			{ Cue = "/VO/ZagreusField_2269" },
			-- Maybe it's in here.
			{ Cue = "/VO/ZagreusField_2270", RequiredFalseSeenRoomThisRun = "D_Reprieve01", RequiredMinDoorsClosedInRoom = 1, RequiredFalsePrevRooms = { "D_Intro" } },
			-- Should check this way.
			{ Cue = "/VO/ZagreusField_2271" },
			-- I bet it's in here.
			{ Cue = "/VO/ZagreusField_2272", RequiredFalseSeenRoomThisRun = "D_Reprieve01", RequiredMinDoorsClosedInRoom = 1, RequiredFalsePrevRooms = { "D_Intro" } },
			-- Try this way.
			{ Cue = "/VO/ZagreusField_2273" },
			-- Maybe this way.
			{ Cue = "/VO/ZagreusField_2274" },
		},
		ExitBlockedVoiceLines = {
			PreLineWait = 0.35,
			RandomRemaining = true,
			BreakIfPlayed = true,
			Cooldowns =
			{
				--{ Name = "ZagreusAnyQuipSpeech", Time = CurrentRun.Hero.VoiceLineBufferTime },
				{ Name = "ZagreusAnyQuipSpeech", Time = 9 },
			},
			-- Shut.
			{ Cue = "/VO/ZagreusField_2322" },
			-- It's shut.
			{ Cue = "/VO/ZagreusField_2323" },
			-- Locked.
			{ Cue = "/VO/ZagreusField_2324" },
			-- It's locked.
			{ Cue = "/VO/ZagreusField_2325" },
			-- Cleared it out.
			{ Cue = "/VO/ZagreusField_2326" },
			-- Nothing else back there.
			{ Cue = "/VO/ZagreusField_2327" },
			-- Done with that.
			{ Cue = "/VO/ZagreusField_2328" },
			-- Done back there.
			{ Cue = "/VO/ZagreusField_2329" },
		},
		-- intentionally blank, on the anim
		UnlockedUseSound = "",
		-- Custom
		RewardPreviewOffsetY = -285,
	},
	-- Styx: Warps from D_Combat rooms back to D_Hub
	StyxWarpDoor = {
		InheritFrom = { "ExitDoor", },
		HideRewardPreview = true,
		UsePromptOffsetY = -5,
		UsePromptOffsetX = 60,
		UnlockedUseTextCannotReroll = "UseLeaveRoom_CannotReroll",
		UnlockedUseText = "UseStyxWarpDoor",
		LockedUseSound = "/Leftovers/SFX/OutOfAmmo2",
		UnlockedUseSound = "/Leftovers/SFX/NomadSprint",
		ExitDoorOpenAnimation = "StyxWarpDoor_Revealed",
		ExitDoorCloseAnimation = "StyxWarpDoor_Revealed",
		UnlockedAnimation = "StyxWarpDoor_Revealed",
		UnlockedSound = "/Leftovers/Menu Sounds/TitanToggleShort",
		ExitVoiceLines = {
			PreLineWait = 0.35,
			RandomRemaining = true,
			BreakIfPlayed = true,
			SuccessiveChanceToPlay = 0.33,
			-- Hope this can get me out of here.
			{ Cue = "/VO/ZagreusField_2282", SuccessiveChanceToPlay = 0.02 },
			-- Should be able to get back through here.
			{ Cue = "/VO/ZagreusField_2283", RequiredPlayed = { "/VO/ZagreusField_2282" } },
			-- Let's just go down this Satyr hole.
			{ Cue = "/VO/ZagreusField_2284", RequiredPlayed = { "/VO/ZagreusField_2282" } },
			-- Back I go.
			{ Cue = "/VO/ZagreusField_2285", RequiredPlayed = { "/VO/ZagreusField_2282" } },
			-- Enough of this place.
			{ Cue = "/VO/ZagreusField_2286", RequiredPlayed = { "/VO/ZagreusField_2282" } },
			-- Going back.
			{ Cue = "/VO/ZagreusField_2287", RequiredPlayed = { "/VO/ZagreusField_2282" } },
			-- Heading back.
			{ Cue = "/VO/ZagreusField_2288", RequiredPlayed = { "/VO/ZagreusField_2282" } },
			-- Had quite enough here, thanks.
			{ Cue = "/VO/ZagreusField_2289", RequiredPlayed = { "/VO/ZagreusField_2282" } },
			-- Down the chute.
			{ Cue = "/VO/ZagreusField_2290", RequiredPlayed = { "/VO/ZagreusField_2282" } },
		},
		-- Custom
		ExitFunctionName = "AnomalyExitPresentation",
		ReturnToPreviousRoomName = "D_Hub",
	},
	-- Styx: Exit from Underworld / Exit to D_Boss01
	TravelDoor01 = {
		InheritFrom = { "ExitDoor", },
		UnlockedAnimation = "TravelDoor01Unlocked",
		UnlockedUseText = "UseCerberusDoor",
		UnlockedUseTextCannotReroll = "UseCerberusDoor",
		UnlockedUseSound = "/EmptyCue",
		HideRewardPreview = true,
		AvailableRequirements = {
			RequiredRoomThisRun = "D_Reprieve01",
			RequiredAnyTextLines = { "CerberusBossDoorUnlock", "CerberusBossDoorUnlockRepeatable01", "CerberusBossDoorUnlockRepeatable02", "CerberusBossDoorUnlockRepeatable03", "CerberusBossDoorUnlockRepeatable04", "CerberusBossDoorUnlockRepeatable05", "CerberusBossDoorUnlockRepeatable06", "CerberusBossDoorUnlockRepeatable07" },
		},
		ForceRoomName = "D_Boss01",
		ExitFunctionName = _PLUGIN.guid .. "." .. "ExitToHadesPresentation",
		ExitDoorOpenAnimation = "HubBossDoorOpen",
		OnUsedVoiceLines = {
			{
				PreLineWait = 0.35,
				RandomRemaining = true,
				BreakIfPlayed = true,
				SuccessiveChanceToPlay = 0.33,

				-- I did it...
				{ Cue = "/VO/ZagreusField_2086" },
				-- I made it...
				{ Cue = "/VO/ZagreusField_2087", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Made it.
				{ Cue = "/VO/ZagreusField_2088", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Now...
				{ Cue = "/VO/ZagreusField_2089", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Bye.
				{ Cue = "/VO/ZagreusField_2090", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Heading out.
				{ Cue = "/VO/ZagreusField_2091", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Be right with you, Father.
				{ Cue = "/VO/ZagreusField_3546", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Get you for last time, Father.
				{ Cue = "/VO/ZagreusField_3547", RequiredPlayed = { "/VO/ZagreusField_2086" }, ConsecutiveDeathsInRoom = { Name = "D_Boss01", Count = 1, }, RequiredRoomLastRun = "D_Boss01" },
				-- Made it again.
				{ Cue = "/VO/ZagreusField_3548", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Time to go.
				{ Cue = "/VO/ZagreusField_3549", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Cold out there.
				{ Cue = "/VO/ZagreusField_3550", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- I'm leaving, Father. Try and stop me.
				{ Cue = "/VO/ZagreusField_3551", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- To hell with this place.
				{ Cue = "/VO/ZagreusField_3552", RequiredPlayed = { "/VO/ZagreusField_2086" }, RequiredFalseTextLines = { "PersephoneMeeting07" }, },
				-- I'll find you, Mother.
				{ Cue = "/VO/ZagreusField_3553", RequiredPlayed = { "/VO/ZagreusField_2086" }, RequiredFalseTextLines = { "Ending01" }, },
				-- I'm out.
				{ Cue = "/VO/ZagreusField_4196", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- I'm out of here.
				{ Cue = "/VO/ZagreusField_4197", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Here goes.
				{ Cue = "/VO/ZagreusField_4198", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- All right, Father.
				{ Cue = "/VO/ZagreusField_4199", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Into the cold.
				{ Cue = "/VO/ZagreusField_4200", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- I can do this.
				{ Cue = "/VO/ZagreusField_4201", RequiredPlayed = { "/VO/ZagreusField_2086" } },
				-- Have to do this.
				{ Cue = "/VO/ZagreusField_4202", RequiredPlayed = { "/VO/ZagreusField_2086" }, RequiredFalseTextLines = { "Ending01" }, },
				-- Got this far.
				{ Cue = "/VO/ZagreusField_4203", RequiredPlayed = { "/VO/ZagreusField_2086" } },
			},
		},
		-- Custom: To prevent Melinoe from thanking Charon for the shop
		ExitVoiceLines = {},
	},
	-- Styx: Exit from D_Boss01 to end
	FinalBossExitDoor = {
		InheritFrom = { "ExitDoor", },
		HideRewardPreview = true,
		AllowReroll = false,
		UnlockedUseText = "UseFinalBossDoor",
		UnlockedUseTextCannotReroll = "UseFinalBossDoor",
		LockedUseSound = "/Leftovers/SFX/OutOfAmmo",
		UnlockedUseSound = "/Leftovers/Menu Sounds/EmoteThoughtful",
		UnlockedAnimation = "FinalBossExitDoorLinesUnlocked",
		ExitDoorOpenAnimation = "FinalBossExitDoorLinesOpen",
		ExitDoorCloseAnimation = "FinalBossExitDoorLinesUsed",
	},
	PoisonCureFountainStyx = {
		UseText = "UsePoisonCure",
		UseSound = "/SFX/PoisonCureFountainDrink",
		CooldownNamePrefix = "PoisonCureFountain",
		CooldownDuration = 3.0,
		OnCooldownAnimation = "PoisonCureFountainEmpty",
		IdleAnimation = "PoisonCureFountainFull",
		OnUsedFunctionName = "UsePoisonCure",
	},
	HealthFountainStyx = {
		InheritFrom = { "HealthFountain" },
		HealingSpentAnimation = "HealthFountainEmptyStyx",
	},
	CerberusKey = {
		UseSound = "/Leftovers/World Sounds/Unmask",
		ConsumeSound = "/SFX/Enemy Sounds/RatThug/PoisonShake",
		OnUsedVoiceLines = {
			RandomRemaining = true,
			BreakIfPlayed = true,
			PreLineWait = 0.65,

			-- Disgusting. Cerberus will love it!
			{ Cue = "/VO/ZagreusField_2107" },
			-- Something for Cerberus.
			{ Cue = "/VO/ZagreusField_2108", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- Eugh, what is this stuff?
			{ Cue = "/VO/ZagreusField_2109", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- Now back to Cerberus.
			{ Cue = "/VO/ZagreusField_2110", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- A Satyr sack for my boy Cerberus.
			{ Cue = "/VO/ZagreusField_2111", RequiredPlayed = { "/VO/ZagreusField_2107" }, CooldownName = "SaidSatyrSackRecently", CooldownTime = 30, },
			-- Cerberus just loves... whatever this stuff is.
			{ Cue = "/VO/ZagreusField_2112", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- A whole entire sack of something!
			{ Cue = "/VO/ZagreusField_2113", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- A sack fit for a huge three-headed hound.
			{ Cue = "/VO/ZagreusField_2114", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- A special treat for Cerberus.
			{ Cue = "/VO/ZagreusField_2115", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- Ah good, it's still fresh!
			{ Cue = "/VO/ZagreusField_2116", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- Just what I need, a foul sack!
			{ Cue = "/VO/ZagreusField_2117", RequiredPlayed = { "/VO/ZagreusField_2107" }, CooldownName = "SaidSatyrSackRecently", CooldownTime = 30, },
			-- Just the foul sack I need.
			{ Cue = "/VO/ZagreusField_2118", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- Cerberus can never get enough of this stuff.
			{ Cue = "/VO/ZagreusField_2119", RequiredPlayed = { "/VO/ZagreusField_2107" } },
			-- I'll just tuck that away.
			{ Cue = "/VO/ZagreusField_2120", RequiredPlayed = { "/VO/ZagreusField_2107" } },
		},
	},
	-- #endregion

	-- #region SHRINECHALLENGE
	-- TODO: Check all function calls/texts
	ShrinePointDoor = {
		-- Custom: Added InheritFrom
		InheritFrom = { "ExitDoor", },
		CostBase = 2,
		CostPerDepth = 2,

		UsePromptOffsetY = -5,
		UsePromptOffsetX = 60,

		RewardPreviewOffsetZ = 120,
		RewardPreviewOffsetY = 1,
		BackingAnimation = "UnattachedRoomRewardAvailable-Back",
		IconSortMode = "Isometric",

		OverheadTextFontSize = 14,
		OverheadTextOffset = -150,
		OverheadTextColor = game.Color.DarkOrange,

		UseText = "UseShrinePointDoor_Locked_PreReward",
		LockedUseText = "UseShrinePointDoor_Locked_PostReward",
		UnlockedUseText = "UseShrinePointDoor_Unlocked",
		UnlockedUseTextReroll = "UseShrinePointDoor_Unlocked_Reroll",
		UnlockedUseTextCannotReroll = "UseShrinePointDoor_Unlocked_CannotReroll",
		RerollFunctionName = "AttemptRerollDoor",
		AllowReroll = true,

		LockedUseSound = "/Leftovers/SFX/OutOfAmmo2",
		UnlockedUseSound = "/Leftovers/SFX/NomadSprint",
		ExitPortalSound = "/SFX/HeatCollectionPickup",

		EntranceVfx = "ZagreusSecretDoorDiveFadeFx_Shrine",
		EntranceColorGrade = "SmokeTrap",

		ExitDoorOpenAnimation = "ShrinePointDoor_Revealed",
		ExitDoorCloseAnimation = "ShrinePointDoor_Revealed",
		UnlockedAnimation = "ShrinePointDoor_Revealed",
		UnlockedSound = "/SFX/HeatCollectionPickup",

		-- TODO: Voice lines
		ExitBlockedByShrinePointsVoiceLines = {
			BreakIfPlayed = true,
			RandomRemaining = true,
			PreLineWait = 0.25,
			CooldownTime = 9,

			-- I need a higher Pain Level with the Pact of Punishment to go in this.
			-- { Cue = "/VO/ZagreusField_1340", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- I need to power up the Pact of Punishment back home to go in this.
			{ Cue = "/VO/ZagreusField_1341" },
			-- My Pain Level isn't high enough.
			-- { Cue = "/VO/ZagreusField_1342", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- My Pain Level's too low.
			-- { Cue = "/VO/ZagreusField_1343", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- I need a higher Pain Level to go in.
			-- { Cue = "/VO/ZagreusField_1344", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- My Pain Level's too low to get in.
			-- { Cue = "/VO/ZagreusField_1345", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- Need a higher Pain Level to go in there.
			-- { Cue = "/VO/ZagreusField_1346", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- Not getting in without a higher Pain Level.
			-- { Cue = "/VO/ZagreusField_1347", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- I'm not authorized.
			{ Cue = "/VO/ZagreusField_1348", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- Not letting me in.
			{ Cue = "/VO/ZagreusField_1349", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- I don't have access.
			{ Cue = "/VO/ZagreusField_1350", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- I can't get in.
			{ Cue = "/VO/ZagreusField_1351", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- Not authorized to go in there.
			{ Cue = "/VO/ZagreusField_1352", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- The Pact back home's the key to getting into this.
			{ Cue = "/VO/ZagreusField_1353", RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- Not authorized.
			{ Cue = "/VO/ZagreusHome_0602",  RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- Not enough Heat.
			{ Cue = "/VO/ZagreusHome_0603",  RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- I don't have enough Heat.
			{ Cue = "/VO/ZagreusHome_0604",  RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- I'm not authorized.
			{ Cue = "/VO/ZagreusHome_0605",  RequiredPlayed = { "/VO/ZagreusField_1341" } },
			-- I'm not cleared to do that.
			{ Cue = "/VO/ZagreusHome_0606",  RequiredPlayed = { "/VO/ZagreusField_1341" } },
		},
		-- Custom
		ExitFunctionName = "AnomalyExitPresentation",
	},

	ShrinePointExitDoor = {
		-- Custom: Added InheritFrom
		InheritFrom = { "ExitDoor", },
		IsDefaultDoor = true,

		UsePromptOffsetY = -5,
		UsePromptOffsetX = 60,

		RewardPreviewOffsetZ = 120,
		RewardPreviewOffsetY = 0,
		BackingAnimation = "UnattachedRoomRewardAvailable-Back",
		IconSortMode = "Isometric",

		UseText = "UseSecretDoor_Locked_PreReward",
		LockedUseText = "UseSecretDoor_Locked_PostReward",
		UnlockedUseText = "UseExitSecretRoom",
		UnlockedUseTextReroll = "UseExitSecretRoom_Reroll",
		UnlockedUseTextCannotReroll = "UseExitSecretRoom_CannotReroll",
		RerollFunctionName = "AttemptRerollDoor",
		AllowReroll = true,

		-- UseSound = "/Leftovers/SFX/NomadSprint",
		LockedUseSound = "/Leftovers/SFX/OutOfAmmo2",
		UnlockedUseSound = "/Leftovers/SFX/NomadSprint",
		ExitPortalSound = "/SFX/HeatCollectionPickup",

		ExitDoorOpenAnimation = "ShrinePointDoor_Revealed",
		ExitDoorCloseAnimation = "ShrinePointDoor_Revealed",
		UnlockedAnimation = "ShrinePointDoor_Revealed"
	},
	-- #endregion
}

-- We need to re-process data inheritance for any redefined obstacles that define an InheritFrom
local needInheritanceProcessing = {
	"HealthFountainAsphodel",
	"HealthFountainElysium",
	"ShrinePointDoor",
	"ShrinePointExitDoor",
	"StyxDoor01",
	"TravelDoor03",
	"StyxWarpDoor",
	"TravelDoor01",
	"FinalBossExitDoor",
}

applyModificationsAndInheritObstacleData(game.ObstacleData, obstacleModifications, addedObstacles,
	needInheritanceProcessing)
