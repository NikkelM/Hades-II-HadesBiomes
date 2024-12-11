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
      -- TODO: Crashes the game if not existing
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
}

local mapGroupsFile = rom.path.combine(rom.paths.Content, 'Game/MapGroups.sjson')

sjson.hook(mapGroupsFile, function(data)
  for _, newValue in ipairs(newMapGroups) do
    table.insert(data.MapGroups, sjson.to_object(newValue, order))
  end
end)
