-- When the enemy's armor is broken, remove the outline from any tethers as well, if applicable
modutil.mod.Path.Wrap("DoEnemyHealthBufferDeplete", function(base, enemy)
	base(enemy)
	if enemy.TetherIds ~= nil then
		for k, tetherId in ipairs(enemy.TetherIds) do
			RemoveOutline({ Id = tetherId })
		end
	end
end)
