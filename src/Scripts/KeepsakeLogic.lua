local assistIconScale = 0.43
local assistFrameScale = 1.0
local assistSelectedFrameScaleX = 0.72
local assistSelectedFrameScaleY = 0.66
local assistSelectedFrameOffsetY = -20

function mod.EquipAssist(heroUnit, traitName, args)
	local unit = heroUnit or game.CurrentRun.Hero
	args = args or {}
	traitName = traitName or game.GameState.LastAssistTrait
	if traitName == nil or game.HeroHasTrait(traitName) then
		return
	end

	local rarity = args.ForceRarity or game.GetRarityKey(game.GetKeepsakeLevel(traitName))
	local traitData = game.AddTrait(unit, traitName, rarity, args)
	if traitData == nil then
		return
	end

	if not game.CurrentRun.Hero.IsDead then
		game.CurrentRun.TraitCache[traitName] = game.CurrentRun.TraitCache[traitName] or 1
	end

	if traitData.SpeakerNames then
		game.LoadVoiceBanks(traitData.SpeakerNames, nil, true)
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

local function createUnlockedAssistIcon(screen, components, createKeepsakeIcon, index, itemData, x, y)
	local assistTooltipX = 1250
	local assistTooltipY = 110
	local assistIconOffsetY = -12
	local assistRankOffsetY = 8
	local assistBackingScale = 0.75
	local assistButtonKeyAppend = "Assist"
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

	local button = components[buttonKey]
	-- We don't want to add the max-bond sticker to the top-right, as it looks weird on companions
	local stickerKey = button.ButtonKey .. "Sticker"
	if components[stickerKey] ~= nil then
		Destroy({ Id = components[stickerKey].Id })
		components[stickerKey] = nil
		SetAnimation({ Name = "Keepsake_BackingMenu", DestinationId = button.FrameId })
	end
	SetAlpha({ Id = button.FrameId, Fraction = 0, Duration = 0 })
	button.OnPressedFunctionName = _PLUGIN.guid .. "." .. "HandleAssistToggle"
	button.OnMouseOverFunctionName = _PLUGIN.guid .. "." .. "MouseOverAssist"
	button.OnMouseOffFunctionName = _PLUGIN.guid .. "." .. "MouseOffAssist"
	button.ModsNikkelMHadesBiomesBaseScale = assistIconScale
	SetScale({ Id = button.Id, Fraction = assistIconScale })
	Teleport({ Id = button.Id, OffsetX = x, OffsetY = y + assistIconOffsetY })
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
	local assistLockedIconScale = 0.75
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
		Name = "ButtonKeepsakeItem",
		Scale = assistLockedIconScale,
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
	button.ModsNikkelMHadesBiomesBaseScale = assistLockedIconScale
	button.OnMouseOverFunctionName = _PLUGIN.guid .. "." .. "MouseOverLockedAssist"
	button.OnMouseOffFunctionName = _PLUGIN.guid .. "." .. "MouseOffLockedAssist"
	button.Screen = screen
	screen[button.Id] = button
	SetAnimation({ Name = "Keepsake_Legendary_Locked", DestinationId = button.Id })
end

