-- Adds NPCs from Hades to Hades II

local hadesNPCFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Units\\NPCs.sjson")
local hadesNPCTable = mod.DecodeSjsonFile(hadesNPCFile)

local hadesTwoNPCFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\NPCs.sjson")

-- Modifications/overrides to the Hades NPCs
-- Use the original names from the Hades file here, as modifications are applied before renaming
local hadesNPCModifications = {}
local hadesNPCAdditions = {
	{
		Name = "ModsNikkelMHadesBiomes_NPC_Cerberus_01",
		InheritFrom = "BaseNPC",
		DisplayInEditor = true,
		Thing = {
			AmbientSound = "/SFX/NPCLoops/CerberusGrowlLoop",
			EditorOutlineDrawBounds = false,
			Graphic = "Cerberus_HouseIdle",
			Interact = {
				Distance = 180.0,
				OffsetX = -125.0,
				OffsetY = 50.0,
			},
			Offset = { X = 0, Y = -111 },
			Points = {
				{ X = 273,  Y = -128 },
				{ X = 269,  Y = -181 },
				{ X = 73,   Y = -250 },
				{ X = -282, Y = -77 },
				{ X = -289, Y = 23 },
				{ X = -160, Y = 78 },
				{ X = -48,  Y = 76 },
				{ X = 106,  Y = 7 },
			},
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01",
		InheritFrom = "ModsNikkelMHadesBiomes_NPC_Cerberus_01",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "Cerberus_HubIdle",
			Interact = {
				Distance = 320.0,
				OffsetX = -110.0,
				OffsetY = 0.0,
			},
			Points = {
				{ X = 195,  Y = -81 },
				{ X = 122,  Y = -114 },
				{ X = -17,  Y = -126 },
				{ X = -271, Y = -36 },
				{ X = -289, Y = 23 },
				{ X = -160, Y = 78 },
				{ X = -48,  Y = 76 },
				{ X = 106,  Y = 7 },
			},
		},
	},
	{
		Name = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
		InheritFrom = "BaseNPC",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "BouldyIdle",
			Tallness = 1150.0,
			Interact = {
				Distance = 210.0,
				OffsetX = -15.0,
				OffsetY = 130.0,
			},
			Offset = { X = 0, Y = -445, },
			Points = {
				{ X = -716, Y = 51, },
				{ X = 12,   Y = 404, },
				{ X = 728,  Y = 42, },
				{ X = 6,    Y = -328, },
			},
		},
	},
}

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

-- Add new NPCs
for _, npcData in pairs(hadesNPCAdditions) do
	table.insert(hadesNPCTable.Units, npcData)
end

sjson.hook(hadesTwoNPCFile, function(data)
	mod.AddTableKeysSkipDupes(data.Units, hadesNPCTable.Units, "Name")
end)
