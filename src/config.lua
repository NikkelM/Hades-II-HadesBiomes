local config = {
  enabled = true,
  firstTimeSetup = true,
  hadesGameFolder = "root",
  uninstall = "false",
  logLevel = 3,
}

local configDesc = {
  enabled = "Whether the mod is enabled or not. MUST be true even if you want to uninstall the mod. Uninstallation will set this to false afterwards. If set to false, and the most recent run was a modded Hades run, your save file will be marked as corrupted by the game. Set this to true again to validate the save file and finish the run.",
  firstTimeSetup =
  "If set to true, the mod will copy required files from the \"hadesGameFolder\" and it's own data path to your Hades II installation when the game is started the next time. This process will set this variable to false afterwards. You normally do not need to change this yourself. Only set this to true when you want to manually re-install the mod. Remember to also have \"enabled\" set to true.",
  uninstall =
  "Set this to \"true\" and start the game once to run uninstall steps, which removes files copied and associated to Hades. Do this before uninstalling the mod through r2modman to avoid loose files staying behind. To re-install, set both \"uninstall\" and \"firstTimeSetup\" to true. If \"firstTimeSetup\" is not also set to true, \"enabled\" will be set to false after uninstalling.",
  hadesGameFolder =
  "The path to the Hades game folder. When set to \"root\", resolves to the \"Hades\" directory in the same parent directory as your Hades II installation. I.e., leave like this if you have both games installed through the same store and on the same drive.",
  logLevel =
  "What kinds of logs should be printed to the console. Set a higher level to see more detailed logs. Set to one of: 0 = Off/No logs, 1 = Errors, 2 = Warnings, 3 = Info, 4 = Debug",
}

return config, configDesc
