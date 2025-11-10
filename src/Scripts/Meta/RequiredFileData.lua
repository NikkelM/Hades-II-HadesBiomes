-- Audio .bank files, copied from Hades to Hades II
mod.AudioFileMappings = {
	Enemies = "EnemiesModsNikkelMHadesBiomes",
	Sounds = "SoundsModsNikkelMHadesBiomes",
	Tartarus = "TartarusModsNikkelMHadesBiomes",
	Asphodel = "AsphodelModsNikkelMHadesBiomes",
	Elysium = "ElysiumModsNikkelMHadesBiomes",
	-- Styx = "StyxModsNikkelMHadesBiomes", -- There actually is no Styx audio bank
}

-- Voiceover .txt and .fsb file names
-- The file name must be the same as the event names within the file
-- Some speaker names do not work (e.g. MegaeraHome)!
mod.VoiceoverFileNames = {
	Alecto = "Alecto",
	-- Charon = "Charon", -- Charon already exists and was moved into Megaera_1xxxx
	Eurydice = "Eurydice",
	HadesField = "HadesField",
	Megaera = "Megaera",
	MegaeraField = "MegaeraField",
	Minotaur = "Minotaur",
	Patroclus = "Patroclus",
	-- Persephone = "Persephone", -- Persephone already exists and was moved into Megaera_2xxxx
	Sisyphus = "Sisyphus",
	Theseus = "Theseus",
	Tisiphone = "Tisiphone",
	ZagreusField = "ZagreusField",
}

mod.PackageFileMappings = {
	Tartarus = "TartarusModsNikkelMHadesBiomes",
	Asphodel = "AsphodelModsNikkelMHadesBiomes",
	Elysium = "ElysiumModsNikkelMHadesBiomes",
	Styx = "StyxModsNikkelMHadesBiomes",
	Surface = "SurfaceModsNikkelMHadesBiomes",
	-- Erebus = "ErebusModsNikkelMHadesBiomes",
	-- Charon = "CharonModsNikkelMHadesBiomes",
	RoomManager = "RoomManagerModsNikkelMHadesBiomes",
}

