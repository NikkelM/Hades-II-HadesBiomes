function mod.ModsNikkelMHadesBiomesSetFlag(source, args)
	args = args or {}
	game.GameState.Flags[args.flagName] = args.value
end

function mod.BossIntroElysium(eventSource, args)
	local shrineLevel = game.GetNumShrineUpgrades(eventSource.ShrineMetaUpgradeName)
	mod.ModsNikkelMHadesBiomesBossIntro(eventSource, args[shrineLevel])
end

function mod.PlayPreLineTauntAnimFromSource(source, args)
	if source ~= nil and source.TauntAnimation ~= nil then
		SetAnimation({ Name = source.TauntAnimation, DestinationId = source.ObjectId })
	end
end

function mod.TheseusMinotaurKillPresentation(unit, args)
	game.SetPlayerInvulnerable("TheseusMinotaurKillPresentation")

	local bothBossesDead = false
	if game.CurrentRun.CurrentRoom.Encounter.CheckComboPartnerForKillPresentation then
		local partnerId = GetClosestUnitOfType({ Id = unit.ObjectId, DestinationName = unit.ComboPartnerName })
		if partnerId == 0 or game.RequiredKillEnemies[partnerId] == nil or game.RequiredKillEnemies[partnerId].IsDead or game.RequiredKillEnemies[partnerId].Health <= 0 then
			bothBossesDead = true
		end
	end

	if unit.Name == "Theseus" then
		ExpireProjectiles({ Name = "TheseusSpearThrow" })
		game.wait(0.02, game.RoomThreadName)
		Destroy({ Ids = GetIdsByType({ Name = "TheseusSpearReturnPoint" }) })
	end

	if bothBossesDead then
		game.AddTimerBlock(game.CurrentRun, "TheseusMinotaurKillPresentation")
		PlaySound({ Name = "/SFX/StabSplatterEndSequence" })
		game.DestroyRequiredKills({ BlockLoot = true })
		unit.DestroyDelay = 0.5
		mod.HarpyKillPresentation(unit, args)
		game.RemoveTimerBlock(game.CurrentRun, "TheseusMinotaurKillPresentation")
	else
		game.LastKillPresentation(unit)
	end

	game.SetPlayerVulnerable("TheseusMinotaurKillPresentation")

	game.thread(game.CrowdReactionPresentation,
		{
			AnimationNames = { "StatusIconSmile", "StatusIconOhBoy", "StatusIconEmbarrassed", "StatusIconGrief" },
			Sound = "/SFX/TheseusCrowdChant",
			ReactionChance = 0.15,
			Delay = 1.8,
			Requirements = { RequiredRoom = "C_Boss01" },
			SkipCooldown = true,
		})
end

function mod.MinotaurFinalStageTransition(boss, currentRun, aiStage)
	if boss.CannotDieFromDamage then
		currentRun.CurrentRoom.Encounter.CancelSpawns = true
		boss.SkipOnDeathSpawnEncounter = true
		game.DestroyRequiredKills({ BlockLoot = true, SkipIds = { boss.ObjectId } })
		mod.MinotaurEarlyExitPresentation(boss, currentRun)
		game.Kill(boss, { SkipOnDeathFunction = true, Silent = true, SkipDestroyDelay = true, })
	else
		game.BossStageTransition(boss, currentRun, aiStage)
	end
end

