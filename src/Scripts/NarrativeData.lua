-- Ensures that conversations for these are loaded when entering the room
local hadesNPCNames = {
	"NPC_Sisyphus_01",
	-- TODO: Add others
}

game.NarrativeData.ConversationOrder = game.CombineTables(game.NarrativeData.ConversationOrder, hadesNPCNames)