mod.BikFileNames = {
	-- #region TARTARUS
	-- Wretch Glutton/PunchingBagUnit
	"EnemyWretchGluttonAttack_Bink",
	"EnemyWretchGluttonDeathVFX_Bink",
	"EnemyWretchGluttonIdle_Bink",
	"EnemyWretchGluttonOnHit_Bink",
	-- Wretch Thug/HeavyMelee
	"EnemyWretchThugAttack_Bink",
	"EnemyWretchThugDeathVFX_Bink",
	"EnemyWretchThugIdle_Bink",
	"EnemyWretchThugOnHit_Bink",
	"EnemyWretchThugStart_Bink",
	"EnemyWretchThugWalk_Bink",
	-- Disembodied Hand/EnemyWringer
	"Enemy_Wringer_OnHit_Bink",
	"Enemy_WringerAttack_Bink",
	"Enemy_WringerDeathVFX_Bink",
	"Enemy_WringerIdle_Bink",
	"Enemy_WringerStart_Bink",
	"Enemy_WringerMove_Bink",
	-- Wretch Caster/LightRanged/HadesLightRanged
	"EnemyWretchCasterAttack_Bink",
	"EnemyWretchCasterAttackAlt_Bink",
	"EnemyWretchCasterDeathVFX_Bink",
	"EnemyWretchCasterIdle_Bink",
	"EnemyWretchCasterMove_Bink",
	"EnemyWretchCasterOnHit_Bink",
	"EnemyWretchCasterStart_Bink",
	"EnemyWretchCasterStop_Bink",
	-- Wretched Pest/ThiefMineLayer
	"EnemyStyxThiefIdle_Bink",
	"EnemyWretchThiefFidget_Bink",
	"EnemyWretchThiefOnHit_Bink",
	"EnemyWretchThiefThrow_Bink",
	"EnemyWretchThiefWalk_Bink",
	"EnemyStyxThiefFidget_Bink",
	"EnemyStyxThiefOnHit_Bink",
	"EnemyStyxThiefWalk_Bink",
	-- Wretch assassin
	"Enemy_WretchAssassin_Idle_Bink",
	"Enemy_WretchAssassin_Teleport_Bink",
	"Enemy_WretchAssassin_OnHit_Bink",
	"Enemy_WretchAssassinRange_Bink",
	"Enemy_WretchAssassinStab_Bink",
	"Enemy_WretchAssassin_DeathVFX_Bink",
	-- Tartarus Boss - Furies/Harpies
	-- Fury/Megaera
	"Enemy_Fury_Idle_Bink",
	"Enemy_Fury_Run_Bink",
	"Enemy_Fury_StartStop_Bink",
	"Enemy_Fury_Lunge_Bink",
	"Enemy_Fury_Beam_Bink",
	"Enemy_Fury_Lightning_Bink",
	"Enemy_Fury_WhipWhirl_Bink",
	"Enemy_Fury_Shielded_Bink",
	"Enemy_Fury_Dead_Bink",
	"Enemy_Fury_Taunt_Bink",
	-- Alecto
	"Enemy_Alecto_Taunt_Bink",
	"Enemy_Alecto_Idle_Bink",
	"Enemy_Alecto_WhipWhirl_Bink",
	"Enemy_Alecto_TauntIdleLoop_Bink",
	"Enemy_Alecto_StartStop_Bink",
	"Enemy_Alecto_Shielded_Bink",
	"Enemy_Alecto_Run_Bink",
	"Enemy_Alecto_Rage_Bink",
	"Enemy_Alecto_Lunge_Bink",
	"Enemy_Alecto_Lightning_Bink",
	"Enemy_Alecto_Beam_Bink",
	"Enemy_Fury2_Dead_Bink",
	-- Tisiphone
	"Enemy_Tisiphone_Idle_Bink",
	"Enemy_Tisiphone_Run_Bink",
	"Enemy_Tisiphone_StartStop_Bink",
	"Enemy_Tisiphone_Lunge_Bink",
	"Enemy_Tisiphone_Beam_Bink",
	"Enemy_Tisiphone_Lightning_Bink",
	"Enemy_Tisiphone_WhipWhirl_Bink",
	"Enemy_Tisiphone_Shielded_Bink",
	"Enemy_Fury3_Dead_Bink",
	"Enemy_Tisiphone_Taunt_Bink",
	-- Megaera MultiFury
	"Enemy_MegaeraMultiFuryHover_Bink",
	"Enemy_MegaeraMultiFuryTakeOff_Bink",
	"Enemy_MegaeraMultiFurySkyDive_Bink",
	-- Alecto MultiFury
	"Enemy_AlectoMultiFuryHover_Bink",
	"Enemy_AlectoMultiFuryTakeOff_Bink",
	"Enemy_AlectoMultiFurySkyDive_Bink",
	-- Tisiphone MultiFury
	"Enemy_TisiphoneMultiFuryHover_Bink",
	"Enemy_TisiphoneMultiFuryTakeOff_Bink",
	"Enemy_TisiphoneMultiFurySkyDive_Bink",
	-- Sisyphus
	"NPC_SisyphusIdle_Bink",
	"NPC_SisyphusIdleGreeting_Bink",
	"NPC_SisyphusElbowing_Bink",
	"NPC_SisyphusExplaining_Bink",
	-- #endregion
	-- #region ASPHODEL
	-- RangedBurrower
	"Enemy_BoneDracon_Idle_Bink",
	"Enemy_BoneDracon_OnHit_Bink",
	"Enemy_BoneDraconBurrowSet_Bink",
	"Enemy_BoneDraconAttackRange_Bink",
	"Enemy_BoneDraconDeathVFX_Bink",
	-- Asphodel Boss - Hydras
	"Enemy_Hydra_Roar_Bink",
	"Enemy_Hydra_OnHit_Bink",
	"Enemy_Hydra_MouthOpening_Bink",
	"Enemy_Hydra_Slam_Bink",
	"Enemy_Hydra_Idle_Bink",
	"Enemy_Hydra_Ranged_Bink",
	"Enemy_Hydra_DeathVFX_Bink",
	"Enemy_Hydra_Lunge_Bink",
	"Enemy_Hydra_Sleep_Bink",
	"Enemy_HydraPurple_Roar_Bink",
	"Enemy_HydraPurple_OnHit_Bink",
	"Enemy_HydraPurple_MouthOpening_Bink",
	"Enemy_HydraPurple_Slam_Bink",
	"Enemy_HydraPurple_Idle_Bink",
	"Enemy_HydraPurple_Ranged_Bink",
	"Enemy_HydraPurple_Lunge_Bink",
	"Enemy_HydraPurple_Sleep_Bink",
	"Enemy_HydraOrange_Roar_Bink",
	"Enemy_HydraOrange_OnHit_Bink",
	"Enemy_HydraOrange_MouthOpening_Bink",
	"Enemy_HydraOrange_Slam_Bink",
	"Enemy_HydraOrange_Idle_Bink",
	"Enemy_HydraOrange_Ranged_Bink",
	"Enemy_HydraOrange_Lunge_Bink",
	"Enemy_HydraOrange_Sleep_Bink",
	"Enemy_HydraGreen_Roar_Bink",
	"Enemy_HydraGreen_OnHit_Bink",
	"Enemy_HydraGreen_MouthOpening_Bink",
	"Enemy_HydraGreen_Slam_Bink",
	"Enemy_HydraGreen_Idle_Bink",
	"Enemy_HydraGreen_Ranged_Bink",
	"Enemy_HydraGreen_Lunge_Bink",
	"Enemy_HydraGreen_Sleep_Bink",
	"Enemy_HydraBlue_Roar_Bink",
	"Enemy_HydraBlue_OnHit_Bink",
	"Enemy_HydraBlue_MouthOpening_Bink",
	"Enemy_HydraBlue_Slam_Bink",
	"Enemy_HydraBlue_Idle_Bink",
	"Enemy_HydraBlue_Ranged_Bink",
	"Enemy_HydraBlue_Lunge_Bink",
	"Enemy_HydraBlue_Sleep_Bink",
	-- Eurydice
	"NPC_EurydiceIdle_Bink",
	"NPC_EurydiceIdleSinging_Bink",
	-- #endregion
	-- #region ELYSIUM
	-- ShadeUnits generic
	"ShadeOnHit_Bink",
	"ShadeDeathVFX_Bink",
	-- ShadeSpearUnit
	"ShadeSpearIdle_Bink",
	"ShadeSpearRun_Bink",
	"ShadeSpearAttacks_Bink",
	"ShadeSpearOnHit_Bink",
	"ShadeSpearAttackLeap_Bink",
	-- ShadeBowUnit
	"ShadeBowAttacks_Bink",
	"ShadeBowOnHit_Bink",
	"ShadeBowIdle_Bink",
	"ShadeBowRun_Bink",
	-- ShadeShieldUnit
	"ShadeShieldIdle_Bink",
	"ShadeShieldWalk_Bink",
	"ShadeShieldSlam_Bink",
	"ShadeShieldAttacks_Bink",
	"ShadeShieldOnHit_Bink",
	-- ShadeSwordUnit
	"ShadeSwordAttack_Bink",
	"ShadeSwordAttackOverHead_Bink",
	"ShadeSwordRun_Bink",
	"ShadeSwordOnHit_Bink",
	"ShadeSwordIdle_Bink",
	-- SplitShotUnit
	"EnemyWretchCasterSplitShotAttack_Bink",
	"EnemyWretchCasterSplitShotAttackAlt_Bink",
	"EnemyWretchCasterSplitShotIdle_Bink",
	"EnemyWretchCasterSplitShotMove_Bink",
	"EnemyWretchCasterSplitShotOnHit_Bink",
	"EnemyWretchCasterSplitShotStart_Bink",
	"EnemyWretchCasterSplitShotStop_Bink",
	-- Chariot
	"Enemy_ChariotIdle_Bink",
	"Enemy_ChariotAttack_Bink",
	"Enemy_ChariotOnHit_Bink",
	"Enemy_ChariotDeathVFX_Bink",
	-- ChariotSuicide
	"Enemy_ChariotSmallIdle_Bink",
	"Enemy_ChariotSmallAttack_Bink",
	"Enemy_ChariotSmallOnHit_Bink",
	"Enemy_ChariotSmallDeathVFX_Bink",
	-- Theseus
	"TheseusWalk_Bink",
	"TheseusIdle_Bink",
	"TheseusSpearSpin_Bink",
	"TheseusWrath_Bink",
	"TheseusSpearThrow_Bink",
	"MinotaurTheseusThrow_Bink",
	"TheseusTaunt_Bink",
	"TheseusDeathVFX_Bink",
	-- Theseus Armored
	"TheseusChariotTaunt_Bink",
	"TheseusChariotRide_Bink",
	"TheseusChariotFall_Bink",
	-- Minotaur
	"MinotaurIdle_Bink",
	"MinotaurBullRush_Bink",
	"MinotaurWalk_Bink",
	"MinotaurBullRushCharge_Bink",
	"MinotaurCrouchThrow_Bink",
	"MinotaurBullRushStrike_Bink",
	"MinotaurCrescentStrike_Bink",
	"MinotaurAttackLeap_Bink",
	"MinotaurWalkStop_Bink",
	"MinotaurAttackSwings_Bink",
	"MinotaurTaunt_Bink",
	"MinotaurDeathVFX_Bink",
	-- Minotaur Armored
	"MinotaurArmoredIdle_Bink",
	"MinotaurArmoredBullRush_Bink",
	"MinotaurArmoredWalk_Bink",
	"MinotaurArmoredBullRushCharge_Bink",
	"MinotaurArmoredAttackAxeSpin_Bink",
	"MinotaurArmoredBullRushStrike_Bink",
	"MinotaurArmoredCrescentStrike_Bink",
	"MinotaurArmoredAttackLeap_Bink",
	"MinotaurArmoredWalkStop_Bink",
	"MinotaurArmoredAttackSwings_Bink",
	"MinotaurArmoredTaunt_Bink",
	"MinotaurArmoredDeathVFX_Bink",
	-- Patroclus
	"NPC_PatroclusIdleSitting_Bink",
	"NPC_PatroclusIdleStanding_Bink",
	-- #endregion
	-- #region STYX
	-- Cerberus
	"Cerberus_HubIdle_Bink",
	"Cerberus_HappyGreeting_Bink",
	-- RatThug
	"Enemy_RatThugIdle_Bink",
	"Enemy_RatThugMove_Bink",
	"Enemy_RatThugShake_Bink",
	"Enemy_RatThugAttackBite_Bink",
	"Enemy_RatThugOnHit_Bink",
	"Enemy_RatThugBurrow_Bink",
	-- SatyrRanged
	"Enemy_SatyrRangedAttack_Bink",
	"Enemy_SatyrOnHit_Bink",
	"Enemy_SatyrIdle_Bink",
	"Enemy_SatyrMove_Bink",
	"Enemy_SatyrMoveStop_Bink",
	-- SatyrRangedMiniboss
	"Enemy_SatyrMinibossRangedAttack_Bink",
	"Enemy_SatyrMinibossOnHit_Bink",
	"Enemy_SatyrMinibossIdle_Bink",
	"Enemy_SatyrMinibossMove_Bink",
	"Enemy_SatyrMinibossMoveStop_Bink",
	-- Hades
	"HubBossDoorOpen",
	"HadesBattleIdle_Bink",
	"HadesBattleIntro_Bink",
	"HadesBattleIntroIdle_Bink",
	"HadesBattleRun_Bink",
	"HadesBattleDash_Bink",
	"HadesBattleAttackSpin_Bink",
	"HadesBattleBidentFlurry_Bink",
	"HadesBattleAttackRange_Bink",
	"HadesBattleSpawn_Bink",
	"HadesBattleWrathTwo_Bink",
	"HadesBattleKnockDown_Bink",
	"HadesBattleInvisibility_Bink",
	"HadesBattleCastBeam_Bink",
	"HadesBattleAttackArcOne_Bink",
	"HadesBattleAttackArcTwo_Bink",
	"HadesDeathFullscreen",
	"HadesBattleKnockDownTwo_Bink",
	"HadesBattleDeath_Bink",
	"HadesBattleKnockDownRecover_Bink",
	"HadesBattleAttackSpin2_Bink",
	"HadesBattleBidentThrow_Bink",
	"HadesBattleBidentDashRecover_Bink",
	"HadesBattleHeal_Bink",
	"HadesBattleKnockDownPreRecover_Bink",
	"Cerberus_HadesAssistJumpIn_Bink",
	"Cerberus_HadesAssistRun_Bink",
	"Cerberus_HadesAssistJumpFromRun_Bink",
	-- #endregion
	-- #region THANATOS
	"ThanatosIdleInhouse_Bink",
	"ThanatosIdle_Bink",
	"ThanatosAttack_Bink",
	"ThanatosAttackHold_Bink",
	"ThanatosEmoteDismissal_Bink",
	-- #endregion
	-- #region CHARON
	"CharonIdleBattle_Bink",
	"CharonMove_Bink",
	"CharonMeleeFront_Bink",
	"CharonMeleeFrontLRTI_Bink",
	"CharonMeleeBackSwing_Bink",
	"CharonCast_Bink",
	"CharonRadialPush_Bink",
	"CharonGhostCharge_Bink",
	"CharonTaunt_Bink",
	-- #endregion
	-- #region PERSEPHONE
	"NPC_PersephoneEndingBoatIdleFidget1_Bink",
	"NPC_PersephoneEndingBoatIdleLoop_Bink",
	"NPC_PersephoneGardenDismiss_Bink",
	"NPC_PersephoneGardenGreeting_Bink",
	"NPC_PersephoneGardenIdleHip_Bink",
	"NPC_PersephoneGardenVulnerable_Bink",
	"NPC_PersephoneGardenWalk_Bink",
	"NPC_PersephoneGardenWalkStop_Bink",
	"NPC_PersephoneUnderworldDismiss_Bink",
	"NPC_PersephoneUnderworldGreeting_Bink",
	"NPC_PersephoneUnderworldIdle_Bink",
	"NPC_PersephoneUnderworldVulnerable_Bink",
	"NPC_PersephoneUnderworldWalk_Bink",
	"NPC_PersephoneUnderworldWalkStop_Bink",
	-- #endregion
	-- #region ENDING
	"CharonEndingBoatRow_Bink",
	"CharonEndingBoatRowIdle_Bink",
	"EndingBoatBack_Bink",
	"EndingBoatFront_Bink",
	"EndingBoatWhole_Bink",
	"HouseDoor02Open",
	-- #endregion
	-- #region ZAGREUS
	"ZagreusStart_Bink",
	"ZagreusIdle_Bink",
	"ZagreusWalkStop2_Bink",
	"ZagreusWalk2_Bink",
	"ZagreusRun_Bink",
	"ZagreusStop_Bink",
	"ZagreusTalkEmpathy_Bink",
	"ZagreusInteractionThoughtful_Bink",
	"ZagreusTalkDenial_Bink",
	"ZagreusInteractionComeHither_Bink",
	"ZagreusInteractionFishing_Bink",
	"ZagreusInteractionFishingFail_Bink",
	"ZagreusInjured_IdleToSick_Bink",
	"ZagreusInjured_SickStandingSet_Bink",
	"ZagreusInjured_SickKneelingSet_Bink",
	"ZagreusEndingBoatIdleLoop_Bink",
	"ZagreusEndingBoatIdleFidget1_Bink",
	"ZagreusEndingBoatIdleFidget2_Bink",
	-- #endregion
}

