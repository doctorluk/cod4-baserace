@echo off
7za.exe a -r -tzip sound.iwd sound
timeout /T 1 /NOBREAK >nul 2>&1
exit