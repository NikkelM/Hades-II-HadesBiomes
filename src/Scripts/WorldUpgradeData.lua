local newIncantations = {
	-- #region Cosmetics
	ModsNikkelMHadesBiomesUnlockCosmeticsIncantation = {
		-- ModsNikkelMHadesBiomesInsertAfterItem = nil,
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cauldron_unlockCosmetics",
		Cost = {
			CosmeticsPoints = 150,
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_OreTartarus = 2,
		},
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 1,
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
	-- #region ShrineChallenge/Erebus Gates
	ModsNikkelMHadesBiomes_UnlockShrinePointGatesIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomesUnlockCosmeticsIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cosmetic_shrinePointGates_01",
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
		},
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "RoomsEntered", "D_Hub" },
			},
			{
				-- The Oath of the Unseen must be unlocked
				PathTrue = { "GameState", "ScreensViewed", "Shrine" },
			},
		},
	},
	-- #endregion
}
mod.AddTableKeysSkipDupes(game.WorldUpgradeData, newIncantations)

-- Adds the new incantations to the Cauldron screen categories
for incantationName, incantationData in pairs(newIncantations) do
	local insertAfterItem = incantationData.ModsNikkelMHadesBiomesInsertAfterItem
	local cauldronCategory = incantationData.ModsNikkelMHadesBiomesCauldronCategory or "WorldUpgradeScreen_Critical"
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