mod.CustomBikFileNames = {
	"NikkelMHadesRT", -- The RoomTransition, weird name to adhere to have same character length as original file
	"HadesBiomesDiaBackTartarus",
	"HadesBiomesDiaBackAsphodel",
	"HadesBiomesDiaBackElysium",
	"HadesBiomesDiaBackEChamps",
	"HadesBiomesDiaBackStyxBoss",
	"RunHistoryInHadesModdedXX",
	"RunHistoryInModdedFailXXX",
	"RunHistoryLoopHadesModded",
	"RunHistoryLoopModdedFailX",
}

mod.SjsonFileMappings = {
	-- Character animations - should only contain unique animation data, so we can simply copy the file instead of hooking
	-- Note - it's possible this only works if the file name is the same?
	-- Normal enemies
	"Animations\\CharacterAnim_Enemies_BoneDracon",
	"Animations\\CharacterAnim_Enemies_Chariot",
	"Animations\\CharacterAnim_Enemies_Crawler",
	"Animations\\CharacterAnim_Enemies_Rat",
	"Animations\\CharacterAnim_Enemies_Satyr",
	"Animations\\CharacterAnim_Enemies_Shades",
	"Animations\\CharacterAnim_Enemies_WretchAssassin",
	"Animations\\CharacterAnim_Enemies_WretchThug",
	"Animations\\CharacterAnim_Enemies_Wringer",
	-- Bosses
	"Animations\\CharacterAnim_EnemiesBosses_Charon",
	"Animations\\CharacterAnim_EnemiesBosses_Furies",
	"Animations\\CharacterAnim_EnemiesBosses_Hades",
	"Animations\\CharacterAnim_EnemiesBosses_Hydra",
	"Animations\\CharacterAnim_EnemiesBosses_Minotaur",
	"Animations\\CharacterAnim_EnemiesBosses_Theseus",
	-- NPCs
	-- "Animations\\CharacterAnimationsNPCs", -- This file is copied directly
	"Animations\\CharacterAnimationsNPC_Persephone",
	"Animations\\CharacterAnimationsNPC_Thanatos",
}

