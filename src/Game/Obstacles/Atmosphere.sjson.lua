-- Adds Atmosphere obstacles from Hades to Hades II

local hadesTwoAtmosphereObstacleFile = rom.path.combine(rom.paths.Content(), "Game\\Obstacles\\Atmosphere.sjson")

local hadesObstacleAdditions = {
	{
		Name = "GrainGlow01",
		InheritFrom = "1_BaseDecalObstacle",
		DisplayInEditor = true,
		Thing = {
			Ambient = 0.0,
			EditorOutlineDrawBounds = false,
			Graphic = "Tilesets\\Atmosphere\\Grain_Glow_01",
			Points = {
				{ X = -37, Y = -128 },
				{ X = -154, Y = 11 },
				{ X = 15, Y = 207 },
				{ X = 238, Y = 71 },
				{ X = 181, Y = -109 },
			},
		},
	},
	{
		Name = "AtmosphereShadowRound03",
		InheritFrom = "1_BaseTerrainTile",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "Tilesets\\Atmosphere\\Atmosphere_Shadow_Round_03",
			Offset = { X = 0, Y = 9 },
		},
	},
	{
		Name = "AtmosphereShadowBrick03",
		InheritFrom = "1_BaseTerrainTile",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "Tilesets\\Atmosphere\\Atmosphere_Shadow_Brick_03",
			Offset = { X = 0, Y = 9 },
		},
	},
	{
		Name = "AtmosphereShadowBrickWall03",
		InheritFrom = "1_BaseInvulnerableObstacle",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "Tilesets\\Atmosphere\\Atmosphere_Shadow_BrickWall_03",
			StopsLight = false,
			Offset = { X = 0, Y = -299 },
			Points = {
				{ X = -553, Y = 242 },
				{ X = -477, Y = 280 },
				{ X = 717, Y = -315 },
				{ X = 669, Y = -347 },
			},
		},
	},
	{
		Name = "AtmosphereShadowCorner01",
		InheritFrom = "1_BaseInvulnerableObstacle",
		DisplayInEditor = true,
		Thing = {
			EditorOutlineDrawBounds = false,
			Graphic = "Tilesets\\Atmosphere\\Atmosphere_Shadow_Corner_01",
			Offset = { X = 0, Y = -547 },
			Points = {
				{ X = 17, Y = -25 },
				{ X = -52, Y = 18 },
				{ X = 52, Y = 57 },
				{ X = 86, Y = 22 },
			},
		},
	},
}

sjson.hook(hadesTwoAtmosphereObstacleFile, function(data)
	local sjsonLoads = mod.TryLoadCachedSjsonFile("sjsonLoads.sjson") or {}
	sjsonLoads["Atmosphere"] = true
	mod.SaveCachedSjsonFile("sjsonLoads.sjson", sjsonLoads)

	mod.AddTableKeysSkipDupes(data.Obstacles, hadesObstacleAdditions, "Name")
end)