function mod.MouseOverLockedAssist(button)
	local assistLockedHoverFrameScaleX = 0.78
	local assistLockedHoverFrameScaleY = 0.74
	local screen = button.Screen
	screen.SelectedButton = nil
	SetAlpha({ Id = screen.Components.HoverFrame.Id, Fraction = 0, Duration = 0 })
	game.KeepsakeScreenUpdateActionBar(button.Screen, button)
	PlaySound({ Name = "/SFX/Menu Sounds/MirrorMenuToggleKeepsakes", Id = button.Id })

	local hoverFrame = screen.Components.ModsNikkelMHadesBiomesAssistHoverFrame
	Teleport({ Id = hoverFrame.Id, DestinationId = button.Id, OffsetY = -24 })
	SetAnimation({
		Name = "ModsNikkelMHadesBiomesLegendaryAwardMenuCursorHighlight",
		DestinationId = hoverFrame.Id,
	})
	SetScaleX({
		Id = hoverFrame.Id,
		Fraction = assistLockedHoverFrameScaleX,
		Duration = 0,
	})
	SetScaleY({
		Id = hoverFrame.Id,
		Fraction = assistLockedHoverFrameScaleY,
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
	local assistHoverIconScale = 0.48
	game.MouseOverKeepsake(button)
	local screen = button.Screen
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
		Id = button.Id,
		Fraction = assistHoverIconScale,
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
end

function mod.MouseOffAssist(button)
	game.MouseOffKeepsake(button)
	local screen = button.Screen
	SetAlpha({ Id = screen.Components.ModsNikkelMHadesBiomesAssistHoverFrame.Id, Fraction = 0, Duration = 0 })
	SetScale({
		Id = button.Id,
		Fraction = button.ModsNikkelMHadesBiomesBaseScale or assistIconScale,
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

local function createAssistRack(screen, components, createKeepsakeIcon)
	local assistGridStartX = 1570
	local assistGridStartY = 220
	local assistGridSpacerX = 150
	local assistGridSpacerY = 185
	screen.LastAssist = game.GameState.LastAssistTrait
	screen.ModsNikkelMHadesBiomesAssistButtons = {}

	local lastAssist = screen.LastAssist
	screen.LastAssist = nil
	for index, traitName in ipairs(mod.AssistTraitNames) do
		local x = assistGridStartX + ((index - 1) % 2) * assistGridSpacerX + game.ScreenCenterNativeOffsetX
		local y = assistGridStartY + math.floor((index - 1) / 2) * assistGridSpacerY + game.ScreenCenterNativeOffsetY
		local keepsakeData = game.GetKeepsakeData(traitName)
		local traitData = game.TraitData[traitName]
		local unlocked = traitData ~= nil and keepsakeData ~= nil and (game.SessionState.AllKeepsakeUnlocked or game.IsGameStateEligible(keepsakeData.GiftLevelData, keepsakeData.GiftLevelData.GameStateRequirements))

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
	end
	screen.LastAssist = lastAssist

	mod.UpdateAssistEquippedFrame(screen)
end

-- Allow unequipping companions, unlike keepsakes
function mod.HandleAssistToggle(screen, button)
	if not button.Data.Unlocked or button.Blocked then
		return
	end

	local traitName = button.Data.Gift
	if game.GameState.LastAssistTrait == traitName then
		game.GameState.LastAssistTrait = nil
	else
		game.GameState.LastAssistTrait = traitName
	end

	PlaySound({ Name = game.TraitData[traitName].EquipSound or "/Leftovers/Menu Sounds/TalismanPowderDownLEGENDARY" })
	mod.UpdateAssistEquippedFrame(screen)
	game.KeepsakeScreenUpdateActionBar(screen, button)
end

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
	-- This is a normal keepsake
	if button == nil or button.Data == nil or game.TraitData[button.Data.Gift] == nil or game.TraitData[button.Data.Gift].Slot ~= "Assist" then
		ModifyTextBox({ Id = components.SelectButton.Id, Text = "Menu_Equip" })
		return
	end

	-- This is a companion
	SetAlpha({ Id = components.SaveFirstButton.Id, Fraction = 0, Duration = 0.2 })
	components.SaveFirstButton.Visible = false
	if game.GameState.LastAssistTrait == button.Data.Gift then
		ModifyTextBox({ Id = components.SelectButton.Id, Text = "Menu_Unequip" })
	else
		ModifyTextBox({ Id = components.SelectButton.Id, Text = "Menu_Equip" })
	end
	if button.Data.Unlocked and not button.Blocked then
		SetAlpha({ Id = components.SelectButton.Id, Fraction = 1, Duration = 0.2 })
	else
		SetAlpha({ Id = components.SelectButton.Id, Fraction = 0, Duration = 0.2 })
	end
end)

modutil.mod.Path.Wrap("KeepsakeScreenClose", function(base, screen, button)
	if screen.LastAssist ~= game.GameState.LastAssistTrait then
		game.RemoveTrait(game.CurrentRun.Hero, screen.LastAssist)
		mod.EquipAssist(game.CurrentRun.Hero, game.GameState.LastAssistTrait, {
			FromLoot = true,
		})
	end

	return base(screen, button)
end)

modutil.mod.Path.Wrap("EquipLastAwardTrait", function(base, eventSource, hero)
	local returnValue = base(eventSource, hero)

	mod.EquipAssist(game.CurrentRun.Hero or hero, game.GameState.LastAssistTrait, {
		SkipNewTraitHighlight = true,
	})

	return returnValue
end)