-- Modifications to animations in the above files, before they are copied over
mod.SjsonFileModifications = {
	["Animations\\CharacterAnim_Enemies_BoneDracon"] = {
		EnemyBoneDraconDeathVFX = {
			SortMode = "Isometric",
		},
	},
	["Animations\\CharacterAnim_Enemies_Chariot"] = {
		EnemyActivationChariotFade = {
			ChainTo = "ChariotIdle",
		},
		ChariotDeathVFX = {
			SortMode = "Isometric",
		},
		EnemyActivationChariotSuicideFade = {
			ChainTo = "ChariotSuicideIdle",
		},
		ChariotSuicideDeathVFX = {
			SortMode = "Isometric",
			Scale = 0.5,
		},
	},
	["Animations\\CharacterAnim_Enemies_Shades"] = {
		EnemyActivationShadeNakedFade = {
			ChainTo = "ShadeNaked_Idle_Flameless",
			OffsetY = -20.0,
		},
		EnemyActivationShadeSpearFade = {
			ChainTo = "ShadeSpear_Idle",
		},
		EnemyActivationShadeBowFade = {
			ChainTo = "ShadeBow_Idle",
		},
		EnemyActivationShadeShieldFade = {
			ChainTo = "ShadeShield_Idle",
		},
		EnemyActivationShadeSwordFade = {
			ChainTo = "ShadeSword_Idle",
		},
		ShadeDeathVFX = {
			SortMode = "Isometric",
		},
		ShadeNakedDeathVFX = {
			SortMode = "Isometric",
			OffsetY = -70.0,
		},
		ShadeGlow = {
			FilePath = "null",
			Scale = 0,
			ScaleX = 0,
			Material = "null"
		},
	},
	["Animations\\CharacterAnim_Enemies_WretchThug"] = {
		EnemyActivationWretchThugFade = {
			ChainTo = "EnemyWretchThugIdle",
		},
		EnemyWretchThugDeath = {
			SortMode = "Isometric",
		},
	},
	["Animations\\CharacterAnim_Enemies_Wringer"] = {
		EnemyActivationDisembodiedHandFade = {
			ChainTo = "EnemyWringerIdle",
		},
		EnemyWringerDeathVFX = {
			SortMode = "Isometric",
		},
	},
	["Animations\\CharacterAnim_EnemiesBosses_Hydra"] = {
		EnemyHydraDeathVFX = {
			SortMode = "Isometric",
		},
		EnemyHydraTaunt = {
			ChainTo = "EnemyHydraRoarReturnToIdle",
		},
		EnemyHydraOrangeTaunt = {
			ChainTo = "EnemyHydraOrangeRoarReturnToIdle",
		},
		EnemyHydraGreenTaunt = {
			ChainTo = "EnemyHydraGreenRoarReturnToIdle",
		},
		EnemyHydraBlueTaunt = {
			ChainTo = "EnemyHydraBlueRoarReturnToIdle",
		},
		EnemyHydraPurpleTaunt = {
			ChainTo = "EnemyHydraPurpleRoarReturnToIdle",
		},
	},
	["Animations\\CharacterAnim_EnemiesBosses_Hades"] = {
		HadesBattleDashStreaks = mod.NilValue,
		HadesBattleDashStreaksDark = mod.NilValue,
		-- To allow him blinking through the pillars (he otherwise gets stuck on them very often)
		HadesBattleDash_Start = {
			OwnerHasNoCollision = true,
		},
	}
}

