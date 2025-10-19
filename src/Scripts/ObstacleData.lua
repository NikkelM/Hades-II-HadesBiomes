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
		OnUsedFunctionName = _PLUGIN.guid .. "." .. "UseStyxFountain",
		OnUsedVoiceLines = {
			Cooldowns =
			{
				{ Name = "ZagreusAnyQuipSpeech" },
				{ Name = "ZagCuredPoisonSpeech", Time = 15 }
			},
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 0.45,
				RequiredHasEffect = "StyxPoison",
				SuccessiveChanceToPlay = 0.5,

				-- Whew.
				{ Cue = "/VO/ZagreusField_2131", },
				-- Better.
				{ Cue = "/VO/ZagreusField_2132", },
				-- There.
				{ Cue = "/VO/ZagreusField_2133", },
				-- Cured.
				{ Cue = "/VO/ZagreusField_2134", },
				-- Good.
				{ Cue = "/VO/ZagreusField_2135", },
				-- OK.
				{ Cue = "/VO/ZagreusField_2136", },
				-- Mmm.
				{ Cue = "/VO/ZagreusField_2137", },
				-- Clean.
				{ Cue = "/VO/ZagreusField_2138", },
			},
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 0.45,
				RequiredFalseHasEffect = "StyxPoison",
				RequiredKillEnemiesFound = true,

				-- No effect.
				{ Cue = "/VO/ZagreusField_2139", RequiredPlayed = { "/VO/ZagreusField_2143" }, },
				-- Nothing.
				{ Cue = "/VO/ZagreusField_2140", RequiredPlayed = { "/VO/ZagreusField_2143" }, },
				-- No need.
				{ Cue = "/VO/ZagreusField_2141", RequiredPlayed = { "/VO/ZagreusField_2143" }, },
				-- Don't need a cure.
				{ Cue = "/VO/ZagreusField_2142", RequiredPlayed = { "/VO/ZagreusField_2143" }, },
				-- A poison cure.
				{ Cue = "/VO/ZagreusField_2143" },
				-- Curing water.
				{ Cue = "/VO/ZagreusField_2144", RequiredPlayed = { "/VO/ZagreusField_2143" }, },
			},
			{
				BreakIfPlayed = true,
				RandomRemaining = true,
				PreLineWait = 0.45,
				CooldownTime = 15,
				RequiredFalseHasEffect = "StyxPoison",
				RequiredKillEnemiesNotFound = true,

				-- Not bad.
				{ Cue = "/VO/ZagreusField_2436", RequiredPlayed = { "/VO/ZagreusField_2437" }, },
				-- Not poisoned at the moment, thanks.
				{ Cue = "/VO/ZagreusField_2437" },
				-- Doesn't taste like anything.
				{ Cue = "/VO/ZagreusField_2438", RequiredPlayed = { "/VO/ZagreusField_2437" }, },
				-- What is this stuff.
				{ Cue = "/VO/ZagreusField_2439", RequiredPlayed = { "/VO/ZagreusField_2437" }, },
				-- Tasty.
				{ Cue = "/VO/ZagreusField_2440", RequiredPlayed = { "/VO/ZagreusField_2437" }, },
				-- Tasty. Sort of.
				{ Cue = "/VO/ZagreusField_2441", RequiredPlayed = { "/VO/ZagreusField_2437" }, },
				-- No thanks.
				{ Cue = "/VO/ZagreusField_2442", RequiredPlayed = { "/VO/ZagreusField_2437" }, },
			},
		},
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
}

-- We need to re-process data inheritance for any redefined obstacles that define an InheritFrom
local needInheritanceProcessing = {
	"HealthFountainAsphodel",
	"HealthFountainElysium",
	"StyxDoor01",
	"TravelDoor03",
	"StyxWarpDoor",
	"TravelDoor01",
	"FinalBossExitDoor",
}

applyModificationsAndInheritObstacleData(game.ObstacleData, obstacleModifications, addedObstacles,
	needInheritanceProcessing)
