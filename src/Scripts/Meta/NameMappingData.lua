-- Some names or Ids from Hades are reused in Hades II for something similar or different
-- These names need to be changed in order to avoid conflicts and to use both versions alongside each other

-- Enemies that exist in both games
mod.EnemyNameMappings = {
	BaseVulnerableEnemy = "HadesBaseVulnerableEnemy",
	-- TARTARUS
	LightRanged = "HadesLightRanged",
	Swarmer = "HadesSwarmer",
	ThiefMineLayer = "HadesThiefMineLayer",
	ThiefMineLayerElite = "HadesThiefMineLayerElite",
	-- ASPHODEL
	-- Most of these already exist in Hades II, so we copy them and do some minor modifications, such as for spawn FX
	BloodlessNaked = "HadesBloodlessNaked",
	BloodlessNakedElite = "HadesBloodlessNakedElite",
	BloodlessGrenadier = "HadesBloodlessGrenadier",
	BloodlessGrenadierElite = "HadesBloodlessGrenadierElite",
	BloodlessSelfDestruct = "HadesBloodlessSelfDestruct",
	BloodlessSelfDestructElite = "HadesBloodlessSelfDestructElite",
	BloodlessPitcher = "HadesBloodlessPitcher",
	BloodlessPitcherElite = "HadesBloodlessPitcherElite",
	BloodlessWaveFist = "HadesBloodlessWaveFist",
	BloodlessWaveFistElite = "HadesBloodlessWaveFistElite",
	SpreadShotUnit = "HadesSpreadShotUnit",
	SpreadShotUnitElite = "HadesSpreadShotUnitElite",
	-- STYX
	Crawler = "HadesCrawler",
}

-- Enemies that should be removed from the Hades enemy data, as they already exist in Hades II. Also applies to Enemies.sjson
mod.EnemyNameRemovals = {
	-- #region GENERAL
	"TrainingMelee",
	-- #endregion
	-- #region ASPHODEL
	"BloodlessNaked",
	"BloodlessNakedElite",
	"BloodlessGrenadier",
	"BloodlessGrenadierElite",
	"BloodlessSelfDestruct",
	"BloodlessSelfDestructElite",
	"BloodlessPitcher",
	"BloodlessPitcherElite",
	"BloodlessWaveFist",
	"BloodlessWaveFistElite",
	"SpreadShotUnit",
	"SpreadShotUnitElite",
	"BloodlessNakedBerserker",
	"BloodlessNakedBerserkerElite",
	-- #endregion
}

mod.NPCNameMappings = {}
mod.NPCNameRemovals = {}

mod.EnemyProjectileMappings = {
	-- Not currently used by Hades II
	-- LightRangedWeapon = "HadesLightRangedWeapon",
	-- The two versions have different PressedIn/Out animations
	SpikeTrapWeapon = "HadesSpikeTrapWeapon",
	SwarmerMelee = "HadesSwarmerMelee",
}

mod.EnemyWeaponMappings = {
	-- The two versions have different PressedIn/Out animations
	SpikeTrapWeapon = "HadesSpikeTrapWeapon",
	SwarmerMelee = "HadesSwarmerMelee",
}

mod.EnemyAnimationMappings = {
	SpikeTrapIdle = "HadesSpikeTrapIdle",
	SpikeTrapPressed = "HadesSpikeTrapPressed",
	SpikeTrapPreFire = "HadesSpikeTrapPreFire",
	SpikeTrapDeactivated = "HadesSpikeTrapDeactivated"
}

mod.FxAnimationMappings = {
	SpikeTrapPressedIn = "HadesSpikeTrapPressedIn",
	SpikeTrapPressedOut = "HadesSpikeTrapPressedOut",

	DoorLocked = "HadesDoorLocked",
	DoorUnlocked = "HadesDoorUnlocked",

	EnemyProjectile = "HadesEnemyProjectile",
	EnemyProjectileIn = "HadesEnemyProjectileIn",
	EnemyProjectileLight = "HadesEnemyProjectileLight",

	HydraTouchdownFx = "HadesHydraTouchdownFx",
}
mod.GUIAnimationMappings = {
	ExitPreview = "HadesExitPreview",
}
mod.PortraitAnimationMappings = {
	Portrait_Base_01 = "HadesPortrait_Base_01",
	Portrait_Base_01_Exit = "HadesPortrait_Base_01_Exit",
}
mod.CharacterAnimationsNPCsMappings = {}

