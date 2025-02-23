-- Contains file names/patterns required for copying over files from the Hades installation, and for uninstalling the mod

AudioFileMappings = {
	Enemies = "EnemiesModsNikkelMHadesBiomes",
	Sounds = "SoundsModsNikkelMHadesBiomes",
	Tartarus = "TartarusModsNikkelMHadesBiomes",
	Asphodel = "AsphodelModsNikkelMHadesBiomes",
}

-- Voiceover .txt and .fsb file names
-- The file name must be the same as the event names within the file
-- Some speaker names do not work (e.g. MegaeraHome)!
VoiceoverFileNames = {
	"Alecto",
	"Megaera",
	"MegaeraField",
	"Tisiphone",
	"ZagreusField",
}

PackageFileMappings = {
	Tartarus = "TartarusModsNikkelMHadesBiomes",
	Asphodel = "AsphodelModsNikkelMHadesBiomes",
	RoomManager = "RoomManagerModsNikkelMHadesBiomes",
	Fx = "FxModsNikkelMHadesBiomes",
	GUI = "GUIModsNikkelMHadesBiomes",
}

-- These will be copied from the plugins_data folder
CustomPackageFileNames = {
	"ModsNikkelMHadesBiomesPortraits",
}

BikFileMappings = {
	-- Enemy animations
	-- Wretch Glutton/PunchingBagUnit
	["EnemyWretchGluttonAttack_Bink"] = "EnemyWretchGluttonAttack_Bink",
	["EnemyWretchGluttonDeathVFX_Bink"] = "EnemyWretchGluttonDeathVFX_Bink",
	["EnemyWretchGluttonIdle_Bink"] = "EnemyWretchGluttonIdle_Bink",
	["EnemyWretchGluttonOnHit_Bink"] = "EnemyWretchGluttonOnHit_Bink",
	-- Wretch Thug/HeavyMelee
	["EnemyWretchThugAttack_Bink"] = "EnemyWretchThugAttack_Bink",
	["EnemyWretchThugDeathVFX_Bink"] = "EnemyWretchThugDeathVFX_Bink",
	["EnemyWretchThugIdle_Bink"] = "EnemyWretchThugIdle_Bink",
	["EnemyWretchThugOnHit_Bink"] = "EnemyWretchThugOnHit_Bink",
	["EnemyWretchThugStart_Bink"] = "EnemyWretchThugStart_Bink",
	["EnemyWretchThugWalk_Bink"] = "EnemyWretchThugWalk_Bink",
	-- Disembodied Hand/EnemyWringer
	["Enemy_Wringer_OnHit_Bink"] = "Enemy_Wringer_OnHit_Bink",
	["Enemy_WringerAttack_Bink"] = "Enemy_WringerAttack_Bink",
	["Enemy_WringerDeathVFX_Bink"] = "Enemy_WringerDeathVFX_Bink",
	["Enemy_WringerIdle_Bink"] = "Enemy_WringerIdle_Bink",
	["Enemy_WringerStart_Bink"] = "Enemy_WringerStart_Bink",
	["Enemy_WringerMove_Bink"] = "Enemy_WringerMove_Bink",
	-- Wretch Caster/LightRanged/HadesLightRanged
	["EnemyWretchCasterAttack_Bink"] = "EnemyWretchCasterAttack_Bink",
	["EnemyWretchCasterAttackAlt_Bink"] = "EnemyWretchCasterAttackAlt_Bink",
	["EnemyWretchCasterDeathVFX_Bink"] = "EnemyWretchCasterDeathVFX_Bink",
	["EnemyWretchCasterIdle_Bink"] = "EnemyWretchCasterIdle_Bink",
	["EnemyWretchCasterMove_Bink"] = "EnemyWretchCasterMove_Bink",
	["EnemyWretchCasterOnHit_Bink"] = "EnemyWretchCasterOnHit_Bink",
	["EnemyWretchCasterStart_Bink"] = "EnemyWretchCasterStart_Bink",
	["EnemyWretchCasterStop_Bink"] = "EnemyWretchCasterStop_Bink",
	-- Wretched Pest/ThiefMineLayer
	["EnemyStyxThiefIdle_Bink"] = "EnemyStyxThiefIdle_Bink",
	["EnemyWretchThiefFidget_Bink"] = "EnemyWretchThiefFidget_Bink",
	["EnemyWretchThiefOnHit_Bink"] = "EnemyWretchThiefOnHit_Bink",
	["EnemyWretchThiefThrow_Bink"] = "EnemyWretchThiefThrow_Bink",
	["EnemyWretchThiefWalk_Bink"] = "EnemyWretchThiefWalk_Bink",
	["EnemyStyxThiefFidget_Bink"] = "EnemyStyxThiefFidget_Bink",
	["EnemyStyxThiefOnHit_Bink"] = "EnemyStyxThiefOnHit_Bink",
	["EnemyStyxThiefWalk_Bink"] = "EnemyStyxThiefWalk_Bink",
	-- Wretch assassin
	["Enemy_WretchAssassin_Idle_Bink"] = "Enemy_WretchAssassin_Idle_Bink",
	["Enemy_WretchAssassin_Teleport_Bink"] = "Enemy_WretchAssassin_Teleport_Bink",
	["Enemy_WretchAssassin_OnHit_Bink"] = "Enemy_WretchAssassin_OnHit_Bink",
	["Enemy_WretchAssassinRange_Bink"] = "Enemy_WretchAssassinRange_Bink",
	["Enemy_WretchAssassinStab_Bink"] = "Enemy_WretchAssassinStab_Bink",
	["Enemy_WretchAssassin_DeathVFX_Bink"] = "Enemy_WretchAssassin_DeathVFX_Bink",
	-- Tartarus Boss - Furies/Harpies
	-- Fury/Megaera
	["Enemy_Fury_Idle_Bink"] = "Enemy_Fury_Idle_Bink",
	["Enemy_Fury_Run_Bink"] = "Enemy_Fury_Run_Bink",
	["Enemy_Fury_StartStop_Bink"] = "Enemy_Fury_StartStop_Bink",
	["Enemy_Fury_Lunge_Bink"] = "Enemy_Fury_Lunge_Bink",
	["Enemy_Fury_Beam_Bink"] = "Enemy_Fury_Beam_Bink",
	["Enemy_Fury_Lightning_Bink"] = "Enemy_Fury_Lightning_Bink",
	["Enemy_Fury_WhipWhirl_Bink"] = "Enemy_Fury_WhipWhirl_Bink",
	["Enemy_Fury_Shielded_Bink"] = "Enemy_Fury_Shielded_Bink",
	["Enemy_Fury_Dead_Bink"] = "Enemy_Fury_Dead_Bink",
	["Enemy_Fury_Taunt_Bink"] = "Enemy_Fury_Taunt_Bink",
	-- Alecto
	["Enemy_Alecto_Taunt_Bink"] = "Enemy_Alecto_Taunt_Bink",
	["Enemy_Alecto_Idle_Bink"] = "Enemy_Alecto_Idle_Bink",
	["Enemy_Alecto_WhipWhirl_Bink"] = "Enemy_Alecto_WhipWhirl_Bink",
	["Enemy_Alecto_TauntIdleLoop_Bink"] = "Enemy_Alecto_TauntIdleLoop_Bink",
	["Enemy_Alecto_StartStop_Bink"] = "Enemy_Alecto_StartStop_Bink",
	["Enemy_Alecto_Shielded_Bink"] = "Enemy_Alecto_Shielded_Bink",
	["Enemy_Alecto_Run_Bink"] = "Enemy_Alecto_Run_Bink",
	["Enemy_Alecto_Rage_Bink"] = "Enemy_Alecto_Rage_Bink",
	["Enemy_Alecto_Lunge_Bink"] = "Enemy_Alecto_Lunge_Bink",
	["Enemy_Alecto_Lightning_Bink"] = "Enemy_Alecto_Lightning_Bink",
	["Enemy_Alecto_Beam_Bink"] = "Enemy_Alecto_Beam_Bink",
	["Enemy_Fury2_Dead_Bink"] = "Enemy_Fury2_Dead_Bink",
	-- Tisiphone
	["Enemy_Tisiphone_Idle_Bink"] = "Enemy_Tisiphone_Idle_Bink",
	["Enemy_Tisiphone_Run_Bink"] = "Enemy_Tisiphone_Run_Bink",
	["Enemy_Tisiphone_StartStop_Bink"] = "Enemy_Tisiphone_StartStop_Bink",
	["Enemy_Tisiphone_Lunge_Bink"] = "Enemy_Tisiphone_Lunge_Bink",
	["Enemy_Tisiphone_Beam_Bink"] = "Enemy_Tisiphone_Beam_Bink",
	["Enemy_Tisiphone_Lightning_Bink"] = "Enemy_Tisiphone_Lightning_Bink",
	["Enemy_Tisiphone_WhipWhirl_Bink"] = "Enemy_Tisiphone_WhipWhirl_Bink",
	["Enemy_Tisiphone_Shielded_Bink"] = "Enemy_Tisiphone_Shielded_Bink",
	["Enemy_Fury3_Dead_Bink"] = "Enemy_Fury3_Dead_Bink",
	["Enemy_Tisiphone_Taunt_Bink"] = "Enemy_Tisiphone_Taunt_Bink",
	-- Megaera MultiFury
	["Enemy_MegaeraMultiFuryHover_Bink"] = "Enemy_MegaeraMultiFuryHover_Bink",
	["Enemy_MegaeraMultiFuryTakeOff_Bink"] = "Enemy_MegaeraMultiFuryTakeOff_Bink",
	["Enemy_MegaeraMultiFurySkyDive_Bink"] = "Enemy_MegaeraMultiFurySkyDive_Bink",
	-- Alecto MultiFury
	["Enemy_AlectoMultiFuryHover_Bink"] = "Enemy_AlectoMultiFuryHover_Bink",
	["Enemy_AlectoMultiFuryTakeOff_Bink"] = "Enemy_AlectoMultiFuryTakeOff_Bink",
	["Enemy_AlectoMultiFurySkyDive_Bink"] = "Enemy_AlectoMultiFurySkyDive_Bink",
	-- Tisiphone MultiFury
	["Enemy_TisiphoneMultiFuryHover_Bink"] = "Enemy_TisiphoneMultiFuryHover_Bink",
	["Enemy_TisiphoneMultiFuryTakeOff_Bink"] = "Enemy_TisiphoneMultiFuryTakeOff_Bink",
	["Enemy_TisiphoneMultiFurySkyDive_Bink"] = "Enemy_TisiphoneMultiFurySkyDive_Bink",
}

