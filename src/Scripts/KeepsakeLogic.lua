local assistFrameScale = 1.0
local assistSelectedFrameScaleX = 0.72
local assistSelectedFrameScaleY = 0.66
local assistSelectedFrameOffsetY = -20
local assistGridStartX = 1570
local assistGridStartY = 220
local assistGridSpacerX = 150
local assistGridSpacerY = 185
local assistIconOffsetY = -12
local assistTooltipX = 1250
local assistTooltipY = 110
local assistUpgradePulseThreadName = "ModsNikkelMHadesBiomesAssistUpgradePulse"

-- #region Assist progression
local function getAssistUpgradeCost(traitName)
	return game.TraitData[traitName].ModsNikkelMHadesBiomesUpgradeCosts[mod.GetAssistKeepsakeLevel(traitName)]
end

local function clearAssistUpgradeCostDisplay(screen)
	if screen.CostIds ~= nil then
		SetAlpha({ Ids = screen.CostIds, Fraction = 0, Duration = 0.1 })
		DestroyTextBox({ Ids = screen.CostIds })
		Destroy({ Ids = screen.CostIds })
		screen.CostIds = nil
	end

	screen.ModsNikkelMHadesBiomesAssistUpgradeCost = nil
end

local function updateAssistButtonTraitData(button)
	local traitName = button.Data.Gift
	local level = mod.GetAssistKeepsakeLevel(traitName)
	local traitData
	if game.HeroHasTrait(traitName) then
		traitData = game.GetHeroTrait(traitName)
	else
		traitData = game.GetProcessedTraitData({
			Unit = game.CurrentRun.Hero,
			TraitName = traitName,
			Rarity = game.GetRarityKey(level, game.TraitRarityData.TalentRarityUpgradeOrder),
		})
	end

	for _, data in ipairs(traitData.SignOffData) do
		if game.SessionState.AllKeepsakeUnlocked or data.GameStateRequirements == nil or game.IsGameStateEligible(traitData, data.GameStateRequirements) then
			traitData.SignoffText = data.Text
			break
		end
	end

	game.ExtractValues(game.CurrentRun.Hero, traitData, traitData)
	button.TraitData = traitData
	button.Data.Level = level
	ModifyTextBox({
		Id = button.Id,
		Text = game.GetTraitTooltip(traitData),
		UseDescription = true,
		LuaKey = "TooltipData",
		LuaValue = traitData,
	})
	SetAnimation({
		Name = button.Screen.RankAnimations[level],
		DestinationId = button.Screen.Components[button.ButtonKey .. "Rank"].Id,
	})
end

local function cancelAssistUpgradePulse(screen)
	screen.ModsNikkelMHadesBiomesAssistUpgradePulseGeneration = (screen.ModsNikkelMHadesBiomesAssistUpgradePulseGeneration or 0) +
			1
	game.killTaggedThreads(assistUpgradePulseThreadName)
end

local function pulseAssistUpgradeButton(screen, button, traitName, generation)
	game.waitUnmodified(1.0)
	while true do
		local selectedTrait = screen.SelectedButton and screen.SelectedButton.Data and screen.SelectedButton.Data.Gift
		if not screen.KeepOpen or not button.Visible or selectedTrait ~= traitName or screen.ModsNikkelMHadesBiomesAssistUpgradePulseGeneration ~= generation then
			return
		end
		CreateAnimation({
			Name = "SkillProcFeedbackFx",
			DestinationId = button.Id,
			GroupName = "ScreenOverlay",
			OffsetX = -150,
		})
		PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteExcitementShort", Id = button.Id })
		Flash({
			Id = button.Id,
			Speed = 2,
			MinFraction = 0.4,
			MaxFraction = 1,
			Color = game.Color.BoonPatchRare,
			Duration = 0.3,
			ExpireAfterCycle = true,
		})
		game.PulseText({
			Id = button.Id,
			Color = game.Color.BoonPatchRare,
			ThreadName = assistUpgradePulseThreadName,
			OriginalColor = game.Color.ContextActionLabel,
			ScaleTarget = 1.25,
			ScaleDuration = 0.2,
			HoldDuration = 0.1,
			StartColorDuration = 0.1,
			EndColorDuration = 2,
			ResetDuration = 4.0,
		})
		game.waitUnmodified(5.0)
	end
