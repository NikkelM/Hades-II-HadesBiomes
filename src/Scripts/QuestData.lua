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
		CashedOutVoiceLines = {
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				SuccessiveChanceToPlay = 0.2,
				PreLineWait = 0.4,
				Cooldowns = { { Name = "MelinoeProphecyFulfilledSpeech", Time = 3 }, },
				{ Cue = "/VO/Melinoe_1901", Text = "Well this worked out, I guess." },
				{ Cue = "/VO/Melinoe_1730", Text = "The Fates expected I would get this far..." },
			},
			{
				RandomRemaining = true,
				BreakIfPlayed = true,
				PreLineWait = 0.4,
				Cooldowns = { { Name = "MorosProphecyFulfilledSpeech", Time = 3 }, },
				SkipAnim = true,
				RequiredSourceValueFalse = "InPartnerConversation",
				ObjectType = "NPC_Moros_01",
				{ Cue = "/VO/Moros_0240", Text = "Ever shall you walk in the light of the Moon." },
				{ Cue = "/VO/Moros_0216", Text = "A necessary step along your path." },
				{ Cue = "/VO/Moros_0629", Text = "I think we both knew this would come to pass." },
				{ Cue = "/VO/Moros_0281", Text = "You are emboldened by your knowledge of the past." },
				{ Cue = "/VO/Moros_0280", Text = "Your innate strength is greater than you know." },
				{ Cue = "/VO/Moros_0282", Text = "The Underworld is your home, and you, its protector." },
				{ Cue = "/VO/Moros_0239", Text = "You have inherited your father's strength." },
				{ Cue = "/VO/Moros_0242", Text = "The depth of your understanding has no end." },
				{ Cue = "/VO/Moros_0628", Text = "Even the Fates themselves perhaps did not expect this." },
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
				PathTrue = { "GameState", "TextLinesRecord", "ThanadstosFirstAppearance" },
			},
			-- Hades
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Bodsss01" },
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
}
mod.AddTableKeysSkipDupes(game.QuestData, newQuestData)
