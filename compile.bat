@echo off
REM This is the folder in which your CoD4 Mod Tools are installed into
set CODFOLDER="F:\Program Files (x86)\Activision\Call of Duty 4 - Modding"
set SOURCEFOLDER=%CD%

echo ...................
echo Compiling baserace mod
echo ...................

cd /D %CODFOLDER%\bin

linker_pc.exe -language english -compress -cleanup mod

xcopy %CODFOLDER%\zone\english\mod.ff %SOURCEFOLDER%\COMPILED /SQY

pause