end

local function startAssistUpgradePulse(screen, button)
	local upgradeCost = getAssistUpgradeCost(button.Data.Gift)
	cancelAssistUpgradePulse(screen)

	if upgradeCost == nil or not game.HasResources(upgradeCost) then
		return
	end

	local generation = screen.ModsNikkelMHadesBiomesAssistUpgradePulseGeneration
	game.thread(pulseAssistUpgradeButton, screen, screen.Components.SaveFirstButton, button.Data.Gift, generation)
end

modutil.mod.Path.Wrap("GetKeepsakeLevel", function(base, traitName, unmodified)
	-- Normal keepsake
	if game.TraitData[traitName].Slot ~= "Assist" then
		return base(traitName, unmodified)
	end

	-- Companion
	if not unmodified and game.HeroHasTrait(traitName) then
		local traitData = game.GetHeroTrait(traitName)
		if traitData.Rarity ~= nil then
			return game.GetRarityValue(traitData.Rarity)
		end
	end

	return mod.GetAssistKeepsakeLevel(traitName)
end)

modutil.mod.Path.Wrap("IsKeepsakeMaxed", function(base, traitName)
	if game.TraitData[traitName].Slot == "Assist" then
		return mod.GetAssistKeepsakeLevel(traitName) >= 5
	end

	return base(traitName)
end)
-- #endregion

-- #region Assist equipment
function mod.EquipAssist(heroUnit, traitName, args)
	local unit = heroUnit or game.CurrentRun.Hero
	args = args or {}
	traitName = traitName or game.GameState.LastAssistTrait
	if traitName == nil or game.HeroHasTrait(traitName) then
		return
	end

	local traitData = game.AddTrait(unit, traitName,
		game.GetRarityKey(mod.GetAssistKeepsakeLevel(traitName), game.TraitRarityData.TalentRarityUpgradeOrder), args)
	if traitData == nil then
		return
	end

	if not game.CurrentRun.Hero.IsDead then
		game.CurrentRun.TraitCache[traitName] = game.CurrentRun.TraitCache[traitName] or 1
	end
end

function mod.UpdateAssistEquippedFrame(screen)
	local button = screen.ModsNikkelMHadesBiomesAssistButtons[game.GameState.LastAssistTrait]
	local visible = button ~= nil

	if visible then
		SetAlpha({
			Id = screen.Components.ModsNikkelMHadesBiomesAssistEquippedFrame.Id,
			Fraction = 1,
			Duration = 0.2,
		})
		Teleport({
			Id = screen.Components.ModsNikkelMHadesBiomesAssistEquippedFrame.Id,
			DestinationId = button.FrameId,
			OffsetY = assistSelectedFrameOffsetY,
		})
		SetScaleX({
			Id = screen.Components.ModsNikkelMHadesBiomesAssistEquippedFrame.Id,
			Fraction = assistSelectedFrameScaleX,
			Duration = 0,
		})
		SetScaleY({
			Id = screen.Components.ModsNikkelMHadesBiomesAssistEquippedFrame.Id,
			Fraction = assistSelectedFrameScaleY,
			Duration = 0,
		})
	else
		SetAlpha({
			Id = screen.Components.ModsNikkelMHadesBiomesAssistEquippedFrame.Id,
			Fraction = 0,
			Duration = 0.1,
		})
	end
end

-- #endregion

