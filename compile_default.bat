@echo off
REM This is the folder in which your CoD4 Mod Tools are installed into
set MODFOLDER="C:\Program Files (x86)\Activision\Call of Duty 4 - Modern Warfare"

REM ################################################
REM EVERYTHING BELOW THIS LINE SHOULD NOT BE EDITED!
REM ################################################

set SOURCEFOLDER=%CD%

echo ...................
echo Compiling baserace mod
echo ...................

cd /D %MODFOLDER%\bin

linker_pc.exe -language english -compress -cleanup mod

xcopy %MODFOLDER%\zone\english\mod.ff %SOURCEFOLDER%\COMPILED /SQY

pause