-- For new resources/consumable
local newData = {
	ModsNikkelMHadesBiomes_BossResourceTartarusDrop = {
		Name = "ModsNikkelMHadesBiomes_BossResourceTartarusDrop",
		InheritFrom = "BaseLoot",
		Life = {
			DeathFx = "LockKeyPickup",
		},
		Thing = {
			OffsetZ = 90.0,
			Graphic = "ModsNikkelMHadesBiomes_BossResourceTartarusDrop",
		},
	},
	ModsNikkelMHadesBiomes_BossResourceAsphodelDrop = {
		Name = "ModsNikkelMHadesBiomes_BossResourceAsphodelDrop",
		InheritFrom = "BaseLoot",
		Life = {
			DeathFx = "LockKeyPickup",
		},
		Thing = {
			AttachedAnim = "LootShadowMetapoint",
			Graphic = "ModsNikkelMHadesBiomes_BossResourceAsphodelDrop",
			AmbientSound = "/SFX/Object Ambiences/SuperGemAmbience",
		},
	},
	ModsNikkelMHadesBiomes_BossResourceElysiumDrop = {
		Name = "ModsNikkelMHadesBiomes_BossResourceElysiumDrop",
		InheritFrom = "BaseLoot",
		Thing = {
			Graphic = "ModsNikkelMHadesBiomes_BossResourceElysiumDrop",
		},
	},
	ModsNikkelMHadesBiomes_BossResourceStyxDrop = {
		Name = "ModsNikkelMHadesBiomes_BossResourceStyxDrop",
		InheritFrom = "BaseLoot",
		Thing = {
			Graphic = "ModsNikkelMHadesBiomes_BossResourceStyxDrop",
		},
	},
}

local gameplayObstaclesFile = rom.path.combine(rom.paths.Content(), "Game/Obstacles/Gameplay.sjson")

sjson.hook(gameplayObstaclesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Obstacles, newData, "Name")
end)
