-- Ensures that conversations for these are loaded when entering the room
local hadesNPCNames = {
	"NPC_Sisyphus_01",
	"NPC_Eurydice_01",
	"NPC_Patroclus_01",
	"ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
}

game.NarrativeData.ConversationOrder = game.CombineTables(game.NarrativeData.ConversationOrder, hadesNPCNames)

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
