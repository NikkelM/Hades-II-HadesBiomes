local hadesTwoEnemyBaseVFXFile = rom.path.combine(rom.paths.Content(), "Game\\Animations\\Enemy_1Base_VFX.sjson")

local hadesTwoEnemyBaseVFXModifications = {
	HadesLaser = {
		-- The sound is way too loud if played through sjson, we play it through the FireFunctionName instead
		Sound = "null",
	},
}

sjson.hook(hadesTwoEnemyBaseVFXFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Enemy_1Base_VFX"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.ApplyNestedSjsonModifications(data.Animations, hadesTwoEnemyBaseVFXModifications)
end)
