local config = {
  version = 0;
  enabled = true;
  firstTimeSetup = true;
  hadesGameFolder = "root";
  uninstall = false;
}

local configDesc = {
  enabled = "Whether the mod is enabled or not.";
  firstTimeSetup = "If set to true, the mod will make required file associations and moves from the \"hadesGameFolder\" to your Hades II installation when the game is started the next time. This process will set this variable to false afterwards. Only set this to true after a breaking update or when re-installing.";
  uninstall = "Set this to true and start the game once to run uninstall steps, which removes files copied and associated to Hades. Do this before uninstalling the mod through r2modman to avoid loose files staying behind. To re-install, set both \"uninstall\" and \"firstTimeSetup\" to true.";
  hadesGameFolder = "The path to the Hades game folder. When set to \"root\", resolves to the \"Hades\" directory in the same parent directory as your Hades II installation. I.e., leave like this if you have both games installed through Steam.";
}

return config, configDesc