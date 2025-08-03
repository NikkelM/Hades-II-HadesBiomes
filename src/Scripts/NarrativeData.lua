-- Ensures that conversations for these are loaded when entering the room
local hadesNPCNames = {
	"NPC_Sisyphus_01",
	"NPC_Eurydice_01",
	"NPC_Patroclus_01",
}

game.NarrativeData.ConversationOrder = game.CombineTables(game.NarrativeData.ConversationOrder, hadesNPCNames)
