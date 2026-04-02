-- #region Bounties/Testaments
local newBountyTargetIcons = {
	-- These must be the first encounter in the respective BountyData encounters list
	BossHarpy1 = "GUIModded\\Screens\\Shrine\\BossHarpy",
	BossHydra = "GUIModded\\Screens\\Shrine\\BossHydra",
	BossTheseusAndMinotaur = "GUIModded\\Screens\\Shrine\\BossTheseus",
	BossHades = "GUIModded\\Screens\\Shrine\\BossHades",
}
mod.AddTableKeysSkipDupes(game.ScreenData.Shrine.BountyTargetIcons, newBountyTargetIcons)

local newBountyEncounterDoorFlipMap = {
	BossHarpy1 = true,
	BossHydra = true,
	BossTheseusAndMinotaur = true,
	BossHades = true,
}
mod.AddTableKeysSkipDupes(game.ScreenData.Shrine.BountyEncounterDoorFlipMap, newBountyEncounterDoorFlipMap)

-- Insert the new bounties into the shrine at the correct positions
-- To make this more resilient against future changes, we insert them based on the previous bounty's index
-- The key is thew new bounty to insert, the value the bounty in front of which to insert it
-- Inverse order, as the first one inserted will be "last" in the list
local newBountyInsertOrder = {
	-- Heat 6, inserted after the last Heat 4 bounty
	{ key = "ModsNikkelMHadesBiomes_BountyShrineSuit_TartarusBoss",    insertAfter = "BountyShrineSuitGBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineLob_AsphodelBoss",     insertAfter = "BountyShrineSuitGBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineAxe_TartarusBoss",     insertAfter = "BountyShrineSuitGBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineTorches_ElysiumBoss",  insertAfter = "BountyShrineSuitGBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineDaggers_AsphodelBoss", insertAfter = "BountyShrineSuitGBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineStaff_TartarusBoss",   insertAfter = "BountyShrineSuitGBoss" },

	-- Heat 14, inserted after the last Heat 12 bounty
	{ key = "ModsNikkelMHadesBiomes_BountyShrineSuit_StyxBoss",        insertAfter = "BountyShrineSuitHBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineLob_TartarusBoss",     insertAfter = "BountyShrineSuitHBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineAxe_ElysiumBoss",      insertAfter = "BountyShrineSuitHBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineTorches_StyxBoss",     insertAfter = "BountyShrineSuitHBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineDaggers_TartarusBoss", insertAfter = "BountyShrineSuitHBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineStaff_AsphodelBoss",   insertAfter = "BountyShrineSuitHBoss" },

	-- Heat 18, inserted after the last Heat 16 bounty
	{ key = "ModsNikkelMHadesBiomes_BountyShrineSuit_ElysiumBoss",     insertAfter = "BountyShrineSuitQBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineLob_ElysiumBoss",      insertAfter = "BountyShrineSuitQBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineAxe_AsphodelBoss",     insertAfter = "BountyShrineSuitQBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineTorches_TartarusBoss", insertAfter = "BountyShrineSuitQBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineDaggers_StyxBoss",     insertAfter = "BountyShrineSuitQBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineStaff_ElysiumBoss",    insertAfter = "BountyShrineSuitQBoss" },

	-- Heat 22, inserted after the last Heat 20 bounty
	{ key = "ModsNikkelMHadesBiomes_BountyShrineSuit_AsphodelBoss",    insertAfter = "BountyShrineSuitIBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineLob_StyxBoss",         insertAfter = "BountyShrineSuitIBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineAxe_StyxBoss",         insertAfter = "BountyShrineSuitIBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineTorches_AsphodelBoss", insertAfter = "BountyShrineSuitIBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineDaggers_ElysiumBoss",  insertAfter = "BountyShrineSuitIBoss" },
	{ key = "ModsNikkelMHadesBiomes_BountyShrineStaff_StyxBoss",       insertAfter = "BountyShrineSuitIBoss" },
}

