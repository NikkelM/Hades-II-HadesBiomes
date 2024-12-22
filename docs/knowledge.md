# Knowledge about how to add Hades biomes/maps to Hades II

## Biome name mapping

For Hades II, the following biome name mappings apply. These match the map files to the relevant biomes:

| Biome name | Map name matches            | Comment                                          |
| ---------- | --------------------------- | ------------------------------------------------ |
| Erebus     | F\_\*                       |                                                  |
| Oceanus    | G\_\*                       |                                                  |
| Fields     | H\_\*                       |                                                  |
| Tartarus   | I\_\*                       | Biome name is also used in Hades                 |
| Ephyra     | N\_\*                       |                                                  |
| Thessaly   | O\_\*                       |                                                  |
| Olympus    | P\_\*                       |                                                  |
| Chaos      | Chaos\_\*                   |                                                  |
| DeathArea  | Hub\_\*, Flashback_Hub_Main |                                                  |
| Flashback  | Flashback_DeathArea\*       | Flashback to the House of Hades/Playing as Hades |
| Asphodel   | B\_\*                       | For challenge/teleported by Chronos rooms        |

Note that Hades II also has Asphodel rooms, and uses the same shorthand as Hades for them.
A similar thing applies for Tartarus and Erebus, which are used as biome names in both games.

For Hades, these are the mappings:

| Biome name | Map name matches                 | Comment                                 |
| ---------- | -------------------------------- | --------------------------------------- |
| Tartarus   | A\_\*, RoomSimple01, RoomOpening | Biome name is also used in Hades II     |
| Asphodel   | B\_\*                            |                                         |
| Elysium    | C\_\*                            |                                         |
| Styx       | D\_\*                            |                                         |
| Chaos      | RoomSecret                       |                                         |
| DeathArea  | DeathArea, RoomPreRun            |                                         |
| Surface    | E                                | Location after beating a run            |
| Charon     | Charon                           | Bossfight                               |
| Erebus     | RoomChallenge                    | For challenge/teleported by Hades rooms |

## Special rooms

### RoomSimple01

This is the `RoomOpening` for the first run, where a specific set of Athena boons is forced.

## RoomData lua files

Biome data is stored in `RoomData<BiomeName>.lua` files in Hades under `Hades/Content/Scripts`.
The equivalent files in Hades II are located in `Hades II/Content/Scripts`, and are called `RoomData<BiomeShorthand>.lua`.

At the bottom of the Hades files we have the following:

```lua
OverwriteTableKeys( RoomData, RoomSetData.<BiomeName> )
```

For Hades II, this should use the following format:

```lua
AddTableKeysCheckDupes( RoomData, RoomSetData.<BiomeName> )
```

### Key-Value replacements for RoomData files

<!-- TODO -->
- `RoomSetName` needs to be added to the base room file for the Biome, e.g. `RoomSetName = "A"` for Tartarus.
- Each room needs a `Name` set to itself, this is handled already by the `mod.ApplyModificationsAndInherit()` function.

#### Not figured out yet

- Door reward previews have the Hades II format, should be possible to get the Hades format instead.
- Interaction points on the maps that have the narrator voiceover often use different voicelines (i.e. same ID is used for a different voiceline in Hades II).

## Sjson files

### MapGroups.sjson

Some data about biomes is stored in `Content/Game/MapGroups.sjson`, for both games.

The respective object grouping for each biome can be copied over from Hades to Hades II.
Take note that any effects etc. referenced by the `Using` key must be present in Hades II, otherwise the game will crash on startup.
The format for the values of `Using` also seem to be different between the two games.

### CharacterAnimationsEnemies.sjson

<!-- TODO -->

### Enemies.sjson

<!-- TODO -->

## Map binaries

There are two types of map binaries: `.map_text` and `.thing_bin`.

`.map_text` files seem to be the same format in Hades and Hades II, so can be copied over:

`Hades/Content/Maps` -> `Hades II/Content/Maps`

`.thing_bin` files are different, and need to be recompiled.
They are located in the following paths:

`Hades/Content/Win/Maps` -> `Hades II/Content/Maps/bin`

The following tool developed by the Hades modding community can be used: [HadesMapper](https://github.com/SGG-Modding/HadesMapper).
First, decode a `.thing_bin` file from Hades (don't use file extensions):

```bash
HadesMapper dc -i Hades/Content/Win/Maps/<MapName> -o Hades/Content/Win/Maps/<MapName_dc>
```

Then, encode it for Hades II. The `-s` flag stands for `sequel`, meaning Hades II.
We place the encoded file in the `data` folder of the mod, so it gets added to `plugins_data`:

```bash
HadesMapper ec -s -i Hades/Content/Maps/<MapName_dc> -o <Modroot>/data/<MapName>
```

In the end, for each map, there should be a `.map_text` and a `.thing_bin` file in the `Hades II/Content/Maps` and `Hades II/Content/Maps/bin` directories, respectively.

## Map packages

In Hades, `.pkg` files are in `Content/Win/Packages`, and in Hades II they are in `Content/Packages/<resolution>`.
As some biome names are re-used (such as Tartarus), we append `ModsNikkelMHadesBiomes` to the biome name in `MapGroups.sjson` and the `.pkg` files.
The resulting `.pkg` files must be copied from Hades to Hades II, so that all relevant effects and obstacles can exist.

## Known issues

This section details ways the game still crashes or otherwise doesn't work:

### Using Hades enemies in EnemySets crashes the game

Using an enemy name that is not defined in Hades II in the enemy set will crash the game immediately upon loading a room.

This might be related to missing animation files - visuals have already been added through `RoomManager.pkg`.
