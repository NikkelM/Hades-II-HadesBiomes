--[[ Modded incantation order:
ModsNikkelMHadesBiomes_UnlockPostBossGiftRackIncantation - Post-Boss Keepsake Rack - after 1 run
ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation - Well of Charon during runs - after 1 run
ModsNikkelMHadesBiomes_UnlockPostBossWellShopsIncantation - Well of Charon after bosses - after 3 runs
ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation - Sell Shops during runs - after 2 runs
ModsNikkelMHadesBiomes_UnlockPostBossSellShopsIncantation - Sell Shops after bosses - after 4 runs
ModsNikkelMHadesBiomes_UnlockShrinePointGatesIncantation - Erebus Gates - after clearing 2 runs
ModsNikkelMHadesBiomesUnlockCosmeticsIncantation - New Cosmetics - after 6 runs
]] --

local newIncantations = {
	-- #region Post-Boss Keepsake Rack/GiftRack
	ModsNikkelMHadesBiomes_UnlockPostBossGiftRackIncantation = {
		-- ModsNikkelMHadesBiomesInsertAfterItem = nil,
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cosmetic_giftRackUpgrade_01",
		Cost = {
			ModsNikkelMHadesBiomes_PlantTartarus = 1,
		},
		GameStateRequirements = {
			{
				-- Player already has Keepsake racks in all vanilla post-boss rooms
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossGiftRack" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
		},
	},
	-- #endregion
	-- #region Well of Charon/WellShop
	ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockPostBossGiftRackIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "GUI\\Screens\\CriticalItemShop\\Icons\\cauldron_well",
		Cost = {
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_OreTartarus = 2,
		},
		GameStateRequirements = {
			{
				-- Player already has Wells of Charon in vanilla runs
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeWellShops" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
			},
		},
		IncantationVoiceLines = {
			{
				PreLineWait = 0.65,
				{ Cue = "/VO/Melinoe_5601", Text = "{#Emph}Long-dormant Wells of Charon, rise again into the night!" },
			},
		},
	},
	ModsNikkelMHadesBiomes_UnlockPostBossWellShopsIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "GUI\\Screens\\CriticalItemShop\\Icons\\cauldron_well",
		Cost = {
			ModsNikkelMHadesBiomes_PlantAsphodel = 1,
			ModsNikkelMHadesBiomes_OreAsphodel = 2,
		},
		GameStateRequirements = {
			{
				-- Player already has Wells of Charon in all vanilla post-boss rooms
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossWellShops" },
			},
			{
				-- Player already has Wells of Charon in modded rooms
				PathTrue = { "GameState", "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "X_PostBoss01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 3,
			},
			-- Hasn't just unlocked the in-run wells. This check includes CurrentRun
			{
				SumPrevRuns = 1,
				Path = { "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation" },
				CountPathTrue = true,
				Comparison = "<",
				Value = 1,
			},
		},
	},
	-- #endregion
	-- #region Pool of Purging/SellShops/SellTraitShops
	ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockPostBossWellShopsIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "GUI\\Screens\\CriticalItemShop\\Icons\\cauldron_selltrait",
		Cost = {
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
			ModsNikkelMHadesBiomes_CropAsphodel = 1,
			ModsNikkelMHadesBiomes_OreTartarus = 3,
		},
		GameStateRequirements = {
			{
				-- Player already has Pools of Purging in all vanilla post-boss rooms
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossSellTraitShops" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "X_PostBoss01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
		},
	},
	ModsNikkelMHadesBiomes_UnlockPostBossSellShopsIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "GUI\\Screens\\CriticalItemShop\\Icons\\cauldron_selltrait",
		Cost = {
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_CropTartarus = 1,
		},
		GameStateRequirements = {
			{
				-- Player already has Pools of Purging in all vanilla post-boss rooms
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradePostBossSellTraitShops" },
			},
			{
				-- Player already has Pools of Purging in all modded rooms
				PathTrue = { "GameState", "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_PostBoss01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 4,
			},
			-- Hasn't just unlocked the in-run wells. This check includes CurrentRun
			{
				SumPrevRuns = 1,
				Path = { "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation" },
				CountPathTrue = true,
				Comparison = "<",
				Value = 1,
			},
		},
	},
	-- #endregion
	-- #region ShrineChallenge/Erebus Gates
	ModsNikkelMHadesBiomes_UnlockShrinePointGatesIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockPostBossSellShopsIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cosmetic_shrinePointGates_01",
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceTartarus = 3,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 1,
			ModsNikkelMHadesBiomes_BossResourceStyx = 2,
		},
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Hub" },
			},
			{
				-- The Oath of the Unseen must be unlocked
				PathTrue = { "GameState", "ScreensViewed", "Shrine" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
		},
	},
	-- #endregion
	-- #region Cosmetics
	-- DO NOT change the name of this, as this would invalidate the unlock for anyone who has already performed the incantation
	ModsNikkelMHadesBiomesUnlockCosmeticsIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockShrinePointGatesIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cauldron_unlockCosmetics",
		Cost = {
			CosmeticsPoints = 150,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_OreAsphodel = 4,
		},
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 6,
			},
			NamedRequirements = { "CosmeticsShopUnlocked" },
		},

		OnActivateFinishedFunctionName = _PLUGIN.guid .. "." .. "PostCosmeticsIncantationDoraCheckForNewItems",
		PanDuration = 1,
		PanHoldDuration = 2.5,
		CameraFocusId = 566832, -- Dora

		OfferedVoiceLines = {
			PreLineWait = 0.7,
			TriggerCooldowns = { "MelCauldronSpellRevealedSpeech" },
			{ Cue = "/VO/Melinoe_3651", Text = "The Renewal Project..." },
		},
		IncantationVoiceLines = {
			{
				PreLineWait = 0.3,
				{ Cue = "/VO/Melinoe_0533", Text = "{#Emph}Great Tree of Life, please listen to my thoughts!" },
			},
		},
		PostRevealVoiceLines = {
			PreLineWait = 0.55,
			ObjectType = "NPC_Dora_01",
			{ Cue = "/VO/Dora_0272", Text = "Got some new stuff here.", PreLineFunctionName = "GenericPresentation", PreLineFunctionArgs = game.PresetAudioArgs.DoraNormalAppearArgs, },
		},
	},
	-- #endregion
}
mod.AddTableKeysSkipDupes(game.WorldUpgradeData, newIncantations)

