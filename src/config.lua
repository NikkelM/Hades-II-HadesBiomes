local config = {
  enabled = true,
  firstTimeSetup = true,
  hadesGameFolder = "root",
  uninstall = false,
  logLevel = 4,
  z_SpeedrunForceTwoSack = false,
  z_ExcludeFromDreamDives = false,
}

local configDesc = {
  enabled =
  "Whether the mod is enabled or not. MUST be \"true\" even if you want to uninstall the mod. Uninstallation will set this to \"false\" afterwards. If set to \"false\", and the most recent run was a modded Hades run, your save file will be marked as corrupted by the game. Set this to \"true\" again to validate the save file and finish the run.",
  firstTimeSetup =
  "If set to true, the mod will copy required files from the \"hadesGameFolder\" to the mod installation directory when the game is started the next time. These files will be removed if you later uninstall the mod. This process will set this variable to false afterwards. You normally do not need to change this yourself. Only set this to true when you want to manually re-install the mod. Remember to also have \"enabled\" set to true.",
  uninstall =
  "[Deprecated - you should no longer need to use this] Set this to \"true\" and start the game to uninstall the mod, which removes files copied from the \"hadesGameFolder\" from the mod installation directory. Uninstalling the mod in the mod manager has the same effect. To re-install, set both \"uninstall\" and \"firstTimeSetup\" to true. If \"firstTimeSetup\" is not also set to \"true\", \"enabled\" will be set to false after uninstalling.",
  hadesGameFolder =
  "The path to the Hades game folder. When set to \"root\", resolves to the \"Hades\" directory in the same parent directory as your Hades II installation. I.e., leave like this if you have both games installed through the same store and on the same drive. Otherwise, set to the full path of your Hades installation, e.g. C:\\Program Files (x86)\\Steam\\steamapps\\common\\Hades for Steam, C:\\Program Files (x86)\\Epic Games\\Games\\Hades for Epic Games or C:\\Xbox\\Hades for the Microsoft Store.",
  logLevel =
  "What kinds of logs should be printed to the console. Set a higher level to see more detailed logs. Set to one of: 0 = Off/No logs, 1 = Errors, 2 = Warnings, 3 = Info, 4 = Debug",
  z_SpeedrunForceTwoSack = "If set to \"true\", the Satyr Sack in Styx will always spawn in the second room.",
  z_ExcludeFromDreamDives = "If set to \"true\", Tartarus, Asphodel, Elysium and Styx will *not* appear in Dream Dives.",
}

return config, configDesc
