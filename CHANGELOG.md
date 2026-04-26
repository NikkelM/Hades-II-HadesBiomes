# Changelog

## v1.0.0

<!--Releasenotes start-->
### Patch Highlights:
- Meet **Megaera** in Styx, and have a friendly chat and a bottle of Ambrosia or two. This will also allow you to build a relationship with Megaera (including unlocking her keepsake).
- Advance through **50** new cosmetic ranks offered by the **Spirit Mixer**, from the lowly _Alpha Warden_ to the feared _Unseen One_. These ranks add new badges to your inventory and run clear screens, and are purely cosmetic.
- **Commander Schelemeus** has managed to procure a new set of the *Gifts of the Veil* from an unknown underworld contact... turn up the heat, errmm, fear, and escape the Nightmare Realm to earn these prestigious trophies.
- The **Lernaean Bone Hydra** has found its long-lost neck in the depths of Asphodel's lava.
- You can now conclude **Sisyphus**' storyline by interacting with him and **Megaera**.
- Tartarus, Asphodel, Elysium and Styx can now appear in Dream Dives. You can use the `z_ExcludeFromDreamDives` config value to prevent them from appearing.
- Added a new logo animation to the Main Menu to show that the mod is installed.
- The mod no longer creates any files in the game's installation directory, making it entirely compatible with playing vanilla or switching profiles in r2modman. Installing this mod update will automatically remove any previously created files.

