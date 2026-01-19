-- To hide the icon in the list view, and show it smaller in the detail view
game.ScreenData.QuestLog.ReadyToCashOutFormat.TextSymbolScale = 0
game.ScreenData.QuestLog.IncompleteFormat.TextSymbolScale = 0
game.ScreenData.QuestLog.CashedOutFormat.TextSymbolScale = 0
game.ScreenData.QuestLog.ComponentData.InfoBoxTitle.TextArgs.TextSymbolScale = 0.5

-- The order of the quests in the Quest log, these will be appended to the end of the vanilla list
local newQuestOrderData = {
	-- key / mission-critical
	"ModsNikkelMHadesBiomes_QuestTenClears",
	"ModsNikkelMHadesBiomes_QuestFirstClear",
	-- major / priority
	"ModsNikkelMHadesBiomes_QuestMeetChthonicGods",
	"ModsNikkelMHadesBiomes_QuestWeaponClears",
	"ModsNikkelMHadesBiomes_QuestAspectClears",
	"ModsNikkelMHadesBiomes_QuestWeaponClearsFast",
	"ModsNikkelMHadesBiomes_QuestAspectClearsFast",
	"ModsNikkelMHadesBiomes_QuestWeaponClearsHighHeat",
	"ModsNikkelMHadesBiomes_QuestAspectClearsHighHeat",
	"ModsNikkelMHadesBiomes_QuestMetaUpgrades",
	"ModsNikkelMHadesBiomes_QuestPactUpgrades",
	"ModsNikkelMHadesBiomes_QuestChaosKeepsakeFullRun",
	"ModsNikkelMHadesBiomes_QuestHermesBeatCharon",
	"ModsNikkelMHadesBiomes_QuestPurgeLegendaryBoon",
	-- self-improvement & stockpiling
	"ModsNikkelMHadesBiomes_QuestCodexSmall",
	"ModsNikkelMHadesBiomes_QuestSongsSmall",
	"ModsNikkelMHadesBiomes_QuestCosmeticsSmall",
	"ModsNikkelMHadesBiomes_QuestCropsSmall",
	-- boons & character traits
	"ModsNikkelMHadesBiomes_QuestKeepsakesQuest",
	-- TODO: Disabled until we have more options through #155/#300
	-- "ModsNikkelMHadesBiomes_QuestSisyphusUpgrades",
	-- "ModsNikkelMHadesBiomes_QuestEurydiceUpgrades",
	-- "ModsNikkelMHadesBiomes_QuestPatroclusUpgrades",
	"ModsNikkelMHadesBiomes_QuestBouldyUpgrades",
	-- weapons & combat
	"ModsNikkelMHadesBiomes_QuestMiniBossKills",
	"ModsNikkelMHadesBiomes_QuestClearedExtremeMeasuresRun",
	"ModsNikkelMHadesBiomes_QuestShutdownThanatos",
	"ModsNikkelMHadesBiomes_QuestHitlessErebusEncounters",
	"ModsNikkelMHadesBiomes_QuestThanatosKeepsakeHighPercentage",
}
game.ConcatTableValuesIPairs(game.QuestOrderData, newQuestOrderData)

