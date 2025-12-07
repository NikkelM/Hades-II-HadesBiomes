# Changelog

## v0.1.4

<!--Releasenotes start-->
*Notice: I am aware of ongoing issues with music cutting out or changing suddenly. This is under investigation!*

### Patch Highlights:
- Rooms will now offer more Boons and other rewards useful for the current run, and less Ash, Bones and Nectar. This should be especially noticeable in Tartarus.
- Fixed: Miniboss rooms in the Temple of Styx do not always offer upgraded reward versions.
- Fixed: Music cuts out, desyncs or disappears in Erebus.

Other fixes and improvements:
- The mod will now cancel the installation if it detects that Hades mods are installed, and show an informative message when loading into a save. This should prevent unexpected crashes when loading into the main menu in some cases.
- Rewards within a Styx subwing cannot be rerolled anymore. The reward can still be rerolled while in the Hub area.
- Updated the Elysium dialogue background to look more cohesive.
- If hit by Hades' Boiling Blood effect, the vignette effect shown now matches the one from the first game.
- Fixed: If Hades' Cast is blocked by a shield (such as from "Nitro Boost" or "The Lovers" Arcana), the Boiling Blood effect is still applied.
- Fixed: Eurydice can only be encountered if the Bone Hydra has been encountered without the Vow of Rivals active.
- Fixed: The game crashes when opening the Broker screen on early game saves.
- Fixed: The Doomstone summoned by Hades during his boss fight cannot be damaged once it's armour is broken.
- Fixed: If Thanatos has no more dialogue after an encounter, he disappears without unlocking the room exits.
- Fixed: Thanatos "Pleased" portrait version is not showing.
- Fixed: Thanatos leaves after his encounter if he has no more dialogue, but could still have been gifted.
- Fixed: Rerolling rewards for Styx miniboss rooms can result in duplicate rewards.
- Fixed: The restocked item spawned by Hermes' "Travel Deal" disappears after returning to the Styx hub room if it is not bought before visiting another room.
- Fixed: A voiceline between Zagreus and Sisyphus after the ending is missing. Please keep reporting missing voicelines.
<!--Releasenotes end-->

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
- Balancing: Reduced the forward momentum of Theseus' spear spin to attack to make it easier to dodge out of range.
- Balancing: Slightly increased Chariot ram speed.
- Balancing: Increased the time it takes for enemies to start attacking after the player enters a new room in Asphodel.
- Fixed: Opening the Broker screen crashes the game if the mod was temporarily disabled and then enabled again, and the player loaded into the Crossroads inbetween.
- Fixed: Judgment and Crystal Figurine trigger for both Asterius and Theseus, doubling their effects.
- Fixed: Vow of Menance can take effect in Boss encounters.
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