function mod.MinotaurEarlyExitPresentation(boss, currentRun)
	game.HideCombatUI("MinotaurEarlyExit")
	boss.CanStoreAmmo = false
	boss.EarlyExit = true
	game.thread(game.LastKillPresentation, boss)
	PlaySound({ Name = "/SFX/FightBell" })
	-- Not needed as there are no supers in Hades II
	-- ZeroSuperMeter()

	game.AddTimerBlock(game.CurrentRun, "MinotaurEarlyExitPresentation")
	AddInputBlock({ Name = "MinotaurEarlyExit" })
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })
	ExpireProjectiles({})
	game.SetUnitVulnerable(boss)

	game.thread(game.PlayVoiceLines, boss.EarlyExitVoiceLines, nil, boss)

	SetAnimation({ DestinationId = boss.ObjectId, Name = GetThingDataValue({ Id = boss.ObjectId, Property = "Graphic" }) })
	LockCamera({ Id = boss.ObjectId, Duration = 1.25 })
	Move({ Id = boss.ObjectId, DestinationId = 522283, SuccessDistance = 50 })
	local notifyName = "WithinDistance" .. boss.ObjectId
	NotifyWithinDistance({ Id = boss.ObjectId, DestinationId = 522283, Distance = 50, Notify = notifyName, Timeout = 9.0, })
	game.waitUntil(notifyName, boss.AIThreadName)

	game.thread(game.PlayVoiceLines, boss.PostMatchTauntVoiceLines, true, boss)

	Stop({ Id = boss.ObjectId })
	AngleTowardTarget({ Id = boss.ObjectId, DestinationId = currentRun.Hero.ObjectId })

	game.ProcessTextLines(boss, boss.BossPresentationOutroTextLineSets)
	game.ProcessTextLines(boss, boss.BossPresentationOutroRepeatableTextLineSets)

	game.EndMusic(game.AudioState.MusicId, game.AudioState.MusicName)
	game.RemoveEnemyUI(boss)

	if game.GameState.TextLinesRecord.MinotaurFirstExit then
		game.wait(0.5, game.RoomThreadName)
	else
		game.wait(2.0, game.RoomThreadName)
	end

	if not game.PlayRandomRemainingTextLines(boss, boss.BossPresentationOutroTextLineSets) then
		game.PlayRandomRemainingTextLines(boss, boss.BossPresentationOutroRepeatableTextLineSets)
	end

	game.wait(1.5, game.RoomThreadName)

	thread(PlayVoiceLines, HeroVoiceLines.MinotaurDefeatedVoiceLines)

	LockCamera({ Ids = { 521115, 522283 }, Duration = 1.25 })
	local exitDoor = game.MapState.ActiveObstacles[521115]
	Move({ Id = boss.ObjectId, DestinationId = 522284, SuccessDistance = 50 })
	game.wait(0.4, game.RoomThreadName)
	SetAnimation({ DestinationId = exitDoor.ObjectId, Name = exitDoor.ExitDoorOpenAnimation })

	SetUnitProperty({ DestinationId = boss.ObjectId, Property = "CollideWithUnits", Value = false })
	SetUnitProperty({ DestinationId = boss.ObjectId, Property = "CollideWithObstacles", Value = false })
	game.wait(2.5, game.RoomThreadName)

	SetAnimation({ DestinationId = exitDoor.ObjectId, Name = exitDoor.ExitDoorCloseAnimation })
	game.wait(1.5, game.RoomThreadName)

	LockCamera({ Id = CurrentRun.Hero.ObjectId, Duration = 1.25 })
	Teleport({ Id = boss.ObjectId, DestinationId = 522243 })

	RemoveInputBlock({ Name = "MinotaurEarlyExit" })
	game.RemoveTimerBlock(game.CurrentRun, "MinotaurEarlyExitPresentation")
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	game.ShowCombatUI("MinotaurEarlyExit")
end

function mod.TheseusEnragedPresentation(enemy, currentRun)
	local screenId = ScreenAnchors.BossRageFill

	ShakeScreen({ Speed = 600, Distance = 6, FalloffSpeed = 2000, Duration = 1.0 })
	Flash({ Id = screenId, Speed = 2.0, MinFraction = 0, MaxFraction = 0.8, Color = game.Color.Purple })

	if enemy.RageFullVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, enemy.RageFullVoiceLines, nil, enemy)
	end
	if enemy.RageFullSound ~= nil then
		PlaySound({ Name = enemy.RageFullSound })
	end
end

