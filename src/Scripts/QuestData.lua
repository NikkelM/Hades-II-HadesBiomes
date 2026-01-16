-- To hide the icon in the list view, and show it smaller in the detail view
game.ScreenData.QuestLog.ReadyToCashOutFormat.TextSymbolScale = 0
game.ScreenData.QuestLog.IncompleteFormat.TextSymbolScale = 0
game.ScreenData.QuestLog.CashedOutFormat.TextSymbolScale = 0
game.ScreenData.QuestLog.ComponentData.InfoBoxTitle.TextArgs.TextSymbolScale = 0.5

-- The order of the quests in the Quest log, these will be appended to the end of the vanilla list
local newQuestOrderData = {
	-- key / mission-critical
	"ModsNikkelMHadesBiomes_FirstClear",
	-- major / priority
	"ModsNikkelMHadesBiomes_WeaponClears",
	"ModsNikkelMHadesBiomes_MeetChthonicGods",
	-- self-improvement & stockpiling
	"ModsNikkelMHadesBiomes_CodexSmall",
	"ModsNikkelMHadesBiomes_CosmeticsSmall",
	-- boons & character traits
	"ModsNikkelMHadesBiomes_KeepsakesQuest",
	-- weapons & combat
	"ModsNikkelMHadesBiomes_MiniBossKills",
}
game.ConcatTableValuesIPairs(game.QuestOrderData, newQuestOrderData)

local newQuestData = {
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
	ModsNikkelMHadesBiomes_FirstClear = {
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
	ModsNikkelMHadesBiomes_MeetChthonicGods = {
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
	ModsNikkelMHadesBiomes_WeaponClears = {
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
		RewardResourceName = "WeaponPointsRare",
		RewardResourceAmount = 3,
		UnlockGameStateRequirements = {
			{
				Path = { "GameState", "WeaponsUnlocked" },
				HasAll = {
					"WeaponStaffSwing",
					"WeaponDagger",
					"WeaponTorch",
					"WeaponAxe",
					"WeaponLob",
					"WeaponSuit",
				},
			},
			{
				Path = { "GameState", "QuestStatus", "ModsNikkelMHadesBiomes_FirstClear" },
				IsAny = { "CashedOut" }
			},
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
	ModsNikkelMHadesBiomes_KeepsakesQuest = {
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
	ModsNikkelMHadesBiomes_MiniBossKills = {
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
	ModsNikkelMHadesBiomes_CosmeticsSmall = {
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
	ModsNikkelMHadesBiomes_CodexSmall = {
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
}
mod.AddTableKeysSkipDupes(game.QuestData, newQuestData)
