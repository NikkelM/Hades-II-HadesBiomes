-- Adds NPCs from Hades to Hades II

local hadesNPCFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Units\\NPCs.sjson")
local hadesNPCTable = sjson.decode_file(hadesNPCFile)

local hadesTwoNPCFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\NPCs.sjson")

-- Modifications/overrides to the Hades NPCs
-- Use the original names from the Hades file here, as modifications are applied before renaming
local hadesNPCModifications = {}

local NPCKeyReplacements = {}

mod.ApplyNestedSjsonModifications(hadesNPCTable.Units, hadesNPCModifications)

-- Remove duplicates we don't want at all, as there is one defined in Hades II already
mod.RemoveSjsonEntries(hadesNPCTable.Units, mod.NPCNameRemovals, "Name", "NPCs.sjson")
-- Rename duplicate enemy names using mod.EnemyNameMappings
mod.RenameSjsonEntries(hadesNPCTable.Units, mod.NPCNameMappings, "Name", "NPCs.sjson")

for oldName, newName in pairs(mod.NPCNameMappings) do
	-- Don't rename if we didn't actually rename this NPC - it should inherit from the enemy from Hades II
	if not game.Contains(mod.NPCNameRemovals, oldName) then
		mod.UpdateField(hadesNPCTable.Units, oldName, newName, { "InheritFrom" }, "NPCs.sjson")
	end
end

for i = #hadesNPCTable.Units, 1, -1 do
	local enemy = hadesNPCTable.Units[i]
	for parentKey, replacements in pairs(NPCKeyReplacements) do
		if enemy[parentKey] ~= nil then
			for oldName, newName in pairs(replacements) do
				if enemy[parentKey][oldName] ~= nil then
					enemy[parentKey][newName] = enemy[parentKey][oldName]
					enemy[parentKey][oldName] = nil
					mod.DebugPrint("Replaced " ..
						parentKey ..
						"." .. oldName .. " with " .. parentKey .. "." .. newName .. " for " .. enemy.Name .. " in NPCs.sjson", 4)
				end
			end
		end
	end
end

sjson.hook(hadesTwoNPCFile, function(data)
	mod.AddTableKeysSkipDupes(data.Units, hadesNPCTable.Units, "Name")
end)