function mod.MinotaurEnragedPresentation(enemy, currentRun)
	mod.TheseusEnragedPresentation(enemy, currentRun)
end

function mod.TheseusDamaged(victim, attacker)
	PlaySound({ Name = "/SFX/Enemy Sounds/Theseus/EmoteHurt", Id = victim.ObjectId })
end

function mod.Theseus2Damaged(victim, attacker)
end

function mod.GetUninteractedGodThisRunForTheseus()
	-- These are all the gods that can be selected by Theseus, but with the LootData names from Hades II
	local eligibleTheseusGods = {
		AphroditeUpgrade = true,
		AresUpgrade = true,
		NPC_Artemis_Field_01 = true, -- ArtemisUpgrade = true, -- not in Hades II as a normal god
		NPC_Athena_01 = true,      -- AthenaUpgrade = true, -- not in Hades II as a normal god
		DemeterUpgrade = true,
		NPC_Dionysus_01 = true,    -- DionysusUpgrade = true, -- not in Hades II as a normal god, and not possible to get in modded run
		PoseidonUpgrade = true,
		ZeusUpgrade = true,
	}
	local nonLootDataGods = {
		NPC_Artemis_Field_01 = {
			GameStateRequirements = {
				{
					PathTrue = { "GameState", "UseRecord", "NPC_Artemis_Field_01", },
				},
			},
		},
		-- She can be summoned through the Keepsake
		NPC_Athena_01 = {
			GameStateRequirements = {
				{
					PathTrue = { "GameState", "UseRecord", "NPC_Athena_01", },
				},
			},
		},
		-- He cannot be met in a modded run
		NPC_Dionysus_01 = {
			GameStateRequirements = {
				{
					PathTrue = { "GameState", "UseRecord", "NPC_Dionysus_01", },
				},
			},
		}
	}

	local notInteractedGods = {}
	for godName, godData in pairs(game.LootData) do
		if eligibleTheseusGods[godName] and game.CurrentRun.LootTypeHistory[godName] == nil and game.IsGameStateEligible(game.CurrentRun, godData) then
			table.insert(notInteractedGods, godData.Name)
		end
	end
	for godName, godData in pairs(nonLootDataGods) do
		if game.CurrentRun.LootTypeHistory[godName] == nil and game.IsGameStateEligible(game.CurrentRun, godData.GameStateRequirements) then
			table.insert(notInteractedGods, godName)
		end
	end

	local randomGod = game.GetRandomValue(notInteractedGods)
	-- Mapping the god names to the .pkg names used in Hades II
	local randomGodMap = {
		AphroditeUpgrade = "Aphrodite",
		AresUpgrade = "Ares",
		NPC_Artemis_Field_01 = "Artemis",
		NPC_Athena_01 = "Athena",
		DemeterUpgrade = "Demeter",
		NPC_Dionysus_01 = "Dionysus",
		PoseidonUpgrade = "Poseidon",
		ZeusUpgrade = "Zeus",
	}
	return randomGodMap[randomGod] or randomGod
end

function mod.SelectTheseusGod(enemy, run, args)
	enemy.TheseusGodName = mod.GetUninteractedGodThisRunForTheseus() or "Artemis"
	LoadPackages({ Names = enemy.TheseusGodName })
	-- Contains some necessary Fx that were in various GodUpgrade packages in Hades
	LoadPackages({ Names = "ModsNikkelMHadesBiomesTheseusGodFxOriginal" })
end