-- #region Rack construction
local function createAssistHitbox(screen, components, buttonKey, visualButton, x, y)
	local button = CreateScreenComponent({
		Name = "ModsNikkelMHadesBiomesAssistSlotButton",
		X = x,
		Y = y,
		Group = "Combat_Menu_Overlay",
	})
	SetAnimation({ Name = "Blank", DestinationId = button.Id })

	button.LevelProgressId = visualButton.LevelProgressId
	button.Data = visualButton.Data
	button.ButtonKey = visualButton.ButtonKey
	button.FrameId = visualButton.FrameId
	button.TraitData = visualButton.TraitData
	button.BarFillId = visualButton.BarFillId
	button.BarId = visualButton.BarId
	button.NewIcon = visualButton.NewIcon
	button.Blocked = visualButton.Blocked
	button.Screen = screen
	button.ModsNikkelMHadesBiomesVisualId = visualButton.Id

	visualButton.OnPressedFunctionName = nil
	visualButton.OnMouseOverFunctionName = nil
	visualButton.OnMouseOffFunctionName = nil
	SetInteractProperty({ DestinationId = visualButton.Id, Property = "FreeFormSelectable", Value = false })
	UseableOff({ Id = visualButton.Id })
	screen[visualButton.Id] = nil

	components[buttonKey .. "Icon"] = visualButton
	components[buttonKey] = button
	screen[button.Id] = button
	CreateTextBox({
		Id = button.Id,
		Text = game.GetTraitTooltip(button.TraitData),
		UseDescription = true,
		Color = game.Color.Transparent,
		LuaKey = "TooltipData",
		LuaValue = button.TraitData,
	})

	return button
end

local function createUnlockedAssistIcon(screen, components, createKeepsakeIcon, index, itemData, x, y)
	local assistRankOffsetY = -2
	local assistBackingScale = 0.75
	local assistButtonKeyAppend = "Assist"
	local traitData = game.TraitData[itemData.Gift]
	local iconScale = traitData.ModsNikkelMHadesBiomesCabinetIconScale
	local buttonKey = "UpgradeToggle" .. index .. assistButtonKeyAppend
	components[buttonKey .. "StaticBacking"] = CreateScreenComponent({
		Name = "BlankObstacle",
		Animation = "Keepsake_BackingMenu",
		Scale = assistBackingScale,
		X = x,
		Y = y + assistIconOffsetY + 10,
		Group = "Combat_Menu_Overlay",
		Alpha = 0,
		AlphaTarget = 1,
		AlphaTargetDuration = 0.15,
	})
	createKeepsakeIcon(screen, components, {
		Index = index,
		KeyAppend = assistButtonKeyAppend,
		UpgradeData = itemData,
		X = x,
		Y = y,
		Scale = assistFrameScale,
	})

	local visualButton = components[buttonKey]
	-- We don't want to add the max-bond sticker to the top-right, as it looks weird on companions
	local stickerKey = visualButton.ButtonKey .. "Sticker"
	if components[stickerKey] ~= nil then
		Destroy({ Id = components[stickerKey].Id })
		components[stickerKey] = nil
		SetAnimation({ Name = "Keepsake_BackingMenu", DestinationId = visualButton.FrameId })
	end
	SetAlpha({ Id = visualButton.FrameId, Fraction = 0, Duration = 0 })
	SetScale({ Id = visualButton.Id, Fraction = iconScale })
	Teleport({ Id = visualButton.Id, OffsetX = x, OffsetY = y + assistIconOffsetY })

	local button = createAssistHitbox(screen, components, buttonKey, visualButton, x, y)
	button.OnPressedFunctionName = _PLUGIN.guid .. "." .. "HandleAssistToggle"
	button.OnMouseOverFunctionName = _PLUGIN.guid .. "." .. "MouseOverAssist"
	button.OnMouseOffFunctionName = _PLUGIN.guid .. "." .. "MouseOffAssist"
	button.ModsNikkelMHadesBiomesBaseScale = iconScale
	updateAssistButtonTraitData(button)
	Teleport({
		Id = components[button.ButtonKey .. "Rank"].Id,
		OffsetX = x,
		OffsetY = y + screen.RankOffsetY + assistRankOffsetY,
	})
	SetInteractProperty({
		DestinationId = button.Id,
		Property = "TooltipX",
		Value = assistTooltipX + game.ScreenCenterNativeOffsetX,
	})
	SetInteractProperty({
		DestinationId = button.Id,
		Property = "TooltipY",
		Value = assistTooltipY + game.ScreenCenterNativeOffsetY,
	})
	screen.ModsNikkelMHadesBiomesAssistButtons[itemData.Gift] = button
