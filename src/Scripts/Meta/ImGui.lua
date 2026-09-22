local windowName = "Zagreus' Journey Settings"
local configDescriptions = mod.ConfigDescriptions

local logLevelNames = {
	[0] = "Off",
	[1] = "Errors",
	[2] = "Warnings",
	[3] = "Info",
	[4] = "Debug",
}

local function drawTooltip(description)
	if description == nil or rom.ImGui.IsItemHovered == nil or rom.ImGui.BeginTooltip == nil or rom.ImGui.EndTooltip == nil then
		return
	end

	if rom.ImGui.IsItemHovered() then
		rom.ImGui.SetNextWindowSize(420, 0)
		rom.ImGui.BeginTooltip()
		rom.ImGui.TextWrapped(description)
		rom.ImGui.EndTooltip()
	end
end

local function drawCheckbox(label, configGroup, key, description, onChanged)
	local value, changed = rom.ImGui.Checkbox(label, configGroup[key])
	drawTooltip(description)
	if changed then
		configGroup[key] = value
		if onChanged then
			onChanged(value)
		end
	end
end

local function drawWarning(text)
	rom.ImGui.PushStyleColor(rom.ImGuiCol.Text, 1.0, 0.45, 0.15, 1.0)
	rom.ImGui.TextWrapped(text)
	rom.ImGui.PopStyleColor(1)
end

local function drawGameplaySettings()
	if not rom.ImGui.CollapsingHeader("Gameplay", rom.ImGuiTreeNodeFlags.DefaultOpen) then
		return
	end

	drawCheckbox("Exclude Zagreus' Journey biomes from Dream Dives", config.gameplay,
		"z_ExcludeFromDreamDives", configDescriptions.gameplay.z_ExcludeFromDreamDives, function()
			if mod.ApplyDreamDiveExclusionConfig then
				mod.ApplyDreamDiveExclusionConfig()
			end
		end)
end

local function drawAccessibilitySettings()
	if not rom.ImGui.CollapsingHeader("Accessibility", rom.ImGuiTreeNodeFlags.DefaultOpen) then
		return
	end

	drawCheckbox("Goddess Mode", config.accessibility, "z_GoddessMode",
		configDescriptions.accessibility.z_GoddessMode, function()
			if mod.ApplyGoddessModeConfig then
				mod.ApplyGoddessModeConfig()
			end
		end)
	rom.ImGui.TextWrapped("Disables the additional enemy health and armour scaling added by the mod.")

	drawCheckbox("Fade to black when entering Hades' chamber", config.accessibility,
		"z_FadeToBlackEnteringHades", configDescriptions.accessibility.z_FadeToBlackEnteringHades, function()
			if mod.ApplyExitToHadesFadeColourConfig then
				mod.ApplyExitToHadesFadeColourConfig()
			end
		end)
end

local function drawSpeedrunningSettings()
	if not rom.ImGui.CollapsingHeader("Speedrunning") then
		return
	end

	drawCheckbox("Force the Satyr Sack in the second Styx wing", config.speedrunning,
		"z_SpeedrunForceTwoSack", configDescriptions.speedrunning.z_SpeedrunForceTwoSack)
	drawCheckbox("Allow skipping the opening Thanatos conversation", config.speedrunning,
		"z_SpeedrunSkipOpeningThanatos", configDescriptions.speedrunning.z_SpeedrunSkipOpeningThanatos)
	drawCheckbox("Force a Zagreus' Journey run on a fresh save file", config.speedrunning,
		"z_SpeedrunFreshFileZagreusJourneyRun", configDescriptions.speedrunning.z_SpeedrunFreshFileZagreusJourneyRun)

	rom.ImGui.Separator()
	drawCheckbox("Disable all \"long\" miniboss encounters", config.speedrunning.z_LongMinibossEncounters,
		"z_SpeedrunDisableLongMinibossEncounters",
		configDescriptions.speedrunning.z_LongMinibossEncounters.z_SpeedrunDisableLongMinibossEncounters)

	rom.ImGui.Indent(20)
	rom.ImGui.BeginDisabled(config.speedrunning.z_LongMinibossEncounters.z_SpeedrunDisableLongMinibossEncounters)
	drawCheckbox("Disable Barge of Death", config.speedrunning.z_LongMinibossEncounters,
		"z_SpeedrunDisableBargeOfDeath",
		configDescriptions.speedrunning.z_LongMinibossEncounters.z_SpeedrunDisableBargeOfDeath)
	drawCheckbox("Disable Asterius", config.speedrunning.z_LongMinibossEncounters,
		"z_SpeedrunDisableAsterius",
		configDescriptions.speedrunning.z_LongMinibossEncounters.z_SpeedrunDisableAsterius)
	drawCheckbox("Disable Tiny Vermin", config.speedrunning.z_LongMinibossEncounters,
		"z_SpeedrunDisableTinyVermin",
		configDescriptions.speedrunning.z_LongMinibossEncounters.z_SpeedrunDisableTinyVermin)
	rom.ImGui.EndDisabled()
	rom.ImGui.Unindent(20)
