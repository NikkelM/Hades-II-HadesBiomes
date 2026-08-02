---@meta NikkelM-Zagreus_Journey
local public = {}

---@type table The mod's configuration table, accessible by other mods.
public.config = {}

---@type boolean Whether the mod has been installed successfully and is active.
public.IsValidInstallation = false

--- Returns whether the mod is both enabled in the config and the installation is valid.
---@return boolean isEnabledAndValid True only if the mod is enabled and the installation is valid.
function public.IsModEnabledAndInstallationValid() end

--- Returns the current value of a given config leaf key, or nil if the key does not exist or the mod is not enabled or the installation is invalid.
--- This allows to check for a config key no matter where in the mod config it lives.
---@param leafKey string The config key to check. Only pass the leaf key value, e.g. to get the value of config.gameplay.z_ExcludeFromDreamDives, pass "z_ExcludeFromDreamDives".
---@return any keyValue The current value of this key, or nil if the key does not exist or the mod is not enabled or the installation is invalid.
function public.GetModConfigValueByLeafKey(leafKey) end

return public
