local newTraitData = {
	[1] = {
		Name = "ModsNikkelMHadesBiomes_TemporaryBlockExplodingChariotsTrait",
		InheritFrom = { "ShopTrait" },
		Icon = "GUIModded\\Screens\\ShopIcons\\release_parchment_23",
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
	[2] = {
		Name = "ModsNikkelMHadesBiomes_KeepsakeChargeDrop",
		InheritFrom = { "ShopTrait" },
		Icon = "GUIModded\\Screens\\ShopIcons\\spindle_24",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Fabric",
		ResourceCosts = {
			Money = 40,
		},
		CloseScreen = true,
		GameStateRequirements = {
			{
				Path = { "CurrentRun", "Hero", "TraitDictionary" },
				HasAny = mod.AssistTraitNames,
			},
		},
		SetupFunction = {
			Name = _PLUGIN.guid .. "." .. "AddAssistCharge",
			Args = {
				Delay = 0.25,
				NumCharges = 1,
				TraitName = "ModsNikkelMHadesBiomes_KeepsakeChargeDrop",
			},
			Threaded = true,
		},
	},
}

-- Add to RandomStoreItem and RoomShop trait tables
for _, traitData in ipairs(newTraitData) do
	local traitName = traitData.Name
	game.TraitData[traitName] = traitData
	table.insert(game.ConsumableData.RandomStoreItem.UseFunctionArgs.Traits, traitName)
	table.insert(game.StoreData.RoomShop.Traits, traitName)
	table.insert(game.StoreData.RoomShop.BoonInfoSortOrder, traitName)
end
