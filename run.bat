@echo off
REM This is the folder in which your CoD4 Mod Tools are installed into
set GAMEFOLDER="F:\Program Files (x86)\Activision\Call of Duty 4 - Modern Warfare"
set SOURCEFOLDER=%CD%

xcopy %SOURCEFOLDER%\COMPILED\mod.ff %GAMEFOLDER%\Mods\baserace /SQY

cd /D %GAMEFOLDER%
iw3mp.exe +set fs_game mods/baserace +set developer 1 +set developer_script 1 +set sv_punkbuster 0 +set g_gametype dm +set r_mode 1280x720 +set r_fullscreen 0 +devmap mp_baserace