end

local function createLockedAssistIcon(screen, components, index, traitName, x, y)
	local assistLockedIconScaleX = 150 / 196
	local assistLockedIconScaleY = 185 / 246
	local buttonKey = "ModsNikkelMHadesBiomesAssistLocked" .. index
	components[buttonKey .. "Frame"] = CreateScreenComponent({
		Name = "BlankObstacle",
		Animation = "Keepsake_BackingMenu",
		Scale = assistFrameScale,
		X = x,
		Y = y + 10,
		Group = "Combat_Menu_Overlay_Backing",
		Alpha = 0,
		AlphaTarget = 1,
		AlphaTargetDuration = 0.15,
	})
	components[buttonKey] = CreateScreenComponent({
		Name = "ModsNikkelMHadesBiomesAssistSlotButton",
		X = x,
		Y = y,
		Group = "Combat_Menu_Overlay",
	})
	components[buttonKey .. "Icon"] = CreateScreenComponent({
		Name = "BlankObstacle",
		X = x,
		Y = y,
		Group = "Combat_Menu_Overlay",
		Alpha = 0,
		AlphaTarget = 1,
		AlphaTargetDuration = 0.15,
	})

	local button = components[buttonKey]
	button.Data = {
		Gift = traitName,
		Unlocked = false,
	}
	button.Blocked = true
	button.ButtonKey = buttonKey
	button.FrameId = components[buttonKey .. "Frame"].Id
	button.ModsNikkelMHadesBiomesVisualId = components[buttonKey .. "Icon"].Id
	button.OnMouseOverFunctionName = _PLUGIN.guid .. "." .. "MouseOverLockedAssist"
	button.OnMouseOffFunctionName = _PLUGIN.guid .. "." .. "MouseOffLockedAssist"
	button.Screen = screen
	screen[button.Id] = button
	SetAnimation({ Name = "Blank", DestinationId = button.Id })
	SetAnimation({ Name = "Keepsake_Legendary_Locked", DestinationId = button.ModsNikkelMHadesBiomesVisualId })
	SetScaleX({ Id = button.ModsNikkelMHadesBiomesVisualId, Fraction = assistLockedIconScaleX, Duration = 0 })
	SetScaleY({ Id = button.ModsNikkelMHadesBiomesVisualId, Fraction = assistLockedIconScaleY, Duration = 0 })
	local hasUnlockedAssist = game.ContainsAnyKey(game.GameState.GiftPresentation, mod.AssistTraitNames)
	local lockedTooltipText
	if traitName == nil then
		lockedTooltipText = "UnknownLegendaryAward_Hidden"
	else
		lockedTooltipText = hasUnlockedAssist and "UnknownLegendaryAward" or "UnknownLegendaryAward_Hidden"
	end
	CreateTextBox({
		Id = button.Id,
		Text = "{$Keywords." .. lockedTooltipText .. "}",
		Color = game.Color.Transparent,
	})
	SetInteractProperty({
		DestinationId = button.Id,
		Property = "TooltipX",
		Value = assistTooltipX + game.ScreenCenterNativeOffsetX,
	})
	SetInteractProperty({
		DestinationId = button.Id,
		Property = "TooltipY",
		Value = assistTooltipY + game.ScreenCenterNativeOffsetY,
	})
end