SjsonFileMappings = {
	-- Character animations - should only contain unique animation data, so we can simply copy the file instead of hooking
	-- Note - it's possible this only works if the file name is the same?
	["Animations\\CharacterAnim_Enemies_BoneDracon"] = "Animations\\CharacterAnim_Enemies_BoneDracon",
	["Animations\\CharacterAnim_Enemies_Shades"] = "Animations\\CharacterAnim_Enemies_Shades",
	["Animations\\CharacterAnim_Enemies_WretchThug"] = "Animations\\CharacterAnim_Enemies_WretchThug",
	["Animations\\CharacterAnim_Enemies_Wringer"] = "Animations\\CharacterAnim_Enemies_Wringer",
	["Animations\\CharacterAnim_Enemies_WretchAssassin"] = "Animations\\CharacterAnim_Enemies_WretchAssassin",
	["Animations\\CharacterAnim_EnemiesBosses_Furies"] = "Animations\\CharacterAnim_EnemiesBosses_Furies",
	["Animations\\CharacterAnimationsNPC_Thanatos"] = "Animations\\CharacterAnimationsNPC_Thanatos",
}

-- map_text and thing_bin file names
-- thing_bin files are re-encoded from the original Hades files, and are stored in the plugin_data folder
-- map_text files are copied directly from the Hades installation, if not defined below in MapTextFileNames
MapFileMappings = {
	-- Tartarus
	["RoomOpening"] = "RoomOpening",
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
}

-- .map_text files that should be copied from the plugin_data folder instead of the Hades installation
MapTextFileNames = {
	-- A new Terrain group was added to resolve flickering tiles next to where the player spawns
	RoomOpening = true,
}

-- Languages supported by Hades
HelpTextLanguages = {
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