end

local function drawCheatSettings()
	if not rom.ImGui.CollapsingHeader("Cheats") then
		return
	end

	rom.ImGui.PushStyleColor(rom.ImGuiCol.Text, 1.0, 0.3, 0.2, 1.0)
	rom.ImGui.TextWrapped(
		"Reload your current save for these settings to take effect. NOT REVERSIBLE: This content stays unlocked even if you disable these settings later.")
	rom.ImGui.PopStyleColor(1)

	drawCheckbox("Unlock all Zagreus' Journey gameplay incantations", config.cheats,
		"z_UnlockGameplayIncantations", configDescriptions.cheats.z_UnlockGameplayIncantations)
	drawCheckbox("Unlock all Zagreus' Journey cosmetics", config.cheats,
		"z_UnlockAllCosmetics", configDescriptions.cheats.z_UnlockAllCosmetics)
end

local function drawLogLevel()
	local currentName = logLevelNames[config.debugging.logLevel] or tostring(config.debugging.logLevel)
	local comboOpen = rom.ImGui.BeginCombo("Log level", currentName)
	drawTooltip(configDescriptions.debugging.logLevel)

	if comboOpen then
		for level = 0, 4 do
			local selected = config.debugging.logLevel == level
			if rom.ImGui.Selectable(logLevelNames[level], selected) then
				config.debugging.logLevel = level
			end
			if selected then
				rom.ImGui.SetItemDefaultFocus()
			end
		end
		rom.ImGui.EndCombo()
	end
end

local function drawDebuggingSettings()
	if not rom.ImGui.CollapsingHeader("Debugging") then
		return
	end

	drawLogLevel()
	drawCheckbox("Log vanilla debug events", config.debugging,
		"enableVanillaDebugPrint", configDescriptions.debugging.enableVanillaDebugPrint)
	rom.ImGui.Separator()

	drawWarning("Settings in this section require a full game restart!")

	rom.ImGui.Text("Hades game folder")
	local folder, changed = rom.ImGui.InputText("###hadesGameFolder", config.debugging.hadesGameFolder or "", 512)
	drawTooltip(configDescriptions.debugging.hadesGameFolder)
	if changed and folder ~= config.debugging.hadesGameFolder then
		config.debugging.hadesGameFolder = folder
	end
	rom.ImGui.TextWrapped(
		"\"root\" means Hades and Hades II are installed under the same parent folder. See below for default install paths:")
	rom.ImGui.TextWrapped("Steam: C:\\Program Files (x86)\\Steam\\steamapps\\common\\Hades")
	rom.ImGui.TextWrapped("Epic Games: C:\\Program Files (x86)\\Epic Games\\Games\\Hades")
	rom.ImGui.TextWrapped("Microsoft Store: C:\\Xbox\\Hades")

	local reinstallEnabled = config.debugging.firstTimeSetup and config.debugging.uninstall
	local reinstallValue, reinstallChanged = rom.ImGui.Checkbox("Reinstall Zagreus' Journey", reinstallEnabled)
	drawTooltip(
		"Reinstall Zagreus' Journey on the next full game restart. Do this to attempt to fix issues you're experiencing or when asked to by the developer.")
	if reinstallChanged then
		config.debugging.firstTimeSetup = reinstallValue
		config.debugging.uninstall = reinstallValue
	end
end

local function drawMenu()
	rom.ImGui.TextWrapped("Most changes apply immediately or on the next room load.")
	drawGameplaySettings()
	drawAccessibilitySettings()
	drawSpeedrunningSettings()
	drawCheatSettings()
	rom.ImGui.Separator()
	drawDebuggingSettings()
end

rom.gui.add_imgui(function()
	local windowFlags = rom.ImGuiWindowFlags and rom.ImGuiWindowFlags.AlwaysAutoResize or 0
	if rom.ImGui.Begin(windowName, windowFlags) then
		drawMenu()
		rom.ImGui.End()
	end
end)

rom.gui.add_to_menu_bar(function()
	if rom.ImGui.BeginMenu(windowName) then
		drawMenu()
		rom.ImGui.EndMenu()
	end
end)