function mod.TheseusGodAI(enemy, currentRun)
	-- In the selection function, we removed the "Upgrade" suffix from the god name to be able to load the correct packages
	local theseusGodName = enemy.TheseusGodName .. "Upgrade"
	-- Set current weapon name to fire the intro wrath attack
	enemy.WeaponName = "Theseus" .. theseusGodName .. "Wrath"
	enemy.GodUpgrade = theseusGodName

	-- Fire Wrath
	local weaponAIData = game.GetWeaponAIData(enemy) or {}

	game.thread(mod.DoTheseusSuperPresentation, enemy, weaponAIData)

	game.wait(0.1)
	-- Updated to use Hades II function
	-- AttackOnce(enemy, currentRun, GetTargetId(enemy, weaponAIData), weaponAIData)
	weaponAIData.TargetId = GetTargetId(enemy, weaponAIData)
	game.DoAttack(enemy, weaponAIData)
	game.wait(3.0)

	-- Fire passive god weapon
	enemy.DumbFireWeapons = enemy.DumbFireWeapons or {}
	local dumbFireWeaponName = "Theseus" .. theseusGodName .. "Passive"
	table.insert(enemy.DumbFireWeapons, dumbFireWeaponName)
	game.ActivateDumbFireWeapons(currentRun, enemy)

	-- Switch back to regular AI
	game.SetAI(game.AttackerAI, enemy, currentRun)
end

function mod.DoTheseusSuperPresentation(enemy, weaponAIData)
	local currentRun = game.CurrentRun

	PlaySound({ Name = "/Leftovers/SFX/MeteorStrikeShort", Id = enemy.ObjectId })

	CreateAnimation({ Name = "TheseusWrathFire", DestinationId = enemy.ObjectId, Color = { 1.0, 0.9, 0.2, 1.0 } })

	-- Rumble({ RightFraction = 0.7, Duration = 0.3 })
	AdjustZoom({ Fraction = 0.9, LerpTime = 0.02 })
	AdjustFullscreenBloom({ Name = "LightningStrike", Duration = 0 })
	AdjustFullscreenBloom({ Name = "WrathPhase2", Duration = 0.1, Delay = 0 })
	AdjustRadialBlurStrength({ Fraction = 1.5, Duration = 0 })
	AdjustRadialBlurDistance({ Fraction = 0.125, Duration = 0 })
	AdjustRadialBlurStrength({ Fraction = 0, Duration = 0.03, Delay = 0 })

	game.AudioState.TheseusShoutEffectSoundId = PlaySound({
		Name = "/SFX/Enemy Sounds/Theseus/EmotePoweringUp",
		Id = enemy.ObjectId
	})

	game.thread(mod.ShoutSlow)

	game.ScreenAnchors.FullscreenAlertFxAnchor = CreateScreenObstacle({
		Name = "BlankObstacle",
		Group = "Scripting",
		X = ScreenCenterX,
		Y = ScreenCenterY
	})

	local fullscreenAlertDisplacementFx = SpawnObstacle({
		Name = "FullscreenAlertDisplace",
		Group = "FX_Displacement",
		DestinationId = game.ScreenAnchors.FullscreenAlertFxAnchor
	})
	DrawScreenRelative({ Id = fullscreenAlertDisplacementFx })

	if weaponAIData.WrathVoiceLines ~= nil then
		game.thread(game.PlayVoiceLines, weaponAIData.WrathVoiceLines, nil, enemy)
	end

	game.thread(game.CrowdReactionPresentation,
		{ AnimationNames = { "StatusIconOhBoy", "StatusIconSmile", "StatusIconFear" }, Sound = "/SFX/TheseusCrowdChant", ReactionChance = 0.1, Requirements = { RequiredRoom = "C_Boss01" }, Delay = 1, Shake = true, RadialBlur = true })

	-- Changed as this function no longer exists
	-- waitScreenTime(1.5)
	game.waitUnmodified(1.5)

	AdjustFullscreenBloom({ Name = "Off", Duration = 0.1, Delay = 0 })
	AdjustZoom({ Fraction = currentRun.CurrentRoom.ZoomFraction or 0.75, LerpTime = 0.25 })
	PlaySound({ Name = "/Leftovers/Menu Sounds/TextReveal3" })

	game.thread(game.CleanUpShoutPresentation, nil, nil, { fullscreenAlertDisplacementFx })
end