local function createAssistRack(screen, components, createKeepsakeIcon)
	screen.LastAssist = game.GameState.LastAssistTrait
	screen.ModsNikkelMHadesBiomesAssistButtons = {}
	components.ModsNikkelMHadesBiomesAssistRackBackground = CreateScreenComponent({
		Name = "BlankObstacle",
		Animation = "ModsNikkelMHadesBiomesCompanionRackBackground",
		X = assistGridStartX + assistGridSpacerX / 2 + game.ScreenCenterNativeOffsetX,
		Y = assistGridStartY + assistGridSpacerY + game.ScreenCenterNativeOffsetY,
		Group = "Combat_Menu_Overlay",
		Alpha = 0,
		AlphaTarget = 1,
		AlphaTargetDuration = 0.15,
	})

	for index = 1, 6 do
		local traitName = mod.AssistTraitNames[index]
		local x = assistGridStartX + ((index - 1) % 2) * assistGridSpacerX + game.ScreenCenterNativeOffsetX
		local y = assistGridStartY + math.floor((index - 1) / 2) * assistGridSpacerY + game.ScreenCenterNativeOffsetY
		if traitName ~= nil then
			local keepsakeData = game.GetKeepsakeData(traitName)
			local unlocked = game.SessionState.AllKeepsakeUnlocked or
					game.IsGameStateEligible(keepsakeData.GiftLevelData, keepsakeData.GiftLevelData.GameStateRequirements)

			if unlocked then
				local itemData = {
					New = game.GameState.NewKeepsakeItem[traitName],
					Gift = traitName,
					Level = 1,
					NPC = keepsakeData.NPCName,
					Unlocked = true,
				}
				createUnlockedAssistIcon(screen, components, createKeepsakeIcon, index, itemData, x, y)
			else
				createLockedAssistIcon(screen, components, index, traitName, x, y)
			end
		else
			createLockedAssistIcon(screen, components, index, traitName, x, y)
		end
	end

	mod.UpdateAssistEquippedFrame(screen)
end
-- #endregion

-- #region Rack interactions
function mod.MouseOverLockedAssist(button)
	local screen = button.Screen
	screen.SelectedButton = nil
	SetAlpha({ Id = screen.Components.HoverFrame.Id, Fraction = 0, Duration = 0 })
	if button.Data.Gift ~= nil then
		game.KeepsakeScreenUpdateActionBar(screen, button)
	else
		game.KeepsakeScreenUpdateActionBar(screen)
	end
	PlaySound({ Name = "/SFX/Menu Sounds/MirrorMenuToggleKeepsakes", Id = button.Id })

	local hoverFrame = screen.Components.ModsNikkelMHadesBiomesAssistHoverFrame
	Teleport({
		Id = hoverFrame.Id,
		DestinationId = button.ModsNikkelMHadesBiomesVisualId,
		OffsetY = -24,
	})
	SetAnimation({
		Name = "ModsNikkelMHadesBiomesLegendaryAwardMenuCursorHighlight",
		DestinationId = hoverFrame.Id,
	})
	SetScaleX({
		Id = hoverFrame.Id,
		Fraction = 0.78,
		Duration = 0,
	})
	SetScaleY({
		Id = hoverFrame.Id,
		Fraction = 0.74,
		Duration = 0,
	})
	SetAlpha({ Id = hoverFrame.Id, Fraction = 1, Duration = 0 })
end

function mod.MouseOffLockedAssist(button)
	local screen = button.Screen
	SetAlpha({ Id = screen.Components.ModsNikkelMHadesBiomesAssistHoverFrame.Id, Fraction = 0, Duration = 0 })
	game.KeepsakeScreenUpdateActionBar(screen)
end

