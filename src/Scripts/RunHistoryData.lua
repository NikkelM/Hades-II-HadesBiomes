-- Enums for the RunResultData table
game.RunResultData.ModsNikkelMHadesBiomesUnderworldSuccess = 142
game.RunResultData.ModsNikkelMHadesBiomesUnderworldFail = 143

-- New animations for the Run History Screen
table.insert(game.ScreenData.RunHistory.InAnimations, "ModsNikkelMHadesBiomes_RunHistoryIn")
table.insert(game.ScreenData.RunHistory.InAnimations, "ModsNikkelMHadesBiomes_RunHistoryInFail")

table.insert(game.ScreenData.RunHistory.OutAnimations, "ModsNikkelMHadesBiomes_RunHistoryOut")
table.insert(game.ScreenData.RunHistory.OutAnimations, "ModsNikkelMHadesBiomes_RunHistoryOutFail")

table.insert(game.ScreenData.RunHistory.TransitionFromBlankAnimations,
	"ModsNikkelMHadesBiomes_RunHistoryTransitionBlankToModded")
table.insert(game.ScreenData.RunHistory.TransitionFromBlankAnimations,
	"ModsNikkelMHadesBiomes_RunHistoryTransitionBlankToModdedFail")

table.insert(game.ScreenData.RunHistory.TransitionToBlankAnimations,
	"ModsNikkelMHadesBiomes_RunHistoryTransitionModdedToBlank")
table.insert(game.ScreenData.RunHistory.TransitionToBlankAnimations,
	"ModsNikkelMHadesBiomes_RunHistoryTransitionModdedFailToBlank")

-- For companions/assists
game.ScreenData.RunHistory.MaxVisibleRunDataEntries = 7
game.ScreenData.RunHistory.ModsNikkelMHadesBiomesAssistIconScale = 0.32
game.ScreenData.RunHistory.ModsNikkelMHadesBiomesAssistIconOffsetY = 0