-- map_text and thing_bin file names
-- thing_bin files are re-encoded from the original Hades files, and are stored in the plugin_data folder
-- map_text files are copied directly from the Hades installation, if not defined below in MapTextFileNames
mod.MapFileMappings = {
	-- Tartarus
	["RoomOpening"] = "RoomOpening",
	["RoomSimple01"] = "RoomSimple01",
	["A_PreBoss01"] = "A_PreBoss01",
	["A_Boss01"] = "A_Boss01",
	["A_Boss02"] = "A_Boss02",
	["A_Boss03"] = "A_Boss03",
	["A_PostBoss01"] = "A_PostBoss01",
	["A_MiniBoss01"] = "A_MiniBoss01",
	["A_MiniBoss02"] = "A_MiniBoss02",
	["A_MiniBoss03"] = "A_MiniBoss03",
	["A_MiniBoss04"] = "A_MiniBoss04",
	["A_Shop01"] = "A_Shop01",
	["A_Story01"] = "A_Story01",
	["A_Reprieve01"] = "A_Reprieve01",
	["A_Combat01"] = "A_Combat01",
	["A_Combat02"] = "A_Combat02",
	["A_Combat03"] = "A_Combat03",
	["A_Combat04"] = "A_Combat04",
	["A_Combat05"] = "A_Combat05",
	["A_Combat06"] = "A_Combat06",
	["A_Combat07"] = "A_Combat07",
	["A_Combat08A"] = "A_Combat08A",
	["A_Combat08B"] = "A_Combat08B",
	["A_Combat09"] = "A_Combat09",
	["A_Combat10"] = "A_Combat10",
	["A_Combat11"] = "A_Combat11",
	["A_Combat12"] = "A_Combat12",
	["A_Combat13"] = "A_Combat13",
	["A_Combat14"] = "A_Combat14",
	["A_Combat15"] = "A_Combat15",
	["A_Combat16"] = "A_Combat16",
	["A_Combat17"] = "A_Combat17",
	["A_Combat18"] = "A_Combat18",
	["A_Combat19"] = "A_Combat19",
	["A_Combat20"] = "A_Combat20",
	["A_Combat21"] = "A_Combat21",
	["A_Combat24"] = "A_Combat24",
	-- Asphodel - B_ is also used for Anomaly in Hades II
	["B_Intro"] = "X_Intro",
	["B_Boss01"] = "X_Boss01",
	["B_Boss02"] = "X_Boss02",
	["B_PostBoss01"] = "X_PostBoss01",
	["B_Wrapping01"] = "X_Wrapping01",
	["B_MiniBoss01"] = "X_MiniBoss01",
	["B_MiniBoss02"] = "X_MiniBoss02",
	["B_PreBoss01"] = "X_PreBoss01",
	["B_Shop01"] = "X_Shop01",
	["B_Reprieve01"] = "X_Reprieve01",
	["B_Combat01"] = "X_Combat01",
	["B_Combat02"] = "X_Combat02",
	["B_Combat03"] = "X_Combat03",
	["B_Combat04"] = "X_Combat04",
	["B_Combat05"] = "X_Combat05",
	["B_Combat06"] = "X_Combat06",
	["B_Combat07"] = "X_Combat07",
	["B_Combat08"] = "X_Combat08",
	["B_Combat09"] = "X_Combat09",
	["B_Combat10"] = "X_Combat10",
	["B_Combat21"] = "X_Combat21",
	["B_Combat22"] = "X_Combat22",
	["B_Story01"] = "X_Story01",
	-- Elysium - C_ is also used for Zagreus/Charon fight in Hades II
	["C_Intro"] = "Y_Intro",
	["C_PreBoss01"] = "Y_PreBoss01",
	["C_Boss01"] = "Y_Boss01",
	["C_PostBoss01"] = "Y_PostBoss01",
	["C_MiniBoss01"] = "Y_MiniBoss01",
	["C_MiniBoss02"] = "Y_MiniBoss02",
	["C_MiniBoss03"] = "Y_MiniBoss03",
	["C_Shop01"] = "Y_Shop01",
	["C_Story01"] = "Y_Story01",
	["C_Reprieve01"] = "Y_Reprieve01",
	["C_Combat01"] = "Y_Combat01",
	["C_Combat02"] = "Y_Combat02",
	["C_Combat03"] = "Y_Combat03",
	["C_Combat04"] = "Y_Combat04",
	["C_Combat05"] = "Y_Combat05",
	["C_Combat06"] = "Y_Combat06",
	["C_Combat07"] = "Y_Combat07",
	["C_Combat08"] = "Y_Combat08",
	["C_Combat09"] = "Y_Combat09",
	["C_Combat10"] = "Y_Combat10",
	["C_Combat11"] = "Y_Combat11",
	["C_Combat12"] = "Y_Combat12",
	["C_Combat13"] = "Y_Combat13",
	["C_Combat14"] = "Y_Combat14",
	["C_Combat15"] = "Y_Combat15",
	-- Styx
	["D_Intro"] = "D_Intro",
	["D_Hub"] = "D_Hub",
	["D_Boss01"] = "D_Boss01",
	["D_MiniBoss01"] = "D_MiniBoss01",
	["D_MiniBoss02"] = "D_MiniBoss02",
	["D_MiniBoss03"] = "D_MiniBoss03",
	["D_MiniBoss04"] = "D_MiniBoss04",
	["D_Reprieve01"] = "D_Reprieve01",
	["D_Combat01"] = "D_Combat01",
	["D_Combat02"] = "D_Combat02",
	["D_Combat03"] = "D_Combat03",
	["D_Combat04"] = "D_Combat04",
	["D_Combat05"] = "D_Combat05",
	["D_Combat06"] = "D_Combat06",
	["D_Mini01"] = "D_Mini01",
	["D_Mini02"] = "D_Mini02",
	["D_Mini03"] = "D_Mini03",
	["D_Mini04"] = "D_Mini04",
	["D_Mini05"] = "D_Mini05",
	["D_Mini06"] = "D_Mini06",
	["D_Mini07"] = "D_Mini07",
	["D_Mini08"] = "D_Mini08",
	["D_Mini09"] = "D_Mini09",
	["D_Mini10"] = "D_Mini10",
	["D_Mini11"] = "D_Mini11",
	["D_Mini12"] = "D_Mini12",
	["D_Mini13"] = "D_Mini13",
	["D_Mini14"] = "D_Mini14",
	-- Surface
	["E_Intro"] = "E_Intro",
	["E_Story01"] = "E_Story01",
	-- Surface - Return/Ending
	["RoomReturn"] = "RoomReturn",
	["Return01"] = "Return01",
	["Return02"] = "Return02",
	["Return03"] = "Return03",
	["Return04"] = "Return04",
	["Return05"] = "Return05",
	["Return06"] = "Return06",
	-- -- Erebus/Challenge
	-- ["RoomChallenge01"] = "RoomChallenge01",
	-- ["RoomChallenge02"] = "RoomChallenge02",
	-- ["RoomChallenge03"] = "RoomChallenge03",
	-- ["RoomChallenge04"] = "RoomChallenge04",
	-- -- Charon
	-- ["CharonFight01"] = "CharonFight01",
}

-- .map_text files that should be copied from the plugin_data folder instead of the Hades installation
mod.MapTextFileNames = {
	-- A new Terrain group was added to resolve flickering tiles next to where the player spawns
	RoomOpening = true,
}

-- Languages supported by Hades
mod.HelpTextLanguages = {
	"de",
	"en",
	"es",
	"fr",
	"it",
	"ja",
	"ko",
	"pl",
	"pt-BR",
	"ru",
	"zh-CN"
}
