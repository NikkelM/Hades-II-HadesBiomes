local lootDataFile = rom.path.combine(rom.paths.Content(), "Game\\Text\\de\\_LootData_Chaos.de.sjson")

local order = {
	"Id",
	"InheritFrom",
	"DisplayName",
}

local newData = {
	-- -- #region Intro conversations/New route explanation
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns01_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"Welcome, Spawn of Hades, to the place you call Tartarus. I conclude that you have entered the gateway I opened for you in the place between the realms, where the Unseen reside? Respond."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Melinoe_ChaosAboutNightmareRuns01_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"Almighty Chaos, indeed I have traveled through the portal you opened within the Crossroads. How is it possible I am here? This Tartarus, it feels familiar, but... different."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns01_0001",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"I have altered your perception of reality for this night, aided by your own ability to peer through the veil of dreams and time. Your brother's journey becomes your own. Take my mark, and find me again."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02A_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"The place in which you find yourself this night, it elicits discomfort in you, does it not? Respond."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Melinoe_ChaosAboutNightmareRuns02A_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"It does, Almighty Chaos. Before, you mentioned that you set me on my brother's path, yet I do not know what I am looking for in this altered version of Tartarus."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02A_0001",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"Your brother once sought to escape from your father's house. I have set you upon that same path within this {$Keywords.ModsNikkelMHadesBiomesModdedRoute}. In your own time, you will find to understand your brother's motivations more deeply."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Melinoe_ChaosAboutNightmareRuns02B_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"It does, Almighty Chaos. Another night, I encountered the Fury Megaera, and I recalled one of my brother's interactions with her. Were these memories, or imagination?"
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02B_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"Your brother once sought to escape from your father's house. I have set you upon that same path within this {$Keywords.ModsNikkelMHadesBiomesModdedRoute}. All that you recall has happened, in this reality or another."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02C_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"Since our last interaction, you have learned more about what links you to your brother in this realm, have you not? Respond."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Melinoe_ChaosAboutNightmareRuns02C_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"Another night, I encountered the Fury Megaera, and I recalled one of my brother's interactions with her. Were these memories, or imagination?"
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutNightmareRuns02C_0001",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"All that you recall has happened, in this reality or another. Continue seeking understanding of your brother's path, as I will observe your progress."
	-- },
	-- -- #endregion
	-- -- #region Misc dialogues
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutZagreusEscapeAttempts01_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"I have inferred from our previous interactions that you have taken an interest in your brother's history. I concluded that it would be quite amusing to let you walk the path he took when once he attempted to learn more about your shared past. This conclusion has proven correct."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutZagreusEscapeAttempts02_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"I recall the many times that your brother entered my realm during his quest; much in the same way that many of his attempts likened to each other, so do yours compare to his. Yet, none shall ever be the same, for each is unique in its own way. I often ponder the implications of this."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutOlympianAid01_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"You will since have noticed that while you seem to be reliving your brother's memories, not all aspects of this {$Keywords.ModsNikkelMHadesBiomesModdedRoute} align with his experiences. Part of you is still bound to your own reality, and so is your connection to Olympus."
	-- },
	-- -- #endregion
	-- -- #region Randomized Chaos Trials/Questline
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutModdedRandomBounties01_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"Spawn of Hades, once again you have entered the realm of near-infinite possibilities, thus revealing a new facet of reality. Breaking you free from the usual confines of your Nightmares shall yield the most interesting results. Please proceed."
	-- },
	-- {
	-- 	Id = "ModsNikkelMHadesBiomes_Chaos_ChaosAboutModdedRandomBounties02_0000",
	-- 	InheritFrom = "BaseNarrative",
	-- 	DisplayName =
	-- 	"Your own abilities allow you to alter the events you perceive as memories of your brother's past. Peering into these altered realities through the Pitch-Black Stone further grants me the ability to explore possibilities even further removed from what has been."
	-- },
	-- -- #endregion
}

sjson.hook(lootDataFile, function(data)
	mod.AddTableKeysSkipDupes(data.Texts, newData, "Id", order)
end)