function mod.MouseOverAssist(button)
	game.MouseOverKeepsake(button)

	local screen = button.Screen
	local traitUses = button.TraitData.ExtractData.TooltipKeepsakeUses
	if getAssistUpgradeCost(button.Data.Gift) ~= nil then
		ModifyTextBox({
			Id = button.LevelProgressId,
			Text = "ModsNikkelMHadesBiomes_AssistLevelProgress",
			LuaKey = "TempTextData",
			LuaValue = {
				TraitUses = traitUses,
			},
		})
	else
		ModifyTextBox({
			Id = button.LevelProgressId,
			Text = "ModsNikkelMHadesBiomes_AssistLevelProgressMax",
			LuaKey = "TempTextData",
			LuaValue = {
				TraitUses = traitUses,
			},
		})
	end
	SetAlpha({ Id = screen.Components.HoverFrame.Id, Fraction = 0, Duration = 0 })

	local hoverFrame = screen.Components.ModsNikkelMHadesBiomesAssistHoverFrame
	Teleport({
		Id = hoverFrame.Id,
		DestinationId = button.FrameId,
		OffsetY = assistSelectedFrameOffsetY,
	})
	SetAnimation({
		Name = "ModsNikkelMHadesBiomesLegendaryMenuItemEquipped",
		DestinationId = hoverFrame.Id,
	})
	SetScale({
		Id = button.ModsNikkelMHadesBiomesVisualId,
		Fraction = button.ModsNikkelMHadesBiomesBaseScale + 0.05,
		Duration = 0.1,
		EaseIn = 0,
		EaseOut = 1,
		SkipGeometryUpdate = true,
	})
	SetScaleX({
		Id = hoverFrame.Id,
		Fraction = assistSelectedFrameScaleX,
		Duration = 0,
	})
	SetScaleY({
		Id = hoverFrame.Id,
		Fraction = assistSelectedFrameScaleY,
		Duration = 0,
	})
	SetAlpha({ Id = hoverFrame.Id, Fraction = 1, Duration = 0 })
	startAssistUpgradePulse(screen, button)
end

function mod.MouseOffAssist(button)
	game.MouseOffKeepsake(button)
	local screen = button.Screen
	SetAlpha({ Id = screen.Components.ModsNikkelMHadesBiomesAssistHoverFrame.Id, Fraction = 0, Duration = 0 })
	SetScale({
		Id = button.ModsNikkelMHadesBiomesVisualId,
		Fraction = button.ModsNikkelMHadesBiomesBaseScale,
		Duration = 0.1,
		EaseIn = 0,
		EaseOut = 1,
		SkipGeometryUpdate = true,
	})
	SetScaleX({
		Id = screen.Components.HoverFrame.Id,
		Fraction = 1,
		Duration = 0,
	})
	SetScaleY({
		Id = screen.Components.HoverFrame.Id,
		Fraction = 1,
		Duration = 0,
	})
end

-- Allow unequipping companions, unlike keepsakes
function mod.HandleAssistToggle(screen, button)
	if not button.Data.Unlocked or button.Blocked then
		return
	end

	local traitName = button.Data.Gift
	local traitData = game.TraitData[traitName]
	mod.LoadAssistSfxBanks(traitData.SfxBankNames)
	local isEquipping = game.GameState.LastAssistTrait ~= traitName
	if not isEquipping then
		game.GameState.LastAssistTrait = nil
	else
		game.GameState.LastAssistTrait = traitName
	end

	PlaySound({ Name = traitData.EquipSound or "/Leftovers/Menu Sounds/TalismanPowderDownLEGENDARY" })
	if isEquipping and traitName == "SkellyAssistTrait" then
		game.thread(game.PlayVoiceLines, game.HeroVoiceLines.ModsNikkelMHadesBiomesSkellyAssistEquipReactionVoiceLines, false)
	end
	mod.UpdateAssistEquippedFrame(screen)
	game.KeepsakeScreenUpdateActionBar(screen, button)
end

