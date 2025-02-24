local order = {
  "Name",
  "Maps",
  "Using"
}

local newMapGroups = {
  {
    Name = "TartarusModsNikkelMHadesBiomes",
    Maps = {
      { Name = "A_*" },
      -- { Name = "RoomSimple01" },
      { Name = "RoomOpening" }
    },
    Using = {
      {
        -- These don't seem to do anything
        -- "Fx\\Tartarus_Pillar04TransitionA",
        -- "Fx\\Tartarus_Pillar04TransitionB",
        -- "Fx\\Tartarus_Pillar04TransitionC",
        -- "Fx\\Tartarus_Fountain_01_Water",
        -- "Fx\\Tartarus_Ghost_03_Dissipate",
        -- "Fx\\DoorOpen",
        -- "Fx\\DoorClose",
        -- "Fx\\LavaRippleA",
        -- "Fx\\Traps_DartTrapTop_Activate",
        -- "Fx\\TrapsDartPadPressedSmoke",
        -- "Fx\\FuryAlectoSpikes",
        -- "Fx\\FuryAlectoThrow",
        -- "Fx\\FuryAlectoThrowEnd",
        -- "Fx\\FuryBeamFire",
        -- "Fx\\FuryTisiphoneGhosts",
        -- "Fx\\FuryWhipArcAlecto",
        -- "Fx\\FuryRunBlur",
        -- "Fx\\TisiphoneSupportSmoke",
        -- "Fx\\SoulFlowA",
        -- "Fx\\SoulFlowB",
        -- "Fx\\Tartarus_UrnExpensive_01_Shine",
        -- "Screens\\BiomeMap\\BiomeMapTraversalAtoB",
        -- "Fx\\HouseDoor02Open\\HouseDoor02Open0120",
        -- "Fx\\HadesDisappear",
        -- "Fx\\SmokeTrapLoop"
      }
    }
  },
  {
    Name = "AsphodelModsNikkelMHadesBiomes",
    Map = {
      -- B_ is also used for the Anomaly in Hades II
      { Name = "X_*" },
    },
    Using = {
      {
        -- "Fx\\Vignette\\VignetteLavaA",
        -- "Fx\\Vignette\\VignetteLavaB",
        -- "Fx\\Asphodel_Vase_01d_Shine",
        -- "Fx\\Asphodel_Fountain_Water",
        -- "Fx\\Asphodel_Terrain_16c",
        -- "Fx\\Asphodel_Terrain_16d",
        -- "Fx\\Asphodel_Terrain_16e",
        -- "Fx\\AsphodelBoatSink",
        -- "Fx\\AsphodelBoatRipple",
        -- "Fx\\LavaFallA",
        -- "Fx\\LavaFallB",
        -- "Fx\\LavaFallC",
        -- "Fx\\LavaFallD",
        -- "Fx\\LavaFallE",
        -- "Fx\\LavaFallF",
        -- "Fx\\LavaFallG",
        -- "Fx\\LavaWave",
        -- "Fx\\LavaWaveB",
        -- "Fx\\LavaWaveC",
        -- "Fx\\LavaWaveD",
        -- "Fx\\LavaRippleA",
        -- "Fx\\LavaRippleB",
        -- "Fx\\LavaPuddleIn",
        -- "Fx\\LavaPuddleOut",
        -- "Fx\\LavaGoopStep",
        -- "Fx\\LavaFire",
        -- "Fx\\LavaEmbers",
        -- "Fx\\LavaBubble",
        -- "Fx\\LavaJellyCollapse",
        -- "Fx\\LavaMoundA",
        -- "Fx\\LavaMoundB",
        -- "Fx\\LavaMoundD",
        -- "Fx\\Asphodel_Stalagmite04TransitionA",
        -- "Fx\\Asphodel_Stalagmite04TransitionB",
        -- "Fx\\Asphodel_Stalagmite04TransitionC",
        -- "Fx\\AsphodelSkullDeath",
        -- "Fx\\Asphodel_Stalagmite_05_Disintegrate",
        -- "Fx\\Asphodel_Pillar06TransitionA",
        -- "Fx\\Asphodel_Pillar06TransitionB",
        -- "Fx\\Asphodel_Pillar06TransitionC",
        -- "Fx\\LavaSplashProjectileHead",
        -- "Fx\\LavaSplashProjectileTailA",
        -- "Fx\\LavaSplashProjectileTailB",
        -- "Fx\\LavaSplashProjectileTailC",
        -- "Fx\\LavaSplashProjectileTailD",
        -- "Fx\\SmokeTrapLoop",
        -- "Fx\\HydraTouchdown",
        -- "Fx\\HydraHeadLavaPop",
        -- "Fx\\HydraRoarPiece",
        -- "Fx\\HydraTooth",
        -- "Fx\\HydraToothSmokeBright",
        -- "Fx\\AshFootstep",
        -- "Fx\\SoulFlowA",
        -- "Fx\\SoulFlowB",
        -- "Fx\\CrusherUnitSlamRing",
        -- "Screens\\BiomeMap\\BiomeMapTraversalBtoC",
        -- "Fx\\HydraToothSmokeDark",
        -- "Fx\\HydraBubble",
        -- "Fx\\HydraBaseDeath",
        -- "Fx\\MurderBoatGate",
      },
    },
  }
}

local mapGroupsFile = rom.path.combine(rom.paths.Content, 'Game/MapGroups.sjson')

sjson.hook(mapGroupsFile, function(data)
  for _, newValue in ipairs(newMapGroups) do
    table.insert(data.MapGroups, sjson.to_object(newValue, order))
  end
end)
