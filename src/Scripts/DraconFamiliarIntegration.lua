mod.ModdedFamiliarCostumeIds = {
	"ModsNikkelMHadesBiomes_FamiliarCostume_SnakeDefault",
	"ModsNikkelMHadesBiomes_FamiliarCostume_SnakeDelphic",
	"ModsNikkelMHadesBiomes_FamiliarCostume_SnakePuppet",
	"ModsNikkelMHadesBiomes_FamiliarCostume_SnakeRegal",
	"ModsNikkelMHadesBiomes_FamiliarCostume_SnakeLernaean",
	"ModsNikkelMHadesBiomes_FamiliarCostume_SnakeNightmare",
}

local exitCharmId = _PLUGIN.guid .. "." .. "Cosmetic_ExitCharm_SnakeFamiliar"
table.insert(mod.ModdedCosmeticIds, exitCharmId)

local applied = false
modutil.mod.Path.Wrap("DoPatches", function(base)
	if not applied and not mod.InstallationPending and public.IsModEnabledAndInstallationValid() then
		local exitCharm = assert(game.WorldUpgradeData[exitCharmId], "Dracon Familiar did not register " .. exitCharmId)
		table.insert(exitCharm.GameStateRequirements, {
			PathTrue = { "GameState", "WorldUpgradesAdded", mod.UnlockCosmeticsIncantationName },
		})
		applied = true
	end

	return base()
end)
