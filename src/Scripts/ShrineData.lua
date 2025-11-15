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