function mod.UpgradeAssist(screen, button)
	local assistButton = screen.SelectedButton
	if assistButton == nil or assistButton.Data == nil or not assistButton.Data.Unlocked or assistButton.Blocked then
		return
	end

	local traitName = assistButton.Data.Gift
	local upgradeCost = getAssistUpgradeCost(traitName)
	if upgradeCost == nil then
		return
	end

	if not game.HasResources(upgradeCost) then
		game.ScreenCantAffordPresentation(screen, button, upgradeCost)
		return
	end

	for resourceName, amount in pairs(upgradeCost) do
		game.SpendResource(resourceName, amount, traitName .. "AssistUpgrade", {
			Silent = true,
			SkipQuestStatusCheck = true,
		})
	end
	game.thread(game.CheckQuestStatus)

	game.GameState.AssistUnlocks = game.GameState.AssistUnlocks or {}
	game.IncrementTableValue(game.GameState.AssistUnlocks, traitName)
	screen.ModsNikkelMHadesBiomesAssistUpgraded = true
	if game.HeroHasTrait(traitName) then
		game.RemoveTrait(game.CurrentRun.Hero, traitName)
		mod.EquipAssist(game.CurrentRun.Hero, traitName, {
			FromLoot = true,
			SkipNewTraitHighlight = true,
		})
	end

	updateAssistButtonTraitData(assistButton)
	Flash({
		Id = assistButton.ModsNikkelMHadesBiomesVisualId,
		Speed = 4,
		MinFraction = 0.5,
		MaxFraction = 0,
		Color = game.Color.Gold,
		Duration = 0.15,
		ExpireAfterCycle = true,
	})
	CreateAnimation({
		Name = "KeepsakeLevelUpFlare",
		DestinationId = assistButton.ModsNikkelMHadesBiomesVisualId,
		GroupName = "Combat_Menu_Overlay_Additive",
		Scale = 0.5,
	})
	PlaySound({ Name = "/SFX/Menu Sounds/MirrorCloseWithUpgrade", Id = assistButton.Id })
	game.thread(game.PlayVoiceLines, game.HeroVoiceLines.AssistUpgradedVoiceLines, true, nil, {
		IsMaxAssistLevel = mod.GetAssistKeepsakeLevel(traitName) >= 5,
	})

	game.KeepsakeScreenShowInfo(screen, assistButton)
	local traitUses = assistButton.TraitData.ExtractData.TooltipKeepsakeUses
	if getAssistUpgradeCost(assistButton.Data.Gift) ~= nil then
		ModifyTextBox({
			Id = assistButton.LevelProgressId,
			Text = "ModsNikkelMHadesBiomes_AssistLevelProgress",
			LuaKey = "TempTextData",
			LuaValue = {
				TraitUses = traitUses,
			},
		})
	else
		ModifyTextBox({
			Id = assistButton.LevelProgressId,
			Text = "ModsNikkelMHadesBiomes_AssistLevelProgressMax",
			LuaKey = "TempTextData",
			LuaValue = {
				TraitUses = traitUses,
			},
		})
	end
	SetAlpha({ Id = screen.Components.HoverFrame.Id, Fraction = 0, Duration = 0 })
	SetScale({
		Id = assistButton.ModsNikkelMHadesBiomesVisualId,
		Fraction = assistButton.ModsNikkelMHadesBiomesBaseScale + 0.05,
		Duration = 0,
		SkipGeometryUpdate = true,
	})
	startAssistUpgradePulse(screen, assistButton)
end

-- #endregion

-- #region Keepsake screen integration
modutil.mod.Path.Wrap("CreateKeepsakeIcon", function(base, screen, components, args)
	local returnValue = base(screen, components, args)

	-- Only create the companion section in the Crossroads
	if game.CurrentHubRoom ~= nil and args.Index == #screen.ItemOrder then
		createAssistRack(screen, components, base)
	end

	return returnValue
end)

