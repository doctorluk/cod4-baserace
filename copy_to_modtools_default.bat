@echo off
REM This is the folder in which your CoD4 Mod Tools are installed into
set MODFOLDER="C:\Program Files (x86)\Activision\Call of Duty 4 - Modern Warfare"

REM ################################################
REM EVERYTHING BELOW THIS LINE SHOULD NOT BE EDITED!
REM ################################################

set SOURCEFOLDER=%CD%

echo ...................
echo Copying files to your Modtools Directory
echo ...................

robocopy /? >nul 2>&1
if %ERRORLEVEL% neq 9009 ( goto robocopy ) ELSE ( goto xcopy )

:robocopy
echo Using robocopy to copy more quickly!
robocopy %SOURCEFOLDER%\animtrees %MODFOLDER%\raw\animtrees /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\english %MODFOLDER%\raw\english /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\fx %MODFOLDER%\raw\fx /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\images %MODFOLDER%\raw\images /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\maps %MODFOLDER%\raw\maps /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\material_properties %MODFOLDER%\raw\material_properties /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\materials %MODFOLDER%\raw\materials /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\mp %MODFOLDER%\raw\mp /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\scripts %MODFOLDER%\raw\scripts /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\shock %MODFOLDER%\raw\shock /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\sound %MODFOLDER%\raw\sound /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\soundaliases %MODFOLDER%\raw\soundaliases /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\ui %MODFOLDER%\raw\ui /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\vision %MODFOLDER%\raw\vision /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\weapons %MODFOLDER%\raw\weapons /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\xanim %MODFOLDER%\raw\xanim /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\xmodel %MODFOLDER%\raw\xmodel /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\xmodelparts %MODFOLDER%\raw\xmodelparts /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER%\xmodelsurfs %MODFOLDER%\raw\xmodelsurfs /E /NS /NC /NFL /NDL /NJH /NJS
robocopy %SOURCEFOLDER% %MODFOLDER%\zone_source mod.csv /E /NS /NC /NFL /NDL /NJH /NJS
echo Done!
timeout /T 2 /NOBREAK >nul 2>&1
exit

:xcopy
echo Command 'robocopy' not found, using xcopy as fallback
xcopy %SOURCEFOLDER%\animtrees %MODFOLDER%\raw\animtrees /SQY
xcopy %SOURCEFOLDER%\english %MODFOLDER%\raw\english /SQY
xcopy %SOURCEFOLDER%\fx %MODFOLDER%\raw\fx /SQY
xcopy %SOURCEFOLDER%\images %MODFOLDER%\raw\images /SQY
xcopy %SOURCEFOLDER%\maps %MODFOLDER%\raw\maps /SQY
xcopy %SOURCEFOLDER%\material_properties %MODFOLDER%\raw\material_properties /SQY
xcopy %SOURCEFOLDER%\materials %MODFOLDER%\raw\materials /SQY
xcopy %SOURCEFOLDER%\mp %MODFOLDER%\raw\mp /SQY
xcopy %SOURCEFOLDER%\scripts %MODFOLDER%\raw\scripts /SQY
xcopy %SOURCEFOLDER%\shock %MODFOLDER%\raw\shock /SQY
xcopy %SOURCEFOLDER%\sound %MODFOLDER%\raw\sound /SQY
xcopy %SOURCEFOLDER%\soundaliases %MODFOLDER%\raw\soundaliases /SQY
xcopy %SOURCEFOLDER%\ui %MODFOLDER%\raw\ui /SQY
xcopy %SOURCEFOLDER%\vision %MODFOLDER%\raw\vision /SQY
xcopy %SOURCEFOLDER%\weapons %MODFOLDER%\raw\weapons /SQY
xcopy %SOURCEFOLDER%\xanim %MODFOLDER%\raw\xanim /SQY
xcopy %SOURCEFOLDER%\xmodel %MODFOLDER%\raw\xmodel /SQY
xcopy %SOURCEFOLDER%\xmodelparts %MODFOLDER%\raw\xmodelparts /SQY
xcopy %SOURCEFOLDER%\xmodelsurfs %MODFOLDER%\raw\xmodelsurfs /SQY
xcopy %SOURCEFOLDER%\mod.csv %MODFOLDER%\zone_source /SQY
echo Done!
timeout /T 2 /NOBREAK >nul 2>&1
exit