function mod.ShoutSlow()
	for k, simData in ipairs(game.CurrentRun.Hero.ShoutSlowParameters) do
		-- waitScreenTime(  simData.ScreenPreWait )
		game.waitUnmodified(simData.ScreenPreWait)
		if simData.Fraction < 1.0 then
			game.AddSimSpeedChange("WeaponHit", { Fraction = simData.Fraction, LerpTime = simData.LerpTime })
		else
			game.RemoveSimSpeedChange("WeaponHit", { LerpTime = simData.LerpTime })
		end
	end
end

function mod.TheseusChariotDismount(boss, currentRun, aiStage)
	Stop({ Id = boss.ObjectId })
	boss.AIDisabled = true
	if boss.PreAttackLoopingSoundId ~= nil then
		StopSound({ Id = boss.PreAttackLoopingSoundId, Duration = 0.2 })
	end
	SetUnitProperty({ Property = "MoveGraphic", Value = "Theseus_Walk", DestinationId = boss.ObjectId })
	SetUnitProperty({ Property = "CanOnlyMoveForward", Value = false, DestinationId = boss.ObjectId })
	SetUnitProperty({ Property = "CollisionWeaponRequiredVelocity", Value = "500", DestinationId = boss.ObjectId })
	SetUnitProperty({ Property = "HaltOnSlowMovement", Value = true, DestinationId = boss.ObjectId })
	SetUnitProperty({ Property = "InitiatedCollisionWeapon", Value = "null", DestinationId = boss.ObjectId })
	SetUnitProperty({ Property = "RotationSpeed", Value = "1500", DestinationId = boss.ObjectId })
	SetUnitProperty({ Property = "Speed", Value = "300", DestinationId = boss.ObjectId })
	SetLifeProperty({ Property = "InvulnerableCoverage", Value = math.rad(140), DestinationId = boss.ObjectId, DataValue = false })
	SetLifeProperty({ Property = "HitSound", Value = "/SFX/Enemy Sounds/Theseus/EmoteHurt", DestinationId = boss.ObjectId })
	SetThingProperty({ Property = "Graphic", Value = "Theseus_Idle", DestinationId = boss.ObjectId })
	boss.Material = "Organic"
	SetAnimation({ DestinationId = boss.ObjectId, Name = "TheseusChariot_Fall" })
	local dismountLocation = SpawnObstacle({ DestinationId = boss.ObjectId, Name = "BlankObstacle", Group = "Standing" })
	CreateAnimation({ DestinationId = dismountLocation, Name = "GrenadeExplosion" })
	ApplyForce({
		Id = boss.ObjectId,
		Speed = GetVelocity({ Id = boss.ObjectId }) * boss.DismountSpeedMultiplier,
		Angle = GetAngle({ Id = boss.ObjectId })
	})
	boss.Dismounted = true
	boss.ChainedWeapon = nil
	game.thread(game.LastKillPresentation, boss)
	game.thread(game.PlayVoiceLines, game.GlobalVoiceLines.TheseusChariotRuinedVoiceLines, true)

	game.thread(game.CrowdReactionPresentation,
		{ AnimationNames = { "StatusIconEmbarrassed", "StatusIconOhBoy" }, Sound = "/SFX/TheseusCrowdBoo", ReactionChance = 0.1, Delay = 1, Requirements = { RequiredRoom = "C_Boss01" } })

	game.wait(boss.DismountWaitDuration)

	boss.AIDisabled = false
	game.BossStageTransition(boss, currentRun, aiStage)

	Destroy({ Id = dismountLocation })
end

