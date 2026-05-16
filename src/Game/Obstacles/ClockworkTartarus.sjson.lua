local clockworkTartarusObstaclesFile = rom.path.combine(rom.paths.Content(), "Game/Obstacles/ClockworkTartarus.sjson")

local newData = {
	ModsNikkelMHadesBiomes_ChronosRemains = {
		Name = "ModsNikkelMHadesBiomes_ChronosRemains",
		InheritFrom = "ChronosRemains",
	},
}

sjson.hook(clockworkTartarusObstaclesFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["ClockworkTartarus"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Obstacles, newData, "Name")
end)
