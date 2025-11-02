local newBountyTargetIcons = {
	-- These must be the first encounter in the respective BountyData encounters list
	BossHarpy1 = "GUIModded\\Screens\\Shrine\\BossHarpy",
	BossHydra = "GUIModded\\Screens\\Shrine\\BossHydra",
	BossTheseusAndMinotaur = "GUIModded\\Screens\\Shrine\\BossTheseus",
	BossHades = "GUIModded\\Screens\\Shrine\\BossHades",
}
mod.AddTableKeysSkipDupes(game.ScreenData.Shrine.BountyTargetIcons, newBountyTargetIcons)

-- Insert the new bounties into the shrine at the correct positions
-- To make this more resilient against future changes, we insert them based on the previous bounty's index
-- The key is thew new bounty to insert, the value the bounty in front of which to insert it
local newBountyInsertOrder = {
	-- Heat 6, inserted after the last Heat 4 bounty
	ModsNikkelMHadesBiomes_BountyShrineStaff_TartarusBoss = "BountyShrineSuitGBoss",
	ModsNikkelMHadesBiomes_BountyShrineDaggers_AsphodelBoss = "BountyShrineSuitGBoss",
	ModsNikkelMHadesBiomes_BountyShrineTorches_ElysiumBoss = "BountyShrineSuitGBoss",
	ModsNikkelMHadesBiomes_BountyShrineAxe_TartarusBoss = "BountyShrineSuitGBoss",
	ModsNikkelMHadesBiomes_BountyShrineLob_AsphodelBoss = "BountyShrineSuitGBoss",
	ModsNikkelMHadesBiomes_BountyShrineSuit_TartarusBoss = "BountyShrineSuitGBoss",

	-- Heat 14, inserted after the last Heat 12 bounty
	ModsNikkelMHadesBiomes_BountyShrineStaff_AsphodelBoss = "BountyShrineSuitHBoss",
	ModsNikkelMHadesBiomes_BountyShrineDaggers_TartarusBoss = "BountyShrineSuitHBoss",
	ModsNikkelMHadesBiomes_BountyShrineTorches_StyxBoss = "BountyShrineSuitHBoss",
	ModsNikkelMHadesBiomes_BountyShrineAxe_ElysiumBoss = "BountyShrineSuitHBoss",
	ModsNikkelMHadesBiomes_BountyShrineLob_TartarusBoss = "BountyShrineSuitHBoss",
	ModsNikkelMHadesBiomes_BountyShrineSuit_StyxBoss = "BountyShrineSuitHBoss",

	-- Heat 18, inserted after the last Heat 16 bounty
	ModsNikkelMHadesBiomes_BountyShrineStaff_ElysiumBoss = "BountyShrineSuitQBoss",
	ModsNikkelMHadesBiomes_BountyShrineDaggers_StyxBoss = "BountyShrineSuitQBoss",
	ModsNikkelMHadesBiomes_BountyShrineTorches_TartarusBoss = "BountyShrineSuitQBoss",
	ModsNikkelMHadesBiomes_BountyShrineAxe_AsphodelBoss = "BountyShrineSuitQBoss",
	ModsNikkelMHadesBiomes_BountyShrineLob_ElysiumBoss = "BountyShrineSuitQBoss",
	ModsNikkelMHadesBiomes_BountyShrineSuit_ElysiumBoss = "BountyShrineSuitQBoss",

	-- Heat 22, inserted after the last Heat 20 bounty
	ModsNikkelMHadesBiomes_BountyShrineStaff_StyxBoss = "BountyShrineSuitIBoss",
	ModsNikkelMHadesBiomes_BountyShrineDaggers_ElysiumBoss = "BountyShrineSuitIBoss",
	ModsNikkelMHadesBiomes_BountyShrineTorches_AsphodelBoss = "BountyShrineSuitIBoss",
	ModsNikkelMHadesBiomes_BountyShrineAxe_StyxBoss = "BountyShrineSuitIBoss",
	ModsNikkelMHadesBiomes_BountyShrineLob_StyxBoss = "BountyShrineSuitIBoss",
	ModsNikkelMHadesBiomes_BountyShrineSuit_AsphodelBoss = "BountyShrineSuitIBoss",
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
for newBountyKey, _ in pairs(newBountyInsertOrder) do
	table.insert(allBountyKeys, newBountyKey)
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

for newBountyKey, insertAfterKey in pairs(newBountyInsertOrder) do
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
				newMeta.Heat and existingMeta.Heat and
				newMeta.Heat < existingMeta.Heat then
			local unlockReqs = game.BountyData[bountyName].UnlockGameStateRequirements
			local shrineReq = getRequirementValue(unlockReqs, "GameState.ShrineBountiesCompleted", "HasAll")
			if shrineReq then
				table.insert(shrineReq, newBountyKey)
				print("Updated unlock requirements for bounty " .. bountyName .. " to include " .. newBountyKey)
			end
		end
	end

	-- Insert at calculated position
	if insertIndex then
		table.insert(game.ScreenData.Shrine.BountyOrder, insertIndex, newBountyKey)
	end
end
