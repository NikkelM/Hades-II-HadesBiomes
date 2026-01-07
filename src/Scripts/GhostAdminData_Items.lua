-- Adds a new category to the Cauldron, for Zagreus' Journey incantations
local newCauldronCategories = {
	{
		Name = "WorldUpgradeScreen_ModsNikkelMHadesBiomes_Critical",
		Icon = "Portraits\\ModsNikkelMHadesBiomesRunHistory\\RunHistory_Door_Red_72x72",
		Animations = { Default = "GUI\\Screens\\CriticalItemShop\\CategoryTab01", Highlight = "GUI\\Screens\\CriticalItemShop\\CategoryTabMouseOver01", Active = "GUI\\Screens\\CriticalItemShop\\CategoryTabSelected01", Reveal = "CriticalItemShopCategoryTabReveal", },
		OneRevealPerRun = true,
		GameStateRequirements = {
			NamedRequirements = { "ModsNikkelMHadesBiomes_UnlockInRunWellShopsIncantation_Unlockable" },
		},
		-- Incantations/WorldUpgrades are added as ipairs in the loop in WorldUpgradeData.lua
	},
}
for _, category in ipairs(newCauldronCategories) do
	table.insert(game.ScreenData.GhostAdmin.ItemCategories, category)
end