-- Mappings for Asphodel room names, as B_ is also used in Hades II. Used e.g. in IsGameStateEligible to map requirements for rooms
mod.AsphodelRoomNameMappings = {
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

mod.HadesHelpTextFileNames = {
	"_EnemyData",
	"_EncounterData",
	"_RoomData",
	"_RoomDataAsphodel",
	"_RoomDataElysium",
	"_RoomDataStyx",
	"_RoomDataSurface",
	"_RoomDataTartarus",
}
-- These files do not exist
mod.HadesHelpTextFileSkipMap = {
	_NPCData = {
		en = true,
	},
	_EnemyData = {
		en = true,
	},
	_EncounterData = {
		en = true,
	},
	_RoomData = {
		en = true,
	},
	_RoomDataAsphodel = {
		en = true,
	},
	_RoomDataElysium = {
		en = true,
	},
	_RoomDataStyx = {
		en = true,
	},
	_RoomDataSurface = {
		en = true,
	},
	_RoomDataTartarus = {
		en = true,
	},
}

mod.HadesHelpTextCopyKeys = {
	-- #region Combat Actions
	WallSlamHit = true,
	PitSlamHit = true,
	RubbleSlamHit = true,
	UnitFrozen = true,
	Combat_Enraged = true,
	Combat_PermanentEnraged = true,
	Pierced = true,
	Escaped = true,
	-- AssistNotAvailable = true, -- Duplicate
	-- AssistAvailableHint = true, -- Duplicate
	PoisonStack = true,
	-- DevotionMessage = true, -- Duplicate
	-- #endregion
	-- #region Interaction prompts
	UseLeaveRoomAsphodel = true,
	UseLeaveRoomAsphodel_Reroll = true,
	UseLeaveRoomAsphodel_CannotReroll = true,
	DiscountTrait = true,
	GiftBouldyUseText = true,
	UseTalkToSisyphus = true,
	UseTalkToBouldy = true,
	UseTalkToThanatos = true,
	UseTalkToPatroclus = true,
	UseTalkToCerberus = true,
	UseTalkToEurydice = true,
	UseFinalBossDoor = true,
	UseCerberusDoor = true,
	UseStyxWarpDoor = true,
	-- UseForbiddenItem = true, -- Duplicate
	-- UseCharonStoreDiscount = true, -- Duplicate
	-- #endregion
	-- #region Cerberus Messages
	ClearedCerberus_Title = true,
	ClearedCerberus_Subtitle = true,
	ClearedCerberus_Alt1_Title = true,
	ClearedCerberus_Alt1_Subtitle = true,
	ClearedCerberus_Alt2_Title = true,
	ClearedCerberus_Alt2_Subtitle = true,
	ClearedCerberus_A_Title = true,
	ClearedCerberus_A_Subtitle = true,
	ClearedCerberus_B_Title = true,
	ClearedCerberus_B_Subtitle = true,
	ClearedCerberus_C_Title = true,
	ClearedCerberus_C_Subtitle = true,
	ClearedCerberus_D_Title = true,
	ClearedCerberus_D_Subtitle = true,
	ClearedCerberus_E_Title = true,
	ClearedCerberus_E_Subtitle = true,
	ClearedCerberus_F_Title = true,
	ClearedCerberus_F_Subtitle = true,
	ClearedCerberus_G_Title = true,
	ClearedCerberus_G_Subtitle = true,
	ClearedCerberus_H_Title = true,
	ClearedCerberus_H_Subtitle = true,
	ClearedCerberus_I_Title = true,
	ClearedCerberus_I_Subtitle = true,
	ClearedCerberus_J_Title = true,
	ClearedCerberus_J_Subtitle = true,
	ClearedCerberus_K_Title = true,
	ClearedCerberus_K_Subtitle = true,
	ClearedCerberus_L_Title = true,
	ClearedCerberus_L_Subtitle = true,
	ClearedCerberus_M_Title = true,
	ClearedCerberus_M_Subtitle = true,
	ClearedCerberus_N_Title = true,
	ClearedCerberus_N_Subtitle = true,
	ClearedCerberus_O_Title = true,
	ClearedCerberus_O_Subtitle = true,
	ClearedCerberus_P_Title = true,
	ClearedCerberus_P_Subtitle = true,
	ClearedCerberus_Q_Title = true,
	ClearedCerberus_Q_Subtitle = true,
	-- #endregion
	-- #region Bouldy Blessings
	BouldyBlessing_Armor = true,
	BouldyBlessing_Attack = true,
	BouldyBlessing_Special = true,
	BouldyBlessing_Ranged = true,
	BouldyBlessing_Speed = true,
	BouldyBlessing_Money = true,
	BouldyBlessing_None = true,
	-- GainedBouldyBlessing = true, -- Duplicate
	-- #endregion
	-- #region ShrinePointDoor
	ShrinePointGate = true,
	UseShrinePointDoor_Locked_PreReward = true,
	UseShrinePointDoor_Locked_PostReward = true,
	UseShrinePointDoor_Unlocked = true,
	UseShrinePointDoor_Unlocked_Reroll = true,
	UseShrinePointDoor_Unlocked_CannotReroll = true,
	ShrinePointDoorEnterRequirement = true,
	-- #endregion
	-- #region Combat Objectives
	Objective_ThanatosKills = true,
	Objective_SurvivalTimer = true,
	-- Objective_PlayerKills = true, -- Duplicate
	-- #endregion
	-- #region Enemies
	Swarmer = true,
	SwarmerElite = true,
	LightSpawner = true,
	LightSpawnerElite = true,
	DisembodiedHand = true,
	HeavyMeleeElite = true,
	LightRanged = true,
	LightRangedElite = true,
	PunchingBagUnit = true,
	PunchingBagUnitElite = true,
	ThiefMineLayer = true,
	ThiefMineLayerElite = true,
	HeavyMelee = true,
	WretchAssassinMiniboss = true,
	HeavyRanged = true,
	HeavyRangedElite = true,
	HeavyRangedSplitterMiniboss = true,
	ShieldRanged = true,
	ShieldRangedElite = true,
	RangedBurrower = true,
	BloodlessNaked = true,
	BloodlessNakedBerserker = true,
	BloodlessGrenadier = true,
	BloodlessGrenadierElite = true,
	BloodlessSelfDestruct = true,
	BloodlessWaveFist = true,
	BloodlessWaveFistElite = true,
	BloodlessPitcher = true,
	BloodlessPitcherElite = true,
	SpreadShotUnit = true,
	SpreadShotUnitMiniboss = true,
	CrusherUnit = true,
	CrusherUnitElite = true,
	FreezeShotUnit = true,
	HitAndRunUnit = true,
	ShadeNaked = true,
	ShadeSwordUnit = true,
	ShadeSpearUnit = true,
	ShadeBowUnit = true,
	ShadeShieldUnit = true,
	SplitShotUnit = true,
	FlurrySpawner = true,
	FlurrySpawnerElite = true,
	ChariotSuicide = true,
	Chariot = true,
	Crawler = true,
	RatThug = true,
	RatThugMiniboss = true,
	ThiefImpulseMineLayer = true,
	ThiefImpulseMineLayerMiniboss = true,
	HeavyRangedForked = true,
	HeavyRangedForkedMiniboss = true,
	SatyrRanged = true,
	SatyrRangedMiniboss = true,
	CrawlerMiniBoss = true,
	CrawlerMiniBoss_Full = true,
	SpikeTrap = true,
	DartTrap = true,
	BlastCubeFused = true,
	GasTrapPassive = true,
	-- #endregion
	-- #region Bosses
	HydraHeadImmortal = true,
	HydraHeadImmortal_Full = true,
	HydraHeadImmortal_NickName = true,
	Theseus = true,
	Minotaur = true,
	Minotaur_Full = true,
	Minotaur_NickName = true,
	Hades_Full = true,
	-- #endregion
	-- #region Characters
	NPC_FurySister_01 = true,
	Harpy = true,
	NPC_FurySister_02 = true,
	NPC_FurySister_Unnamed_02 = true,
	Harpy2 = true,
	Harpy2_Full = true,
	NPC_FurySister_03 = true,
	NPC_FurySister_Unnamed_03 = true,
	Harpy3 = true,
	Harpy3_Full = true,
	NPC_Orpheus_01 = true,
	NPC_Orpheus_Story_01 = true,
	Orpheus = true,
	NPC_Sisyphus_01 = true,
	NPC_SisyphusAndBouldy_01 = true,
	Sisyphus = true,
	NPC_Patroclus_01 = true,
	NPC_Patroclus_Unnamed_01 = true,
	NPC_Eurydice_01 = true,
	NPC_Eurydice_Unnamed_01 = true,
	NPC_ThanatosUnnamed_01 = true,
	NPC_Thanatos_01 = true,
	Thanatos = true,
	NPC_Persephone_01 = true,
	NPC_Persephone_01A = true,
	NPC_Persephone_Unnamed_01 = true,
	NPC_Persephone_Home_01 = true,
	EndingComplete = true,
	EpilogueComplete = true,
	-- NPC_Bouldy_01 = true, -- Duplicate
	-- NPC_Hades_01 = true, -- Duplicate
	-- NPC_Hades_Story_02 = true, -- Using alias
	-- #endregion
	-- #region Remembrances
	Remembrance_Hades = true,
	Remembrance_Family = true,
	Remembrance_Death = true,
	Remembrance_Nobody = true,
	Remembrance_Dog = true,
	Remembrance_Weakling = true,
	Remembrance_Oaf = true,
	Remembrance_Mortal = true,
	Remembrance_Brat = true,
	Remembrance_Fear = true,
	Remembrance_Dare = true,
	Remembrance_Questions = true,
	Remembrance_Olympus = true,
	Remembrance_Curse = true,
	Remembrance_Bearing = true,
	Remembrance_Domain = true,
	Remembrance_Zeus = true,
	Remembrance_Place = true,
	Remembrance_Belong = true,
	Remembrance_Fury = true,
	Remembrance_Judged = true,
	Remembrance_You = true,
	Remembrance_Here = true,
	Remembrance_Poseidon = true,
	Remembrance_Elysium = true,
	Remembrance_Mistakes = true,
	Remembrance_Explain = true,
	Remembrance_Disrespect = true,
	Remembrance_Asphodel = true,
	Remembrance_Lack = true,
	Remembrance_Mess = true,
	Remembrance_Stray = true,
	Remembrance_Sulk = true,
	Remembrance_Bleed = true,
	Remembrance_Eyes = true,
	Remembrance_Disgusting = true,
	Remembrance_Forbidden = true,
	Remembrance_Breeze = true,
	Remembrance_Immortal = true,
	Remembrance_Divide = true,
	Remembrance_Limits = true,
	Remembrance_Arms = true,
	Remembrance_Heroes = true,
	Remembrance_Rivers = true,
	Remembrance_Boatman = true,
	Remembrance_Anger = true,
	Remembrance_Spear = true,
	Remembrance_Darkness = true,
	Remembrance_Gemstones = true,
	Remembrance_Vermin = true,
	Remembrance_Obscurity = true,
	Remembrance_Sturdy = true,
	Remembrance_Differences = true,
	Remembrance_Time = true,
	Remembrance_Titans = true,
	Remembrance_Boundaries = true,
	Remembrance_Learn = true,
	Remembrance_Sigil = true,
	Remembrance_Shouting = true,
	Remembrance_Standard = true,
	Remembrance_Surface = true,
	Remembrance_Failure = true,
	Remembrance_Nyx = true,
	Remembrance_Mortals = true,
	Remembrance_Pride = true,
	-- #endregion
	-- #region Locations
	Location_Tartarus = true,
	Location_Tartarus_Short = true,
	Tartarus = true,
	Location_Asphodel = true,
	Location_Asphodel_Short = true,
	Asphodel = true,
	Location_Elysium = true,
	Location_Elysium_Short = true,
	Elysium = true,
	Location_Styx = true,
	Location_Styx_Short = true,
	Styx = true,
	Location_Challenge = true,
	Challenge = true,
	Location_Surface = true,
	Surface = true,
	Location_Surface_Alt = true,
	Surface_Alt = true,
	-- #endregion
	-- #region Death
	OutroDeathMessage = true,
	PostEndingDeathMessage = true,
	PostEndingDeathMessageAlt = true,
	-- DeathMessage = true, -- TODO: Duplicate
	-- OutroDeathMessageAlt = true, -- TODO: Duplicate
	-- #endregion
	-- #region Vanquished Messages
	BiomeClearedMessage = true,
	HarpyDefeatedMessage = true,
	HarpiesDefeatedMessage = true,
	HydraDefeatedMessage = true,
	HydraDefeatedMessage02 = true,
	TheseusDefeatedMessage = true,
	MinotaurDefeatedMessage = true,
	HadesDefeatedMessage = true,
	ThanatosMessage = true,
	-- CrawlerDefeatedMessage = true, -- Duplicate
	-- #endregion
	-- #region Keepsake/Pet messages
	AchillesPatroclusSignoff = true,
	AchillesPatroclusSignoff_AssistMax = true,
	MegaeraSignoff = true,
	MegaeraSignoff_AssistMax_A = true,
	MegaeraSignoff_AssistMax_B = true,
	ThanatosSignoff = true,
	ThanatosSignoff_AssistMax_A = true,
	ThanatosSignoff_AssistMax_B = true,
	DusaSignoff = true,
	DusaSignoff_AssistMax = true,
	SkellySignoff = true,
	SkellySignoff_AssistMax = true,
	SisyphusSignoff = true,
	SisyphusSignoff_Max = true,
	SisyphusBouldySignoff = true,
	SisyphusBouldySignoff_AssistMax = true,
	EurydiceSignoff = true,
	EurydiceSignoff_Max = true,
	PatroclusSignoff = true,
	PatroclusSignoff_Max = true,
	PersephoneSignoff = true,
	Persephone_SignoffMax = true,
	HadesSignoff = true,
	Hades_SignoffMax = true,
	-- #endregion
	-- #region Pet traits/descriptions
	FuryAssistTrait_Rack = true,
	FuryAssistTrait_Delta = true,
	FuryAssistTrait = true,
	ThanatosAssistTrait_Rack = true,
	ThanatosAssistTrait_Delta = true,
	ThanatosAssistTrait = true,
	SisyphusAssistTrait_Rack = true,
	SisyphusAssistTrait_Delta = true,
	SisyphusAssistTrait = true,
	SkellyAssistTrait_Rack = true,
	SkellyAssistTrait_Delta = true,
	SkellyAssistTrait = true,
	DusaAssistTrait_Rack = true,
	DusaAssistTrait_Delta = true,
	DusaAssistTrait = true,
	AchillesPatroclusAssistTrait_Rack = true,
	AchillesPatroclusAssistTrait_Delta = true,
	AchillesPatroclusAssistTrait = true,
	-- #endregion
	-- #region RunHistory
	RunHistoryScreenResult_Tartarus = true,
	RunHistoryScreenResult_A_MiniBoss01 = true,
	RunHistoryScreenResult_A_MiniBoss02 = true,
	RunHistoryScreenResult_A_MiniBoss03 = true,
	RunHistoryScreenResult_A_Boss01 = true,
	RunHistoryScreenResult_A_Boss02 = true,
	RunHistoryScreenResult_A_Boss03 = true,
	RunHistoryScreenResult_Asphodel = true,
	RunHistoryScreenResult_B_Wrapping01 = true,
	RunHistoryScreenResult_B_MiniBoss01 = true,
	RunHistoryScreenResult_B_MiniBoss02 = true,
	RunHistoryScreenResult_B_Boss01 = true,
	RunHistoryScreenResult_Elysium = true,
	RunHistoryScreenResult_C_MiniBoss01 = true,
	RunHistoryScreenResult_C_MiniBoss02 = true,
	RunHistoryScreenResult_C_Boss01 = true,
	RunHistoryScreenResult_Styx = true,
	RunHistoryScreenResult_D_Boss01 = true,
	RunHistoryScreenResult_CharonFight01 = true,
	RunHistoryScreenResult_Challenge = true,
	RunHistoryScreen_Assist = true,
	-- #endregion
	-- #region Victory Screen messages
	ClearNumOne = true,
	ClearNumTen = true,
	ClearNumFifty = true,
	ClearNumOneHundred = true,
	ClearNumTwoFifty = true,
	ClearNumFiveHundred = true,
	ClearMetaPointsInvestedNone = true,
	ClearNoOlympianBoons = true,
	ClearAllStoryRooms = true,
	ClearAllReprieveRooms = true,
	ClearAllShopRooms = true,
	ClearRequiredTraitsAthena = true,
	ClearRequiredTraitsArtemis = true,
	ClearRequiredTraitsDionysus = true,
	ClearChallengeSwitches = true,
	ClearDevotionEncounters = true,
	ClearShrineChallengeEncounters = true,
	ClearMiniBossEncounters = true,
	ClearWeaponsFiredWrath = true,
	ClearWeaponsFiredRanged = true,
	ClearFishCaught = true,
	ClearConsecutiveLow = true,
	ClearConsecutiveHigh = true,
	ClearHealItems = true,
	ClearStackUpgrades = true,
	ClearGiftDrops = true,
	ClearLockKeyDrops = true,
	ClearConsolationPrizes = true,
	ClearManyLastStands = true,
	ClearShutDownThanatos = true,
	ClearManyTraitsSold = true,
	-- Duplicates
	-- ClearNearDeath = true,
	-- ClearFullHealth = true,
	-- ClearTimeFast = true,
	-- ClearTimeVeryFast = true,
	-- ClearTimeSlow = true,
	-- ClearMoneyNone = true,
	-- ClearMoneyHigh = true,
	-- ClearRequiredTraitsZeus = true,
	-- ClearRequiredTraitsPoseidon = true,
	-- ClearRequiredTraitsAres = true,
	-- ClearRequiredTraitsAphrodite = true,
	-- ClearRequiredTraitsHermes = true,
	-- ClearRequiredTraitsDemeter = true,
	-- ClearRequiredTraitsChaos = true,
	-- ClearHighMaxHealth = true,
	-- ClearSynergyTraits = true,
	-- ClearLegendaryTraits = true,
	-- #endregion
	-- #region Misc
	PassiveItem = true,
	Assist = true,
	RageMeter = true,
	_PlayerUnit = true,
	AssistTraitsPermitted_Title = true,
	AssistTraitsPermitted_Subtitle = true,
	Codex_Summon_Locked = true,
	-- #endregion
}
-- These are aliases that should be added to all HelpText files
-- The key is the Id, the value is the InheritFrom
mod.HadesHelpTextAliases = {
	Theseus2 = "Theseus",
	Minotaur2 = "Minotaur",
	Hades = "NPC_LordHades_01",
	NPC_Hades_Story_02 = "NPC_LordHades_01",
	NPC_Thanatos_Field_01 = "NPC_Thanatos_01",
	NPC_Orpheus_Story_01 = "NPC_Orpheus_01",
	NPC_Achilles_Story_01 = "NPC_Achilles_01",
	AchillesPatroclusReunion_B = "AchillesPatroclusReunion_A",
	AchillesPatroclusReunion_C = "AchillesPatroclusReunion_A",
	NPC_Patroclus_Standing_01 = "NPC_Patroclus_01",
	Charon = "NPC_Charon_01",
	ClearedCerberus_Alt1_Title = "ClearedCerberus_Title",
	ClearedCerberus_Alt2_Title = "ClearedCerberus_Title",
}

-- List of Speakers for which the entries in the _NPCData files should be copied
mod.HadesNPCTextSpeakers = {
	Sisyphus = true,
	Eurydice = true,
	Patroclus = true,
	Persephone = true, -- For now - we don't need all of her voicelines, as they are split between Surface and Home
	-- Cerberus Storyteller voicelines from mod.StorytellerVoicelines
	-- ZagreusField voicelines from mod.ZagreusFieldVoicelines
}

-- Keys to be removed from the CodexText files before hooking them into Hades II
-- These keys are not required (e.g. Gods)
mod.HadesCodexTextKeyRemovals = {
	"CodexData_Chaos_01",
	"CodexData_Demeter_01",
	"CodexData_Skelly_01",
}
-- Mappings for Codex entries that exist in both games, but need to be renamed to avoid conflicts
mod.HadesCodexTextNameMappings = {
	CodexData_BloodlessBerserker_01 = "CodexData_BloodlessBerserker_01_Hades",
	CodexData_Hades_01 = "CodexData_Hades_01_Hades",
}

-- Mappings for various game object modifications that need to be applied when the run is started/ended
--[[
	Format is, for example:
	EffectData = {
		DamageEchoEffect = {
			Vfx = {
				Default = "ZeusEchoDebuff",
				Modded = "ModsNikkelMHadesBiomesZeusEchoDebuff",
			},
		},
	},
]]
mod.ModdedGameObjectModifications = {}

-- Mappings for Effect VFX to be swapped out, used in EffectPresentation.lua
mod.EffectVfxMappings = {
	ZeusEchoDebuff = "ModsNikkelMHadesBiomesZeusEchoDebuff",
}