function mod.TheseusChariotAIMovement(enemy, weaponAIData)
	local pathIds = weaponAIData.PatrolPathIds

	if weaponAIData.PatrolPaths ~= nil then
		if weaponAIData.PatrolNearestStartId then
			local closestIndex = 1
			local closestDistance = 99999
			for i, pathIds in pairs(weaponAIData.PatrolPaths) do
				local distance = GetDistance({ Id = enemy.ObjectId, DestinationId = pathIds[1] }) or 99999
				if distance < closestDistance then
					closestIndex = i
					closestDistance = distance
				end
			end
			pathIds = weaponAIData.PatrolPaths[closestIndex]
		else
			pathIds = game.GetRandomValue(weaponAIData.PatrolPaths)
		end
	end

	if pathIds == nil then
		return
	end

	local pathIndex = 1

	weaponAIData.ReachedAttackPatrolId = false
	enemy.FollowingPath = true
	while pathIndex <= #pathIds + 1 do
		local targetId = pathIds[pathIndex]
		if targetId ~= nil and targetId ~= 0 then
			game.MoveWithinRange(enemy, targetId, weaponAIData)

			if weaponAIData.FireAfterPatrolIndex and pathIndex == weaponAIData.FireAfterPatrolIndex then
				weaponAIData.ReachedAttackPatrolId = true
			end

			if enemy.ForcedWeaponInterrupt ~= nil or weaponAIData.ForcedEarlyExit then
				break
			end
		end

		pathIndex = pathIndex + 1
	end
	enemy.FollowingPath = false
end

function mod.TheseusChariotAI(enemy)
	while game.IsAIActive(enemy) do
		if not CanAttack({ Id = enemy.ObjectId }) then
			enemy.AINotifyName = "CanAttack" .. enemy.ObjectId
			NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
			game.waitUntil(enemy.AINotifyName)
		end

		enemy.WeaponName = game.SelectWeapon(enemy)
		--DebugAssert({ Condition = enemy.WeaponName ~= nil, Text = "Enemy has no weapon!" })
		table.insert(enemy.WeaponHistory, enemy.WeaponName)

		local weaponAIData = game.GetWeaponAIData(enemy) or {}

		if weaponAIData.ChainedWeapon ~= nil then
			enemy.ChainedWeapon = weaponAIData.ChainedWeapon
		end

		if weaponAIData.PathWeapon then
			game.thread(mod.TheseusChariotAIMovement, enemy, weaponAIData)
			enemy.FollowingPath = true

			local hasAttacked = false
			while enemy.FollowingPath do
				if weaponAIData.FireAfterPatrolIndex == nil or weaponAIData.ReachedAttackPatrolId then
					if not weaponAIData.FireOncePerPatrol or not hasAttacked then
						local targetId = game.GetTargetId(enemy, weaponAIData)
						if targetId ~= nil and targetId ~= 0 then
							local attackSuccess = game.DoAttack(enemy, weaponAIData) or false
							hasAttacked = attackSuccess
							if weaponAIData.ForcedEarlyExit then
								game.killWaitUntilThreads(enemy.AIThreadName)
								game.SetThreadWait(enemy.AIThreadName, 0.05)
								break
							end
							if not attackSuccess and not CanAttack({ Id = enemy.ObjectId }) then
								enemy.AINotifyName = "CanAttack" .. enemy.ObjectId
								NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 0.3 })
								game.waitUntil(enemy.AINotifyName)
							end
						else
							game.wait(0.1, enemy.AIThreadName)
						end
					else
						game.wait(0.1, enemy.AIThreadName)
					end
				else
					game.wait(0.1, enemy.AIThreadName)
				end
			end
		else
			game.DoAttack(enemy, weaponAIData)
		end

		if weaponAIData.MovementEffectName ~= nil then
			ClearEffect({ Id = enemy.ObjectId, Name = weaponAIData.MovementEffectName })
		end
	end
end

-- Setting the ThreadWait on Theseus to 0 to allow him to break out of the wait animation
function mod.ModsNikkelMHadesBiomesStopTheseusSlamWait(enemy, aiData, currentRun, args)
	if enemy.ComboPartnerId ~= nil and game.ActiveEnemies[enemy.ComboPartnerId] ~= nil and not game.ActiveEnemies[enemy.ComboPartnerId].IsDead then
		game.SetThreadWait(game.ActiveEnemies[enemy.ComboPartnerId].AIThreadName, 0.01)
	end
end
