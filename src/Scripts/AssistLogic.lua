-- #region Controls
table.insert(game.CombatControlsDefaults, "SpecialInteract")

game.OnControlPressed({
	"SpecialInteract",
	function(triggerArgs)
		if not game.IsEmpty(game.ActiveScreens) then
			return
		end

		local target = triggerArgs.UseTarget
		if target ~= nil then
			return
		end
		-- Preserve Dream Dive Tweaks' Gift + Salute keybind combination
		if game.IsControlDown({ Name = "Gift" }) then
			return
		end
		if game.CurrentRun == nil or game.CurrentRun.CurrentRoom == nil then
			return
		end
		if not game.IsCombatEncounterActive(game.CurrentRun) then
			return
		end

		if mod.CanFireAssist() then
			mod.DoAssist()
		elseif game.GameState.LastAssistTrait ~= nil then
			mod.AssistFailedPresentation(game.CurrentRun.Hero)
		end
	end,
})
-- #endregion

-- #region General logic
function mod.CanFireAssist()
	if game.CurrentRun.Hero == nil then
		return false
	end
	if game.CurrentRun.Hero.IsDead then
		return false
	end
	if game.CurrentRun.CurrentRoom.UsedAssist then
		return false
	end
	if not game.IsInputAllowed({}) then
		return false
	end

	local traitData = game.GetHeroTrait(game.GameState.LastAssistTrait)
	if traitData == nil then
		return false
	end
	if traitData.AddAssist == nil then
		return false
	end
	if traitData.AddAssist.WeaponName ~= nil and not game.Contains(traitData.PreEquipWeapons or {}, traitData.AddAssist.WeaponName) then
		return false
	end
	if traitData.RemainingUses == 0 then
		return false
	end
	if traitData.AddAssist.GameStateRequirements ~= nil and not game.IsGameStateEligible(traitData, traitData.AddAssist.GameStateRequirements) then
		return false
	end

	return true
end

function mod.DoAssist()
	local traitData = game.GetHeroTrait(game.GameState.LastAssistTrait)
	local assistData = traitData.AddAssist
	game.CurrentRun.CurrentRoom.UsedAssist = true
	local presentationState = mod.DoAssistPresentation(assistData, {
		ApplyPlayerSlow = true,
		PlayAssistReactionVoiceLines = true,
		PlayCrowdReaction = true,
		SecondPortraitOffsetY = 10,
		SetHeroAnimation = true,
		UsePlayerRumble = true,
	})

	if assistData.WeaponName ~= nil then
		local locationId = GetClosest({
			Id = game.CurrentRun.Hero.ObjectId,
			DestinationName = "EnemyTeam",
			IgnoreInvulnerable = true,
			IgnoreHomingIneligible = true,
			Distance = 1200,
		})
		if locationId == 0 then
			locationId = game.CurrentRun.Hero.ObjectId
		end
		local targetId = SpawnObstacle({
			Name = "BlankObstacle",
			Group = "FX_Terrain",
			DestinationId = locationId,
		})
		FireWeaponFromUnit({
			Weapon = assistData.WeaponName,
			Id = game.CurrentRun.Hero.ObjectId,
			DestinationId = targetId,
			FireFromTarget = true,
		})
		Destroy({ Id = targetId })
	end

	game.thread(mod.DoAssistPresentationPostWeapon, assistData, presentationState)
	if assistData.FunctionName ~= nil then
		game.CallFunctionName(assistData.FunctionName, assistData)
	end
	game.thread(mod.AssistCompletePresentation, assistData)

	game.UseTraitData(game.CurrentRun.Hero, traitData)
	game.UpdateTraitNumber(traitData)
	game.LogTraitUses(traitData.Name)
	game.CheckCodexUnlock(mod.CodexChapterName, traitData.Name)
end

-- #endregion

-- #region Achilles and Patroclus
function mod.AchillesPatroclusAssist(assistData)
	game.wait(0.7, game.RoomThreadName)
	local firstTargetId = GetClosest({
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationName = "EnemyTeam",
		IgnoreInvulnerable = true,
		IgnoreHomingIneligible = true,
		Distance = assistData.Range,
	})
	local weapons = game.ShallowCopyTable(assistData.AssistWeapons)
	local firstWeapon = game.RemoveRandomValue(weapons)
	local secondWeapon = game.RemoveRandomValue(weapons)

	FireWeaponFromUnit({
		Weapon = firstWeapon,
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationId = firstTargetId,
		FireFromTarget = true,
	})

	game.wait(1.8, game.RoomThreadName)
	local targetIds = GetClosestIds({
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationName = "EnemyTeam",
		IgnoreInvulnerable = true,
		IgnoreHomingIneligible = true,
		Distance = assistData.Range,
		MaximumCount = 2,
	})
	local secondTargetId = targetIds[1]
	if secondTargetId == firstTargetId and targetIds[2] then
		secondTargetId = targetIds[2]
	end
	FireWeaponFromUnit({
		Weapon = secondWeapon,
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationId = secondTargetId,
		FireFromTarget = true,
	})
