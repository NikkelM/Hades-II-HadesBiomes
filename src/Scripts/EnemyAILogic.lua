-- Fixing the function call to get the shrine upgrade level
modutil.mod.Path.Wrap("GetWeaponAIData", function(base, enemy, weaponName)
	weaponName = weaponName or enemy.WeaponName
	local aiData = base(enemy, weaponName)
	if game.WeaponData[weaponName] ~= nil and game.WeaponData[weaponName].AIData ~= nil then
		if game.WeaponData[weaponName].ShrineAIDataOverwrites ~= nil and game.GetNumShrineUpgrades(game.WeaponData[enemy.WeaponName].ShrineMetaUpgradeName) >= game.WeaponData[enemy.WeaponName].ShrineMetaUpgradeRequiredLevel then
			game.OverwriteTableKeys(aiData, WeaponData[weaponName].ShrineAIDataOverwrites)
		end
	end
	return aiData
end)
