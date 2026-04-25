modutil.mod.Path.Wrap("SelectNextDreamBiome", function(base, source, args)
	if config.z_ExcludeFromDreamDives then
		return base(source, args)
	end

	args = args or {}
	local nextRoomSet = nil
	if game.IsEmpty(game.CurrentRun.DreamBiomePool) then
		-- Fully override the initial pool creation to control starting eligibility of the new biomes
		game.CurrentRun.DreamBiomePool = { "G", "H", "I", "O", "P", "Q" }
		-- Modded biomes are only eligible once you've beaten at least one run
		if game.GameState.ModsNikkelMHadesBiomesClearedRunsCache >= 1 then
			table.insert(game.CurrentRun.DreamBiomePool, "Asphodel")
			table.insert(game.CurrentRun.DreamBiomePool, "Elysium")
			if game.GameState.TextLinesRecord["Ending01"] then
				table.insert(game.CurrentRun.DreamBiomePool, "Styx")
			end
		end

		-- special handling for the first biome on the first dream run
		if args.ForceHBiomeRequirements ~= nil and game.IsGameStateEligible(source, args.ForceHBiomeRequirements) then
			nextRoomSet = game.RemoveValue(game.CurrentRun.DreamBiomePool, "H")
		else
			nextRoomSet = game.RemoveRandomValue(game.CurrentRun.DreamBiomePool)
		end

		-- reroll if we got the previous Dream Run's first biome
		if nextRoomSet == game.GameState.LastDreamStartingBiome then
			nextRoomSet = game.RemoveRandomValue(game.CurrentRun.DreamBiomePool)
			table.insert(game.CurrentRun.DreamBiomePool, game.GameState.LastDreamStartingBiome)
		end
		game.GameState.LastDreamStartingBiome = nextRoomSet

		-- can't start in F, N or Tartarus, but they're eligible afterwards!
		table.insert(game.CurrentRun.DreamBiomePool, "F")
		table.insert(game.CurrentRun.DreamBiomePool, "N")
		if game.GameState.ModsNikkelMHadesBiomesClearedRunsCache >= 1 then
			table.insert(game.CurrentRun.DreamBiomePool, "Tartarus")
		end
	else
		nextRoomSet = game.RemoveRandomValue(game.CurrentRun.DreamBiomePool)

		-- reroll if we got the naturally connected biome as the next biome
		local currentRoomSet = game.CurrentRun.BiomeVisitOrder[game.CurrentRun.EnteredBiomes]
		if nextRoomSet == game.NextRoomSets[currentRoomSet] then
			local ineligibleRoomSet = nextRoomSet
			nextRoomSet = game.RemoveRandomValue(game.CurrentRun.DreamBiomePool)
			table.insert(game.CurrentRun.DreamBiomePool, ineligibleRoomSet)
		end
	end

	game.CurrentRun.CurrentRoom.NextRoomSet = { nextRoomSet }
end)

-- #region Dream Run voiceline modifications
-- NamedRequirements changes for correct guesses, known and reverse paths are in RequirementsData.lua

-- #region DreamBiomeStartVoiceLines
local dreamBiomeStartVoiceLines = game.HeroVoiceLines.DreamBiomeStartVoiceLines

-- Starting region lines
mod.ModifyVoiceLineRequirements(dreamBiomeStartVoiceLines, "/VO/MelinoeField_5553", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 1,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "Q", "Styx" },
	},
})

-- Final region aligned with normal runs
for _, cue in ipairs({ "/VO/MelinoeField_5509", "/VO/MelinoeField_5510", "/VO/MelinoeField_5512", "/VO/MelinoeField_5513" }) do
	mod.ModifyVoiceLineRequirements(dreamBiomeStartVoiceLines, cue, {
		{
			Path = { "CurrentRun", "EnteredBiomes" },
			Comparison = "==",
			Value = 4
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = { "I", "Q", "Styx" }
		},
	})
end

-- Final region in starting biomes
for _, cue in ipairs({ "/VO/MelinoeField_5515", "/VO/MelinoeField_5516", "/VO/MelinoeField_5517", "/VO/MelinoeField_5518", "/VO/MelinoeField_5519" }) do
	mod.ModifyVoiceLineRequirements(dreamBiomeStartVoiceLines, cue, {
		{
			Path = { "CurrentRun", "EnteredBiomes" },
			Comparison = "==",
			Value = 4
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = { "F", "N", "Tartarus" }
		},
	})
end

-- Mixed-up order: each line triggers when coming from a specific biome into one that doesn't naturally follow
-- Voiceline to modify, previous biome requirement, next biome requirement
local mixedUpOrderVoiceLines = {
	{ "/VO/MelinoeField_5523", { "F" },                { "I", "O", "P", "Q", "Tartarus", "Asphodel", "Elysium", "Styx" } },
	{ "/VO/MelinoeField_5524", { "G" },                { "I", "O", "P", "Q", "Tartarus", "Asphodel", "Elysium", "Styx" } },
	{ "/VO/MelinoeField_5527", { "H" },                { "F", "O", "P", "Q", "Tartarus", "Asphodel", "Elysium", "Styx" } },
	{ "/VO/MelinoeField_5528", { "N" },                { "G", "H", "I", "Q", "Tartarus", "Asphodel", "Elysium", "Styx" } },
	{ "/VO/MelinoeField_5529", { "O" },                { "F", "G", "H", "I", "Tartarus", "Asphodel", "Elysium", "Styx" } },
	{ "/VO/MelinoeField_5530", { "P", "Q" },           { "F", "G", "H", "I", "N", "Tartarus", "Asphodel" } },
	{ "/VO/MelinoeField_5531", { "Q" },                { "F", "G", "H", "I", "N", "O", "Tartarus", "Asphodel", "Elysium", "Styx" } },
	{ "/VO/MelinoeField_5533", { "N", "O", "P", "Q" }, { "F", "G", "H", "I", "Tartarus", "Asphodel", "Elysium", "Styx" } },
}
for _, entry in ipairs(mixedUpOrderVoiceLines) do
	mod.ModifyVoiceLineRequirements(dreamBiomeStartVoiceLines, entry[1], {
		{
			Path = { "CurrentRun", "PrevDreamBiome" },
			IsAny = entry[2]
		},
		{
			Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
			IsAny = entry[3]
		},
	})
end
-- #endregion

-- #region DreamRoomExitVoiceLines
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamRoomExitVoiceLines, "/VO/MelinoeField_5456", {
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "I", "Tartarus" },
	},
})
-- #endregion

-- #region DreamPostBossExitVoiceLines
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamPostBossExitVoiceLines, "/VO/MelinoeField_5484", {
	{
		Path = { "CurrentRun", "BiomesReached" },
		HasNone = { "I", "Tartarus" },
	},
})
-- #endregion

-- #endregion
