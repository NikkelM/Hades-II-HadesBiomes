# Knowledge base

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

## RoomData lua files

Biome data is stored in `RoomData<BiomeName>.lua` files in Hades under `Hades/Content/Scripts`.
The equivalent files in Hades II are located in `Hades II/Content/Scripts`, and are called `RoomData<BiomeShorthand>.lua`.

At the bottom of the Hades files we have the following:

```lua
OverwriteTableKeys( RoomData, RoomSetData.<BiomeName> )
```

In Hades II, this format is used:

```lua
AddTableKeysCheckDupes( RoomData, RoomSetData.<BiomeName> )
```

Note: This is irrelevant with the current method of loading the data.

### Key-Value replacements for RoomData files

- `RoomSetName` needs to be added to the base room file for the Biome, e.g. `RoomSetName = "A"` for Tartarus.
- Each room needs a `Name` set to itself, this is handled already by the `mod.ApplyModificationsAndInherit()` function.

## Sjson files

Part of this knowledge is needed when adding Hades enemy types to Hades II - more about that in the [Adding Hades enemies](#adding-hades-enemies) section.

### MapGroups.sjson

Some data about biomes is stored in `Content/Game/MapGroups.sjson`, for both games.

The respective object grouping for each biome can be copied over from Hades to Hades II.
Take note that any effects etc. referenced by the `Using` key must be present in Hades II, otherwise the game will crash on startup.
The format for the values of `Using` also seem to be different between the two games.

### CharacterAnimationsEnemies.sjson

Some animations are duplicates, i.e. they exist in both games.
These duplicates must be removed from the table imported from Hades, as otherwise the game will crash.
Shortly before crashing, an error message is shown in the console, allowing you to see which animation is causing the issue and add it to the `animationsToRemove` table.

### Enemies.sjson

Enemies in Hades II inherit data from `1_BaseEnemy`, this is missing for Hades enemies.
If they do not inherit from this base enemy type, they will not be able to register hits (be invulnerable).
Use the `hadesEnemiesModifications` table to add the `InheritFrom` property to all relevant enemies.
Parent enemy types, such as the `BaseGlutton` will work to also apply the inheritance to their children.

```lua
local hadesEnemiesModifications = {
	BaseGlutton = {
		InheritFrom = "1_BaseEnemy"
	},
}
```

### EnemyProjectiles.sjson

Some projectiles are duplicates and must be removed, just as is done for `CharacterAnimationsEnemies.sjson`.

Enemies in Hades use a `DamageLow` and `DamageHigh` property, while Hades II uses a `Damage` property.
If the `Damage` property is not set, the enemies will not deal damage, or more precisely, their hits will not even register.
The `EnemyProjectiles.sjson.lua` file automatically migrates the `DamageLow` and `DamageHigh` properties to the `Damage` property, using the average of the two values.

Additionally, the stun animation has been renamed in Hades II.
Any effects with the Name `ZagreusOnHitStun` are therefore renamed to `HeroOnHitStun`.

Some enemies start an animation during an effect, such as the `DisembodiedHandGrab` projectile, which starts the `ZagreusStun` animation during the `ZagreusHitStun` effect.
This animation does not exist in Hades II, so it must be removed from the `Effects` property of the projectile:

```lua
DisembodiedHandGrab = {
	Effect = {
		StartAnimation = "null"
	}
}
```

## Map binaries

There are two types of map binaries: `.map_text` and `.thing_bin`.

`.map_text` files seem to be the same format in Hades and Hades II, so can be copied over:

`Hades/Content/Maps` -> `Hades II/Content/Maps`

`.thing_bin` files are different, and need to be recompiled.
They are located in the following paths:

`Hades/Content/Win/Maps` -> `Hades II/Content/Maps/bin`

The following tool developed by the Hades modding community can be used: [HadesMapper](https://github.com/SGG-Modding/HadesMapper).
A `.cmd` file that automatically performs the necessary steps is below:

```cmd
@echo off
setlocal

rem This script is used to decode and encode the Hades map files using the HadesMapper tool
rem Define paths
set DECOMPILE_OUTPUT=xxx
set HADES_MAPPER=xxx
set HADES_CONTENT=xxx
set HADES_TWO_CONTENT=xxx
set OUTPUT_DIR_MOD=xxx
set OUTPUT_DIR_PLUGINS=xxx

rem Define the list of files to process  separated by spaces
set FILES=D_Intro D_Hub

rem Loop through each file and process it
(for %%f in (%FILES%) do (
    echo Processing file: %%f

    rem Decode the file
    %HADES_MAPPER% dc -i "%HADES_CONTENT%\%%f" -o "%DECOMPILE_OUTPUT%\%%f_DECOMPILED"

    rem Decode the file (from Hades II)
    @REM %HADES_MAPPER% dc -s -i "%HADES_TWO_CONTENT%\%%f" -o "%DECOMPILE_OUTPUT%\%%f_DECOMPILED"
    
    rem Encode the file in the output directories
    %HADES_MAPPER% ec -s -i "%DECOMPILE_OUTPUT%\%%f_DECOMPILED" -o "%OUTPUT_DIR_MOD%\%%f"
    %HADES_MAPPER% ec -s -i "%DECOMPILE_OUTPUT%\%%f_DECOMPILED" -o "%OUTPUT_DIR_PLUGINS%\%%f"
    %HADES_MAPPER% ec -s -i "%DECOMPILE_OUTPUT%\%%f_DECOMPILED" -o "%HADES_TWO_CONTENT%\%%f"
    
    rem Remove the intermediate file
    del "%DECOMPILE_OUTPUT%\%%f_DECOMPILED.thing_text"
))

echo Finished processing files.
endlocal
```

In the end, for each map, there should be a `.thing_bin` file for each map in the `Hades II/Content/Maps` and `Hades II/Content/Maps/bin` directories, respectively.

### Special maps

#### RoomOpening

In the `RoomOpening.thing_bin` file (decompiled), there are two `TartarusCubeBrick03` objects, with the comments `FirstDoor` (ID `210004`) and `SecondDoor` (ID `210099`).
The parent of `FirstDoor` is ID `410061` (has `210004` as an `AttachedId`).
These are the first and second tiles after the door (where the player starts) in the room.
These two tiles have some bugged z-buffer location, which requires some manual changes from the Hades file to work nicely with Hades II.

The changes that need to be made are as follows:

To ID `210004`:

- Added `"Comments": "FirstDoor"`
- Assigned `Terrain_04` to the `GroupNames` array.

To ID `210099`:

- Added `"Comments": "SecondDoor"`
- Assigned `Terrain_05` to the `GroupNames` array.

Also:
- Change the `GroupNames` for `508013` to `Terrain_04` (Rightmost TartarusGhostHandsMulti in the pit).
- Change the `GroupNames` for `410695` to `Terrain_01` (TartarusGhostHandsMulti under the light to the right of the fishing pier).

Additionally, the new `Terrain_04` and `Terrain_05` groups must be added to the `RoomOpening.map_text` file, in the correct positions:

```text
...
{
	"Id": 310001,
	"Name": "Terrain_Decor_01"
},
{
	"Id": 310009,
	"Name": "Terrain_05"
},
{
	"Id": 310008,
	"Name": "Terrain_04"
},
{
	"Id": 310007,
	"Name": "Terrain_03"
},
...
```

The above makes sure that `Terrain_04` is rendered above `Terrain_03` and below `Terrain_Decor_01`, and the same for `Terrain_05`.

```text
...
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 310007,
		"Name": "Terrain_03"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 410019,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 310008,
		"Name": "Terrain_04"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 410019,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 310009,
		"Name": "Terrain_05"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 410019,
		"Name": "MapArt"
	},
	"Visible": true
},
...
```

#### Return06

In this map, we need to change the name for the Persephone NPC, as it is used in both Hades and Hades II.

For ID `553381`, change the `Name` property from `NPC_Persephone_01` to `ModsNikkelMHadesBiomes_NPC_Persephone_01`.

Additionally, the same as for `RoomOpening` applies here:
In the `Return06.thing_bin` file (decompiled), there are two `TartarusCubeBrick03` objects (ID `210004` and `210099`).
The parent of `210004` is ID `410061` (has `210004` as an `AttachedId`).
These are the first and second tiles after the door (where the player starts) in the room.
These two tiles have some bugged z-buffer location, which requires some manual changes from the Hades file to work nicely with Hades II.

The changes that need to be made are as follows:

To ID `210004`:

- Added `"Comments": "FirstDoor"`
- Assigned `Terrain_04` to the `GroupNames` array.

To ID `210099`:

- Added `"Comments": "SecondDoor"`
- Assigned `Terrain_05` to the `GroupNames` array.

Additionally, the new `Terrain_04` and `Terrain_05` groups must be added to the `Return06.map_text` file, in the correct positions:

```text
...
{
	"Id": 310001,
	"Name": "Terrain_Decor_01"
},
{
	"Id": 310009,
	"Name": "Terrain_05"
},
{
	"Id": 310008,
	"Name": "Terrain_04"
},
{
	"Id": 310007,
	"Name": "Terrain_03"
},
...
```

The above makes sure that `Terrain_04` is rendered above `Terrain_03` and below `Terrain_Decor_01`, and the same for `Terrain_05`.

```text
...
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 310007,
		"Name": "Terrain_03"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 410019,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 310008,
		"Name": "Terrain_04"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 410019,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 310009,
		"Name": "Terrain_05"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 410019,
		"Name": "MapArt"
	},
	"Visible": true
},
...
```

#### A_Story01

In this map, we need to change the name for the Bouldy NPC, as it is used in both Hades and Hades II.

For ID `506340`, change the `Name` property from `NPC_Bouldy_01` to `ModsNikkelMHadesBiomes_NPC_Bouldy_01`.

#### X_PreBoss01

546475
	Catacomb (where?)
	Changed to Standing00
	546711
		Skeleton attached to 546475
		Changed to Standing02
	546710
		Skeleton attached to 546475
		Changed to Standing03

546757
	Middle Pillar base (square brick)
	Changed to Standing02
546758
	Middle pillar
	GroupName to Standing03
546759
	Pillartop
	GroupName to Standing04

546557
	Leftmost bottom brick
	Attached IDs are another catacomb and a pillar base
	546801
		Catacomb to the left
		Changed to Standing07
	546798
		Pillar base to the left
		Changed to Standing05
	546797
		Pillar on 546798 on catacomb
		Changed to Standing06
	546796
		Arch on pillar
		Changed to Standing07

546474
	Rightmost catacomb
	Changed to Standing000
	546712 
		Skeleton on top of catacomb
		Changed to Standing03
	546713
		Skeleton on top of catacomb
		Changed to Standing02

546393
	Rightmost pillarbase
	Changed to Stairs_01
	547744
		Hydra head on top of pillarbase
		Changed to Standing02

546558
	Catacomb left of middle pillar
	Changed to Standing03
		546716
			Skeleton on top of catacomb
			Changed to Standing04
		546717
			Skeleton on top of catacomb
			Changed to Standing05

546559
	Catacomb right of left pillar
	Changed to Standing04
	546718
		Skeleton on top of catacomb
		Changed to Standing05
	546719
		Skeleton on top of catacomb
		Changed to Standing06

New map_text groups:

```
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 130011,
		"Name": "Standing000"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 130018,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 130012,
		"Name": "Standing00"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 130018,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 130013,
		"Name": "Standing"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 130018,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 130014,
		"Name": "Standing02"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 130018,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 130015,
		"Name": "Standing03"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 130018,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 130016,
		"Name": "Standing04"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 130018,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 130017,
		"Name": "Standing05"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 130018,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 130018,
		"Name": "Standing06"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 130018,
		"Name": "MapArt"
	},
	"Visible": true
},
{
	"BlendMode": 0,
	"ChildGroups": [],
	"Id": {
		"Id": 130019,
		"Name": "Standing07"
	},
	"NumSelectedAsDraw": 0,
	"NumSelectedAsLogic": 0,
	"NumThings": 0,
	"NumThingsFrozen": 0,
	"NumThingsSelectable": 0,
	"NumThingsVisible": 0,
	"ParentGroup": {
		"Id": 130018,
		"Name": "MapArt"
	},
	"Visible": true
},
```

```
{
	"Id": 130019,
	"Name": "Standing07"
},
{
	"Id": 130018,
	"Name": "Standing06"
},
{
	"Id": 130017,
	"Name": "Standing05"
},
{
	"Id": 130016,
	"Name": "Standing04"
},
{
	"Id": 130015,
	"Name": "Standing03"
},
{
	"Id": 130014,
	"Name": "Standing02"
},
{
	"Id": 130013,
	"Name": "Standing"
},
{
	"Id": 130012,
	"Name": "Standing00"
},
{
	"Id": 130011,
	"Name": "Standing000"
},
```

#### Y_Combat01

Remove the `Fx_Terrain` group from the `map_text` files, as it causes layering issues with the Cast, and some enemy Fx (like Chariot tracks).

#### D_Hub

In this map, we need to change the name for the Cerberus NPC, as it is used in both Hades and Hades II.

For ID `547487`, change the `Name` property from `NPC_Cerberus_Field_01` to `ModsNikkelMHadesBiomes_NPC_Cerberus_Field_01`.

#### D_MiniBoss03

In this map, we need to change the name for the CrawlerMiniboss, as it is used in both Hades and Hades II.

For ID `552394`, change the `Name` property from `CrawlerMiniBoss` to `HadesCrawlerMiniBoss`.

#### E_Story01

In this map, we need to change the name for the Persephone NPC, as it is used in both Hades and Hades II.

For ID `559274`, change the `Name` property from `NPC_Persephone_01` to `ModsNikkelMHadesBiomes_NPC_Persephone_01`.

#### Return01

In this map, we need to change the name for the Persephone NPC, as it is used in both Hades and Hades II.

For ID `552885`, change the `Name` property from `NPC_Persephone_01` to `ModsNikkelMHadesBiomes_NPC_Persephone_01`.

#### Return02

In this map, we need to change the name for the Persephone NPC, as it is used in both Hades and Hades II.

For ID `553261`, change the `Name` property from `NPC_Persephone_01` to `ModsNikkelMHadesBiomes_NPC_Persephone_01`.

#### Return03

In this map, we need to change the name for the Persephone NPC, as it is used in both Hades and Hades II.

For ID `553268`, change the `Name` property from `NPC_Persephone_01` to `ModsNikkelMHadesBiomes_NPC_Persephone_01`.

#### Return04

In this map, we need to change the name for the Persephone NPC, as it is used in both Hades and Hades II.

For ID `561150`, change the `Name` property from `NPC_Persephone_01` to `ModsNikkelMHadesBiomes_NPC_Persephone_01`.

#### Return05

In this map, we need to change the name for the Persephone NPC, as it is used in both Hades and Hades II.

For ID `553264`, change the `Name` property from `NPC_Persephone_01` to `ModsNikkelMHadesBiomes_NPC_Persephone_01`.

## Map packages

In Hades, `.pkg` files are in `Content/Win/Packages`, and in Hades II they are in `Content/Packages/<resolution>`.
As some biome names are re-used (such as Tartarus), we append `ModsNikkelMHadesBiomes` to the biome name in `MapGroups.sjson` and the `.pkg` files.
The resulting `.pkg` files must be copied from Hades to Hades II, so that all relevant effects and obstacles can exist.

### Unpacking `.pkg` files

You can use `deppth` to unpack `.pkg` files.
The tool can be found [here](https://github.com/quaerus/deppth).
This is useful to check texture paths used for animations and effects.

```bash
deppth ex <PackageName>.pkg
```

## Adding Hades enemies

To add a Hades enemy type to Hades II, follow these steps.
Take care! Some enemy names are used in both games, such as "Swarmer" and "LightRanged" - these should be renamed to avoid duplications.
These renamings must be done everywhere, including encounters.
See the [Duplicate enemy names](#duplicate-enemy-names) section for more information.

1. In `EnemyProjectiles.sjson.lua`, modify the `Effects` property table as follows, to migrate it to the Hades II format:
   - If the effect defines a `StartAnimation` property, set it to `"null"`. It's possible this guidance changes in the future if these effects can be migrated.
   - Also refer to the [EnemyProjectiles.sjson](#enemyprojectilessjson) section for more information on this file.
2. Ensure the enemy inherits from `1_BaseEnemy` in `Enemies.sjson.lua`.
   - Add the enemy name to the `InheritFrom` property in the modifications table. This ensures hits by the player are registered with the enemy.
   - If the enemy already inherits from another enemy, you can instead add the `InheritFrom` property to the parent enemy type. Note that this approach (inheriting only for the parent class) does not work for all files, such as the `EnemyDataHandler.lua`.
   - Also refer to the [Enemies.sjson](#enemiessjson) section for more information on this file.
3. Enable the enemy in `EnemySets.lua` to have it appear in game.
4. For some enemies, animation data is stored in a separate `CharacterAnim_...` type file - ensure this is added to the `SjsonFileMappings` table in `RequiredFileData.lua` if needed.
5. Ensure that the various animations for the enemy are copied, e.g. `PreAttackAnimation` etc. This will often indicate if the enemy may be binked.

The following steps apply to binked enemies only.
If an enemy is binked, it might have a `Binks` property in `EnemyData.lua`.

1. In `EnemyData.lua`, add the appropriate stun animation to the `StunAnimations` table in the modifications.
   - You can find the stun animation by looking for the `OnStunAnimation` property for the enemy (or it's parent) in `Enemies.sjson` in Hades.
   - The value of this property is the name of the animation to use for the `Default` property in the `StunAnimations` table.
   - Even if the enemy is a child of another enemy type, you need to add the `StunAnimations` property to the child directly, as the inheritence here does not seem to work correctly.
   - If the enemy has different animations for it's Heavy etc. variants, you can add these to the `StunAnimations` table as well - this has not been tested yet.
2. Add the `.bik` files for the new enemy to the `BikFileNames` table in `RequiredFileData.lua`, make sure to copy both the 1080p and 720p version.

The following steps apply to non-binked enemies only.
An example enemy is `HeavyRanged`.

1. In `EnemyData.lua`, add a `DeathAnimation` and/or `DeathFx` property. This should be the `DeathGraphic` of the enemy in `Enemies.sjson` in Hades. Also adjust the `DestroyDelay`, which by default is 2 seconds, to fit the `DeathAnimation`.

### Duplicate enemy names

Some enemy names exist in both Hades and Hades II, such as "Swarmer" and "LightRanged".
To avoid conflicts (i.e., the Hades II enemy appearing in a Hades run), we need to rename these enemies.
This needs to be done in a lot of places:

- In `NameMappingData.lua`, add the old and new enemy name to the `mod.EnemyNameMappings` table.
  - This will rename the key in a couple of places: The Helptext files during installation, in `EnemyDataHandler.lua`, `EnemySets.lua`

## Voiceovers

> The basics for this guidance were adapted from [HadesAudioHelper](https://github.com/AlexKage69/HadesAudioHelper).

Voiceovers in Hades II are stored in a separate `SpeakerName.fsb` file with a corresponding `SpeakerName.txt` file.
All events (`.ogg` files) in the Voiceover `.fsb` file **MUST** start with `SpeakerName_`, otherwise they will not be played in game.

> [!IMPORTANT]
> Not all speaker names work. E.g. `MegaeraHome` causes the VO to not be loaded, while the same files (renamed) in `Megaera` do get loaded.
> This might be due to either the original name being reserved/already used in the engine, or e.g. the pattern (`Home`) not being loaded in the given context.

In Hades, all voicelines are in a single `VO.fsb` file.
These can be extracted using Python-fsb5.

Each Speaker should then get it's own voicebank in a new FMOD project, with the event names corresponding to the bank name.
After building the project, use FMOD Bank Tools to extract the `.fsb` and `.txt` files. for each bank.
Make sure to use a script to translate the `.txt` files to the Hades II format:

```bash
# Bank name that is being looked at
$bankName = "MegaeraField"
# These paths work for my project setup, adjust if needed
$inputFile = ".\Fmod Bank Tools\wav\$bankName\$bankName.txt"
$outputFile = ".\..\..\data\Content\Audio\Desktop\VO\$bankName.txt"

$content = Get-Content $inputFile
$lineCount = $content.Length

# Add the header lines with the bankName
$header = @("#ifndef _${bankName}_H", "#define _${bankName}_H", "")

# Add line numbers to the specified range
for ($i = 0; $i -lt $lineCount; $i++) {
	$line = $content[$i] -replace '\.wav', ''
  $content[$i] = "#define $line $i"
}

# Combine the header, the modified content, and the footer
$footer = @("", "#endif")
$finalContent = $header + $content + $footer

# Write the final content to the output file
$finalContent | Set-Content $outputFile
```

The `.txt` files will already be placed in the mod's data folder by the above script, make sure to also copy the `.fsb` files.
Also, add all of the speakers to `VoiceoverFileNames` in `RequiredFileData.lua`.