Other fixes and improvements:
- The Chaos Gate in the Training Grounds can now only show once you have met Chaos.
- You can now salute story NPCs you meet during Zagreus' Journey runs.
- Updated the description text of "Final Expense" offered by Orpheus to make it clearer that all shop items are always discounted.
- If Thanatos has no new unique dialogue when he visits you at the start of a run, you can now pick up the starting boon without speaking to him first.
- Thanatos and Megaera can now pay Sisyphus a visit.
- Added a new dialogue background for conversations in the Temple of Styx.
- Hades and Theseus will now react with specific voicelines for certain Gods when using Godsent Hex effects against them.
- Hades will now react to Melinoë going dark using "Unseen Ire" in the fight against him.
- Selene may now react to Melinoë defeating a boss when the Vow of Rivals is active.
- Melinoë will now react to Hades calling Cerberus to his aid.
- Added some additional contextual voicelines in various situations.
- Added [zannc](https://github.com/excellent-ae) to the Credits for the [SharedKeepsakePort](https://thunderstore.io/c/hades-ii/p/zannc/SharedKeepsakePort/) contribution.
- Added some additional location localizations for languages which did not have a localization in Hades.
- Removed an internal workaround for safeguarding against crashes after the mod is uninstalled, as this is now more easily handled through vanilla game logic.
- Mod installation has been moved to the game's main loading screen, and you will no longer see a black screen after a mod update. The total time to install remains the same.
- The mod will no longer need to reinstall itself when the game updates. It will still reinstall when the mod itself receives an update.
- Balancing: Orpheus' "Final Expense" boon now reduces the price of Charon's wares between 5-15% instead of 0-10%.
- Balancing: Elysian Shades no longer create a respawning Exalted Shade if they are killed while polymorphed.
- Balancing: Slightly reduced the chance for the "Popper" elite perk to appear.
- Balancing: Slightly increased tick rate of poison damage.
- Balancing: The shockwave created by Hades' Cast projectile can now also damage Hades and other enemies.
- Fixed: The Chaos boon in the opening room during the first run can be transformed into an Onion by the Vow of Forfeit.
- Fixed: The Chaos boon in the opening room during the first run can be purged.
- Fixed: Melinoë comments on starting her fight with Charon as if it were a normal encounter.
- Fixed: The player gets stuck after collecting the reward in Charon's boss fight room.
- Fixed: Brimstone and Voidstone enemies have no small tethered crystals floating around them.
- Fixed: If Gale attacks a Brimstone or Voidstone enemy with tethers attached to it, the game may crash.
- Fixed: The Doomstone's lasers do not disappear when it is frozen. 
- Fixed: Skullomats morphed by "Twilight Curse" can still spawn Numbskulls.
- Fixed: Skullomats morphed by "Twilight Curse" turn into sheep that are smaller than they should be.
- Fixed: Some dialogues with Orpheus cannot be triggered.
- Fixed: Enemies summoned by Orpheus' "God of the Dead" boon cannot coexist with those summoned by "Sun Worshiper".
- Fixed: Enemies summoned by Orpheus' "God of the Dead" boon reduce the amount of enemies spawned in subsequent waves in the same encounter.
- Fixed: Enemies summoned by Orpheus' "God of the Dead" boon can be transformed by "Twilight Curse".
- Fixed: Entering a boss room sometimes does not resume music and play the boss theme if multiple special room types were chained beforehand.
- Fixed: Megaera spins in place multiple times during an attack where she summons enemies to her aid, instead of spinning only once.
- Fixed: If Alecto is defeated very quickly after her final stage transition, the "rage" colour tint does not disappear until changing rooms.
- Fixed: After defeating Megaera, Alecto or the Hydra, multiple voicelines may play over each other in some cases.
- Fixed: Skull-Crusher enemies can appear in encounters with Thanatos in Asphodel, even though Thanatos will rarely succeed in killing them.
- Fixed: Sprinting into certain Stalagmites in Asphodel makes them disappear immediately.
- Fixed: Smoke Traps in Asphodel and smoke created through the "Smoker" elite perk trigger "Unseen Ire".
- Fixed: Gorgons morphed by "Twilight Curse" turn into sheep that are smaller than they should be.
- Fixed: If petrified by a Gorgon while sprinting, Melinoë continues sliding over the ground instead of coming to a stop.
- Fixed: Eurydice's boon offering flavour text sometimes refers to her and Orpheus, even when she is alone.
- Fixed: After receiving a blessing from Eurydice, Melinoë sometimes reacts with a voiceline from Zagreus.
- Fixed: The Lernaean Bone Hydra has no neck elements constraining its movements.
- Fixed: Some fog and branches flicker on a specific Elysium map.
- Fixed: Exalted Shades always target the closest dropped weapon instead of a random one.
- Fixed: Exalted Shades spawned by Elysian Shades always spawn in the direction opposite the player instead of a random direction.
- Fixed: If the "Vow of Scars" is active and "HydraLite Gold" is offered by Patroclus, the number of locations the item will last is not shown.
- Fixed: Saluting the Good Shade in Elysium will now more consistently play a voiceline.
- Fixed: Melinoë's voicelines that play when (re-)entering the Styx Hub room play every time instead of only sometimes.
- Fixed: Some shop items in the Styx shop can clip behind the base they sit on.
- Fixed: The Snakestone's lasers do not disappear when it is frozen or morphed by "Twilight Curse".
- Fixed: The Dire Satyr Cultist cannot turn fast enough to face the player before firing its ranged poison dart attack.
- Fixed: The Gigantic Vermin's poison shake attack does not show the flying poison projectiles before they land and produce the poison puddles.
- Fixed: Melinoë may comment on starting the final boss fight with "For my Father!".
- Fixed: If Boiling Blood is active during Hades' phase transition, the damage multiplier is not removed for the rest of the fight.
- Fixed: The explosion and shockwave from Hades' Cast projectile is delayed after the countdown ends if the player is out of range when it first lands, until the player moves within range again.
- Fixed: Cerberus' portrait when Hades calls him during the fight is misaligned.
- Fixed: Hades' footsteps during his fight sometimes appear in random places.
- Fixed: If Hades is hit by one of his own urn traps, he plays a voiceline as if the player was hit.
- Fixed: The Doomstone summoned by Hades can teleport, causing its fragments to connect lasers out of bounds.
- Fixed: Victory messages for having completed a certain number of clears may not be awarded if another more generic message is also eligible.
- Fixed: Falling rubble from destructible pillars is not correctly attributed as trap damage in the run clear screen.
- Fixed: Entering a room on the Surface plays a voiceline from Melinoë if you have never reached that many chambers in any kind of run.
- Fixed: The "Prophecy completed" sound effect can play over the death animation on the Surface.
- Fixed: Frozen and chilled enemies appear much darker than they should.
- Fixed: There is an incorrectly layered lava bubble animation in the Asphodel credits scene.
- Fixed: When quickly skipping boss intro dialogue, the camera may snap back and forth quickly before the fight starts.
- Fixed: If NPCs greet you on approach, their dialogue status animation sometimes disappears.
- Fixed: Enemies morphed by "Twilight Curse" play their original death animations when dying while morphed, instead of the Sheep's.
- Fixed: Urns are not destroyed when sprinted into.
- Fixed: The game crashes when starting the "Trial of Family".
- Fixed: Family Dispute door reward previews are too large and clip out of the glass sphere.
- Fixed: Ash and Bone door reward previews in Asphodel are located too high in the glass sphere.
- Fixed: Custom dialogue with Hermes is not voiced if started in a shop, or after transforming loot using "The Artificer".
- Fixed: The Wretched Sneak and Wringer enemies summoned by Hades during his fight show up with incorrect names in the victory screen's damage taken table.
- Fixed: Chaos Gates do not have specific spawn requirements adapted to Zagreus' Journey runs.
- Fixed: "Enshrouded" (hidden room reward previews) Chaos Curse cannot appear in Zagreus' Journey runs.
- Fixed: Starting a Chaos Trial in one of the new biomes does not prompt you to check your loadout.
- Fixed: Relationship entries for story NPCs that unlock a keepsake do not show the related icon in the Codex.
- Fixed: Relationship entries for story NPCs that unlock a minor prophecy do not show the related icon in the Codex.
- Fixed: Progress for the "Hold The Onions" minor prophecy resets when taking damage during an Erebus encounter, even if you previously cleared three encounters hitless. 
- Fixed: Thanatos' "Growing Closer" arrow in the Codex is placed after the wrong entry.
- Fixed: Trying to navigate to the "Zagreus' Journey" cauldron category on keyboard or controller crashes the game if Alchemy has not been unlocked yet.
- Fixed: Some text localizations for relationship dialogue are missing.
- Fixed: Some Codex entries for Greek, Turkish, Ukrainian and Traditional Chinese have unterminated italic text sections.
- Fixed: In rare circumstances, the game can crash when checking requirements for actions taken during the previous Zagreus' Journey run.
- Fixed: If the mod was uninstalled while an installation screen popup was queued from an earlier installation or update action, the game crashes when entering the Crossroads.
- Fixed: Some unnecessary localization strings are copied during the mod installation.
- Fixed: Entering certain rooms in the Fields of Mourning incorrectly shows the location banner animation.
- Compatibility: The mod now exposes `IsValidInstallation` to denote to other mods if Zagreus' Journey is installed successfully. Mods can use this through `mods["NikkelM-Zagreus_Journey"].IsValidInstallation`.
<!--Releasenotes end-->

## v0.7.4

### Patch Highlights:
- This patch fixes a number of issues and incompatibilities introduced by the Post-Launch Patch 2. The mod should now be fully playable again, though a small number of minor bugs will be patched at a later date.
- Fixed: The game stalls on the loading screen when playing vanilla without previously uninstalling the mod through the config.
- Fixed: The game crashes when starting a "Survival" encounter.

Other fixes and improvements:
- Added new voicelines when unlocking certain cosmetics. 
- Added additional voicelines to some contextual events.
- Updated the "voicelines" used by Melinoë during moments where she gets closer to Thanatos.
- Melinoë can now comment on Toula landing the final hit on a boss in Zagreus' Journey runs.
- Fixed: Tisiphone's lunge attack does not use the alternate version for her Extreme Measures fight.
- Fixed: The timer does not pause in "Survival" encounters and Thanatos encounters.
- Fixed: Voicelines that play after a boss is defeated now play more consistently.
- Fixed: Modded cosmetics are missing after returning from a Dream Dive.
- Fixed: Orpheus and Eurydice are missing animations when singing.
- Fixed: Narrative events and dialogues play out of order.
- Fixed: Some contextual voicelines at the end of runs or when returning to the crossroads may not play if the run was a Zagreus' Journey run.
- Fixed: Contextual voicelines at the end of a Chaos Trial in the Nightmare Realm do not play, and vanilla voicelines play instead.
- Fixed: Statistics in the Archived Trivia screen are misaligned with the background animation.
- Fixed: The outro after defeating the final boss once the mod's true ending has been reached uses the incorrect background animation.
- Fixed: One-Time purchase offers in the Broker screen for exchanging Zagreus' Journey resources reappear after closing and opening the screen.

## v0.7.3

### Patch Highlights:
- This patch hot-fixes a small number of issues and incompatibilities introduced by the Post-Launch Patch 2 that may prevent you from playing, even in "vanilla" mode.
- After downloading and applying this update (start the game modded once), you should be able to play "vanilla" until the next mod patch properly fixes all newly introduced issues.
- Fixed: The mod tries to reference animations that do not exist, which crashes the game on startup, even when playing vanilla.

Other fixes and improvements:
- The mod now uses some new internal functions to optimize calls and prevent unexpected behaviour.
- Fixed: Room transitions in some scenarios for vanilla runs can have an incorrect fade duration.
- Fixed: Viewing Zagreus' Journey runs in the Run History screen shows an incorrect background animation.
- Fixed: Some removed variables are being accessed by the mod which can crash the game.
- Fixed: An internal variable tracking the number of visited biomes in the current run was renamed which causes some Chaos Trials to no longer function correctly.
- Fixed: Some modded cosmetics appear in between vanilla cosmetics of the same group.

## v0.7.2

### Patch Highlights:
- Added "Flame Wheels Release" item to Wells of Charon.
- After freeing Orpheus, you are guaranteed to encounter him before Sisyphus can appear again.

Other fixes and improvements:
- Fixed: When a Skull-Crusher is polymorphed while taking off, its animations break (Skull-Crushers can no longer be polymorphed).
- Fixed: The button prompt to reroll rewards in Asphodel does not change if the keybinding is changed.
- Fixed: The game crashes if a specific Thanatos dialogue is queued to play next.
- Fixed: "Friendly Faces" Quest shows the names of characters before they have been met.

## v0.7.1

- Fixed: Thanatos keepsake cannot be unlocked and does not appear in the Keepsake Cabinet.

## v0.7.0

### Patch Highlights:
- You can now encounter **Orpheus** in Tartarus, where he will offer you a select number of his songs that will empower your current run. Free Orpheus through a new incantation at the Cauldron.
- Progress Orpheus' and Eurydice's storyline and reunite them!
- Thanatos will now find you in the first room of a run if you encountered him during your previous run, enabling you to progress his storyline.
- Added four additional boons offered by Sisyphus.
- Added new minor prophecies tasking you with receiving various boons from Zagreus' Journey's story NPCs.
- Added new dialogues with Hermes.

Other fixes and improvements:
- Learn how to play the Lyre from Orpheus.
- Forge a bond, and perhaps a deeper relationship, with Thanatos.
- Sisyphus, Eurydice and Patroclus will now say a short line after you choose one of their boons.
- Codex entries that are locked by relationship or storyline progress now have fitting hints associated with them.
- Added a new incantation that allows you to remember Lernie's nickname.
- Updated a number of boon icons with enhanced visuals.
- Fixed: The game may crash if the last Zagreus' Journey run was more than ten runs ago.
- Fixed: When dying in Tartarus after room exits have been unlocked, part of the room reward preview animation is overlayed over the blacked-out death screen.
- Fixed: The Hydra can get stuck between obstacles after it dashes into the lava in very rare circumstances.
- Fixed: Archer traps in Elysium sometimes fail to fire the arrow.
- Fixed: Some codex entries overflow the intended area in the Codex.
- Fixed: Some dialogues are never eligible to play.
- Fixed: Some boss attack voiceline quips refer to Zagreus directly.
- Fixed: Reward previews in Elysium and Styx are sometimes misaligned.
- Fixed: The game may get into a bad state by not setting required flags correctly.

## v0.6.0

### Patch Highlights:
- Added new Chaos Trials that equip you with a preset loadout and challenge you to fight through a specific biome from Zagreus' Journey.
- The Archivist now shows run clear statistics for Zagreus' Journey runs; for each Weapon Aspect, Boon, Hammer and Keepsake.
- The Silver Pool now shows the fastest and highest fear clear for each weapon for Zagreus' Journey runs alongside the Underworld and Surface statistics in the Aspect selection menu.

Other fixes and improvements:
- Added some missing subtitles for Charon.
- The mod will now show a warning screen if it detects incompatible mods. Please go to [github.com/NikkelM/Hades-II-HadesBiomes/wiki/Incompatible-Mods](https://github.com/NikkelM/Hades-II-HadesBiomes/wiki/Incompatible-Mods) to see the current list of incompatible mods.
- Added `ellomenop-SortedStatScreen` to the list of incompatible mods.
- Balancing: Strongbow enemies can no longer appear in Asphodel through the Vow of Menace, as they were prone to retreat into lava and die.
- Fixed: Howling Soul's Cast can be embedded in Skull-Crushers, potentially preventing them from launching into the air.
- Fixed: Small "Dart" Hydra heads spawned during the Asphodel boss fight move to the center of the arena before some attacks, instead of to their spawn points.
- Fixed: Some projectiles are not excluded from slow effects.
- Fixed: The Elysium Archer Trap plays a pre-attack animation before being disabled when loading into a room with a completed encounter.
- Fixed: Charon's sack of Gold always has a chance to appear in mid-shops, even when it should not be eligible.
- Fixed: In some cases, entering Megaera's boss fight room would not play any dialogue before the fight starts.
- Fixed: Some elite enemies from Asphodel have placeholder names in the "Most Damage Suffered" section of the run clear screen.
- Fixed: Parts of room reward preview animations overlay on top of shop screens.
- Fixed: Allied units remain alive after defeating a boss.
- Fixed: Some room reward types are misaligned on the preview for some doors.
- Fixed: The position of the "Chaos Within" trials in the list in the Pitch-Black Stone is incorrect.

## v0.5.0

### Patch Highlights:
- Added new randomized Chaos Trials, "Chaos Within", "Great Chaos Within" and "Greater Chaos Within". These function the same way as the base game randomized Trials, allowing you to battle out of Tartarus with a random weapon, keepsake, familiar, arcana and vow setup. Complete the story of Zagreus' Journey (10 clears) and have all keepsakes, weapons and familiars unlocked to find these Trials in the Pitch-Black Stone.
- Added four new Elite Perks: "Linker", "Cloner", "Smoker" and "Popper", which can appear on elite enemies in Zagreus' Journey runs.
- Added new minor prophecies related to clearing the new Chaos Trials, and defeating enemies imbued with the new Elite Perks.
- Added new incantations to unlock Golden Urns in Zagreus' Journey runs.
- Added new dialogues with Chaos, explaining the nature of Zagreus' Journey runs.
- Added subtitles. *For languages available in Hades II that did not have a localization in the first game, English subtitles will be shown.*

Other fixes and improvements:
- Room reward preview animations have been updated and will now use the original animations from the first game.
- When trading Zagreus' Journey resources with the broker, the resource display on the top right will now show how many of the given boss resource you currently have in your inventory, instead of always showing a placeholder.
- Updated voicelines during the first Zagreus' Journey run to better fit the added context.
- Updated the background video playing during the outro sequences when exiting a cleared Zagreus' Journey run after completing the story to the one from the first game.
- Added contextual voicelines for entering and returning to the Styx hub room, approaching Cerberus, and finding the fountain room very early or very late.
- Added voicelines after defeating the Furies, the Bone Hydra, and the Tiny Vermin.
- Added voicelines when first spotting the sack of Gold in Charon's shops.
- The "Following Through" minor prophecy is now called "Hold The Onions".
- Balancing: Slightly adjusted the feel of the Doomstone's spawning fragment launch.
- Balancing: The Wretched Sneak now waits longer after its ranged attack before teleporting away.
- Fixed: Bloodroot and shovel points can spawn over gaps in the room in Doomstone miniboss chambers in Tartarus.
- Fixed: "Out of Tartarus" music track plays in Elysium instead of Tartarus.
- Fixed: Elysian Shades that respawned from an Exalted Shade will render in front of obstacles when they should be behind them instead.
- Fixed: After defeating the Tiny Vermin in Styx, the biome music starts with an incorrect section when returning to the hub room.
- Fixed: Hades is missing his intro animation after a particular dialogue before his boss fight.
- Fixed: Zagreus' portrait disappears during a certain dialogue on the Surface.
- Fixed: Pools of Purging do not respect the minimum required amount of rooms between them before they can spawn.
- Fixed: Damage taken from small Hydra heads during the Asphodel boss fight is not correctly attributed to the main head in the "Damage Taken" section of the run clear screen.
- Fixed: Furies that support the main Fury in the Tartarus boss fight (with the Vow of Rivals) are shown with a placeholder name in the "Damage Taken" table in the run clear screen.
- Fixed: Grave Thirst trigger during room transitions on the Surface and during the ending sequence.
- Fixed: The "Extreme Measures" minor prophecy is always marked as completed immediately after unlocking it.
- Fixed: The "Heart Of Stone" minor prophecy has a placeholder objective text after it has been completed.
- Fixed: The names of the base aspects of Ygnium and Zorephet are swapped in descriptions of various minor prophecies.
- Fixed: Some unlocks are delayed until starting the next run instead of being available immediately after returning from a Zagreus' Journey run.
- Fixed: Localized dialogues in languages other than English do not terminate *italic* text correctly, causing all text after the first occurrence to be italicized for the current dialogue box.

## v0.4.2

### Patch Highlights:
- Fixed: Certain dialogue eligibility checks will crash the game.

## v0.4.1

### Patch Highlights:
- Fixed: If there are more than 10 vanilla runs between two Zagreus' Journey runs, the game may crash in certain circumstances.

## v0.4.0

### Patch Highlights:
- You can now **challenge Lord Charon** to a "friendly duel" by "borrowing" some of his Gold! Defeat your favourite shopkeeper for a special discount on all his wares for the duration of your current run.
- Discover and complete over **25 new Minor Prophecies** at the Fated List, with more coming in the future.
- Look out for some new voicelines from Hermes and Primordial Chaos, they might have tasks for you! Even more voicelines are coming in future updates.
- Added **8** new cosmetics to discover and unlock in the Crossroads, created by @burn.
- You can now unlock **29 new music tracks** from the first game with the Music Maker in the Crossroads, through the [Hades OST for the Music Maker](https://thunderstore.io/c/hades-ii/p/NikkelM/Hades_OST_for_the_Music_Maker/) mod integration (installed automatically with this mod). Perform the "Recovery of Orpheus' Scriptures" incantation to unlock the new music.

Other fixes and improvements:
- Charon's shops now play the original music from the first game during Zagreus' Journey runs.
- Slightly boosted the volume of some music tracks.
- Added a new combat map in Tartarus.
- If the mod installation is interrupted by closing the game, it will now continue where it left off instead of restarting from the beginning.
- Balancing: The Bone-Raker can no longer gain the "Scraper" elite perk.
- Balancing: The Tiny Vermin no longer gains increased movement and attack speed from the Vow of Frenzy.
- Balancing: Slightly increased Hades' maximum health if the Vow of Rivals is at full strength.
- Fixed: Tisiphone's whip lash attack does not stun the player.
- Fixed: Alecto's "enraged" color grading effect is not removed after defeating her.
- Fixed: If reloading a save after completing the Barge of Death encounter, the room cannot be exited. You can no longer quit the room without exiting after encounter to prevent this.
- Fixed: Killing a Doomstone in the encounter with Hades does not destroy its fragments.
- Fixed: Hades' dialogue that is supposed to play when first defeating him may be overridden by the Vow of Rivals dialogue and will never play again, which can prevent some minor progression and consistency issues for the end of the first cleared run. *It will now always play first, and be retroactively set for saves that have already defeated Hades.*
- Fixed: Exiting the final boss fight before the story ending will always play the same incantation voiceline by Melinoë, instead of choosing a random one from the full set.
- Fixed: The Codex and Inventory cannot be opened in the opening room in Tartarus until after defeating the enemies.
- Fixed: In some rare cases, music may go missing after entering multiple rooms with special music events in a row.
- Fixed: Erebus room exit doors (back to the previous biome) always offer Bones, Ash or Nectar as rewards instead of using the proper calculation method of choosing rewards.
- Fixed: If the keepsake equipped at the start of the run adds a random boon or hammer, the floating text indicating which one was gained does not show.
- Fixed: Ambient sound effects for the Elysium and Styx boss resource drops persist after the resource is picked up.
- Fixed: Gods don't comment on you choosing them over another god during a Family Dispute during Zagreus' Journey runs.
- Fixed: Contextual voicelines with story NPCs relating to their respective keepsakes being equipped cannot trigger.
- Fixed: In rare cases, some ineligible combinations of contextual voicelines can play during NPC or boss encounters.
- Fixed: Some NPC and boss conversations are not properly prioritized and will not be forced to play before more generic dialogue (maybe now Sisyphus will finally tell you about Bouldy).
- Fixed: Some props and background animations flicker or are misaligned on some maps. If you notice any additional flickering, please create an issue on GitHub with a log attached from while you are in the affected room, and include a screenshot or video of the flickering object.
- Fixed: When returning to the Crossroads after a cleared Zagreus' Journey run after the story ending, the game plays a Hades voiceline indicating he had killed you.
- Fixed: When returning from a Chaos Trial, Zagreus' Journey cosmetics and other assets are not loaded until switching rooms.
- Fixed: When a Thanatos encounter starts, Melinoë can sometimes play a Zagreus voiceline.
- Fixed: The "Dais, Olympian" cosmetic for Skelly is incorrectly named "Dais, Fancy".
- Fixed: Dying in a boss or miniboss room does not always show the correct portrait in the Run History screen.
- Fixed: Returning to the Crossroads after a cleared Zagreus' Journey run post-ending plays Melinoë voicelines meant for returning after a death.
- Fixed: Some voicelines spoken by Melinoë when waking up in the Crossroads feel out of place after clearing a Zagreus' Journey run before the story ending.
- Fixed: For saves with Zagreus' Journey runs from the alpha, some run results can show placeholder text.
- Fixed: Theseus' and Asterius' Codex entries cannot be unlocked.
- Fixed: The Run History screen shows ??? instead of the Zagreus' Journey icon next to the run number for runs from the second page onwards. (@adi1998)
- Fixed: The Run History screen shows "Prevailed!!" instead of "Escaped" for cleared Zagreus' Journey runs from the second page onwards.
- Fixed: If a Chaos Trial includes a biome from Zagreus' Journey, the run is always marked as a Zagreus' Journey run in the Run History, instead of a Chaos Trial run.
- Fixed: Boon icons for Sisyphus, Eurydice and Patroclus are missing when viewing the Codex in the Crossroads.
- Fixed: Shop icons for some cosmetics added by the mod are very noisy/grainy and hard to decipher.

## v0.3.0

### Patch Highlights:
- Enter **Erebus Gates** and clear their encounters without being hit for upgraded rewards! You can perform a new incantation to make these gates appear during *Zagreus' Journey* runs, and can enter them if there is enough *Fear* in the Night.
- Pools of Purging can now appear in rooms in Zagreus' Journey runs (after performing the accompanying incantation).
- Added a new category to the Cauldron for all incantations added by the mod, making them easier to find.
- Fixed: Music can disappear after the "Barge of Death" encounter in Asphodel.
- Fixed: When first entering a new region, music starts to play, then quickly cuts out and changes.
- Fixed: Attempting to reroll a door with Ash, Bones, or Nectar in a room with three exits freezes the game.

Other fixes and improvements:
- Added a new incantation to unlock the Keepsake Rack in rooms between regions for Zagreus' Journey runs (note that it will no longer appear until the incantation is performed).
- Added new incantations to unlock Wells of Charon for Zagreus' Journey runs (note that they will no longer appear until the incantations are performed).
- Added new incantations to unlock Fountain Chambers in Tartarus, Asphodel, and Elysium for Zagreus' Journey runs (note that they will no longer appear until the incantations are performed).
- Added new incantations to unlock Infernal Troves and Moon Monuments for Zagreus' Journey runs (note that they will no longer appear until the incantations are performed).
- Added a "Vanquished" count for Zagreus' Journey enemies to their respective Codex entries.
- Decreased the overall amount of time spent in the biome map transition.
- The installation screen will now only show in the Training Grounds, and no longer in the main Crossroads.
- Changed the default logging level of the mod to "Debug" to simplify troubleshooting user issues. You can change this in the mod's config file.
- Balancing: Reduced the maximum time the Skull-Crusher can stay airborne before attacking.
- Balancing: Increased the time the Skull-Crusher stays grounded before taking off again.
- Balancing: Slightly reduced the tracking speed of the Elite Strongbow's triple-shot attack.
- Balancing: The Tiny Vermin can now call for reinforcements more frequently.
- Balancing: Slightly reduced the spawn rate of resource points.
- Fixed: A second inspect point in the mid-shop in Tartarus never shows up (this was bugged in vanilla Hades as well - enjoy the exclusive new dialogue!).
- Fixed: Magick and Hexes do not (re)charge, and the Aspect of Supay does not attack automatically during boss fights with Tisiphone or Alecto.
- Fixed: Alecto's Rage meter is missing its icon.
- Fixed: Skull-Crushers cannot be frozen.
- Fixed: Background obstacles in the "Barge of Death" encounter keep moving after the encounter has ended and the boat has stopped.
- Fixed: The teeth spawned by the "Summoner" Hydra variant can be stunned.
- Fixed: If the "Summoner" Hydra variant is defeated while summoning teeth, those teeth will still spawn enemies that need to be defeated after its death.
- Fixed: When preparing to fire its wave attack, the purple Hydra variant cannot turn to face Melinoë in time and ends up firing the attack into the lava.
- Fixed: Exalted Shades sometimes stand idle next to weapons instead of picking them up to respawn.
- Fixed: If an Exalted Shade is killed while picking up a weapon, the weapon does not return to its ghostly form.
- Fixed: When a Crawler is stunned, it becomes invisible.
- Fixed: Bouldy's special damage boon grants up to 1000% bonus damage instead of up to 10%.
- Fixed: Elysian Shades killed by Thanatos can sometimes spawn an Exalted Shade.
- Fixed: Enemies killed by familiars or charmed enemies are not counted towards Melinoë's kills when dueling Thanatos.
- Fixed: Enemies killed by Melinoë while they are cursed by Thanatos will still trigger the "skull" death animation effect that should only trigger for Thanatos' kills.
- Fixed: Biome music continues to play in shop rooms with free rewards before a boss encounter.
- Fixed: (Tentative) Music can duplicate/overlap in rooms after a "challenge" encounter (Troves, Moon Monuments).
- Fixed: Contextual voicelines with story NPCs relating to their respective keepsakes being equipped cannot trigger.
- Fixed: NPCs and bosses sometimes refer to Zagreus (by his name or gender).
- Fixed: When marking a new testament, the indicator below the Shrine can sometimes point to the wrong exit.
- Fixed: Testaments for the Sister Blades incorrectly require having completed the Polyphemus testament with the Witch's Staff.
- Fixed: An incorrect animation plays on the biome transition map after completing a Testament of Night.
- Fixed: Some Testament of Night icons overlapping with the figurines on the biome map.
- Fixed: When hit, a "stunned" visual effect always plays above Melinoë's head, even when no or another effect animation should play.
- Fixed: Some trap damage is incorrectly attributed on the run clear screen.
- Fixed: Dusa's codex entry is replaced with the one from the first game.
- Fixed: Some textures in some rooms can be misplaced when reloading a save while in them.
- Fixed: When rerolling boons or shop items, the Zagreus' Journey room transition fade is shown instead of the dedicated reroll effect.
- Fixed: In the Rift of Thessaly, rerolling doors can choose the same reward again in rare cases.
- Fixed: A manual reinstall without a previous uninstall marks the Hades installation as invalid due to an Olympus Extra installation, even if Olympus Extra is not installed.

## v0.2.0

### Introducing: New Crossroads Cosmetics!

*Unlock 40+ new cosmetics for the Crossroads*, including new **Cauldrons**, **Fan Posters** for your tent, **Charms** inspired by Zagreus' companions from the first game, and much more.
All new cosmetics were created by community member @burn, and can be unlocked using resources collected during "Zagreus' Journey" runs after performing a new incantation added to your Cauldron.

*Have ideas for additional new cosmetics? Let us know on Discord!* 

### Patch Highlights:
- Added 40+ new unlockable Crossroads cosmetics inspired by the first game.
- Balancing: Reduced overall enemy health in Tartarus and Asphodel, with larger reductions in Tartarus, whilst slightly increasing enemy health in Styx.
- Balancing: Reduced the projectile speed for projectiles fired by the Wretched Witch, Dracon and Splitter.
- Balancing: Removed randomization of attack timings of the Dire Spreaders in the "Witch's Circle" miniboss encounter to make the encounter more predictable.
- Balancing: Increased the amount of Nightmare granted for completing the new testaments to align with the base game rewards: 14 fear testaments now grant 2 Nightmare, and 18 and 22 fear testaments now grant 3 Nightmare. If you have already completed some of these testaments, the owed Nightmare will be added to your inventory when you load into your save.
- Fixed: Gale and hit-shields trigger a block for the "lock-on" attacks from Brimstones, the Doomstone, Snakestones and Hades' beam attack, which do not deal damage.

Other fixes and improvements:
- If the mod detects an outdated Hades installation, it will now mark the installation as invalid and show an informative message when loading into the Training Grounds. Updating your Hades installation should resolve the issue.
- Balancing: Increased the amount of healing offered by Sisyphus' "Warm Embrace" from 25 to 50.
- Balancing: Alecto and Tisiphone can now be encountered earlier in the story.
- Balancing: The Megagorgon in Asphodel can now be morphed using the "Twilight Curse" Hex.
- Balancing: Reduced the health and armour of the Dire Spreaders in the "Witch's Circle" miniboss encounter.
- Balancing: Reduced the tracking/rotation speed of the purple Hydra variant when it readies and fires its wave attack.
- Balancing: Increased the minimum required distance to the player for the Longspear's leap attack.
- Balancing: The Elite Strongbow's triple-shot attack now has better tracking and is not as easily avoidable.
- Balancing: The Snakestone's lasers now move slower.
- Balancing: Reduced the tracking/rotation speed of the Satyr Cultist when readying its blowgun attack.
- Fixed: Entering Sisyphus' room can cause a crash at a certain point in his storyline.
- Fixed: When entering the Tartarus or Elysium boss chambers, the player's Hex can start charging automatically before the fight begins.
- Fixed: The main Hydra head does not return to the center of the arena before certain attacks.
- Fixed: Respawned Elysian Shades do not immediately aggro the player.
- Fixed: Asterius can sometimes get stuck on Melinoë if she is between him and the center of the room after he is defeated in his miniboss fight.
- Fixed: "Spark of Ixion" can appear in the Well of Charon in the room after defeating the Champions of Elysium, even though Chaos Gates cannot spawn from this point onwards.
- Fixed: Hades can sometimes get stuck in the room's pillars or out of bounds after dashing.
- Fixed: If "Deep Dissent" is active, Hades may sometimes not spawn any enemies at all during his phase transitions.
- Fixed: If "Universal Donor" is equipped, the associated VFX will show on Zagreus while on the Surface.
- Fixed: Magick and Hexes do not (re)charge during Thanatos encounters.
- Fixed: After the last gift to Thanatos, an empty heart is still shown in the Codex.
- Fixed: If both Nectar and Ambrosia can still be gifted to a character, both will show in empty hearts in the Codex, even when only the Nectar can currently be gifted.
- Fixed: Some texts are decoded incorrectly for Italian and Brazilian Portuguese localizations, causing the game to freeze when the relevant dialogue plays.
- Fixed: "Bond Forged" will now correctly display the sticker when you fully max out a characters friendship. (zannc's SharedKeepsakePort)

## v0.1.5

### Patch Highlights:
- Overhauled many enemies' attack patterns, reducing their rotation speed and tracking/lock-on abilities during many attack combos. This should now feel closer to their behaviour in the first game.
- Balancing: The Wretched Sneak in Tartarus now waits longer after its ranged attack before teleporting away.
- Balancing: Decreased health and armour of the Doomstone.
- Fixed: Patroclus storyline does not start past the first meeting, and he cannot be gifted.

Other fixes and improvements:
- Added an additional Elysium combat room that was previously disabled due to effect layering issues that have now been fixed.
- When poisoned in Elysium (through an enemy summoned by the Vow of Menace), an overhead text will now appear to remind you that poison will wear off automatically.
- Thanatos will now teleport to the room exit faster after clearing his encounters.
- A victory stinger will now play when clearing a run after reaching the ending.
- Melinoë will now use her victory animation when returning to the Crossroads after clearing a run once the ending has been reached.
- Added a hint to open the inventory when first gathering any of the new resources added by the mod.
- Added a config option for speedrunners to always force the Satyr Sack in Styx to spawn in the second wing.
- Added a previously missing introductory encounter for the Wretched Pest.
- Added an alternative animation when starting a new run in the Training Grounds.
- Balancing: Slightly reduced overall encounter difficulty ratings in Tartarus, Asphodel and Elysium (resulting in less enemies per room).
- Balancing: The Wretched Pest will now attack slightly more frequently, eliminating times where it would stand still for a long time.
- Balancing: The Longspear's leap attack is now slower, takes longer to recover from, and cannot be used as often.
- Balancing: All Elysian Shades' dash attacks have increased range.
- Balancing: Slightly increased poison damage from a single Styx enemy's hit in Elysium to be more in line with Elysium damage numbers (one hit now deals ~10 damage). Additional hits can still stack, so be on your toes!
- Balancing: Slightly increased the forward momentum of Asterius' spin attack to more closely match the behaviour in the first game.
- Balancing: If Deep Dissent is active, Hades will no longer summon minibosses during his Vow of Rivals fight, but normal enemies instead.
- Balancing: Some of the miniboss enemies summoned by Hades during his Vow of Rivals fight can now be resurrected by Night Bloom.
- Fixed: Harvest points can appear in Tisiphone's room, which become inaccessible after she shrinks the arena during her fight.
- Fixed: If a Gorgon's petrifying projectile is blocked by a hit-shield or Gale, you still get petrified.
- Fixed: Pickaxe points can spawn in the Asphodel and Elysium boss chambers, potentially blocking movement and attacks.
- Fixed: Enemy spawns in Elysium can be clustered too close to the player.
- Fixed: Elysian Shades do not create a respawn egg if cursed by Thanatos, but killed by the player.
- Fixed: Elysian Shades resurrected through Night Bloom create a respawn-egg when they die.
- Fixed: If defeating Asterius during his miniboss fight while kept alive through Moros' Engraved Pin, you die instead of reviving.
- Fixed: Path of Stars upgrades offered by Styx miniboss rooms only grant three points instead of five.
- Fixed: When using his teleport, Hades' voicelines and sound effect give away his new position before he reappears.
- Fixed: Boiling Blood can be applied while invulnerable, such as during the Aspect of Persephone's special attack.
- Fixed: Boiling Blood can be applied when the projectile is blocked through the Black Coat's omega attack.
- Fixed: The slowing area of effect around Hades' dropped Cast projectiles can sometimes be destroyed with attacks.
- Fixed: "Blast Ready" VFX for Hephaestus' boons is shown on the Surface.
- Fixed: Ranged Cast weapons can be used on the Surface.
- Fixed: Manual fishing is not possible on the Surface if Toula is equipped.
- Fixed: Gigantic Vermin summoned through Night Bloom create a poison puddle that damages the player when they die.
- Fixed: Chaos' "Caustic" curse does not spawn Inferno-Bombs from most enemies added by the mod.
- Fixed: Rewards spawning in fountain rooms do not play a sound effect when they appear.
- Fixed: Some voicelines for Zagreus are missing when gifting Thanatos Ambrosia.
- Fixed: The biome transition map overlays are not properly aligned for Elysium and Styx.

## v0.1.4

### Patch Highlights:
- Balancing: Rooms will now offer more Boons and other rewards useful for the current run, and less Ash, Bones, and Nectar. This should be especially noticeable in Tartarus.
- Fixed: Miniboss rooms in the Temple of Styx do not always offer upgraded rewards.
- Fixed: Music cuts out, desyncs or disappears in Erebus.
- Fixed: Music disappears after the "Barge of Death" encounter in Asphodel.

Other fixes and improvements:
- The mod will now cancel the installation if it detects that Hades mods are installed, and show an informative message when loading into a save. This should prevent unexpected crashes when loading into the main menu in some cases.
- Rewards within a Styx subwing cannot be rerolled anymore. The reward can still be rerolled while in the Hub room.
- Updated the Elysium dialogue background to look more cohesive.
- If hit by Hades' Boiling Blood effect, the vignette effect shown now matches the one from the first game.
- Balancing: Multiple Wringers can now attack at the same time, making encounters containing them slightly more challenging.
- Fixed: The game crashes when opening the Broker screen on early game saves.
- Fixed: Hydra Heads can be replaced with enemies from Elysium by the Vow of Menace.
- Fixed: Vow of Menace has no effect on the first run.
- Fixed: Vow of Menace can replace more enemy types than intended.
- Fixed: The Doomstone summoned by Hades during his boss fight cannot be damaged once its armour is broken.
- Fixed: If Hades' Cast is blocked by a shield (such as from "Nitro Boost" or "The Lovers" Arcana), the Boiling Blood effect is still applied.
- Fixed: The shockwave created by Hades' dropped Cast projectile can damage Hades and other enemies.
- Fixed: The restocked item spawned by Hermes' "Travel Deal" disappears after returning to the Styx Hub room if it is not bought before visiting another room.
- Fixed: The Tiny Vermin can get stuck behind the pit in the middle of its room.
- Fixed: The Tiny Vermin's howl attack has a choppy animation and missing sound effect.
- Fixed: Rerolling rewards for Styx miniboss rooms can result in rolling a reward present on another door.
- Fixed: Enemies sometimes do not use weapons as their first attack, even if those weapons should be used first after spawning.
- Fixed: The timer does not pause when returning to the Styx Hub room.
- Fixed: Eurydice can only be met if the Bone Hydra has been encountered without the Vow of Rivals active.
- Fixed: If Thanatos has no more dialogue after an encounter, he disappears without unlocking the room exits.
- Fixed: Thanatos immediately leaves after his encounter if he has no more dialogue, but could still have been gifted.
- Fixed: Thanatos' "Pleased" portrait version is missing.
- Fixed: A voiceline between Zagreus and Sisyphus after the ending is missing. Please keep reporting missing voicelines.

## v0.1.3

### Patch Highlights:
- Fixed: Phase transition music for Hades does not play correctly.
- Fixed: An unterminated string in a Japanese localization file for the Microsoft Store/PC Game Pass version of Hades causes the mod installation to fail.

Other fixes and improvements:
- Updated the priority with which error popups are shown, making troubleshooting the root cause of installation issues easier.
- Added a new informative message when the mod installation fails due to installed Hades mods.
- Changed the Codex Chapter and Inventory headings from "Nightmare" to "Zagreus' Journey".
- Removed forced walking speed in the final biome after beating the final boss for the first time.
- Reduced the Dash range in the Temple of Styx Hub to improve navigation fluidity.
- Balancing: Centaur Tonic and Soul Heart offered by Patroclus now provide increased benefits.
- Balancing: The Dire Soul Catcher is no longer immune to cast slow effects when dashing.
- Balancing: The Bone Hydra's lunge attacks have reduced velocity to reduce the chance of multiple heads ending up in the same space.
- Fixed: Hexes start auto-charging while still in conversation with Asterius before his miniboss fight.
- Fixed: Knuckle Bones triggers on the Asterius miniboss chamber instead of Elysium's boss fight.
- Fixed: Spark of Ixion can appear in the Well of Charon in the room after defeating the Champions of Elysium, even though Chaos Gates cannot spawn from this point onwards.
- Fixed: Thanatos has no relationship level display in the Codex.
- Fixed: Certain queued conversations with Sisyphus cause the game to crash when entering his room.
- Fixed: Voicelines that are supposed to play during the first encounter with Hades do not play.
- Fixed: Voicelines that are supposed to play in the Crossroads between the first and second modded run do not play.
- Fixed: If the mod installation is invalid or broken, the "Restart Required" screen is shown instead of the "Installation Failed" screen.
- Fixed: The exit after defeating the Bone Hydra is unlocked very late after picking up the reward.
- Fixed: Pickaxe points can spawn in the Asterius miniboss chamber, potentially blocking his movement and attacks.

## v0.1.2

### Patch Highlights:
- Support for PC Game Pass/Microsoft Store versions of Hades. You will need to provide the path of the Hades folder in the mod config file in your mod manager (such as `C:\Xbox\Hades`).
- Workaround: The game will prompt you to perform a restart if it was unable to load some required files. This can cause crashes, missing assets, or enemies to not deal damage otherwise.

Other fixes and improvements:
- Added a new installation failure screen for the particular case when the Hades installation could not be found, to allow for easier troubleshooting.
- Balancing: Reduced the forward momentum of Theseus' spear spin attack to make it easier to dodge out of range.
- Balancing: Slightly increased Chariot ram speed.
- Balancing: Increased the time it takes for enemies to start attacking after the player enters a new room in Asphodel.
- Fixed: Opening the Broker screen crashes the game if the mod was temporarily disabled and then enabled again, and the player loaded into the Crossroads inbetween.
- Fixed: Judgment and Crystal Figurine trigger for both Asterius and Theseus, doubling their effects.
- Fixed: Vow of Menace can take effect in Boss encounters.
- Fixed: Meeting Tiny Vermin for the first time could have a longer than expected wait time before the fight begins.
- Fixed: The installation failure screen shows only placeholder text.
- Fixed: The mod does not reinstall itself after it is updated.
- Fixed: The mod shows the "Installation Successful" message on every mod update.
- Workaround: "Crystal" enemies (such as Brimstones) will not spawn their tethers to prevent crashes when attacked by a familiar, or hit by the Polymorph Hex.

## v0.1.1

### Patch Highlights:
- Balancing: Reduced Poison tick rate from every 0.13s to every 0.23s.
- Balancing: Increased grace period before first taking poison damage from 0.85s to 1s.
- Fixed: Thanatos' attacks crash the game.
- Fixed: "Old Grudge" and "Deep Dissent" do not have any effect against Hades.
- Fixed: Gale can't block Poison damage.

Other fixes and improvements:
- Added voicelines when entering the Asphodel boss chamber.
- Boosted volume of music tracks.
- Balancing: Slightly reduced overall enemy health and armour.
- Balancing: Slightly reduced Chariot ram speed, and they are no longer immune to cast slow effects.
- Balancing: Slightly increased encounter difficulty ratings to allow for more enemies per wave.
- Balancing: Witches in the "Witch's Circle" miniboss encounter can no longer have Elite Perks.
- Fixed: "Robbed Thanatos" title is eligible when simply meeting Thanatos, even when he got kills.
- Fixed: The blue Hydra variant's falling rocks can be destroyed by attacking the warning decal.
- Fixed: Tisiphone's fog can stick to Melinoë.
- Fixed: Styx saw blade weapon damage is not categorized as "Trap" damage.
- Fixed: Barge of Death shielding crystals have no tethers attached.
- Fixed: When altering fate (run RNG) at the Shrine, the Reroll Die is not shown over the Chaos Gate.
- Fixed: The "Summoner" Hydra variant's teeth spawn enemies even when destroyed.
- Fixed: "Bigger" enemy elite perk doesn't work for the original game's enemies.
- Fixed: Some contextual voicelines can never play after returning to the Crossroads.
- Fixed: Some contextual dialogues with bosses can not be triggered.
- Tentative Fix: Music stops playing in rooms after minibosses or other special rooms. Please report if this still occurs.
- Compatibility: Removed some unused Devotion weapons and projectiles for compatibility with Droppable Gods.

## v0.1.0

- Initial release!
- Escape the Underworld as Melinoë, battle familiar foes and bosses using her unique abilities and weapons, meet Zagreus' old friends, and reconnect with your family's past.
- Adds all four original biomes & the Surface from Hades to Hades II.
- Includes all enemies and bosses.
- Experience a wide range of dialogues and story events from the original game again.
- Battle out of Tartarus listening to the original soundtrack.
- Forge relationships with Sisyphus, Eurydice, Patroclus and more.
- Read about them and other characters, enemies and locations in a new Codex chapter.
- Collect over 30 new resources during your runs in the original Underworld.
- ...and much more!