modutil.mod.Path.Wrap("KeepsakeScreenUpdateActionBar", function(base, screen, button)
	base(screen, button)

	local components = screen.Components
	local isAssist = button ~= nil and game.TraitData[button.Data.Gift].Slot == "Assist"
	if not isAssist then
		clearAssistUpgradeCostDisplay(screen)
		cancelAssistUpgradePulse(screen)
		components.SaveFirstButton.OnPressedFunctionName = "KeepsakeScreenSaveFirst"
		ModifyTextBox({ Id = components.SelectButton.Id, Text = "Menu_Equip" })
		return
	end

	-- This is a companion
	if game.GameState.LastAssistTrait == button.Data.Gift then
		ModifyTextBox({ Id = components.SelectButton.Id, Text = "Menu_Unequip" })
	else
		ModifyTextBox({ Id = components.SelectButton.Id, Text = "Menu_Equip" })
	end
	if button.Data.Unlocked and not button.Blocked then
		SetAlpha({ Id = components.SelectButton.Id, Fraction = 1, Duration = 0.2 })
	end

	local upgradeCost = getAssistUpgradeCost(button.Data.Gift)
	if button.Data.Unlocked and not button.Blocked and upgradeCost ~= nil then
		if screen.ModsNikkelMHadesBiomesAssistUpgradeCost ~= upgradeCost then
			clearAssistUpgradeCostDisplay(screen)
			game.AddResourceCostDisplay(screen, upgradeCost, {
				StartX = assistGridStartX + assistGridSpacerX / 2 + game.ScreenCenterNativeOffsetX,
				StartY = assistGridStartY + assistGridSpacerY * 3 + 45 + game.ScreenCenterNativeOffsetY,
				SpacerX = 160,
				ItemsPerRow = 3,
				ResourceIconScale = 0.75,
				GroupName = "Combat_Menu_Overlay",
			})
			screen.ModsNikkelMHadesBiomesAssistUpgradeCost = upgradeCost
		end
		components.SaveFirstButton.OnPressedFunctionName = _PLUGIN.guid .. "." .. "UpgradeAssist"
		components.SaveFirstButton.Visible = true
		ModifyTextBox({
			Id = components.SaveFirstButton.Id,
			-- Reuse the localized Arcana Improve label while replacing its Select icon with ItemPin
			RawText = "{IP} " ..
					game.GetDisplayName({ Text = "MetaUpgradeCard_Upgrade" }):gsub("^%{SL%}%s*", ""),
		})
		SetAlpha({ Id = components.SaveFirstButton.Id, Fraction = 1, Duration = 0.2 })
	else
		clearAssistUpgradeCostDisplay(screen)
		cancelAssistUpgradePulse(screen)
		components.SaveFirstButton.OnPressedFunctionName = "KeepsakeScreenSaveFirst"
		if button.Data.Unlocked then
			ModifyTextBox({
				Id = components.SaveFirstButton.Id,
				-- Restore Improve before hiding the button so vanilla's Prioritize text does not flash
				RawText = "{IP} " .. game.GetDisplayName({ Text = "MetaUpgradeCard_Upgrade" }):gsub("^%{SL%}%s*", ""),
			})
			components.SaveFirstButton.Visible = false
			SetAlpha({ Id = components.SaveFirstButton.Id, Fraction = 0, Duration = 0.2 })
		end
	end
end)

modutil.mod.Path.Wrap("KeepsakeScreenClose", function(base, screen, button)
	cancelAssistUpgradePulse(screen)
	local assistChanged = screen.LastAssist ~= game.GameState.LastAssistTrait
	if assistChanged then
		if screen.LastAssist ~= nil then
			game.CurrentRun.TraitCache[screen.LastAssist] = nil
		end
		game.RemoveTrait(game.CurrentRun.Hero, screen.LastAssist)
		mod.EquipAssist(game.CurrentRun.Hero, game.GameState.LastAssistTrait, {
			FromLoot = true,
		})
	end
	if (assistChanged or screen.ModsNikkelMHadesBiomesAssistUpgraded) and screen.LastTrait == game.GameState.LastAwardTrait then
		game.RequestPreRunLoadoutChangeSave()
	end

	return base(screen, button)
end)

-- #endregion

-- #region Run loadout integration

modutil.mod.Path.Wrap("EquipLastAwardTrait", function(base, eventSource, hero)
	local returnValue = base(eventSource, hero)

	mod.EquipAssist(game.CurrentRun.Hero or hero, game.GameState.LastAssistTrait, {
		SkipNewTraitHighlight = true,
	})

	return returnValue
end)

-- #endregion
