-- Ensures that conversations for these are loaded when entering the room
local hadesNPCNames = {
	"NPC_Sisyphus_01",
	"NPC_Eurydice_01",
	"NPC_Patroclus_01",
	"ModsNikkelMHadesBiomes_NPC_Bouldy_01",
	"ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
}
game.NarrativeData.ConversationOrder = game.CombineTables(game.NarrativeData.ConversationOrder, hadesNPCNames)

-- Gifting
local hadesNPCGiftLinePriorities = {
	NPC_Sisyphus_01 = {
		"SisyphusGift01",
		"SisyphusGift02",
		"SisyphusGift03",
		"SisyphusGift04",
		"SisyphusGift05",
		"SisyphusGift06",
		"SisyphusGift07_A",
		"SisyphusGift08_A",
		"SisyphusGift08_B",
		"SisyphusGift09_A",
	},
	-- ModsNikkelMHadesBiomes_NPC_Bouldy_01 = {},
	NPC_Eurydice_01 = {
		"EurydiceGift01",
		"EurydiceGift02",
		"EurydiceGift03",
		"EurydiceGift04",
		"EurydiceGift05",
		"EurydiceGift06",
		"EurydiceGift07",
		"EurydiceGift08",
	},
	NPC_Patroclus_01 = {
		"PatroclusGift01",
		"PatroclusGift02",
		"PatroclusGift03",
		"PatroclusGift04",
		"PatroclusGift05",
		"PatroclusGift06",
		"PatroclusGift07_A",
		"PatroclusGift08_A"
	},
}
-- Create dummy entries to allow the relationship bar to be built in the Codex
for _, npcName in ipairs(hadesNPCNames) do
	game.NarrativeData[npcName] = {
		GiftTextLinePriorities = hadesNPCGiftLinePriorities[npcName] or {},
	}
end

-- Events
local newGameData = {
	BouldyRepeatableTextLines = {
		"BouldyGiftRepeatable01",
		"BouldyGiftRepeatable02",
		"BouldyGiftRepeatable03",
		"BouldyGiftRepeatable04",
		"BouldyGiftRepeatable05",
		"BouldyGiftRepeatable06",
		"BouldyGiftRepeatable07",
		"BouldyGiftRepeatable08",
		"BouldyGiftRepeatable09",
		"BouldyGiftRepeatable10",
		"BouldyGiftRepeatable11",
		"BouldyGiftRepeatable12",
		"BouldyGiftRepeatable13",
		"BouldyGiftRepeatable14",
		"BouldyGiftRepeatable15",
		"BouldyGiftRepeatable16",
		"BouldyGiftRepeatable17",
		"BouldyGiftRepeatable18",
		"BouldyGiftRepeatable19",
	},
	GardenTextLines = {
		"PersephoneHomeMeeting03",
		"PersephoneHomeMeeting04",
		"PersephoneHomeMeeting06",
		"PersephoneChat13",
		"PersephoneChat17",
		"PersephoneWithHades01",
		"PersephoneWithHades03",
		"PersephoneWithHades04",
		"PersephoneChatWithHades01",
		"PersephoneChatWithHades07",
		"PersephoneChatWithHades08",
	},
	HadesGardenTextLines = {
		"PersephoneWithHades01",
		"PersephoneWithHades03",
		"PersephoneWithHades04",
		"PersephoneChatWithHades01",
		"PersephoneChatWithHades07",
		"PersephoneChatWithHades08",
	},
	OrpheusWithEurydiceTextLines = {
		"OrpheusWithEurydice01",
		"OrpheusWithEurydice02",
		"OrpheusWithEurydice03",
		"OrpheusWithEurydiceMiscChat01",
		"OrpheusWithEurydiceMiscChat02",
		"OrpheusWithEurydiceMiscChat03",
		"OrpheusWithEurydiceMiscChat04",
		"OrpheusWithEurydiceMiscChat05",
		"OrpheusWithEurydiceMiscChat06",
		"OrpheusWithEurydiceMiscChat07",
		"OrpheusWithEurydiceMiscChat08",
		"OrpheusWithEurydiceMiscChat09",
		"OrpheusWithEurydiceMiscChat10",
		"OrpheusWithEurydiceMiscChat11",
		"OrpheusWithEurydiceMiscChat12",
		"OrpheusWithEurydiceMiscChat13",
		"OrpheusWithEurydiceMiscChat14",
		"OrpheusWithEurydiceMiscChat15",
		"OrpheusWithEurydiceMiscChat16",
		"OrpheusWithEurydiceMiscChat17",
		"OrpheusWithEurydiceMiscChat18",
		"OrpheusWithEurydiceMiscChat19",
		"OrpheusWithEurydiceMiscChat20",
		"OrpheusWithEurydiceMiscChat21",
		"OrpheusWithEurydiceMiscChat22",
		"OrpheusWithEurydiceMiscChat23",
		"OrpheusWithEurydiceMiscChat24",
		"OrpheusWithEurydiceMiscChat25",
		"OrpheusWithEurydiceInTheBloodChat01",
		"OrpheusWithEurydiceInTheBloodChat02",
		"OrpheusWithEurydiceInTheBloodChat03",
		"OrpheusWithEurydiceInTheBloodChat04",
		"OrpheusWithEurydiceInTheBloodChat05",
		"OrpheusWithEurydiceInTheBloodChat06",
		"OrpheusWithEurydiceInTheBloodChat07",
	},
	AchillesWithPatroclusTextLines = {
		"PatroclusWithAchilles01",
		"PatroclusWithAchilles02",
		"PatroclusWithAchilles03",
		"PatroclusReunionChat02",
		"PatroclusReunionChat05",
		"PatroclusReunionChat06",
		"PatroclusReunionChat07",
		"PatroclusReunionChat11",
		"PatroclusReunionChat12",
	},
	EndingTextLines = {
		"PersephoneFirstMeeting",
		"PersephoneMeeting02",
		"PersephoneMeeting03",
		"PersephoneMeeting04",
		"PersephoneMeeting05_A",
		"PersephoneMeeting05_B",
		"PersephoneMeeting06",
		"PersephoneMeeting07",
		"PersephoneMeeting08",
		"PersephoneMeeting09",
		"PersephoneReturnsHome01",
		"OlympianReunionQuestComplete",
	},
}
for property, textLines in pairs(newGameData) do
	if game.GameData[property] == nil then
		game.GameData[property] = textLines
	else
		mod.DebugPrint("GameData property " .. property .. " already exists, not overwriting", 2)
	end
end
