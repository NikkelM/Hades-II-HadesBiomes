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

TODO

## Sjson files

### MapGroups.sjson

Some data about biomes is stored in `Content/Game/MapGroups.sjson`, for both games.

The respective object grouping for each biome can be copied over from Hades to Hades II.
Take note that any effects etc. referenced by the `Using` key must be present in Hades II, otherwise the game will crash on startup.
The format for the values of `Using` also seem to be different between the two games.

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
HadesMapper dc -i Hades/Content/Win/Maps/<MapName> -o Hades/Content/Maps/<MapName_dc>
```

Then, encode it for Hades II. The `-s` flag stands for `sequel`, meaning Hades II:

```bash
HadesMapper ec -s -i Hades/Content/Maps/<MapName_dc> -o Hades II/Content/Maps/bin/<MapName>
```

In the end, for each map, there should be a `.map_text` and a `.thing_bin` file in the `Hades II/Content/Maps` and `Hades II/Content/Maps/bin` directories, respectively.

## Map packages

In Hades, `.pkg` files are in `Content/Win/Packages`, and in Hades II they are in `Content/Packages/<resolution>`.
As some biome names are re-used (such as Tartarus), we append `ModsNikkelMHadesBiomes` to the biome name in `MapGroups.sjson` and the `.pkg` files.
The resulting `.pkg` files must be copied from Hades to Hades II, so that all relevant effects and obstacles can exist.

## Known issues

This section details ways the game still crashes or otherwise doesn't work:

### Boon.pkg not found

When loading into the first Tartarus room (or potentially any other room), the `Boon.pkg` package tries to get loaded, but doesn't exist or is corrupted:

```bash
[13:11:32.2282766][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:787] Loading package: Boon.pkg
[13:11:32.2282874][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:668] Package file doesn't exist or is corrupted Boon.pkg
```

### Duplicate biome names

See the full investigation below.

#### Resolution: We can rename the "new" biomes copied over from Hades to something new

This needs to be done in the `MapGroups.sjson`, the `RoomData<BiomeName>.lua` (doesn't seem to make a difference with the current state of development - might still want to do so in order to separate valid rooms) and ???.

Additionally, the `.pkg` files copied from Hades need to be renamed to the new group name.

#### Investigation

Tartarus (and others) are reused Biome names. This clashes when adding the Hades Biomes to `MapGroups.sjson`.

Without renaming Tartarus, and not removing the existing Hades II biome:

```bash
[13:56:34.4423866][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1402] Finished World::Begin (0.087918 seconds)
[13:56:34.4423914][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1237] Started loadMapDataTask (RoomOpening)
[13:56:34.4423927][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1272] Started preScriptLoadTask
[13:56:34.4423946][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1278] Finished preScriptLoadTask (0.000000 seconds)
[13:56:34.4423954][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1285] Started loadPackagesTask
[13:56:34.4423966][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:787] Loading package: Tartarus.pkg
[13:56:34.4423985][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:702] Start reading manifest Tartarus
[13:56:34.4425911][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\Serialization\BinaryLoadData.cpp:12] Reading 159816 bytes
[13:56:34.4428371][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1266] Finished loadMapDataTask (0.004423 seconds)
[13:56:34.4428386][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1295] Started postLoadTask
[13:56:34.4435415][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:763] Done reading manifest Tartarus
[13:56:34.4881229][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:812] Package Loaded: Tartarus 487Mb in 0.45s
[13:56:34.4881809][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Audio\AudioManager.cpp:888] Loading bank: Tartarus
[13:56:34.4917555][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Audio\AudioManager.cpp:901] Audio bank loaded successfully: Tartarus (14Mb in 0.04s)
[13:56:34.4917578][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1289] Finished loadPackagesTask (0.493614 seconds)
[13:56:34.4917632][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1305] Done waiting for packages and pre-scripts task
[13:56:34.4917648][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1312] Calling PostLoad
```


With a renamed Tartarus Biome for Hades (MapGroups and RoomSetData):

```bash
[13:58:40.0615546][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1402] Finished World::Begin (0.081783 seconds)
[13:58:40.0615556][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1237] Started loadMapDataTask (RoomOpening)
[13:58:40.0615566][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1272] Started preScriptLoadTask
[13:58:40.0615583][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1278] Finished preScriptLoadTask (0.000000 seconds)
[13:58:40.0615590][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1285] Started loadPackagesTask
[13:58:40.0615602][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:787] Loading package: TartarusModded.pkg
[13:58:40.0615789][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:668] Package file doesn't exist or is corrupted TartarusModded.pkg
[13:58:40.0615804][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:812] Package Loaded: TartarusModded 0Mb in 0.00s
[13:58:40.0615889][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1289] Finished loadPackagesTask (0.000270 seconds)
[13:58:40.0615897][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1295] Started postLoadTask
[13:58:40.0615904][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1305] Done waiting for packages and pre-scripts task
[13:58:40.0617364][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\Serialization\BinaryLoadData.cpp:12] Reading 159816 bytes
[13:58:40.0619085][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1266] Finished loadMapDataTask (0.003503 seconds)
[13:58:40.0619114][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1312] Calling PostLoad
```
It tries loading the MapGroup name as a package - which doesn't exist in this test.
The following happens when copying the `Tartarus.pkg` as `TartarusModded.pkg` from Hades to Hades II:

```bash
[14:1:27.7771171][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1402] Finished World::Begin (0.084426 seconds)
[14:1:27.7771220][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1272] Started preScriptLoadTask
[14:1:27.7771231][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1237] Started loadMapDataTask (RoomOpening)
[14:1:27.7771240][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1278] Finished preScriptLoadTask (0.000001 seconds)
[14:1:27.7771248][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1285] Started loadPackagesTask
[14:1:27.7771261][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:787] Loading package: TartarusModded.pkg
[14:1:27.7771282][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:702] Start reading manifest TartarusModded
[14:1:27.7775559][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:763] Done reading manifest TartarusModded
[14:1:27.7779857][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\Serialization\BinaryLoadData.cpp:12] Reading 159816 bytes
[14:1:27.7788051][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1266] Finished loadMapDataTask (0.016757 seconds)
[14:1:27.7788086][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1295] Started postLoadTask
[14:1:28.8057197][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:812] Package Loaded: TartarusModded 310Mb in 0.28s
[14:1:28.8057366][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1289] Finished loadPackagesTask (0.286103 seconds)
[14:1:28.8057395][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1305] Done waiting for packages and pre-scripts task
[14:1:28.8057409][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1312] Calling PostLoad
```
Successful loading - including the entrance door etc., which do not exist in Hades II.


Removing the existing MapGroup in Hades II and overwriting with Hades Mapgroup:

```bash
[13:55:11.1458869][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1402] Finished World::Begin (0.094887 seconds)
[13:55:11.1458888][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1272] Started preScriptLoadTask
[13:55:11.1458900][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1237] Started loadMapDataTask (RoomOpening)
[13:55:11.1458907][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1278] Finished preScriptLoadTask (0.000001 seconds)
[13:55:11.1458915][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1285] Started loadPackagesTask
[13:55:11.1458927][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:787] Loading package: Tartarus.pkg
[13:55:11.1458948][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\GameAssetManager.cpp:702] Start reading manifest Tartarus
[13:55:11.1461281][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\Helpers\Serialization\BinaryLoadData.cpp:12] Reading 159816 bytes
[13:55:11.1463176][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1266] Finished loadMapDataTask (0.004250 seconds)
[13:55:11.1463188][INFO/log_write.hpp:64] [INFO] [Code\Engine.Native\Code\World\World.cpp:1295] Started postLoadTask
```
Normal loading (only missing expected FX).
(Missing some lines from the log for loading the bank.)