end

-- #endregion

-- #region Skelly
function mod.SkellyAssist()
	local enemyData = game.EnemyData.TrainingMeleeSummon
	local newEnemy = game.DeepCopyTable(enemyData)
	newEnemy.BlocksLootInteraction = false
	newEnemy.ObjectId = SpawnUnit({
		Name = enemyData.Name,
		Group = "Standing",
		DestinationId = game.CurrentRun.Hero.ObjectId,
		OffsetX = 0,
		OffsetY = 0,
	})
	game.thread(game.CreateAlliedEnemyPresentation, newEnemy)
	game.SetupUnit(newEnemy, game.CurrentRun, { SkipPresentation = true })
	game.thread(function()
		game.waitUnmodified(2)
		for _, voiceLines in ipairs(newEnemy.OnActivationFinishedVoiceLines) do
			game.PlayVoiceLines(voiceLines, nil, newEnemy)
		end
	end)
	game.CreateHealthBar(newEnemy)
	game.UpdateHealthBar(newEnemy, 0, { Force = true })

	game.MapState.TauntTargetIds[newEnemy.ObjectId] = true
end

function mod.SkellyAssistDeath(unit)
	if unit.OnDeathVoiceLines then
		game.thread(game.PlayVoiceLines, unit.OnDeathVoiceLines, nil, unit)
	end
	game.MapState.TauntTargetIds[unit.ObjectId] = nil
end

-- #endregion

-- #region Sisyphus
function mod.SisyphusAssistTouchdown(bouldy, args)
	FireWeaponFromUnit({
		Weapon = args.WeaponName,
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationId = bouldy.ObjectId,
		FireFromTarget = true,
	})
	Destroy({ Id = args.ShadowId })
	Destroy({ Id = bouldy.ObjectId })
end

function mod.SisyphusLootSprinkle(assistData)
	local locationId = GetClosest({
		Id = game.CurrentRun.Hero.ObjectId,
		DestinationName = "EnemyTeam",
		IgnoreInvulnerable = true,
		IgnoreHomingIneligible = true,
		Distance = 500,
		RequiredLocationUnblocked = true,
	})
	if locationId == 0 then
		locationId = GetClosest({
			Id = game.CurrentRun.Hero.ObjectId,
			DestinationName = "EnemyTeam",
			IgnoreInvulnerable = true,
			IgnoreHomingIneligible = true,
			Distance = 500,
		})
	end
	if locationId == 0 then
		locationId = game.CurrentRun.Hero.ObjectId
	end

	local targetId = SpawnObstacle({
		Name = "BlankObstacle",
		Group = "FX_Terrain",
		DestinationId = locationId,
	})
	local shadowId = SpawnObstacle({
		Name = "BlankObstacle",
		Group = "FX_Terrain",
		DestinationId = targetId,
	})
	SetAnimation({ Name = "CrusherShadowFadeIn", DestinationId = shadowId, Scale = 0.6, PlaySpeed = 2.0 })

	local bouldy = game.DeepCopyTable(game.ObstacleData.TartarusRubble03)
	bouldy.ObjectId = SpawnObstacle({
		Name = "TartarusRubble03",
		Group = "Standing",
		DestinationId = targetId,
	})
	game.SetupObstacle(bouldy)
	SetAnimation({ DestinationId = bouldy.ObjectId, Name = "ModsNikkelMHadesBiomesBouldyFall" })
	SetScale({ Id = bouldy.ObjectId, Fraction = 0.2 })
	AdjustZLocation({ Id = bouldy.ObjectId, Distance = 2000 })
	ApplyUpwardForce({ Id = bouldy.ObjectId, Speed = -2000 })
	game.wait(0.02, game.RoomThreadName)
	bouldy.OnTouchdownFunctionName = _PLUGIN.guid .. "." .. "SisyphusAssistTouchdown"
	bouldy.OnTouchdownFunctionArgs = {
		WeaponName = assistData.SisyphusWeapon,
		ShadowId = shadowId,
	}
	AttachLua({ Id = bouldy.ObjectId, Table = bouldy })

	game.wait(1, game.RoomThreadName)
	local consumableData = game.DeepCopyTable(assistData)
	consumableData.DestinationId = targetId
	consumableData.NotRequiredPickup = true
	game.GiveRandomConsumables(consumableData)
	Destroy({ Ids = { targetId, shadowId } })
	Destroy({ Id = bouldy.ObjectId })
end

-- #endregion
