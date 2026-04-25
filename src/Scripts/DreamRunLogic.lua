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
-- Starting region lines
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5553", {
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
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5509", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 4,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "I", "Q", "Styx" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5510", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 4,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "I", "Q", "Styx" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5512", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 4,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "I", "Q", "Styx" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5513", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 4,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "I", "Q", "Styx" },
	},
})
-- Final region in starting biomes
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5515", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 4,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "N", "Tartarus" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5516", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 4,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "N", "Tartarus" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5517", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 4,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "N", "Tartarus" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5518", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 4,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "N", "Tartarus" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5519", {
	{
		Path = { "CurrentRun", "EnteredBiomes" },
		Comparison = "==",
		Value = 4,
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "N", "Tartarus" },
	},
})
-- Mixed-up order
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5523", {
	{
		Path = { "CurrentRun", "PrevDreamBiome" },
		IsAny = { "F", },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "I", "O", "P", "Q", "Tartarus", "Asphodel", "Elysium", "Styx" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5524", {
	{
		Path = { "CurrentRun", "PrevDreamBiome" },
		IsAny = { "G", },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "I", "O", "P", "Q", "Tartarus", "Asphodel", "Elysium", "Styx" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5527", {
	{
		Path = { "CurrentRun", "PrevDreamBiome" },
		IsAny = { "H", },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "O", "P", "Q", "Tartarus", "Asphodel", "Elysium", "Styx" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5528", {
	{
		Path = { "CurrentRun", "PrevDreamBiome" },
		IsAny = { "N", },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "G", "H", "I", "Q", "Tartarus", "Asphodel", "Elysium", "Styx" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5529", {
	{
		Path = { "CurrentRun", "PrevDreamBiome" },
		IsAny = { "O", },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "G", "H", "I", "Tartarus", "Asphodel", "Elysium", "Styx" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5530", {
	{
		Path = { "CurrentRun", "PrevDreamBiome" },
		IsAny = { "P", "Q" },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "G", "H", "I", "N", "Tartarus", "Asphodel", },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5531", {
	{
		Path = { "CurrentRun", "PrevDreamBiome" },
		IsAny = { "Q", },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "G", "H", "I", "N", "O", "Tartarus", "Asphodel", "Elysium", "Styx" },
	},
})
mod.ModifyVoiceLineRequirements(game.HeroVoiceLines.DreamBiomeStartVoiceLines, "/VO/MelinoeField_5533", {
	{
		Path = { "CurrentRun", "PrevDreamBiome" },
		IsAny = { "N", "O", "P", "Q", },
	},
	{
		Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
		IsAny = { "F", "G", "H", "I", "Tartarus", "Asphodel", "Elysium", "Styx" },
	},
})
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