-- Adds the new incantations to the Cauldron screen categories
-- Build a sorted list based on dependencies to ensure items are inserted in the correct order
local function getSortedIncantations(incantations)
	local sorted = {}
	local processed = {}

	local function addIncantation(name)
		if processed[name] then
			return
		end

		local data = incantations[name]
		if data and data.ModsNikkelMHadesBiomesInsertAfterItem then
			-- If this depends on another incantation, process that one first
			local dependency = data.ModsNikkelMHadesBiomesInsertAfterItem
			if incantations[dependency] then
				addIncantation(dependency)
			end
		end

		table.insert(sorted, name)
		processed[name] = true
	end

	for incantationName, _ in pairs(incantations) do
		addIncantation(incantationName)
	end

	return sorted
end

local sortedIncantationNames = getSortedIncantations(newIncantations)

-- Adds the new incantations to the Cauldron screen categories
-- The modded category is defined in GhostAdminData_Items.lua
for _, incantationName in pairs(sortedIncantationNames) do
	local incantationData = newIncantations[incantationName]
	local insertAfterItem = incantationData.ModsNikkelMHadesBiomesInsertAfterItem
	local cauldronCategory = incantationData.ModsNikkelMHadesBiomesCauldronCategory or
			"WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical"
	-- This table is defined in GhostAdminData_Items.lua in Hades II
	for _, ghostAdminCategory in ipairs(game.ScreenData.GhostAdmin.ItemCategories) do
		if ghostAdminCategory.Name == cauldronCategory then
			-- Insert the new upgrade after the specified item, or at the end
			if insertAfterItem ~= nil then
				local insertedAtPosition = nil
				for index, worldUpgradeName in ipairs(ghostAdminCategory) do
					if worldUpgradeName == insertAfterItem then
						insertedAtPosition = true
						table.insert(ghostAdminCategory, index + 1, incantationName)
						mod.DebugPrint(
							"Inserted " .. incantationName .. " after " .. insertAfterItem ..
							" in category " .. cauldronCategory .. ".", 4)
						break
					end
				end
				if insertedAtPosition == nil then
					mod.DebugPrint(
						"Could not find item " .. insertAfterItem .. " to insert after, adding " .. incantationName ..
						" at the end of category " .. cauldronCategory .. " instead.", 2)
					table.insert(ghostAdminCategory, incantationName)
				end
			else
				table.insert(ghostAdminCategory, incantationName)
				mod.DebugPrint(
					"Inserted " .. incantationName .. " at the end of category " .. cauldronCategory .. ".", 4)
			end
		end
	end
end
