@echo off
REM This is the folder in which your WORKING Call of Duty 4 game is installed into
set GAMEFOLDER="C:\Program Files (x86)\Activision\Call of Duty 4 - Modern Warfare"

REM ################################################
REM EVERYTHING BELOW THIS LINE SHOULD NOT BE EDITED!
REM ################################################

set SOURCEFOLDER=%CD%

xcopy %SOURCEFOLDER%\COMPILED\mod.ff %GAMEFOLDER%\Mods\baserace /SQY

cd /D %GAMEFOLDER%

REM ################################################
REM Feel free to modify the command line below
REM ################################################

iw3mp.exe +set fs_game mods/baserace +set developer 1 +set developer_script 1 +set sv_punkbuster 0 +set g_gametype dm +set r_mode 1280x720 +set r_fullscreen 0 +devmap mp_baserace