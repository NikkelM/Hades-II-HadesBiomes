function mod.PlayerReceivedAssistPresentation(npc, giftName)
	AdjustColorGrading({ Name = "Mythmaker", Duration = 0.66 })
	PlaySound({ Name = "/Leftovers/Menu Sounds/StarSelectConfirm" })

	game.thread(game.PlayVoiceLines, npc.GiftGivenVoiceLines, true)
	game.thread(game.PlayVoiceLines, game.CurrentRun.Hero.GiftReceivedVoiceLines, true)
	local npcName = npc.Name
	game.DisplayInfoBanner(nil, {
		Icon = game.TraitData[giftName].Icon,
		IconScale = 1.0,
		IconMoveSpeed = 0.0001,
		IconOffsetY = 6,
		SubtitleOffsetY = 60,
		HighlightIcon = true,
		TitleText = "ModsNikkelMHadesBiomes_CompanionReceived_Title",
		AnimationName = "InfoBannerGiftIn",
		AnimationOutName = "InfoBannerGiftOut",
		IconBackingAnimationName = "LocationBackingIrisSmallSubtitleIn",
		IconBackingAnimationOutName = "LocationBackingIrisSmallSubtitleOut",
		IconBackingColor = game.Color.Lavender,
		IconBackingHSV = { 0.25, -0.2, 0.1 },
		SubtitleText = "NewTraitUnlocked_Subtitle",
		SubtitleData = { LuaKey = "TempTextData", LuaValue = { Name = npcName, Gift = giftName } },
	})

	game.thread(function()
		game.wait(1.0)
		AdjustColorGrading({ Name = "Off", Duration = 1.0 })
	end)

	if game.CheckObjectiveSet("KeepsakePrompt") then
		game.UpdateAffordabilityStatus()
	end
end

modutil.mod.Path.Wrap("PlayerReceivedGiftPresentation", function(base, npc, giftName)
	if game.TraitData[giftName].Slot == "Assist" then
		return mod.PlayerReceivedAssistPresentation(npc, giftName)
	else
		return base(npc, giftName)
	end
end)
