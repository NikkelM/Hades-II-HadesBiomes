-- TODO: Create a new "door" to start a Hades run
-- For now, changes the behaviour of the downstairs door to start a Hades run, instead of a Hades II run
game.HubRoomData.Hub_PreRun.ObstacleData[420947].OnUsedFunctionArgs = { StartingBiome = "Tartarus", DashTarget = 588632, AltarId = 589766, }
