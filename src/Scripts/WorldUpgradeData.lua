--[[ Modded incantation order (in the menu):
ModsNikkelMHadesBiomes_UnlockPostBossGiftRackIncantation - Post-Boss Keepsake Rack - after 1 run
ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation - Well of Charon during runs - after 2 runs
ModsNikkelMHadesBiomes_UnlockPostBossWellShopsIncantation - Well of Charon after bosses - after 5 runs
ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation - Sell Shops during runs - after 4 runs
ModsNikkelMHadesBiomes_UnlockPostBossSellShopsIncantation - Sell Shops after bosses - after 6 runs
ModsNikkelMHadesBiomes_UnlockTartarusReprieveIncantation - Tartarus Fountain Chamber - after 3 runs
ModsNikkelMHadesBiomes_UnlockAsphodelReprieveIncantation - Asphodel Fountain Chamber - after 6 runs
ModsNikkelMHadesBiomes_UnlockElysiumReprieveIncantation - Elysium Fountain Chamber - after 9 runs
ModsNikkelMHadesBiomes_BreakableValue1Incantation - Unlock low-value Gold Urns/Breakables
ModsNikkelMHadesBiomes_BreakableValue2Incantation - Unlock medium-value Gold Urns/Breakables
ModsNikkelMHadesBiomes_BreakableValue3Incantation - Unlock high-value Gold Urns/Breakables
ModsNikkelMHadesBiomes_UnlockInfernalTrovesIncantation - Infernal Troves - after 3 runs
ModsNikkelMHadesBiomes_UnlockMoonMonumentsIncantation - Moon Moncuments - after completing 6 runs and clearing 2 runs
ModsNikkelMHadesBiomes_UnlockShrinePointGatesIncantation - Erebus Gates - after completing 7 and clearing 4 runs
ModsNikkelMHadesBiomesUnlockCosmeticsIncantation - New Cosmetics - after completing 2 runs
WorldUpgradeMusicPlayerModsNikkelMUnlockHadesMusic - New Music for the Music Maker - from Hades_OST_for_the_Music_Maker - after 1 run and meeting Eurydice
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
			ModsNikkelMHadesBiomes_OreTartarus = 2,
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
			ModsNikkelMHadesBiomes_CropTartarus = 1,
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
				Value = 2,
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
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
			ModsNikkelMHadesBiomes_CropAsphodel = 1,
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
				Value = 5,
			},
			-- Hasn't just unlocked the in-run wells. This check includes CurrentRun
			{
				SumPrevRuns = 2,
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
			ModsNikkelMHadesBiomes_PlantAsphodel = 1,
			ModsNikkelMHadesBiomes_CropAsphodel = 2,
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
				Value = 4,
			},
		},
	},
	ModsNikkelMHadesBiomes_UnlockPostBossSellShopsIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "GUI\\Screens\\CriticalItemShop\\Icons\\cauldron_selltrait",
		Cost = {
			ModsNikkelMHadesBiomes_PlantElysium = 2,
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
				Value = 6,
			},
			-- Hasn't just unlocked the in-run wells. This check includes CurrentRun
			{
				SumPrevRuns = 2,
				Path = { "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockInRunSellShopsIncantation" },
				CountPathTrue = true,
				Comparison = "<",
				Value = 1,
			},
		},
	},
	-- #endregion
	-- #region Reprieve/Fountain Chambers
	ModsNikkelMHadesBiomes_UnlockTartarusReprieveIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockPostBossSellShopsIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cauldron_tartarus",
		Cost = {
			ModsNikkelMHadesBiomes_PlantTartarus = 3,
			ModsNikkelMHadesBiomes_CropTartarus = 1,
			ModsNikkelMHadesBiomes_OreTartarus = 3,
		},
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeErebusReprieve" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	ModsNikkelMHadesBiomes_UnlockAsphodelReprieveIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockTartarusReprieveIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cauldron_asphodel",
		Cost = {
			ModsNikkelMHadesBiomes_PlantAsphodel = 3,
			ModsNikkelMHadesBiomes_CropAsphodel = 1,
			ModsNikkelMHadesBiomes_OreAsphodel = 3,
		},
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockTartarusReprieveIncantation" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "X_Intro" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 6,
			},
			{
				SumPrevRuns = 2,
				Path = { "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockTartarusReprieveIncantation" },
				CountPathTrue = true,
				Comparison = "<",
				Value = 1,
			},
		},
	},
	ModsNikkelMHadesBiomes_UnlockElysiumReprieveIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockAsphodelReprieveIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cauldron_elysium",
		Cost = {
			ModsNikkelMHadesBiomes_PlantElysium = 3,
			ModsNikkelMHadesBiomes_CropElysium = 1,
			ModsNikkelMHadesBiomes_OreElysium = 3,
		},
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockAsphodelReprieveIncantation" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_Intro" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 9,
			},
			{
				SumPrevRuns = 2,
				Path = { "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockAsphodelReprieveIncantation" },
				CountPathTrue = true,
				Comparison = "<",
				Value = 1,
			},
		},
	},
	-- #endregion
	-- #region Breakables/Gold Urns
	ModsNikkelMHadesBiomes_BreakableValue1Incantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockElysiumReprieveIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cosmetic_goldUrnUpgrades_01",
		Cost = {
			ModsNikkelMHadesBiomes_PlantTartarus = 2,
			ModsNikkelMHadesBiomes_CropTartarus = 1,
		},
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_UnlockTartarusReprieveIncantation" },
			},
			{
				PathTrue = { "GameState", "WorldUpgrades", "WorldUpgradeBreakableValue1" },
			},
			{
				SumPrevRuns = 2,
				Path = { "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockTartarusReprieveIncantation" },
				CountPathTrue = true,
				Comparison = "<",
				Value = 1,
			},
		},
		IncantationVoiceLines = {
			{
				PreLineWait = 0.3,
				{ Cue = "/VO/Melinoe_5604", Text = "{#Emph}Whatever gleams with Gold shall soon be found!" },
			},
		},
	},
	ModsNikkelMHadesBiomes_BreakableValue2Incantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_BreakableValue1Incantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cosmetic_goldUrnUpgrades_01",
		Cost = {
			ModsNikkelMHadesBiomes_PlantAsphodel = 2,
			ModsNikkelMHadesBiomes_CropElysium = 2,
		},
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_BreakableValue1Incantation" },
			},
			{
				SumPrevRuns = 3,
				Path = { "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_BreakableValue1Incantation" },
				CountPathTrue = true,
				Comparison = "<",
				Value = 1,
			},
		},
	},
	ModsNikkelMHadesBiomes_BreakableValue3Incantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_BreakableValue2Incantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cosmetic_goldUrnUpgrades_01",
		Cost = {
			ModsNikkelMHadesBiomes_PlantStyx = 1,
			ModsNikkelMHadesBiomes_OreElysium = 3,
		},
		GameStateRequirements = {
			{
				PathTrue = { "GameState", "WorldUpgrades", "ModsNikkelMHadesBiomes_BreakableValue2Incantation" },
			},
			{
				SumPrevRuns = 4,
				Path = { "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_BreakableValue2Incantation" },
				CountPathTrue = true,
				Comparison = "<",
				Value = 1,
			},
		},
	},
	-- #endregion
	-- #region Challenges/Infernal Troves/Moon Monuments
	ModsNikkelMHadesBiomes_UnlockInfernalTrovesIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_BreakableValue3Incantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "GUI\\Screens\\CriticalItemShop\\Icons\\cauldron_trove",
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceTartarus = 2,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
			ModsNikkelMHadesBiomes_OreElysium = 5,
		},
		GameStateRequirements = {
			{
				-- Player already has Infernal Troves in the Underworld
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeChallengeSwitches1" },
			},
			{
				PathTrue = { "GameState", "RoomsEntered", "Y_Boss01" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 3,
			},
		},
	},
	ModsNikkelMHadesBiomes_UnlockMoonMonumentsIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockInfernalTrovesIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "GUI\\Screens\\CriticalItemShop\\Icons\\cauldron_challengeswitch",
		Cost = {
			ModsNikkelMHadesBiomes_OreTartarus = 5,
			ModsNikkelMHadesBiomes_BossResourceAsphodel = 2,
			ModsNikkelMHadesBiomes_BossResourceStyx = 1,
			ModsNikkelMHadesBiomes_CropElysium = 2,
		},
		GameStateRequirements = {
			{
				-- Player already has Moon Monuments in vanilla runs
				PathTrue = { "GameState", "WorldUpgradesAdded", "WorldUpgradeChallengeSwitchesExtra1" },
			},
			{
				-- Player already has Infernal Troves in modded runs
				PathTrue = { "GameState", "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockInfernalTrovesIncantation" },
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 6,
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 2,
			},
			-- Hasn't just unlocked the Infernal Troves. This check includes CurrentRun
			{
				SumPrevRuns = 2,
				Path = { "WorldUpgradesAdded", "ModsNikkelMHadesBiomes_UnlockInfernalTrovesIncantation" },
				CountPathTrue = true,
				Comparison = "<",
				Value = 1,
			},
		},
	},
	-- #endregion
	-- #region ShrineChallenge/Erebus Gates
	ModsNikkelMHadesBiomes_UnlockShrinePointGatesIncantation = {
		ModsNikkelMHadesBiomesInsertAfterItem = "ModsNikkelMHadesBiomes_UnlockMoonMonumentsIncantation",
		ModsNikkelMHadesBiomesCauldronCategory = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",

		InheritFrom = { "DefaultHubItem", "DefaultCriticalItem" },

		Icon = "NikkelM-HadesBiomesCosmetics\\Cauldron\\cosmetic_shrinePointGates_01",
		Cost = {
			ModsNikkelMHadesBiomes_BossResourceTartarus = 3,
			ModsNikkelMHadesBiomes_BossResourceElysium = 1,
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
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 7,
			},
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesClearedRunsCache" },
				Comparison = ">=",
				Value = 4,
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
			ModsNikkelMHadesBiomes_OreAsphodel = 3,
		},
		GameStateRequirements = {
			{
				Path = { "GameState", "ModsNikkelMHadesBiomesCompletedRunsCache" },
				Comparison = ">=",
				Value = 2,
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
-- The OST mod is now a dependency, so we can safely call this
-- Need to add it to the table so we can sort and insert it into Cauldron category correctly
newIncantations["WorldUpgradeMusicPlayerModsNikkelMUnlockHadesMusic"] = game.WorldUpgradeData
		["WorldUpgradeMusicPlayerModsNikkelMUnlockHadesMusic"]

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
