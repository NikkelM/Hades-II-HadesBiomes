-- This is for the chaos gate that functions as the run start door for a Hades run
-- Even though we set a different animation, this is the base obstacle we still need to mute the sound
local newData = {
	ModsNikkelMHadesBiomes_HadesRunStartDoor = {
		Name = "ModsNikkelMHadesBiomes_HadesRunStartDoor",
		InheritFrom = "SecretDoor",
		Thing = {
			AmbientSound = "/EmptyCue"
		},
	},
}

local chaosObstaclesFile = rom.path.combine(rom.paths.Content(), "Game/Obstacles/Chaos.sjson")

sjson.hook(chaosObstaclesFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Chaos"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Obstacles, newData, "Name")
end)
