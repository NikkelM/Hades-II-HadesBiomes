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
	"ModsNikkelMHadesBiomes_QuestWeaponClearsFast",
	"ModsNikkelMHadesBiomes_QuestWeaponClearsHighHeat",
	"ModsNikkelMHadesBiomes_QuestMetaUpgrades",
	"ModsNikkelMHadesBiomes_QuestPactUpgrades",
	"ModsNikkelMHadesBiomes_QuestChaosKeepsakeFullRun",
	"ModsNikkelMHadesBiomes_QuestHermesBeatCharon",
	-- self-improvement & stockpiling
	"ModsNikkelMHadesBiomes_QuestCodexSmall",
	"ModsNikkelMHadesBiomes_QuestCosmeticsSmall",
	-- boons & character traits
	"ModsNikkelMHadesBiomes_QuestKeepsakesQuest",
	-- weapons & combat
	"ModsNikkelMHadesBiomes_QuestMiniBossKills",
	"ModsNikkelMHadesBiomes_QuestShutdownThanatos",
}
game.ConcatTableValuesIPairs(game.QuestOrderData, newQuestOrderData)

local newQuestData = {
	-- #region Base Hades Quests
	ModsNikkelMHadesBiomes_DefaultQuestItem = {
		InheritFrom = { "DefaultQuestItem", "DefaultFatesQuest" },
		DebugOnly = true,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
		},
	},
	-- Clear once
	ModsNikkelMHadesBiomes_QuestFirstClear = {
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 1000,
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 300,
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
					"zannc-SharedKeepsakePort-SisyphusVanillaKeepsake",
					"zannc-SharedKeepsakePort-ShieldBossKeepsake",
					"zannc-SharedKeepsakePort-ShieldAfterHitKeepsake",
					"zannc-SharedKeepsakePort-PerfectClearDamageBonusKeepsake",
				},
			},
		},
		IncompleteName = "Quest_UnknownCondition",
	},
	-- Defeated all minibosses
	ModsNikkelMHadesBiomes_QuestMiniBossKills = {
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
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
	-- #endregion
}
mod.AddTableKeysSkipDupes(game.QuestData, newQuestData)
