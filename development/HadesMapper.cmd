@echo off
setlocal

rem This script is used to decode and encode the Hades map files using the HadesMapper tool
rem Define paths
rem Laptop
@REM set HADES_MAPPER=C:\Users\nikke\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.11_qbz5n2kfra8p0\LocalCache\local-packages\Python311\Scripts\HadesMapper
@REM set HADES_CONTENT=C:\Program Files (x86)\Steam\steamapps\common\Hades\Content\Win\Maps
@REM set OUTPUT_DIR=C:\Users\nikke\OneDrive\Privat\Projects\Hades-II-HadesBiomes\data\Content\Maps\bin

rem Desktop
set DECOMPILE_OUTPUT=C:\Users\nikke\Downloads
set HADES_MAPPER=C:\Users\nikke\AppData\Local\Programs\Python\Python39\Scripts\HadesMapper
set HADES_CONTENT=D:\Program Files (x86)\Steam\steamapps\common\Hades\Content\Win\Maps
set HADES_TWO_CONTENT=D:\Program Files (x86)\Steam\steamapps\common\Hades II\Content\Maps\bin
set OUTPUT_DIR_MOD=F:\Users\nikke\OneDrive\Privat\Projects\Hades-II-HadesBiomes\data\Content\Maps\bin
set OUTPUT_DIR_PLUGINS=C:\Users\nikke\AppData\Roaming\r2modmanPlus-local\HadesII\profiles\Default\ReturnOfModding\plugins_data\NikkelM-Hades_Biomes\Content\Maps\bin

rem Define the list of files to process  separated by spaces
set FILES=RoomOpening

rem Loop through each file and process it
(for %%f in (%FILES%) do (
    echo Processing file: %%f

    rem Decode the file
    %HADES_MAPPER% dc -i "%HADES_CONTENT%\%%f" -o "%DECOMPILE_OUTPUT%\%%f_DECOMPILED"

    rem Decode the file (from Hades II)
    @REM %HADES_MAPPER% dc -s -i "%HADES_TWO_CONTENT%\%%f" -o "%DECOMPILE_OUTPUT%\%%f_DECOMPILED"
    
    rem Encode the file in the output directories
    %HADES_MAPPER% ec -s -i "%DECOMPILE_OUTPUT%\%%f_DECOMPILED" -o "%OUTPUT_DIR_MOD%\%%f"
    @REM %HADES_MAPPER% ec -s -i "%DECOMPILE_OUTPUT%\%%f_DECOMPILED" -o "%OUTPUT_DIR_PLUGINS%\%%f"
    @REM %HADES_MAPPER% ec -s -i "%DECOMPILE_OUTPUT%\%%f_DECOMPILED" -o "%HADES_TWO_CONTENT%\%%f"
    
    rem Remove the intermediate file
    del "%DECOMPILE_OUTPUT%\%%f_DECOMPILED.thing_text"
))

echo Finished processing files.
endlocal