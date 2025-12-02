-- Adds NPCs from Hades to Hades II

local hadesNPCFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Units\\NPCs.sjson")
local hadesNPCTable = mod.DecodeSjsonFile(hadesNPCFile)

-- We sometimes get a file-too-small error from H2M with the NPCs.sjson file
local hadesTwoEnemiesFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\Enemies.sjson")

-- We don't need all NPCs, so only take the ones we actually need
local hadesNPCsToCopy = {
	"NPC_Sisyphus_01",
	"NPC_Eurydice_01",
	"NPC_Patroclus_01",
	-- Not using these yet in our NPC logic
	-- "NPC_Achilles_01",
	-- "NPC_Achilles_Story_01",
	-- "NPC_Orpheus_Story_01",
	-- "NPC_Orpheus_01",
	"NPC_Hades_Story_02",
	-- These are still defined in Hades II, creating a ModsNikkelMHadesBiomes_ version of them
	-- "NPC_Persephone_01",
	-- "NPC_Thanatos_01",
	-- "NPC_Thanatos_Field_01",
}

local hadesNPCCopySet = {}
for _, npc in ipairs(hadesNPCTable.Units) do
	if game.Contains(hadesNPCsToCopy, npc.Name) then
		table.insert(hadesNPCCopySet, npc)
	end
end
hadesNPCTable.Units = hadesNPCCopySet

-- Modifications/overrides to the Hades NPCs
-- Use the original names from the Hades file here, as modifications are applied before renaming
local hadesNPCModifications = {
	NPC_Sisyphus_01 = { InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC", },
	NPC_Eurydice_01 = { InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC", },
	NPC_Patroclus_01 = { InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC", },
	-- NPC_Achilles_01 = { InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC", },
	-- NPC_Achilles_Story_01 = { InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC", },
	-- NPC_Orpheus_Story_01 = { InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC", },
	-- NPC_Orpheus_01 = { InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC", },
	NPC_Hades_Story_02 = { InheritFrom = "ModsNikkelMHadesBiomes_NPC_Hades_01", },
}
local hadesNPCAdditions = {
	{
		Name = "ModsNikkelMHadesBiomes_NPC_Hades_01",
		InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "Hades_HouseWritingLoop_IdleLoop",
			Interact = {
				Distance = 220.0,
				OffsetX = -130.0,
				OffsetY = 200.0,
			},
			Points = {
				{ X = -23,  Y = 129 },
				{ X = 157,  Y = 33 },
				{ X = -5,   Y = -43 },
				{ X = -197, Y = 48 },
			},
			SubtitleColor = { Red = 0.83, Green = 0.15, Blue = 0.15 },
		},
	},
	-- The child needs to be before the parent, as the parent is added to the front of the list after the child
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
		Name = "ModsNikkelMHadesBiomes_NPC_Cerberus_01",
		InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC",
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
		Name = "ModsNikkelMHadesBiomes_NPC_Bouldy_01",
		InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC",
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
	{
		Name = "ModsNikkelMHadesBiomes_NPC_Persephone_01",
		InheritFrom = "ModsNikkelMHadesBiomes_BaseNPC",
		DisplayInEditor = true,
		Acceleration = 250.0,
		Deceleration = 250.0,
		RotationSpeed = 900.00,
		MoveGraphic = "PersephoneGarden_Walk",
		StopGraphic = "PersephoneGarden_WalkStop",
		Speed = 250,
		MoveAI = {
			Name = "Pathfind",
			LookAheadDistance = 100.0,
			SuccessDistance = 10.0,
		},
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "PersephoneGardenIdle",
			Grip = 5000.0,
			ImmuneToForce = true,
			Tallness = 225.0,
			Points = {
				{ X = -6,  Y = 27 },
				{ X = 44,  Y = 0 },
				{ X = -2,  Y = -23 },
				{ X = -54, Y = 3 },
			},
			SubtitleColor = { Red = 0.88, Green = 0.84, Blue = 0.25 },
		},
	},
	-- The exact same as BaseNPC, but we need to redefine it as we hook into the Enemies.sjson file where BaseNPC is not yet defined
	{
		Name = "ModsNikkelMHadesBiomes_BaseNPC",
		AutoLockable = false,
		DisplayInEditor = false,
		CosmeticRotationSpeed = 280.0,
		RotationSpeed = 1200.0,
		Speed = 400.0,
		Life = {
			HitFx = "HitSparkB",
			HomingEligible = false,
			Invulnerable = true,
			JumpTargetEligible = false,
			TriggerOnHit = true,
		},
		Thing = {
			CanBeOccluded = true,
			EditorOutlineDrawBounds = false,
			Graphic = "NPCFemaleThinking",
			Grip = 99999.0,
			SelectionHeight = 240.0,
			SelectionShiftY = -30.0,
			SelectionWidth = 180.0,
			SpeechCapable = true,
			UseBoundsForSortDrawArea = true,
			HighPrioritySfx = true,
			StopsProjectiles = true,
			StopsUnits = true,
			Interact = {
				Distance = 250.0,
				OffsetY = -50.0,
			},
			Points = {
				{ X = 0,   Y = 32 },
				{ X = 64,  Y = 0 },
				{ X = 0,   Y = -32 },
				{ X = -64, Y = 0 },
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
	-- Add to the front, so others can properly inherit from them
	table.insert(hadesNPCTable.Units, 1, npcData)
end

sjson.hook(hadesTwoEnemiesFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["NPCs"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Units, hadesNPCTable.Units, "Name")
end)
