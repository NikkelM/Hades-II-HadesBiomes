local newTraitData = {
	ModsNikkelMHadesBiomes_TemporaryBlockExplodingChariotsTrait = {
		InheritFrom = { "ShopTrait" },
		Icon = "NikkelM-HadesBiomesGUIModded\\GUIModded\\Screens\\ShopIcons\\release_parchment_23",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Paper",
		ResourceCosts = {
			Money = 75,
		},
		RequiredNoChallengeSwitchInRoom = true,
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "CurrentRoom", "Name" },
				IsNone = { "A_PostBoss01", "X_PostBoss01", "Y_PostBoss01" },
			},
			{
				Path = { "CurrentRun", "CurrentRoom", "RoomSetName" },
				IsAny = { "Elysium" },
			},
			{
				Path = { "CurrentRun", "BiomeDepthCache" },
				Comparison = "<=",
				Value = 7,
			},
			{
				PathTrue = { "GameState", "EnemyKills", "ChariotSuicide" },
			},
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasNone = { "ModsNikkelMHadesBiomes_TemporaryBlockExplodingChariotsTrait" },
			},
		},
		BlockedEnemyTypes = {
			"ChariotSuicide",
			"ChariotSuicideElite",
		},
		RemainingUses = 10,
		UsesAsEncounters = true,
		StatLines = {
			"StoreUsesRemainingDisplay1",
		},
	},
}

game.OverwriteTableKeys(game.TraitData, newTraitData)
-- Add to RandomStoreItem and RoomShop trait tables
for traitName, _ in pairs(newTraitData) do
	table.insert(game.ConsumableData.RandomStoreItem.UseFunctionArgs.Traits, traitName)
	table.insert(game.StoreData.RoomShop.Traits, traitName)
	table.insert(game.StoreData.RoomShop.BoonInfoSortOrder, traitName)
end
