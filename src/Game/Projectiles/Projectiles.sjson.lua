-- Adds projectile data for enemies from Hades to Hades II
local hadesProjectilesFile = rom.path.combine(mod.hadesGameFolder, "Content\\Game\\Projectiles\\Projectiles.sjson")
local hadesProjectilesTable = mod.DecodeSjsonFile(hadesProjectilesFile)

local hadesTwoProjectilesFile = rom.path.combine(rom.paths.Content(), "Game\\Projectiles\\PlayerProjectiles.sjson")

-- Projectiles that are defined in a different file and therefore not caught by AddTableKeysSkipDupes()
local projectilesToRemove = {
	"1_BaseProjectile",
	"1_BaseEnemyProjectile",
}

-- Iterating through all projectiles
for i = #hadesProjectilesTable.Projectiles, 1, -1 do
	local projectile = hadesProjectilesTable.Projectiles[i]

	-- Projectiles that should be removed completely, likely as they already exist in Hades II
	if mod.ShouldRemoveEntry(projectile.Name, projectilesToRemove) then
		table.remove(hadesProjectilesTable.Projectiles, i)
		mod.DebugPrint("Removed projectile: " .. projectile.Name .. " from EnemyProjectiles.sjson", 4)
	end
end

sjson.hook(hadesTwoProjectilesFile, function(data)
	mod.AddTableKeysSkipDupes(data.Projectiles, hadesProjectilesTable.Projectiles, "Name")
end)