local function getRequirementValue(requirements, pathStr, key)
	if not requirements then return nil end
	for _, req in ipairs(requirements) do
		if req.Path and table.concat(req.Path, ".") == pathStr then
			return req[key]
		end
	end
	return nil
end

local allBountyKeys = {}
for _, bountyKey in ipairs(game.ScreenData.Shrine.BountyOrder) do
	table.insert(allBountyKeys, bountyKey)
end
for _, bountyEntry in ipairs(newBountyInsertOrder) do
	table.insert(allBountyKeys, bountyEntry.key)
end

-- Pre-process all bounties once to extract weapon and heat data
local bountyMetadata = {}
for _, bountyKey in ipairs(allBountyKeys) do
	local bountyData = game.BountyData[bountyKey]
	if bountyData then
		local weapon = getRequirementValue(bountyData.CompleteGameStateRequirements, "CurrentRun.Hero.Weapons", "HasAny")
		local heat = getRequirementValue(bountyData.CompleteGameStateRequirements, "GameState.SpentShrinePointsCache",
			"Value")

		bountyMetadata[bountyKey] = {
			Weapon = weapon and weapon[1],
			Heat = heat
		}
	end
end

for _, bountyEntry in ipairs(newBountyInsertOrder) do
	local newBountyKey = bountyEntry.key
	local insertAfterKey = bountyEntry.insertAfter
	local newMeta = bountyMetadata[newBountyKey]
	local insertIndex = nil

	local originalShrineBountyOrder = game.ShallowCopyTable(game.ScreenData.Shrine.BountyOrder) or {}
	for index, bountyName in ipairs(originalShrineBountyOrder) do
		if bountyName == insertAfterKey then
			insertIndex = index + 1
		end

		-- Update unlock requirements for same-weapon, higher-heat bounties
		local existingMeta = bountyMetadata[bountyName]
		if existingMeta and
				existingMeta.Weapon == newMeta.Weapon and
				newMeta.Heat < existingMeta.Heat then
			local bountyData = game.BountyData[bountyName]
			if bountyData and bountyData.UnlockGameStateRequirements then
				-- Find the requirement with the ShrineBountiesCompleted path
				for _, req in ipairs(bountyData.UnlockGameStateRequirements) do
					if req.Path and table.concat(req.Path, ".") == "GameState.ShrineBountiesCompleted" then
						if req.HasAll then
							table.insert(req.HasAll, newBountyKey)
						end
						break
					end
				end
			end
		end
	end

	-- Insert at calculated position
	if insertIndex then
		table.insert(game.ScreenData.Shrine.BountyOrder, insertIndex, newBountyKey)
	end
end
-- #endregion

-- #region Skelly Statues/Gifts
-- Fear requirements to unlock each of the three new statues
game.ScreenData.Shrine.ModsNikkelMHadesBiomesShrinePointThresholds = { 8, 16, 32 }

-- Show vanilla requirement rows in ShrineScreen when: TrophyQuestUnlocked AND (vanilla not done OR (modded started AND not all unveiled))
local skellyQuestActiveRequirements = {
	OrRequirements = {
		{
			{
				PathFalse = { "GameState", "TextLinesRecord", "TrophyQuestComplete03" },
			},
		},
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueIntro01" },
			},
			{
				PathFalse = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueUnveil03" },
			},
		},
	},
	NamedRequirements = { "TrophyQuestUnlocked" },
}

-- Show "all complete" when: vanilla done AND (modded not started OR modded all unveiled)
local skellyQuestAllCompleteRequirements = {
	{
		PathTrue = { "GameState", "TextLinesRecord", "TrophyQuestComplete03" },
	},
	OrRequirements = {
		{
			{
				PathFalse = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueIntro01" },
			},
		},
		{
			{
				PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueUnveil03" },
			},
		},
	},
}

