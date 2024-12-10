# Knowledge about how to add Hades biomes/maps to Hades II

## RoomData lua files

Biome data is stored in `RoomData<Biome>.lua` files in Hades under `Scripts`.

The general format is similar, the section below details key-value pairs that need replacement.

At the bottom of the Hades files we have the following:

```lua
OverwriteTableKeys( RoomData, RoomSetData.Tartarus )
```

For Hades II, this should use the following format:

```lua
AddTableKeysCheckDupes( RoomData, RoomSetData.Tartarus )
```

### Key-Value replacements for RoomData files

TODO
