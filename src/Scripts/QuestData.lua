-- The order of the quests in the Quest log, these will be appended to the end of the vanilla list
local newQuestOrderData = {
	"ModsNikkelMHadesBiomes_FirstClear",
	"ModsNikkelMHadesBiomes_MeetChthonicGods",
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
				SuccessiveChanceToPlay = 0.3,
				PreLineWait = 0.4,
				Cooldowns = { { Name = "MelinoeProphecyFulfilledSpeech", Time = 3 }, },
				{ Cue = "/VO/Melinoe_4725", Text = "Well, thank the Fates..." },
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
	ModsNikkelMHadesBiomes_FirstClear = {
		InheritFrom = { "ModsNikkelMHadesBiomes_DefaultQuestItem" },
		RewardResourceName = "MetaCurrency",
		RewardResourceAmount = 1000,
		CompleteGameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 1,
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
			-- Hades
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Boss01" },
			},
			-- Thanatos
			{
				PathTrue = { "GameState", "TextLinesRecord", "ThanatosFirstAppearance" },
			},
		},
	},
}
mod.AddTableKeysSkipDupes(game.QuestData, newQuestData)