local newQuestData = {
	-- #region Base Hades Quests
	-- Clear once
	ModsNikkelMHadesBiomes_QuestFirstClear = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 1000,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "PersephoneFirstMeeting", },
			},
		},
		CashedOutVoiceLines = {
			PreLineWait = 0.4,
			Cooldowns = { { Name = "MorosProphecyFulfilledSpeech", Time = 3 }, },
			SkipAnim = true,
			RequiredSourceValueFalse = "InPartnerConversation",
			ObjectType = "NPC_Moros_01",
			{ Cue = "/VO/Moros_0281", Text = "You are emboldened by your knowledge of the past." },
		},
	},
	-- Meet Megaera, Alecto, Tisiphone, Thanatos, Hades, (Hypnos)
	ModsNikkelMHadesBiomes_QuestMeetChthonicGods = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 300,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
		},
		CompleteGameStateRequirements = {
			-- Megaera
			{
				PathTrue = { "GameState", "RoomsEntered", "A_Boss01" },
			},
			-- Alecto
			{
				PathTrue = { "GameState", "RoomsEntered", "A_Boss02" },
			},
			-- Tisiphone
			{
				PathTrue = { "GameState", "RoomsEntered", "A_Boss03" },
			},
			-- TODO: Hypnos, if #300 is implemented
			-- Thanatos
			{
				PathTrue = { "GameState", "TextLinesRecord", "ThanatosFirstAppearance" },
			},
			-- Hades
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Boss01" },
			},
		},
		IncompleteName = "UnknownCondition_Meet",
	},
	-- Clear with each weapon (any aspect)
	ModsNikkelMHadesBiomes_QuestWeaponClears = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "WeaponPointsRare",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestFirstClear" },
				IsAny = { "CashedOut" }
			},
			NamedRequirements = { "AllWeaponsUnlocked" },
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "ClearedWithWeapons", "Styx" },
				HasAll = {
					"WeaponStaffSwing",
					"WeaponDagger",
					"WeaponTorch",
					"WeaponAxe",
					"WeaponLob",
					"WeaponSuit",
				},
			},
		},
	},
	-- Equip new keepsakes (from SharedKeepsakePort)
	ModsNikkelMHadesBiomes_QuestKeepsakesQuest = {
		InheritFrom = { "DefaultQuestItem", "DefaultBondQuest" },
		RewardResourceName = "SuperGiftPoints",
		RewardResourceAmount = 2,
		UnlockGameStateRequirements = {
			-- Has met any of the new NPCs
			{
				Path = { "GameState", "UseRecord" },
				HasAny = { "NPC_Sisyphus_01", "NPC_Eurydice_01", "NPC_Patroclus_01", "NPC_Thanatos_01", "NPC_Thanatos_Field_01" }
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll = {
					mod.SharedKeepsakePortSisyphusKeepsakeTrait,
					mod.SharedKeepsakePortEurydiceKeepsakeTrait,
					mod.SharedKeepsakePortPatroclusKeepsakeTrait,
					mod.SharedKeepsakePortThanatosKeepsakeTrait,
				},
			},
		},
		IncompleteName = "Quest_UnknownCondition",
	},
	-- Defeated all minibosses
	ModsNikkelMHadesBiomes_QuestMiniBossKills = {
		InheritFrom = { "DefaultQuestItem", "DefaultKillQuest" },
		RewardResourceName = "CardUpgradePoints",
		RewardResourceAmount = 5,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Intro" },
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "EnemyKills", },
				HasAll = {
					"HadesBloodlessGrenadierElite",
					"HeavyRangedSplitterMiniboss",
					"WretchAssassinMiniboss",
					"ShieldRangedElite",
					"HitAndRunUnitElite",
					"CrusherUnitElite",
					"SpreadShotUnitMiniboss",
					"FlurrySpawnerElite",
					"ThiefImpulseMineLayerMiniboss",
					"HeavyRangedForkedMiniboss",
					"RatThugMiniboss",
					"SatyrRangedMiniboss",
					"HadesCrawlerMiniBoss",
				},
			},
		},
		IncompleteName = "Quest_UnknownCondition",
	},
	-- Unlocked modded Cosmetics
	ModsNikkelMHadesBiomes_QuestCosmeticsSmall = {
		InheritFrom = { "DefaultQuestItem", "DefaultBondQuest" },
		RewardResourceName = "CosmeticsPoints",
		RewardResourceAmount = 2000,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "QuestCosmeticsSmall" },
				IsAny = { "CashedOut" }
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "ModsNikkelMHadesBiomesUnlockCosmeticsIncantation" },
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "WorldUpgradesAdded" },
				CountOf = mod.ModdedCosmeticIds,
				Comparison = ">=",
				Value = 15,
			},
		},
	},
	-- Codex entries (there are 53 in total in the mod)
	ModsNikkelMHadesBiomes_QuestCodexSmall = {
		InheritFrom = { "DefaultQuestItem", "DefaultUnseenQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 500,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "HecateBossGrantsCodex01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCodexEntriesUnlockedCache", },
				CountOf = mod.CodexEntryNames,
				Comparison = ">=",
				Value = 1,
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCodexEntriesUnlockedCache", },
				CountOf = mod.CodexEntryNames,
				Comparison = ">=",
				Value = 15,
			},
		},
	},
	-- Clearing with each Arcana Card/MetaUpgrade
	ModsNikkelMHadesBiomes_QuestMetaUpgrades = {
		InheritFrom = { "DefaultQuestItem", "DefaultUnseenQuest" },
		RewardResourceName = "WeaponPointsRare",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
			{
				Path = { "GameState", "MetaUpgradeMaxLevelCountCache" },
				Comparison = ">=",
				Value = 3,
			},
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestFirstClear" },
				IsAny = { "CashedOut" }
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "ClearedWithMetaUpgrades", "Styx" },
				HasAll = {
					"ChanneledCast",
					"HealthRegen",
					"LowManaDamageBonus",
					"CastCount",
					"SorceryRegenUpgrade",
					"CastBuff",
					"BonusHealth",
					"BonusDodge",
					"ManaOverTime",
					"MagicCrit",
					"SprintShield",
					"LastStand",
					"MaxHealthPerRoom",
					"StatusVulnerability",
					"ChanneledBlock",
					"DoorReroll",
					"StartingGold",
					"MetaToRunUpgrade",
					"RarityBoost",
					"BonusRarity",
					"TradeOff",
					"ScreenReroll",
					"LowHealthBonus",
					"EpicRarityBoost",
					"CardDraw",
				},
			},
		},
	},
	-- Clearing with each Vow/Pact/ShrineUpgrade
	ModsNikkelMHadesBiomes_QuestPactUpgrades = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "WeaponPointsRare",
		RewardResourceAmount = 4,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestFirstClear" },
				IsAny = { "CashedOut" }
			},
			NamedRequirements = { "ShrineUnlocked" },
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomes_ClearedWithShrineUpgrades", "Styx" },
				HasAll = {
					"EnemyDamageShrineUpgrade",
					"EnemyHealthShrineUpgrade",
					"EnemyShieldShrineUpgrade",
					"EnemySpeedShrineUpgrade",
					"EnemyCountShrineUpgrade",
					"NextBiomeEnemyShrineUpgrade",
					"EnemyRespawnShrineUpgrade",
					"EnemyEliteShrineUpgrade",
					"HealingReductionShrineUpgrade",
					"ShopPricesShrineUpgrade",
					"MinibossCountShrineUpgrade",
					"BoonSkipShrineUpgrade",
					"BiomeSpeedShrineUpgrade",
					"LimitGraspShrineUpgrade",
					"BoonManaReserveShrineUpgrade",
					"BanUnpickedBoonsShrineUpgrade",
					"BossDifficultyShrineUpgrade",
				},
			},
		},
	},
	-- Full run cleared with Chaos Keepsake equipped
	ModsNikkelMHadesBiomes_QuestChaosKeepsakeFullRun = {
		InheritFrom = { "DefaultQuestItem", "DefaultChaosQuest" },
		RewardResourceName = "Mixer5Common",
		RewardResourceAmount = 2,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "TextLinesRecord" },
				-- TODO: ChaosSurfaceQuest01 text line does not exist yet - should be added as possible text line for Chaos in modded runs
				HasAll = { "ChaosSurfaceQuest01", "LordHadesDefeated02", }
			},
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomes_ClearedFullRunWithKeepsakes", "RandomBlessingKeepsake" },
			},
		},
		CustomIncompleteString = "ModsNikkelMHadesBiomes_QuestChaosKeepsakeFullRun_Condition",
		CustomCompleteString = "ModsNikkelMHadesBiomes_QuestChaosKeepsakeFullRun_Cleared",
		CashedOutVoiceLines = {
			{
				PreLineWait = 0.4,
				GameStateRequirements = { {}, },
				Cooldowns = {
					{ Name = "MorosProphecyFulfilledSpeech", Time = 3 },
				},
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",
				{ Cue = "/VO/Moros_0619", Text = "Whatever pact you formed with Chaos shall be sealed." },
			},
		},
	},
	-- Beat Charon twice in a row on behalf of Hermes
	ModsNikkelMHadesBiomes_QuestHermesBeatCharon = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "CharonPoints",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "TextLinesRecord" },
				-- TODO: HermesBeatCharonQuest01 text line does not exist yet - should be added as possible text line for Hermes in modded runs
				HasAll = { "HermesBeatCharonQuest01", }
			},
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "BossCharonHermesQuestComplete01" },
			},
		},
	},
	-- Clear on 32 fear with all weapons
	ModsNikkelMHadesBiomes_QuestWeaponClearsHighHeat = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "WeaponPointsRare",
		RewardResourceAmount = 6,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestWeaponClears" },
				IsAny = { "CashedOut" }
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				Value = 16,
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 5,
			},
			NamedRequirements = { "ShrineUnlocked" },
		},
		CompleteGameStateRequirements = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedShrinePointClear",
				FunctionArgs = { WeaponName = "WeaponStaffSwing", RequiredShrinePoints = 32, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedShrinePointClear",
				FunctionArgs = { WeaponName = "WeaponDagger", RequiredShrinePoints = 32, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedShrinePointClear",
				FunctionArgs = { WeaponName = "WeaponTorch", RequiredShrinePoints = 32, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedShrinePointClear",
				FunctionArgs = { WeaponName = "WeaponAxe", RequiredShrinePoints = 32, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedShrinePointClear",
				FunctionArgs = { WeaponName = "WeaponLob", RequiredShrinePoints = 32, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedShrinePointClear",
				FunctionArgs = { WeaponName = "WeaponSuit", RequiredShrinePoints = 32, },
			},
		},
		ModsNikkelMHadesBiomesCustomCompleteRequirementsDisplayStrings = {
			"WeaponStaffSwing",
			"WeaponDagger",
			"WeaponTorch",
			"WeaponAxe",
			"WeaponLob",
			"WeaponSuit",
		},
	},
	-- Clear in under 22 minutes with all weapons
	ModsNikkelMHadesBiomes_QuestWeaponClearsFast = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "WeaponPointsRare",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestWeaponClears" },
				IsAny = { "CashedOut" }
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesFastestModdedRunClearTimeCache" },
				Comparison = "<=",
				Value = 1500,
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 5,
			},
		},
		CompleteGameStateRequirements = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "WeaponStaffSwing", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "WeaponDagger", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "WeaponTorch", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "WeaponAxe", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "WeaponLob", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "WeaponSuit", RequiredClearTime = 1320, },
			},
		},
		ModsNikkelMHadesBiomesCustomCompleteRequirementsDisplayStrings = {
			"WeaponStaffSwing",
			"WeaponDagger",
			"WeaponTorch",
			"WeaponAxe",
			"WeaponLob",
			"WeaponSuit",
		},
	},
	-- #endregion
	-- #region Custom Quests
	-- Beat Thanatos with him getting 0 kills
	ModsNikkelMHadesBiomes_QuestShutdownThanatos = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 1500,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "ThanatosFirstAppearance" },
			},
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomesCustomFlags", "ModsNikkelMHadesBiomes_ShutdownThanatosFlag" },
			},
		},
	},
	-- Finish mod story/escape 10 times
	ModsNikkelMHadesBiomes_QuestTenClears = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "SuperGiftPoints",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestFirstClear" },
				IsAny = { "CashedOut" }
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
		},
		CashedOutVoiceLines = {
			{
				PreLineWait = 0.4,
				GameStateRequirements = { {}, },
				Cooldowns = { { Name = "MorosProphecyFulfilledSpeech", Time = 3 }, },
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",
				{ Cue = "/VO/Moros_0629", Text = "I think we both knew this would come to pass." },
			},
		},
	},
	-- Unlock Hades OST songs
	ModsNikkelMHadesBiomes_QuestSongsSmall = {
		InheritFrom = { "DefaultQuestItem", "DefaultBondQuest" },
		RewardResourceName = "CosmeticsPoints",
		RewardResourceAmount = 1000,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeMusicPlayerModsNikkelMUnlockHadesMusic" },
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "WorldUpgradesAdded" },
				CountOf = mod.HadesOstSongNames,
				Comparison = ">=",
				Value = 10,
			},
		},
	},
	-- Purge a legendary boon
	ModsNikkelMHadesBiomes_QuestPurgeLegendaryBoon = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "GiftPoints",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockPostBossSellShopsIncantation" },
			},
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomesCustomFlags", "ModsNikkelMHadesBiomes_SoldLegendaryBoonFlag" },
			},
		},
	},
	-- Achieve 30% bonus damage with Thanatos' keepsake
	ModsNikkelMHadesBiomes_QuestThanatosKeepsakeHighPercentage = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "SuperGiftPoints",
		RewardResourceAmount = 2,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "TraitsTaken", mod.SharedKeepsakePortThanatosKeepsakeTrait },
			},
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "ModsNikkelMHadesBiomesCustomFlags", "ModsNikkelMHadesBiomes_ThanatosKeepsakeAchievedHighPercentage" },
			},
		},
	},
	-- Clear a run on EM4
	ModsNikkelMHadesBiomes_QuestClearedExtremeMeasuresRun = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "CardUpgradePoints",
		RewardResourceAmount = 4,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestFirstClear" },
				IsAny = { "CashedOut" }
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				Value = 1,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeBossDifficultyT4" },
			},
			NamedRequirements = { "ShrineUnlocked" },
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "LordHadesExtremeMeasuresDefeat01" },
			},
		},
	},
	-- Successfully clear ShrineChallenge/Erebus encounters in a row
	ModsNikkelMHadesBiomes_QuestHitlessErebusEncounters = {
		InheritFrom = { "DefaultQuestItem", "DefaultKillQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 1200,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestFirstClear" },
				IsAny = { "CashedOut" }
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesHighestShrinePointClearModdedRunCache" },
				Comparison = ">=",
				Value = 5,
			},
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockShrinePointGatesIncantation" },
			},
			NamedRequirements = { "ShrineUnlocked" },
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomes_SuccessiveErebusEncounterClears" },
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	-- Gain all Sisyphus boons
	ModsNikkelMHadesBiomes_QuestSisyphusUpgrades = {
		InheritFrom = { "DefaultQuestItem", "DefaultBondQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 400,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "SisyphusGift02" },
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll = {
					"ModsNikkelMHadesBiomesSisyphusMoney",
					"ModsNikkelMHadesBiomesSisyphusHealing",
					"ModsNikkelMHadesBiomesSisyphusMetapoints",
				},
			},
		},
	},
	-- Gain all Eurydice boons
	ModsNikkelMHadesBiomes_QuestEurydiceUpgrades = {
		InheritFrom = { "DefaultQuestItem", "DefaultBondQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 400,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "EurydiceGift02" },
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll = {
					"ModsNikkelMHadesBiomesBuffSlottedBoonRarity",
					"ModsNikkelMHadesBiomesBuffMegaPom",
					"ModsNikkelMHadesBiomesBuffFutureBoonRarity",
				},
			},
		},
	},
	-- Gain all Patroclus boons
	ModsNikkelMHadesBiomes_QuestPatroclusUpgrades = {
		InheritFrom = { "DefaultQuestItem", "DefaultBondQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 400,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "PatroclusGift02" },
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "TraitsTaken" },
				HasAll = {
					"ModsNikkelMHadesBiomesTemporaryDoorHealTrait_Patroclus",
					"ModsNikkelMHadesBiomesTemporaryImprovedWeaponTrait_Patroclus",
					"ModsNikkelMHadesBiomesBuffExtraChance",
					"ModsNikkelMHadesBiomesGainMaxHealthMinMana",
					"ModsNikkelMHadesBiomesGainMinHealthMaxMana",
				},
			},
		},
	},
	-- Gift Bouldy enough times
	ModsNikkelMHadesBiomes_QuestBouldyUpgrades = {
		InheritFrom = { "DefaultQuestItem", "DefaultBondQuest" },
		RewardResourceName = "CardUpgradePoints",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "TextLinesRecord", "SisyphusAboutBouldy01" },
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "GiftRecord", "ModsNikkelMHadesBiomes_NPC_Bouldy_01", "GiftPoints" },
				Comparison = ">=",
				Value = 5,
			},
		},
		CustomIncompleteString = "QuestBouldyUpgrades_Condition",
		CustomCompleteString = "QuestBouldyUpgrades_Cleared",
	},
	-- Clear with each aspect
	ModsNikkelMHadesBiomes_QuestAspectClears = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "WeaponPointsRare",
		RewardResourceAmount = 5,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestWeaponClears" },
				IsAny = { "CashedOut" }
			},
			{
				Path = { "GameState", "QuestsCompleted" },
				HasAll = { "QuestUnlockAllWeaponAspects" },
			},
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "BaseStaffAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "StaffClearCastAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "StaffSelfHitAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "StaffRaiseDeadAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "DaggerBackstabAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "DaggerBlockAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "DaggerHomingThrowAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "DaggerTripleAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "TorchSpecialDurationAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "TorchDetonateAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "TorchSprintRecallAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "TorchAutofireAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "AxeRecoveryAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "AxeArmCastAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "AxePerfectCriticalAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "AxeRallyAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "LobAmmoBoostAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "LobCloseAttackAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "LobImpulseAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "LobGunAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "BaseSuitAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "SuitHexAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "SuitMarkCritAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
			{
				PathTrue = { "GameState", "LifetimeTraitStats", "SuitComboAspect", "ModsNikkelMHadesBiomesClearCount", },
			},
		},
		ModsNikkelMHadesBiomesCustomCompleteRequirementsDisplayStrings = {
			"BaseStaffAspect",
			"StaffClearCastAspect",
			"StaffSelfHitAspect",
			"StaffRaiseDeadAspect",
			"DaggerBackstabAspect",
			"DaggerBlockAspect",
			"DaggerHomingThrowAspect",
			"DaggerTripleAspect",
			"TorchSpecialDurationAspect",
			"TorchDetonateAspect",
			"TorchSprintRecallAspect",
			"TorchAutofireAspect",
			"AxeRecoveryAspect",
			"AxeArmCastAspect",
			"AxePerfectCriticalAspect",
			"AxeRallyAspect",
			"LobAmmoBoostAspect",
			"LobCloseAttackAspect",
			"LobImpulseAspect",
			"LobGunAspect",
			"BaseSuitAspect",
			"SuitHexAspect",
			"SuitMarkCritAspect",
			"SuitComboAspect",
		},
	},
	-- Clear on 32 fear with all aspects
	ModsNikkelMHadesBiomes_QuestAspectClearsHighHeat = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "Mixer5Common",
		RewardResourceAmount = 7,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestWeaponClearsHighHeat" },
				IsAny = { "CashedOut" }
			},
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
		},
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "LifetimeTraitStats", "BaseStaffAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "StaffClearCastAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "StaffSelfHitAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "StaffRaiseDeadAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "DaggerBackstabAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "DaggerBlockAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "DaggerHomingThrowAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "DaggerTripleAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "TorchSpecialDurationAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "TorchDetonateAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "TorchSprintRecallAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "TorchAutofireAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "AxeRecoveryAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "AxeArmCastAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "AxePerfectCriticalAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "AxeRallyAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "LobAmmoBoostAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "LobCloseAttackAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "LobImpulseAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "LobGunAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "BaseSuitAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "SuitHexAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "SuitMarkCritAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
			{
				Path = { "GameState", "LifetimeTraitStats", "SuitComboAspect", "ModsNikkelMHadesBiomesHighestShrinePoints", },
				Comparison = ">=",
				Value = 32,
			},
		},
		ModsNikkelMHadesBiomesCustomCompleteRequirementsDisplayStrings = {
			"BaseStaffAspect",
			"StaffClearCastAspect",
			"StaffSelfHitAspect",
			"StaffRaiseDeadAspect",
			"DaggerBackstabAspect",
			"DaggerBlockAspect",
			"DaggerHomingThrowAspect",
			"DaggerTripleAspect",
			"TorchSpecialDurationAspect",
			"TorchDetonateAspect",
			"TorchSprintRecallAspect",
			"TorchAutofireAspect",
			"AxeRecoveryAspect",
			"AxeArmCastAspect",
			"AxePerfectCriticalAspect",
			"AxeRallyAspect",
			"LobAmmoBoostAspect",
			"LobCloseAttackAspect",
			"LobImpulseAspect",
			"LobGunAspect",
			"BaseSuitAspect",
			"SuitHexAspect",
			"SuitMarkCritAspect",
			"SuitComboAspect",
		},
	},
	-- Clear in under 22 minutes with all aspects
	ModsNikkelMHadesBiomes_QuestAspectClearsFast = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		RewardResourceName = "Mixer5Common",
		RewardResourceAmount = 5,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_QuestWeaponClearsFast" },
				IsAny = { "CashedOut" }
			},
			{
				PathTrue = { "GameState", "TextLinesRecord", "Ending01" },
			},
		},
		CompleteGameStateRequirements = {
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "BaseStaffAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "StaffClearCastAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "StaffSelfHitAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "StaffRaiseDeadAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "DaggerBackstabAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "DaggerBlockAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "DaggerHomingThrowAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "DaggerTripleAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "TorchSpecialDurationAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "TorchDetonateAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "TorchSprintRecallAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "TorchAutofireAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "AxeRecoveryAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "AxeArmCastAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "AxePerfectCriticalAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "AxeRallyAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "LobAmmoBoostAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "LobCloseAttackAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "LobImpulseAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "LobGunAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "BaseSuitAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "SuitHexAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "SuitMarkCritAspect", RequiredClearTime = 1320, },
			},
			{
				FunctionName = _PLUGIN.guid .. "." .. "WeaponHasModdedClearTime",
				FunctionArgs = { WeaponName = "SuitComboAspect", RequiredClearTime = 1320, },
			},
		},
		ModsNikkelMHadesBiomesCustomCompleteRequirementsDisplayStrings = {
			"BaseStaffAspect",
			"StaffClearCastAspect",
			"StaffSelfHitAspect",
			"StaffRaiseDeadAspect",
			"DaggerBackstabAspect",
			"DaggerBlockAspect",
			"DaggerHomingThrowAspect",
			"DaggerTripleAspect",
			"TorchSpecialDurationAspect",
			"TorchDetonateAspect",
			"TorchSprintRecallAspect",
			"TorchAutofireAspect",
			"AxeRecoveryAspect",
			"AxeArmCastAspect",
			"AxePerfectCriticalAspect",
			"AxeRallyAspect",
			"LobAmmoBoostAspect",
			"LobCloseAttackAspect",
			"LobImpulseAspect",
			"LobGunAspect",
			"BaseSuitAspect",
			"SuitHexAspect",
			"SuitMarkCritAspect",
			"SuitComboAspect",
		},
	},
	-- Grow modded crops
	ModsNikkelMHadesBiomes_QuestCropsSmall = {
		InheritFrom = { "DefaultQuestItem", "DefaultNatureQuest" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 300,
		UnlockGameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeGarden" },
			},
			{
				Path = { "GameState", "LifetimeResourcesGained" },
				HasAny = mod.SeedResourceNames,
			},
		},
		CompleteGameStateRequirements = {
			{
				PathTrue = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_CropTartarus" },
			},
			{
				PathTrue = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_CropAsphodel" },
			},
			{
				PathTrue = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_CropElysium" },
			},
			{
				PathTrue = { "GameState", "LifetimeResourcesGained", "ModsNikkelMHadesBiomes_CropStyx" },
			},
		},
		ModsNikkelMHadesBiomesCustomCompleteRequirementsDisplayStrings = {
			"ModsNikkelMHadesBiomes_QuestCropsSmall_Tartarus",
			"ModsNikkelMHadesBiomes_QuestCropsSmall_Asphodel",
			"ModsNikkelMHadesBiomes_QuestCropsSmall_Elysium",
			"ModsNikkelMHadesBiomes_QuestCropsSmall_Styx",
		}
	},
	-- #endregion
}
mod.AddTableKeysSkipDupes(game.QuestData, newQuestData)
