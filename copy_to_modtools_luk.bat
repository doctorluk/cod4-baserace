@echo off
REM This is the folder in which your CoD4 Mod Tools are installed into
set CODFOLDER="F:\Program Files (x86)\Activision\Call of Duty 4 - Modding"
set SOURCEFOLDER=%CD%

echo ...................
echo Copying files to your Modtools Directory
echo ...................

xcopy %SOURCEFOLDER%\animtrees %CODFOLDER%\raw\animtrees /SQY
xcopy %SOURCEFOLDER%\english %CODFOLDER%\raw\english /SQY
xcopy %SOURCEFOLDER%\fx %CODFOLDER%\raw\fx /SQY
xcopy %SOURCEFOLDER%\images %CODFOLDER%\raw\images /SQY
xcopy %SOURCEFOLDER%\maps %CODFOLDER%\raw\maps /SQY
xcopy %SOURCEFOLDER%\material_properties %CODFOLDER%\raw\material_properties /SQY
xcopy %SOURCEFOLDER%\materials %CODFOLDER%\raw\materials /SQY
xcopy %SOURCEFOLDER%\mp %CODFOLDER%\raw\mp /SQY
xcopy %SOURCEFOLDER%\scripts %CODFOLDER%\raw\scripts /SQY
xcopy %SOURCEFOLDER%\shock %CODFOLDER%\raw\shock /SQY
xcopy %SOURCEFOLDER%\sound %CODFOLDER%\raw\sound /SQY
xcopy %SOURCEFOLDER%\soundaliases %CODFOLDER%\raw\soundaliases /SQY
xcopy %SOURCEFOLDER%\ui %CODFOLDER%\raw\ui /SQY
xcopy %SOURCEFOLDER%\vision %CODFOLDER%\raw\vision /SQY
xcopy %SOURCEFOLDER%\weapons %CODFOLDER%\raw\weapons /SQY
xcopy %SOURCEFOLDER%\xanim %CODFOLDER%\raw\xanim /SQY
xcopy %SOURCEFOLDER%\xmodel %CODFOLDER%\raw\xmodel /SQY
xcopy %SOURCEFOLDER%\xmodelparts %CODFOLDER%\raw\xmodelparts /SQY
xcopy %SOURCEFOLDER%\xmodelsurfs %CODFOLDER%\raw\xmodelsurfs /SQY

xcopy %SOURCEFOLDER%\mod.csv %CODFOLDER%\zone_source /SQY