-- Modded route: show when started AND (not all unveiled OR vanilla not done)
local skellyQuestModdedRouteRequirements = {
	{
		PathTrue = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueIntro01" },
	},
	OrRequirements = {
		{
			{
				PathFalse = { "GameState", "TextLinesRecord", "ModsNikkelMHadesBiomes_HadesStatueUnveil03" },
			},
		},
		{
			{
				PathFalse = { "GameState", "TextLinesRecord", "TrophyQuestComplete03" },
			},
		},
	},
}

-- Modify vanilla component requirements to keep showing when modded quests are active
game.ScreenData.Shrine.ComponentData.SkellyHeader.Requirements = skellyQuestActiveRequirements
game.ScreenData.Shrine.ComponentData.SkellyHeader_Complete.Requirements = skellyQuestAllCompleteRequirements
game.ScreenData.Shrine.ComponentData.SkellyQuestSurface.Requirements = skellyQuestActiveRequirements
game.ScreenData.Shrine.ComponentData.SkellyQuestSurfaceStrikethrough.Requirements = skellyQuestActiveRequirements
game.ScreenData.Shrine.ComponentData.SkellyQuestUnderworld.Requirements = skellyQuestActiveRequirements
game.ScreenData.Shrine.ComponentData.SkellyQuestUnderworldStrikethrough.Requirements = skellyQuestActiveRequirements
game.ScreenData.Shrine.ComponentData.SkellyQuestCompleteIcon.Requirements = skellyQuestAllCompleteRequirements

-- Reposition and rescale vanilla components to make room for the modded route row
game.ScreenData.Shrine.ComponentData.SkellyQuestSurface.X = 310
game.ScreenData.Shrine.ComponentData.SkellyQuestSurface.Scale = 0.7
game.ScreenData.Shrine.ComponentData.SkellyQuestSurface.TextArgs = game.MergeTables(
	game.UIData.ShrineBountyAvailableTextArgs, { FontSize = 18, OffsetX = -155, OffsetY = 0 })

game.ScreenData.Shrine.ComponentData.SkellyQuestUnderworld.X = 310
game.ScreenData.Shrine.ComponentData.SkellyQuestUnderworld.Y = 574
game.ScreenData.Shrine.ComponentData.SkellyQuestUnderworld.Scale = 0.7
game.ScreenData.Shrine.ComponentData.SkellyQuestUnderworld.TextArgs = game.MergeTables(
	game.UIData.ShrineBountyAvailableTextArgs, { FontSize = 18, OffsetX = -155, OffsetY = 0 })

game.ScreenData.Shrine.ComponentData.SkellyQuestUnderworldStrikethrough.Y = 574

-- Add modded route components
game.ScreenData.Shrine.ComponentData.SkellyQuestModsNikkelMHadesBiomesModdedRoute = {
	X = 310,
	Y = 610,
	Animation = "GUI\\Screens\\Shrine\\SkellyIncomplete",
	Scale = 0.7,
	TextArgs = game.MergeTables(
		game.UIData.ShrineBountyAvailableTextArgs, { FontSize = 18, OffsetX = -155, OffsetY = 0 }),
	Requirements = skellyQuestModdedRouteRequirements,
}
game.ScreenData.Shrine.ComponentData.SkellyQuestModsNikkelMHadesBiomesModdedRouteStrikethrough = {
	X = 380,
	Y = 610,
	Alpha = 0.0,
	AlphaTarget = 0.0,
	Animation = "GUI\\Screens\\Shrine\\Strikethrough",
	GroupName = "Combat_Menu_Overlay",
	Requirements = skellyQuestModdedRouteRequirements,
}

-- Insert into Order array before SkellyQuestCompleteIcon
local shrineOrder = game.ScreenData.Shrine.ComponentData.Order
for i, name in ipairs(shrineOrder) do
	if name == "SkellyQuestCompleteIcon" then
		table.insert(shrineOrder, i, "SkellyQuestModsNikkelMHadesBiomesModdedRouteStrikethrough")
		table.insert(shrineOrder, i, "SkellyQuestModsNikkelMHadesBiomesModdedRoute")
		break
	end
end
-- #endregion
