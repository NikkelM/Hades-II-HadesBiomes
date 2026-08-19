local config = {
  enabled = true,
  gameplay = {
    z_ExcludeFromDreamDives = false,
    z_HideElysiumPoisonMessage = false,
  },
  accessibility = {
    z_GoddessMode = false,
    z_FadeToBlackEnteringHades = false,
  },
  speedrunning = {
    z_SpeedrunForceTwoSack = false,
    z_SpeedrunSkipOpeningThanatos = false,
    z_SpeedrunFreshFileZagreusJourneyRun = false,
    z_LongMinibossEncounters = {
      z_SpeedrunDisableLongMinibossEncounters = false,
      z_SpeedrunDisableBargeOfDeath = false,
      z_SpeedrunDisableAsterius = false,
      z_SpeedrunDisableTinyVermin = false,
    },
  },
  debugging = {
    hadesGameFolder = "root",
    logLevel = 4,
    enableVanillaDebugPrint = false,
    firstTimeSetup = true,
    uninstall = false,
  },
}

local configDesc = {
  enabled =
  "Whether the mod is enabled or not. Do not disable this while in a Zagreus' Journey run or region!",
  gameplay = {
    z_ExcludeFromDreamDives = "If enabled, Tartarus, Asphodel, Elysium and Styx will NOT appear in Dream Dives.",
    z_HideElysiumPoisonMessage =
    "If enabled, the \"Poison will wear off automatically!\" message that appears when poisoned in Elysium will not be shown.",
  },
  accessibility = {
    z_GoddessMode =
    "If enabled, enemy health and armour scaling added by the mod will be disabled. Enemies will have 30-45% less health and 10-20% less armour. Note that this significantly changes the balancing of the mod.",
    z_FadeToBlackEnteringHades =
    "If enabled, exiting the Temple of Styx towards Hades' chamber will fade the screen to black instead of white.",
  },
  speedrunning = {
    z_SpeedrunForceTwoSack = "If enabled, the Satyr Sack in Styx will always spawn in the second wing you visit.",
    z_SpeedrunSkipOpeningThanatos =
    "If enabled, the reward in the first room of the run will always spawn immediately and allow skipping dialogue with Thanatos, even if he has a unique dialogue queued.",
    z_SpeedrunFreshFileZagreusJourneyRun =
    "If enabled, starting a fresh save file will force the first run to be a Zagreus' Journey run. This will follow all rules of a classic fresh file run. It may break some progression past the first run, so is only recommended for Fresh File speedrun attempts, not actual main save files.",
    z_LongMinibossEncounters = {
      z_SpeedrunDisableLongMinibossEncounters =
      "If enabled, all of the miniboss encounters in this group will never appear, no matter their individual settings.",
      z_SpeedrunDisableBargeOfDeath =
      "If enabled, the Barge of Death miniboss in Asphodel will never appear.",
      z_SpeedrunDisableAsterius =
      "If enabled, the Asterius miniboss in Elysium will never appear.",
      z_SpeedrunDisableTinyVermin =
      "If enabled, the Tiny Vermin miniboss in Styx will never appear.",
    },
  },
  debugging = {
    hadesGameFolder =
    "The path to the Hades game folder. When set to \"root\", resolves to the \"Hades\" directory in the same parent directory as your Hades II installation. Leave this at \"root\" if you have both games installed through the same store and on the same drive. Otherwise, set to the full path of your Hades installation, e.g. C:\\Program Files (x86)\\Steam\\steamapps\\common\\Hades for Steam, C:\\Program Files (x86)\\Epic Games\\Games\\Hades for Epic Games or C:\\Xbox\\Hades for the Microsoft Store.",
    logLevel =
    "What kinds of logs should be printed to the console, inclusive all previous log levels. Set a higher level to see more detailed logs. Set to one of: Off/No logs (0), Errors (1), Warnings (2), Info (3), Debug (4)",
    enableVanillaDebugPrint =
    "If enabled, the mod will also log vanilla debug events. Enable this if asked to by the developer.",
    firstTimeSetup =
    "If enabled, the mod will copy required files from the Hades installation path to the mod installation directory when the game is restarted. These files will be removed if you later uninstall the mod. After installation, this is automatically disabled. You normally do not need to change this yourself. Only enable this when you want to manually re-install the mod.",
    uninstall =
    "[Deprecated - you should no longer need to use this] Enable this and restart the game to uninstall the mod, which removes files that were copied copied from your Hades installation path to the mod installation directory. Uninstalling the mod in the mod manager has the same effect. To re-install, enable both \"uninstall\" and \"firstTimeSetup\". If \"firstTimeSetup\" is not also enabled, the mod will be disabled after uninstalling.",
  },
}

return config, configDesc
