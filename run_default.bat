@echo off
REM This is the folder in which your WORKING Call of Duty 4 game is installed into
set GAMEFOLDER="C:\Program Files (x86)\Activision\Call of Duty 4 - Modern Warfare"

REM ################################################
REM EVERYTHING BELOW THIS LINE SHOULD NOT BE EDITED!
REM ################################################

set SOURCEFOLDER=%CD%

IF NOT EXIST %SOURCEFOLDER%\COMPILED\mod.ff (
	echo ERROR: mod.ff is not existant in your COMPILED folder! Run compile_xxx.bat first!
	pause
	exit
)

IF NOT EXIST %GAMEFOLDER%\Mods\baserace (
	echo Mods/baserace folder is missing, creating!
	mkdir %GAMEFOLDER%\Mods\baserace
)	

xcopy %SOURCEFOLDER%\COMPILED\mod.ff %GAMEFOLDER%\Mods\baserace /SQY >nul 2>&1
echo Copied mod.ff to baserace mod folder
cd /D %GAMEFOLDER%

TASKLIST /FI "imagename eq iw3mp.exe" |find ":" > nul
if errorlevel 1 (
	echo Found existing iw3mp.exe process, killing it to re-initialize CoD4
	TASKKILL /im "iw3mp.exe" >nul 2>&1
	TIMEOUT /T 1 /NOBREAK >nul 2>&1
)
echo Starting up CoD4
REM ################################################
REM Feel free to modify the command line below
REM ################################################

iw3mp.exe +set fs_game mods/baserace +set developer 1 +set developer_script 1 +set sv_punkbuster 0 +set g_gametype dm +set r_mode 1280x720 +set r_fullscreen 0 +devmap mp_baserace