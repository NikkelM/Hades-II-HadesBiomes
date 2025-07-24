-- Some names or Ids from Hades are reused in Hades II for something similar or different
-- These names need to be changed in order to avoid conflicts and to use both versions alongside each other

-- Enemies that exist in both games
mod.EnemyNameMappings = {
	BaseVulnerableEnemy = "HadesBaseVulnerableEnemy",
	-- TARTARUS
	LightRanged = "HadesLightRanged",
	Swarmer = "HadesSwarmer",
	ThiefMineLayer = "HadesThiefMineLayer",
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
	-- ELYSIUM
	-- STYX
	Crawler = "HadesCrawler",
}

-- Enemies that should be removed from the Hades enemy data, as they already exist in Hades II. Also applies to Enemies.sjson
mod.EnemyNameRemovals = {
	"TrainingMelee",
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
}

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

-- Modifications for Hades HelpText files
-- Format is ID = { ReplacementKey = "ReplacementValue" }
mod.HadesHelpTextModifications = {
	de = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} Embark \n {G} Alter {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	el = {},
	en = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} Embark \n {G} Alter {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	es = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} Embarcar \n {G} Cambiar {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	fr = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} Embarquer \n {G} Altérer {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	it = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} Imbarcati \n {G} Altera {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	ja = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} 乗る \n {G} 干渉する{#UseGiftPointFormat}（-1{!Icons.ReRoll}）"
		}
	},
	ko = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} 탑승 \n {G} 변경 {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	pl = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} Ruszaj \n {G} Zmień {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	["pt-BR"] = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} Embarcar \n {G} Alterar {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	ru = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} Отплыть \n {G} Изменить {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	tr = {},
	uk = {},
	["zh-CN"] = {
		UseLeaveRoomAsphodel_Reroll = {
			DisplayName = "{I} 上船 \n {G} 重置 {#UseGiftPointFormat}(-1{!Icons.ReRoll})"
		}
	},
	["zh-TW"] = {},
}
